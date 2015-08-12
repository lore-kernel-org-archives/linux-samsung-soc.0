From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH] ARM: dts: exynos4*: add iommu property to JPEG device
Date: Thu, 13 Aug 2015 08:57:20 +0900
Message-ID: <55CBDD60.6010207@samsung.com>
References: <1439372399-20033-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:8409 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751169AbbHLX5Y (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 12 Aug 2015 19:57:24 -0400
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout2.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0NSZ00AMGUJJ4Z10@mailout2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 13 Aug 2015 00:57:19 +0100 (BST)
In-reply-to: <1439372399-20033-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>, linux-samsung-soc@vger.kernel.org
Cc: Kukjin Kim <kgene@kernel.org>

On 12.08.2015 18:39, Marek Szyprowski wrote:
> JPEG codec node has been added in parallel to the patch, which added
> support for IOMMU to Exynos platform, so JPEG device for Exynos4 series
> lacked IOMMU property. This patch fixes this issue.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  arch/arm/boot/dts/exynos4.dtsi | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm/boot/dts/exynos4.dtsi b/arch/arm/boot/dts/exynos4.dtsi
> index b0d52b1..98c0a36 100644
> --- a/arch/arm/boot/dts/exynos4.dtsi
> +++ b/arch/arm/boot/dts/exynos4.dtsi
> @@ -702,6 +702,7 @@
>  		clocks = <&clock CLK_JPEG>;
>  		clock-names = "jpeg";
>  		power-domains = <&pd_cam>;
> +		iommus = <&sysmmu_jpeg>;
>  	};
>  
>  	hdmi: hdmi@12D00000 {


Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

Best regards,
Krzysztof
