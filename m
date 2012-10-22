From: Vivek Gautam <gautamvivek1987@gmail.com>
Subject: Re: [PATCH 2/4 v2] ARM: Exynos5250: Enabling samsung-usbphy driver
Date: Mon, 22 Oct 2012 10:48:15 +0530
Message-ID: <CAFp+6iGSeVPi-S8Jeoi9XkLWcyBFYRK3ye0T1URZNRa+v9PfpQ@mail.gmail.com>
References: <1349865780-7701-1-git-send-email-gautam.vivek@samsung.com>
	<1349865780-7701-3-git-send-email-gautam.vivek@samsung.com>
	<00c801cdb012$8726a890$9573f9b0$%han@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-la0-f46.google.com ([209.85.215.46]:63221 "EHLO
	mail-la0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753494Ab2JVFSR (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 22 Oct 2012 01:18:17 -0400
In-Reply-To: <00c801cdb012$8726a890$9573f9b0$%han@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Jingoo Han <jg1.han@samsung.com>
Cc: Vivek Gautam <gautam.vivek@samsung.com>, linux-usb@vger.kernel.org, linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, gregkh@linuxfoundation.org, stern@rowland.harvard.edu, balbi@ti.com, rob.herring@calxeda.com, kgene.kim@samsung.com, thomas.abraham@linaro.org, kishon@ti.com, p.paneri@samsung.com, yulgon.kim@samsung.com

Hi,

On Mon, Oct 22, 2012 at 10:33 AM, Jingoo Han <jg1.han@samsung.com> wrote:
> On Wednesday, October 10, 2012 7:43 PM Vivek Gautam wrote
>>
>> Adding usbphy node for Exynos5250 along with the platform data.
>>
>> Signed-off-by: Vivek Gautam <gautam.vivek@samsung.com>
>> ---
>>  .../devicetree/bindings/usb/samsung-usbphy.txt     |   12 +++++-
>>  arch/arm/boot/dts/exynos5250.dtsi                  |    5 ++
>>  arch/arm/mach-exynos/Kconfig                       |    1 +
>>  arch/arm/mach-exynos/include/mach/map.h            |    1 +
>>  arch/arm/mach-exynos/mach-exynos5-dt.c             |   10 +++++
>>  arch/arm/mach-exynos/setup-usb-phy.c               |   43 ++++++++++++++++---
>>  arch/arm/plat-samsung/include/plat/usb-phy.h       |    1 +
>>  include/linux/platform_data/samsung-usbphy.h       |    1 +
>>  8 files changed, 65 insertions(+), 9 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/usb/samsung-usbphy.txt
>> b/Documentation/devicetree/bindings/usb/samsung-usbphy.txt
>> index 7d54d59..c644d01 100644
>> --- a/Documentation/devicetree/bindings/usb/samsung-usbphy.txt
>> +++ b/Documentation/devicetree/bindings/usb/samsung-usbphy.txt
>> @@ -1,11 +1,19 @@
>>  * Samsung's usb phy transceiver
>>
>> -The Samsung's phy transceiver is used for controlling usb otg phy for
>> -s3c-hsotg usb device controller.
>> +The Samsung's phy transceiver is used for controlling usb phy for
>> +s3c-hsotg as well as ehci-s5p and ohci-exynos usb controllers
>> +across Samsung SOCs.
>>  TODO: Adding the PHY binding with controller(s) according to the under
>>  developement generic PHY driver.
>>
>> +Exynos4210:
>>  Required properties:
>>  - compatible : should be "samsung,exynos4210-usbphy"
>>  - reg : base physical address of the phy registers and length of memory mapped
>>       region.
>> +
>> +Exynos5250:
>> +Required properties:
>> +- compatible : should be "samsung,exynos5250-usbphy"
>> +- reg : base physical address of the phy registers and length of memory mapped
>> +     region.
>> diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos5250.dtsi
>> index dddfd6e..82bf042 100644
>> --- a/arch/arm/boot/dts/exynos5250.dtsi
>> +++ b/arch/arm/boot/dts/exynos5250.dtsi
>> @@ -218,6 +218,11 @@
>>               #size-cells = <0>;
>>       };
>>
>> +     usbphy {
>> +             compatible = "samsung,exynos5250-usbphy";
>> +             reg = <0x12130000 0x100>;
>> +     };
>> +
>>       amba {
>>               #address-cells = <1>;
>>               #size-cells = <1>;
>> diff --git a/arch/arm/mach-exynos/Kconfig b/arch/arm/mach-exynos/Kconfig
>> index 4372075..e8e3d7b 100644
>> --- a/arch/arm/mach-exynos/Kconfig
>> +++ b/arch/arm/mach-exynos/Kconfig
>> @@ -422,6 +422,7 @@ config MACH_EXYNOS5_DT
>>       select SOC_EXYNOS5250
>>       select USE_OF
>>       select ARM_AMBA
>> +     select EXYNOS4_SETUP_USB_PHY
>>       help
>>         Machine support for Samsung EXYNOS5 machine with device tree enabled.
>>         Select this if a fdt blob is available for the EXYNOS5 SoC based board.
>> diff --git a/arch/arm/mach-exynos/include/mach/map.h b/arch/arm/mach-exynos/include/mach/map.h
>> index 9694424..7f5eb03 100644
>> --- a/arch/arm/mach-exynos/include/mach/map.h
>> +++ b/arch/arm/mach-exynos/include/mach/map.h
>> @@ -195,6 +195,7 @@
>>  #define EXYNOS4_PA_EHCI                      0x12580000
>>  #define EXYNOS4_PA_OHCI                      0x12590000
>>  #define EXYNOS4_PA_HSPHY             0x125B0000
>> +#define EXYNOS5_PA_HSPHY             0x12130000
>>  #define EXYNOS4_PA_MFC                       0x13400000
>>
>>  #define EXYNOS4_PA_UART                      0x13800000
>> diff --git a/arch/arm/mach-exynos/mach-exynos5-dt.c b/arch/arm/mach-exynos/mach-exynos5-dt.c
>> index db1cd8e..bc041be 100644
>> --- a/arch/arm/mach-exynos/mach-exynos5-dt.c
>> +++ b/arch/arm/mach-exynos/mach-exynos5-dt.c
>> @@ -11,6 +11,7 @@
>>
>>  #include <linux/of_platform.h>
>>  #include <linux/serial_core.h>
>> +#include <linux/platform_data/samsung-usbphy.h>
>>
>>  #include <asm/mach/arch.h>
>>  #include <asm/hardware/gic.h>
>> @@ -18,9 +19,16 @@
>>
>>  #include <plat/cpu.h>
>>  #include <plat/regs-serial.h>
>> +#include <plat/usb-phy.h>
>>
>>  #include "common.h"
>>
>> +static struct samsung_usbphy_data exynos5_usbphy_pdata = {
>> +     .pmu_isolation = s5p_usb_phy_pmu_isolation,
>> +     .phy_cfg_sel = s5p_usb_phy_cfg_sel,
>> +     .type = TYPE_HOST,
>> +};
>> +
>>  /*
>>   * The following lookup table is used to override device names when devices
>>   * are registered from device tree. This is temporarily added to enable
>> @@ -72,6 +80,8 @@ static const struct of_dev_auxdata exynos5250_auxdata_lookup[] __initconst = {
>>                               "exynos-gsc.2", NULL),
>>       OF_DEV_AUXDATA("samsung,exynos5-gsc", EXYNOS5_PA_GSC3,
>>                               "exynos-gsc.3", NULL),
>> +     OF_DEV_AUXDATA("samsung,exynos5250-usbphy", EXYNOS5_PA_HSPHY,
>> +                             "s3c-usbphy", &exynos5_usbphy_pdata),
>>       {},
>>  };
>>
>> diff --git a/arch/arm/mach-exynos/setup-usb-phy.c b/arch/arm/mach-exynos/setup-usb-phy.c
>> index be6cd4f..bebc99b 100644
>> --- a/arch/arm/mach-exynos/setup-usb-phy.c
>> +++ b/arch/arm/mach-exynos/setup-usb-phy.c
>> @@ -14,11 +14,15 @@
>>  #include <linux/err.h>
>>  #include <linux/io.h>
>>  #include <linux/platform_device.h>
>> +#include <linux/platform_data/samsung-usbphy.h>
>>  #include <mach/regs-pmu.h>
>>  #include <mach/regs-usb-phy.h>
>>  #include <plat/cpu.h>
>> +#include <plat/map-base.h>
>>  #include <plat/usb-phy.h>
>>
>> +#define EXYNOS5_USB_CFG                      (S3C_VA_SYS + (0x230))
>
> The parentheses around 0x230 is not necessary.
>
> +#define EXYNOS5_USB_CFG                        (S3C_VA_SYS + 0x230)
>
Ok, will remove them.

>
>> +
>>  static atomic_t host_usage;
>>
>>  static int exynos4_usb_host_phy_is_on(void)
>> @@ -224,13 +228,38 @@ int s5p_usb_phy_exit(struct platform_device *pdev, int type)
>>
>>  void s5p_usb_phy_pmu_isolation(int on, int type)
>>  {
>> -     if (on) {
>> -             writel(readl(S5P_USBDEVICE_PHY_CONTROL)
>> -                     & ~S5P_USBDEVICE_PHY_ENABLE,
>> -                             S5P_USBDEVICE_PHY_CONTROL);
>> +     if (type == TYPE_HOST) {
>> +             if (on) {
>> +                     writel(readl(S5P_USBHOST_PHY_CONTROL)
>> +                             & ~S5P_USBHOST_PHY_ENABLE,
>> +                                     S5P_USBHOST_PHY_CONTROL);
>> +             } else {
>> +                     writel(readl(S5P_USBHOST_PHY_CONTROL)
>> +                             | S5P_USBHOST_PHY_ENABLE,
>> +                                     S5P_USBHOST_PHY_CONTROL);
>> +             }
>>       } else {
>> -             writel(readl(S5P_USBDEVICE_PHY_CONTROL)
>> -                     | S5P_USBDEVICE_PHY_ENABLE,
>> -                             S5P_USBDEVICE_PHY_CONTROL);
>> +             if (on) {
>> +                     writel(readl(S5P_USBDEVICE_PHY_CONTROL)
>> +                             & ~S5P_USBDEVICE_PHY_ENABLE,
>> +                                     S5P_USBDEVICE_PHY_CONTROL);
>> +             } else {
>> +                     writel(readl(S5P_USBDEVICE_PHY_CONTROL)
>> +                             | S5P_USBDEVICE_PHY_ENABLE,
>> +                                     S5P_USBDEVICE_PHY_CONTROL);
>> +             }
>>       }
>>  }
>> +
>> +/* Switch between HOST and OTG link from PHY_CFG */
>> +void s5p_usb_phy_cfg_sel(struct device *dev, int type)
>> +{
>> +     u32 is_host;
>> +
>> +     is_host = readl(EXYNOS5_USB_CFG);
>> +     writel(type, EXYNOS5_USB_CFG);
>> +
>> +     if (is_host != type)
>> +             dev_dbg(dev, "Changed USB MUX from %s to %s",
>> +                     is_host ? "Host" : "Device", type ? "Host" : "Device");
>> +}
>> diff --git a/arch/arm/plat-samsung/include/plat/usb-phy.h b/arch/arm/plat-samsung/include/plat/usb-phy.h
>> index 7a4a959..a57b8bb 100644
>> --- a/arch/arm/plat-samsung/include/plat/usb-phy.h
>> +++ b/arch/arm/plat-samsung/include/plat/usb-phy.h
>> @@ -19,5 +19,6 @@ enum s5p_usb_phy_type {
>>  extern int s5p_usb_phy_init(struct platform_device *pdev, int type);
>>  extern int s5p_usb_phy_exit(struct platform_device *pdev, int type);
>>  extern void s5p_usb_phy_pmu_isolation(int on, int type);
>> +extern void s5p_usb_phy_cfg_sel(struct device *dev, int type);
>>
>>  #endif /* __PLAT_SAMSUNG_USB_PHY_H */
>> diff --git a/include/linux/platform_data/samsung-usbphy.h b/include/linux/platform_data/samsung-usbphy.h
>> index 364a38a..2b400e0 100644
>> --- a/include/linux/platform_data/samsung-usbphy.h
>> +++ b/include/linux/platform_data/samsung-usbphy.h
>> @@ -25,6 +25,7 @@ enum phy_type {
>>
>>  struct samsung_usbphy_data {
>>       void (*pmu_isolation)(int on, int phy_type);
>> +     void (*phy_cfg_sel)(struct device *dev, int phy_type);
>>       int type;
>>  };
>>
>> --
>> 1.7.6.5
>>
>> --
>> To unsubscribe from this list: send the line "unsubscribe linux-usb" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

Thanks & Regards
Vivek
