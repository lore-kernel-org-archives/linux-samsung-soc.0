From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH V2 1/2] ASoC: samsung: Add machine driver for Odroid X2/U3
Date: Mon, 14 Jul 2014 12:31:18 +0100
Message-ID: <20140714113118.GE6800@sirena.org.uk>
References: <1403108551-25058-1-git-send-email-s.nawrocki@samsung.com>
 <1403108551-25058-2-git-send-email-s.nawrocki@samsung.com>
 <20140630184658.GE23300@sirena.org.uk>
 <53C3BEB9.7000706@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="WBsA/oQW3eTA3LlM"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:36805 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753869AbaGNLcA (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 14 Jul 2014 07:32:00 -0400
Content-Disposition: inline
In-Reply-To: <53C3BEB9.7000706@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: devicetree@vger.kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, galak@codeaurora.org, zhen1.chen@samsung.com, kyungmin.park@samsung.com, m.szyprowski@samsung.com, alsa-devel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org


--WBsA/oQW3eTA3LlM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jul 14, 2014 at 01:27:53PM +0200, Sylwester Nawrocki wrote:

> Too bad, I noticed this comment only just now.  I'll consider this and
> will try again and see how simple-card could be used.  There is also the
> samsung-i2s-sec secondary 'overlay' CPU DAI that would need to be handled,
> and we have it now internally specified in the machine driver through
> cpu_dai_name, rather than cpu_of_node.
> There might be some more work in the driver needed to support the
> secondary I2S interface generically with DT.

You should be converting the device to DPCM for both that and the
compressed audio path.

--WBsA/oQW3eTA3LlM
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJTw7+DAAoJELSic+t+oim96UYP/RkReXbBb6THPBdOv4kXm0kk
5sEjYy8O5VD0bppMmrbhO03dSKH7uF608z04FpD3KNCm4sOJCsKYwqsWY+aSTU43
xW7mDCdOXgLK6tmxyCX9pTDEadkg3rZIOeVcmTP/YdUyEgc4TSyxyWFjCGqRIzr7
wRYdIMb8Br4BK/MMoJc8hcQ6aZZZHGkGVMZ3a6Gr02WLSIk1R3tfqWCJgTr3PO+d
gX2OotvwPBgw3bFboTVKYU1Rrl3uu7QUB46UAqRUAVyAV5aqLxSK1B9rQxT7G45I
xzpeqBcS7aYGavtcG28gxq2NtElBfGch/9KPCnum8PwgieL01/AYYYIFyLKpXIKQ
/r19JzEir6uI1rr4OQJZUy/0RjGIb2CGmyCRYEnfPEuzdL8e6Obwl5MdsHY9pKYt
Mqti4sU96k5a3qhGUbLnCHnAyPqqVGPD+g+FuQedCKLSqZFGonYKSonSlUy45EeH
Aq49T59yNUhcIY8tBw4eucskCQC9z14sAZ4KTE12gWZuHAJkEyFCXB7TkVBouMQz
u/VdMolsItZjUAtK2ITPoyVU4oD5oFn+sqrSMUgeXhoAX31j6EMKze1WOr2huu4D
UTxETrqrjfMFDKPv20CFWv06akWeK4yFoInfecyIXOxVKeDaYKbdZR03hZ6k4Ymk
a2vKlC6r9FZuZ11mg/nM
=9i8a
-----END PGP SIGNATURE-----

--WBsA/oQW3eTA3LlM--
