From: Javier Martinez Canillas <javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>
Subject: Re: [PATCH v2 6/7] arm64: dts: exynos: Add dts file for
 Exynos5433-based TM2 board
Date: Fri, 26 Aug 2016 14:30:23 -0400
Message-ID: <0a6dffe0-8508-724e-c831-d14c32f8cd64@osg.samsung.com>
References: <1472046551-703-1-git-send-email-cw00.choi@samsung.com>
 <1472046551-703-7-git-send-email-cw00.choi@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1472046551-703-7-git-send-email-cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, jh80.chung-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, sw0312.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, jy0922.shim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, jonghwa3.lee-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, beomho.seo-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, jaewon02.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, human.hwang-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, ideal.song-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, ingi2.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, chanwoo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

Hello Chanwoo,

The patch looks mostly good to me, I've just some comments:

[snip]

> +
> +&decon {
> +	status = "okay";
> +	iommu-reserved-mapping = <0x20000000 0x20000000 0xc0000000>;
> +

This property never made to mainline due not having an agreement on
how this should be fixed properly IIUC [0]. So you should remove it.

[snip]

> +
> +	s2mps13-pmic@66 {
> +		compatible = "samsung,s2mps13-pmic";
> +		interrupt-parent = <&gpa0>;
> +		interrupts = <7 IRQ_TYPE_NONE>;
> +		reg = <0x66>;
> +		samsung,s2mps11-wrstbi-ground;
> +
> +		s2mps13_osc: clocks {
> +			compatible = "samsung,s2mps13-clk";
> +			#clock-cells = <1>;
> +			clock-output-names = "s2mps13_ap", "s2mps13_cp",
> +				"s2mps13_bt";
> +		};
> +

I see that most of the following regulators are marked as always-on
but I wonder if this is really needed. For example some of them are
looked up by consumer devices.

[snip]

> +			};
> +
> +			ldo3_reg: LDO3 {
> +				regulator-name = "VDD1_E_1.8V_AP";
> +				regulator-min-microvolt = <1800000>;
> +				regulator-max-microvolt = <1800000>;
> +				regulator-always-on;
> +			};

This is used by both the ADC and the TMU so I guess it should be safe
to not mark it as always-on (unless is used by other critical IP block
not described in the DT).

[snip]

> +
> +			ldo6_reg: LDO6 {
> +				regulator-name = "VDD10_MIPI2L_1.0V_AP";
> +				regulator-min-microvolt = <1000000>;
> +				regulator-max-microvolt = <1000000>;
> +				regulator-always-on;

Same question, this is used by both the dsi and usbdrd30 nodes so maybe
it shouldn't be marked as always-on as well.

> +				regulator-state-mem {
> +					regulator-off-in-suspend;
> +				};
> +			};
> +
> +			ldo7_reg: LDO7 {
> +				regulator-name = "VDD18_MIPI2L_1.8V_AP";
> +				regulator-min-microvolt = <1800000>;
> +				regulator-max-microvolt = <1800000>;
> +				regulator-always-on;

This is used by the dsi node as well.

[snip]

> +
> +			ldo10_reg: LDO10 {
> +				regulator-name = "VDD33_USB30_3.0V_AP";
> +				regulator-min-microvolt = <3000000>;
> +				regulator-max-microvolt = <3000000>;
> +				regulator-always-on;

Use by the usbdrd30 node.

[snip]

> +
> +			ldo18_reg: LDO18 {
> +				regulator-name = "V_CODEC_1.8V_AP";
> +				regulator-min-microvolt = <1800000>;
> +				regulator-max-microvolt = <1800000>;
> +				regulator-always-on;

Use by the wm5110-codec node.

[snip]

> +
> +			buck2_reg: BUCK2 {
> +				regulator-name = "VDD_EGL_1.0V_AP";

I wonder if this shouldn't be "VDD_ATL_1.0V_AP" or something since
the big cluster isn't called Eagle like in arm32 Exynos but Atlas?

> +				regulator-min-microvolt = <900000>;
> +				regulator-max-microvolt = <1300000>;
> +				regulator-always-on;
> +				regulator-state-mem {
> +					regulator-off-in-suspend;
> +				};
> +			};
> +
> +			buck3_reg: BUCK3 {
> +				regulator-name = "VDD_KFC_1.0V_AP";

Same, maybe using "VDD_APL_1.0V_AP" since the big cluster is Apollo?

> +				regulator-min-microvolt = <800000>;
> +				regulator-max-microvolt = <1200000>;
> +				regulator-always-on;
> +				regulator-state-mem {
> +					regulator-off-in-suspend;
> +				};
> +			};
> +

Used by the big and LITTLE clusters respectively, although for these two
I'm not that sure if it would be safe to remove the always-on property.

Reviewed-by: Javier Martinez Canillas <javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>

[0]: http://www.spinics.net/lists/arm-kernel/msg419747.html

Best regards,
-- 
Javier Martinez Canillas
Open Source Group
Samsung Research America
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
