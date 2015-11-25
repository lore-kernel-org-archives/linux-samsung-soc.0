From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH] ARM: dts: exynos4210: Add power domain to G2D device
Date: Thu, 26 Nov 2015 08:55:10 +0900
Message-ID: <56564A5E.4090406@samsung.com>
References: <1448456127-31842-1-git-send-email-m.szyprowski@samsung.com>
 <1448456127-31842-2-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:26699 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751198AbbKYXzM (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 25 Nov 2015 18:55:12 -0500
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout2.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0NYE00EMTAFX0J80@mailout2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 25 Nov 2015 23:55:09 +0000 (GMT)
In-reply-to: <1448456127-31842-2-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Russell King - ARM Linux <linux@arm.linux.org.uk>, Kukjin Kim <kgene@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

On 25.11.2015 21:55, Marek Szyprowski wrote:
> G2D device and it's SYSMMU belongs to LCD0 power domain on Exynos 4210,
> so add missing power-domains property to G2D device node (G2D's SYSMMU is
> already bound to LCD0 power domain).
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  arch/arm/boot/dts/exynos4210.dtsi | 1 +
>  1 file changed, 1 insertion(+)

You sent it with "in-reply-to" cover letter but without any explanation
why? Are here any dependencies on the rest of patchset? Any specific
order? This is a little bit confusing.

Best regards,
Krzysztof

> 
> diff --git a/arch/arm/boot/dts/exynos4210.dtsi b/arch/arm/boot/dts/exynos4210.dtsi
> index aac0f17..d254200 100644
> --- a/arch/arm/boot/dts/exynos4210.dtsi
> +++ b/arch/arm/boot/dts/exynos4210.dtsi
> @@ -185,6 +185,7 @@
>  		interrupts = <0 89 0>;
>  		clocks = <&clock CLK_SCLK_FIMG2D>, <&clock CLK_G2D>;
>  		clock-names = "sclk_fimg2d", "fimg2d";
> +		power-domains = <&pd_lcd0>;
>  		iommus = <&sysmmu_g2d>;
>  		status = "disabled";
>  	};
> 
