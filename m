From: =?UTF-8?B?QW5kcmVhcyBGw6RyYmVy?= <afaerber@suse.de>
Subject: Re: [PATCH v4 4/4] ARM: dts: Add exynos5250-spring device tree
Date: Thu, 31 Jul 2014 19:14:59 +0200
Message-ID: <53DA7993.1000800@suse.de>
References: <1406822910-6255-1-git-send-email-afaerber@suse.de> <1406822910-6255-5-git-send-email-afaerber@suse.de> <CAP_ceTz+KRJzF9XV=_aLE+6sV6d5GqCtQ_daKtpFJfCZQ1erpA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:37493 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752496AbaGaRPG (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 31 Jul 2014 13:15:06 -0400
In-Reply-To: <CAP_ceTz+KRJzF9XV=_aLE+6sV6d5GqCtQ_daKtpFJfCZQ1erpA@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Vincent Palatin <vpalatin@chromium.org>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, ARM PORT <linux-arm-kernel@lists.infradead.org>, "OPEN FIRMWARE AND..." <devicetree@vger.kernel.org>, Stephan van Schaik <stephan@synkhronix.com>, Doug Anderson <dianders@chromium.org>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, Ben Dooks <ben-linux@fluff.org>, Kukjin Kim <kgene.kim@samsung.com>, LKML <linux-kernel@vger.kernel.org>

Hi,

Am 31.07.2014 19:00, schrieb Vincent Palatin:
> Always a bit late to the game.
> One small comment inline.
>=20
> Reviewed-by: Vincent Palatin <vpalatin@chromium.org>

Thanks,

>=20
> On Thu, Jul 31, 2014 at 9:08 AM, Andreas F=C3=A4rber <afaerber@suse.d=
e> wrote:
>> +       usb3_vbus_reg: regulator-usb3 {
>> +               compatible =3D "regulator-fixed";
>> +               regulator-name =3D "P5.0V_USB3CON";
>> +               regulator-min-microvolt =3D <5000000>;
>> +               regulator-max-microvolt =3D <5000000>;
>> +               gpio =3D <&gpe1 0 GPIO_ACTIVE_LOW>;
>> +               enable-active-high;
>> +       };
>=20
> GPE1_0 GPIO is the HSIC hub (SMSC 3503) reset# line (already defined
> below afaik).

Yes, that was a suggestion you made on v1.

> On this design there is no external USB3 port, so no VBUS reg/load
> switch for USB3.

Could you be a little clearer? Are you suggesting to drop the gpio
property? I just re-tested that without the regulator node plus the
vbus-supply below I don't get any USB2 (so maybe rename the regulator?)=
=2E

Regards,
Andreas

>> +
>> +       usb@12110000 {
>> +               samsung,vbus-gpio =3D <&gpx1 1 GPIO_ACTIVE_HIGH>;
>> +       };
>> +
>> +       usb-hub {
>> +               compatible =3D "smsc,usb3503a";
>> +               reset-gpios =3D <&hsic_reset>;
>> +       };
[...]
>> +&usbdrd_phy {
>> +       vbus-supply =3D <&usb3_vbus_reg>;
>> +};
>> +
>> +#include "cros-ec-keyboard.dtsi"
>> --
>> 1.9.3

--=20
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=C3=B6rffer; HRB 16746 AG N=C3=
=BCrnberg
