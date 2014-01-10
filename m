From: Lukasz Majewski <l.majewski@samsung.com>
Subject: Re: [PATCH 6/6] arm: dts: add cpu nodes for Exynos4210 SoC
Date: Fri, 10 Jan 2014 11:32:18 +0100
Message-ID: <20140110113218.423bc6e0@amdc2363>
References: <1389283165-17708-1-git-send-email-thomas.ab@samsung.com>
 <1389283165-17708-7-git-send-email-thomas.ab@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
In-reply-to: <1389283165-17708-7-git-send-email-thomas.ab@samsung.com>
Sender: cpufreq-owner@vger.kernel.org
To: Thomas Abraham <ta.omasab@gmail.com>
Cc: linux-samsung-soc@vger.kernel.org, cpufreq@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, t.figa@samsung.com, kgene.kim@samsung.com, viresh.kumar@linaro.org, shawn.guo@linaro.org, thomas.ab@samsung.com, Lukasz Majewski <l.majewski@majess.pl>
List-Id: linux-samsung-soc@vger.kernel.org

Hi Thomas,

> Add CPU nodes for Exynos4210 SoC and also properties required by the
> cpufreq-cpu0 driver.
> 
> Signed-off-by: Thomas Abraham <thomas.ab@samsung.com>
> ---
>  arch/arm/boot/dts/exynos4210-origen.dts         |    6 ++++++
>  arch/arm/boot/dts/exynos4210-trats.dts          |    6 ++++++
>  arch/arm/boot/dts/exynos4210-universal_c210.dts |    6 ++++++
>  arch/arm/boot/dts/exynos4210.dtsi               |   22
> ++++++++++++++++++++++ 4 files changed, 40 insertions(+), 0
> deletions(-)
> 
> diff --git a/arch/arm/boot/dts/exynos4210-origen.dts
> b/arch/arm/boot/dts/exynos4210-origen.dts index 2aa13cb..afecd8f
> 100644 --- a/arch/arm/boot/dts/exynos4210-origen.dts
> +++ b/arch/arm/boot/dts/exynos4210-origen.dts
> @@ -32,6 +32,12 @@
>  		bootargs ="root=/dev/ram0 rw ramdisk=8192
> initrd=0x41000000,8M console=ttySAC2,115200 init=/linuxrc"; };
>  
> +	cpus {
> +		cpu: cpu@0 {
> +			cpu0-supply = <&buck1_reg>;
> +		};
> +	};
> +
>  	regulators {
>  		compatible = "simple-bus";
>  		#address-cells = <1>;
> diff --git a/arch/arm/boot/dts/exynos4210-trats.dts
> b/arch/arm/boot/dts/exynos4210-trats.dts index 63cc571..25487d7 100644
> --- a/arch/arm/boot/dts/exynos4210-trats.dts
> +++ b/arch/arm/boot/dts/exynos4210-trats.dts
> @@ -30,6 +30,12 @@
>  		bootargs = "console=ttySAC2,115200N8
> root=/dev/mmcblk0p5 rootwait earlyprintk panic=5"; };
>  
> +	cpus {
> +		cpu: cpu@0 {
> +			cpu0-supply = <&varm_breg>;
> +		};
> +	};
> +
>  	regulators {
>  		compatible = "simple-bus";
>  
> diff --git a/arch/arm/boot/dts/exynos4210-universal_c210.dts
> b/arch/arm/boot/dts/exynos4210-universal_c210.dts index
> d2e3f5f..74d5a70 100644 ---
> a/arch/arm/boot/dts/exynos4210-universal_c210.dts +++
> b/arch/arm/boot/dts/exynos4210-universal_c210.dts @@ -28,6 +28,12 @@
>  		bootargs = "console=ttySAC2,115200N8
> root=/dev/mmcblk0p5 rw rootwait earlyprintk panic=5 maxcpus=1"; };
>  
> +	cpus {
> +		cpu: cpu@0 {
> +			cpu0-supply = <&vdd_arm_reg>;
> +		};
> +	};
> +
>  	mct@10050000 {
>  		compatible = "none";
>  	};
> diff --git a/arch/arm/boot/dts/exynos4210.dtsi
> b/arch/arm/boot/dts/exynos4210.dtsi index 48ecd7a..3db2da8 100644
> --- a/arch/arm/boot/dts/exynos4210.dtsi
> +++ b/arch/arm/boot/dts/exynos4210.dtsi
> @@ -36,6 +36,28 @@
>  		reg = <0x10023CA0 0x20>;
>  	};
>  
> +	cpus {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		cpu: cpu@0 {
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a9";
> +			reg = <0>;
> +			clocks = <&clock 12>;
> +			clock-names = "cpu";
> +
> +			operating-points = <
> +				200000	950000
> +				400000	975000
> +				500000	975000
> +				800000	1075000
> +				1000000	1150000
> +				1200000	1250000
> +			>;

On the ./arch/arm/boot/dts/highbank.dts the oop's order is decreasing. 

That shouldn't be a problem for the cpufreq core, however in my opinion
we shall stick to one convention.

> +			safe-opp-index = <3>;
> +		};
> +	};
> +
>  	gic: interrupt-controller@10490000 {
>  		cpu-offset = <0x8000>;
>  	};



-- 
Best regards,

Lukasz Majewski

Samsung R&D Institute Poland (SRPOL) | Linux Platform Group
