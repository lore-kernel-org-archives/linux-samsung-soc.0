From: Mark Brown <broonie@kernel.org>
Subject: Re: [RFT PATCH 1/3] usb: misc: usb3503: Fix HUB mode after
 bootloader initialization
Date: Wed, 4 May 2016 19:25:55 +0100
Message-ID: <20160504182555.GE6292@sirena.org.uk>
References: <1461927591-7864-1-git-send-email-k.kozlowski@samsung.com>
 <1461927591-7864-2-git-send-email-k.kozlowski@samsung.com>
 <20160429113059.GX3217@sirena.org.uk>
 <57234BA2.6020304@samsung.com>
 <20160429164448.GY3217@sirena.org.uk>
 <57272298.50701@samsung.com>
 <20160502105501.GE6292@sirena.org.uk>
 <20160503180022.GA3008@rob-hp-laptop>
 <5729E4B5.2090702@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="8M+gQFKLhTGBxzRu"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:50330 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754689AbcEDS0L (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 4 May 2016 14:26:11 -0400
Content-Disposition: inline
In-Reply-To: <5729E4B5.2090702@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Rob Herring <robh@kernel.org>, Kukjin Kim <kgene@kernel.org>, Chanwoo Choi <cw00.choi@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-usb@vger.kernel.org, linux.amoon@gmail.com, tjakobi@math.uni-bielefeld.de, m.szyprowski@samsung.com, hverkuil@xs4all.nl, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, ulf.hansson@linaro.org


--8M+gQFKLhTGBxzRu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, May 04, 2016 at 02:01:57PM +0200, Krzysztof Kozlowski wrote:

> This looks like pwrseq for MMC devices so the idea is to:
> 1. Move drivers/mmc/core/pwrseq* to separate directory
> (drivers/power/pwrseq ?)
> 2. Add support for pwrseq to USB core,
> 3. Add new pwrseq driver (or extend existing one): toggling the regulator.
> 4. Add pwrseq phandle to the DT node of USB hub (to the binding
> mentioned by Rob?).

> Does it look sensible?

It certainly seems like a similar problem space, USB seems very much
like MMC in both the spec and the way it tends to get used.

--8M+gQFKLhTGBxzRu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJXKj6yAAoJECTWi3JdVIfQDVoIAIQNIIIDVg6dIq4dg7+yaBEa
9xaqLg3+enIW/2q/p+q7JlQWaEb/WJ68wA8pXZDE6RIItO6bJ0vZiRIYBZMkRIds
sWsLTAo/0lXKSJYM4ustWLfr8egt+6HSUvRYnkVpeW6SpsQkkpngBIylkxkmRvxb
iWs1nvOSbV4gyQmdaESPtK9g+YL33cBEWEW8f+kWSUnhbp63gPSdnfBtcdtHr8Fe
Bm27BYxvpzFuVp+ERwdDz4XhgZUbn+8/gJJ/+DeO4MqGHvbJGDGd6S2fl2efSuZh
0atErQWoTJG1N95YD0NSjfIlnbu2wDF7E4CdIXOCg8Fqsf4HXXdMmZtt4XxLfB8=
=/2XA
-----END PGP SIGNATURE-----

--8M+gQFKLhTGBxzRu--
