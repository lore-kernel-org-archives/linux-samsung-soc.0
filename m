From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: Re: [PATCH 1/2] ARM: dts: add watchdog device nodes for Exynos5250
 and Exynos5420
Date: Wed, 30 Oct 2013 12:20:38 +0530
Message-ID: <CAK9yfHzcDcL7EUVd2_EWoG1Qd=aqXXOh+Zb8MAB0kN1b1_cArA@mail.gmail.com>
References: <1383116025-5638-1-git-send-email-l.krishna@samsung.com>
	<1383116025-5638-2-git-send-email-l.krishna@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-oa0-f50.google.com ([209.85.219.50]:63440 "EHLO
	mail-oa0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752111Ab3J3Gui (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 30 Oct 2013 02:50:38 -0400
Received: by mail-oa0-f50.google.com with SMTP id j6so1021658oag.23
        for <linux-samsung-soc@vger.kernel.org>; Tue, 29 Oct 2013 23:50:38 -0700 (PDT)
In-Reply-To: <1383116025-5638-2-git-send-email-l.krishna@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Leela Krishna Amudala <l.krishna@samsung.com>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, Wim Van Sebroeck <wim@iguana.be>, Tomasz Figa <t.figa@samsung.com>, devicetree@vger.kernel.org, Doug Anderson <dianders@chromium.org>, linux-watchdog@vger.kernel.org, cpgs@samsung.com

Hi Leela,

On 30 October 2013 12:23, Leela Krishna Amudala <l.krishna@samsung.com> wrote:
> Adds watchdog device nodes to the DT device list for Exynos5250 and Exynos5420
>
> Signed-off-by: Leela Krishna Amudala <l.krishna@samsung.com>
> ---
>  arch/arm/boot/dts/exynos5.dtsi    |   12 +++++-------
>  arch/arm/boot/dts/exynos5250.dtsi |    7 ++++++-
>  arch/arm/boot/dts/exynos5420.dtsi |   10 ++++++++++
>  3 files changed, 21 insertions(+), 8 deletions(-)
>
> diff --git a/arch/arm/boot/dts/exynos5.dtsi b/arch/arm/boot/dts/exynos5.dtsi
> index e52b038..e7b6dbd 100644
> --- a/arch/arm/boot/dts/exynos5.dtsi
> +++ b/arch/arm/boot/dts/exynos5.dtsi
> @@ -81,13 +81,6 @@
>                 status = "disabled";
>         };
>
> -       watchdog {
> -               compatible = "samsung,s3c2410-wdt";
> -               reg = <0x101D0000 0x100>;
> -               interrupts = <0 42 0>;
> -               status = "disabled";
> -       };
> -
>         fimd@14400000 {
>                 compatible = "samsung,exynos5250-fimd";
>                 interrupt-parent = <&combiner>;
> @@ -106,4 +99,9 @@
>                 #size-cells = <0>;
>                 status = "disabled";
>         };
> +
> +       pmu_sys_reg: pmusysreg {

Make this pmusysreg@10040000.

> +               compatible = "samsung,exynos5-pmureg", "syscon";

I do not see any reference to "samsung,exynos5-pmureg" in the tree.

> +               reg = <0x10040000 0x5000>;
> +       };

Since this is a separate node, IMO it could be added in a separate patch.

>  };
> diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos5250.dtsi
> index c4a8662..3ccd150 100644
> --- a/arch/arm/boot/dts/exynos5250.dtsi
> +++ b/arch/arm/boot/dts/exynos5250.dtsi
> @@ -158,9 +158,14 @@
>                 interrupts = <0 47 0>;
>         };
>
> -       watchdog {
> +       watchdog@101D0000 {
> +               compatible = "samsung,s3c5250-wdt";

Exynos5 does not belong to S3C series. Please change this to
exynos5250-wdt instead.

> +               reg = <0x101D0000 0x100>;
> +               interrupts = <0 42 0>;
>                 clocks = <&clock 336>;
>                 clock-names = "watchdog";
> +               samsung,sysreg = <&pmu_sys_reg>;
> +               status = "okay";
>         };
>
>         g2d@10850000 {
> diff --git a/arch/arm/boot/dts/exynos5420.dtsi b/arch/arm/boot/dts/exynos5420.dtsi
> index 6ffefd1..5fb7ae2 100644
> --- a/arch/arm/boot/dts/exynos5420.dtsi
> +++ b/arch/arm/boot/dts/exynos5420.dtsi
> @@ -369,4 +369,14 @@
>                 clock-names = "gscl";
>                 samsung,power-domain = <&gsc_pd>;
>         };
> +
> +        watchdog@101D0000 {
> +               compatible = "samsung,s3c5420-wdt";

ditto

> +               reg = <0x101D0000 0x100>;
> +               interrupts = <0 42 0>;
> +               clocks = <&clock 316>;
> +               clock-names = "watchdog";
> +               samsung,sysreg = <&pmu_sys_reg>;
> +               status = "okay";
> +        };
>  };
> --
> 1.7.10.4
>



-- 
With warm regards,
Sachin
