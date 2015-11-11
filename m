From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH] ARM: dts: exynos5422-odroid*: remove fimd node
Date: Wed, 11 Nov 2015 09:43:32 +0900
Message-ID: <56428F34.7060003@samsung.com>
References: <1447151049-25370-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:31459 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751762AbbKKAnf (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 10 Nov 2015 19:43:35 -0500
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout4.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0NXM00KQ9KOLDN60@mailout4.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 11 Nov 2015 00:43:33 +0000 (GMT)
In-reply-to: <1447151049-25370-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>, linux-samsung-soc@vger.kernel.org
Cc: Kukjin Kim <kgene@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

On 10.11.2015 19:24, Marek Szyprowski wrote:
> FIMD device is not used at all on Exynos5422-based Odroid XU3-lite and
> XU4. XU3 board teorethically can support FIMD with DisplayPort

s/teorethically/theoretically/

> connector, but due to hw limitation/design it doesn't work in most
> cases. It is also not even enabled in XU3 dts file.
> 
> FIMD node was enabled mainly due to limitation of early Exynos DRM
> driver, which didn't initialize properly when no FIMD device was
> available. This node can be now safetly removed from XU3-common dtsi and

s/safetly/safely/

> added layer to Odroid XU3 dts, when Display Port driver gets enabled.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi | 5 -----
>  1 file changed, 5 deletions(-)

Tested on Odroid XU4 board (HDMI, IOMMU enabled):

Tested-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>


No need for respin, the changelog fixes above can be done during applying.


BTW, do you know why we don't have EXYNOS_IOMMU enabled in defconfig?
Any reasons against?

Best regards,
Krzysztof


> diff --git a/arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi b/arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi
> index 1af5bdc..9134217 100644
> --- a/arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi
> +++ b/arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi
> @@ -67,11 +67,6 @@
>  			<19200000>;
>  };
>  
> -&fimd {
> -	status = "okay";
> -};
> -
> -
>  &hdmi {
>  	status = "okay";
>  	hpd-gpio = <&gpx3 7 GPIO_ACTIVE_HIGH>;
> 
