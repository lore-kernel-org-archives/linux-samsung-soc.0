From: Mark Brown <broonie@kernel.org>
Subject: Re: [RFT PATCH 1/3] usb: misc: usb3503: Fix HUB mode after
 bootloader initialization
Date: Mon, 2 May 2016 11:55:01 +0100
Message-ID: <20160502105501.GE6292@sirena.org.uk>
References: <1461927591-7864-1-git-send-email-k.kozlowski@samsung.com>
 <1461927591-7864-2-git-send-email-k.kozlowski@samsung.com>
 <20160429113059.GX3217@sirena.org.uk>
 <57234BA2.6020304@samsung.com>
 <20160429164448.GY3217@sirena.org.uk>
 <57272298.50701@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="r7U+bLA8boMOj+mD"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:41216 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753456AbcEBKzP (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 2 May 2016 06:55:15 -0400
Content-Disposition: inline
In-Reply-To: <57272298.50701@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Kukjin Kim <kgene@kernel.org>, Chanwoo Choi <cw00.choi@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-usb@vger.kernel.org, linux.amoon@gmail.com, tjakobi@math.uni-bielefeld.de, m.szyprowski@samsung.com, hverkuil@xs4all.nl, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>


--r7U+bLA8boMOj+mD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, May 02, 2016 at 11:49:12AM +0200, Krzysztof Kozlowski wrote:

> This VDD regulator supply actually is not a usb3503 USB HUB regulator
> supply... but a supply to the LAN attached to this HUB. Regulator off/on
> is needed for LAN to show up. The hub will show up with typical reset
> (which is also missing before my patchset btw).

> The LAN, as a USB device, is auto-probed so it cannot take the regulator
> and play with it. The simplest idea I have is to add it as "external
> supply"  to the parent: usb3503.

This is common enough that that just isn't going to scale well I fear
without some generic handling, either walking child devices at the bus
level or at the device level with a pre-probe() callback to get the
device to power on.  The latter is more appropriate to things like
Slimbus where the device is more likely to do active management at
runtime, it's not clear people are building USB devices like that.

--r7U+bLA8boMOj+mD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJXJzIDAAoJECTWi3JdVIfQ78MH/RlSSVW3RSGtAAR1VNUptE8B
QICq6VQWpPQ6P0/brJGA+OoywrvcqUa3mVJQQRdkmeiTcPqPwAXze37i1UJ4Pu0Z
KYlGZvCAInxV54BhsnD1AfFpLlN/nbOICsgrkIGQ0Ks4eUh5qo9Hpz6+Md50eNGO
xfdyFikf467TLmkoh6pXB/rXTIdPekqTmXNoqEL3bnI+YB+vkuO+RyQLe2x+LHGy
ppJof0SKRFVEbZbxOVaozOW3aBiWHMv1QVBJb5kV5xsJw059PpS8TIEtXAIN8sHO
Rk0uKRciwtT6xaqMhYNPezrpPZJ779+J6th/AXGO5b0FMX7+b40Yt7JSMNrC6lI=
=jEmB
-----END PGP SIGNATURE-----

--r7U+bLA8boMOj+mD--
