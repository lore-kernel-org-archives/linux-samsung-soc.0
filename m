From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH V3 3/7] ARM: dts: Add i2c bus 1 and it's audio codec child
 node on smdk5420
Date: Wed, 07 Aug 2013 17:11:37 +0200
Message-ID: <1407261.xRZFWoXTos@amdc1227>
References: <1375866616-5541-1-git-send-email-padma.v@samsung.com>
 <1375866616-5541-4-git-send-email-padma.v@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:40980 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755416Ab3HGPLl (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 7 Aug 2013 11:11:41 -0400
In-reply-to: <1375866616-5541-4-git-send-email-padma.v@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Padmavathi Venna <padma.v@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, padma.kvr@gmail.com, broonie@kernel.org, kgene.kim@samsung.com, tomasz.figa@gmail.com, abrestic@chromium.org

On Wednesday 07 of August 2013 14:40:12 Padmavathi Venna wrote:
> This patch adds i2c bus 1 and wm8994 codec node on i2c bus1 and the
> required regulator supplies and properties on smdk5420 board.
> 
> Signed-off-by: Padmavathi Venna <padma.v@samsung.com>
> ---
>  arch/arm/boot/dts/exynos5420-smdk5420.dts |   58
> +++++++++++++++++++++++++++++ 1 files changed, 58 insertions(+), 0
> deletions(-)
> 
> diff --git a/arch/arm/boot/dts/exynos5420-smdk5420.dts
> b/arch/arm/boot/dts/exynos5420-smdk5420.dts index d05de7a..e86c1ae
> 100644
> --- a/arch/arm/boot/dts/exynos5420-smdk5420.dts
> +++ b/arch/arm/boot/dts/exynos5420-smdk5420.dts
> @@ -68,4 +68,62 @@
>  			bus-width = <4>;
>  		};
>  	};
> +
> +	avdd2: fixed-regulator@0 {

@ suffix should be present only if reg property is present as well. 
Otherwise a suffix separated with "-" should be used, like fixed-
regulator-0.

> +		compatible = "regulator-fixed";
> +		regulator-name = "avdd2-supply";
> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <1800000>;
> +		regulator-always-on;
> +	};
> +
> +	cpvdd: fixed-regulator@1 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "cpvdd-supply";
> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <1800000>;
> +		regulator-always-on;
> +	};
> +
> +	dbvdd: fixed-regulator@2 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "dbvdd-supply";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		regulator-always-on;
> +	};
> +
> +	spkvdd: fixed-regulator@3 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "spkvdd-supply";
> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
> +		regulator-always-on;
> +	};

All these regulators should be made subnodes of a fixed-regulators node 
aggregating all fixed regulators on the board, like on following example:

	fixed-regulators {
		avdd2: fixed-regulator-0 {
			compatible = "regulator-fixed";
			regulator-name = "avdd2-supply";
			regulator-min-microvolt = <1800000>;
			regulator-max-microvolt = <1800000>;
			regulator-always-on;
		};

		cpvdd: fixed-regulator-1 {
			compatible = "regulator-fixed";
			regulator-name = "cpvdd-supply";
			regulator-min-microvolt = <1800000>;
			regulator-max-microvolt = <1800000>;
			regulator-always-on;
		};

		/* ... */
	};

Best regards,
Tomasz
