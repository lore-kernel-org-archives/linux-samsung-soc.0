From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH v4 4/7] regulator: Use ena_gpio supplied with generic
 regulator bindings
Date: Fri, 28 Nov 2014 15:14:04 +0100
Message-ID: <1417184044.18249.39.camel@AMDC1943>
References: <1417087253-12306-1-git-send-email-k.kozlowski@samsung.com>
 <1417087253-12306-5-git-send-email-k.kozlowski@samsung.com>
 <20141127184342.GC7712@sirena.org.uk> <1417170655.18249.24.camel@AMDC1943>
 <20141128113859.GH7712@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:63459 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750919AbaK1OOJ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 28 Nov 2014 09:14:09 -0500
In-reply-to: <20141128113859.GH7712@sirena.org.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Lee Jones <lee.jones@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Kukjin Kim <kgene@kernel.org>, Kyungmin Park <kyungmin.park@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

On pi=C4=85, 2014-11-28 at 11:38 +0000, Mark Brown wrote:
> On Fri, Nov 28, 2014 at 11:30:55AM +0100, Krzysztof Kozlowski wrote:
> > On czw, 2014-11-27 at 18:43 +0000, Mark Brown wrote:
>=20
> > > Why do we need some special magic operation for GPIO based enable=
s
> > > that's separate to any other enable operation?  This seems really
> > > confusing, if the constraint setting doesn't work somehow for GPI=
O based
> > > enables we should fix that.  Though since this operation takes no
> > > parameters it's hard to see how it's supposed to apply constraint=
s
> > > unless it reparses them which doesn't seem like a good idea...
>=20
> > The regulator driver no longer parses GPIO control from DTS. So som=
ehow
> > it should be notified that regulator core parsed this and GPIO shou=
ld be
> > enabled.
>=20
> > That is the purpose of ops->set_ena_gpio() call.
>=20
> This sort of thing is a sign that we're not saving much by moving the
> parsing to the core and perhaps there's more flexiblity here...=20

The driver receive callbacks (or exposes other kind of interface) for
other core-generalized code. Recent example is parsing regulator mode
(added by Javier) and .of_map_mode() callback.

I thought how to do this without this additional set_ena_gpio() call.
One way would be to extend the regulator modes (FAST/IDLE/STANDBY/ and
GPIO) but this would look somehow unnatural.

> It's
> also not something that should be in the constraints handling, it's n=
ot
> something that constrains the regulator.

Got it.

> > > > +static int regulator_ena_gpio_setup(struct regulator_dev *rdev=
,
> > > > +			const struct regulator_config *config,
> > > > +			const struct regulator_init_data *init_data)
>=20
> > > Why is setting up the GPIO different to requesting it, especially=
 given
> > > that we have an existing function called _request() which still e=
xists?
>=20
> > Maybe the name was not a best choice. The setup calls request.
>=20
> > My patchset here tried to retain the compatibility with
> > "config.ena_gpio" way so the core would accept GPIOs passed in one =
of
> > two ways:
> > 1. old: config.ena_gpio,
> > 2. new: parsed by core from DTS.
>=20
> > The request function previously worked only on "config.ena_gpio" an=
d I
> > changed it here to accept any GPIO. The setup uses one of GPIO meth=
ods
> > (old or new) and calls request with appropriate GPIO.
>=20
> We need to support both methods since not all the world is DT.  What =
I
> can't tell is how this code achieves these objectives - it seems to b=
e
> an awfully big patch if that's all it's supposed to be doing, I'd exp=
ect
> just a conditional where we try the two methods in turn.  It may be t=
hat
> there's a good reason for all this but that needs to be made clear.

OK, I'll try to better describe the reason behind and to split the
patches (if possible).

Best regards,
Krzysztof
