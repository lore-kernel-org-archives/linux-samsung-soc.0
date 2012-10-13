From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH v2 3/6] dts: exynos: add device tree support for exynos5 hdmiphy
Date: Sat, 13 Oct 2012 15:43:40 +0200
Message-ID: <9314340.yrVaf9SJJh@flatron>
References: <1350074555-26018-1-git-send-email-rahul.sharma@samsung.com> <1350074555-26018-4-git-send-email-rahul.sharma@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wg0-f44.google.com ([74.125.82.44]:51187 "EHLO
	mail-wg0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750925Ab2JMNnj (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 13 Oct 2012 09:43:39 -0400
Received: by mail-wg0-f44.google.com with SMTP id dr13so3197228wgb.1
        for <linux-samsung-soc@vger.kernel.org>; Sat, 13 Oct 2012 06:43:38 -0700 (PDT)
In-Reply-To: <1350074555-26018-4-git-send-email-rahul.sharma@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Rahul Sharma <rahul.sharma@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, kgene.kim@samsung.com, t.stanislaws@samsung.com, sw0312.kim@samsung.com, inki.dae@samsung.com, jy0922.shim@samsung.com, kyungmin.park@samsung.com, thomas.ab@samsung.com, prashanth.g@samsung.com, joshi@samsung.com, s.shirish@samsung.com, r.sh.open@gmail.com

On Saturday 13 of October 2012 02:12:32 Rahul Sharma wrote:
> This patch adds support for device tree based discovery for exynos5
> hdmiphy.
> 
> Signed-off-by: Rahul Sharma <rahul.sharma@samsung.com>
> ---
>  .../devicetree/bindings/drm/exynos/hdmiphy.txt     |   12 ++++++++++++
>  arch/arm/boot/dts/exynos5250-smdk5250.dts          |   10 ++++++++++
>  arch/arm/boot/dts/exynos5250.dtsi                  |    8 ++++++++
>  arch/arm/mach-exynos/mach-exynos5-dt.c             |    2 ++
>  4 files changed, 32 insertions(+), 0 deletions(-)
>  create mode 100644
> Documentation/devicetree/bindings/drm/exynos/hdmiphy.txt
> 
> diff --git a/Documentation/devicetree/bindings/drm/exynos/hdmiphy.txt
> b/Documentation/devicetree/bindings/drm/exynos/hdmiphy.txt new file
> mode 100644
> index 0000000..c4face5
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/drm/exynos/hdmiphy.txt
> @@ -0,0 +1,12 @@
> +Device-Tree bindings for hdmiphy driver
> +
> +Required properties:
> +- compatible: value should be "samsung,exynos5-hdmiphy".
> +- reg: I2C address of the hdmiphy device.
> +
> +Example:
> +
> +	hdmiphy {
> +		compatible = "samsung,exynos5-hdmiphy";
> +		reg = <0x38>;
> +	};
> \ No newline at end of file

Please put a new line at end of file.

> diff --git a/arch/arm/boot/dts/exynos5250-smdk5250.dts
> b/arch/arm/boot/dts/exynos5250-smdk5250.dts index 2a478ab..af9271c
> 100644
> --- a/arch/arm/boot/dts/exynos5250-smdk5250.dts
> +++ b/arch/arm/boot/dts/exynos5250-smdk5250.dts
> @@ -79,6 +79,16 @@
>  		status = "disabled";
>  	};
> 
> +        i2c@12CE0000 {

Wrong indentation.

> +		samsung,i2c-sda-delay = <100>;
> +		samsung,i2c-max-bus-freq = <66000>;
> +
> +		hdmiphy {

hdmiphy@38

> +			compatible = "samsung,exynos5-hdmiphy";
> +			reg = <0x38>;
> +		};
> +	};
> +

Rest of the patch looks fine.

Best regards,
Tomasz Figa
