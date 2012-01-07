From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: Re: [PATCH] backlight: lcd: add driver for raster-type lcd's with
 gpio controlled panel reset
Date: Sat, 7 Jan 2012 16:18:33 +0530
Message-ID: <CAJuYYwR9vCohqW91p6_fPw39h-yuxN7cfvhM6s=9bnzPyDKgBQ@mail.gmail.com>
References: <1325778146-27056-1-git-send-email-thomas.abraham@linaro.org>
	<001401cccc19$25b52920$711f7b60$%han@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vw0-f46.google.com ([209.85.212.46]:38885 "EHLO
	mail-vw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751783Ab2AGKse convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 7 Jan 2012 05:48:34 -0500
In-Reply-To: <001401cccc19$25b52920$711f7b60$%han@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Jingoo Han <jg1.han@samsung.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, rpurdie@rpsys.net, linux-samsung-soc@vger.kernel.org, grant.likely@secretlab.ca, rob.herring@calxeda.com, kgene.kim@samsung.com, broonie@opensource.wolfsonmicro.com, kyungmin.park@samsung.com, cbou@mail.ru, kwangwoo.lee@gmail.com, augulis.darius@gmail.com, ben-linux@fluff.org, lars@metafoo.de, patches@linaro.org

Dear Mr. Han,

On 6 January 2012 07:46, Jingoo Han <jg1.han@samsung.com> wrote:
> Hi, Thomas.
[...]

>> =A0obj-$(CONFIG_LCD_PLATFORM) =A0 =A0 =A0+=3D platform_lcd.o
>> +obj-$(CONFIG_LCD_PWRCTRL) =A0 =A0 =A0 +=3D lcd_pwrctrl.o
> Can you remove unnecessary space?
> Please use <tab><space><space><space> instead of <space><tab><space><=
space><space>
> between PWRCTRL) and +=3D lcd_.

Ok. I will fix that.

>> [...]
>> +static struct platform_driver lcd_pwrctrl_driver =3D {
>> + =A0 =A0 .driver =A0 =A0 =A0 =A0 =3D {
>> + =A0 =A0 =A0 =A0 =A0 =A0 .name =A0 =3D "lcd-pwrctrl",
>> + =A0 =A0 =A0 =A0 =A0 =A0 .owner =A0=3D THIS_MODULE,
>> + =A0 =A0 =A0 =A0 =A0 =A0 .of_match_table =3D of_match_ptr(lcd_pwrct=
rl_match),
>> + =A0 =A0 },
>> + =A0 =A0 .probe =A0 =A0 =A0 =A0 =A0=3D lcd_pwrctrl_probe,
>> + =A0 =A0 .remove =A0 =A0 =A0 =A0 =3D lcd_pwrctrl_remove,
>> + =A0 =A0 .suspend =A0 =A0 =A0 =A0=3D lcd_pwrctrl_suspend,
>> + =A0 =A0 .resume =A0 =A0 =A0 =A0 =3D lcd_pwrctrl_resume,
> Please use 'struct dev_pm_ops'.

Ok.

>> +};
>> +
>> +static int __init lcd_pwrctrl_init(void)
>> +{
>> + =A0 =A0 return platform_driver_register(&lcd_pwrctrl_driver);
>> +}
>> +
>> +static void __exit lcd_pwrctrl_cleanup(void)
>> +{
>> + =A0 =A0 platform_driver_unregister(&lcd_pwrctrl_driver);
>> +}
>> +
>> +module_init(lcd_pwrctrl_init);
>> +module_exit(lcd_pwrctrl_cleanup);
> Use module_platform_driver(lcd_pwrctrl_driver).
> It can make the code simpler.

Ok. Thanks for your review Mr. Han. I will do the required changes.

Regards,
Thomas.
