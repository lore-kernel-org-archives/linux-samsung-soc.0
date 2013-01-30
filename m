From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH v2 1/2] ARM: Exynos5250: Enabling samsung-usbphy driver
Date: Tue, 29 Jan 2013 21:06:22 -0800
Message-ID: <076f01cdfea7$8e752d90$ab5f88b0$@samsung.com>
References: <1358868680-5757-1-git-send-email-gautam.vivek@samsung.com>
 <1358868680-5757-2-git-send-email-gautam.vivek@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:48728 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750769Ab3A3FGb (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 30 Jan 2013 00:06:31 -0500
In-reply-to: <1358868680-5757-2-git-send-email-gautam.vivek@samsung.com>
Content-language: en-us
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Vivek Gautam' <gautam.vivek@samsung.com>, linux-samsung-soc@vger.kernel.org
Cc: devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, grant.likely@secretlab.ca, dianders@chromium.org, balbi@ti.com, thomas.abraham@linaro.org, sylvester.nawrocki@gmail.com, tomasz.figa@gmail.com, p.paneri@samsung.com

Vivek Gautam wrote:
> 
> Adding usbphy node for Exynos5250 along with the
> necessary device data to be parsed.
> 
> Signed-off-by: Vivek Gautam <gautam.vivek@samsung.com>
> ---
>  arch/arm/boot/dts/exynos5250.dtsi |   15 +++++++++++++++
>  1 files changed, 15 insertions(+), 0 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/exynos5250.dtsi
> b/arch/arm/boot/dts/exynos5250.dtsi
> index 30485de..610e338 100644
> --- a/arch/arm/boot/dts/exynos5250.dtsi
> +++ b/arch/arm/boot/dts/exynos5250.dtsi
> @@ -275,6 +275,21 @@
>  		#size-cells = <0>;
>  	};
> 
> +	usbphy@12130000 {

Please put above node by order of address.

> +		compatible = "samsung,exynos5250-usbphy";
> +		reg = <0x12130000 0x100>;
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		ranges;
> +
> +		usbphy-sys {
> +			      /* USB device and host PHY_CONTROL registers
*/

Please add the binding documentation instead of comment here.

> +			reg = <0x10040704 0x8>,
> +			      /* USB2.0 PHY configuration register */
> +			      <0x10050230 0x4>;
> +		};
> +	};
> +
>  	amba {
>  		#address-cells = <1>;
>  		#size-cells = <1>;
> --
> 1.7.6.5
