From: Prasanna Kumar <prasannapadubidri@gmail.com>
Subject: Re: [PATCH v2 1/3] ARM: dts: exynos5: Set up power domain for
 MFC,G-scaler,MAU and ISP
Date: Thu, 27 Dec 2012 10:28:41 +0530
Message-ID: <CAPmaG0u17hHBdybMRXNZ3friR5yAufvboZzgaOQDG=VuByr_zA@mail.gmail.com>
References: <CAPmaG0uqkRcoUBR8Gjv_+BSJ3hwxUCz0G-YKNQX=qvx83i6QOQ@mail.gmail.com>
	<1356006378-17441-2-git-send-email-prasanna.ps@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vc0-f169.google.com ([209.85.220.169]:52036 "EHLO
	mail-vc0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750891Ab2L0E6m (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 26 Dec 2012 23:58:42 -0500
Received: by mail-vc0-f169.google.com with SMTP id gb23so9565221vcb.28
        for <linux-samsung-soc@vger.kernel.org>; Wed, 26 Dec 2012 20:58:41 -0800 (PST)
In-Reply-To: <1356006378-17441-2-git-send-email-prasanna.ps@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Prasanna Kumar <prasanna.ps@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, thomas.abraham@linaro.org

Hi all,

Any comments on this patch ?

Thanks,
Prasanna

On Thu, Dec 20, 2012 at 5:56 PM, Prasanna Kumar <prasanna.ps@samsung.com> wrote:
> This patch adds device tree nodes for MFC,G-scaler,MAU and ISP power domains
> of exynos5.It binds these power-domain nodes to repsective device tree nodes.
>
> Signed-off-by: Prasanna Kumar <prasanna.ps@samsung.com>
> ---
>  arch/arm/boot/dts/exynos5250.dtsi |   25 +++++++++++++++++++++++++
>  1 files changed, 25 insertions(+), 0 deletions(-)
>
> diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos5250.dtsi
> index 581e57a..71a37bd 100644
> --- a/arch/arm/boot/dts/exynos5250.dtsi
> +++ b/arch/arm/boot/dts/exynos5250.dtsi
> @@ -83,6 +83,7 @@
>                 compatible = "samsung,mfc-v6";
>                 reg = <0x11000000 0x10000>;
>                 interrupts = <0 96 0>;
> +               samsung,power-domain = <&pd_mfc>;
>         };
>
>         rtc {
> @@ -283,6 +284,7 @@
>                 samsung,supports-rstclr;
>                 samsung,supports-secdai;
>                 samsung,idma-addr = <0x03000000>;
> +               samsung,power-domain = <&pd_mau>;
>         };
>
>         i2s_1: i2s@12D60000 {
> @@ -578,28 +580,51 @@
>                 };
>         };
>
> +       pd_gsc: gsc-power-domain@0x10044000 {
> +               compatible = "samsung,exynos4210-pd";
> +               reg = <0x10044000 0x20>;
> +       };
> +
> +       pd_isp: isp-power-domain@0x10044020 {
> +               compatible = "samsung,exynos4210-pd";
> +               reg = <0x10044020 0x20>;
> +               };
> +
> +       pd_mfc: mfc-power-domain@0x10044040 {
> +               compatible = "samsung,exynos4210-pd";
> +               reg = <0x10044040 0x20>;
> +       };
> +
> +       pd_mau: mau-power-domain@0x100440C0 {
> +               compatible = "samsung,exynos4210-pd";
> +               reg = <0x100440C0 0x20>;
> +       };
>         gsc_0:  gsc@0x13e00000 {
>                 compatible = "samsung,exynos5-gsc";
>                 reg = <0x13e00000 0x1000>;
>                 interrupts = <0 85 0>;
> +               samsung,power-domain = <&pd_gsc>;
>         };
>
>         gsc_1:  gsc@0x13e10000 {
>                 compatible = "samsung,exynos5-gsc";
>                 reg = <0x13e10000 0x1000>;
>                 interrupts = <0 86 0>;
> +               samsung,power-domain = <&pd_gsc>;
>         };
>
>         gsc_2:  gsc@0x13e20000 {
>                 compatible = "samsung,exynos5-gsc";
>                 reg = <0x13e20000 0x1000>;
>                 interrupts = <0 87 0>;
> +               samsung,power-domain = <&pd_gsc>;
>         };
>
>         gsc_3:  gsc@0x13e30000 {
>                 compatible = "samsung,exynos5-gsc";
>                 reg = <0x13e30000 0x1000>;
>                 interrupts = <0 88 0>;
> +               samsung,power-domain = <&pd_gsc>;
>         };
>
>         hdmi {
> --
> 1.7.0.4
>
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel



-- 
Thanks
Prasanna Kumar
