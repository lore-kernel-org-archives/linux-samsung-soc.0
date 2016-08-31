From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 1/7] ARM: dts: exynos: Add missing memory node for
 Exynos5440 boards
Date: Wed, 31 Aug 2016 19:46:57 +0200
Message-ID: <20160831174657.GA19969@kozik-lap>
References: <1472645679-5696-1-git-send-email-javier@osg.samsung.com>
 <1472645679-5696-2-git-send-email-javier@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1472645679-5696-2-git-send-email-javier@osg.samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Javier Martinez Canillas <javier@osg.samsung.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Kukjin Kim <kgene@kernel.org>, linux-samsung-soc@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Krzysztof Kozlowski <krzk@kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

On Wed, Aug 31, 2016 at 02:14:33PM +0200, Javier Martinez Canillas wrote:
> The skeleton.dtsi file was removed in ARM64 for different reasons as
> explained in commit ("3ebee5a2e141 arm64: dts: kill skeleton.dtsi").
> 
> These also applies to ARM and it will also allow to get rid of the
> following DTC warnings in the future:
> 
> "Node /memory has a reg or ranges property, but no unit name"
> 
> But these boards don't have a memory node defined, so removing the
> skeleton.dtsi inclusion in exynos4.dtsi will cause a change in the
> compiled DTB. Add a dummy memory node so the compiled DTB doesn't
> change if the skeleton.dtsi is removed from exynos4.dtsi.

You mean extnos5440.dtsi?

> 
> Eventually the correct starting addresses and sizes should be used
> but I didn't find that information.
> 
> Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>
> ---
> 
>  arch/arm/boot/dts/exynos5440-sd5v1.dts    | 5 +++++
>  arch/arm/boot/dts/exynos5440-ssdk5440.dts | 5 +++++
>  2 files changed, 10 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/exynos5440-sd5v1.dts b/arch/arm/boot/dts/exynos5440-sd5v1.dts
> index a98501bab6fc..333db4ff373a 100644
> --- a/arch/arm/boot/dts/exynos5440-sd5v1.dts
> +++ b/arch/arm/boot/dts/exynos5440-sd5v1.dts
> @@ -20,6 +20,11 @@
>  		bootargs = "root=/dev/sda2 rw rootwait ignore_loglevel earlyprintk no_console_suspend mem=2048M@0x80000000 mem=6144M@0x100000000 console=ttySAC0,115200";
>  	};
>  
> +	memory {
> +		device_type = "memory";
> +		reg = <0 0>;
> +	};
> +
>  	fixed-rate-clocks {
>  		xtal {
>  			compatible = "samsung,clock-xtal";
> diff --git a/arch/arm/boot/dts/exynos5440-ssdk5440.dts b/arch/arm/boot/dts/exynos5440-ssdk5440.dts
> index 6a0d802e87c8..82fea6f94704 100644
> --- a/arch/arm/boot/dts/exynos5440-ssdk5440.dts
> +++ b/arch/arm/boot/dts/exynos5440-ssdk5440.dts
> @@ -21,6 +21,11 @@
>  		bootargs = "root=/dev/sda2 rw rootwait ignore_loglevel earlyprintk no_console_suspend mem=2048M@0x80000000 mem=6144M@0x100000000 console=ttySAC0,115200";
>  	};
>  
> +	memory {
> +		device_type = "memory";
> +		reg = <0 0>;
> +	};

This looks okay, but the default size and address cells won't be
present. Won't that be a problem?

Best regards,
Krzysztof
