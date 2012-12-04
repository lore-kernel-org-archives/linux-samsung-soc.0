From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: Re: [PATCH 1/3] ARM: dts: exynos5: Set up power domain for MFC and G-scaler
Date: Tue, 4 Dec 2012 14:35:13 +0530
Message-ID: <CAJuYYwSdDqjX7=CZsagjF+0fzCFdB1DiG4JXn5Dh+ZxNssQvnw@mail.gmail.com>
References: <1354018957-17752-1-git-send-email-prasanna.ps@samsung.com>
	<1354018957-17752-2-git-send-email-prasanna.ps@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ie0-f174.google.com ([209.85.223.174]:54407 "EHLO
	mail-ie0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751659Ab2LDJFO (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 4 Dec 2012 04:05:14 -0500
Received: by mail-ie0-f174.google.com with SMTP id c11so5758928ieb.19
        for <linux-samsung-soc@vger.kernel.org>; Tue, 04 Dec 2012 01:05:13 -0800 (PST)
In-Reply-To: <1354018957-17752-2-git-send-email-prasanna.ps@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Prasanna Kumar <prasanna.ps@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com

On 27 November 2012 17:52, Prasanna Kumar <prasanna.ps@samsung.com> wrote:
> From: Prasanna Kumar <prasanna.ps@samsung.com>
>
> This patch adds device tree nodes for MFC and G-scaler power domains of exynos5.
> It binds these power-domain nodes to repsective device tree nodes.
>
> Signed-off-by: Prasanna Kumar <prasanna.ps@samsung.com>

Reviewed-by: Thomas Abraham <thomas.abraham@linaro.org>

> ---
>  arch/arm/boot/dts/exynos5250.dtsi |   15 +++++++++++++++
>  1 files changed, 15 insertions(+), 0 deletions(-)
>
> diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos5250.dtsi
> index 8f46227..23f9bf1 100644
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
> @@ -578,28 +579,42 @@
>                 };
>         };
>
> +       pd_gsc: gsc-power-domain@0x10044000 {
> +               compatible = "samsung,exynos4210-pd";
> +               reg = <0x10044000 0x20>;
> +       };
> +
> +       pd_mfc: mfc-power-domain@0x10044040 {
> +               compatible = "samsung,exynos4210-pd";
> +               reg = <0x10044040 0x20>;
> +       };
> +
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
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
