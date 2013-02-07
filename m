From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH 1/5] ARM: dts: exynos5250-arndale: Add node entry for
 gpio-buttons
Date: Thu, 07 Feb 2013 11:30:49 +0100
Message-ID: <8299289.2GSO3WcaG5@amdc1227>
References: <1360214129-4096-1-git-send-email-tushar.behera@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:59309 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757440Ab3BGKay (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 7 Feb 2013 05:30:54 -0500
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout2.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MHU00IKTIJGR1P0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 07 Feb 2013 19:30:53 +0900 (KST)
Received: from amdc1227.localnet ([106.116.147.199])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MHU004XSIJFHIA0@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 07 Feb 2013 19:30:52 +0900 (KST)
In-reply-to: <1360214129-4096-1-git-send-email-tushar.behera@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tushar Behera <tushar.behera@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, kgene.kim@samsung.com, patches@linaro.org, Thomas Abraham <thomas.abraham@linaro.org>

Hi,

I'm wondering why Exynos5250 has not been migrated to use pinctrl yet.

Support for it in pinctrl-samsung driver has been already merged, but I 
don't see any pinctrl nodes in exynos5250.dtsi.

This is important because the legacy gpio-samsung support is going to be 
dropped, as it already happened in case of Exynos 4.

CC'ing Thomas Abraham as he might know something.

Best regards,
-- 
Tomasz Figa
Samsung Poland R&D Center
SW Solution Development, Linux Platform

On Thursday 07 of February 2013 10:45:25 Tushar Behera wrote:
> Added GPIO buttons DT node to Arndale board file.
> 
> Signed-off-by: Tushar Behera <tushar.behera@linaro.org>
> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
> ---
> This series is based on for-next branch of Kukjin Kim's tree
> and added on top of the below patch:
> https://patchwork.kernel.org/patch/2042451/
> ---
>  arch/arm/boot/dts/exynos5250-arndale.dts |   48
> ++++++++++++++++++++++++++++++ 1 files changed, 48 insertions(+), 0
> deletions(-)
> 
> diff --git a/arch/arm/boot/dts/exynos5250-arndale.dts
> b/arch/arm/boot/dts/exynos5250-arndale.dts index 63572f9..9ce40df
> 100644
> --- a/arch/arm/boot/dts/exynos5250-arndale.dts
> +++ b/arch/arm/boot/dts/exynos5250-arndale.dts
> @@ -119,4 +119,52 @@
>  	spi_2: spi@12d40000 {
>  		status = "disabled";
>  	};
> +
> +	gpio_keys {
> +		compatible = "gpio-keys";
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		menu {
> +			label = "SW-TACT2";
> +			gpios = <&gpx1 4 0 0x10000 2>;
> +			linux,code = <139>;
> +			gpio-key,wakeup;
> +		};
> +
> +		home {
> +			label = "SW-TACT3";
> +			gpios = <&gpx1 5 0 0x10000 2>;
> +			linux,code = <102>;
> +			gpio-key,wakeup;
> +		};
> +
> +		up {
> +			label = "SW-TACT4";
> +			gpios = <&gpx1 6 0 0x10000 2>;
> +			linux,code = <103>;
> +			gpio-key,wakeup;
> +		};
> +
> +		down {
> +			label = "SW-TACT5";
> +			gpios = <&gpx1 7 0 0x10000 2>;
> +			linux,code = <108>;
> +			gpio-key,wakeup;
> +		};
> +
> +		back {
> +			label = "SW-TACT6";
> +			gpios = <&gpx2 0 0 0x10000 2>;
> +			linux,code = <158>;
> +			gpio-key,wakeup;
> +		};
> +
> +		wakeup {
> +			label = "SW-TACT7";
> +			gpios = <&gpx2 1 0 0x10000 2>;
> +			linux,code = <143>;
> +			gpio-key,wakeup;
> +		};
> +	};
>  };
