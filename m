From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?=
	<u.kleine-koenig@pengutronix.de>
Subject: Re: DT on s3c24xx
Date: Thu, 18 Dec 2014 08:52:05 +0100
Message-ID: <20141218075205.GB10857@pengutronix.de>
References: <CA+E=qVf4nT5x-fRFBu=Wv_VKUnEMAEP4GgJG8em8NyUFkwtbPg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from metis.ext.pengutronix.de ([92.198.50.35]:45725 "EHLO
	metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751857AbaLRHwY (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 18 Dec 2014 02:52:24 -0500
Content-Disposition: inline
In-Reply-To: <CA+E=qVf4nT5x-fRFBu=Wv_VKUnEMAEP4GgJG8em8NyUFkwtbPg@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Vasily Khoruzhick <anarsoul@gmail.com>
Cc: arm-linux <linux-arm-kernel@lists.infradead.org>, Kukjin Kim <kgene.kim@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Ben Dooks <ben-linux@fluff.org>, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org

Hello,

[Cc +=3D linusw, linux-gpio]

On Wed, Dec 17, 2014 at 10:04:24PM +0300, Vasily Khoruzhick wrote:
> I'd like to port several s3c24xx to DT, and I'm stuck with s3c24xx LC=
D
> controller and power drivers for H1940 and RX1950.
>=20
> Please see [1]. I want to move this function into another LCD power
> driver, but I'm not sure what to do with s3c_gpio_cfgpin(). I need to
> change pin function in runtime, and as far as I understand it should
> be handled via pinctrl driver somehow. But how?
You can pass >1 pinctrl setups to a node:

	somedevice {
		pinctrl-names =3D "default", "foo", "bar";
		pinctrl-0 =3D <&pinctrl_somedevice_default>;
		pinctrl-1 =3D <&pinctrl_somedevice_foo>;
		pinctrl-2 =3D <&pinctrl_somedevice_bar>;
		cfg-gpios =3D <&gpio4 12 3>, <&gpio2 7 5>;
	};

Then I think you can fiddle with pinctrl_select_state(). For the gpios
you can then use the standard gpiod_{request,direction_{in,out}put}
combo.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig        =
    |
Industrial Linux Solutions                 | http://www.pengutronix.de/=
  |
