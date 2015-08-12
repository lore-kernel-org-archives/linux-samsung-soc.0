From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: Re: [PATCH] ARM: dts: exynos4*: add iommu property to JPEG device
Date: Wed, 12 Aug 2015 12:14:45 +0200
Message-ID: <55CB1C95.8020309@osg.samsung.com>
References: <1439372399-20033-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from lists.s-osg.org ([54.187.51.154]:57318 "EHLO lists.s-osg.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754877AbbHLKOu (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 12 Aug 2015 06:14:50 -0400
In-Reply-To: <1439372399-20033-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>, linux-samsung-soc@vger.kernel.org
Cc: Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>

Hello Marek,

On 08/12/2015 11:39 AM, Marek Szyprowski wrote:
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
> 

Looks good to me.

Reviewed-by: Javier Martinez Canillas <javier@osg.samsung.com>

Best regards,
-- 
Javier Martinez Canillas
Open Source Group
Samsung Research America
