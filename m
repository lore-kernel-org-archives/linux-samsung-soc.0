From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v4 2/2] dt-bindings: mfd: max8998: Add charger subnode
 binding
Date: Wed, 26 Jun 2019 14:06:24 +0100
Message-ID: <20190626130624.GT21119@dell>
References: <20190621115602.17559-1-pawel.mikolaj.chmiel@gmail.com>
 <20190621115602.17559-3-pawel.mikolaj.chmiel@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190621115602.17559-3-pawel.mikolaj.chmiel@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: =?utf-8?B?UGF3ZcWC?= Chmiel <pawel.mikolaj.chmiel@gmail.com>
Cc: sre@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On Fri, 21 Jun 2019, Paweł Chmiel wrote:

> This patch adds devicetree bindings documentation for
> battery charging controller as the subnode of MAX8998 PMIC.

It makes sense to place this in:

 Documentation/devicetree/bindings/power/supply/

And link to it from this file using the following syntax:

 See: ../power/supply/<file>.txt

> Signed-off-by: Paweł Chmiel <pawel.mikolaj.chmiel@gmail.com>
> ---
> Changes from v3:
>   - Property prefix should be maxim, not max8998
>   - Describe what End of Charge in percent means
> 
> Changes from v2:
>   - Make charge-restart-level-microvolt optional.
>   - Make charge-timeout-hours optional.
> 
> Changes from v1:
>   - Removed unneeded Fixes tag
>   - Correct description of all charger values
>   - Added missing property unit
> ---
>  .../devicetree/bindings/mfd/max8998.txt       | 26 +++++++++++++++++++
>  1 file changed, 26 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mfd/max8998.txt b/Documentation/devicetree/bindings/mfd/max8998.txt
> index 5f2f07c09c90..368f787d6079 100644
> --- a/Documentation/devicetree/bindings/mfd/max8998.txt
> +++ b/Documentation/devicetree/bindings/mfd/max8998.txt
> @@ -48,6 +48,25 @@ Additional properties required if max8998,pmic-buck2-dvs-gpio is defined:
>  - max8998,pmic-buck2-dvs-voltage: An array of 2 voltage values in microvolts
>    for buck2 regulator that can be selected using dvs gpio.
>  
> +Charger: Configuration for battery charging controller should be added
> +inside a child node named 'charger'.
> +  Required properties:
> +  - maxim,end-of-charge-percentage: End of Charge in percent.
> +    When the charge current in constant-voltage phase drops below
> +    end-of-charge-percentage of it's start value, charging is terminated.
> +    If value equals 0, leave it unchanged. Otherwise it should be value
> +    from 10 to 45 by 5 step.
> +
> +  Optional properties:
> +  - maxim,charge-restart-threshold: Charge restart threshold in millivolts.
> +    If property is not present, this will be disabled.
> +    Valid values are: 0, 100, 150, 200. If the value equals 0, leave it
> +    unchanged.
> +
> +  - maxim,charge-timeout: Charge timeout in hours. If property is not
> +    present, this will be disabled. Valid values are: 0, 5, 6, 7.
> +    If the value equals 0, leave it unchanged.
> +
>  Regulators: All the regulators of MAX8998 to be instantiated shall be
>  listed in a child node named 'regulators'. Each regulator is represented
>  by a child node of the 'regulators' node.
> @@ -97,6 +116,13 @@ Example:
>  		max8998,pmic-buck2-dvs-gpio = <&gpx0 0 3 0 0>; /* SET3 */
>  		max8998,pmic-buck2-dvs-voltage = <1350000>, <1300000>;
>  
> +		/* Charger configuration */
> +		charger {
> +			maxim,end-of-charge-percentage = <20>;
> +			maxim,charge-restart-threshold = <100>;
> +			maxim,charge-timeout = <7>;
> +		};
> +
>  		/* Regulators to instantiate */
>  		regulators {
>  			ldo2_reg: LDO2 {

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
