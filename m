From: padma venkat <padma.kvr@gmail.com>
Subject: Re: [PATCH 6/6] ARM: dts: Add nodes for spi controllers for Samsung
 Exynos5 platforms
Date: Wed, 23 May 2012 15:20:17 +0530
Message-ID: <CAAgF-BfftSDEFrskY2X6G76hETJfh=0hynmVnz2my+b9phf_5Q@mail.gmail.com>
References: <1337334392-6441-1-git-send-email-thomas.abraham@linaro.org>
 <1337334392-6441-7-git-send-email-thomas.abraham@linaro.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2205931960348504256=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1337334392-6441-7-git-send-email-thomas.abraham@linaro.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Thomas Abraham <thomas.abraham@linaro.org>
Cc: kgene.kim@samsung.com, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, jaswinder.singh@linaro.org
List-Id: linux-samsung-soc@vger.kernel.org

--===============2205931960348504256==
Content-Type: multipart/alternative; boundary=bcaec554df7c0a81f204c0b1109f

--bcaec554df7c0a81f204c0b1109f
Content-Type: text/plain; charset=ISO-8859-1

Hi Thomas,

On Fri, May 18, 2012 at 3:16 PM, Thomas Abraham
<thomas.abraham@linaro.org>wrote:

> Add device nodes for the three instances of spi controllers in Exynos5
> platforms and enable instance spi 1 for smdk5250 board.
>
> Signed-off-by: Thomas Abraham <thomas.abraham@linaro.org>
> ---
>  arch/arm/boot/dts/exynos5250-smdk5250.dts |   47
> ++++++++++++++++++++++++++++-
>  arch/arm/boot/dts/exynos5250.dtsi         |   46
> ++++++++++++++++++++++++++++
>  2 files changed, 92 insertions(+), 1 deletions(-)
>
> diff --git a/arch/arm/boot/dts/exynos5250-smdk5250.dts
> b/arch/arm/boot/dts/exynos5250-smdk5250.dts
> index 49945cc..dca572d 100644
> --- a/arch/arm/boot/dts/exynos5250-smdk5250.dts
> +++ b/arch/arm/boot/dts/exynos5250-smdk5250.dts
> @@ -16,12 +16,18 @@
>        model = "SAMSUNG SMDK5250 board based on EXYNOS5250";
>        compatible = "samsung,smdk5250", "samsung,exynos5250";
>
> +       aliases {
> +               spi0 = &spi_0;
> +               spi1 = &spi_1;
> +               spi2 = &spi_2;
> +       };
> +
>        memory {
>                reg = <0x40000000 0x80000000>;
>        };
>
>        chosen {
> -               bootargs = "root=/dev/ram0 rw ramdisk=8192
> console=ttySAC1,115200";
> +               bootargs ="root=/dev/ram0 rw ramdisk=8192
> initrd=0x41000000,8M console=ttySAC2,115200 init=/linuxrc";
>        };
>
>        i2c@12C60000 {
> @@ -48,6 +54,45 @@
>                };
>        };
>
> +
> +       spi_1: spi@12d30000 {
> +               gpios = <&gpa2 4 2 3 0>,
> +                       <&gpa2 6 2 3 0>,
> +                       <&gpa2 7 2 3 0>;
> +
> +               w25q80bw@0 {
> +                       #address-cells = <1>;
> +                       #size-cells = <1>;
> +                       compatible = "w25x80";
> +                       reg = <0>;
> +                       spi-max-frequency = <10000>;
> +
> +                       controller-data {
> +                               cs-gpio = <&gpa2 5 1 0 3>;
> +                               samsung,spi-feedback-delay = <0>;
> +                       };
> +
> +                       partition@0 {
> +                               label = "U-Boot";
> +                               reg = <0x0 0x40000>;
> +                               read-only;
> +                       };
> +
> +                       partition@40000 {
> +                               label = "Kernel";
> +                               reg = <0x40000 0xc0000>;
> +                       };
> +               };
> +       };
> +
> +       spi_0: spi@12d20000 {
> +               status = "disabled";
> +       };
> +
> +       spi_2: spi@12d40000 {
> +               status = "disabled";
> +       };
> +
>        i2c@12C80000 {
>                status = "disabled";
>        };
> diff --git a/arch/arm/boot/dts/exynos5250.dtsi
> b/arch/arm/boot/dts/exynos5250.dtsi
> index 5ca0cdb..9d7add0 100644
> --- a/arch/arm/boot/dts/exynos5250.dtsi
> +++ b/arch/arm/boot/dts/exynos5250.dtsi
> @@ -30,6 +30,22 @@
>                reg = <0x10481000 0x1000>, <0x10482000 0x2000>;
>        };
>
> +       combiner:interrupt-controller@10440000 {
> +               compatible = "samsung,exynos4210-combiner";
> +               #interrupt-cells = <2>;
> +               interrupt-controller;
> +               samsung,combiner-nr = <32>;
> +               reg = <0x10440000 0x1000>;
> +               interrupts = <0 0 0>, <0 1 0>, <0 2 0>, <0 3 0>,
> +                            <0 4 0>, <0 5 0>, <0 6 0>, <0 7 0>,
> +                            <0 8 0>, <0 9 0>, <0 10 0>, <0 11 0>,
> +                            <0 12 0>, <0 13 0>, <0 14 0>, <0 15 0>,
> +                            <0 16 0>, <0 17 0>, <0 18 0>, <0 19 0>,
> +                            <0 20 0>, <0 21 0>, <0 22 0>, <0 23 0>,
> +                            <0 24 0>, <0 25 0>, <0 26 0>, <0 27 0>,
> +                            <0 28 0>, <0 29 0>, <0 30 0>, <0 31 0>;
> +       };
> +
>
The combiner interrupt controller support is already present in the
following patch.
         ARM: Exynos5: Add combiner, wakeup interrupt controller and
ethernet nodes
This code can be removed from this patch.
Thanks&Regards
Padma

>        watchdog {
>                compatible = "samsung,s3c2410-wdt";
>                reg = <0x101D0000 0x100>;
> @@ -130,6 +146,36 @@
>                #size-cells = <0>;
>        };
>
> +       spi_0: spi@12d20000 {
> +               compatible = "samsung,exynos4210-spi";
> +               reg = <0x12d20000 0x100>;
> +               interrupts = <0 66 0>;
> +               tx-dma-channel = <&pdma0 5>;
> +               rx-dma-channel = <&pdma0 4>;
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +       };
> +
> +       spi_1: spi@12d30000 {
> +               compatible = "samsung,exynos4210-spi";
> +               reg = <0x12d30000 0x100>;
> +               interrupts = <0 67 0>;
> +               tx-dma-channel = <&pdma1 5>;
> +               rx-dma-channel = <&pdma1 4>;
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +       };
> +
> +       spi_2: spi@12d40000 {
> +               compatible = "samsung,exynos4210-spi";
> +               reg = <0x12d40000 0x100>;
> +               interrupts = <0 68 0>;
> +               tx-dma-channel = <&pdma0 7>;
> +               rx-dma-channel = <&pdma0 6>;
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +       };
> +
>        amba {
>                #address-cells = <1>;
>                #size-cells = <1>;
> --
> 1.6.6.rc2
>
> --
> To unsubscribe from this list: send the line "unsubscribe
> linux-samsung-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>

--bcaec554df7c0a81f204c0b1109f
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi Thomas,<br><br><div class=3D"gmail_quote">On Fri, May 18, 2012 at 3:16 P=
M, Thomas Abraham <span dir=3D"ltr">&lt;<a href=3D"mailto:thomas.abraham@li=
naro.org" target=3D"_blank">thomas.abraham@linaro.org</a>&gt;</span> wrote:=
<br><blockquote class=3D"gmail_quote" style=3D"margin:0pt 0pt 0pt 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex">
Add device nodes for the three instances of spi controllers in Exynos5<br>
platforms and enable instance spi 1 for smdk5250 board.<br>
<br>
Signed-off-by: Thomas Abraham &lt;<a href=3D"mailto:thomas.abraham@linaro.o=
rg">thomas.abraham@linaro.org</a>&gt;<br>
---<br>
=A0arch/arm/boot/dts/exynos5250-smdk5250.dts | =A0 47 +++++++++++++++++++++=
+++++++-<br>
=A0arch/arm/boot/dts/exynos5250.dtsi =A0 =A0 =A0 =A0 | =A0 46 +++++++++++++=
+++++++++++++++<br>
=A02 files changed, 92 insertions(+), 1 deletions(-)<br>
<br>
diff --git a/arch/arm/boot/dts/exynos5250-smdk5250.dts b/arch/arm/boot/dts/=
exynos5250-smdk5250.dts<br>
index 49945cc..dca572d 100644<br>
--- a/arch/arm/boot/dts/exynos5250-smdk5250.dts<br>
+++ b/arch/arm/boot/dts/exynos5250-smdk5250.dts<br>
@@ -16,12 +16,18 @@<br>
 =A0 =A0 =A0 =A0model =3D &quot;SAMSUNG SMDK5250 board based on EXYNOS5250&=
quot;;<br>
 =A0 =A0 =A0 =A0compatible =3D &quot;samsung,smdk5250&quot;, &quot;samsung,=
exynos5250&quot;;<br>
<br>
+ =A0 =A0 =A0 aliases {<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 spi0 =3D &amp;spi_0;<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 spi1 =3D &amp;spi_1;<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 spi2 =3D &amp;spi_2;<br>
+ =A0 =A0 =A0 };<br>
+<br>
 =A0 =A0 =A0 =A0memory {<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0reg =3D &lt;0x40000000 0x80000000&gt;;<br>
 =A0 =A0 =A0 =A0};<br>
<br>
 =A0 =A0 =A0 =A0chosen {<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 bootargs =3D &quot;root=3D/dev/ram0 rw ramdis=
k=3D8192 console=3DttySAC1,115200&quot;;<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 bootargs =3D&quot;root=3D/dev/ram0 rw ramdisk=
=3D8192 initrd=3D0x41000000,8M console=3DttySAC2,115200 init=3D/linuxrc&quo=
t;;<br>
 =A0 =A0 =A0 =A0};<br>
<br>
 =A0 =A0 =A0 =A0i2c@12C60000 {<br>
@@ -48,6 +54,45 @@<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0};<br>
 =A0 =A0 =A0 =A0};<br>
<br>
+<br>
+ =A0 =A0 =A0 spi_1: spi@12d30000 {<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 gpios =3D &lt;&amp;gpa2 4 2 3 0&gt;,<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 &lt;&amp;gpa2 6 2 3 0&gt;,<br=
>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 &lt;&amp;gpa2 7 2 3 0&gt;;<br=
>
+<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 w25q80bw@0 {<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 #address-cells =3D &lt;1&gt;;=
<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 #size-cells =3D &lt;1&gt;;<br=
>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D &quot;w25x80&q=
uot;;<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 reg =3D &lt;0&gt;;<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 spi-max-frequency =3D &lt;100=
00&gt;;<br>
+<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 controller-data {<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 cs-gpio =3D &=
lt;&amp;gpa2 5 1 0 3&gt;;<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 samsung,spi-f=
eedback-delay =3D &lt;0&gt;;<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 };<br>
+<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 partition@0 {<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 label =3D &qu=
ot;U-Boot&quot;;<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 reg =3D &lt;0=
x0 0x40000&gt;;<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 read-only;<br=
>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 };<br>
+<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 partition@40000 {<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 label =3D &qu=
ot;Kernel&quot;;<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 reg =3D &lt;0=
x40000 0xc0000&gt;;<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 };<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 };<br>
+ =A0 =A0 =A0 };<br>
+<br>
+ =A0 =A0 =A0 spi_0: spi@12d20000 {<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 status =3D &quot;disabled&quot;;<br>
+ =A0 =A0 =A0 };<br>
+<br>
+ =A0 =A0 =A0 spi_2: spi@12d40000 {<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 status =3D &quot;disabled&quot;;<br>
+ =A0 =A0 =A0 };<br>
+<br>
 =A0 =A0 =A0 =A0i2c@12C80000 {<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0status =3D &quot;disabled&quot;;<br>
 =A0 =A0 =A0 =A0};<br>
diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos52=
50.dtsi<br>
index 5ca0cdb..9d7add0 100644<br>
--- a/arch/arm/boot/dts/exynos5250.dtsi<br>
+++ b/arch/arm/boot/dts/exynos5250.dtsi<br>
@@ -30,6 +30,22 @@<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0reg =3D &lt;0x10481000 0x1000&gt;, &lt;0x10=
482000 0x2000&gt;;<br>
 =A0 =A0 =A0 =A0};<br>
<br>
+ =A0 =A0 =A0 combiner:interrupt-controller@10440000 {<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D &quot;samsung,exynos4210-combi=
ner&quot;;<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 #interrupt-cells =3D &lt;2&gt;;<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 interrupt-controller;<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 samsung,combiner-nr =3D &lt;32&gt;;<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 reg =3D &lt;0x10440000 0x1000&gt;;<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 interrupts =3D &lt;0 0 0&gt;, &lt;0 1 0&gt;, =
&lt;0 2 0&gt;, &lt;0 3 0&gt;,<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0&lt;0 4 0&gt;, &lt=
;0 5 0&gt;, &lt;0 6 0&gt;, &lt;0 7 0&gt;,<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0&lt;0 8 0&gt;, &lt=
;0 9 0&gt;, &lt;0 10 0&gt;, &lt;0 11 0&gt;,<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0&lt;0 12 0&gt;, &l=
t;0 13 0&gt;, &lt;0 14 0&gt;, &lt;0 15 0&gt;,<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0&lt;0 16 0&gt;, &l=
t;0 17 0&gt;, &lt;0 18 0&gt;, &lt;0 19 0&gt;,<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0&lt;0 20 0&gt;, &l=
t;0 21 0&gt;, &lt;0 22 0&gt;, &lt;0 23 0&gt;,<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0&lt;0 24 0&gt;, &l=
t;0 25 0&gt;, &lt;0 26 0&gt;, &lt;0 27 0&gt;,<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0&lt;0 28 0&gt;, &l=
t;0 29 0&gt;, &lt;0 30 0&gt;, &lt;0 31 0&gt;;<br>
+ =A0 =A0 =A0 };<br>
+<br></blockquote><div>The combiner interrupt controller support is already=
 present in the following patch.<br>=A0=A0=A0=A0=A0=A0=A0=A0 ARM: Exynos5: =
Add combiner, wakeup interrupt controller and ethernet nodes<br>This code c=
an be removed from this patch.<br>
Thanks&amp;Regards<br>Padma<br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0pt 0pt 0pt 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">
 =A0 =A0 =A0 =A0watchdog {<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0compatible =3D &quot;samsung,s3c2410-wdt&qu=
ot;;<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0reg =3D &lt;0x101D0000 0x100&gt;;<br>
@@ -130,6 +146,36 @@<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0#size-cells =3D &lt;0&gt;;<br>
 =A0 =A0 =A0 =A0};<br>
<br>
+ =A0 =A0 =A0 spi_0: spi@12d20000 {<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D &quot;samsung,exynos4210-spi&q=
uot;;<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 reg =3D &lt;0x12d20000 0x100&gt;;<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 interrupts =3D &lt;0 66 0&gt;;<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 tx-dma-channel =3D &lt;&amp;pdma0 5&gt;;<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 rx-dma-channel =3D &lt;&amp;pdma0 4&gt;;<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 #address-cells =3D &lt;1&gt;;<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 #size-cells =3D &lt;0&gt;;<br>
+ =A0 =A0 =A0 };<br>
+<br>
+ =A0 =A0 =A0 spi_1: spi@12d30000 {<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D &quot;samsung,exynos4210-spi&q=
uot;;<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 reg =3D &lt;0x12d30000 0x100&gt;;<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 interrupts =3D &lt;0 67 0&gt;;<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 tx-dma-channel =3D &lt;&amp;pdma1 5&gt;;<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 rx-dma-channel =3D &lt;&amp;pdma1 4&gt;;<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 #address-cells =3D &lt;1&gt;;<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 #size-cells =3D &lt;0&gt;;<br>
+ =A0 =A0 =A0 };<br>
+<br>
+ =A0 =A0 =A0 spi_2: spi@12d40000 {<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D &quot;samsung,exynos4210-spi&q=
uot;;<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 reg =3D &lt;0x12d40000 0x100&gt;;<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 interrupts =3D &lt;0 68 0&gt;;<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 tx-dma-channel =3D &lt;&amp;pdma0 7&gt;;<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 rx-dma-channel =3D &lt;&amp;pdma0 6&gt;;<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 #address-cells =3D &lt;1&gt;;<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 #size-cells =3D &lt;0&gt;;<br>
+ =A0 =A0 =A0 };<br>
+<br>
 =A0 =A0 =A0 =A0amba {<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0#address-cells =3D &lt;1&gt;;<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0#size-cells =3D &lt;1&gt;;<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
1.6.6.rc2<br>
<br>
--<br>
To unsubscribe from this list: send the line &quot;unsubscribe linux-samsun=
g-soc&quot; in<br>
the body of a message to <a href=3D"mailto:majordomo@vger.kernel.org">major=
domo@vger.kernel.org</a><br>
More majordomo info at =A0<a href=3D"http://vger.kernel.org/majordomo-info.=
html" target=3D"_blank">http://vger.kernel.org/majordomo-info.html</a><br>
</font></span></blockquote></div><br>

--bcaec554df7c0a81f204c0b1109f--


--===============2205931960348504256==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============2205931960348504256==--
