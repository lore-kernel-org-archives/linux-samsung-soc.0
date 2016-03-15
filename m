From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [PATCH v2 5/7] ARM: dts: Add exynos3250-artik5 dtsi file for
 ARTIK5 module
Date: Tue, 15 Mar 2016 11:42:10 +0900
Message-ID: <56E77682.8040904@samsung.com>
References: <1458007695-3627-1-git-send-email-cw00.choi@samsung.com>
 <1458007695-3627-6-git-send-email-cw00.choi@samsung.com>
 <56E77492.7020200@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:47092 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752759AbcCOCm2 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 14 Mar 2016 22:42:28 -0400
In-reply-to: <56E77492.7020200@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>, kgene@kernel.org, s.nawrocki@samsung.com, tomasz.figa@gmail.com
Cc: jh80.chung@samsung.com, andi.shyti@samsung.com, inki.dae@samsung.com, sw0312.kim@samsung.com, pankaj.dubey@samsung.com, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org

On 2016=EB=85=84 03=EC=9B=94 15=EC=9D=BC 11:33, Krzysztof Kozlowski wro=
te:
> On 15.03.2016 11:08, Chanwoo Choi wrote:
>> This patch adds the support for Device Tree source for Samsung ARTIK=
5 module[1]
>> based on Exynos3250 SoC. The ARTIK5 module includes the follwoing de=
vices:
>> - Application Processor (Samsung Exynos3250)
>> - WiFi/BT Combo chip (Broadcom4354)
>> - PMIC (Samsung S2MPS14)
>> - eMMC (4GB)
>> - DRAM LPDDR3 (512MB)
>> - Connectors pin (60 Pins x 3 set)
>>
>> Also, this patch adds the ARTIK5 evaluation board[2] dts file which =
includes
>> the ARTIK5 module[1] and have the devices such as sound codec, sd ca=
rd port,
>> ethernet port, uart port and so on.
>>
>> [1] https://www.artik.io/hardware/artik-5
>> [2] http://www.digikey.com/product-search/en?FV=3Dffecca14
>>
>> Signed-off-by: Chanwoo Choi <cw00.choi@samsung.com>
>> Signed-off-by: Jaehoon Chung <jh80.chung@samsung.com>
>> Signed-off-by: Andi Shyti <andi.shyti@samsung.com>
>> ---
>>  .../bindings/arm/samsung/samsung-boards.txt        |   2 +
>>  arch/arm/boot/dts/Makefile                         |   1 +
>>  arch/arm/boot/dts/exynos3250-artik5-eval.dts       |  26 ++
>>  arch/arm/boot/dts/exynos3250-artik5.dtsi           | 334 ++++++++++=
+++++++++++
>>  4 files changed, 363 insertions(+)
>>  create mode 100644 arch/arm/boot/dts/exynos3250-artik5-eval.dts
>>  create mode 100644 arch/arm/boot/dts/exynos3250-artik5.dtsi
>>
>> diff --git a/Documentation/devicetree/bindings/arm/samsung/samsung-b=
oards.txt b/Documentation/devicetree/bindings/arm/samsung/samsung-board=
s.txt
>> index 12129c011c8f..f5deace2b380 100644
>> --- a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.t=
xt
>> +++ b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.t=
xt
>> @@ -2,6 +2,8 @@
>> =20
>>  Required root node properties:
>>      - compatible =3D should be one or more of the following.
>> +	- "samsung,artik5"	- for Exynos3250-based Samsung ARTIK5 module.
>> +	- "samsung,artik5-eval" - for Exynos3250-based Samsung ARTIK5 eval=
 board.
>>  	- "samsung,monk"	- for Exynos3250-based Samsung Simband board.
>>  	- "samsung,rinato"	- for Exynos3250-based Samsung Gear2 board.
>>  	- "samsung,smdkv310"	- for Exynos4210-based Samsung SMDKV310 eval =
board.
>> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
>> index a4a6d70e8b26..85cd586ea3d2 100644
>> --- a/arch/arm/boot/dts/Makefile
>> +++ b/arch/arm/boot/dts/Makefile
>> @@ -108,6 +108,7 @@ dtb-$(CONFIG_ARCH_DIGICOLOR) +=3D \
>>  dtb-$(CONFIG_ARCH_EFM32) +=3D \
>>  	efm32gg-dk3750.dtb
>>  dtb-$(CONFIG_ARCH_EXYNOS3) +=3D \
>> +	exynos3250-artik5-eval.dtb \
>>  	exynos3250-monk.dtb \
>>  	exynos3250-rinato.dtb
>>  dtb-$(CONFIG_ARCH_EXYNOS4) +=3D \
>> diff --git a/arch/arm/boot/dts/exynos3250-artik5-eval.dts b/arch/arm=
/boot/dts/exynos3250-artik5-eval.dts
>> new file mode 100644
>> index 000000000000..b476154590a5
>> --- /dev/null
>> +++ b/arch/arm/boot/dts/exynos3250-artik5-eval.dts
>> @@ -0,0 +1,26 @@
>> +/*
>> + * Samsung's Exynos3250 based ARTIK5 evaluation board device tree s=
ource
>> + *
>> + * Copyright (c) 2016 Samsung Electronics Co., Ltd.
>> + *		http://www.samsung.com
>> + *
>> + * Device tree source file for Samsung's ARTIK5 evaluation board
>> + * which is based on Samsung Exynos3250 SoC.
>> + *
>> + * This program is free software; you can redistribute it and/or mo=
dify
>> + * it under the terms of the GNU General Public License version 2 a=
s
>> + * published by the Free Software Foundation.
>> + */
>> +
>> +/dts-v1/;
>> +#include "exynos3250-artik5.dtsi"
>> +
>> +/ {
>> +	model =3D "Samsung ARTIK5 evaluation board";
>> +	compatible =3D "samsung,artik5-eval", "samsung,artik5",
>> +			"samsung,exynos3250", "samsung,exynos3";
>> +};
>> +
>> +&serial_2 {
>> +	status =3D "okay";
>> +};
>> diff --git a/arch/arm/boot/dts/exynos3250-artik5.dtsi b/arch/arm/boo=
t/dts/exynos3250-artik5.dtsi
>> new file mode 100644
>> index 000000000000..206625ba8cf2
>> --- /dev/null
>> +++ b/arch/arm/boot/dts/exynos3250-artik5.dtsi
>> @@ -0,0 +1,334 @@
>> +/*
>> + * Samsung's Exynos3250 based ARTIK5 module device tree source
>> + *
>> + * Copyright (c) 2016 Samsung Electronics Co., Ltd.
>> + *		http://www.samsung.com
>> + *
>> + * Device tree source file for Samsung's ARTIK5 module which is bas=
ed on
>> + * Samsung Exynos3250 SoC.
>> + *
>> + * This program is free software; you can redistribute it and/or mo=
dify
>> + * it under the terms of the GNU General Public License version 2 a=
s
>> + * published by the Free Software Foundation.
>> + */
>> +
>> +#include "exynos3250.dtsi"
>> +#include <dt-bindings/clock/samsung,s2mps11.h>
>> +#include <dt-bindings/interrupt-controller/irq.h>
>> +#include <dt-bindings/gpio/gpio.h>
>=20
> Alphabetical order for dt-bindings includes: interrupt at the end.

OK. I'll keep it.

>=20
>> +
>> +/ {
>> +	compatible =3D "samsung,artik5", "samsung,exynos3250", "samsung,ex=
ynos3";
>> +
>> +	chosen {
>> +		stdout-path =3D &serial_2;
>> +	};
>> +
>> +	memory {
>> +		reg =3D <0x40000000 0x1ff00000>;
>> +	};
>> +
>> +	firmware@0205F000 {
>=20
> I meant same case for every hex, also in device node.

OK. I'll keep it.

>=20
>> +		compatible =3D "samsung,secure-firmware";
>> +		reg =3D <0x0205f000 0x1000>;
>> +	};
>> +
>> +	thermal-zones {
>> +		cpu_thermal: cpu-thermal {
>> +			cooling-maps {
>> +				map0 {
>> +					/* Corresponds to 500MHz */
>> +					cooling-device =3D <&cpu0 5 5>;
>> +				};
>> +				map1 {
>> +					/* Corresponds to 200MHz */
>> +					cooling-device =3D <&cpu0 8 8>;
>> +				};

[snip]

>> +
>> +&mshc_0 {
>> +	num-slots =3D <1>;
>> +	non-removable;
>> +	cap-mmc-highspeed;
>> +	card-detect-delay =3D <200>;
>> +	vmmc-supply =3D <&ldo12_reg>;
>> +	clock-frequency =3D <100000000>;
>> +	clock-freq-min-max =3D <400000 100000000>;
>> +	samsung,dw-mshc-ciu-div =3D <1>;
>> +	samsung,dw-mshc-sdr-timing =3D <0 1>;
>> +	samsung,dw-mshc-ddr-timing =3D <1 2>;
>> +	pinctrl-names =3D "default";
>> +	pinctrl-0 =3D <&sd0_cmd &sd0_bus1 &sd0_bus4 &sd0_bus8>;
>> +	bus-width =3D <8>;
>> +	status =3D "okay";
>> +};
>> +
>> +&tmu {
>> +	status =3D "okay";
>> +};
>> +
>> +&rtc {
>> +	clocks =3D <&cmu CLK_RTC>, <&s2mps14_osc S2MPS11_CLK_AP>;
>> +	clock-names =3D "rtc", "rtc_src";
>> +	status =3D "okay";
>> +};
>=20
> Alphabetical order please, so rtc before tmu.
>=20
> These are minor nits, so no need to resend. I can fix them when apply=
ing
> (but if resend happens then please fix them).
>=20
> Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
>=20

Thanks for your fixup.

Best Regards,
Chanwoo Choi
