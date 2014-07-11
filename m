From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 1/3 v5] spi: s3c64xx: fix broken "cs_gpios" usage in the
 driver
Date: Fri, 11 Jul 2014 14:48:03 +0100
Message-ID: <20140711134803.GW30458@sirena.org.uk>
References: <1402631992-500-1-git-send-email-ch.naveen@samsung.com>
 <20140702165651.GK410@sirena.org.uk>
 <CAHfPSqAXs=5VLLEV-XVw5YJo=-9QFn9KA8oG_A0CfNykcVwnCQ@mail.gmail.com>
 <20140707073244.GC30458@sirena.org.uk>
 <CAHfPSqAf3z9otNJivw5W7oKdRbU085+AWxCMAh8ORh=GkiNiXw@mail.gmail.com>
 <CABxcv=mw0ma3MQPsR5sGU7UcORehyyhqOtQ_SUwCNr4kpsK-7g@mail.gmail.com>
 <CABxcv=kcxAJz2gACAQG3H6xR1E_SBJqOkBOq=cQ7oHpndonbRw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="H25ow1gEc5p8sQPX"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:60357 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753939AbaGKNsy (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 11 Jul 2014 09:48:54 -0400
Content-Disposition: inline
In-Reply-To: <CABxcv=kcxAJz2gACAQG3H6xR1E_SBJqOkBOq=cQ7oHpndonbRw@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier@dowhile0.org>
Cc: Naveen Krishna Ch <naveenkrishna.ch@gmail.com>, Naveen Krishna Chatradhi <ch.naveen@samsung.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, spi-devel-general@lists.sourceforge.net, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Grant Likely <grant.likely@secretlab.ca>, Jaswinder Singh <jaswinder.singh@linaro.org>, Kukjin Kim <kgene.kim@samsung.com>, "cpgs ." <cpgs@samsung.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Tomasz Figa <t.figa@samsung.com>


--H25ow1gEc5p8sQPX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jul 11, 2014 at 01:04:07PM +0200, Javier Martinez Canillas wrote:
> Hello Naveen and Mark,
> On Mon, Jul 7, 2014 at 1:22 PM, Javier Martinez Canillas
> <javier@dowhile0.org> wrote:
> > On Mon, Jul 7, 2014 at 10:31 AM, Naveen Krishna Ch
> > <naveenkrishna.ch@gmail.com> wrote:

Please delete irrelevant context from your replies, this mail is over a
hundred lines long and has only three lines of new content.

> Any more opinions on this issue?

> It would be great if we can move this forward since there are other
> series that depend on these fixes.

Well, the bug with making a GPIO chip select mandatory needs to be
fixed.

--H25ow1gEc5p8sQPX
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJTv+sQAAoJELSic+t+oim95SIP/12sNrlUYRNSAWq8S4S9anbj
HJCUeUSX592RDdmB8dXBpraSJqwXYDCku6M18gCbLM9YpdXpfzptYHiUuw2DXaO4
SOjk0FtqvnjgcALHWcCCcPHXBa3DdnTswGsla0YHm9pHcFwXlplFiJJIg1bd7GhT
TA17OJtMeYrCnOFWv/lvapSLeM//cYPeFnLlgFiV3NwLIdAxFqvIE6N9dszBS6Oh
mD8j9Gdry7HdteFQ5WIUvo3hkdVLfU3cVBmzNDSDkBM5DidmVMmh6GbBCWxClaIN
dA8ZxgLSeE8HYa2oHIbozoT1+W2Yp2Ehh2h39CrNXK2UDetBxGyuTPDm69D3Cvob
B4ru6PJVLyBXDFg6ozKLw3MLvtAy2a8+UrrRFzSCbbDQI1y91eA5/nBAoYApJld8
t07mSxUskzQiQFZuHQXcqXjD2/SC9uopnbf5ihgs6n49XB4nelNQifXc3dqw29hG
8tNHgNXUV6RqkF0+EU0cwtzM1E2vJrDgULvEXYtMIyzwd3esv2d5cniap0qx+xfW
FrogeSl+B0zaOV8kHd6h0+lUt7xaC0PMpO/2pvubzqnYreDv4AtncuoP6d0Meaxf
oDyQaHa35GTHXHsPeB/g4uEbQMf4dASzvZsybrR/1XH07RNP5OwTyjSovQhrxT8d
dZHPN4eVQvZJS0Ru3/Ep
=mzPI
-----END PGP SIGNATURE-----

--H25ow1gEc5p8sQPX--
