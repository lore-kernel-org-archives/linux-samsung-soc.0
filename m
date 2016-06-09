From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [RFC v4 0/7] extcon: usb-gpio: fixes and improvements
Date: Thu, 09 Jun 2016 17:35:12 +0900
Message-ID: <57592A40.9080608@samsung.com>
References: <CGME20160608134820epcas1p4ee75a89888f2ae2adb733124a330bd2c@epcas1p4.samsung.com>
 <1465393686-16644-1-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:42923 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751379AbcFIIfQ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 9 Jun 2016 04:35:16 -0400
In-reply-to: <1465393686-16644-1-git-send-email-k.kozlowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>, MyungJoo Ham <myungjoo.ham@samsung.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Kukjin Kim <kgene@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: rogerq@ti.com, Peter Chen <peter.chen@freescale.com>, "Ivan T. Ivanov" <iivanov@mm-sol.com>, balbi@ti.com, kishon@ti.com, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

Hi,

It is good to support USB_ID and USB_VBUS by extcon.

But,
there is some issue about adding the new cable type for
both EXTCON_USB_ID and EXTCON_USB_VBUS

I think that the ID and VBUS state are not cable type
Instead, ID and VBUS state are the property of USB cable.

So, I'd like to add the following function to support
the property of each cable as following:
The client driver can get the state of property by using
the extcon_get_cable_property_state().

- int extcon_get_cable_property_state(struct extcon_dev *edev,
				unsigned int id,
				enum extcon_property property);
- int extcon_set_cable_property_state(struct extcon_dev *edev,
				unsigned int id,
				enum extcon_property property,
				unsigned int state);

=46or example,
In extcon-usb-gpio.c, set state of property as follwoing:
	extcon_set_cable_property_state(edev, EXTCON_USB, EXTCON_USB_PROP_ID, =
1);
	extcon_set_cable_property_state(edev, EXTCON_USB, EXTCON_USB_PROP_VBUS=
, 1);


In the extcon client driver, get state of property as following:
	id_state =3D extcon_get_cable_property_state(edev, EXTCON_USB, EXTCON_=
USB_PROP_ID);
	vbus_state =3D extcon_get_cable_property_state(edev, EXTCON_USB, EXTCO=
N_USB_PROP_VUBS);

Regards,
Chanwoo Choi


On 2016=EB=85=84 06=EC=9B=94 08=EC=9D=BC 22:47, Krzysztof Kozlowski wro=
te:
> Hi,
>=20
>=20
> Some time ago, Robert tried to add VBUS detection to extcon-usb-gpio
> driver [1].  There was a discussion about patch #2 ("extcon: usb-gpio=
:
> add support for VBUS detection").
>=20
> The final conclusion was that Chanwoo will add VBUS/ID notifiers [2].
> That unfortunately never happened so this patchset is a follow up.
>=20
> 1. Add VBUS/ID cable state notifiers to extcon, so USB controllers
>    could use it.
> 2. Add VBUS detection to extcon-usb-gpio driver.
>=20
> Some parts are based on old Robert's work, some are new, some are
> reworked.
>=20
>=20
> Best regards,
> Krzysztof
>=20
>=20
> [1] http://thread.gmane.org/gmane.linux.kernel/1923192/focus=3D192319=
3
> [2] http://thread.gmane.org/gmane.linux.kernel/1923192/focus=3D194115=
2
>=20
>=20
> Krzysztof Kozlowski (5):
>   Revert "extcon: usb-gpio: switch to use pm wakeirq apis"
>   extcon: Add raw VBUS and ID cable states
>   extcon: usb-gpio: Add support for VBUS detection
>   ARM: exynos_defconfig: Enable EXTCON_USB_GPIO for Odroid XU3 USB OT=
G
>   ARM: dts: exynos: Add extcon-usb-gpio node for Odroid XU3
>=20
> Robert Baldyga (2):
>   Documentation: extcon: usb-gpio: update usb-gpio binding descriptio=
n
>   extcon: usb-gpio: make debounce value configurable in devicetree
>=20
>  .../devicetree/bindings/extcon/extcon-usb-gpio.txt |  28 ++++-
>  arch/arm/boot/dts/exynos5422-odroidxu3-lite.dts    |  21 ++++
>  arch/arm/boot/dts/exynos5422-odroidxu3.dts         |  21 ++++
>  arch/arm/configs/exynos_defconfig                  |   1 +
>  drivers/extcon/extcon-usb-gpio.c                   | 138 +++++++++++=
++++++----
>  drivers/extcon/extcon.c                            |   3 +
>  include/linux/extcon.h                             |   8 +-
>  7 files changed, 190 insertions(+), 30 deletions(-)
>=20
