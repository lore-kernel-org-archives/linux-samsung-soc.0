From: Lukasz Majewski <l.majewski@samsung.com>
Subject: Re: [PATCH] arm64: dts: Add tmu node for exynos7
Date: Thu, 25 Feb 2016 09:58:03 +0100
Message-ID: <20160225095803.719122ae@amdc2363>
References: <1456370865-10086-1-git-send-email-pankaj.dubey@samsung.com>
 <56CE7DAC.4000803@samsung.com> <56CE7FF3.4030101@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:33763 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758668AbcBYI6L convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 25 Feb 2016 03:58:11 -0500
In-reply-to: <56CE7FF3.4030101@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: "pankaj.dubey" <pankaj.dubey@samsung.com>
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>, linux-arm-kernel@lists.infradead.org, catalin.marinas@arm.com, will.deacon@arm.com, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, Alim Akhtar <alim.akhtar@samsung.com>

Hi pankaj.dubey,

> Hi Krzysztof,
>=20
> On Thursday 25 February 2016 09:36 AM, Krzysztof Kozlowski wrote:
> > On 25.02.2016 12:27, Pankaj Dubey wrote:
> >> From: Alim Akhtar <alim.akhtar@samsung.com>
> >>
> >> This patch adds tmu node, related temprature sensor and triping
> >> point data for Atlas cpu core found on exynos7 SoC.
> >>
> >> Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
> >=20
> > Yours Sob is missing.
> >=20
> > Cc-ed Lukasz Majewski.
> >=20
>=20
> Due to some technical difficulty Alim posted via my account. He will
> re-spin this patch via his account soon.

Looking forward to see your patches. :-)

Best regards,
=C5=81ukasz Majewski

>=20
> Thanks,
> Pankaj Dubey
> > Lukasz,
> > Your review or ack would be appreciated.
> >=20
> >=20
> >> ---
> >>  .../boot/dts/exynos/exynos7-tmu-sensor-conf.dtsi   |   25
> >> +++++++++ .../arm64/boot/dts/exynos/exynos7-trip-points.dtsi |
> >> 55 ++++++++++++++++++++
> >> arch/arm64/boot/dts/exynos/exynos7.dtsi            |   20 +++++++
> >> 3 files changed, 100 insertions(+) create mode 100644
> >> arch/arm64/boot/dts/exynos/exynos7-tmu-sensor-conf.dtsi create
> >> mode 100644 arch/arm64/boot/dts/exynos/exynos7-trip-points.dtsi
> >>
> >> diff --git
> >> a/arch/arm64/boot/dts/exynos/exynos7-tmu-sensor-conf.dtsi
> >> b/arch/arm64/boot/dts/exynos/exynos7-tmu-sensor-conf.dtsi new file
> >> mode 100644 index 0000000..1d6dcf2 --- /dev/null
> >> +++ b/arch/arm64/boot/dts/exynos/exynos7-tmu-sensor-conf.dtsi
> >> @@ -0,0 +1,25 @@
> >> +/*
> >> + * Device tree sources for Exynos7 TMU sensor configuration
> >> + *
> >> + * Copyright (c) 2016 Samsung Electronics Co., Ltd.
> >> + *		http://www.samsung.com
> >> + *
> >> + * This program is free software; you can redistribute it and/or
> >> modify
> >> + * it under the terms of the GNU General Public License version 2
> >> as
> >> + * published by the Free Software Foundation.
> >> + *
> >> + */
> >> +
> >> +#include <dt-bindings/thermal/thermal_exynos.h>
> >> +
> >> +#thermal-sensor-cells =3D <0>;
> >> +samsung,tmu_gain =3D <9>;
> >> +samsung,tmu_reference_voltage =3D <17>;
> >> +samsung,tmu_noise_cancel_mode =3D <4>;
> >> +samsung,tmu_efuse_value =3D <75>;
> >> +samsung,tmu_min_efuse_value =3D <15>;
> >> +samsung,tmu_max_efuse_value =3D <100>;
> >> +samsung,tmu_first_point_trim =3D <25>;
> >> +samsung,tmu_second_point_trim =3D <85>;
> >> +samsung,tmu_default_temp_offset =3D <50>;
> >> +samsung,tmu_cal_type =3D <TYPE_ONE_POINT_TRIMMING>;
> >> diff --git a/arch/arm64/boot/dts/exynos/exynos7-trip-points.dtsi
> >> b/arch/arm64/boot/dts/exynos/exynos7-trip-points.dtsi new file
> >> mode 100644 index 0000000..3970545
> >> --- /dev/null
> >> +++ b/arch/arm64/boot/dts/exynos/exynos7-trip-points.dtsi
> >> @@ -0,0 +1,55 @@
> >> +/*
> >> + * Device tree sources for default Exynos7 thermal zone definitio=
n
> >> + *
> >> + * Copyright (c) 2016 Samsung Electronics Co., Ltd.
> >> + *		http://www.samsung.com
> >> + *
> >> + * This program is free software; you can redistribute it and/or
> >> modify
> >> + * it under the terms of the GNU General Public License version 2
> >> as
> >> + * published by the Free Software Foundation.
> >> + *
> >> + */
> >> +
> >> +trips {
> >> +	cpu-alert-0 {
> >> +		temperature =3D <75000>; /* millicelsius */
> >> +		hysteresis =3D <10000>; /* millicelsius */
> >> +		type =3D "passive";
> >> +	};
> >> +	cpu-alert-1 {
> >> +		temperature =3D <80000>; /* millicelsius */
> >> +		hysteresis =3D <10000>; /* millicelsius */
> >> +		type =3D "passive";
> >> +	};
> >> +	cpu-alert-2 {
> >> +		temperature =3D <85000>; /* millicelsius */
> >> +		hysteresis =3D <10000>; /* millicelsius */
> >> +		type =3D "passive";
> >> +	};
> >> +	cpu-alert-3 {
> >> +		temperature =3D <90000>; /* millicelsius */
> >> +		hysteresis =3D <10000>; /* millicelsius */
> >> +		type =3D "passive";
> >> +	};
> >> +	cpu-alert-4 {
> >> +		temperature =3D <95000>; /* millicelsius */
> >> +		hysteresis =3D <10000>; /* millicelsius */
> >> +		type =3D "passive";
> >> +	};
> >> +	cpu-alert-5 {
> >> +		temperature =3D <100000>; /* millicelsius */
> >> +		hysteresis =3D <10000>; /* millicelsius */
> >> +		type =3D "passive";
> >> +	};
> >> +	cpu-alert-6 {
> >> +		temperature =3D <110000>; /* millicelsius */
> >> +		hysteresis =3D <10000>; /* millicelsius */
> >> +		type =3D "passive";
> >> +	};
> >> +	/* HW Trip point */
> >=20
> > The comment looks unnecessary, all of these are HW trip points,
> > right?
> >=20
> >> +	cpu-crit-0 {
> >> +		temperature =3D <115000>; /* millicelsius */
> >> +		hysteresis =3D <0>; /* millicelsius */
> >> +		type =3D "critical";
> >> +	};
> >> +};
> >> diff --git a/arch/arm64/boot/dts/exynos/exynos7.dtsi
> >> b/arch/arm64/boot/dts/exynos/exynos7.dtsi index c662f98..fc9d130
> >> 100644 --- a/arch/arm64/boot/dts/exynos/exynos7.dtsi
> >> +++ b/arch/arm64/boot/dts/exynos/exynos7.dtsi
> >> @@ -27,6 +27,7 @@
> >>  		pinctrl6 =3D &pinctrl_fsys0;
> >>  		pinctrl7 =3D &pinctrl_fsys1;
> >>  		pinctrl8 =3D &pinctrl_bus1;
> >> +		tmuctrl0 =3D &tmuctrl_0;
> >=20
> > Why the alias is needed?
> >=20
> >>  	};
> >> =20
> >>  	cpus {
> >> @@ -538,6 +539,25 @@
> >>  			clocks =3D <&clock_peric0 PCLK_PWM>;
> >>  			clock-names =3D "timers";
> >>  		};
> >> +
> >> +		tmuctrl_0: tmu@10060000 {
> >> +			compatible =3D "samsung,exynos7-tmu";
> >> +			reg =3D <0x10060000 0x200>;
> >> +			interrupts =3D <0 108 0>;
> >> +			clocks =3D <&clock_peris PCLK_TMU>,
> >> +				 <&clock_peris SCLK_TMU>;
> >> +			clock-names =3D "tmu_apbif", "tmu_sclk";
> >> +			#include "exynos7-tmu-sensor-conf.dtsi"
> >> +		};
> >> +
> >> +		thermal-zones {
> >> +			atlas_thermal: atlas-thermal {
> >=20
> > The atlas is a Exynos7 specific codename. The name of node should
> > be a general class of the device, so maybe:
> > 	atlas_thermal: cluster0-thermal
> > ?
> >=20
> > Best regards,
> > Krzysztof
> >=20



--=20
Best regards,

Lukasz Majewski

Samsung R&D Institute Poland (SRPOL) | Linux Platform Group
