From: Mark Brown <broonie@kernel.org>
Subject: Re: [RFC PATCH 6/6] spi: spi-s3c64xx: Move DMA initialization
Date: Mon, 9 Sep 2013 15:53:51 +0100
Message-ID: <20130909145351.GD29403@sirena.org.uk>
References: <1378735766-12330-1-git-send-email-l.czerwinski@samsung.com>
 <1378735766-12330-7-git-send-email-l.czerwinski@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="aSMWOr4h/ZU3vZ/E"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cassiel.sirena.org.uk ([80.68.93.111]:54945 "EHLO
	cassiel.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752415Ab3IIOyQ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 9 Sep 2013 10:54:16 -0400
Content-Disposition: inline
In-Reply-To: <1378735766-12330-7-git-send-email-l.czerwinski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Lukasz Czerwinski <l.czerwinski@samsung.com>
Cc: s.nawrocki@samsung.com, linux-samsung-soc@vger.kernel.org, linux-spi@vger.kernel.org


--aSMWOr4h/ZU3vZ/E
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Sep 09, 2013 at 04:09:26PM +0200, Lukasz Czerwinski wrote:
> This patch removes DMA channel initialization and deinitialization for each
> transfer. Now DMA channel is requested only at the driver initialization
> and stored in driver data.

So, this is fine but I had been under the impression that one of the
reasons that the channels were only being requested at transfer time was
that they could be used for other purposes too.  If that is not the case
then fine, if that is the case then probably moving to prepare/unprepare
transfer hardware (when the clocks are enabled) would make more sense -
that'd avoid repeated allocations and frees while the controller is busy
which should be the main issue performance wise.

--aSMWOr4h/ZU3vZ/E
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.21 (GNU/Linux)

iQIcBAEBAgAGBQJSLeD8AAoJELSic+t+oim9nNUP/3Pq7JSZ3ffa2eO3KyHSSiJl
1+qXiPNMv4px5dwJTdiR4W31dPBanbuVfYB1WGLlPToN7eYpVFpN12o2xd8Hh+3u
Y5ssYJCB9TSdOQQv0ceuPFtK1rWVWUeyFMrcmqM6aA7PAy0ei+pANPdYij3IBxtX
Ul+u2mFBQcZqDs76MMtxS0MRHDz3qvsen7U9Lvzv7kXZwJY5E6qMaj7t8jF1294D
DQDozIMPAtViKkc8HOwYa1BSLNdndWdZHd3eExTUBBcfcaoDFGmg4BO54xA1DMvj
A/y6VIFhyc9Y9BVWLYMLlWnN04VwbqUl7y5J461znla51iVFHc4ejTeZooEODcJ7
l0pALiaNhCBDsgWY8W8lSYYMrW5fCgv1KcHy2zXu8xCGQ3XsOGyyyojd48WC1+o+
eiM6UFweL0wgn/qjtmqDQXNHBbh9lNTOim6IT+SJtBWC2DlbHOaFFAHE3GHhVYFV
LWjxu4ZeO4xGkAjSla1UnMaf2sHmO2KdUbyoTmIPbDh2w4pLwZ8L+yI32ghoEu42
nCgKYc+aEm3vmKR2v2srx+7J5x0thdLD8QEIOji9CdsXvub4KL1DAeLRJvoA0l8u
MYku6LRDjMDsrjMyVVS9+vwebkmFYauXIkCjtQqd2Q/nYdDrqus02SUVPMVuKJeH
r8ec3X2vWu0eIh4SFE3A
=RIXS
-----END PGP SIGNATURE-----

--aSMWOr4h/ZU3vZ/E--
