From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH 0/4] Pending S3C64xx updates
Date: Fri, 27 Jan 2012 11:27:51 +0000
Message-ID: <20120127112751.GF32008@opensource.wolfsonmicro.com>
References: <20120124213127.GH1135@opensource.wolfsonmicro.com>
 <016501ccdc93$ae158190$0a4084b0$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="EP0wieDxd4TSJjHq"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from opensource.wolfsonmicro.com ([80.75.67.52]:40939 "EHLO
	opensource.wolfsonmicro.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752386Ab2A0L1x (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 27 Jan 2012 06:27:53 -0500
Content-Disposition: inline
In-Reply-To: <016501ccdc93$ae158190$0a4084b0$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org


--EP0wieDxd4TSJjHq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jan 27, 2012 at 10:33:24AM +0900, Kukjin Kim wrote:
> Mark Brown wrote:

> >       ARM: S3C64XX: Define some additional always off clocks

> Hmm, I know there were discussions about this with Tomasz Figa and I was
> waiting for his submitting. But now this looks ok to me so will apply this.

The discussion there was around there being other out of tree drivers
that might at some point want to use these clocks - I don't think there
was any doubt that for current mainline this change makes sense.

--EP0wieDxd4TSJjHq
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAEBAgAGBQJPIoorAAoJEBus8iNuMP3d/MMP/3YSHbyVotZS1urX5EiZ0zN8
9A7gx7JzulV73PmmELGU0QHQwoMqTl9+ALdlF3nkBLjZa7AEWmodpK2AxqXLEQEp
IhrrKZJyJ2DToHU2eFuMi0aXR90utCkaiFgUU/fZV1RdUX8CqTcKU9W9itNYSLuB
VoOezlW5muZjc+1Wj9uE8E0hXSu0eSsTvyliv/vPlDgvC5wpXWAquomq8U1I/C+a
HA2dcw2fb5pi9FPpxFDsoI9uuP8wLke3+3AfN++Rn3xwzlNJDpu6AuuFVc/aC3/e
cWEeuq5HfgI46wpuvr2Dg7WVWWzU/frSq0uwgfRmi5Hdg3cl8H5Nv4N8v/P0ErLH
6/OPrOFkO5wYn6kdno8VSHqUc8udBLEVk4ZP/JxKkA0zrnNIlto8A37T36sEDyjn
PVSG+pJmqbXXV8bmIUfUp7Dw+Y49r612V2BXY5fB5aItwTz6RaG4yI6b18CjtRHi
Z0hvIVurQsfs6/Cl954bzZm6bcGmhdn6y+JqSG+uobbuRoQvfuDD/T7XhZ1oXw5r
hll9FNtrXPd8gU8JYbAdKlCFh/FKsXX9QuuzWOF+FpufwA4f2XXPm4h8AJyEnuln
nuuHiNhQ2GMDWggEnwO8+J4DPrgSxJ5/IqTj4NS//KQcR/zrDiJkdt8PxSiJEwWs
k3bHll//Rgcw3We5BTO4
=w7jX
-----END PGP SIGNATURE-----

--EP0wieDxd4TSJjHq--
