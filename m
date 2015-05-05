From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [PATCH v2] ARM: dts: exynos3250: add JPEG codec device node
Date: Wed, 06 May 2015 08:29:32 +0900
Message-ID: <5549525C.4060503@samsung.com>
References: <1430810299-23512-1-git-send-email-j.anaszewski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:18938 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751878AbbEEX3f (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 5 May 2015 19:29:35 -0400
Received: from epcpsbgr4.samsung.com
 (u144.gpu120.samsung.co.kr [203.254.230.144])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7.0.5.31.0
 64bit (built May  5 2014))
 with ESMTP id <0NNW00AMNH99E440@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 06 May 2015 08:29:34 +0900 (KST)
In-reply-to: <1430810299-23512-1-git-send-email-j.anaszewski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, Kukjin Kim <kgene@kernel.org>

Hi Jacek,

This patch don't include any patach description.
I think you better to add it.

Thanks,
Chanwoo Choi

On 05/05/2015 04:18 PM, Jacek Anaszewski wrote:
> Signed-off-by: Jacek Anaszewski <j.anaszewski@samsung.com>
> Acked-by: Kyungmin Park <kyungmin.park@samsung.com>
> Tested-by: Pankaj Dubey <pankaj.dubey@samsung.com>
> Cc: Kukjin Kim <kgene@kernel.org>
> ---
>  arch/arm/boot/dts/exynos3250.dtsi |   13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/exynos3250.dtsi b/arch/arm/boot/dts/exynos3250.dtsi
> index e3bfb11..e25088c 100644
> --- a/arch/arm/boot/dts/exynos3250.dtsi
> +++ b/arch/arm/boot/dts/exynos3250.dtsi
> @@ -243,6 +243,19 @@
>  			interrupts = <0 240 0>;
>  		};
>  
> +		jpeg: codec@11830000 {
> +			compatible = "samsung,exynos3250-jpeg";
> +			reg = <0x11830000 0x1000>;
> +			interrupts = <0 171 0>;
> +			clocks = <&cmu CLK_JPEG>, <&cmu CLK_SCLK_JPEG>;
> +			clock-names = "jpeg", "sclk";
> +			power-domains = <&pd_cam>;
> +			assigned-clocks = <&cmu CLK_MOUT_CAM_BLK>, <&cmu CLK_SCLK_JPEG>;
> +			assigned-clock-rates = <0>, <150000000>;
> +			assigned-clock-parents = <&cmu CLK_DIV_MPLL_PRE>;
> +			status = "disabled";
> +		};
> +
>  		fimd: fimd@11c00000 {
>  			compatible = "samsung,exynos3250-fimd";
>  			reg = <0x11c00000 0x30000>;
> 
