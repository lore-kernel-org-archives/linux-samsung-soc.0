From: Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/4] arm: dts: exynos: add exynos5420 cpu
 capacity-dmips-mhz information
Date: Wed, 30 Aug 2017 22:26:50 +0200
Message-ID: <20170830202650.mdlxy2c3uwuq5vde@kozik-lap>
References: <20170830144120.9312-1-dietmar.eggemann@arm.com>
 <20170830144120.9312-3-dietmar.eggemann@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170830144120.9312-3-dietmar.eggemann-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dietmar Eggemann <dietmar.eggemann-5wv7dgnIgG8@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Vincent Guittot <vincent.guittot-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Juri Lelli <juri.lelli-5wv7dgnIgG8@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

On Wed, Aug 30, 2017 at 03:41:18PM +0100, Dietmar Eggemann wrote:
> The following 'capacity-dmips-mhz' dt property values are used:
> 
> Cortex-A15: 1024, Cortex-A7: 539
> 
> They have been derived from the cpu_efficiency values:
> 
> Cortex-A15: 3891, Cortex-A7: 2048
> 
> by scaling them so that the Cortex-A15s (big cores) use 1024.
> 
> The cpu_efficiency values were originally derived from the "Big.LITTLE
> Processing with ARM Cortex™-A15 & Cortex-A7" white paper
> (http://www.cl.cam.ac.uk/~rdm34/big.LITTLE.pdf). Table 1 lists 1.9x
> (3891/2048) as the Cortex-A15 vs Cortex-A7 performance ratio for the
> Dhrystone benchmark.
> 
> The following platforms are affected once cpu-invariant accounting
> support is re-connected to the task scheduler:
> 
> arndale-octa, peach-pi, peach-pit, smdk5420
> 
> The patch has been tested on Samsung Chromebook 2 13" (peach-pi, Exynos
> 5800).
> 
> $ cat /sys/devices/system/cpu/cpu*/cpu_capacity
> 1024
> 1024
> 1024
> 1024
> 389
> 389
> 389
> 389

I am missing something... shouldn't this be 539? Or is it scaled with
the clock-frequency (1 GHz) value?


Best regards,
Krzysztof


> 
> The Cortex-A15 vs Cortex-A7 performance ratio is 1024/389 = 2.63.
> 
> The values derived with the 'cpu_efficiency/clock-frequency dt property'
> solution are:
> 
> $ cat /sys/devices/system/cpu/cpu*/cpu_capacity
> 1535
> 1535
> 1535
> 1535
> 448
> 448
> 448
> 448
> 
> The Cortex-A15 vs Cortex-A7 performance ratio is 1535/448 = 3.43.
> 
> The discrepancy between 2.63 and 3.43 is due to the false assumption
> when using the 'cpu_efficiency/clock-frequency dt property' solution
> that the max cpu frequency of the little cpus is 1 GHZ and not 1.3 GHz.
> The Cortex-A7 cluster runs with a max cpu frequency of 1.3 GHZ whereas
> the 'clock-frequency' property value is set to 1 GHz.
> 
> 3.43/1.3 = 2.64
> 
> $ cat /sys/devices/system/cpu/cpu*/cpufreq/scaling_max_freq
> 1800000
> 1800000
> 1800000
> 1800000
> 1300000 <-- max cpu frequency of the Cortex-A7s (little cores)
> 1300000
> 1300000
> 1300000
> 
> Running another benchmark (single-threaded sysbench affine to the
> individual cpus) with performance cpufreq governor on the Samsung
> Chromebook 2 13" showed the following numbers:
> 
> $ for i in `seq 0 7`; do taskset -c $i sysbench --test=cpu
>   --num-threads=1 --max-time=10 run | grep "total number of events:";
>   done
> 
> total number of events: 1083
> total number of events: 1085
> total number of events: 1085
> total number of events: 1085
> total number of events: 454
> total number of events: 454
> total number of events: 454
> total number of events: 454
> 
> The Cortex-A15 vs Cortex-A7 performance ratio is 2.39, i.e. very close
> to the one derived from the Dhrystone based one of the "Big.LITTLE
> Processing with ARM Cortex™-A15 & Cortex-A7" white paper (2.63).
> 
> We don't aim for exact values for the cpu capacity values. Besides the
> CPI (Cycles Per Instruction), the instruction mix and whether the system
> runs cpu-bound or memory-bound has an impact on the cpu capacity values
> derived from these benchmark results.
> 
> Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
> Cc: Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>
> Cc: Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> Cc: Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> Signed-off-by: Dietmar Eggemann <dietmar.eggemann-5wv7dgnIgG8@public.gmane.org>
> ---
>  arch/arm/boot/dts/exynos5420-cpus.dtsi | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/exynos5420-cpus.dtsi b/arch/arm/boot/dts/exynos5420-cpus.dtsi
> index 5c052d7ff554..d7d703aa1699 100644
> --- a/arch/arm/boot/dts/exynos5420-cpus.dtsi
> +++ b/arch/arm/boot/dts/exynos5420-cpus.dtsi
> @@ -36,6 +36,7 @@
>  			cooling-min-level = <0>;
>  			cooling-max-level = <11>;
>  			#cooling-cells = <2>; /* min followed by max */
> +			capacity-dmips-mhz = <1024>;
>  		};
>  
>  		cpu1: cpu@1 {
> @@ -48,6 +49,7 @@
>  			cooling-min-level = <0>;
>  			cooling-max-level = <11>;
>  			#cooling-cells = <2>; /* min followed by max */
> +			capacity-dmips-mhz = <1024>;
>  		};
>  
>  		cpu2: cpu@2 {
> @@ -60,6 +62,7 @@
>  			cooling-min-level = <0>;
>  			cooling-max-level = <11>;
>  			#cooling-cells = <2>; /* min followed by max */
> +			capacity-dmips-mhz = <1024>;
>  		};
>  
>  		cpu3: cpu@3 {
> @@ -72,6 +75,7 @@
>  			cooling-min-level = <0>;
>  			cooling-max-level = <11>;
>  			#cooling-cells = <2>; /* min followed by max */
> +			capacity-dmips-mhz = <1024>;
>  		};
>  
>  		cpu4: cpu@100 {
> @@ -85,6 +89,7 @@
>  			cooling-min-level = <0>;
>  			cooling-max-level = <7>;
>  			#cooling-cells = <2>; /* min followed by max */
> +			capacity-dmips-mhz = <539>;
>  		};
>  
>  		cpu5: cpu@101 {
> @@ -97,6 +102,7 @@
>  			cooling-min-level = <0>;
>  			cooling-max-level = <7>;
>  			#cooling-cells = <2>; /* min followed by max */
> +			capacity-dmips-mhz = <539>;
>  		};
>  
>  		cpu6: cpu@102 {
> @@ -109,6 +115,7 @@
>  			cooling-min-level = <0>;
>  			cooling-max-level = <7>;
>  			#cooling-cells = <2>; /* min followed by max */
> +			capacity-dmips-mhz = <539>;
>  		};
>  
>  		cpu7: cpu@103 {
> @@ -121,6 +128,7 @@
>  			cooling-min-level = <0>;
>  			cooling-max-level = <7>;
>  			#cooling-cells = <2>; /* min followed by max */
> +			capacity-dmips-mhz = <539>;
>  		};
>  	};
>  };
> -- 
> 2.11.0
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
