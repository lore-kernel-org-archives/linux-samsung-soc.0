From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH V4 1/2] ASoC: Samsung: Get I2S src_clk from clock alias
 id.
Date: Wed, 28 Nov 2012 19:18:22 +0000
Message-ID: <20121128191822.GB32691@opensource.wolfsonmicro.com>
References: <1354099669-1735-1-git-send-email-padma.v@samsung.com>
 <1354099669-1735-2-git-send-email-padma.v@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="JoJCGVnM/36AiBh+"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from opensource.wolfsonmicro.com ([80.75.67.52]:38012 "EHLO
	opensource.wolfsonmicro.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751807Ab2K1TSZ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 28 Nov 2012 14:18:25 -0500
Content-Disposition: inline
In-Reply-To: <1354099669-1735-2-git-send-email-padma.v@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Padmavathi Venna <padma.v@samsung.com>
Cc: padma.kvr@gmail.com, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, alsa-devel@alsa-project.org, devicetree-discuss@lists.ozlabs.org, sbkim73@samsung.com, ben-linux@fluff.org, kgene.kim@samsung.com, lrg@ti.com, jassisinghbrar@gmail.com


--JoJCGVnM/36AiBh+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Nov 28, 2012 at 04:17:48PM +0530, Padmavathi Venna wrote:
> As the I2S src clks are registered with clkdev using generic
> connection id, driver can get the clk name using generic id.
> So the variable representing the array of rclk src clks is
> deleted.

Applied, thanks.

--JoJCGVnM/36AiBh+
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJQtmNvAAoJELSic+t+oim9fZYP/2/WkyyEDQZlnVSgGeYsIz0+
r5R8r5ZsCFIbdmtZQPjHJkTDzt0gc6W2jDjv7CzCmcH1tjtXGc0Pe3lrOX9YQrKk
GKQ8X520v5j7vaeJF9Dp6SqSwtfY50ZE1ti9V1/pDg77wobzyFMAA0KeflECiNFH
bfBVWH/iIoT29spS7c7gytJV2cmAILxF/RcUlhQvzjo8RLc1nAiXvAo22qgNnNRe
+SAc9sVcLH7xsamPBYbpGt67jxAi7ZjL9A1174w+da2liKGPY0PIhebBQSWyOmYi
XlBPy0XtcaKm0QtLFWvHrMTcaWxVV4soVBLkH1yNBWoeUg/Q83HGIxTaTbeQmRG4
RrECriLm9zstuSldP+AOWK7ozKCbu8wgHSKaxO0gE1pl+QfKjybWUInRE9zYmHdr
t9pQe+P+D9GBUnKe0hjKj6Cwhm7W522m0lzF6SYeiGtwhIoRR1toPxEJQXpG+Jn3
rFlIYNY+SA4cDowy5JMoYyQzOQ2KOJCOCRQrE1Tr33c+hze98t0cMd2m+tgLB2MQ
PJ3UXjy6bc0VWR5T6quWzfheJuxU0kq4bWc/7TwZAFPhPRUJwsWvEb3j8cNrb06U
cgQldJM2SiQXbldYbZeSTOJYtQQunpqQ5WvA4vteEqL/9NaQAdqurlgX2jsB0phd
wLdC2/Hj7LDmw/NBAf6x
=2kM8
-----END PGP SIGNATURE-----

--JoJCGVnM/36AiBh+--
