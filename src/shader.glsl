#version 450

uniform vec2 size;
uniform int playfield[12*18];
out vec3 color;
vec2 uv=gl_FragCoord.xy/vec2(620)-vec2(.5,.3);

// #define SCREEN_WIDTH 620
// #define SCREEN_HEIGHT 960


vec3 colors[10]=
{
      vec3(0), //black
      vec3(1,0,0), //red
      vec3(0,1,0), //green
      vec3(0,0,1), //blue
      vec3(0,1,1), //cyan
      vec3(1,1,0), //yellow
      vec3(1,0,1), //purple
      vec3(1.,.5,0), //orange
      vec3(1), //white
      vec3(.5) //grey
};

struct RR
{
      vec3 RC;
      vec3 RP;
      bool RH;
};

vec4 sdRoundBox( vec3 p, vec3 b, float r, vec3 color)
{
  vec3 q = abs(p) - b;
  return vec4(color,length(max(q,0.0)) + min(max(q.x,max(q.y,q.z)),0.0) - r);
}

vec4 map(vec3 p)
{
      vec2 aidx=floor(p.xy/.25)+6;
      aidx.y=-aidx.y+20;
      int idx=playfield[int(aidx.y*12+aidx.x)];
      p.xy=mod(p.xy,.25)-.125;
      vec3 col;
      
      if(aidx.x<0||aidx.y<0||aidx.x>11||aidx.y>17)
            col=vec3(0);
      else
            col=colors[idx];
      return sdRoundBox(p,vec3(.1,.1,.01),.025,vec3(col));
}

RR march(vec3 ro, vec3 rd, float maxl, float aprox)
{
      rd=normalize(rd);
      RR res;
      res.RP=ro;
      res.RH=false;
      vec4 d;
      for(float l=0; l<maxl;)
      {
            d=map(res.RP);
            if(d.w<aprox)
            {
                  res.RH=true;
                  res.RC=d.xyz;
                  break;
            }
            res.RP+=rd*d.w;
            l+=d.w;
      }
      return res;
}

float lightRender(vec3 n,vec3 l, vec3 v, float strength)
{
      l=normalize(l);
      return ((dot(n,l)*.5+.5)+pow(max(dot(v,reflect(l,n)),0),4)*.25)*strength;
}

void main()
{
      vec3 ro=vec3(0,0,-3.2);
      vec3 rd=vec3(uv,1);
      RR r=march(ro,rd,6,.0001);
      color=r.RC;

      vec2 eps=vec2(.005,0.);
      vec3 n=normalize(vec3(map(r.RP+eps.xyy).w-map(r.RP-eps.xyy).w,
                            map(r.RP+eps.yxy).w-map(r.RP-eps.yxy).w,
                            map(r.RP+eps.yyx).w-map(r.RP-eps.yyx).w));


      color*=lightRender(n,r.RP-vec3(-10,-120,1),rd,1.);
}