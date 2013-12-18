From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH v2] ARM: dts: Add regulator entries to Exynos5420 SMDK board
Date: Wed, 18 Dec 2013 16:18:22 +0100
Message-ID: <1476645.Pay9pLa8zo@amdc1227>
References: <1386236664-27763-1-git-send-email-sachin.kamat@linaro.org>
 <52A635BF.9030102@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:16801 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755111Ab3LRPSj (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 18 Dec 2013 10:18:39 -0500
In-reply-to: <52A635BF.9030102@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: Sachin Kamat <sachin.kamat@linaro.org>, linux-samsung-soc@vger.kernel.org, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>

Hi Kukjin,

On Tuesday 10 of December 2013 06:27:27 Kukjin Kim wrote:
> On 12/05/13 18:44, Sachin Kamat wrote:
> > Added regulator entries to Exynos5420 SMDK board.
> >
> > Signed-off-by: Sachin Kamat<sachin.kamat@linaro.org>
> > ---
> > Changes since v1:
> > Changed node name
> > ---
> >   arch/arm/boot/dts/exynos5420-smdk5420.dts |  216 +++++++++++++++++++++++++++++
> >   1 file changed, 216 insertions(+)
> >
> > diff --git a/arch/arm/boot/dts/exynos5420-smdk5420.dts b/arch/arm/boot/dts/exynos5420-smdk5420.dts
> > index fb5a1e25c632..62e1ebe4e989 100644
> > --- a/arch/arm/boot/dts/exynos5420-smdk5420.dts
> > +++ b/arch/arm/boot/dts/exynos5420-smdk5420.dts
> > @@ -120,4 +120,220 @@
> >   			reg =<0x50>;
> >   		};
> >   	};
> > +
> > +	hsi2c_4: i2c@12CA0000 {
> > +		status = "okay";
> > +
> > +		s2mps11_pmic@66 {
> > +			compatible = "samsung,s2mps11-pmic";
> > +			reg =<0x66>;
> > +			s2mps11,buck2-ramp-delay =<12>;
> > +			s2mps11,buck34-ramp-delay =<12>;
> > +			s2mps11,buck16-ramp-delay =<12>;
> > +			s2mps11,buck6-ramp-enable =<1>;
> > +			s2mps11,buck2-ramp-enable =<1>;
> > +			s2mps11,buck3-ramp-enable =<1>;
> > +			s2mps11,buck4-ramp-enable =<1>;
> > +
> > +			s2mps11_osc: clocks {
> > +				#clock-cells =<1>;
> > +				clock-output-names = "s2mps11_ap",
> > +						"s2mps11_cp", "s2mps11_bt";
> > +			};
> > +
> > +			regulators {
> > +				ldo1_reg: LDO1 {
> > +					regulator-name = "vdd_ldo1";
> > +					regulator-min-microvolt =<1000000>;
> > +					regulator-max-microvolt =<1000000>;
> > +					regulator-always-on;
> > +				};
> > +
> > +				ldo3_reg: LDO3 {
> > +					regulator-name = "vdd_ldo3";
> > +					regulator-min-microvolt =<1800000>;
> > +					regulator-max-microvolt =<1800000>;
> > +					regulator-always-on;
> > +				};
> > +
> > +				ldo5_reg: LDO5 {
> > +					regulator-name = "vdd_ldo5";
> > +					regulator-min-microvolt =<1800000>;
> > +					regulator-max-microvolt =<1800000>;
> > +					regulator-always-on;
> > +				};
> > +
> > +				ldo6_reg: LDO6 {
> > +					regulator-name = "vdd_ldo6";
> > +					regulator-min-microvolt =<1000000>;
> > +					regulator-max-microvolt =<1000000>;
> > +					regulator-always-on;
> > +				};
> > +
> > +				ldo7_reg: LDO7 {
> > +					regulator-name = "vdd_ldo7";
> > +					regulator-min-microvolt =<1800000>;
> > +					regulator-max-microvolt =<1800000>;
> > +					regulator-always-on;
> > +				};
> > +
> > +				ldo8_reg: LDO8 {
> > +					regulator-name = "vdd_ldo8";
> > +					regulator-min-microvolt =<1800000>;
> > +					regulator-max-microvolt =<1800000>;
> > +					regulator-always-on;
> > +				};
> > +
> > +				ldo9_reg: LDO9 {
> > +					regulator-name = "vdd_ldo9";
> > +					regulator-min-microvolt =<3000000>;
> > +					regulator-max-microvolt =<3000000>;
> > +					regulator-always-on;
> > +				};
> > +
> > +				ldo10_reg: LDO10 {
> > +					regulator-name = "vdd_ldo10";
> > +					regulator-min-microvolt =<1800000>;
> > +					regulator-max-microvolt =<1800000>;
> > +					regulator-always-on;
> > +				};
> > +
> > +				ldo11_reg: LDO11 {
> > +					regulator-name = "vdd_ldo11";
> > +					regulator-min-microvolt =<1000000>;
> > +					regulator-max-microvolt =<1000000>;
> > +					regulator-always-on;
> > +				};
> > +
> > +				ldo12_reg: LDO12 {
> > +					regulator-name = "vdd_ldo12";
> > +					regulator-min-microvolt =<1800000>;
> > +					regulator-max-microvolt =<1800000>;
> > +					regulator-always-on;
> > +				};
> > +
> > +				ldo13_reg: LDO13 {
> > +					regulator-name = "vdd_ldo13";
> > +					regulator-min-microvolt =<2800000>;
> > +					regulator-max-microvolt =<2800000>;
> > +					regulator-always-on;
> > +				};
> > +
> > +				ldo15_reg: LDO15 {
> > +					regulator-name = "vdd_ldo15";
> > +					regulator-min-microvolt =<3100000>;
> > +					regulator-max-microvolt =<3100000>;
> > +					regulator-always-on;
> > +				};
> > +
> > +				ldo16_reg: LDO16 {
> > +					regulator-name = "vdd_ldo16";
> > +					regulator-min-microvolt =<2200000>;
> > +					regulator-max-microvolt =<2200000>;
> > +					regulator-always-on;
> > +				};
> > +
> > +				ldo17_reg: LDO17 {
> > +					regulator-name = "tsp_avdd";
> > +					regulator-min-microvolt =<3300000>;
> > +					regulator-max-microvolt =<3300000>;
> > +					regulator-always-on;
> > +				};
> > +
> > +				ldo19_reg: LDO19 {
> > +					regulator-name = "vdd_sd";
> > +					regulator-min-microvolt =<2800000>;
> > +					regulator-max-microvolt =<2800000>;
> > +					regulator-always-on;
> > +				};
> > +
> > +				ldo24_reg: LDO24 {
> > +					regulator-name = "tsp_io";
> > +					regulator-min-microvolt =<2800000>;
> > +					regulator-max-microvolt =<2800000>;
> > +					regulator-always-on;
> > +				};
> > +
> > +				buck1_reg: BUCK1 {
> > +					regulator-name = "vdd_mif";
> > +					regulator-min-microvolt =<800000>;
> > +					regulator-max-microvolt =<1300000>;
> > +					regulator-always-on;
> > +					regulator-boot-on;
> > +				};
> > +
> > +				buck2_reg: BUCK2 {
> > +					regulator-name = "vdd_arm";
> > +					regulator-min-microvolt =<800000>;
> > +					regulator-max-microvolt =<1500000>;
> > +					regulator-always-on;
> > +					regulator-boot-on;
> > +				};
> > +
> > +				buck3_reg: BUCK3 {
> > +					regulator-name = "vdd_int";
> > +					regulator-min-microvolt =<800000>;
> > +					regulator-max-microvolt =<1400000>;
> > +					regulator-always-on;
> > +					regulator-boot-on;
> > +				};
> > +
> > +				buck4_reg: BUCK4 {
> > +					regulator-name = "vdd_g3d";
> > +					regulator-min-microvolt =<800000>;
> > +					regulator-max-microvolt =<1400000>;
> > +					regulator-always-on;
> > +					regulator-boot-on;
> > +				};
> > +
> > +				buck5_reg: BUCK5 {
> > +					regulator-name = "vdd_mem";
> > +					regulator-min-microvolt =<800000>;
> > +					regulator-max-microvolt =<1400000>;
> > +					regulator-always-on;
> > +					regulator-boot-on;
> > +				};
> > +
> > +				buck6_reg: BUCK6 {
> > +					regulator-name = "vdd_kfc";
> > +					regulator-min-microvolt =<800000>;
> > +					regulator-max-microvolt =<1500000>;
> > +					regulator-always-on;
> > +					regulator-boot-on;
> > +				};
> > +
> > +				buck7_reg: BUCK7 {
> > +					regulator-name = "vdd_1.0v_ldo";
> > +					regulator-min-microvolt =<800000>;
> > +					regulator-max-microvolt =<1500000>;
> > +					regulator-always-on;
> > +					regulator-boot-on;
> > +				};
> > +
> > +				buck8_reg: BUCK8 {
> > +					regulator-name = "vdd_1.8v_ldo";
> > +					regulator-min-microvolt =<800000>;
> > +					regulator-max-microvolt =<1500000>;
> > +					regulator-always-on;
> > +					regulator-boot-on;
> > +				};
> > +
> > +				buck9_reg: BUCK9 {
> > +					regulator-name = "vdd_2.8v_ldo";
> > +					regulator-min-microvolt =<3000000>;
> > +					regulator-max-microvolt =<3750000>;
> > +					regulator-always-on;
> > +					regulator-boot-on;
> > +				};
> > +
> > +				buck10_reg: BUCK10 {
> > +					regulator-name = "vdd_vmem";
> > +					regulator-min-microvolt =<2850000>;
> > +					regulator-max-microvolt =<2850000>;
> > +					regulator-always-on;
> > +					regulator-boot-on;
> > +				};
> > +			};
> > +		};
> > +	};
> >   };
> 
> just + DT ml.

AFAIK, current recommendation after the KS is that changes touching only
DTS files don't have to be posted on DT ML. Just changes related to DT
bindings such as Documentation/devicetree and DT parsing code. Full series
doing both still need to be posted there, though.

Best regards,
Tomasz
