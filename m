From: Vikas Sajjan <vikas.sajjan-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 3/3] ARM: dts: Add display timing node to
 exynos5250-arndale.dts
Date: Tue, 14 May 2013 18:40:00 +0530
Message-ID: <CAD025yRyUY4GbFt-Soasj1QBsY4V1=qJZaG4Ww=FrT9UutNRfA@mail.gmail.com>
References: <1367992894-20198-1-git-send-email-vikas.sajjan@linaro.org>
 <CAD025yQ+vnNc1RqoqoBw9JqYUp6aAY2wTowhVyV+zoDZq9sJ6g@mail.gmail.com>
 <CAD025ySx39kOphk3BNrnM+i7-9KHQr607cRYZXKa7uJ6GBXSiA@mail.gmail.com>
 <1853757.ubr759t9No@flatron>
 <CAD025ySqUpGRpx0J61gsjKE_JPa+Mu444ETpd2USyikrNWj71w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1849063144933760187=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <CAD025ySqUpGRpx0J61gsjKE_JPa+Mu444ETpd2USyikrNWj71w-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Tomasz Figa <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
Cc: "linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, InKi Dae <inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, "kgene.kim" <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

--===============1849063144933760187==
Content-Type: multipart/alternative; boundary=047d7b343c66f586da04dcad5ae8

--047d7b343c66f586da04dcad5ae8
Content-Type: text/plain; charset=ISO-8859-1

Hi Steffen Trumtrar and Sascha Hauer,

Olof and Tomasz Figa have a concern in putting "display-timings"  as root
node in device tree file.


On 10 May 2013 13:45, Vikas Sajjan <vikas.sajjan-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:

> HI Tomasz,
>
>
> On 10 May 2013 13:03, Tomasz Figa <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>
>> On Friday 10 of May 2013 11:57:34 Vikas Sajjan wrote:
>> > Hi Olof,
>> >
>> > On 10 May 2013 11:51, Vikas Sajjan <vikas.sajjan-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
>> > > Hi Olof,
>> > >
>> > > On 10 May 2013 11:08, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org> wrote:
>> > >> On Thu, May 9, 2013 at 7:55 PM, Vikas Sajjan
>> > >> <vikas.sajjan-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>> > >>
>> > >> wrote:
>> > >> > Hi Tomasz,
>> > >> >
>> > >> > On 10 May 2013 05:35, Tomasz Figa <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>> > >> >> Hi Vikas,
>> > >> >>
>> > >> >> On Wednesday 08 of May 2013 11:31:34 Vikas Sajjan wrote:
>> > >> >> > Adds display timing node for a DP panel to Arndale Board DTS
>> > >> >> > file
>> > >> >> >
>> > >> >> > Signed-off-by: Vikas Sajjan <vikas.sajjan-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>> > >> >> > ---
>> > >> >> >
>> > >> >> >  arch/arm/boot/dts/exynos5250-arndale.dts |   16
>> > >> >> >  ++++++++++++++++
>> > >> >> >  1 file changed, 16 insertions(+)
>> > >> >> >
>> > >> >> > diff --git a/arch/arm/boot/dts/exynos5250-arndale.dts
>> > >> >> > b/arch/arm/boot/dts/exynos5250-arndale.dts index
>> > >> >> > f68b820..c831a5c
>> > >> >> > 100644
>> > >> >> > --- a/arch/arm/boot/dts/exynos5250-arndale.dts
>> > >> >> > +++ b/arch/arm/boot/dts/exynos5250-arndale.dts
>> > >> >> > @@ -459,4 +459,20 @@
>> > >> >> >
>> > >> >> >               samsung,lane-count = <4>;
>> > >> >> >
>> > >> >> >       };
>> > >> >> >
>> > >> >> > +     display-timings {
>> > >> >> > +             native-mode = <&timing0>;
>> > >> >> > +             timing0: timing@0 {
>> > >> >> > +                     /* 2560x1600 DP panel */
>> > >> >> > +                     clock-frequency = <50000>;
>> > >> >> > +                     hactive = <2560>;
>> > >> >> > +                     vactive = <1600>;
>> > >> >> > +                     hfront-porch = <48>;
>> > >> >> > +                     hback-porch = <80>;
>> > >> >> > +                     hsync-len = <32>;
>> > >> >> > +                     vback-porch = <16>;
>> > >> >> > +                     vfront-porch = <8>;
>> > >> >> > +                     vsync-len = <6>;
>> > >> >> > +             };
>> > >> >> > +     };
>> > >> >>
>> > >> >> What display are those timings used for? Shouldn't they be placed
>> > >>
>> > >> inside
>> > >>
>> > >> >> node of that display?
>> > >> >
>> > >> > This timing information will be used parsed by the FIMD probe with
>> > >> > the
>> > >>
>> > >> help
>> > >>
>> > >> > of "Video Helper function"  as done in this link
>> > >>
>> > >>
>> https://git.kernel.org/cgit/linux/kernel/git/daeinki/drm-exynos.git/c
>> > >> ommit/?h=exynos-drm-next&id=7f4596f4aebcc9fcf2d50d3fe398508d710c4dd0
>> > >>
>> > >> That function passes in a device node pointer to the FIMD device
>> > >> node,
>> > >> and only looks for a display-timings node under there. Tomasz is
>> > >> right, as far as I can tell.
>> > >>
>> > >> Placing display timings at the root of the device tree seems
>> > >> completely
>> > >> wrong.
>> > >>
>> > >>         I referred this "
>> >
>> > Documentation/devicetree/bindings/video/display-timing.txt" for example
>> >
>> >             here it dosen't mention about whether display timings node
>> > can be placed at the root of the device tree or NOT.
>> >  Not sure how we should be placing the node then.
>>
>> I think this is pretty obvious.
>>
>> Imagine a bit more complex case: a board has two video outputs (let's say
>> FIMD0 and FIMD1), each connected to a completely different display. This
>> means that each display needs different timings.
>>
>> How would you know which timings to use if all of them were be placed
>> under the root node?
>>
>>     so what do you think, how  should we modify this patch so that it
> belongs to a specific video outputs.
>
>

  So what do you think, how should we modify this patch so that it belongs
to a specific video outputs.




>  Best regards,
>> Tomasz
>>
>>
>
>
> --
> Thanks and Regards
>  Vikas Sajjan
>



-- 
Thanks and Regards
 Vikas Sajjan

--047d7b343c66f586da04dcad5ae8
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Steffen Trumtrar and Sascha Hauer,<br><br></div>Ol=
of and Tomasz Figa have a concern in putting &quot;display-timings&quot;=A0=
 as root node in device tree file.<br><div class=3D"gmail_extra"><br><br><d=
iv class=3D"gmail_quote">

On 10 May 2013 13:45, Vikas Sajjan <span dir=3D"ltr">&lt;<a href=3D"mailto:=
vikas.sajjan-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" target=3D"_blank">vikas.sajjan-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org</a>&gt;<=
/span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">

<div dir=3D"ltr">HI Tomasz,<br><div class=3D"gmail_extra"><br><br><div clas=
s=3D"gmail_quote"><div><div class=3D"h5">On 10 May 2013 13:03, Tomasz Figa =
<span dir=3D"ltr">&lt;<a href=3D"mailto:tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" target=3D"_b=
lank">tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org</a>&gt;</span> wrote:<br>


<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex"><div><div>On Friday 10 of=
 May 2013 11:57:34 Vikas Sajjan wrote:<br>
&gt; Hi Olof,<br>
&gt;<br>
&gt; On 10 May 2013 11:51, Vikas Sajjan &lt;<a href=3D"mailto:vikas.sajjan@=
linaro.org" target=3D"_blank">vikas.sajjan-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org</a>&gt; wrote:<br>
&gt; &gt; Hi Olof,<br>
&gt; &gt;<br>
&gt; &gt; On 10 May 2013 11:08, Olof Johansson &lt;<a href=3D"mailto:olof@l=
ixom.net" target=3D"_blank">olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org</a>&gt; wrote:<br>
&gt; &gt;&gt; On Thu, May 9, 2013 at 7:55 PM, Vikas Sajjan<br>
&gt; &gt;&gt; &lt;<a href=3D"mailto:vikas.sajjan-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" target=3D"_bla=
nk">vikas.sajjan-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org</a>&gt;<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; wrote:<br>
&gt; &gt;&gt; &gt; Hi Tomasz,<br>
&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt; On 10 May 2013 05:35, Tomasz Figa &lt;<a href=3D"mailto:=
tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" target=3D"_blank">tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org</a>&gt; wrot=
e:<br>
&gt; &gt;&gt; &gt;&gt; Hi Vikas,<br>
&gt; &gt;&gt; &gt;&gt;<br>
&gt; &gt;&gt; &gt;&gt; On Wednesday 08 of May 2013 11:31:34 Vikas Sajjan wr=
ote:<br>
&gt; &gt;&gt; &gt;&gt; &gt; Adds display timing node for a DP panel to Arnd=
ale Board DTS<br>
&gt; &gt;&gt; &gt;&gt; &gt; file<br>
&gt; &gt;&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt;&gt; &gt; Signed-off-by: Vikas Sajjan &lt;<a href=3D"mail=
to:vikas.sajjan-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" target=3D"_blank">vikas.sajjan-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org</a>&g=
t;<br>
&gt; &gt;&gt; &gt;&gt; &gt; ---<br>
&gt; &gt;&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt;&gt; &gt; =A0arch/arm/boot/dts/exynos5250-arndale.dts | =
=A0 16<br>
&gt; &gt;&gt; &gt;&gt; &gt; =A0++++++++++++++++<br>
&gt; &gt;&gt; &gt;&gt; &gt; =A01 file changed, 16 insertions(+)<br>
&gt; &gt;&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt;&gt; &gt; diff --git a/arch/arm/boot/dts/exynos5250-arnda=
le.dts<br>
&gt; &gt;&gt; &gt;&gt; &gt; b/arch/arm/boot/dts/exynos5250-arndale.dts inde=
x<br>
&gt; &gt;&gt; &gt;&gt; &gt; f68b820..c831a5c<br>
&gt; &gt;&gt; &gt;&gt; &gt; 100644<br>
&gt; &gt;&gt; &gt;&gt; &gt; --- a/arch/arm/boot/dts/exynos5250-arndale.dts<=
br>
&gt; &gt;&gt; &gt;&gt; &gt; +++ b/arch/arm/boot/dts/exynos5250-arndale.dts<=
br>
&gt; &gt;&gt; &gt;&gt; &gt; @@ -459,4 +459,20 @@<br>
&gt; &gt;&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt;&gt; &gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0 samsung,lane-count =
=3D &lt;4&gt;;<br>
&gt; &gt;&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt;&gt; &gt; =A0 =A0 =A0 };<br>
&gt; &gt;&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt;&gt; &gt; + =A0 =A0 display-timings {<br>
&gt; &gt;&gt; &gt;&gt; &gt; + =A0 =A0 =A0 =A0 =A0 =A0 native-mode =3D &lt;&=
amp;timing0&gt;;<br>
&gt; &gt;&gt; &gt;&gt; &gt; + =A0 =A0 =A0 =A0 =A0 =A0 timing0: timing@0 {<b=
r>
&gt; &gt;&gt; &gt;&gt; &gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* 25=
60x1600 DP panel */<br>
&gt; &gt;&gt; &gt;&gt; &gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 clock=
-frequency =3D &lt;50000&gt;;<br>
&gt; &gt;&gt; &gt;&gt; &gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 hacti=
ve =3D &lt;2560&gt;;<br>
&gt; &gt;&gt; &gt;&gt; &gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 vacti=
ve =3D &lt;1600&gt;;<br>
&gt; &gt;&gt; &gt;&gt; &gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 hfron=
t-porch =3D &lt;48&gt;;<br>
&gt; &gt;&gt; &gt;&gt; &gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 hback=
-porch =3D &lt;80&gt;;<br>
&gt; &gt;&gt; &gt;&gt; &gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 hsync=
-len =3D &lt;32&gt;;<br>
&gt; &gt;&gt; &gt;&gt; &gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 vback=
-porch =3D &lt;16&gt;;<br>
&gt; &gt;&gt; &gt;&gt; &gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 vfron=
t-porch =3D &lt;8&gt;;<br>
&gt; &gt;&gt; &gt;&gt; &gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 vsync=
-len =3D &lt;6&gt;;<br>
&gt; &gt;&gt; &gt;&gt; &gt; + =A0 =A0 =A0 =A0 =A0 =A0 };<br>
&gt; &gt;&gt; &gt;&gt; &gt; + =A0 =A0 };<br>
&gt; &gt;&gt; &gt;&gt;<br>
&gt; &gt;&gt; &gt;&gt; What display are those timings used for? Shouldn&#39=
;t they be placed<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; inside<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; &gt;&gt; node of that display?<br>
&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt; This timing information will be used parsed by the FIMD =
probe with<br>
&gt; &gt;&gt; &gt; the<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; help<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; &gt; of &quot;Video Helper function&quot; =A0as done in this =
link<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; <a href=3D"https://git.kernel.org/cgit/linux/kernel/git/daein=
ki/drm-exynos.git/c" target=3D"_blank">https://git.kernel.org/cgit/linux/ke=
rnel/git/daeinki/drm-exynos.git/c</a><br>
&gt; &gt;&gt; ommit/?h=3Dexynos-drm-next&amp;id=3D7f4596f4aebcc9fcf2d50d3fe=
398508d710c4dd0<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; That function passes in a device node pointer to the FIMD dev=
ice<br>
&gt; &gt;&gt; node,<br>
&gt; &gt;&gt; and only looks for a display-timings node under there. Tomasz=
 is<br>
&gt; &gt;&gt; right, as far as I can tell.<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; Placing display timings at the root of the device tree seems<=
br>
&gt; &gt;&gt; completely<br>
&gt; &gt;&gt; wrong.<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; =A0 =A0 =A0 =A0 I referred this &quot;<br>
&gt;<br>
&gt; Documentation/devicetree/bindings/video/display-timing.txt&quot; for e=
xample<br>
&gt;<br>
&gt; =A0 =A0 =A0 =A0 =A0 =A0 here it dosen&#39;t mention about whether disp=
lay timings node<br>
&gt; can be placed at the root of the device tree or NOT.<br>
&gt; =A0Not sure how we should be placing the node then.<br>
<br>
</div></div>I think this is pretty obvious.<br>
<br>
Imagine a bit more complex case: a board has two video outputs (let&#39;s s=
ay<br>
FIMD0 and FIMD1), each connected to a completely different display. This<br=
>
means that each display needs different timings.<br>
<br>
How would you know which timings to use if all of them were be placed<br>
under the root node?<br>
<br></blockquote></div></div><div>=A0 =A0 so what do you think, how=A0 shou=
ld we modify this patch so that it belongs to a specific video outputs.<br>=
<br></div></div></div></div></blockquote><div><br></div><div><br>=A0 So wha=
t do you think, how should we modify this patch so that it belongs to a spe=
cific video outputs. <br>

</div><div><br><br>=A0</div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x"><div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote"><=
div></div>

<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">

Best regards,<br>
Tomasz<br>
<br>
</blockquote></div><div class=3D"im"><br><br clear=3D"all"><br>-- <br>Thank=
s and Regards<div>=A0Vikas Sajjan</div>
</div></div></div>
</blockquote></div><br><br clear=3D"all"><br>-- <br>Thanks and Regards<div>=
=A0Vikas Sajjan</div>
</div></div>

--047d7b343c66f586da04dcad5ae8--

--===============1849063144933760187==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============1849063144933760187==--
