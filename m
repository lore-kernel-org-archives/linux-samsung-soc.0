From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [PATCH 05/10] ARM: dts: Add exynos3250-artik5 dtsi file for ARTIK5
 module
Date: Mon, 14 Mar 2016 15:57:53 +0900
Message-ID: <56E660F1.3060407@samsung.com>
References: <1457921056-21257-1-git-send-email-cw00.choi@samsung.com>
 <1457921056-21257-6-git-send-email-cw00.choi@samsung.com>
 <56E65D5D.8060702@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:60223 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933291AbcCNG54 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 14 Mar 2016 02:57:56 -0400
In-reply-to: <56E65D5D.8060702@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>, kgene@kernel.org, s.nawrocki@samsung.com, tomasz.figa@gmail.com
Cc: jh80.chung@samsung.com, andi.shyti@samsung.com, inki.dae@samsung.com, sw0312.kim@samsung.com, pankaj.dubey@samsung.com, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org

Hi Krzysztof,

On 2016=EB=85=84 03=EC=9B=94 14=EC=9D=BC 15:42, Krzysztof Kozlowski wro=
te:
> On 14.03.2016 11:04, Chanwoo Choi wrote:
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
>> Also, this patch adds the ARTIK5 development board[2] dts file which=
 includes
>> the ARTIK5 module[1] and have the devices such as sound codec, sd ca=
rd port,
>> ethernet port, uart port and so on.
>>
>> [1] https://www.artik.io/hardware/artik-5
>> [2] http://www.digikey.com/product-search/en?FV=3Dffecca14
>>
>> Signed-off-by: Chanwoo Choi <cw00.choi@samsung.com>
>> Signed-off-by: Andi Shyti <andi.shyti@samsung.com>
>> ---
>>  arch/arm/boot/dts/Makefile                    |   1 +
>>  arch/arm/boot/dts/exynos3250-artik5-devel.dts |  26 +++
>>  arch/arm/boot/dts/exynos3250-artik5.dtsi      | 282 +++++++++++++++=
+++++++++++
>=20
> Plus changes in
> Documentation/devicetree/bindings/arm/samsung/samsung-boards.txt.
>=20
>>  3 files changed, 309 insertions(+)
>>  create mode 100644 arch/arm/boot/dts/exynos3250-artik5-devel.dts
>>  create mode 100644 arch/arm/boot/dts/exynos3250-artik5.dtsi
>>
>> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
>> index a4a6d70e8b26..f2de160828e8 100644
>> --- a/arch/arm/boot/dts/Makefile
>> +++ b/arch/arm/boot/dts/Makefile
>> @@ -108,6 +108,7 @@ dtb-$(CONFIG_ARCH_DIGICOLOR) +=3D \
>>  dtb-$(CONFIG_ARCH_EFM32) +=3D \
>>  	efm32gg-dk3750.dtb
>>  dtb-$(CONFIG_ARCH_EXYNOS3) +=3D \
>> +	exynos3250-artik5-devel.dtb \
>>  	exynos3250-monk.dtb \
>>  	exynos3250-rinato.dtb
>>  dtb-$(CONFIG_ARCH_EXYNOS4) +=3D \
>> diff --git a/arch/arm/boot/dts/exynos3250-artik5-devel.dts b/arch/ar=
m/boot/dts/exynos3250-artik5-devel.dts
>> new file mode 100644
>> index 000000000000..d17c28969118
>> --- /dev/null
>> +++ b/arch/arm/boot/dts/exynos3250-artik5-devel.dts
>> @@ -0,0 +1,26 @@
>> +/*
>> + * Samsung's Exynos3250 based ARTIK5 development board device tree =
source
>> + *
>> + * Copyright (c) 2016 Samsung Electronics Co., Ltd.
>> + *		http://www.samsung.com
>> + *
>> + * Device tree source file for Samsung's ARTIK5 development board
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
>> +	model =3D "Samsung ARTIK5 development board";
>> +	compatible =3D "samsung,artik5-devel", "samsung,artik5",
>> +			"samsung,exynos3250", "samsung,exynos3";
>> +};
>> +
>> +&serial_2 {
>> +	status =3D "okay";
>> +};
>> diff --git a/arch/arm/boot/dts/exynos3250-artik5.dtsi b/arch/arm/boo=
t/dts/exynos3250-artik5.dtsi
>> new file mode 100644
>> index 000000000000..97d0087efb9f
>> --- /dev/null
>> +++ b/arch/arm/boot/dts/exynos3250-artik5.dtsi
>> @@ -0,0 +1,282 @@
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
>> +
>> +/ {
>> +	compatible =3D "samsung,artik5", "samsung,exynos3250", "samsung,ex=
ynos3";
>> +
>> +
>=20
> Leave only one blank line.
>=20
>> +	chosen {
>> +		linux,stdout =3D &serial_2;
>=20
> 'stdout-path' should be used (linux,stdout is deprecated).
>=20
>> +	};
>> +
>> +	memory {
>> +		reg =3D  <0x40000000 0x1ff00000>;
>=20
> Just one space after '=3D'.
>=20
>> +	};
>> +
>> +	firmware@0205F000 {
>> +		compatible =3D "samsung,secure-firmware";
>> +		reg =3D <0x0205F000 0x1000>;
>=20
> Let stick to one convention of letter case for hex numbers. Lower-cas=
e
> maybe, so 0205f000?

I'm sorry about coding style issue.
I'll fix them you mentioned.

>=20
>> +	};
>> +};
>> +
>> +&i2c_0 {
>> +	#address-cells =3D <1>;
>> +	#size-cells =3D <0>;
>> +	samsung,i2c-sda-delay =3D <100>;
>> +	samsung,i2c-slave-addr =3D <0x10>;
>> +	samsung,i2c-max-bus-freq =3D <100000>;
>> +	status =3D "okay";
>> +
>> +	s2mps14_pmic@66 {
>> +		compatible =3D "samsung,s2mps14-pmic";
>> +		interrupt-parent =3D <&gpx3>;
>> +		interrupts =3D <5 0>;
>=20
> IRQ_TYPE_NONE

OK, I'll modify it.

>=20
>> +		reg =3D <0x66>;
>> +		wakeup;
>=20
> This is not valid property and is ignored. Probably you meant
> 'wakeup_source' (which would still be ignored by sec-core driver by t=
he
> way... fixing this is waiting on Exynos mainline todo list :) ).

OK. I'll remove it.

Thanks for your review.

Best Regards,
Chanwoo Choi
