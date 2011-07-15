From: Ajay kumar <ajaynumb@gmail.com>
Subject: Re: [PATCH 6/6] ARM: S5P6450: Add LCD-LTE480 and enable Framebuffer support
Date: Fri, 15 Jul 2011 12:25:33 +0530
Message-ID: <CAEC9eQMuUxHxmVkViRv2Vit6HtQmoOSmLRhN6-ngMsgV=VPD2g@mail.gmail.com>
References: <18967554.25641310709947612.JavaMail.weblogic@epv6ml06>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-fx0-f52.google.com ([209.85.161.52]:53897 "EHLO
	mail-fx0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755276Ab1GOGzf convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 15 Jul 2011 02:55:35 -0400
Received: by fxd18 with SMTP id 18so2332996fxd.11
        for <linux-samsung-soc@vger.kernel.org>; Thu, 14 Jul 2011 23:55:34 -0700 (PDT)
In-Reply-To: <18967554.25641310709947612.JavaMail.weblogic@epv6ml06>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: jg1.han@samsung.com
Cc: AJAY KUMAR RAMAKRISHNA SHYMALAMMA <ajaykumar.rs@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "lethal@linux-sh.org" <lethal@linux-sh.org>

Hi Jingoo,

2011/7/15 JinGoo Han <jg1.han@samsung.com>:
> Hi, Ajay Kumar.
> Please read my comments.
>> -----Original Message-----
>> From: Ajay Kumar [mailto:ajaykumar.rs@samsung.com]
>> Sent: Thursday, July 14, 2011 10:27 PM
>> To: kgene.kim@samsung.com; linux-samsung-soc@vger.kernel.org; linux-=
arm-
>> kernel@lists.infradead.org; lethal@linux-sh.org; jg1.han@samsung.com
>> Subject: [PATCH 6/6] ARM: S5P6450: Add LCD-LTE480 and enable Framebu=
ffer
>> support
>>
>> This patch:
>> o Adds platform device support for LCD-LTE480.
>> o Adds platform data for FB with win_mode and default_bpp.
>> o Enables FB device support and platform-lcd support.
>>
>> Signed-off-by: Ajay Kumar <ajaykumar.rs@samsung.com>
>> ---
>> =A0arch/arm/mach-s5p64x0/Kconfig =A0 =A0 =A0 =A0 | =A0 =A02 +
>> =A0arch/arm/mach-s5p64x0/mach-smdk6450.c | =A0 63
>> +++++++++++++++++++++++++++++++++
>> =A02 files changed, 65 insertions(+), 0 deletions(-)
>>
>> diff --git a/arch/arm/mach-s5p64x0/Kconfig b/arch/arm/mach-s5p64x0/K=
config
>> index c69a32d..b9f3aca 100644
>> --- a/arch/arm/mach-s5p64x0/Kconfig
>> +++ b/arch/arm/mach-s5p64x0/Kconfig
>> @@ -53,6 +53,7 @@ config MACH_SMDK6440
>> =A0config MACH_SMDK6450
>> =A0 =A0 =A0 bool "SMDK6450"
>> =A0 =A0 =A0 select CPU_S5P6450
>> + =A0 =A0 select S3C_DEV_FB
>> =A0 =A0 =A0 select S3C_DEV_I2C1
>> =A0 =A0 =A0 select S3C_DEV_RTC
>> =A0 =A0 =A0 select S3C_DEV_WDT
>> @@ -60,6 +61,7 @@ config MACH_SMDK6450
>> =A0 =A0 =A0 select SAMSUNG_DEV_ADC
>> =A0 =A0 =A0 select SAMSUNG_DEV_PWM
>> =A0 =A0 =A0 select SAMSUNG_DEV_TS
>> + =A0 =A0 select S5P64X0_SETUP_FB
>> =A0 =A0 =A0 select S5P64X0_SETUP_I2C1
>> =A0 =A0 =A0 help
>> =A0 =A0 =A0 =A0 Machine support for the Samsung SMDK6450
>> diff --git a/arch/arm/mach-s5p64x0/mach-smdk6450.c b/arch/arm/mach-
>> s5p64x0/mach-smdk6450.c
>> index d19c469..7568f38 100644
>> --- a/arch/arm/mach-s5p64x0/mach-smdk6450.c
>> +++ b/arch/arm/mach-s5p64x0/mach-smdk6450.c
>> @@ -23,6 +23,7 @@
>> =A0#include <linux/clk.h>
>> =A0#include <linux/gpio.h>
>> =A0#include <linux/pwm_backlight.h>
>> +#include <linux/fb.h>
>>
>> =A0#include <asm/mach/arch.h>
>> =A0#include <asm/mach/map.h>
>> @@ -34,6 +35,7 @@
>> =A0#include <mach/regs-clock.h>
>> =A0#include <mach/i2c.h>
>> =A0#include <mach/regs-gpio.h>
>> +#include <mach/regs-fb.h>
>>
>> =A0#include <plat/regs-serial.h>
>> =A0#include <plat/gpio-cfg.h>
>> @@ -46,6 +48,9 @@
>> =A0#include <plat/adc.h>
>> =A0#include <plat/ts.h>
>> =A0#include <plat/s5p-time.h>
>> +#include <plat/fb.h>
>> +
>> +#include <video/platform_lcd.h>
>>
>> =A0#define SMDK6450_UCON_DEFAULT =A0 =A0 =A0 =A0(S3C2410_UCON_TXILEV=
EL | =A0 =A0 =A0 =A0\
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 S3C2410_=
UCON_RXILEVEL | =A0 =A0 =A0 =A0 \
>> @@ -148,6 +153,59 @@ static struct platform_device
>> smdk6450_backlight_device =3D {
>> =A0 =A0 =A0 },
>> =A0};
>>
>> +/* Frame Buffer */
>> +static struct s3c_fb_pd_win s5p6450_fb_win0 =3D {
> This information also depends on LCD panel on the board.
> So, s5p6450_fb_win0 should be changed to smdk6450_fb_win0.
>> +/* this is to ensure we use win0 */
>> + =A0 =A0 .win_mode =A0 =A0 =A0 =3D {
>> + =A0 =A0 =A0 =A0 =A0 =A0 .left_margin =A0 =A0=3D 8,
>> + =A0 =A0 =A0 =A0 =A0 =A0 .right_margin =A0 =3D 13,
>> + =A0 =A0 =A0 =A0 =A0 =A0 .upper_margin =A0 =3D 7,
>> + =A0 =A0 =A0 =A0 =A0 =A0 .lower_margin =A0 =3D 5,
>> + =A0 =A0 =A0 =A0 =A0 =A0 .hsync_len =A0 =A0 =A0=3D 3,
>> + =A0 =A0 =A0 =A0 =A0 =A0 .vsync_len =A0 =A0 =A0=3D 1,
>> + =A0 =A0 =A0 =A0 =A0 =A0 .xres =A0 =A0 =A0 =A0 =A0 =3D 800,
>> + =A0 =A0 =A0 =A0 =A0 =A0 .yres =A0 =A0 =A0 =A0 =A0 =3D 480,
>> + =A0 =A0 =A0 =A0 =A0 =A0 .refresh =A0 =A0 =A0 =A0=3D 80,
> Why do you use 80Hz as frame rate?
> Please don't add this, if there is no problem when using 60Hz.
>> + =A0 =A0 },
>> + =A0 =A0 .max_bpp =A0 =A0 =A0 =A0=3D 24,
> max_bpp can be 32bpp. FIMD of S5P6440 and S5P6450 can support ARGB 88=
88.
> Please use 32 as max_bpp.
> + =A0 =A0 =A0 .max_bpp =A0 =A0 =A0 =A0=3D 32,
>> + =A0 =A0 .default_bpp =A0 =A0=3D 24,
>> + =A0 =A0 };
> Don't useless tab space.
> It should be as follows.
> +};
>> +
>> +static struct s3c_fb_platdata s5p6450_lcd_pdata __initdata =3D {
>> + =A0 =A0 .win[0] =A0 =A0 =A0 =A0 =3D &s5p6450_fb_win0,
> s5p6450_fb_win0 should be changed to smdk6450_fb_win0.
>> + =A0 =A0 .vidcon0 =A0 =A0 =A0 =A0=3D VIDCON0_VIDOUT_RGB | VIDCON0_P=
NRMODE_RGB,
>> + =A0 =A0 .vidcon1 =A0 =A0 =A0 =A0=3D VIDCON1_INV_HSYNC | VIDCON1_IN=
V_VSYNC,
>> + =A0 =A0 .setup_gpio =A0 =A0 =3D s5p64x0_fb_gpio_setup_24bpp,
>> +};
>> +
>> +/* LCD power controller */
>> +static void s5p6450_lte480_reset_power(struct plat_lcd_data *pd,
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 unsigned int power)
>> +{
>> + =A0 =A0 int err;
>> +
>> + =A0 =A0 if (power) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 err =3D gpio_request(S5P6450_GPN(5), "GPN"=
);
>> + =A0 =A0 =A0 =A0 =A0 =A0 if (err)
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 printk(KERN_ERR "failed to=
 request GPN for lcd
>> reset\n");
>> +
>> + =A0 =A0 =A0 =A0 =A0 =A0 gpio_direction_output(S5P6450_GPN(5), 1);
>> + =A0 =A0 =A0 =A0 =A0 =A0 gpio_set_value(S5P6450_GPN(5), 0);
>> + =A0 =A0 =A0 =A0 =A0 =A0 gpio_set_value(S5P6450_GPN(5), 1);
>> + =A0 =A0 =A0 =A0 =A0 =A0 gpio_free(S5P6450_GPN(5));
>> + =A0 =A0 }
>> +}
>> +
>> +static struct plat_lcd_data s5p6450_lcd_power_data =3D {
>> + =A0 =A0 .set_power =A0 =A0 =A0=3D s5p6450_lte480_reset_power,
>> +};
>> +
>> +static struct platform_device smdk6450_lcd_lte480wv =3D {
>> + =A0 =A0 .name =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =3D "platform-lc=
d",
>> + =A0 =A0 .dev.parent =A0 =A0 =A0 =A0 =A0 =A0 =3D &s3c_device_fb.dev=
,
>> + =A0 =A0 .dev.platform_data =A0 =A0 =A0=3D &s5p6450_lcd_power_data,
>> +};
>> +
> Please change s5p6450_ lte480 to smdk6450_ lte480.
> LCD reset GPIO pin can be changed according to the board.
>> =A0static struct platform_device *smdk6450_devices[] __initdata =3D =
{
>> =A0 =A0 =A0 &s3c_device_adc,
>> =A0 =A0 =A0 &s3c_device_rtc,
>> @@ -159,6 +217,9 @@ static struct platform_device *smdk6450_devices[=
]
>> __initdata =3D {
>> =A0 =A0 =A0 &s5p6450_device_iis0,
>> =A0 =A0 =A0 &s3c_device_timer[1],
>> =A0 =A0 =A0 &smdk6450_backlight_device,
>> + =A0 =A0 &s3c_device_fb,
>> + =A0 =A0 &smdk6450_lcd_lte480wv,
>> +
>> =A0 =A0 =A0 /* s5p6450_device_spi0 will be added */
>> =A0};
>>
>> @@ -212,6 +273,8 @@ static void __init smdk6450_machine_init(void)
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ARRAY_SIZE(smdk6450_i2c_=
devs0));
>> =A0 =A0 =A0 i2c_register_board_info(1, smdk6450_i2c_devs1,
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ARRAY_SIZE(smdk6450_i2c_=
devs1));
>> + =A0 =A0 s3c_fb_set_platdata(&s5p6450_lcd_pdata);
>> + =A0 =A0 s5p64x0_fb_init(S5P64X0_SPCON0_LCD_SEL_RGB);
>>
>> =A0 =A0 =A0 platform_add_devices(smdk6450_devices,
>> ARRAY_SIZE(smdk6450_devices));
>> =A0}
>> --
>> 1.7.1
>

Thanks for your comments.
Right now I am looking forward for more comments.
I will fix the same and send a V2 patch-set next week.
