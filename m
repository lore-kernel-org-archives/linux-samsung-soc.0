From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH] arm64: dts: exynos: Fix i2s0 pins pull control for
 Exynos5433 SoCs
Date: Thu, 19 Jan 2017 22:35:09 +0200
Message-ID: <20170119203509.4uoh45kwthi7o3wb@kozik-lap>
References: <CGME20170119135856eucas1p149239f274848d61b9aa785e8497d957a@eucas1p1.samsung.com>
 <1484834310-21173-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wm0-f65.google.com ([74.125.82.65]:36828 "EHLO
        mail-wm0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751012AbdASUfW (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 19 Jan 2017 15:35:22 -0500
Received: by mail-wm0-f65.google.com with SMTP id r126so1678604wmr.3
        for <linux-samsung-soc@vger.kernel.org>; Thu, 19 Jan 2017 12:35:16 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <1484834310-21173-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, Sylwester Nawrocki <s.nawrocki@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>

On Thu, Jan 19, 2017 at 02:58:30PM +0100, Marek Szyprowski wrote:
> Common definition for I2S0 bus should not define any pull control for
> the individual I2S pins. Correct this by changing samsung,pin-pud property
> to EXYNOS_PIN_PULL_NONE like it is used for other Exynos SoCs.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  arch/arm64/boot/dts/exynos/exynos5433-pinctrl.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Makes sense. Two questions here:
1. The same for pcm0_bus?
2. This will affect the specific boards: TM2s. Do they need pull down or
   in fact you wanted to fix them as well? Usage of words "common
   definition" suggests the board might be different and in fact you are
   changing the board now.

Best regards,
Krzysztof

> diff --git a/arch/arm64/boot/dts/exynos/exynos5433-pinctrl.dtsi b/arch/arm64/boot/dts/exynos/exynos5433-pinctrl.dtsi
> index d49879bd34bb..2171ff965212 100644
> --- a/arch/arm64/boot/dts/exynos/exynos5433-pinctrl.dtsi
> +++ b/arch/arm64/boot/dts/exynos/exynos5433-pinctrl.dtsi
> @@ -135,7 +135,7 @@
>  		samsung,pins = "gpz0-0", "gpz0-1", "gpz0-2", "gpz0-3",
>  				"gpz0-4", "gpz0-5", "gpz0-6";
>  		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
> -		samsung,pin-pud = <EXYNOS_PIN_PULL_DOWN>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
>  		samsung,pin-drv = <EXYNOS5433_PIN_DRV_FAST_SR1>;
>  	};
>  
> -- 
> 1.9.1
> 
