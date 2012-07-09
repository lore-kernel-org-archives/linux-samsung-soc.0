From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH] i2c-s3c2410: Convert to devm_request_and_ioremap()
Date: Mon, 9 Jul 2012 14:58:10 +0100
Message-ID: <20120709135809.GG3934@opensource.wolfsonmicro.com>
References: <1340888138-32710-1-git-send-email-broonie@opensource.wolfsonmicro.com>
 <20120709135229.GL1296@pengutronix.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="8/pVXlBMPtxfSuJG"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from opensource.wolfsonmicro.com ([80.75.67.52]:47467 "EHLO
	opensource.wolfsonmicro.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1753527Ab2GIN6L (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 9 Jul 2012 09:58:11 -0400
Content-Disposition: inline
In-Reply-To: <20120709135229.GL1296@pengutronix.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Wolfram Sang <w.sang@pengutronix.de>
Cc: linux-samsung-soc@vger.kernel.org, linux-i2c@vger.kernel.org


--8/pVXlBMPtxfSuJG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jul 09, 2012 at 03:52:29PM +0200, Wolfram Sang wrote:
> On Thu, Jun 28, 2012 at 01:55:38PM +0100, Mark Brown wrote:
> > A small code saving and less error handling to worry about.

> > Signed-off-by: Mark Brown <broonie@opensource.wolfsonmicro.com>

> What about devm for the clocks, too?

The devm_ versions of the API aren't exported there yet and there's a
bug fix pending too but Russell and Mike have ignored the patches thus
far.

--8/pVXlBMPtxfSuJG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJP+uNbAAoJEBus8iNuMP3dBaMP/jL+kkULl/DXEDJbnV1dqHMU
y+h84MNqR9dfENoR2AkFqLF9DZAB+SfiHVfLaScmZXFtpB8Ka+Gvx0hzYSYi0+mS
tsUblwG3c3jxgEoFXMNnmgF9hE6/TAKx/jLSeT0qmLtqAxG3f1lybIEO/EJprxTD
W1XHJ4S4DtOvW3uY0zCMC8uTERNiWTlWHJSAbv8C//JNexElOtElBnA9SiuH+Bfp
Kbwh8UtVcI8vyL9S5qi1h51GGtZtCTjMkuuPuIkVy2uWXDK94G2KWImn+IYxn8mX
t0JqJ4a6QNCCby/ZU+OLDHxoSzbvQaop5fr3hkDuUmIN+9AgCNczZiypHlrOBNoF
RfXonWpYMF5qQDoYl4nx0E4znlLvnIkD8t7yV5/5aAP0yLl7d1lW4kFewzSo72b6
djWwC6Mo4It5NUKffgcS37LyDeYfNchMzyZvGlmLO/0gmfkoryIgmQqfPPNlthbz
YdHJGZvyxNx0UjNw2/flyWf+9vUpYtyzDfdSPXPRuex7xmT38gfW19YLmuS6QWOf
c6N1wb6IiUirpEBfXSWtf2vzGU98vV5/IPcyn6/GzfDlpQvCopl2UUvRhkFN/ub2
VZmxrvB6uWOFnqe+s2Z0JlZgtOCrGrQxfLQqIWTvRslPJVBo/WY08tMRoPsjrYmE
wro8bcurN1NjyyqSu3m3
=FH+4
-----END PGP SIGNATURE-----

--8/pVXlBMPtxfSuJG--
