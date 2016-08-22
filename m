From: Chanwoo Choi <cwchoi00@gmail.com>
Subject: Re: [PATCH 1/2] ARM: dts: Add TOPEET itop core board SCP package version
Date: Mon, 22 Aug 2016 23:45:14 +0900
Message-ID: <CAGTfZH07v_9bxKKx4gwLSb6+vLpZ+esW4D5sT4=RiHXa3SV-Vg@mail.gmail.com>
References: <1471809893-31147-1-git-send-email-ayaka@soulik.info>
 <1471809893-31147-2-git-send-email-ayaka@soulik.info> <4767fc2a-95b7-ee0d-f51a-7a5d6ca89d8f@samsung.com>
 <A0C9B5F5-6B75-43F3-9280-1D33E77DC3BC@soulik.info>
Reply-To: chanwoo@kernel.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-yw0-f195.google.com ([209.85.161.195]:32946 "EHLO
        mail-yw0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755142AbcHVOp4 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 22 Aug 2016 10:45:56 -0400
In-Reply-To: <A0C9B5F5-6B75-43F3-9280-1D33E77DC3BC@soulik.info>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Ayaka <ayaka@soulik.info>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, devicetree <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux@armlinux.org.uk, Kukjin Kim <kgene@kernel.org>, krzk@kernel.org, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>

Hi,

2016-08-22 17:28 GMT+09:00 Ayaka <ayaka@soulik.info>:
>
> Thank you
> =E5=BE=9E=E6=88=91=E7=9A=84 iPad =E5=82=B3=E9=80=81
>
>> Marek Szyprowski <m.szyprowski@samsung.com> =E6=96=BC 2016=E5=B9=B48=E6=
=9C=8822=E6=97=A5 =E4=B8=8B=E5=8D=882:50 =E5=AF=AB=E9=81=93=EF=BC=9A
>>
>> Dear Randy,
>>
>>
>>> On 2016-08-21 22:04, Randy Li wrote:
>>> The TOPEET itop is a samsung exnynos 4412 core board, which have
>>> two package versions. This patch add the support for SCP version.
>>>
>>> Currently supported are USB3503A HSIC, USB OTG, eMMC, RTC and PMIC.
>>> The future features are in the based board. Also MFC and watchdog
>>> have been enabled.
>>>
>>> Signed-off-by: Randy Li <ayaka@soulik.info>
>>> ---
>>>  arch/arm/boot/dts/exynos4412-itop-scp-core.dtsi | 434 ++++++++++++++++=
++++++++
>>>  1 file changed, 434 insertions(+)
>>>  create mode 100644 arch/arm/boot/dts/exynos4412-itop-scp-core.dtsi
>>>
>>> diff --git a/arch/arm/boot/dts/exynos4412-itop-scp-core.dtsi b/arch/arm=
/boot/dts/exynos4412-itop-scp-core.dtsi
>>> new file mode 100644
>>> index 0000000..0860ee6
>>> --- /dev/null
>>> +++ b/arch/arm/boot/dts/exynos4412-itop-scp-core.dtsi
>>> @@ -0,0 +1,434 @@
>>> +/*
>>> + * TOPEET's Exynos4412 based itop board device tree source
>>> + *
>>> + * Copyright (c) 2016 SUMOMO Computer Association
>>> + *            https://www.sumomo.mobi
>>> + *            Randy Li <ayaka@soulik.info>
>>> + *
>>> + * Device tree source file for TOPEET iTop Exynos 4412 SCP package cor=
e
>>> + * board which is based on Samsung's Exynos4412 SoC.
>>> + *
>>> + * This program is free software; you can redistribute it and/or modif=
y
>>> + * it under the terms of the GNU General Public License version 2 as
>>> + * published by the Free Software Foundation.
>>> +*/
>>> +
>>> +#include "exynos4412.dtsi"
>>> +#include <dt-bindings/gpio/gpio.h>
>>> +#include <dt-bindings/input/input.h>
>>> +
>>> +/ {
>>> +    memory {
>>> +        reg =3D <0x40000000 0x40000000>;
>>> +    };
>>> +
>>> +    firmware@0203F000 {
>>> +        compatible =3D "samsung,secure-firmware";
>>> +        reg =3D <0x0203F000 0x1000>;
>>> +    };
>>> +
>>> +    display-timings {
>>> +        native-mode =3D <&timing0>;
>>> +        timing0: timing {
>>> +            clock-frequency =3D <47500000>;
>>> +            hactive =3D <1024>;
>>> +            vactive =3D <600>;
>>> +            hfront-porch =3D <64>;
>>> +            hback-porch =3D <16>;
>>> +            hsync-len =3D <48>;
>>> +            vback-porch =3D <64>;
>>> +            vfront-porch =3D <16>;
>>> +            vsync-len =3D <3>;
>>> +        };
>>> +    };
>>> +
>>> +    fixed-rate-clocks {
>>> +        xxti {
>>> +            compatible =3D "samsung,clock-xxti";
>>> +            clock-frequency =3D <0>;
>>> +        };
>>> +
>>> +        xusbxti {
>>> +            compatible =3D "samsung,clock-xusbxti";
>>> +            clock-frequency =3D <24000000>;
>>> +        };
>>> +    };
>>> +
>>> +    usb-hub {
>>> +        compatible =3D "smsc,usb3503a";
>>> +        reset-gpios =3D <&gpm2 4 GPIO_ACTIVE_LOW>;
>>> +        connect-gpios =3D <&gpm3 3 GPIO_ACTIVE_HIGH>;
>>> +        intn-gpios =3D <&gpx2 3 GPIO_ACTIVE_HIGH>;
>>> +        pinctrl-names =3D "default";
>>> +        pinctrl-0 =3D <&hsic_reset>;
>>> +    };
>>> +};
>>> +
>>> +&cpu0 {
>>> +    cpu0-supply =3D <&buck2_reg>;
>>> +};
>>> +
>>> +&i2c_1 {
>>> +    #address-cells =3D <1>;
>>> +    #size-cells =3D <0>;
>>> +    samsung,i2c-sda-delay =3D <100>;
>>> +    samsung,i2c-max-bus-freq =3D <400000>;
>>> +    pinctrl-0 =3D <&i2c1_bus>;
>>> +    pinctrl-names =3D "default";
>>> +    status =3D "okay";
>>> +
>>> +    s5m8767_pmic@66 {
>>> +        compatible =3D "samsung,s5m8767-pmic";
>>> +        reg =3D <0x66>;
>>> +
>>> +        s5m8767,pmic-buck-default-dvs-idx =3D <3>;
>>> +
>>> +        s5m8767,pmic-buck-dvs-gpios =3D <&gpb 5 GPIO_ACTIVE_HIGH>,
>>> +                         <&gpb 6 GPIO_ACTIVE_HIGH>,
>>> +                         <&gpb 7 GPIO_ACTIVE_HIGH>;
>>> +
>>> +        s5m8767,pmic-buck-ds-gpios =3D <&gpm3 5 GPIO_ACTIVE_HIGH>,
>>> +                        <&gpm3 6 GPIO_ACTIVE_HIGH>,
>>> +                        <&gpm3 7 GPIO_ACTIVE_HIGH>;
>>> +
>>> +        /* VDD_ARM */
>>> +        s5m8767,pmic-buck2-dvs-voltage =3D <1356250>, <1300000>,
>>> +                         <1243750>, <1118750>,
>>> +                         <1068750>, <1012500>,
>>> +                         <956250>, <900000>;
>>> +        /* VDD_INT */
>>> +        s5m8767,pmic-buck3-dvs-voltage =3D <1000000>, <1000000>,
>>> +                         <925000>, <925000>,
>>> +                         <887500>, <887500>,
>>> +                         <850000>, <850000>;
>>> +        /* VDD_G3D */
>>> +        s5m8767,pmic-buck4-dvs-voltage =3D <1081250>, <1081250>,
>>> +                         <1025000>, <950000>,
>>> +                         <918750>, <900000>,
>>> +                         <875000>, <831250>;
>>> +
>>> +        regulators {
>>> +            ldo1_reg: LDO1 {
>>> +                regulator-name =3D "VDD_ALIVE";
>>> +                regulator-min-microvolt =3D <1100000>;
>>> +                regulator-max-microvolt =3D <1100000>;
>>> +                regulator-always-on;
>>> +                regulator-boot-on;
>>> +                op_mode =3D <1>; /* Normal Mode */
>>> +            };
>>> +
>>> +            /* SCP uses 1.5v, POP uses 1.2v */
>>> +            ldo2_reg: LDO2 {
>>> +                regulator-name =3D "VDDQ_M12";
>>> +                regulator-min-microvolt =3D <1500000>;
>>> +                regulator-max-microvolt =3D <1500000>;
>>> +                regulator-always-on;
>>> +                regulator-boot-on;
>>> +                op_mode =3D <1>; /* Normal Mode */
>>> +            };
>>> +
>>> +            ldo3_reg: LDO3 {
>>> +                regulator-name =3D "VDDIOAP_18";
>>> +                regulator-min-microvolt =3D <1800000>;
>>> +                regulator-max-microvolt =3D <1800000>;
>>> +                regulator-always-on;
>>> +                op_mode =3D <1>; /* Normal Mode */
>>> +            };
>>> +
>>> +            ldo4_reg: LDO4 {
>>> +                regulator-name =3D "VDDQ_PRE";
>>> +                regulator-min-microvolt =3D <1800000>;
>>> +                regulator-max-microvolt =3D <1800000>;
>>> +                regulator-always-on;
>>> +                op_mode =3D <1>; /* Normal Mode */
>>> +            };
>>> +
>>> +            ldo6_reg: LDO6 {
>>> +                regulator-name =3D "VDD10_MPLL";
>>> +                regulator-min-microvolt =3D <1000000>;
>>> +                regulator-max-microvolt =3D <1000000>;
>>> +                regulator-always-on;
>>> +                op_mode =3D <1>; /* Normal Mode */
>>> +            };
>>> +
>>> +            ldo7_reg: LDO7 {
>>> +                regulator-name =3D "VDD10_XPLL";
>>> +                regulator-min-microvolt =3D <1000000>;
>>> +                regulator-max-microvolt =3D <1000000>;
>>> +                regulator-always-on;
>>> +                op_mode =3D <1>; /* Normal Mode */
>>> +            };
>>> +
>>> +            ldo8_reg: LDO8 {
>>> +                regulator-name =3D "VDD10_MIPI";
>>> +                regulator-min-microvolt =3D <1000000>;
>>> +                regulator-max-microvolt =3D <1000000>;
>>> +                op_mode =3D <1>; /* Normal Mode */
>>> +            };
>>> +
>>> +            ldo9_reg: LDO9 {
>>> +                regulator-name =3D "VDD33_LCD";
>>> +                regulator-min-microvolt =3D <3300000>;
>>> +                regulator-max-microvolt =3D <3300000>;
>>> +                op_mode =3D <1>; /* Normal Mode */
>>> +            };
>>> +
>>> +            ldo10_reg: LDO10 {
>>> +                regulator-name =3D "VDD18_MIPI";
>>> +                regulator-min-microvolt =3D <1800000>;
>>> +                regulator-max-microvolt =3D <1800000>;
>>> +                op_mode =3D <1>; /* Normal Mode */
>>> +            };
>>> +
>>> +            ldo11_reg: LDO11 {
>>> +                regulator-name =3D "VDD18_ABB1";
>>> +                regulator-min-microvolt =3D <1800000>;
>>> +                regulator-max-microvolt =3D <1800000>;
>>> +                regulator-always-on;
>>> +                op_mode =3D <1>; /* Normal Mode */
>>> +            };
>>> +
>>> +            ldo12_reg: LDO12 {
>>> +                regulator-name =3D "VDD33_UOTG";
>>> +                regulator-min-microvolt =3D <3300000>;
>>> +                regulator-max-microvolt =3D <3300000>;
>>> +                regulator-always-on;
>>> +                op_mode =3D <1>; /* Normal Mode */
>>> +            };
>>> +
>>> +            ldo13_reg: LDO13 {
>>> +                regulator-name =3D "VDDIOPERI_18";
>>> +                regulator-min-microvolt =3D <1800000>;
>>> +                regulator-max-microvolt =3D <1800000>;
>>> +                regulator-always-on;
>>> +                op_mode =3D <1>; /* Normal Mode */
>>> +            };
>>> +
>>> +            ldo14_reg: LDO14 {
>>> +                regulator-name =3D "VDD18_ABB02";
>>> +                regulator-min-microvolt =3D <1800000>;
>>> +                regulator-max-microvolt =3D <1800000>;
>>> +                regulator-always-on;
>>> +                op_mode =3D <1>; /* Normal Mode */
>>> +            };
>>> +
>>> +            ldo15_reg: LDO15 {
>>> +                regulator-name =3D "VDD10_USH";
>>> +                regulator-min-microvolt =3D <1000000>;
>>> +                regulator-max-microvolt =3D <1000000>;
>>> +                regulator-always-on;
>>> +                op_mode =3D <1>; /* Normal Mode */
>>> +            };
>>> +
>>> +            ldo16_reg: LDO16 {
>>> +                regulator-name =3D "VDD18_HSIC";
>>> +                regulator-min-microvolt =3D <1800000>;
>>> +                regulator-max-microvolt =3D <1800000>;
>>> +                regulator-always-on;
>>> +                op_mode =3D <1>; /* Normal Mode */
>>> +            };
>>> +
>>> +            ldo17_reg: LDO17 {
>>> +                regulator-name =3D "VDDIOAP_MMC012_28";
>>> +                regulator-min-microvolt =3D <2800000>;
>>> +                regulator-max-microvolt =3D <2800000>;
>>> +                op_mode =3D <1>; /* Normal Mode */
>>> +            };
>>> +
>>> +            /* Used by HSIC */
>>> +            ldo18_reg: LDO18 {
>>> +                regulator-name =3D "VDDIOPERI_28";
>>> +                regulator-min-microvolt =3D <3300000>;
>>> +                regulator-max-microvolt =3D <3300000>;
>>> +                regulator-always-on;
>>> +                op_mode =3D <1>; /* Normal Mode */
>>> +            };
>>> +
>>> +            ldo20_reg: LDO20 {
>>> +                regulator-name =3D "VDD28_CAM";
>>> +                regulator-min-microvolt =3D <1800000>;
>>> +                regulator-max-microvolt =3D <2800000>;
>>> +                op_mode =3D <1>; /* Normal Mode */
>>> +            };
>>> +
>>> +            ldo21_reg: LDO21 {
>>> +                regulator-name =3D "VDD28_AF";
>>> +                regulator-min-microvolt =3D <1800000>;
>>> +                regulator-max-microvolt =3D <2800000>;
>>> +                op_mode =3D <1>; /* Normal Mode */
>>> +            };
>>> +
>>> +            ldo22_reg: LDO22 {
>>> +                regulator-name =3D "VDDA28_2M";
>>> +                regulator-min-microvolt =3D <2800000>;
>>> +                regulator-max-microvolt =3D <2800000>;
>>> +                op_mode =3D <1>; /* Normal Mode */
>>> +            };
>>> +
>>> +            ldo23_reg: LDO23 {
>>> +                regulator-name =3D "VDD28_TF";
>>> +                regulator-min-microvolt =3D <2800000>;
>>> +                regulator-max-microvolt =3D <2800000>;
>>> +                op_mode =3D <1>; /* Normal Mode */
>>> +            };
>>> +
>>> +            ldo24_reg: LDO24 {
>>> +                regulator-name =3D "VDD33_A31";
>>> +                regulator-min-microvolt =3D <3300000>;
>>> +                regulator-max-microvolt =3D <3300000>;
>>> +                op_mode =3D <1>; /* Normal Mode */
>>> +            };
>>> +
>>> +            ldo25_reg: LDO25 {
>>> +                regulator-name =3D "VDD18_CAM";
>>> +                regulator-min-microvolt =3D <1800000>;
>>> +                regulator-max-microvolt =3D <1800000>;
>>> +                op_mode =3D <1>; /* Normal Mode */
>>> +            };
>>> +
>>> +            ldo26_reg: LDO26 {
>>> +                regulator-name =3D "VDD18_A31";
>>> +                regulator-min-microvolt =3D <1800000>;
>>> +                regulator-max-microvolt =3D <1800000>;
>>> +                op_mode =3D <1>; /* Normal Mode */
>>> +            };
>>> +
>>> +            ldo27_reg: LDO27 {
>>> +                regulator-name =3D "GPS_1V8";
>>> +                regulator-min-microvolt =3D <1800000>;
>>> +                regulator-max-microvolt =3D <1800000>;
>>> +                op_mode =3D <1>; /* Normal Mode */
>>> +            };
>>> +
>>> +            ldo28_reg: LDO28 {
>>> +                regulator-name =3D "DVDD12";
>>> +                regulator-min-microvolt =3D <1200000>;
>>> +                regulator-max-microvolt =3D <1200000>;
>>> +                op_mode =3D <1>; /* Normal Mode */
>>> +            };
>>> +
>>> +            buck1_reg: BUCK1 {
>>> +                regulator-name =3D "vdd_mif";
>>> +                regulator-min-microvolt =3D <850000>;
>>> +                regulator-max-microvolt    =3D <1100000>;
>>> +                regulator-always-on;
>>> +                regulator-boot-on;
>>> +                op_mode =3D <1>; /* Normal Mode */
>>> +            };
>>> +
>>> +            buck2_reg: BUCK2 {
>>> +                regulator-name =3D "vdd_arm";
>>> +                regulator-min-microvolt =3D <850000>;
>>> +                regulator-max-microvolt    =3D <1456250>;
>>> +                regulator-always-on;
>>> +                regulator-boot-on;
>>> +                op_mode =3D <1>; /* Normal Mode */
>>> +            };
>>> +
>>> +            buck3_reg: BUCK3 {
>>> +                regulator-name =3D "vdd_int";
>>> +                regulator-min-microvolt =3D <875000>;
>>> +                regulator-max-microvolt    =3D <1200000>;
>>> +                regulator-always-on;
>>> +                regulator-boot-on;
>>> +                op_mode =3D <1>; /* Normal Mode */
>>> +            };
>>> +
>>> +            buck4_reg: BUCK4 {
>>> +                regulator-name =3D "vdd_g3d";
>>> +                regulator-min-microvolt =3D <750000>;
>>> +                regulator-max-microvolt    =3D <1500000>;
>>> +                regulator-always-on;
>>> +                regulator-boot-on;
>>> +                op_mode =3D <1>; /* Normal Mode */
>>> +            };
>>> +
>>> +            buck5_reg: BUCK5 {
>>> +                regulator-name =3D "vdd_m12";
>>> +                regulator-min-microvolt =3D <750000>;
>>> +                regulator-max-microvolt    =3D <1500000>;
>>> +                regulator-always-on;
>>> +                regulator-boot-on;
>>> +                op_mode =3D <1>; /* Normal Mode */
>>> +            };
>>> +
>>> +            buck6_reg: BUCK6 {
>>> +                regulator-name =3D "vdd12_5m";
>>> +                regulator-min-microvolt =3D <750000>;
>>> +                regulator-max-microvolt    =3D <1500000>;
>>> +                regulator-always-on;
>>> +                regulator-boot-on;
>>> +                op_mode =3D <1>; /* Normal Mode */
>>> +            };
>>> +
>>> +            buck7_reg: BUCK7 {
>>> +                regulator-name =3D "pvdd_buck7";
>>> +                regulator-min-microvolt =3D <750000>;
>>> +                regulator-max-microvolt    =3D <2000000>;
>>> +                regulator-boot-on;
>>> +                regulator-always-on;
>>> +                op_mode =3D <1>; /* Normal Mode */
>>> +            };
>>> +
>>> +            buck8_reg: BUCK8 {
>>> +                regulator-name =3D "pvdd_buck8";
>>> +                regulator-min-microvolt =3D <750000>;
>>> +                regulator-max-microvolt    =3D <1500000>;
>>> +                regulator-boot-on;
>>> +                regulator-always-on;
>>> +                op_mode =3D <1>; /* Normal Mode */
>>> +            };
>>> +
>>> +            buck9_reg: BUCK9 {
>>> +                regulator-name =3D "vddf28_emmc";
>>> +                regulator-min-microvolt =3D <750000>;
>>> +                regulator-max-microvolt    =3D <3000000>;
>>> +                op_mode =3D <1>; /* Normal Mode */
>>> +            };
>>> +        };
>>> +    };
>>> +};
>>> +
>>> +&pinctrl_1 {
>>> +    hsic_reset: hsic-reset {
>>> +        samsung,pins =3D "gpm2-4";
>>> +        samsung,pin-function =3D <1>;
>>> +        samsung,pin-pud =3D <0>;
>>> +        samsung,pin-drv =3D <3>;
>>> +    };
>>> +};
>>> +
>>> +&mfc {
>>> +    samsung,mfc-r =3D <0x43000000 0x800000>;
>>> +    samsung,mfc-l =3D <0x51000000 0x800000>;
>>> +    status =3D "okay";
>>> +};
>>
>> Since v4.8-rc1 MFC driver has been converted to generic reserved memory =
bindings,
>> so samsung,mfc-* properties are obsoleted and no longer used. If you wan=
t to use
>> MFC driver with reserved memory, please just add following line to your =
dts:
>> #include "exynos-mfc-reserved-memory.dtsi"
>>
>> Please refer to dts of other boards for more examples.
> I see, I would also enabled the bus_mfc and mfc entry.
> I notice the new introduce Exynos bus. I need some time to add support it=
. I will send a new version later time(maybe you have to wait this weekend,=
 sorry about that).

What is meaning of "new introduce Exynos bus"?
Could you explain it to me?

[snip]

--=20
Regards,
Chanwoo Choi
