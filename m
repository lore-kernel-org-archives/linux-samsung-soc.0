From: "Kumar, Anil" <anilkumar.v@ti.com>
Subject: RE: [PATCH 1/5] ARM: dts: exynos5250-arndale: Add node entry for
 gpio-buttons
Date: Thu, 7 Feb 2013 06:17:05 +0000
Message-ID: <F3DBB1B3EF102E4994C89758CFCA32412C4E1A@DBDE01.ent.ti.com>
References: <1360214129-4096-1-git-send-email-tushar.behera@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from bear.ext.ti.com ([192.94.94.41]:38575 "EHLO bear.ext.ti.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750759Ab3BGGRX convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 7 Feb 2013 01:17:23 -0500
In-Reply-To: <1360214129-4096-1-git-send-email-tushar.behera@linaro.org>
Content-Language: en-US
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tushar Behera <tushar.behera@linaro.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>
Cc: "kgene.kim@samsung.com" <kgene.kim@samsung.com>, "patches@linaro.org" <patches@linaro.org>

On Thu, Feb 07, 2013 at 10:45:25, Tushar Behera wrote:
> Added GPIO buttons DT node to Arndale board file.
> 
> Signed-off-by: Tushar Behera <tushar.behera@linaro.org>
> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
> ---
> This series is based on for-next branch of Kukjin Kim's tree
> and added on top of the below patch:
> https://patchwork.kernel.org/patch/2042451/
> ---
>  arch/arm/boot/dts/exynos5250-arndale.dts |   48 ++++++++++++++++++++++++++++++
>  1 files changed, 48 insertions(+), 0 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/exynos5250-arndale.dts b/arch/arm/boot/dts/exynos5250-arndale.dts
> index 63572f9..9ce40df 100644
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

Just want to understand why these properties are here?  
As these properties are for child dt node. But have not seen
anyone is using here.

Sorry if I have misunderstood. 

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
> -- 
> 1.7.4.1
> 
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
> 
