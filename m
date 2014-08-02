From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH v4 4/4] ARM: dts: Add exynos5250-spring device tree
Date: Sat, 02 Aug 2014 14:40:03 +0200
Message-ID: <53DCDC23.1090105@gmail.com>
References: <1406822910-6255-1-git-send-email-afaerber@suse.de> <1406822910-6255-5-git-send-email-afaerber@suse.de> <53DA936E.9060004@gmail.com> <53DB06D6.9060604@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wg0-f47.google.com ([74.125.82.47]:36889 "EHLO
	mail-wg0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751534AbaHBMkI (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 2 Aug 2014 08:40:08 -0400
In-Reply-To: <53DB06D6.9060604@suse.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?UTF-8?B?QW5kcmVhcyBGw6RyYmVy?= <afaerber@suse.de>, linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Stephan van Schaik <stephan@synkhronix.com>, Vincent Palatin <vpalatin@chromium.org>, Doug Anderson <dianders@chromium.org>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, Ben Dooks <ben-linux@fluff.org>, Kukjin Kim <kgene.kim@samsung.com>, open list <linux-kernel@vger.kernel.org>

On 01.08.2014 05:17, Andreas F=C3=A4rber wrote:
> Am 31.07.2014 21:05, schrieb Tomasz Figa:
>>> +
>>> +&i2c_2 {
>>> +	status =3D "okay";
>>> +	samsung,i2c-sda-delay =3D <100>;
>>> +	samsung,i2c-max-bus-freq =3D <66000>;
>>> +
>>> +	hdmiddc@50 {
>>> +		compatible =3D "samsung,exynos4210-hdmiddc";
>>> +		reg =3D <0x50>;
>>> +	};
>>
>> I don't think this matches current Exynos HDMI bindings, which I bel=
ieve
>> have been changed to just take a phandle to i2c bus instead.
>=20
> Looks correct to me:
>=20
> http://git.kernel.org/cgit/linux/kernel/git/kgene/linux-samsung.git/t=
ree/Documentation/devicetree/bindings/video/exynos_hdmiddc.txt?h=3Dfor-=
next
>=20
> https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git/tree=
/Documentation/devicetree/bindings/video/exynos_hdmiddc.txt

Looks correct according to the documentation, but unfortunately this is
not the first time (and most likely not the last time) when our Exynos
DRM people carelessly change the binding without taking care of updatin=
g
relevant documentation correctly...

Please see following code:

https://git.kernel.org/cgit/linux/kernel/git/daeinki/drm-exynos.git/tre=
e/drivers/gpu/drm/exynos/exynos_hdmi.c?h=3Dexynos-drm-next#n2415

To get the DDC I2C adapter it first tries to look by a hardcoded
compatible string for backwards compatibility, but when there is no suc=
h
node, it uses the "ddc" property which is a phandle to the I2C adapter
node on which the DDC channel will be present.

Long story short, the binding of fake DDC device is obsolete and should
be marked so in documentation, while new device trees should only use
the new way with phandle.

However what this patch adds is for now technically correct and should
work even if support for old bindings is dropped in future, so I won't
consider this an issue.

Best regards,
Tomasz
