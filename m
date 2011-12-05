From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: Re: [PATCH] backlight: add regulator support for platform_lcd driver
Date: Mon, 5 Dec 2011 16:06:17 +0530
Message-ID: <CAJuYYwTT2jbbquZM=ZwK=Gh39ss=iG0WDCc3TYjzHLEgfeC1gA@mail.gmail.com>
References: <1323074921-29291-1-git-send-email-thomas.abraham@linaro.org>
	<CAH9JG2XJ4TCEaN1rMRjMZNRn5Wx6jcTRC_DmyN4Qyf2zztWSsg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vx0-f174.google.com ([209.85.220.174]:44639 "EHLO
	mail-vx0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755982Ab1LEKgS convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 5 Dec 2011 05:36:18 -0500
In-Reply-To: <CAH9JG2XJ4TCEaN1rMRjMZNRn5Wx6jcTRC_DmyN4Qyf2zztWSsg@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kyungmin Park <kmpark@infradead.org>
Cc: rpurdie@rpsys.net, ben-linux@fluff.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, patches@linaro.org, Mark Brown <broonie@opensource.wolfsonmicro.com>, Linus Walleij <linus.walleij@linaro.org>, Rajendra Nayak <rnayak@ti.com>

Dear Mr. Park,

On 5 December 2011 15:40, Kyungmin Park <kmpark@infradead.org> wrote:
[...]

>> + =A0 =A0 /*
>> + =A0 =A0 =A0* If power to lcd and/or lcd interface is controlled us=
ing a regulator,
>> + =A0 =A0 =A0* enable or disable the regulator based in the power se=
tting.
>> + =A0 =A0 =A0*/
>> + =A0 =A0 lcd_regulator =3D regulator_get(plcd->us, "vcc_lcd");
>> + =A0 =A0 if (IS_ERR(lcd_regulator)) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 dev_info(plcd->us, "could not get regulato=
r\n");
>> + =A0 =A0 =A0 =A0 =A0 =A0 goto set_power;
>> + =A0 =A0 }
>
> Recent regulator discussion. it should be failed instead fall through
> gracefully.

Ok. But in this case, there could be boards that do not use a
regulator for the lcd/display interface. Is it mandatory for fail if
regulator is not found. Sorry, I have not read through the regulator
discussion.

>> +
>> + =A0 =A0 if (lcd_power) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 if (plcd->pdata->min_uV || plcd->pdata->ma=
x_uV)
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (regulator_set_voltage(=
lcd_regulator,
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 plcd->pdat=
a->min_uV, plcd->pdata->max_uV))
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 dev_info(p=
lcd->us,
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 "regulator voltage set failed\n");
> Are there case to change the voltage? Doesn't it easy to set the
> voltage at board file? I mean don't need to setup at drivers?

The constraint 'apply_uV' cannot be expressed with a device tree. So
there has be a mechanism to set the required output voltage for a
regulator.

In case of platform-lcd driver, the power source should be turned off
to the lcd/interfaces until the display controller driver is enabled.
Powering on the lcd/interfaces at boot time by default would not be
ideal.

Thanks for your review and comments.

Regards,
Thomas.

>
> Thank you,
> Kyungmin Park

[...]
