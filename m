From: Kyungmin Park <kyungmin.park@samsung.com>
Subject: Re: [PATCH 1/2] ARM: S5PV210: Add audio support to Aquila
Date: Fri, 30 Jul 2010 09:14:30 +0900
Message-ID: <AANLkTimiLMqJ1qewOGr6jy=MhAgQpM0Z1yxYYz4xeraL@mail.gmail.com>
References: <4C4F9E4C.7000001@samsung.com>
	<4C52053A.8090400@simtec.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vw0-f46.google.com ([209.85.212.46]:50338 "EHLO
	mail-vw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755912Ab0G3AOb convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 29 Jul 2010 20:14:31 -0400
Received: by vws3 with SMTP id 3so796401vws.19
        for <linux-samsung-soc@vger.kernel.org>; Thu, 29 Jul 2010 17:14:31 -0700 (PDT)
In-Reply-To: <4C52053A.8090400@simtec.co.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Ben Dooks <ben@simtec.co.uk>
Cc: Chanwoo Choi <cw00.choi@samsung.com>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, alsa-devel@alsa-project.org, Kukjin Kim <kgene.kim@samsung.com>, Mark Brown <broonie@opensource.wolfsonmicro.com>, Liam Girdwood <lrg@slimlogic.co.uk>, Joonyoung Shim <jy0922.shim@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>

On Fri, Jul 30, 2010 at 7:48 AM, Ben Dooks <ben@simtec.co.uk> wrote:
> On 28/07/10 04:04, Chanwoo Choi wrote:
>
> [snip]
>
>
>> +/* GPIO I2C AP 1.8V */
>> +#define AP_I2C_GPIO_BUS_5 =A0 =A05
>> +static struct i2c_gpio_platform_data i2c_gpio5_data =3D {
>> + =A0 =A0 .sda_pin =A0 =A0 =A0 =A0=3D S5PV210_MP05(3), =A0 =A0 =A0/*=
 XM0ADDR_11 */
>> + =A0 =A0 .scl_pin =A0 =A0 =A0 =A0=3D S5PV210_MP05(2), =A0 =A0 =A0/*=
 XM0ADDR_10 */
>> +};
>> +
>> +static struct platform_device i2c_gpio5 =3D {
>> + =A0 =A0 .name =A0 =A0 =A0 =A0 =A0 =3D "i2c-gpio",
>> + =A0 =A0 .id =A0 =A0 =A0 =A0 =A0 =A0 =3D AP_I2C_GPIO_BUS_5,
>> + =A0 =A0 .dev =A0 =A0 =A0 =A0 =A0 =A0=3D {
>> + =A0 =A0 =A0 =A0 =A0 =A0 .platform_data =A0=3D &i2c_gpio5_data,
>> + =A0 =A0 },
>> +};
>> +
>> +static struct i2c_board_info i2c_gpio5_devs[] __initdata =3D {
>> + =A0 =A0 {
>> + =A0 =A0 =A0 =A0 =A0 =A0 /* CS/ADDR =3D low 0x34 (FYI: high =3D 0x3=
6) */
>> + =A0 =A0 =A0 =A0 =A0 =A0 I2C_BOARD_INFO("wm8994", 0x34 >> 1),
>> + =A0 =A0 =A0 =A0 =A0 =A0 .platform_data =A0=3D &wm8994_platform_dat=
a,
>> + =A0 =A0 },
>> +};
>> +
>> +static void __init aquila_sound_init(void)
>> +{
>> + =A0 =A0 unsigned int gpio;
>> +
>> + =A0 =A0 /* CODEC_XTAL_EN */
>> + =A0 =A0 gpio =3D S5PV210_GPH3(2); =A0 =A0 =A0 =A0 /* XEINT_26 */
>> + =A0 =A0 gpio_request(gpio, "CODEC_XTAL_EN");
>> + =A0 =A0 s3c_gpio_cfgpin(gpio, S3C_GPIO_OUTPUT);
>> + =A0 =A0 s3c_gpio_setpull(gpio, S3C_GPIO_PULL_NONE);
>> + =A0 =A0 gpio_direction_output(gpio, 1);
>
> gpio_direction_output() should have done the cfgpin()
> call.

Good catch. Thanks.

I think we required that extend the current gpiolib to support the
setpull like functions. also sleep gpio pin configuration.
Marek or shim? do you have any ideas?

>
>> + =A0 =A0 /* CLKOUT[9:8] set to 0x3(XUSBXTI) of 0xE010E000(OTHERS)
>> + =A0 =A0 =A0* for 24MHZ
>> + =A0 =A0 =A0*/
>> + =A0 =A0 writel(readl(S5P_OTHERS) | (0x3 << 8), S5P_OTHERS);
>
> Not sure if this should be being done directly? will it affect
> the current clock tree?

It's almost done by bootloader. but we make sure it's really routed
the CLKOUT to XUSBXTI.

Thank you,
Kyungmin Park

>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsu=
ng-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>
