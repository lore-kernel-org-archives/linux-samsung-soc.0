From: Sachin Kamat <sachin.kamat-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/1] ARM: dts: Remove combiner IRQ node from
 exynos4x12.dtsi
Date: Mon, 20 May 2013 22:23:44 +0530
Message-ID: <CAK9yfHwqP-OtJ0bmhhDnvsCieURcBsYXgA6SGuKLE03Ze9Z3Qg@mail.gmail.com>
References: <1366710888-11059-1-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6592838706895540379=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1366710888-11059-1-git-send-email-sachin.kamat-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
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
To: "linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Cc: "kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org" <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

--===============6592838706895540379==
Content-Type: multipart/alternative; boundary=089e0118278eefd8a504dd292c1f

--089e0118278eefd8a504dd292c1f
Content-Type: text/plain; charset=ISO-8859-1

Ping...

On Tuesday, 23 April 2013, Sachin Kamat <sachin.kamat-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> These nodes have separately been added to 4212 and 4412 dtsi
> files by commit 30269ddff1 ("ARM: exynos: add missing properties
> for combiner IRQs"). The existing node also contained a few
> incorrect entries.
>
> Signed-off-by: Sachin Kamat <sachin.kamat-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> ---
> Patch based on linux-next tree (20130423)
> ---
>  arch/arm/boot/dts/exynos4x12.dtsi |    8 --------
>  1 file changed, 8 deletions(-)
>
> diff --git a/arch/arm/boot/dts/exynos4x12.dtsi
b/arch/arm/boot/dts/exynos4x12.dtsi
> index ede3f9b..675c221 100644
> --- a/arch/arm/boot/dts/exynos4x12.dtsi
> +++ b/arch/arm/boot/dts/exynos4x12.dtsi
> @@ -28,14 +28,6 @@
>                 pinctrl3 = &pinctrl_3;
>         };
>
> -       combiner:interrupt-controller@10440000 {
> -               interrupts = <0 0 0>, <0 1 0>, <0 2 0>, <0 3 0>,
> -                            <0 4 0>, <0 5 0>, <0 6 0>, <0 7 0>,
> -                            <0 8 0>, <0 9 0>, <0 10 0>, <0 11 0>,
> -                            <0 12 0>, <0 13 0>, <0 14 0>, <0 15 0>,
> -                            <0 16 0>, <0 17 0>, <0 18 0>, <0 19 0>;
> -       };
> -
>         clock: clock-controller@0x10030000 {
>                 compatible = "samsung,exynos4412-clock";
>                 reg = <0x10030000 0x20000>;
> --
> 1.7.9.5
>
>

-- 
With warm regards,
Sachin

--089e0118278eefd8a504dd292c1f
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Ping...<br><br>On Tuesday, 23 April 2013, Sachin Kamat &lt;<a href=3D"mailt=
o:sachin.kamat-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org">sachin.kamat-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org</a>&gt; wrote:<br>&gt; T=
hese nodes have separately been added to 4212 and 4412 dtsi<br>&gt; files b=
y commit 30269ddff1 (&quot;ARM: exynos: add missing properties<br>
&gt; for combiner IRQs&quot;). The existing node also contained a few<br>&g=
t; incorrect entries.<br>&gt;<br>&gt; Signed-off-by: Sachin Kamat &lt;<a hr=
ef=3D"mailto:sachin.kamat-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org">sachin.kamat-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org</a>&gt;<br>
&gt; ---<br>&gt; Patch based on linux-next tree (20130423)<br>&gt; ---<br>&=
gt; =A0arch/arm/boot/dts/exynos4x12.dtsi | =A0 =A08 --------<br>&gt; =A01 f=
ile changed, 8 deletions(-)<br>&gt;<br>&gt; diff --git a/arch/arm/boot/dts/=
exynos4x12.dtsi b/arch/arm/boot/dts/exynos4x12.dtsi<br>
&gt; index ede3f9b..675c221 100644<br>&gt; --- a/arch/arm/boot/dts/exynos4x=
12.dtsi<br>&gt; +++ b/arch/arm/boot/dts/exynos4x12.dtsi<br>&gt; @@ -28,14 +=
28,6 @@<br>&gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 pinctrl3 =3D &amp;pinctrl_3=
;<br>&gt; =A0 =A0 =A0 =A0 };<br>
&gt;<br>&gt; - =A0 =A0 =A0 combiner:interrupt-controller@10440000 {<br>&gt;=
 - =A0 =A0 =A0 =A0 =A0 =A0 =A0 interrupts =3D &lt;0 0 0&gt;, &lt;0 1 0&gt;,=
 &lt;0 2 0&gt;, &lt;0 3 0&gt;,<br>&gt; - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0&lt;0 4 0&gt;, &lt;0 5 0&gt;, &lt;0 6 0&gt;, &lt;0 7=
 0&gt;,<br>
&gt; - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0&lt;0 8 0&gt;=
, &lt;0 9 0&gt;, &lt;0 10 0&gt;, &lt;0 11 0&gt;,<br>&gt; - =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0&lt;0 12 0&gt;, &lt;0 13 0&gt;, &lt;=
0 14 0&gt;, &lt;0 15 0&gt;,<br>&gt; - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0&lt;0 16 0&gt;, &lt;0 17 0&gt;, &lt;0 18 0&gt;, &lt;0 19=
 0&gt;;<br>
&gt; - =A0 =A0 =A0 };<br>&gt; -<br>&gt; =A0 =A0 =A0 =A0 clock: clock-contro=
ller@0x10030000 {<br>&gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D &q=
uot;samsung,exynos4412-clock&quot;;<br>&gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 reg =3D &lt;0x10030000 0x20000&gt;;<br>&gt; --<br>
&gt; 1.7.9.5<br>&gt;<br>&gt;<br><br>-- <br><div>With warm regards,</div>
<div>Sachin</div><br>

--089e0118278eefd8a504dd292c1f--

--===============6592838706895540379==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============6592838706895540379==--
