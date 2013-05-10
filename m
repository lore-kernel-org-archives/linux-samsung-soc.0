From: Vikas Sajjan <vikas.sajjan-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 3/3] ARM: dts: Add display timing node to
 exynos5250-arndale.dts
Date: Fri, 10 May 2013 08:25:33 +0530
Message-ID: <CAD025yRnuk2oK1B40p5XTQ7n+aX+ta2PTdEuceCbvRUEvRgzSg@mail.gmail.com>
References: <1367992894-20198-1-git-send-email-vikas.sajjan@linaro.org>
 <1367992894-20198-4-git-send-email-vikas.sajjan@linaro.org>
 <4212940.hYf2k9NPUY@flatron>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7946656014511352876=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <4212940.hYf2k9NPUY@flatron>
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
To: Tomasz Figa <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "kgene.kim" <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linaro-kernel-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, Patch Tracking <patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

--===============7946656014511352876==
Content-Type: multipart/alternative; boundary=001a11c379fa22400c04dc544ede

--001a11c379fa22400c04dc544ede
Content-Type: text/plain; charset=ISO-8859-1

Hi Tomasz,


On 10 May 2013 05:35, Tomasz Figa <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:

> Hi Vikas,
>
> On Wednesday 08 of May 2013 11:31:34 Vikas Sajjan wrote:
> > Adds display timing node for a DP panel to Arndale Board DTS file
> >
> > Signed-off-by: Vikas Sajjan <vikas.sajjan-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> > ---
> >  arch/arm/boot/dts/exynos5250-arndale.dts |   16 ++++++++++++++++
> >  1 file changed, 16 insertions(+)
> >
> > diff --git a/arch/arm/boot/dts/exynos5250-arndale.dts
> > b/arch/arm/boot/dts/exynos5250-arndale.dts index f68b820..c831a5c
> > 100644
> > --- a/arch/arm/boot/dts/exynos5250-arndale.dts
> > +++ b/arch/arm/boot/dts/exynos5250-arndale.dts
> > @@ -459,4 +459,20 @@
> >               samsung,lane-count = <4>;
> >       };
> >
> > +     display-timings {
> > +             native-mode = <&timing0>;
> > +             timing0: timing@0 {
> > +                     /* 2560x1600 DP panel */
> > +                     clock-frequency = <50000>;
> > +                     hactive = <2560>;
> > +                     vactive = <1600>;
> > +                     hfront-porch = <48>;
> > +                     hback-porch = <80>;
> > +                     hsync-len = <32>;
> > +                     vback-porch = <16>;
> > +                     vfront-porch = <8>;
> > +                     vsync-len = <6>;
> > +             };
> > +     };
>
> What display are those timings used for? Shouldn't they be placed inside
> node of that display?
>
>
This timing information will be used parsed by the FIMD probe with the help
of "Video Helper function"  as done in this link

https://git.kernel.org/cgit/linux/kernel/git/daeinki/drm-exynos.git/commit/?h=exynos-drm-next&id=7f4596f4aebcc9fcf2d50d3fe398508d710c4dd0

Please refer to this patch which is used for exynos4412-origen and
exynos5250-smdk5250 respectively in similar way

https://git.kernel.org/cgit/linux/kernel/git/kgene/linux-samsung.git/commit/?h=for-next&id=0207775d6ff7e6a6eddb9931f9328f0f0173a338

https://git.kernel.org/cgit/linux/kernel/git/kgene/linux-samsung.git/commit/?h=for-next&id=06c460b73f75894cabfb1f5277f27cddbc92745c



Best regards,
> Tomasz
>
>


-- 
Thanks and Regards
 Vikas Sajjan

--001a11c379fa22400c04dc544ede
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Tomasz,<br><div class=3D"gmail_extra"><br><br><div clas=
s=3D"gmail_quote">On 10 May 2013 05:35, Tomasz Figa <span dir=3D"ltr">&lt;<=
a href=3D"mailto:tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" target=3D"_blank">tomasz.figa@gmail=
.com</a>&gt;</span> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">Hi Vikas,<br>
<div><div class=3D"h5"><br>
On Wednesday 08 of May 2013 11:31:34 Vikas Sajjan wrote:<br>
&gt; Adds display timing node for a DP panel to Arndale Board DTS file<br>
&gt;<br>
&gt; Signed-off-by: Vikas Sajjan &lt;<a href=3D"mailto:vikas.sajjan@linaro.=
org">vikas.sajjan-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org</a>&gt;<br>
&gt; ---<br>
&gt; =A0arch/arm/boot/dts/exynos5250-arndale.dts | =A0 16 ++++++++++++++++<=
br>
&gt; =A01 file changed, 16 insertions(+)<br>
&gt;<br>
&gt; diff --git a/arch/arm/boot/dts/exynos5250-arndale.dts<br>
&gt; b/arch/arm/boot/dts/exynos5250-arndale.dts index f68b820..c831a5c<br>
&gt; 100644<br>
&gt; --- a/arch/arm/boot/dts/exynos5250-arndale.dts<br>
&gt; +++ b/arch/arm/boot/dts/exynos5250-arndale.dts<br>
&gt; @@ -459,4 +459,20 @@<br>
&gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0 samsung,lane-count =3D &lt;4&gt;;<br>
&gt; =A0 =A0 =A0 };<br>
&gt;<br>
&gt; + =A0 =A0 display-timings {<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 native-mode =3D &lt;&amp;timing0&gt;;<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 timing0: timing@0 {<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* 2560x1600 DP panel */<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 clock-frequency =3D &lt;5000=
0&gt;;<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 hactive =3D &lt;2560&gt;;<br=
>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 vactive =3D &lt;1600&gt;;<br=
>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 hfront-porch =3D &lt;48&gt;;=
<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 hback-porch =3D &lt;80&gt;;<=
br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 hsync-len =3D &lt;32&gt;;<br=
>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 vback-porch =3D &lt;16&gt;;<=
br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 vfront-porch =3D &lt;8&gt;;<=
br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 vsync-len =3D &lt;6&gt;;<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 };<br>
&gt; + =A0 =A0 };<br>
<br>
</div></div>What display are those timings used for? Shouldn&#39;t they be =
placed inside<br>
node of that display?<br>
<br></blockquote><div><br>This timing information will be used parsed by th=
e FIMD probe with the help of &quot;Video Helper function&quot;=A0 as done =
in this link <br><br><a href=3D"https://git.kernel.org/cgit/linux/kernel/gi=
t/daeinki/drm-exynos.git/commit/?h=3Dexynos-drm-next&amp;id=3D7f4596f4aebcc=
9fcf2d50d3fe398508d710c4dd0">https://git.kernel.org/cgit/linux/kernel/git/d=
aeinki/drm-exynos.git/commit/?h=3Dexynos-drm-next&amp;id=3D7f4596f4aebcc9fc=
f2d50d3fe398508d710c4dd0</a><br>

<br>Please refer to this patch which is used for exynos4412-origen and exyn=
os5250-smdk5250 respectively in similar way<br><br><a href=3D"https://git.k=
ernel.org/cgit/linux/kernel/git/kgene/linux-samsung.git/commit/?h=3Dfor-nex=
t&amp;id=3D0207775d6ff7e6a6eddb9931f9328f0f0173a338">https://git.kernel.org=
/cgit/linux/kernel/git/kgene/linux-samsung.git/commit/?h=3Dfor-next&amp;id=
=3D0207775d6ff7e6a6eddb9931f9328f0f0173a338</a><br>

<br><a href=3D"https://git.kernel.org/cgit/linux/kernel/git/kgene/linux-sam=
sung.git/commit/?h=3Dfor-next&amp;id=3D06c460b73f75894cabfb1f5277f27cddbc92=
745c">https://git.kernel.org/cgit/linux/kernel/git/kgene/linux-samsung.git/=
commit/?h=3Dfor-next&amp;id=3D06c460b73f75894cabfb1f5277f27cddbc92745c</a><=
br>

=A0<br><br><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
Best regards,<br>
Tomasz<br>
<br>
</blockquote></div><br><br clear=3D"all"><br>-- <br>Thanks and Regards<div>=
=A0Vikas Sajjan</div>
</div></div>

--001a11c379fa22400c04dc544ede--

--===============7946656014511352876==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============7946656014511352876==--
