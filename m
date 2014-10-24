From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [PATCHv3 1/3] ARM: dts: Add board dts file for Exynos3250-based
 Rinato board
Date: Fri, 24 Oct 2014 21:13:43 +0900
Message-ID: <544A4277.70909@samsung.com>
References: <1414150795-31105-1-git-send-email-cw00.choi@samsung.com>
 <1414150795-31105-2-git-send-email-cw00.choi@samsung.com>
 <544A3EBB.3020906@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:63700 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756259AbaJXMNp (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 24 Oct 2014 08:13:45 -0400
In-reply-to: <544A3EBB.3020906@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?UTF-8?B?S3J6eXN6dG9mIEtvesWCb3dza2k=?= <k.kozlowski@samsung.com>
Cc: kgene.kim@samsung.com, mark.rutland@arm.com, Jaehoon Chung <jh80.chung@samsung.com>, geunsik.lim@samsung.com, linux-samsung-soc@vger.kernel.org, arnd@arndb.de, sw0312.kim@samsung.com, tomasz.figa@gmail.com, linux-kernel@vger.kernel.org, inki.dae@samsung.com, kyungmin.park@samsung.com, olof@lixom.net, linux-arm-kernel@lists.infradead.org

Hi Krzysztof,

On 10/24/2014 08:57 PM, Krzysztof Koz=C5=82owski wrote:
> On 24.10.2014 13:39, Chanwoo Choi wrote:
>> This patch add support for device tree sources for Samsung Rinato ba=
ord
>> (Gear 2) based on Exynos3250 SoC.
>>
>> This dts file support following features:
>> - eMMC
>> - Main PMIC (Samsung S2MPS14)
>> - Interface PMIC (Maxim MAX77836, MUIC, fuel-gauge, charger)
>> - RTC of Exynos3250
>> - ADC of Exynos3250 with NTC thermistor
>> - I2S of Exynos3250
>> - TMU of Exynos3250
>> - MFC of Exynos3250
>> - Secure firmware for Exynos3250 secondary cpu boot
>> - Serial ports of Exynos3250
>> - gpio-key for power key
>>
>> Signed-off-by: Chanwoo Choi <cw00.choi@samsung.com>
>> Signed-off-by: Inki Dae <inki.dae@samsung.com>
>> Signed-off-by: Seung-Woo Kim <sw0312.kim@samsung.com>
>> Signed-off-by: Jaehoon Chung <jh80.chung@samsung.com>
>> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
>> ---
>>  arch/arm/boot/dts/Makefile              |   3 +-
>>  arch/arm/boot/dts/exynos3250-rinato.dts | 433 +++++++++++++++++++++=
+++++++++++
>>  2 files changed, 435 insertions(+), 1 deletion(-)
>>  create mode 100644 arch/arm/boot/dts/exynos3250-rinato.dts
>>
>> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
>> index 4a75e29..91cd4d0 100644
>> --- a/arch/arm/boot/dts/Makefile
>> +++ b/arch/arm/boot/dts/Makefile
>> @@ -67,7 +67,8 @@ dtb-$(CONFIG_ARCH_BRCMSTB) +=3D \
>>  dtb-$(CONFIG_ARCH_DAVINCI) +=3D da850-enbw-cmc.dtb \
>>  	da850-evm.dtb
>>  dtb-$(CONFIG_ARCH_EFM32) +=3D efm32gg-dk3750.dtb
>> -dtb-$(CONFIG_ARCH_EXYNOS) +=3D exynos4210-origen.dtb \
>> +dtb-$(CONFIG_ARCH_EXYNOS) +=3D exynos3250-rinato.dtb \
>> +	exynos4210-origen.dtb \
>>  	exynos4210-smdkv310.dtb \
>>  	exynos4210-trats.dtb \
>>  	exynos4210-universal_c210.dtb \
>> diff --git a/arch/arm/boot/dts/exynos3250-rinato.dts b/arch/arm/boot=
/dts/exynos3250-rinato.dts
>> new file mode 100644
>> index 0000000..be0ba8d
>> --- /dev/null
>> +++ b/arch/arm/boot/dts/exynos3250-rinato.dts
>> @@ -0,0 +1,433 @@
>> +/*
>> + * Samsung's Exynos3250 based Rinato board device tree source
>> + *
>> + * Copyright (c) 2014 Samsung Electronics Co., Ltd.
>> + *		http://www.samsung.com
>> + *
>> + * Device tree source file for Samsung's Rinato board which is base=
d on
>> + * Samsung Exynos3250 SoC.
>> + *
>> + * This program is free software; you can redistribute it and/or mo=
dify
>> + * it under the terms of the GNU General Public License version 2 a=
s
>> + * published by the Free Software Foundation.
>> + */
>> +
>> +/dts-v1/;
>> +#include "exynos3250.dtsi"
>> +#include <dt-bindings/input/input.h>
>> +
>> +/ {
>> +	model =3D "Samsung Rinato board";
>> +	compatible =3D "samsung,rinato", "samsung,exynos3250", "samsung,ex=
ynos3";
>> +
>> +	aliases {
>> +		i2c7 =3D &i2c_max77836;
>> +	};
>> +
>> +	memory {
>> +		reg =3D  <0x40000000 0x1ff00000>;
>> +	};
>> +
>> +	chosen {
>> +		bootargs =3D "console=3DttySAC1,115200N8 root=3D/dev/mmcblk0p15 r=
ootwait earlyprintk panic=3D5";
>> +	};
>> +
>> +	firmware@0205F000 {
>> +		compatible =3D "samsung,secure-firmware";
>> +		reg =3D <0x0205F000 0x1000>;
>> +	};
>> +
>> +	gpio_keys {
>> +		compatible =3D "gpio-keys";
>> +
>> +		power_key {
>> +			interrupt-parent =3D <&gpx2>;
>> +			interrupts =3D <7 0>;
>> +			gpios =3D <&gpx2 7 1>;
>> +			linux,code =3D <KEY_POWER>;
>> +			label =3D "power key";
>> +			debounce-interval =3D <10>;
>> +			gpio-key,wakeup;
>> +		};
>> +	};
>> +
>> +	vemmc_reg: voltage-regulator-0 {
>> +	        compatible =3D "regulator-fixed";
>> +		regulator-name =3D "V_EMMC_2.8V-fixed";
>> +		regulator-min-microvolt =3D <2800000>;
>> +		regulator-max-microvolt =3D <2800000>;
>> +		gpio =3D <&gpk0 2 0>;
>> +		enable-active-high;
>> +	};
>=20
> Hi Chanwoo,
>=20
> I wonder if this regulator-fixed is needed. The LDO11 and LDO12 has
> external GPIO control set up. So maybe this could be removed?

OK, I'll remove 'vemmc_reg' and then use ldo12_reg insead of 'vemmc_reg=
' on mshc_0 dt node.

Best Regards,
Chanwoo Choi
