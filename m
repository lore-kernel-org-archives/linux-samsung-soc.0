From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: Re: [PATCH-Resend 2/2] ARM: EXYNOS: Add HSOTG support to SMDK4X12
Date: Tue, 19 Jun 2012 14:59:59 +0530
Message-ID: <CAK9yfHzYaUW0tEAVKjrTAHj3+vFtr0PJKUYR6P_n+CehHY1z5w@mail.gmail.com>
References: <1337849726-17744-1-git-send-email-sachin.kamat@linaro.org>
	<1337849726-17744-2-git-send-email-sachin.kamat@linaro.org>
	<019f01cd4df8$b9c50f20$2d4f2d60$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vc0-f174.google.com ([209.85.220.174]:46098 "EHLO
	mail-vc0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751058Ab2FSJaA (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 19 Jun 2012 05:30:00 -0400
Received: by vcbf11 with SMTP id f11so3121157vcb.19
        for <linux-samsung-soc@vger.kernel.org>; Tue, 19 Jun 2012 02:29:59 -0700 (PDT)
In-Reply-To: <019f01cd4df8$b9c50f20$2d4f2d60$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, patches@linaro.org

On 19/06/2012, Kukjin Kim <kgene.kim@samsung.com> wrote:
> Sachin Kamat wrote:
>>
>> S3C-HSOTG support is added to SMDK4212 and SMDK4412 boards.
>>
>> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
>> ---
>>  arch/arm/mach-exynos/Kconfig         |    2 ++
>>  arch/arm/mach-exynos/mach-smdk4x12.c |    8 ++++++++
>>  2 files changed, 10 insertions(+), 0 deletions(-)
>>
>> diff --git a/arch/arm/mach-exynos/Kconfig b/arch/arm/mach-exynos/Kconfig
>> index 6682f35..95e3ee3 100644
>> --- a/arch/arm/mach-exynos/Kconfig
>> +++ b/arch/arm/mach-exynos/Kconfig
>> @@ -349,6 +349,7 @@ config MACH_SMDK4212
>>  	select S3C_DEV_I2C3
>>  	select S3C_DEV_I2C7
>>  	select S3C_DEV_RTC
>> +	select S3C_DEV_USB_HSOTG
>>  	select S3C_DEV_WDT
>>  	select SAMSUNG_DEV_BACKLIGHT
>>  	select SAMSUNG_DEV_KEYPAD
>> @@ -359,6 +360,7 @@ config MACH_SMDK4212
>>  	select EXYNOS4_SETUP_I2C7
>>  	select EXYNOS4_SETUP_KEYPAD
>>  	select EXYNOS4_SETUP_SDHCI
>> +	select EXYNOS4_SETUP_USB_PHY
>>  	help
>>  	  Machine support for Samsung SMDK4212
>>
>> diff --git a/arch/arm/mach-exynos/mach-smdk4x12.c b/arch/arm/mach-
>> exynos/mach-smdk4x12.c
>> index d00e4f0..6d8f325 100644
>> --- a/arch/arm/mach-exynos/mach-smdk4x12.c
>> +++ b/arch/arm/mach-exynos/mach-smdk4x12.c
>> @@ -19,6 +19,7 @@
>>  #include <linux/pwm_backlight.h>
>>  #include <linux/regulator/machine.h>
>>  #include <linux/serial_core.h>
>> +#include <linux/platform_data/s3c-hsotg.h>
>>
>>  #include <asm/mach/arch.h>
>>  #include <asm/hardware/gic.h>
>> @@ -235,6 +236,9 @@ static struct samsung_keypad_platdata
>> smdk4x12_keypad_data __initdata = {
>>  	.cols		= 5,
>>  };
>>
>> +/* USB OTG */
>> +static struct s3c_hsotg_plat smdk4x12_hsotg_pdata;
>> +
>>  static struct platform_device *smdk4x12_devices[] __initdata = {
>>  	&s3c_device_hsmmc2,
>>  	&s3c_device_hsmmc3,
>> @@ -243,6 +247,7 @@ static struct platform_device *smdk4x12_devices[]
>> __initdata = {
>>  	&s3c_device_i2c3,
>>  	&s3c_device_i2c7,
>>  	&s3c_device_rtc,
>> +	&s3c_device_usb_hsotg,
>>  	&s3c_device_wdt,
>>  	&samsung_device_keypad,
>>  };
>> @@ -281,6 +286,9 @@ static void __init smdk4x12_machine_init(void)
>>  	s3c_sdhci2_set_platdata(&smdk4x12_hsmmc2_pdata);
>>  	s3c_sdhci3_set_platdata(&smdk4x12_hsmmc3_pdata);
>>
>> +	s3c_hsotg_set_platdata(&smdk4x12_hsotg_pdata);
>> +	clk_xusbxti.rate = 24000000;
>
> Well, already clk_xusbxti.rate is declared at the same file?
>
> 257 static void __init smdk4x12_map_io(void)
> 258 {
> 259 	clk_xusbxti.rate = 24000000;

Yes, right.
I will delete it from machine_init.

> 260
>
>
>
> Thanks.
>
> Best regards,
> Kgene.
> --
> Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
> SW Solution Development Team, Samsung Electronics Co., Ltd.
>
>


-- 
With warm regards,
Sachin
