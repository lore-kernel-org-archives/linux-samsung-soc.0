From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [PATCH v2] ARM: dts: exynos5420: fix wrong clock binding for
 sysmmu_fimd1_1
Date: Wed, 23 Sep 2015 10:43:53 +0200
Message-ID: <56026649.4050802@samsung.com>
References: <1442994115-20167-1-git-send-email-jy0922.shim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:63901 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753153AbbIWIn5 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 23 Sep 2015 04:43:57 -0400
In-reply-to: <1442994115-20167-1-git-send-email-jy0922.shim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Joonyoung Shim <jy0922.shim@samsung.com>, linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, stable@vger.kernel.org, k.kozlowski@samsung.com, kgene@kernel.org, javier@osg.samsung.com

Hello,

On 2015-09-23 09:41, Joonyoung Shim wrote:
> The sysmmu_fimd1_1 should bind the clock CLK_SMMU_FIMD1M1, not the clock
> CLK_SMMU_FIMD1M0. CLK_SMMU_FIMD1M0 is a clock for the sysmmu_fimd1_0.
>
> This wrong clock binding causes the problem that is blocked in iommu_map
> function when IOMMU is enabled and exynos-drm driver tries to allocate
> buffer via DMA mapping API on Odroid-XU3 board.
>
> Fixes: b70045167815 ("ARM: dts: add sysmmu nodes for exynos5420")
> Signed-off-by: Joonyoung Shim <jy0922.shim@samsung.com>
> Cc: <stable@vger.kernel.org> # v4.2
> Reviewed-by: Javier Martinez Canillas <javier@osg.samsung.com>

Acked-by: Marek Szyprowski <m.szyprowski@samsung.com>

> ---
> Changes for v2:
> - Update the commit message
> - Add Fixes: and Reviewed-by: tags
>
>   arch/arm/boot/dts/exynos5420.dtsi | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm/boot/dts/exynos5420.dtsi b/arch/arm/boot/dts/exynos5420.dtsi
> index df9aee9..1b3d6c7 100644
> --- a/arch/arm/boot/dts/exynos5420.dtsi
> +++ b/arch/arm/boot/dts/exynos5420.dtsi
> @@ -1117,7 +1117,7 @@
>   		interrupt-parent = <&combiner>;
>   		interrupts = <3 0>;
>   		clock-names = "sysmmu", "master";
> -		clocks = <&clock CLK_SMMU_FIMD1M0>, <&clock CLK_FIMD1>;
> +		clocks = <&clock CLK_SMMU_FIMD1M1>, <&clock CLK_FIMD1>;
>   		power-domains = <&disp_pd>;
>   		#iommu-cells = <0>;
>   	};

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland
