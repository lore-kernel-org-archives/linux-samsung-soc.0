From: Pankaj Dubey <pankaj.dubey@samsung.com>
Subject: Re: [PATCH 4/4] Documentation: dt-bindings: Describe SROMc
 configuration
Date: Tue, 27 Oct 2015 10:41:49 +0530
Message-ID: <562F0795.10900@samsung.com>
References: <cover.1445859834.git.p.fedin@samsung.com>
 <7ac097efc649bac4e9f2b991baaa969ce4cbc3ef.1445859834.git.p.fedin@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:56820 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750949AbbJ0FLj (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 27 Oct 2015 01:11:39 -0400
Received: from epcpsbgr4.samsung.com
 (u144.gpu120.samsung.co.kr [203.254.230.144])
 by mailout2.samsung.com (Oracle Communications Messaging Server 7.0.5.31.0
 64bit (built May  5 2014))
 with ESMTP id <0NWV01FQJ53E4U60@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 27 Oct 2015 14:11:38 +0900 (KST)
In-reply-to: <7ac097efc649bac4e9f2b991baaa969ce4cbc3ef.1445859834.git.p.fedin@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Pavel Fedin <p.fedin@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Russell King <linux@arm.linux.org.uk>

Hi Pavel,

On Monday 26 October 2015 05:17 PM, Pavel Fedin wrote:
> Add documentation for new properties, allowing bank configuration.
>
> Signed-off-by: Pavel Fedin <p.fedin@samsung.com>
> ---
>   .../devicetree/bindings/arm/samsung/exynos-srom.txt   | 19 ++++++++++++++++++-
>   1 file changed, 18 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/arm/samsung/exynos-srom.txt b/Documentation/devicetree/bindings/arm/samsung/exynos-srom.txt
> index 33886d5..73750da 100644
> --- a/Documentation/devicetree/bindings/arm/samsung/exynos-srom.txt
> +++ b/Documentation/devicetree/bindings/arm/samsung/exynos-srom.txt
> @@ -5,8 +5,25 @@ Required properties:
>
>   - reg: offset and length of the register set
>
> -Example:
> +Bank configurations can be defined as an optional subnodes. They can have the
> +following properties:
> +- bank : bank number (0 - 3)
> +- width : data width in bytes (1 or 2). If omitted, default of 1 is used.
> +- srom-timing : array of 7 integers: Tacp, Tcah, Tcoh, Tacc, Tcos, Tacs
> +

I think these will be optional properties as all Exynos SoC may not be 
having these. So better to add them under "Optional Properties" heading, 
and move this above the "-Example" heading

> +Example: basic definition, no banks are configured
> +	sromc@12570000 {
> +		compatible = "samsung,exynos-srom";
> +		reg = <0x12570000 0x10>;
> +	};
> +
> +Example: SROMc with bank3 configuration
>   	sromc@12570000 {
>   		compatible = "samsung,exynos-srom";
>   		reg = <0x12570000 0x10>;
> +		bank@3 {
> +			bank = <3>;
> +			width = <2>;
> +			srom-timing = <1 9 12 1 9 1 1>;
> +		};
>   	};
>

Thanks,
Pankaj Dubey
