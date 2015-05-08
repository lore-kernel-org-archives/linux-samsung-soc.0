From: Kukjin Kim <kgene@kernel.org>
Subject: Re: [PATCH v2] ARM: dts: exynos3250: add JPEG codec device node
Date: Sat, 09 May 2015 02:25:33 +0900
Message-ID: <554CF18D.4010903@kernel.org>
References: <1430810299-23512-1-git-send-email-j.anaszewski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.136]:45431 "EHLO mail.kernel.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932068AbbEHRZo (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 8 May 2015 13:25:44 -0400
In-Reply-To: <1430810299-23512-1-git-send-email-j.anaszewski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, Kukjin Kim <kgene@kernel.org>

On 05/05/15 16:18, Jacek Anaszewski wrote:
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

Applied, thanks.

- Kukjin
