From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [PATCH 4/4] ARM: dts: exynos5420: add audio clock controller
Date: Mon, 19 Aug 2013 04:54:41 +0900
Message-ID: <52112681.7060808@samsung.com>
References: <1373458313-18970-1-git-send-email-padma.v@samsung.com> <1373458313-18970-5-git-send-email-padma.v@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f173.google.com ([209.85.192.173]:61976 "EHLO
	mail-pd0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754687Ab3HRTyq (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 18 Aug 2013 15:54:46 -0400
Received: by mail-pd0-f173.google.com with SMTP id p10so4200433pdj.4
        for <linux-samsung-soc@vger.kernel.org>; Sun, 18 Aug 2013 12:54:46 -0700 (PDT)
In-Reply-To: <1373458313-18970-5-git-send-email-padma.v@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Padmavathi Venna <padma.v@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, alsa-devel@alsa-project.org, padma.kvr@gmail.com, sbkim73@samsung.com, broonie@kernel.org, kgene.kim@samsung.com, mturquette@linaro.org, dianders@chromium.org, abrestic@chromium.org

On 07/10/13 21:11, Padmavathi Venna wrote:
> From: Andrew Bresticker<abrestic@chromium.org>
>
> This adds device-tree bindings for the audio subsystem clock controller
> on Exynos 5420.
>
> Signed-off-by: Andrew Bresticker<abrestic@chromium.org>
> Reviewed-on: https://gerrit.chromium.org/gerrit/57712
> Reviewed-by: Simon Glass<sjg@chromium.org>
> Signed-off-by: Padmavathi Venna<padma.v@samsung.com>
> ---
>   arch/arm/boot/dts/exynos5420.dtsi |   11 +++++++++++
>   1 files changed, 11 insertions(+), 0 deletions(-)
>
> diff --git a/arch/arm/boot/dts/exynos5420.dtsi b/arch/arm/boot/dts/exynos5420.dtsi
> index da55160..a84f5f1 100644
> --- a/arch/arm/boot/dts/exynos5420.dtsi
> +++ b/arch/arm/boot/dts/exynos5420.dtsi
> @@ -15,6 +15,9 @@
>
>   #include "exynos5.dtsi"
>   #include "exynos5420-pinctrl.dtsi"
> +
> +#include<dt-bindings/clk/exynos-audss-clk.h>
> +
>   / {
>   	compatible = "samsung,exynos5420";
>
> @@ -65,6 +68,14 @@
>   		#clock-cells =<1>;
>   	};
>
> +	clock_audss: audss-clock-controller@3810000 {
> +		compatible = "samsung,exynos5420-audss-clock";
> +		reg =<0x03810000 0x0C>;
> +		#clock-cells =<1>;
> +		clocks =<&clock 148>;
> +		clock-names = "sclk_audio";
> +	};
> +
>   	mct@101C0000 {
>   		compatible = "samsung,exynos4210-mct";
>   		reg =<0x101C0000 0x800>;

Applied, thanks.

- Kukjin
