From: Vivek Gautam <gautamvivek1987@gmail.com>
Subject: Re: [PATCH 1/2] ARM: Exynos5250: Enabling ehci-s5p driver
Date: Wed, 31 Oct 2012 12:27:40 +0530
Message-ID: <CAFp+6iHmN48PgoarvOK_D8muqu-3=5Ep=hKyRP-bQryUfRGS6Q@mail.gmail.com>
References: <1349431818-15639-1-git-send-email-gautam.vivek@samsung.com>
	<1349431818-15639-2-git-send-email-gautam.vivek@samsung.com>
	<003801cda5f7$f7fd9a30$e7f8ce90$%han@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-la0-f46.google.com ([209.85.215.46]:48315 "EHLO
	mail-la0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752096Ab2JaG5l (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 31 Oct 2012 02:57:41 -0400
Received: by mail-la0-f46.google.com with SMTP id h6so818596lag.19
        for <linux-samsung-soc@vger.kernel.org>; Tue, 30 Oct 2012 23:57:40 -0700 (PDT)
In-Reply-To: <003801cda5f7$f7fd9a30$e7f8ce90$%han@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree-discuss@lists.ozlabs.org
Cc: kgene.kim@samsung.com, thomas.abraham@linaro.org, Vivek Gautam <gautam.vivek@samsung.com>

Hi all,


On Tue, Oct 9, 2012 at 1:57 PM, Jingoo Han <jg1.han@samsung.com> wrote:
> On Friday, October 05, 2012 7:10 PM Vivek Gautam wrote
>>
>> Adding EHCI device tree node for Exynos5250 along with
>> the device base adress and gpio line for vbus.
>>
>> Signed-off-by: Vivek Gautam <gautam.vivek@samsung.com>
>
> It looks good. Also I have tested this patch with Exynos5250.
>
> Acked-by: Jingoo Han <jg1.han@samsung.com>
>
Any thoughts about this please.

>> ---
>>  .../devicetree/bindings/usb/exynos-usb.txt         |   25 ++++++++++++++++++++
>>  arch/arm/boot/dts/exynos5250-smdk5250.dts          |    4 +++
>>  arch/arm/boot/dts/exynos5250.dtsi                  |    6 ++++
>>  arch/arm/mach-exynos/include/mach/map.h            |    1 +
>>  arch/arm/mach-exynos/mach-exynos5-dt.c             |    2 +
>>  5 files changed, 38 insertions(+), 0 deletions(-)
>>  create mode 100644 Documentation/devicetree/bindings/usb/exynos-usb.txt
>>
>> diff --git a/Documentation/devicetree/bindings/usb/exynos-usb.txt
>> b/Documentation/devicetree/bindings/usb/exynos-usb.txt
>> new file mode 100644
>> index 0000000..56e35c7
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/usb/exynos-usb.txt
>> @@ -0,0 +1,25 @@
>> +Samsung Exynos SoC USB controller
>> +
>> +The USB devices interface with USB controllers on Exynos SOCs.
>> +The device node has following properties.
>> +
>> +EHCI
>> +Required properties:
>> + - compatible: should be "samsung,exynos-ehci" for USB 2.0
>> +   EHCI controller in host mode.
>> + - reg: physical base address of the controller and length of memory mapped
>> +   region.
>> + - interrupts: interrupt number to the cpu.
>> +
>> +Optional properties:
>> + - samsung,vbus-gpio:  if present, specifies the GPIO that
>> +   needs to be pulled up for the bus to be powered.
>> +
>> +Example:
>> +
>> +     ehci {
>> +             compatible = "samsung,exynos-ehci";
>> +             reg = <0x12110000 0x100>;
>> +             interrupts = <0 71 0>;
>> +             samsung,vbus-gpio = <&gpx2 6 1 3 3>;
>> +     };
>> diff --git a/arch/arm/boot/dts/exynos5250-smdk5250.dts b/arch/arm/boot/dts/exynos5250-smdk5250.dts
>> index a352df4..089576b 100644
>> --- a/arch/arm/boot/dts/exynos5250-smdk5250.dts
>> +++ b/arch/arm/boot/dts/exynos5250-smdk5250.dts
>> @@ -166,4 +166,8 @@
>>       spi_2: spi@12d40000 {
>>               status = "disabled";
>>       };
>> +
>> +     ehci {
>> +             samsung,vbus-gpio = <&gpx2 6 1 3 3>;
>> +     };
>>  };
>> diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos5250.dtsi
>> index dddfd6e..73ea844 100644
>> --- a/arch/arm/boot/dts/exynos5250.dtsi
>> +++ b/arch/arm/boot/dts/exynos5250.dtsi
>> @@ -218,6 +218,12 @@
>>               #size-cells = <0>;
>>       };
>>
>> +     ehci {
>> +             compatible = "samsung,exynos-ehci";
>> +             reg = <0x12110000 0x100>;
>> +             interrupts = <0 71 0>;
>> +     };
>> +
>>       amba {
>>               #address-cells = <1>;
>>               #size-cells = <1>;
>> diff --git a/arch/arm/mach-exynos/include/mach/map.h b/arch/arm/mach-exynos/include/mach/map.h
>> index 8480849..825fe40 100644
>> --- a/arch/arm/mach-exynos/include/mach/map.h
>> +++ b/arch/arm/mach-exynos/include/mach/map.h
>> @@ -195,6 +195,7 @@
>>  #define EXYNOS4_PA_EHCI                      0x12580000
>>  #define EXYNOS4_PA_OHCI                      0x12590000
>>  #define EXYNOS4_PA_HSPHY             0x125B0000
>> +#define EXYNOS5_PA_EHCI                      0x12110000
>>  #define EXYNOS4_PA_MFC                       0x13400000
>>
>>  #define EXYNOS4_PA_UART                      0x13800000
>> diff --git a/arch/arm/mach-exynos/mach-exynos5-dt.c b/arch/arm/mach-exynos/mach-exynos5-dt.c
>> index fee9dcd..6d950d7b 100644
>> --- a/arch/arm/mach-exynos/mach-exynos5-dt.c
>> +++ b/arch/arm/mach-exynos/mach-exynos5-dt.c
>> @@ -72,6 +72,8 @@ static const struct of_dev_auxdata exynos5250_auxdata_lookup[] __initconst = {
>>                               "exynos-gsc.2", NULL),
>>       OF_DEV_AUXDATA("samsung,exynos5-gsc", EXYNOS5_PA_GSC3,
>>                               "exynos-gsc.3", NULL),
>> +     OF_DEV_AUXDATA("samsung,exynos-ehci", EXYNOS5_PA_EHCI,
>> +                                     "s5p-ehci", NULL),
>>       {},
>>  };
>>
>> --
>> 1.7.6.5
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html



-- 
Thanks & Regards
Vivek
