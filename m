From: MyungJoo Ham <myungjoo.ham@samsung.com>
Subject: Re: [PATCH 1/2] ARM: S5PV210: Add audio support to Aquila
Date: Fri, 30 Jul 2010 16:34:16 +0900
Message-ID: <AANLkTikskXNKATWRBph0Lej9KGcq--5aXutKDqMb7zZL@mail.gmail.com>
References: <4C4F9E4C.7000001@samsung.com>
	<20100729173825.GE24781@opensource.wolfsonmicro.com>
	<4C527C11.5090409@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-iw0-f174.google.com ([209.85.214.174]:61324 "EHLO
	mail-iw0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751397Ab0G3HeR convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 30 Jul 2010 03:34:17 -0400
Received: by iwn7 with SMTP id 7so1121573iwn.19
        for <linux-samsung-soc@vger.kernel.org>; Fri, 30 Jul 2010 00:34:16 -0700 (PDT)
In-Reply-To: <4C527C11.5090409@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Chanwoo Choi <cw00.choi@samsung.com>
Cc: Mark Brown <broonie@opensource.wolfsonmicro.com>, alsa-devel@alsa-project.org, Kukjin Kim <kgene.kim@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Ben Dooks <ben@simtec.co.uk>, Kyungmin Park <kyungmin.park@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Liam Girdwood <lrg@slimlogic.co.uk>

On Fri, Jul 30, 2010 at 4:15 PM, Chanwoo Choi <cw00.choi@samsung.com> w=
rote:
> Mark Brown wrote:
>> On Wed, Jul 28, 2010 at 12:04:44PM +0900, Chanwoo Choi wrote:
>>
>>> +static struct regulator_consumer_supply wm8994_fixed_voltage0_supp=
lies[] =3D {
>>> + =C2=A0 =C2=A0{
>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.dev_name =C2=A0 =C2=A0 =
=C2=A0 =3D "5-001a",
>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.supply =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =3D "DBVDD",
>>> + =C2=A0 =C2=A0}, {
>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.dev_name =C2=A0 =C2=A0 =
=C2=A0 =3D "5-001a",
>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.supply =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =3D "AVDD2",
>>> + =C2=A0 =C2=A0}, {
>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.dev_name =C2=A0 =C2=A0 =
=C2=A0 =3D "5-001a",
>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.supply =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =3D "CPVDD",
>>> + =C2=A0 =C2=A0},
>>> +
>>> +};
>>> +
>>> +static struct regulator_consumer_supply wm8994_fixed_voltage1_supp=
lies[] =3D {
>>
>> All these fixed voltage regulators seem a bit suspicous for a mobile
>> phone - I'd have expected that the supplies would all be being provi=
ded
>> by your PMIC except for things taken directly from the battery suppl=
y
>> (like the speakers tend to be, for example)? =C2=A0There's no proble=
m with
>> the code itself, it just looks a bit odd.
>>
>
> All these consumer supply of WM8994 codec connected the below regulat=
or(VCC_1.8V) on
> a circuit diagram. "VCC_1.8V" regualtor is always enabled, because it=
 is used to many devices.
> Then I haven't connected all these consumer supply of WM8994 codec to=
 "VCC_1.8V" regulator.
> I will modify that the consumer supply would be provided by PMIC.
>
> static struct regulator_init_data aquila_buck3_data =3D {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0.constraints =C2=A0 =C2=A0=3D {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.name =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =3D "VCC_1.8V",
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.min_uV =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =3D 1800000,
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.max_uV =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =3D 1800000,
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.apply_uV =C2=A0=
 =C2=A0 =C2=A0 =3D 1,
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.state_mem =C2=
=A0 =C2=A0 =C2=A0=3D {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0.enabled =3D 1,
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0},
> =C2=A0 =C2=A0 =C2=A0 =C2=A0},
> };

This aquila_buck3_data.constraints would be better have ".always_on =3D
1" entry as this buck3 is required to be turned on at all times in
Aquila boards (even when the system is in suspend-to-mem state). This
is required especially when there are many devices physically attached
to Buck3 and some of they did not "register" as consumers to Buck3.
Buck3 might be turned off by those who are registered while
"unregistered" are still active.

>
>>> +static struct i2c_board_info i2c_gpio5_devs[] __initdata =3D {
>>> + =C2=A0 =C2=A0{
>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* CS/ADDR =3D low 0x34 =
(FYI: high =3D 0x36) */
>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0I2C_BOARD_INFO("wm8994",=
 0x34 >> 1),
>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.platform_data =C2=A0=3D=
 &wm8994_platform_data,
>>> + =C2=A0 =C2=A0},
>>> +};
>>
>> Probably clearer for generic Linux use to specify the address as 0x1=
a
>> directly.
>
> Ok, I will do.
>
>>
>>> +static void __init aquila_sound_init(void)
>>> +{
>>> + =C2=A0 =C2=A0unsigned int gpio;
>>> +
>>> + =C2=A0 =C2=A0/* CODEC_XTAL_EN */
>>> + =C2=A0 =C2=A0gpio =3D S5PV210_GPH3(2); =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 /* XEINT_26 */
>>> + =C2=A0 =C2=A0gpio_request(gpio, "CODEC_XTAL_EN");
>>> + =C2=A0 =C2=A0s3c_gpio_cfgpin(gpio, S3C_GPIO_OUTPUT);
>>> + =C2=A0 =C2=A0s3c_gpio_setpull(gpio, S3C_GPIO_PULL_NONE);
>>> + =C2=A0 =C2=A0gpio_direction_output(gpio, 1);
>>
>> Might be as well to provide some or all this stuff in your audio mac=
hine
>> driver?
>
> The Aquila board have a oscillator which provide main clock to
> WM8994 audio codec. The oscillator provide 24MHz clock to WM8994 audi=
o codec
> (MCLK1 pin). I set gpio setting of "CODEC_XTAL_EN" to enable a oscill=
ator.
>
>>
>>> + =C2=A0 =C2=A0/* MICBIAS_EN */
>>> + =C2=A0 =C2=A0gpio =3D S5PV210_GPJ4(2); =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* XMSMRN */
>>> + =C2=A0 =C2=A0gpio_request(gpio, "MICBIAS_EN");
>>> + =C2=A0 =C2=A0s3c_gpio_cfgpin(gpio, S3C_GPIO_OUTPUT);
>>> + =C2=A0 =C2=A0gpio_direction_output(gpio, 1);
>>
>> This in particular would benefit from keeping the request of the GPI=
O
>> joined up with the driver that uses it.
>
> Ok, I will move this code to machine driver(sound/soc/s3c24xxx/aquila=
_wm8994.c).
>
>>> + =C2=A0 =C2=A0/* ADC_EN */
>>> + =C2=A0 =C2=A0gpio =3D S5PV210_GPJ3(2);
>>> + =C2=A0 =C2=A0gpio_request(gpio, "ADC_EN");
>>> + =C2=A0 =C2=A0s3c_gpio_cfgpin(gpio, S3C_GPIO_OUTPUT);
>>> + =C2=A0 =C2=A0gpio_direction_output(gpio, 1);
>>
>> I'm not sure what this does?
>>
>
> I explained below description about "ADC_EN" :
> "ADC_EN : This gpio enable the ADC device which is used to detect
> =C2=A0the kind of jack. (SND_JACK_HEADPHONE/HEADSET/MECHANICAL/AVOUT)
> =C2=A0According to the kind of jack, an electric current is changed.
> =C2=A0(Only used on Aquila board) "
>
> When inserting the jack to Aquila board, I used ADC driver so that, d=
etecting
> the kind of jack(SND_JACK_HEADPHONE/HEADSET/MECHANICAL/AVOUT).
>
> I will separately make the another function to initialize ADC driver.
>
> Thank you for your comment.
> Chanwoo Choi
>
>
>
>
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
>



--=20
MyungJoo Ham (=ED=95=A8=EB=AA=85=EC=A3=BC), Ph.D.
Mobile Software Platform Lab,
Digital Media and Communications (DMC) Business
Samsung Electronics
cell: 82-10-6714-2858
