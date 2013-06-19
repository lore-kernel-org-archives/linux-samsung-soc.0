From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [PATCH v3 3/3] ARM/dts: change compatible strings for hdmi subsystem
Date: Wed, 19 Jun 2013 22:50:34 +0900
Message-ID: <51C1B72A.6080801@samsung.com>
References: <1371646269-21880-1-git-send-email-rahul.sharma@samsung.com> <1371646269-21880-4-git-send-email-rahul.sharma@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f44.google.com ([209.85.220.44]:61640 "EHLO
	mail-pa0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756520Ab3FSNun (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 19 Jun 2013 09:50:43 -0400
Received: by mail-pa0-f44.google.com with SMTP id lj1so5196366pab.17
        for <linux-samsung-soc@vger.kernel.org>; Wed, 19 Jun 2013 06:50:43 -0700 (PDT)
In-Reply-To: <1371646269-21880-4-git-send-email-rahul.sharma@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Rahul Sharma <rahul.sharma@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, dri-devel@lists.freedesktop.org, kgene.kim@samsung.com, sw0312.kim@samsung.com, inki.dae@samsung.com, seanpaul@chromium.org, l.stach@pengutronix.de, tomasz.figa@gmail.com, rob.herring@calxeda.com, s.nawrocki@samsung.com, grant.likely@linaro.org, joshi@samsung.com, r.sh.open@gmail.com

On 06/19/13 21:51, Rahul Sharma wrote:
> This patch renames the combatible strings for hdmi, mixer, ddc
> and hdmiphy. It follows the convention of using compatible string
> which represent the SoC in which the IP was added for the first
> time.
>
> Signed-off-by: Rahul Sharma<rahul.sharma@samsung.com>

Acked-by: Kukjin Kim <kgene.kim@samsung.com>

- Kukjin

> ---
>   arch/arm/boot/dts/cros5250-common.dtsi    |    4 ++--
>   arch/arm/boot/dts/exynos5250-smdk5250.dts |    4 ++--
>   arch/arm/boot/dts/exynos5250.dtsi         |    4 ++--
>   3 files changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/arch/arm/boot/dts/cros5250-common.dtsi b/arch/arm/boot/dts/cros5250-common.dtsi
> index 3f0239e..dc259e8b 100644
> --- a/arch/arm/boot/dts/cros5250-common.dtsi
> +++ b/arch/arm/boot/dts/cros5250-common.dtsi
> @@ -190,7 +190,7 @@
>   		samsung,i2c-max-bus-freq =<66000>;
>
>   		hdmiddc@50 {
> -			compatible = "samsung,exynos5-hdmiddc";
> +			compatible = "samsung,exynos4210-hdmiddc";
>   			reg =<0x50>;
>   		};
>   	};
> @@ -224,7 +224,7 @@
>   		samsung,i2c-max-bus-freq =<378000>;
>
>   		hdmiphy@38 {
> -			compatible = "samsung,exynos5-hdmiphy";
> +			compatible = "samsung,exynos4212-hdmiphy";
>   			reg =<0x38>;
>   		};
>   	};
> diff --git a/arch/arm/boot/dts/exynos5250-smdk5250.dts b/arch/arm/boot/dts/exynos5250-smdk5250.dts
> index 3e0c792..f320d7c 100644
> --- a/arch/arm/boot/dts/exynos5250-smdk5250.dts
> +++ b/arch/arm/boot/dts/exynos5250-smdk5250.dts
> @@ -72,7 +72,7 @@
>   		samsung,i2c-max-bus-freq =<66000>;
>
>   		hdmiddc@50 {
> -			compatible = "samsung,exynos5-hdmiddc";
> +			compatible = "samsung,exynos4210-hdmiddc";
>   			reg =<0x50>;
>   		};
>   	};
> @@ -102,7 +102,7 @@
>   		samsung,i2c-max-bus-freq =<66000>;
>
>   		hdmiphy@38 {
> -			compatible = "samsung,exynos5-hdmiphy";
> +			compatible = "samsung,exynos4212-hdmiphy";
>   			reg =<0x38>;
>   		};
>   	};
> diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos5250.dtsi
> index 0673524..2f7763b 100644
> --- a/arch/arm/boot/dts/exynos5250.dtsi
> +++ b/arch/arm/boot/dts/exynos5250.dtsi
> @@ -601,7 +601,7 @@
>   	};
>
>   	hdmi {
> -		compatible = "samsung,exynos5-hdmi";
> +		compatible = "samsung,exynos4212-hdmi";
>   		reg =<0x14530000 0x70000>;
>   		interrupts =<0 95 0>;
>   		clocks =<&clock 333>,<&clock 136>,<&clock 137>,
> @@ -611,7 +611,7 @@
>   	};
>
>   	mixer {
> -		compatible = "samsung,exynos5-mixer";
> +		compatible = "samsung,exynos5250-mixer";
>   		reg =<0x14450000 0x10000>;
>   		interrupts =<0 94 0>;
>   	};
