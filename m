From: Inki Dae <inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH 3/4] ARM: dts: Add mixer clocks to mixer node
Date: Thu, 13 Jun 2013 20:48:57 +0900
Message-ID: <CAAQKjZOA-v+mqBKW0V8M5b4uwQ_pP86biouVLFLERs7pPy27gw@mail.gmail.com>
References: <1370933645-18344-1-git-send-email-rahul.sharma@samsung.com>
 <1370933645-18344-4-git-send-email-rahul.sharma@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3664511327100187659=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1370933645-18344-4-git-send-email-rahul.sharma-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
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
To: Rahul Sharma <rahul.sharma-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Seung-Woo Kim <sw0312.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, sunil joshi <joshi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, DRI mailing list <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rahul Sharma <r.sh.open-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

--===============3664511327100187659==
Content-Type: multipart/alternative; boundary=089e0158c5aa29fa4804df07b7d4

--089e0158c5aa29fa4804df07b7d4
Content-Type: text/plain; charset=ISO-8859-1

Acked-by: Inki Dae <inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>

Thanks,
Inki Dae


2013/6/11 Rahul Sharma <rahul.sharma-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>

> From: Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
>
> This patch adds the mixer clocks to the mixer node in the dts file.
>
> Signed-off-by: Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> Signed-off-by: Rahul Sharma <rahul.sharma-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> ---
>  arch/arm/boot/dts/exynos5250.dtsi |    2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/arch/arm/boot/dts/exynos5250.dtsi
> b/arch/arm/boot/dts/exynos5250.dtsi
> index 0673524..9d9496a 100644
> --- a/arch/arm/boot/dts/exynos5250.dtsi
> +++ b/arch/arm/boot/dts/exynos5250.dtsi
> @@ -614,6 +614,8 @@
>                 compatible = "samsung,exynos5-mixer";
>                 reg = <0x14450000 0x10000>;
>                 interrupts = <0 94 0>;
> +               clocks = <&clock 343>, <&clock 136>;
> +               clock-names = "mixer", "sclk_hdmi";
>         };
>
>         dp-controller {
> --
> 1.7.10.4
>
> --
> To unsubscribe from this list: send the line "unsubscribe
> linux-samsung-soc" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>

--089e0158c5aa29fa4804df07b7d4
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Acked-by: Inki Dae &lt;<a href=3D"mailto:inki.dae@sam=
sung.com">inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org</a>&gt;<br><br>Thanks,<br></div>Inki Dae<br>=
</div><div class=3D"gmail_extra"><br><br><div class=3D"gmail_quote">2013/6/=
11 Rahul Sharma <span dir=3D"ltr">&lt;<a href=3D"mailto:rahul.sharma@samsun=
g.com" target=3D"_blank">rahul.sharma-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org</a>&gt;</span><br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">From: Sean Paul &lt;<a href=3D"mailto:seanpa=
ul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org">seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org</a>&gt;<br>
<br>
This patch adds the mixer clocks to the mixer node in the dts file.<br>
<br>
Signed-off-by: Sean Paul &lt;<a href=3D"mailto:seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org">seanp=
aul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org</a>&gt;<br>
Signed-off-by: Rahul Sharma &lt;<a href=3D"mailto:rahul.sharma-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org"=
>rahul.sharma-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org</a>&gt;<br>
---<br>
=A0arch/arm/boot/dts/exynos5250.dtsi | =A0 =A02 ++<br>
=A01 file changed, 2 insertions(+)<br>
<br>
diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos52=
50.dtsi<br>
index 0673524..9d9496a 100644<br>
--- a/arch/arm/boot/dts/exynos5250.dtsi<br>
+++ b/arch/arm/boot/dts/exynos5250.dtsi<br>
@@ -614,6 +614,8 @@<br>
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D &quot;samsung,exynos5-mixer&=
quot;;<br>
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 reg =3D &lt;0x14450000 0x10000&gt;;<br>
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 interrupts =3D &lt;0 94 0&gt;;<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 clocks =3D &lt;&amp;clock 343&gt;, &lt;&amp;c=
lock 136&gt;;<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 clock-names =3D &quot;mixer&quot;, &quot;sclk=
_hdmi&quot;;<br>
=A0 =A0 =A0 =A0 };<br>
<br>
=A0 =A0 =A0 =A0 dp-controller {<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
1.7.10.4<br>
<br>
--<br>
To unsubscribe from this list: send the line &quot;unsubscribe linux-samsun=
g-soc&quot; in<br>
the body of a message to <a href=3D"mailto:majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org">major=
domo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org</a><br>
More majordomo info at =A0<a href=3D"http://vger.kernel.org/majordomo-info.=
html" target=3D"_blank">http://vger.kernel.org/majordomo-info.html</a><br>
</font></span></blockquote></div><br></div>

--089e0158c5aa29fa4804df07b7d4--

--===============3664511327100187659==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============3664511327100187659==--
