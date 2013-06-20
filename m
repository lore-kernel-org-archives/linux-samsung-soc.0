From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH 4/5] ARM: dts: exynos5420: add hdmi hpd gpio pinctrl node
Date: Thu, 20 Jun 2013 09:09:03 +0200
Message-ID: <1441318.chG7uffeCc@flatron>
References: <1371706911-27016-1-git-send-email-rahul.sharma@samsung.com> <1371706911-27016-5-git-send-email-rahul.sharma@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-bk0-f49.google.com ([209.85.214.49]:40247 "EHLO
	mail-bk0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753619Ab3FTHJH (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 20 Jun 2013 03:09:07 -0400
Received: by mail-bk0-f49.google.com with SMTP id mz10so2693765bkb.22
        for <linux-samsung-soc@vger.kernel.org>; Thu, 20 Jun 2013 00:09:05 -0700 (PDT)
In-Reply-To: <1371706911-27016-5-git-send-email-rahul.sharma@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Rahul Sharma <rahul.sharma@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, kgene.kim@samsung.com, sw0312.kim@samsung.com, inki.dae@samsung.com, seanpaul@chromium.org, l.stach@pengutronix.de, rob.herring@calxeda.com, s.nawrocki@samsung.com, grant.likely@linaro.org, joshi@samsung.com, r.sh.open@gmail.com

Hi Rahul,

On Thursday 20 of June 2013 11:11:50 Rahul Sharma wrote:
> Add pinctrl node for hdmi-hpd gpio pin to exynos5420
> device tree files.
> 
> Signed-off-by: Rahul Sharma <rahul.sharma@samsung.com>
> ---
>  arch/arm/boot/dts/exynos5420-pinctrl.dtsi |    7 +++++++
>  arch/arm/boot/dts/exynos5420-smdk5420.dts |    2 ++
>  2 files changed, 9 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/exynos5420-pinctrl.dtsi
> b/arch/arm/boot/dts/exynos5420-pinctrl.dtsi index 5848c42..5706ad9
> 100644
> --- a/arch/arm/boot/dts/exynos5420-pinctrl.dtsi
> +++ b/arch/arm/boot/dts/exynos5420-pinctrl.dtsi
> @@ -59,6 +59,13 @@
>  			interrupt-controller;
>  			#interrupt-cells = <2>;
>  		};
> +
> +		hdmi_hpd_irq: hdmi-hpd-irq {
> +		        samsung,pins = "gpx3-7";
> +			samsung,pin-function = <0>;
> +			samsung,pin-pud = <1>;
> +			samsung,pin-drv = <0>;
> +		};

This looks like a board-specific pinconf entry. It should be specified in 
the dts of appropriate board, in this case exynos5420-smdk5420.dts .

Best regards,
Tomasz

>  	};
> 
>  	pinctrl@13410000 {
> diff --git a/arch/arm/boot/dts/exynos5420-smdk5420.dts
> b/arch/arm/boot/dts/exynos5420-smdk5420.dts index b3721bd..2d6c74f
> 100644
> --- a/arch/arm/boot/dts/exynos5420-smdk5420.dts
> +++ b/arch/arm/boot/dts/exynos5420-smdk5420.dts
> @@ -33,6 +33,8 @@
> 
>  	hdmi {
>  		hpd-gpio = <&gpx3 7 0>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&hdmi_hpd_irq>;
>  	};
> 
>  	i2c_2: i2c@12C80000 {
