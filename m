From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH 6/8] regulator: max77686: Add external GPIO control
Date: Fri, 31 Oct 2014 12:45:47 +0100
Message-ID: <1414755947.7318.3.camel@AMDC1943>
References: <1414422226-10948-7-git-send-email-k.kozlowski@samsung.com>
 <544EA4FA.6040704@collabora.co.uk> <1414486356.24949.19.camel@AMDC1943>
 <1414498308.24949.32.camel@AMDC1943> <1414579362.18868.11.camel@AMDC1943>
 <5450C63B.3000602@collabora.co.uk>
 <CAAVeFuLncbkNLGxEAj90yMmugRDNjtjeGoV_QYTMDZ7NVMJCmg@mail.gmail.com>
 <1414681386.26703.6.camel@AMDC1943>
 <CAAVeFuJo1wTyxOo4FEZM3=GTejuSHi+mnr=QV6HUeV5mAOCmqg@mail.gmail.com>
 <1414741898.20071.8.camel@AMDC1943> <20141031103217.GJ18557@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:32510 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758308AbaJaLpv (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 31 Oct 2014 07:45:51 -0400
In-reply-to: <20141031103217.GJ18557@sirena.org.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Samuel Ortiz <sameo@linux.intel.com>, Lee Jones <lee.jones@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Ben Dooks <ben-linux@fluff.org>, Kukjin Kim <kgene.kim@samsung.com>, Russell King <linux@arm.linux.org.uk>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Kyungmin Park <kyungmin.park@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Linus Walleij <linus.walleij@linaro.org>

On pi=C4=85, 2014-10-31 at 10:32 +0000, Mark Brown wrote:
> On Fri, Oct 31, 2014 at 08:51:38AM +0100, Krzysztof Kozlowski wrote:
>=20
> > However new DT style parsing (regulator_of_get_init_data()) does th=
e
> > basic parsing stuff and this removes a lot of code from driver. The
> > driver no longer parses all regulaotrs but the regulator core does =
it.
> > Unfortunately regulator core does not parse custom bindings (like s=
uch
> > GPIOs) so I would have to iterate once again through all regulators=
 just
> > to find "gpios" property.
>=20
> We could always add a callback for the driver to handle any custom
> properties...  one of the advantages of an OS like Linux is that we c=
an
> improve the core code.

Then I'll add it.

Mark, what device should be assigned to "config.dev" during registratio=
n
of regulators? The regulator driver's device or its parent (MFD main
driver)?

Various drivers do this differently.

Best regards,
Krzysztof
