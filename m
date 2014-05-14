From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH v4 3/5] ARM: dts: enable hdmi for exynos5420 based peach-pit
 board
Date: Wed, 14 May 2014 21:50:44 +0200
Message-ID: <5373C914.1050909@gmail.com>
References: <1400035562-16832-1-git-send-email-rahul.sharma@samsung.com> <1400035562-16832-4-git-send-email-rahul.sharma@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ee0-f42.google.com ([74.125.83.42]:48271 "EHLO
	mail-ee0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751711AbaENTu5 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 14 May 2014 15:50:57 -0400
In-Reply-To: <1400035562-16832-4-git-send-email-rahul.sharma@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Rahul Sharma <rahul.sharma@samsung.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, inki.dae@samsung.com, joshi@samsung.com, r.sh.open@gmail.com

Hi Rahul,

On 14.05.2014 04:46, Rahul Sharma wrote:
> From: Rahul Sharma <Rahul.Sharma@samsung.com>
> 
> Enable hdmi for exynos5420 based peach-pit board.
> 
> Signed-off-by: Rahul Sharma <Rahul.Sharma@samsung.com>
> ---
>  arch/arm/boot/dts/exynos5420-peach-pit.dts |   19 +++++++++++++++++++
>  arch/arm/boot/dts/exynos5420-pinctrl.dtsi  |    7 +++++++
>  arch/arm/boot/dts/exynos5420.dtsi          |    5 +++++
>  3 files changed, 31 insertions(+)

[snip]

> diff --git a/arch/arm/boot/dts/exynos5420-pinctrl.dtsi b/arch/arm/boot/dts/exynos5420-pinctrl.dtsi
> index ba686e4..fc17797 100644
> --- a/arch/arm/boot/dts/exynos5420-pinctrl.dtsi
> +++ b/arch/arm/boot/dts/exynos5420-pinctrl.dtsi
> @@ -66,6 +66,13 @@
>  			samsung,pin-pud = <0>;
>  			samsung,pin-drv = <0>;
>  		};
> +
> +		hdmi_hpd_irq: hdmi-hpd-irq {
> +			samsung,pins = "gpx3-7";
> +			samsung,pin-function = <0>;
> +			samsung,pin-pud = <1>;
> +			samsung,pin-drv = <0>;

Same comment as for patch 1/5.

> +		};
>  	};
>  
>  	pinctrl@13410000 {
> diff --git a/arch/arm/boot/dts/exynos5420.dtsi b/arch/arm/boot/dts/exynos5420.dtsi
> index 016992c..df4422c 100644
> --- a/arch/arm/boot/dts/exynos5420.dtsi
> +++ b/arch/arm/boot/dts/exynos5420.dtsi
> @@ -648,9 +648,14 @@
>  			 <&clock CLK_MOUT_HDMI>;
>  		clock-names = "hdmi", "sclk_hdmi", "sclk_pixel",
>  			"sclk_hdmiphy", "mout_hdmi";
> +		phy = <&hdmiphy>;
>  		status = "disabled";
>  	};
>  
> +	hdmiphy: hdmiphy@145D0000 {
> +		reg = <0x145D0000 0x20>;
> +	};

Hmm, this doesn't seem like a proper device node and I don't see other
properties present in exynos5.dtsi either. Are all the necessary patches
already merged in linux-next?

Best regards,
Tomasz
