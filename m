From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 1/3 v6] spi: s3c64xx: fix broken "cs_gpios" usage in the
 driver
Date: Tue, 15 Jul 2014 13:35:57 +0100
Message-ID: <20140715123557.GB17528@sirena.org.uk>
References: <1405316506-27855-1-git-send-email-ch.naveen@samsung.com>
 <1405316506-27855-2-git-send-email-ch.naveen@samsung.com>
 <20140714172524.GH6800@sirena.org.uk>
 <CABxcv==yuWJYmSiVV=HELMdwi-8aAG-aiT9o12HUBp8uRaBxkQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="oLBj+sq0vYjzfsbl"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:38635 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758321AbaGOMgk (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 15 Jul 2014 08:36:40 -0400
Content-Disposition: inline
In-Reply-To: <CABxcv==yuWJYmSiVV=HELMdwi-8aAG-aiT9o12HUBp8uRaBxkQ@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier@dowhile0.org>
Cc: Naveen Krishna Chatradhi <ch.naveen@samsung.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, spi-devel-general@lists.sourceforge.net, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Naveen Krishna <naveenkrishna.ch@gmail.com>, Grant Likely <grant.likely@secretlab.ca>, Jaswinder Singh <jaswinder.singh@linaro.org>, Kukjin Kim <kgene.kim@samsung.com>, "cpgs ." <cpgs@samsung.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Tomasz Figa <t.figa@samsung.com>, Doug Anderson <dianders@chromium.org>


--oLBj+sq0vYjzfsbl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jul 15, 2014 at 12:38:58PM +0200, Javier Martinez Canillas wrote:
> Hello Mark,

Don't top post.

> On Mon, Jul 14, 2014 at 7:25 PM, Mark Brown <broonie@kernel.org> wrote:
> > On Mon, Jul 14, 2014 at 11:11:44AM +0530, Naveen Krishna Chatradhi wrote:

> So, the .line field is used to specify a GPIO, not a chip select. So
> gpio_is_valid() should also be used to check that cs->line is a valid
> GPIO. If board file does not want to use a GPIO and wants to use a
> built-in chip select then it should either not use a struct
> s3c64xx_spi_csinfo at all or set .line to -ENOENT in order to be
> consistent with the SPI core.

This sort of "let's make everyone instabuggy" change is not good
practice, especially when it's mixed in with some other not obviously
related change, has an unclear benefit and is barely mentioned in the
commit log - I found this through code review, not through it being a
clearly intentional and considered part of the change.

> As I said before this patch is fixing a bug in the SPI driver, the
> first version of the series was posted on June, 10 so many other
> patches already depend on this fix. So it would be great if we can
> move this forward since this is hurting the platform support as a
> whole.

So provide a clear, easy to understand patch series then.  As I've said
before this series is setting off lots of alarm bells - the large number
of versions, the difficulty in understanding what it was supposed to do
both for the overall goal of the series and the individual changes, and
the fact that several people have found bugs for use cases other than
your own (all the way up to removing non-DT support) are all saying that
this is something that needs careful review and also making that review
difficult.

Code review is an important part of the process, we need people to work
to make that review easy, address review comments and allow a reasonable
time for the review to happen (something that's obviously going to be
quicker with submissions that are easier to review).

--oLBj+sq0vYjzfsbl
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJTxSAqAAoJELSic+t+oim9jo4P/0IoZoHvgu6y9r8lD2LK/KIX
QS9HOJidlCM9r7psiKhnMIDVO2voS30Wb/GM7lHtpjir5y5JjAvzvY5fW0mUO6op
hDdAwJuvb/dlBmVtRRFyESt2xc8dQAoQAGEomVhRWY2HH5qYMNgHXAh+fzEkeIKg
Iw4x5eUuSIfToKQoZBGLrnVx8OUaNfGtLUdEem5yR4ApgnlBdYcBlLXvoSiB/VHm
UaPhCRagmhdopK49akONH3b3UjCCy3/L406+yEQL3XMjfYIrRr22Jhsk4owRkNTq
i0bPvYoyBE30KsKodpzMjG2fGpj79/KRItn9G+1mOIfHv2zEguRo022o/IotKGZd
S3J80KD4OAwk8LsBYNahHlj9RT2UJ27IWeQ7ovGVFBDHMVZaCCzMqqPP+hKLIl0Y
bin9alhvpQ7x8TSOtscvhE1SsDL/OTuHtRfMX357nw1T5n2tWVTkZJ31s1js+lBy
0D4ElMrGVlHyd4x/D4Xl81xyZtCti261cSr3aSUhl5JbERkrp14Iu9lYttBHL+Sr
BurxmgurcACsNoHxrCfzLPxiutDLNyHdY9JKJz5gLh65gaYyfT36Hd/BA9I+/iyi
tYxUFdv5K46gimj2plbWxE4NypgZi2xhbZzRFI76+GxQRv2L1Y2o+3ZTRfaeCbTt
be7eCvGPcQm+UqZan5/H
=Xxxa
-----END PGP SIGNATURE-----

--oLBj+sq0vYjzfsbl--
