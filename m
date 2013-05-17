From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH 1/2] video: exynos_dp: Add parsing of gpios pins to
 exynos-dp driver
Date: Fri, 17 May 2013 14:29:35 +0200
Message-ID: <6459883.FZan3akiXR@amdc1227>
References: <26364319.123371368669839202.JavaMail.weblogic@epml12>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:41201 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755838Ab3EQM3r convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 17 May 2013 08:29:47 -0400
In-reply-to: <26364319.123371368669839202.JavaMail.weblogic@epml12>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: jg1.han@samsung.com
Cc: Vikas Sajjan <vikas.sajjan@linaro.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, =?utf-8?B?6rmA6rWt7KeE?= <kgene.kim@samsung.com>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, "patches@linaro.org" <patches@linaro.org>, "linaro-kernel@lists.linaro.org" <linaro-kernel@lists.linaro.org>, "rpurdie@rpsys.net" <rpurdie@rpsys.net>, "FlorianSchandinat@gmx.de" <FlorianSchandinat@gmx.de>, "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>

Hi Jingoo,

On Thursday 16 of May 2013 02:03:59 =ED=95=9C=EC=A7=84=EA=B5=AC wrote:
> Tuesday, May 14, 2013 11:17 PM, Vikas Sajjan wrote:
>=20
> >=20
> > Hi Vikas,
> >=20
> > On Tuesday 14 of May 2013 18:25:51 Vikas Sajjan wrote:
> >=20
> > >  Adds GPIO parsing functionality for "LCD backlight" and "LCD ena=
ble"
> > >  GPIO pins of exynos dp controller.
> > >
> > >
> > >
> > > Signed-off-by: Vikas Sajjan <vikas.sajjan@linaro.org>
> > > ---
> > >=20
> > >  drivers/video/exynos/exynos_dp_core.c |   45
> > >=20
> > > +++++++++++++++++++++++++++++++++ 1 file changed, 45 insertions(+=
)
> > >
> > >
> >=20
> >=20
> > I don't think that Exynos DP driver is right place for such code.
> > Backlight
 and LCD drivers are responsible for backlight and LCD power
> > control using backlight and LCD subsystems.
> >=20
> > IMHO the correct solution would be to either extend existing
> > backlight/lcd
> > drivers found in drivers/video/backlight to support direct GPIO con=
trol
> > and
 parse GPIO pins from device tree or create new gpio_bl and gpio_lcd
> > drivers.
>=20
> Hi Vikas Sajian,
>=20
> I agree with Tomasz Figa's opinion.
> Backlight/LCD framework should be used.
> eDP panel backlight on SMDK5210 board can be controlled by PWM;
> thus, pwm-backlight driver should be used.
> Also, eDP panel reset pin should be controlled by using
> platform-lcd driver.
>=20
>=20
> >=20
> > CCing Richard, Florian and linux-fbdev.
>=20
>=20
> Also, I have been doing backlight reviews instead of Richard,
> please do CC'ing me.

OK. I used get_maintainers script, but it seems like the result was a b=
it off=20
in this case. Will remember for future.

Best regards,
--=20
Tomasz Figa
Linux Kernel Developer
Samsung R&D Institute Poland
Samsung Electronics
