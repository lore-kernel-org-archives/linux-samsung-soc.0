From: Vikas Sajjan <vikas.sajjan-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 3/3] ARM: dts: Add display timing node to
 exynos5250-arndale.dts
Date: Tue, 14 May 2013 19:09:09 +0530
Message-ID: <CAD025ySYmn6fZ3zYOrjuPF-wrf1mqciM7hgC77TkenvNCiziVw@mail.gmail.com>
References: <1367992894-20198-1-git-send-email-vikas.sajjan@linaro.org>
 <CAD025yQ+vnNc1RqoqoBw9JqYUp6aAY2wTowhVyV+zoDZq9sJ6g@mail.gmail.com>
 <CAD025ySx39kOphk3BNrnM+i7-9KHQr607cRYZXKa7uJ6GBXSiA@mail.gmail.com>
 <1853757.ubr759t9No@flatron>
 <CAD025ySqUpGRpx0J61gsjKE_JPa+Mu444ETpd2USyikrNWj71w@mail.gmail.com>
 <CAD025yRyUY4GbFt-Soasj1QBsY4V1=qJZaG4Ww=FrT9UutNRfA@mail.gmail.com>
 <20130514132523.GA10292@pengutronix.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0359250580537937664=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20130514132523.GA10292-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
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
To: Steffen Trumtrar <s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: "kgene.kim" <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, "s.hauer" <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Tomasz Figa <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, InKi Dae <inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, "linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

--===============0359250580537937664==
Content-Type: multipart/alternative; boundary=001a11c34a3a36945a04dcadc396

--001a11c34a3a36945a04dcadc396
Content-Type: text/plain; charset=ISO-8859-1

Thanks, we test and resend v2 patchset.


On 14 May 2013 18:55, Steffen Trumtrar <s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org> wrote:

> Hi!
>
> On Tue, May 14, 2013 at 06:40:00PM +0530, Vikas Sajjan wrote:
> > Hi Steffen Trumtrar and Sascha Hauer,
> >
> > Olof and Tomasz Figa have a concern in putting "display-timings"  as root
> > node in device tree file.
> >
> >
> > On 10 May 2013 13:45, Vikas Sajjan <vikas.sajjan-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> >
> > > HI Tomasz,
> > >
> > >
> > > On 10 May 2013 13:03, Tomasz Figa <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> > >
> > >> On Friday 10 of May 2013 11:57:34 Vikas Sajjan wrote:
> > >> > Hi Olof,
> > >> >
> > >> > On 10 May 2013 11:51, Vikas Sajjan <vikas.sajjan-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> > >> > > Hi Olof,
> > >> > >
> > >> > > On 10 May 2013 11:08, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org> wrote:
> > >> > >> On Thu, May 9, 2013 at 7:55 PM, Vikas Sajjan
> > >> > >> <vikas.sajjan-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> > >> > >>
> > >> > >> wrote:
> > >> > >> > Hi Tomasz,
> > >> > >> >
> > >> > >> > On 10 May 2013 05:35, Tomasz Figa <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> wrote:
> > >> > >> >> Hi Vikas,
> > >> > >> >>
> > >> > >> >> On Wednesday 08 of May 2013 11:31:34 Vikas Sajjan wrote:
> > >> > >> >> > Adds display timing node for a DP panel to Arndale Board DTS
> > >> > >> >> > file
> > >> > >> >> >
> > >> > >> >> > Signed-off-by: Vikas Sajjan <vikas.sajjan-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> > >> > >> >> > ---
> > >> > >> >> >
> > >> > >> >> >  arch/arm/boot/dts/exynos5250-arndale.dts |   16
> > >> > >> >> >  ++++++++++++++++
> > >> > >> >> >  1 file changed, 16 insertions(+)
> > >> > >> >> >
> > >> > >> >> > diff --git a/arch/arm/boot/dts/exynos5250-arndale.dts
> > >> > >> >> > b/arch/arm/boot/dts/exynos5250-arndale.dts index
> > >> > >> >> > f68b820..c831a5c
> > >> > >> >> > 100644
> > >> > >> >> > --- a/arch/arm/boot/dts/exynos5250-arndale.dts
> > >> > >> >> > +++ b/arch/arm/boot/dts/exynos5250-arndale.dts
> > >> > >> >> > @@ -459,4 +459,20 @@
> > >> > >> >> >
> > >> > >> >> >               samsung,lane-count = <4>;
> > >> > >> >> >
> > >> > >> >> >       };
> > >> > >> >> >
> > >> > >> >> > +     display-timings {
> > >> > >> >> > +             native-mode = <&timing0>;
> > >> > >> >> > +             timing0: timing@0 {
> > >> > >> >> > +                     /* 2560x1600 DP panel */
> > >> > >> >> > +                     clock-frequency = <50000>;
> > >> > >> >> > +                     hactive = <2560>;
> > >> > >> >> > +                     vactive = <1600>;
> > >> > >> >> > +                     hfront-porch = <48>;
> > >> > >> >> > +                     hback-porch = <80>;
> > >> > >> >> > +                     hsync-len = <32>;
> > >> > >> >> > +                     vback-porch = <16>;
> > >> > >> >> > +                     vfront-porch = <8>;
> > >> > >> >> > +                     vsync-len = <6>;
> > >> > >> >> > +             };
> > >> > >> >> > +     };
> > >> > >> >>
> > >> > >> >> What display are those timings used for? Shouldn't they be
> placed
> > >> > >>
> > >> > >> inside
> > >> > >>
> > >> > >> >> node of that display?
> > >> > >> >
> > >> > >> > This timing information will be used parsed by the FIMD probe
> with
> > >> > >> > the
> > >> > >>
> > >> > >> help
> > >> > >>
> > >> > >> > of "Video Helper function"  as done in this link
> > >> > >>
> > >> > >>
> > >> https://git.kernel.org/cgit/linux/kernel/git/daeinki/drm-exynos.git/c
> > >> > >>
> ommit/?h=exynos-drm-next&id=7f4596f4aebcc9fcf2d50d3fe398508d710c4dd0
> > >> > >>
> > >> > >> That function passes in a device node pointer to the FIMD device
> > >> > >> node,
> > >> > >> and only looks for a display-timings node under there. Tomasz is
> > >> > >> right, as far as I can tell.
> > >> > >>
> > >> > >> Placing display timings at the root of the device tree seems
> > >> > >> completely
> > >> > >> wrong.
> > >> > >>
> > >> > >>         I referred this "
> > >> >
> > >> > Documentation/devicetree/bindings/video/display-timing.txt" for
> example
> > >> >
> > >> >             here it dosen't mention about whether display timings
> node
> > >> > can be placed at the root of the device tree or NOT.
> > >> >  Not sure how we should be placing the node then.
> > >>
> > >> I think this is pretty obvious.
> > >>
> > >> Imagine a bit more complex case: a board has two video outputs (let's
> say
> > >> FIMD0 and FIMD1), each connected to a completely different display.
> This
> > >> means that each display needs different timings.
> > >>
> > >> How would you know which timings to use if all of them were be placed
> > >> under the root node?
> > >>
> > >>     so what do you think, how  should we modify this patch so that it
> > > belongs to a specific video outputs.
> > >
> > >
> >
> >   So what do you think, how should we modify this patch so that it
> belongs
> > to a specific video outputs.
> >
>  Something like
>
>         &fimd {
>                 display-timings {
>                         timing0: timing@0 {
>                                 /* 2560x1600 DP panel */
>                                 clock-frequency = <50000>;
>                                 hactive = <2560>;
>                                 vactive = <1600>;
>                                 hfront-porch = <48>;
>                                 (...)
>                         };
>                 };
>         };
>
> Would be correct, if fimd is the output on which the display is connected.
> The fimd driver than has to utilize of_get_display_timings,
> of_get_fb_videomode
> or something like that.
>
> Regards,
> Steffen
>
> --
> Pengutronix e.K.                           |                             |
> Industrial Linux Solutions                 | http://www.pengutronix.de/  |
> Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
> Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
>



-- 
Thanks and Regards
 Vikas Sajjan

--001a11c34a3a36945a04dcadc396
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks, we test and resend v2 patchset.<br></div><div clas=
s=3D"gmail_extra"><br><br><div class=3D"gmail_quote">On 14 May 2013 18:55, =
Steffen Trumtrar <span dir=3D"ltr">&lt;<a href=3D"mailto:s.trumtrar@pengutr=
onix.de" target=3D"_blank">s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org</a>&gt;</span> wrote:<=
br>

<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">Hi!<br>
<div><div class=3D"h5"><br>
On Tue, May 14, 2013 at 06:40:00PM +0530, Vikas Sajjan wrote:<br>
&gt; Hi Steffen Trumtrar and Sascha Hauer,<br>
&gt;<br>
&gt; Olof and Tomasz Figa have a concern in putting &quot;display-timings&q=
uot; =A0as root<br>
&gt; node in device tree file.<br>
&gt;<br>
&gt;<br>
&gt; On 10 May 2013 13:45, Vikas Sajjan &lt;<a href=3D"mailto:vikas.sajjan@=
linaro.org">vikas.sajjan-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org</a>&gt; wrote:<br>
&gt;<br>
&gt; &gt; HI Tomasz,<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; On 10 May 2013 13:03, Tomasz Figa &lt;<a href=3D"mailto:tomasz.fi=
ga-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org">tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org</a>&gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt;&gt; On Friday 10 of May 2013 11:57:34 Vikas Sajjan wrote:<br>
&gt; &gt;&gt; &gt; Hi Olof,<br>
&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt; On 10 May 2013 11:51, Vikas Sajjan &lt;<a href=3D"mailto=
:vikas.sajjan-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org">vikas.sajjan-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org</a>&gt; wrote:<br>
&gt; &gt;&gt; &gt; &gt; Hi Olof,<br>
&gt; &gt;&gt; &gt; &gt;<br>
&gt; &gt;&gt; &gt; &gt; On 10 May 2013 11:08, Olof Johansson &lt;<a href=3D=
"mailto:olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org">olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org</a>&gt; wrote:<br>
&gt; &gt;&gt; &gt; &gt;&gt; On Thu, May 9, 2013 at 7:55 PM, Vikas Sajjan<br=
>
&gt; &gt;&gt; &gt; &gt;&gt; &lt;<a href=3D"mailto:vikas.sajjan-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org">=
vikas.sajjan-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org</a>&gt;<br>
&gt; &gt;&gt; &gt; &gt;&gt;<br>
&gt; &gt;&gt; &gt; &gt;&gt; wrote:<br>
&gt; &gt;&gt; &gt; &gt;&gt; &gt; Hi Tomasz,<br>
&gt; &gt;&gt; &gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt; &gt;&gt; &gt; On 10 May 2013 05:35, Tomasz Figa &lt;<a h=
ref=3D"mailto:tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org">tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org</a>&gt; wrote:<b=
r>
&gt; &gt;&gt; &gt; &gt;&gt; &gt;&gt; Hi Vikas,<br>
&gt; &gt;&gt; &gt; &gt;&gt; &gt;&gt;<br>
&gt; &gt;&gt; &gt; &gt;&gt; &gt;&gt; On Wednesday 08 of May 2013 11:31:34 V=
ikas Sajjan wrote:<br>
&gt; &gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; Adds display timing node for a DP=
 panel to Arndale Board DTS<br>
&gt; &gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; file<br>
&gt; &gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; Signed-off-by: Vikas Sajjan &lt;<=
a href=3D"mailto:vikas.sajjan-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org">vikas.sajjan-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org</a>&gt;<b=
r>
&gt; &gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ---<br>
&gt; &gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; =A0arch/arm/boot/dts/exynos5250-a=
rndale.dts | =A0 16<br>
&gt; &gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; =A0++++++++++++++++<br>
&gt; &gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; =A01 file changed, 16 insertions(=
+)<br>
&gt; &gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; diff --git a/arch/arm/boot/dts/ex=
ynos5250-arndale.dts<br>
&gt; &gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; b/arch/arm/boot/dts/exynos5250-ar=
ndale.dts index<br>
&gt; &gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; f68b820..c831a5c<br>
&gt; &gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; 100644<br>
&gt; &gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; --- a/arch/arm/boot/dts/exynos525=
0-arndale.dts<br>
&gt; &gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; +++ b/arch/arm/boot/dts/exynos525=
0-arndale.dts<br>
&gt; &gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; @@ -459,4 +459,20 @@<br>
&gt; &gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0 samsu=
ng,lane-count =3D &lt;4&gt;;<br>
&gt; &gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; =A0 =A0 =A0 };<br>
&gt; &gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; + =A0 =A0 display-timings {<br>
&gt; &gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; + =A0 =A0 =A0 =A0 =A0 =A0 native-=
mode =3D &lt;&amp;timing0&gt;;<br>
&gt; &gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; + =A0 =A0 =A0 =A0 =A0 =A0 timing0=
: timing@0 {<br>
&gt; &gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 /* 2560x1600 DP panel */<br>
&gt; &gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 clock-frequency =3D &lt;50000&gt;;<br>
&gt; &gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 hactive =3D &lt;2560&gt;;<br>
&gt; &gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 vactive =3D &lt;1600&gt;;<br>
&gt; &gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 hfront-porch =3D &lt;48&gt;;<br>
&gt; &gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 hback-porch =3D &lt;80&gt;;<br>
&gt; &gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 hsync-len =3D &lt;32&gt;;<br>
&gt; &gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 vback-porch =3D &lt;16&gt;;<br>
&gt; &gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 vfront-porch =3D &lt;8&gt;;<br>
&gt; &gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 vsync-len =3D &lt;6&gt;;<br>
&gt; &gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; + =A0 =A0 =A0 =A0 =A0 =A0 };<br>
&gt; &gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; + =A0 =A0 };<br>
&gt; &gt;&gt; &gt; &gt;&gt; &gt;&gt;<br>
&gt; &gt;&gt; &gt; &gt;&gt; &gt;&gt; What display are those timings used fo=
r? Shouldn&#39;t they be placed<br>
&gt; &gt;&gt; &gt; &gt;&gt;<br>
&gt; &gt;&gt; &gt; &gt;&gt; inside<br>
&gt; &gt;&gt; &gt; &gt;&gt;<br>
&gt; &gt;&gt; &gt; &gt;&gt; &gt;&gt; node of that display?<br>
&gt; &gt;&gt; &gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt; &gt;&gt; &gt; This timing information will be used parse=
d by the FIMD probe with<br>
&gt; &gt;&gt; &gt; &gt;&gt; &gt; the<br>
&gt; &gt;&gt; &gt; &gt;&gt;<br>
&gt; &gt;&gt; &gt; &gt;&gt; help<br>
&gt; &gt;&gt; &gt; &gt;&gt;<br>
&gt; &gt;&gt; &gt; &gt;&gt; &gt; of &quot;Video Helper function&quot; =A0as=
 done in this link<br>
&gt; &gt;&gt; &gt; &gt;&gt;<br>
&gt; &gt;&gt; &gt; &gt;&gt;<br>
&gt; &gt;&gt; <a href=3D"https://git.kernel.org/cgit/linux/kernel/git/daein=
ki/drm-exynos.git/c" target=3D"_blank">https://git.kernel.org/cgit/linux/ke=
rnel/git/daeinki/drm-exynos.git/c</a><br>
&gt; &gt;&gt; &gt; &gt;&gt; ommit/?h=3Dexynos-drm-next&amp;id=3D7f4596f4aeb=
cc9fcf2d50d3fe398508d710c4dd0<br>
&gt; &gt;&gt; &gt; &gt;&gt;<br>
&gt; &gt;&gt; &gt; &gt;&gt; That function passes in a device node pointer t=
o the FIMD device<br>
&gt; &gt;&gt; &gt; &gt;&gt; node,<br>
&gt; &gt;&gt; &gt; &gt;&gt; and only looks for a display-timings node under=
 there. Tomasz is<br>
&gt; &gt;&gt; &gt; &gt;&gt; right, as far as I can tell.<br>
&gt; &gt;&gt; &gt; &gt;&gt;<br>
&gt; &gt;&gt; &gt; &gt;&gt; Placing display timings at the root of the devi=
ce tree seems<br>
&gt; &gt;&gt; &gt; &gt;&gt; completely<br>
&gt; &gt;&gt; &gt; &gt;&gt; wrong.<br>
&gt; &gt;&gt; &gt; &gt;&gt;<br>
&gt; &gt;&gt; &gt; &gt;&gt; =A0 =A0 =A0 =A0 I referred this &quot;<br>
&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt; Documentation/devicetree/bindings/video/display-timing.t=
xt&quot; for example<br>
&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt; =A0 =A0 =A0 =A0 =A0 =A0 here it dosen&#39;t mention abou=
t whether display timings node<br>
&gt; &gt;&gt; &gt; can be placed at the root of the device tree or NOT.<br>
&gt; &gt;&gt; &gt; =A0Not sure how we should be placing the node then.<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; I think this is pretty obvious.<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; Imagine a bit more complex case: a board has two video output=
s (let&#39;s say<br>
&gt; &gt;&gt; FIMD0 and FIMD1), each connected to a completely different di=
splay. This<br>
&gt; &gt;&gt; means that each display needs different timings.<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; How would you know which timings to use if all of them were b=
e placed<br>
&gt; &gt;&gt; under the root node?<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; =A0 =A0 so what do you think, how =A0should we modify this pa=
tch so that it<br>
&gt; &gt; belongs to a specific video outputs.<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt;<br>
&gt; =A0 So what do you think, how should we modify this patch so that it b=
elongs<br>
&gt; to a specific video outputs.<br>
&gt;<br>
</div></div>=A0Something like<br>
<br>
=A0 =A0 =A0 =A0 &amp;fimd {<br>
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 display-timings {<br>
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 timing0: timing@0 {<br>
<div class=3D"im">=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 /* 2560x1600 DP panel */<br>
</div>=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 clock=
-frequency =3D &lt;50000&gt;;<br>
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 hactive =3D=
 &lt;2560&gt;;<br>
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 vactive =3D=
 &lt;1600&gt;;<br>
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 hfront-porc=
h =3D &lt;48&gt;;<br>
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (...)<br>
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 };<br>
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 };<br>
=A0 =A0 =A0 =A0 };<br>
<br>
Would be correct, if fimd is the output on which the display is connected.<=
br>
The fimd driver than has to utilize of_get_display_timings, of_get_fb_video=
mode<br>
or something like that.<br>
<br>
Regards,<br>
Steffen<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
Pengutronix e.K. =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 |<br>
Industrial Linux Solutions =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 | <a href=3D"htt=
p://www.pengutronix.de/" target=3D"_blank">http://www.pengutronix.de/</a> =
=A0|<br>
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0 =A0 =
=A0|<br>
Amtsgericht Hildesheim, HRA 2686 =A0 =A0 =A0 =A0 =A0 | Fax: =A0 +49-5121-20=
6917-5555 |<br>
</font></span></blockquote></div><br><br clear=3D"all"><br>-- <br>Thanks an=
d Regards<div>=A0Vikas Sajjan</div>
</div>

--001a11c34a3a36945a04dcadc396--

--===============0359250580537937664==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============0359250580537937664==--
