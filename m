From: Jingoo Han <jg1.han@samsung.com>
Subject: Re: [PATCH 2/4] ARM: dts: exynos4: Add node for hsotg
Date: Wed, 26 Jun 2013 16:26:54 +0900
Message-ID: <001501ce723e$88b6c020$9a244060$@samsung.com>
References: <1372174706-5459-1-git-send-email-t.figa@samsung.com>
 <1372174706-5459-3-git-send-email-t.figa@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:63284 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751368Ab3FZH05 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 26 Jun 2013 03:26:57 -0400
In-reply-to: <1372174706-5459-3-git-send-email-t.figa@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Tomasz Figa' <t.figa@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 'Kukjin Kim' <kgene.kim@samsung.com>, devicetree-discuss@lists.ozlabs.org, 'Felipe Balbi' <balbi@ti.com>, 'Grant Likely' <grant.likely@linaro.org>, 'Greg Kroah-Hartman' <gregkh@linuxfoundation.org>, 'Linus Walleij' <linus.walleij@linaro.org>, linux-usb@vger.kernel.org, 'Rob Herring' <rob.herring@calxeda.com>, 'Sylwester Nawrocki' <s.nawrocki@samsung.com>, 'Thomas Abraham' <thomas.abraham@linaro.org>, m.szyprowski@samsung.com, l.majewski@samsung.com, 'Kyungmin Park' <kyungmin.park@samsung.com>, Jingoo Han <jg1.han@samsung.com>

On Wednesday, June 26, 2013 12:38 AM, Tomasz Figa wrote:
> 
> This patch adds device tree node for USB HSOTG controller present on
> Exynos4 SoCs.
> 
> Signed-off-by: Tomasz Figa <t.figa@samsung.com>
> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>

It looks good.

Reviewed-by: Jingoo Han <jg1.han@samsung.com>

Best regards,
Jingoo Han

> ---
>  arch/arm/boot/dts/exynos4.dtsi | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/exynos4.dtsi b/arch/arm/boot/dts/exynos4.dtsi
> index 359694c..d53b9da 100644
> --- a/arch/arm/boot/dts/exynos4.dtsi
> +++ b/arch/arm/boot/dts/exynos4.dtsi
> @@ -119,6 +119,15 @@
>  		status = "disabled";
>  	};
> 
> +	hsotg@12480000 {
> +		compatible = "samsung,s3c6400-hsotg";
> +		reg = <0x12480000 0x20000>;
> +		interrupts = <0 71 0>;
> +		clocks = <&clock 305>;
> +		clock-names = "otg";
> +		status = "disabled";
> +	};
> +
>  	sdhci@12510000 {
>  		compatible = "samsung,exynos4210-sdhci";
>  		reg = <0x12510000 0x100>;
> --
> 1.8.2.1
> 
