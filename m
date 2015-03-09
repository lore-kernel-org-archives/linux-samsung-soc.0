From: Kamil Debski <k.debski@samsung.com>
Subject: RE: [PATCHv2 1/2] ARM: dts: exynos5420: add nodes for jpeg codec
Date: Mon, 09 Mar 2015 11:18:37 +0100
Message-ID: <08ce01d05a52$68bcdbd0$3a369370$%debski@samsung.com>
References: <1425637960-10687-1-git-send-email-andrzej.p@samsung.com>
 <1425637960-10687-2-git-send-email-andrzej.p@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:55435 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753348AbbCIKSl (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 9 Mar 2015 06:18:41 -0400
In-reply-to: <1425637960-10687-2-git-send-email-andrzej.p@samsung.com>
Content-language: pl
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Andrzej Pietrasiewicz <andrzej.p@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-media@vger.kernel.org
Cc: 'Kukjin Kim' <kgene@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>

Hi Andrzej,

From: linux-media-owner@vger.kernel.org [mailto:linux-media-
owner@vger.kernel.org] On Behalf Of Andrzej Pietrasiewicz
Sent: Friday, March 06, 2015 11:33 AM

Thank you for your patch.

Regardless how simple the patch is, there should be some description. In the
v2
of the patch set please add a description. One sentence should be enough.

Best wishes,
-- 
Kamil Debski
Samsung R&D Institute Poland

> Signed-off-by: Andrzej Pietrasiewicz <andrzej.p@samsung.com>
> ---
>  arch/arm/boot/dts/exynos5420.dtsi | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/exynos5420.dtsi
> b/arch/arm/boot/dts/exynos5420.dtsi
> index 73c1851..f8f583c 100644
> --- a/arch/arm/boot/dts/exynos5420.dtsi
> +++ b/arch/arm/boot/dts/exynos5420.dtsi
> @@ -775,6 +775,22 @@
>  		iommus = <&sysmmu_gscl1>;
>  	};
> 
> +	jpeg_0: jpeg@11F50000 {
> +		compatible = "samsung,exynos5420-jpeg";
> +		reg = <0x11F50000 0x1000>;
> +		interrupts = <0 89 0>;
> +		clock-names = "jpeg";
> +		clocks = <&clock CLK_JPEG>;
> +	};
> +
> +	jpeg_1: jpeg@11F60000 {
> +		compatible = "samsung,exynos5420-jpeg";
> +		reg = <0x11F60000 0x1000>;
> +		interrupts = <0 168 0>;
> +		clock-names = "jpeg";
> +		clocks = <&clock CLK_JPEG2>;
> +	};
> +
>  	pmu_system_controller: system-controller@10040000 {
>  		compatible = "samsung,exynos5420-pmu", "syscon";
>  		reg = <0x10040000 0x5000>;
> --
> 1.9.1
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-media"
> in the body of a message to majordomo@vger.kernel.org More majordomo
> info at  http://vger.kernel.org/majordomo-info.html
