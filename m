From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH] i2c: s3c2410: check for NULL pinctrl handle
Date: Sun, 24 Feb 2013 01:38:26 +0100
Message-ID: <5027662.bpQdq7jhyn@flatron>
References: <201302231855.47560.heiko@sntech.de> <201302231857.46445.heiko@sntech.de> <CACRpkdbV-CznfnbCbKkKpndjiG32V9yNdrF1F7M=4qe1EUroGA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ea0-f175.google.com ([209.85.215.175]:50626 "EHLO
	mail-ea0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758986Ab3BXAi3 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 23 Feb 2013 19:38:29 -0500
In-Reply-To: <CACRpkdbV-CznfnbCbKkKpndjiG32V9yNdrF1F7M=4qe1EUroGA@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>, Wolfram Sang <wsa@the-dreams.de>, linux-kernel@vger.kernel.org, Kukjin Kim <kgene.kim@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-i2c@vger.kernel.org, Tomasz Figa <t.figa@samsung.com>

Hi Linus,

On Sunday 24 of February 2013 01:16:21 Linus Walleij wrote:
> On Sat, Feb 23, 2013 at 6:57 PM, Heiko St=FCbner <heiko@sntech.de> wr=
ote:
> > When pinctrl is not built the fallback functions fail silently
> > and emit either 0 error codes or NULL pinctrl handles.
> >=20
> > Therefore it's needed to also check for this NULL-handle when
> > falling back to parsing the i2c gpios from devicetree.
> >=20
> > Signed-off-by: Heiko Stuebner <heiko@sntech.de>
>=20
> NAK.
>=20
> This is not the right solution for this driver.
>=20
> It uses pinctrl in a very simplistic way, just grabbing the
> default handler.
>=20
> After commit
> ab78029ecc347debbd737f06688d788bd9d60c1d:
> "drivers/pinctrl: grab default handles from device core"
>=20
> The right solution is to simply revert commit
> 2693ac69880a33d4d9df6f128415b65e745f00ba
> "i2c: s3c2410: Add support for pinctrl"
>=20
> Tomasz are you OK with this, or will you add more
> fine-grained pinctrl (like runtime PM etc) to this driver?

Yes, I'm fine. However reverting this patch will not solve the problem=20
completely.

There are 3 methods of pin configuration that has to be supported by th=
is=20
driver (and several other drivers):
 1) cfg_gpio callback passed in platform data,
 2) legacy Samsung GPIO bindings (to be dropped ASAP),
 3) pin control.
Each supported platform will support only one of these methods at the s=
ame=20
time.

The first one is already handled correctly because it is always used=20
wherever it is available. The problem is with the remaining two.

The driver must know whether pin control is available, because it has t=
o=20
fall back to legacy GPIO-based pin configuration if it is not. This mea=
ns=20
that we must either check for NULL (which probably is not right, since=20
returned handle is considered to be opaque) or pin control core must=20
return an error code specific to this situation, e.g. -ENODEV.

Keep in mind that there is no way to check whether method 2) succeeded,=
=20
because all it does is parsing GPIOs from device tree, assuming that th=
e=20
custom xlate function of the old Samsung GPIO driver would do all the=20
configuration.

I do not see another solution of this problem. Feel free to suggest=20
anything better.

Best regards,
Tomasz
