From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH] ARM: dts: Exynos5420: Add dt support for gscaler
Date: Wed, 16 Oct 2013 13:52:44 +0200
Message-ID: <2359697.iZb6YQqtY2@amdc1227>
References: <1381920987-11095-1-git-send-email-l.krishna@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:32919 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1760182Ab3JPLwr (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 16 Oct 2013 07:52:47 -0400
In-reply-to: <1381920987-11095-1-git-send-email-l.krishna@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Leela Krishna Amudala <l.krishna@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, devicetree@vger.kernel.org, khw0178.kim@samsung.com, cpgs@samsung.com

Hi Leela,

On Wednesday 16 of October 2013 16:26:26 Leela Krishna Amudala wrote:
> Adds G-Scaler devices to the DT device list
> 
> Signed-off-by: Leela Krishna Amudala <l.krishna@samsung.com>
> ---
>  arch/arm/boot/dts/exynos5420.dtsi |   20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)

Now as I think of it, patch subject should be rather something like:

ARM: dts: Exynos5420: Add device nodes for GScaler blocks

because the patch alone does not have anything to do with adding device
tree support to GScaler driver.

Also please see remaining comments inline.

> diff --git a/arch/arm/boot/dts/exynos5420.dtsi b/arch/arm/boot/dts/exynos5420.dtsi
> index 09aa06c..c4210dc 100644
> --- a/arch/arm/boot/dts/exynos5420.dtsi
> +++ b/arch/arm/boot/dts/exynos5420.dtsi
> @@ -31,6 +31,8 @@
>  		i2c1 = &i2c_1;
>  		i2c2 = &i2c_2;
>  		i2c3 = &i2c_3;
> +		gsc0 = &gsc_0;
> +		gsc1 = &gsc_1;
>  	};
>  
>  	cpus {
> @@ -310,4 +312,22 @@
>  		clocks = <&clock 431>, <&clock 143>;
>  		clock-names = "mixer", "sclk_hdmi";
>  	};
> +
> +	gsc_0:  g-scaler@13e00000 {

coding style: There should be just one space after the label.

coding style 2: Please name the node simply video-scaler. Node name is not
supposed to tell what exactly the device is. The name should be mostly
used for readability, so a person reading the sources can find that this
node represents some video scaler and then by looking at compatible value
he would be able to state that it is an GScaler block compatible with this
on Exynos 5 SoCs.

Best regards,
Tomasz
