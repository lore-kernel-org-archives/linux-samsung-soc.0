From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH] ARM: Samsung: Make PM_GENERIC_DOMAINS config depend on
 CONFIG_PM
Date: Wed, 28 Mar 2012 11:51:22 +0100
Message-ID: <20120328105122.GF3232@opensource.wolfsonmicro.com>
References: <1332843404-25476-1-git-send-email-thomas.ab@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="WlEyl6ow+jlIgNUh"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from opensource.wolfsonmicro.com ([80.75.67.52]:51841 "EHLO
	opensource.wolfsonmicro.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1753949Ab2C1Kvt (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 28 Mar 2012 06:51:49 -0400
Content-Disposition: inline
In-Reply-To: <1332843404-25476-1-git-send-email-thomas.ab@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Thomas Abraham <thomas.ab@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, linux-arm-kernel@lists.infradead.org


--WlEyl6ow+jlIgNUh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Mar 27, 2012 at 03:46:43PM +0530, Thomas Abraham wrote:
> For s3c64xx and exynos platforms, make the selection of PM_GENERIC_DOMAINS
> depend on the CONFIG_PM.

What's the underlying issue here?  This seems like something the PM core
should be dealing with gracefully...

--WlEyl6ow+jlIgNUh
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAEBAgAGBQJPcu0jAAoJEBus8iNuMP3dlO4P/jvudFYH9JL+YOEwmwU6AlS6
avHd2yHeTkW5eJjlwwy2kiuAtXA12HRTMcEQbNN22W/pE11zSXXHbNr9PTK0fejK
uYLM61UqOpTLnaJnNIux5y1i6yoxa7WT31xsFybedGSVvofWqQgmnFqDXKUpBhj+
Og0oNeTHTnN01RiRKUmhbuvluz5c62K2Hvu49NJ/x19gYRL6Rypm0pv5CFHV7O5M
BPDhHs6pzd7CHEpEZ74ppZLfqp/gTWBNnlwMkpx6Mkv2L9PCCRr36SZm0LxtuJAl
FraFcG9DPY7Xy2+KBBSs99j5UzmV3yWP6cqgIgZ46gufqMw0X2+ghV0UZLJXRA5L
ycv3ZMZch0q4c4mzGaX2ajivouRaZ0ltNL1G6v04SoBH6speePT6zlO1TuC7nmhk
o5OcHEu4tGdSS8zCcjjFWBKWoo8qaozXOtK5ANa6zQLXwHI+B+enOV47EDHKiiR+
d5iJDuJxDByQgrsioLT3o4sQFWkgRIt1OnioIMGPG7Ddz4F6CyD3mQCIaplY5Xne
zxoN2lfGJqtKUNO8KAgkSjFZVtcKdQFl6vezARyhNz2ofeEmxo8doOI9bCK5ocRl
D6Tfm/bxH87HAtVqrjEh4IPWU2P7r2SLIFnLSuRfjWWji/1umEtuRgfO4V/QlsXd
2uLS9EWfcl7Kemfc0XdP
=j5iN
-----END PGP SIGNATURE-----

--WlEyl6ow+jlIgNUh--
