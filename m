From: Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: RE: [PATCH v2 1/3] ARM: dts: exynos4210-origen: Add fixed voltage
 regulator to simple bus
Date: Mon, 30 Sep 2013 18:51:50 +0900
Message-ID: <06c001cebdc2$afb3bbe0$0f1b33a0$@org>
References: <1380277780-10903-1-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <1380277780-10903-1-git-send-email-sachin.kamat-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Content-language: ko
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: 'Sachin Kamat' <sachin.kamat-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

Sachin Kamat wrote:
> 
> This has been done for Arndale board vide commit aa3edb65
> ("ARM: dts: Put Arndale fixed voltage regulators on a simple-bus").
> Replicate here for consistency and correctness.
> 
> Signed-off-by: Sachin Kamat <sachin.kamat-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> ---
> Based on Kukjin's for-next branch.
> Changes since v1:
> * Added reg property and renamed the node
> ---
> 
>  arch/arm/boot/dts/exynos4210-origen.dts |   21 ++++++++++++++-------
>  1 file changed, 14 insertions(+), 7 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/exynos4210-origen.dts
> b/arch/arm/boot/dts/exynos4210-origen.dts
> index 6906e8a..a6d9c32 100644
> --- a/arch/arm/boot/dts/exynos4210-origen.dts
> +++ b/arch/arm/boot/dts/exynos4210-origen.dts
> @@ -32,13 +32,20 @@
>  		bootargs ="root=/dev/ram0 rw ramdisk=8192
> initrd=0x41000000,8M console=ttySAC2,115200 init=/linuxrc";
>  	};
> 
> -	mmc_reg: voltage-regulator {
> -	        compatible = "regulator-fixed";
> -		regulator-name = "VMEM_VDD_2.8V";
> -		regulator-min-microvolt = <2800000>;
> -		regulator-max-microvolt = <2800000>;
> -		gpio = <&gpx1 1 0>;
> -		enable-active-high;
> +	regulators {
> +		compatible = "simple-bus";
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		mmc_reg: regulator@0 {
> +			compatible = "regulator-fixed";
> +			reg = <0>;
> +			regulator-name = "VMEM_VDD_2.8V";
> +			regulator-min-microvolt = <2800000>;
> +			regulator-max-microvolt = <2800000>;
> +			gpio = <&gpx1 1 0>;
> +			enable-active-high;
> +		};
>  	};
> 
>  	tmu@100C0000 {
> --
> 1.7.9.5

Looks good to me but will squash with 2nd one when I apply.

Thanks,
Kukjin

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
