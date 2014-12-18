From: Vasily Khoruzhick <anarsoul@gmail.com>
Subject: Re: DT on s3c24xx
Date: Thu, 18 Dec 2014 11:34:15 +0300
Message-ID: <CA+E=qVeU4hEX2x9uAPfgqEgpxvA7bUBWqWJtBJdbP=RK6ghfEQ@mail.gmail.com>
References: <CA+E=qVf4nT5x-fRFBu=Wv_VKUnEMAEP4GgJG8em8NyUFkwtbPg@mail.gmail.com>
 <20141218075205.GB10857@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-oi0-f51.google.com ([209.85.218.51]:50341 "EHLO
	mail-oi0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752385AbaLRIeg convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 18 Dec 2014 03:34:36 -0500
In-Reply-To: <20141218075205.GB10857@pengutronix.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: arm-linux <linux-arm-kernel@lists.infradead.org>, Kukjin Kim <kgene.kim@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Ben Dooks <ben-linux@fluff.org>, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org

On Thu, Dec 18, 2014 at 10:52 AM, Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:
> Hello,

Hi Uwe,

> [Cc +=3D linusw, linux-gpio]
>
> On Wed, Dec 17, 2014 at 10:04:24PM +0300, Vasily Khoruzhick wrote:
>> I'd like to port several s3c24xx to DT, and I'm stuck with s3c24xx L=
CD
>> controller and power drivers for H1940 and RX1950.
>>
>> Please see [1]. I want to move this function into another LCD power
>> driver, but I'm not sure what to do with s3c_gpio_cfgpin(). I need t=
o
>> change pin function in runtime, and as far as I understand it should
>> be handled via pinctrl driver somehow. But how?
> You can pass >1 pinctrl setups to a node:
>
>         somedevice {
>                 pinctrl-names =3D "default", "foo", "bar";
>                 pinctrl-0 =3D <&pinctrl_somedevice_default>;
>                 pinctrl-1 =3D <&pinctrl_somedevice_foo>;
>                 pinctrl-2 =3D <&pinctrl_somedevice_bar>;
>                 cfg-gpios =3D <&gpio4 12 3>, <&gpio2 7 5>;
>         };
>
> Then I think you can fiddle with pinctrl_select_state(). For the gpio=
s
> you can then use the standard gpiod_{request,direction_{in,out}put}
> combo.

Thanks for you response!

Can I change pin function after gpio was requested? In low-power state
(i.e. when display is disabled) it's gpio driving some level,
and in active state it's some LCD controller pin (don't remember which
one exactly)

Regards,
Vasily

>
> Best regards
> Uwe
>
> --
> Pengutronix e.K.                           | Uwe Kleine-K=C3=B6nig   =
         |
> Industrial Linux Solutions                 | http://www.pengutronix.d=
e/  |
