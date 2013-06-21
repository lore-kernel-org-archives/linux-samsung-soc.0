From: Inki Dae <daeinki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 3/3] ARM/dts: change compatible strings for hdmi
 subsystem
Date: Fri, 21 Jun 2013 14:17:37 +0900
Message-ID: <CAAQKjZOHmr57WoLuPvLM_KbGvvuOFNjNtD_aBmsykAebt+B+AQ@mail.gmail.com>
References: <1371646269-21880-1-git-send-email-rahul.sharma@samsung.com>
 <1371646269-21880-4-git-send-email-rahul.sharma@samsung.com>
 <51C1B72A.6080801@samsung.com> <51C1B799.10008@samsung.com>
 <CAPdUM4Pg7wG4EaPw_7R=N=Lx1qWrNt4=LxhzH2+V5YGx0USfNg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5555065621189863744=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <CAPdUM4Pg7wG4EaPw_7R=N=Lx1qWrNt4=LxhzH2+V5YGx0USfNg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
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
To: Rahul Sharma <r.sh.open-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Seung-Woo Kim <sw0312.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Tomasz Figa <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, DRI mailing list <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, sunil joshi <joshi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Rahul Sharma <rahul.sharma-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

--===============5555065621189863744==
Content-Type: multipart/alternative; boundary=001a113312d45df6f504dfa32e46

--001a113312d45df6f504dfa32e46
Content-Type: text/plain; charset=ISO-8859-1

2013/6/20 Rahul Sharma <r.sh.open-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

> Thanks Mr. Kim,
>
> I will post v4 with aforesaid change.
>
>
You don't need  to re-post it. I gonna change it to "ARM/dts: change
compatible strings for Exynos5250 hdmi subsystem", and merge it. Is there
another you want?

Thanks,
Inki Dae

regards,
> Rahul Sharma.
>
> On Wed, Jun 19, 2013 at 7:22 PM, Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org> wrote:
> > On 06/19/13 22:50, Kukjin Kim wrote:
> >>
> >> On 06/19/13 21:51, Rahul Sharma wrote:
> >>>
> >>> This patch renames the combatible strings for hdmi, mixer, ddc
> >>> and hdmiphy. It follows the convention of using compatible string
> >>> which represent the SoC in which the IP was added for the first
> >>> time.
> >>>
> >>> Signed-off-by: Rahul Sharma<rahul.sharma-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> >>
> >>
> >> Acked-by: Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> >>
> >
> > Just one nit in subject:
> >
> > [PATCH] ARM: dts: ..... for exynos5250
> >
> > Thanks,
> >
> > - Kukjin
> >
> >>> ---
> >>> arch/arm/boot/dts/cros5250-common.dtsi | 4 ++--
> >>> arch/arm/boot/dts/exynos5250-smdk5250.dts | 4 ++--
> >>> arch/arm/boot/dts/exynos5250.dtsi | 4 ++--
> >>> 3 files changed, 6 insertions(+), 6 deletions(-)
> >>>
> >>> diff --git a/arch/arm/boot/dts/cros5250-common.dtsi
> >>> b/arch/arm/boot/dts/cros5250-common.dtsi
> >>> index 3f0239e..dc259e8b 100644
> >>> --- a/arch/arm/boot/dts/cros5250-common.dtsi
> >>> +++ b/arch/arm/boot/dts/cros5250-common.dtsi
> >>> @@ -190,7 +190,7 @@
> >>> samsung,i2c-max-bus-freq =<66000>;
> >>>
> >>> hdmiddc@50 {
> >>> - compatible = "samsung,exynos5-hdmiddc";
> >>> + compatible = "samsung,exynos4210-hdmiddc";
> >>> reg =<0x50>;
> >>> };
> >>> };
> >>> @@ -224,7 +224,7 @@
> >>> samsung,i2c-max-bus-freq =<378000>;
> >>>
> >>> hdmiphy@38 {
> >>> - compatible = "samsung,exynos5-hdmiphy";
> >>> + compatible = "samsung,exynos4212-hdmiphy";
> >>> reg =<0x38>;
> >>> };
> >>> };
> >>> diff --git a/arch/arm/boot/dts/exynos5250-smdk5250.dts
> >>> b/arch/arm/boot/dts/exynos5250-smdk5250.dts
> >>> index 3e0c792..f320d7c 100644
> >>> --- a/arch/arm/boot/dts/exynos5250-smdk5250.dts
> >>> +++ b/arch/arm/boot/dts/exynos5250-smdk5250.dts
> >>> @@ -72,7 +72,7 @@
> >>> samsung,i2c-max-bus-freq =<66000>;
> >>>
> >>> hdmiddc@50 {
> >>> - compatible = "samsung,exynos5-hdmiddc";
> >>> + compatible = "samsung,exynos4210-hdmiddc";
> >>> reg =<0x50>;
> >>> };
> >>> };
> >>> @@ -102,7 +102,7 @@
> >>> samsung,i2c-max-bus-freq =<66000>;
> >>>
> >>> hdmiphy@38 {
> >>> - compatible = "samsung,exynos5-hdmiphy";
> >>> + compatible = "samsung,exynos4212-hdmiphy";
> >>> reg =<0x38>;
> >>> };
> >>> };
> >>> diff --git a/arch/arm/boot/dts/exynos5250.dtsi
> >>> b/arch/arm/boot/dts/exynos5250.dtsi
> >>> index 0673524..2f7763b 100644
> >>> --- a/arch/arm/boot/dts/exynos5250.dtsi
> >>> +++ b/arch/arm/boot/dts/exynos5250.dtsi
> >>> @@ -601,7 +601,7 @@
> >>> };
> >>>
> >>> hdmi {
> >>> - compatible = "samsung,exynos5-hdmi";
> >>> + compatible = "samsung,exynos4212-hdmi";
> >>> reg =<0x14530000 0x70000>;
> >>> interrupts =<0 95 0>;
> >>> clocks =<&clock 333>,<&clock 136>,<&clock 137>,
> >>> @@ -611,7 +611,7 @@
> >>> };
> >>>
> >>> mixer {
> >>> - compatible = "samsung,exynos5-mixer";
> >>> + compatible = "samsung,exynos5250-mixer";
> >>> reg =<0x14450000 0x10000>;
> >>> interrupts =<0 94 0>;
> >>> };
> --
> To unsubscribe from this list: send the line "unsubscribe
> linux-samsung-soc" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>

--001a113312d45df6f504dfa32e46
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><br><div class=3D"gmail=
_quote">2013/6/20 Rahul Sharma <span dir=3D"ltr">&lt;<a href=3D"mailto:r.sh=
.open-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" target=3D"_blank">r.sh.open-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org</a>&gt;</span><br><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">

Thanks Mr. Kim,<br>
<br>
I will post v4 with aforesaid change.<br>
<br></blockquote><div><br></div><div>You don&#39;t need=A0 to re-post it. I=
 gonna change it to &quot;ARM/dts: change compatible strings for Exynos5250=
 hdmi subsystem&quot;, and merge it. Is there another you want?<br></div>
<br><div>Thanks,<br>
Inki Dae <br></div><div><br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
regards,<br>
Rahul Sharma.<br>
<div><div><br>
On Wed, Jun 19, 2013 at 7:22 PM, Kukjin Kim &lt;<a href=3D"mailto:kgene.kim=
@samsung.com" target=3D"_blank">kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org</a>&gt; wrote:<br>
&gt; On 06/19/13 22:50, Kukjin Kim wrote:<br>
&gt;&gt;<br>
&gt;&gt; On 06/19/13 21:51, Rahul Sharma wrote:<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; This patch renames the combatible strings for hdmi, mixer, ddc=
<br>
&gt;&gt;&gt; and hdmiphy. It follows the convention of using compatible str=
ing<br>
&gt;&gt;&gt; which represent the SoC in which the IP was added for the firs=
t<br>
&gt;&gt;&gt; time.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Signed-off-by: Rahul Sharma&lt;<a href=3D"mailto:rahul.sharma@=
samsung.com" target=3D"_blank">rahul.sharma-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org</a>&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; Acked-by: Kukjin Kim &lt;<a href=3D"mailto:kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org" =
target=3D"_blank">kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org</a>&gt;<br>
&gt;&gt;<br>
&gt;<br>
&gt; Just one nit in subject:<br>
&gt;<br>
&gt; [PATCH] ARM: dts: ..... for exynos5250<br>
&gt;<br>
&gt; Thanks,<br>
&gt;<br>
&gt; - Kukjin<br>
&gt;<br>
&gt;&gt;&gt; ---<br>
&gt;&gt;&gt; arch/arm/boot/dts/cros5250-common.dtsi | 4 ++--<br>
&gt;&gt;&gt; arch/arm/boot/dts/exynos5250-smdk5250.dts | 4 ++--<br>
&gt;&gt;&gt; arch/arm/boot/dts/exynos5250.dtsi | 4 ++--<br>
&gt;&gt;&gt; 3 files changed, 6 insertions(+), 6 deletions(-)<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; diff --git a/arch/arm/boot/dts/cros5250-common.dtsi<br>
&gt;&gt;&gt; b/arch/arm/boot/dts/cros5250-common.dtsi<br>
&gt;&gt;&gt; index 3f0239e..dc259e8b 100644<br>
&gt;&gt;&gt; --- a/arch/arm/boot/dts/cros5250-common.dtsi<br>
&gt;&gt;&gt; +++ b/arch/arm/boot/dts/cros5250-common.dtsi<br>
&gt;&gt;&gt; @@ -190,7 +190,7 @@<br>
&gt;&gt;&gt; samsung,i2c-max-bus-freq =3D&lt;66000&gt;;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; hdmiddc@50 {<br>
&gt;&gt;&gt; - compatible =3D &quot;samsung,exynos5-hdmiddc&quot;;<br>
&gt;&gt;&gt; + compatible =3D &quot;samsung,exynos4210-hdmiddc&quot;;<br>
&gt;&gt;&gt; reg =3D&lt;0x50&gt;;<br>
&gt;&gt;&gt; };<br>
&gt;&gt;&gt; };<br>
&gt;&gt;&gt; @@ -224,7 +224,7 @@<br>
&gt;&gt;&gt; samsung,i2c-max-bus-freq =3D&lt;378000&gt;;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; hdmiphy@38 {<br>
&gt;&gt;&gt; - compatible =3D &quot;samsung,exynos5-hdmiphy&quot;;<br>
&gt;&gt;&gt; + compatible =3D &quot;samsung,exynos4212-hdmiphy&quot;;<br>
&gt;&gt;&gt; reg =3D&lt;0x38&gt;;<br>
&gt;&gt;&gt; };<br>
&gt;&gt;&gt; };<br>
&gt;&gt;&gt; diff --git a/arch/arm/boot/dts/exynos5250-smdk5250.dts<br>
&gt;&gt;&gt; b/arch/arm/boot/dts/exynos5250-smdk5250.dts<br>
&gt;&gt;&gt; index 3e0c792..f320d7c 100644<br>
&gt;&gt;&gt; --- a/arch/arm/boot/dts/exynos5250-smdk5250.dts<br>
&gt;&gt;&gt; +++ b/arch/arm/boot/dts/exynos5250-smdk5250.dts<br>
&gt;&gt;&gt; @@ -72,7 +72,7 @@<br>
&gt;&gt;&gt; samsung,i2c-max-bus-freq =3D&lt;66000&gt;;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; hdmiddc@50 {<br>
&gt;&gt;&gt; - compatible =3D &quot;samsung,exynos5-hdmiddc&quot;;<br>
&gt;&gt;&gt; + compatible =3D &quot;samsung,exynos4210-hdmiddc&quot;;<br>
&gt;&gt;&gt; reg =3D&lt;0x50&gt;;<br>
&gt;&gt;&gt; };<br>
&gt;&gt;&gt; };<br>
&gt;&gt;&gt; @@ -102,7 +102,7 @@<br>
&gt;&gt;&gt; samsung,i2c-max-bus-freq =3D&lt;66000&gt;;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; hdmiphy@38 {<br>
&gt;&gt;&gt; - compatible =3D &quot;samsung,exynos5-hdmiphy&quot;;<br>
&gt;&gt;&gt; + compatible =3D &quot;samsung,exynos4212-hdmiphy&quot;;<br>
&gt;&gt;&gt; reg =3D&lt;0x38&gt;;<br>
&gt;&gt;&gt; };<br>
&gt;&gt;&gt; };<br>
&gt;&gt;&gt; diff --git a/arch/arm/boot/dts/exynos5250.dtsi<br>
&gt;&gt;&gt; b/arch/arm/boot/dts/exynos5250.dtsi<br>
&gt;&gt;&gt; index 0673524..2f7763b 100644<br>
&gt;&gt;&gt; --- a/arch/arm/boot/dts/exynos5250.dtsi<br>
&gt;&gt;&gt; +++ b/arch/arm/boot/dts/exynos5250.dtsi<br>
&gt;&gt;&gt; @@ -601,7 +601,7 @@<br>
&gt;&gt;&gt; };<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; hdmi {<br>
&gt;&gt;&gt; - compatible =3D &quot;samsung,exynos5-hdmi&quot;;<br>
&gt;&gt;&gt; + compatible =3D &quot;samsung,exynos4212-hdmi&quot;;<br>
&gt;&gt;&gt; reg =3D&lt;0x14530000 0x70000&gt;;<br>
&gt;&gt;&gt; interrupts =3D&lt;0 95 0&gt;;<br>
&gt;&gt;&gt; clocks =3D&lt;&amp;clock 333&gt;,&lt;&amp;clock 136&gt;,&lt;&a=
mp;clock 137&gt;,<br>
&gt;&gt;&gt; @@ -611,7 +611,7 @@<br>
&gt;&gt;&gt; };<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; mixer {<br>
&gt;&gt;&gt; - compatible =3D &quot;samsung,exynos5-mixer&quot;;<br>
&gt;&gt;&gt; + compatible =3D &quot;samsung,exynos5250-mixer&quot;;<br>
&gt;&gt;&gt; reg =3D&lt;0x14450000 0x10000&gt;;<br>
&gt;&gt;&gt; interrupts =3D&lt;0 94 0&gt;;<br>
&gt;&gt;&gt; };<br>
--<br>
To unsubscribe from this list: send the line &quot;unsubscribe linux-samsun=
g-soc&quot; in<br>
the body of a message to <a href=3D"mailto:majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" targe=
t=3D"_blank">majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org</a><br>
More majordomo info at =A0<a href=3D"http://vger.kernel.org/majordomo-info.=
html" target=3D"_blank">http://vger.kernel.org/majordomo-info.html</a><br>
</div></div></blockquote></div><br></div></div>

--001a113312d45df6f504dfa32e46--

--===============5555065621189863744==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============5555065621189863744==--
