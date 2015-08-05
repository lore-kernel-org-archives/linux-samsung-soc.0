From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: Re: [PATCH 2/2] ARM: dts: Fix power off method on
 exynos5422-odroidxu3
Date: Wed, 5 Aug 2015 12:54:30 +0200
Message-ID: <55C1EB66.4030706@osg.samsung.com>
References: <1438605447-6836-1-git-send-email-k.kozlowski.k@gmail.com>
 <1438605447-6836-3-git-send-email-k.kozlowski.k@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from lists.s-osg.org ([54.187.51.154]:56114 "EHLO lists.s-osg.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752627AbbHEKyg (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 5 Aug 2015 06:54:36 -0400
In-Reply-To: <1438605447-6836-3-git-send-email-k.kozlowski.k@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski.k@gmail.com>, Sangbeom Kim <sbkim73@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Lee Jones <lee.jones@linaro.org>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, Kukjin Kim <kgene@kernel.org>, linux-arm-kernel@lists.infradead.org
Cc: Anand Moon <linux.amoon@gmail.com>

Hello Krzysztof,

On 08/03/2015 02:37 PM, Krzysztof Kozlowski wrote:
> The Odroid XU3 family boards have ACOKB pin of PMIC grounded, instead of
> pulled up as usual. This means that PMIC must manually set PWRHOLD field
> in its CTRL1 register to low before initiating power down.
> 
> This fixes Odroid XU3 powering off:
> [   25.966053] reboot: Power down
> [   25.967679] Power down.
> [   26.070174] Power down failed, please power off system manually.
> 
> Signed-off-by: Krzysztof Kozlowski <k.kozlowski.k@gmail.com>
> Reported-by: Anand Moon <linux.amoon@gmail.com>
> ---
>  arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi b/arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi
> index 1565667e6f69..48cecc8cf26e 100644
> --- a/arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi
> +++ b/arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi
> @@ -159,6 +159,7 @@
>  		s2mps11,buck2-ramp-enable = <1>;
>  		s2mps11,buck3-ramp-enable = <1>;
>  		s2mps11,buck4-ramp-enable = <1>;
> +		samsung,s2mps11-acokb-ground;
>  
>  		interrupt-parent = <&gpx0>;
>  		interrupts = <4 IRQ_TYPE_EDGE_FALLING>;
> 

Reviewed-by: Javier Martinez Canillas <javier@osg.samsung.com>

Best regards,
-- 
Javier Martinez Canillas
Open Source Group
Samsung Research America
