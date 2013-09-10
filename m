From: Mark Brown <broonie@kernel.org>
Subject: Re: [RFC PATCH 6/6] spi: spi-s3c64xx: Move DMA initialization
Date: Tue, 10 Sep 2013 17:32:48 +0100
Message-ID: <20130910163248.GO29403@sirena.org.uk>
References: <1378735766-12330-1-git-send-email-l.czerwinski@samsung.com>
 <1378735766-12330-7-git-send-email-l.czerwinski@samsung.com>
 <20130909145351.GD29403@sirena.org.uk>
 <522F0151.50905@samsung.com>
 <20130910120358.GG29403@sirena.org.uk>
 <522F1BCB.1000400@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="KbRlJ7rsgYPVCYDX"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cassiel.sirena.org.uk ([80.68.93.111]:50118 "EHLO
	cassiel.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751911Ab3IJQdM (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 10 Sep 2013 12:33:12 -0400
Content-Disposition: inline
In-Reply-To: <522F1BCB.1000400@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?utf-8?Q?=C5=81ukasz_Czerwi=C5=84ski?= <l.czerwinski@samsung.com>
Cc: s.nawrocki@samsung.com, linux-samsung-soc@vger.kernel.org, linux-spi@vger.kernel.org


--KbRlJ7rsgYPVCYDX
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 10, 2013 at 03:16:59PM +0200, =C5=81ukasz Czerwi=C5=84ski wrote:
> On 09/10/2013 02:03 PM, Mark Brown wrote:
> >On Tue, Sep 10, 2013 at 01:24:01PM +0200, =C5=81ukasz Czerwi=C5=84ski wr=
ote:

> >>For 16kB buffer upload time is reduced from ~90ms to ~80ms (I tested
> >>with S5C73M3 355560B transfer). If you think that performance
> >>increase isn't valuable we should skip that patch.

> >That does seem worthwhile.  Is that just a single transfer in isolation?

> I gave you summary time when firmware is transferred via 22x16kB blocks.
> Each transfer was isolated.

OK, so that's the per-transfer number?  I'm just wondering if moving it
to prepare/unprepare would achieve the same effect here.

--KbRlJ7rsgYPVCYDX
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.21 (GNU/Linux)

iQIcBAEBAgAGBQJSL0mtAAoJELSic+t+oim9CN4P/24vyoq2uw5gSAabJFGds0yz
IM0eke2yeHXYn4xbNp/2CFdCuIO+A9DoBoUZMMS9ijrpta1Ilfy2uylyERgAxjFe
N95O1nMlRlady5bcJACWWHk/EOwSYBoChCRzJTNStx6RQ/O+i95TGU95qoaO1YUS
rhIM0bA2rB69tpuZdCeBq0s2pEk4kp+BO9I1lK4fpOqJ8a6SwrHv+6bTlcDBAlTm
3MOB2GhlO+um8KRRlxCmzhBfikhzbq5BPk6e6zGtB2tePIEwLb7jjekQMb9VfNfT
c4uuFUarehURK5UCd8vUsz4HCK4CTG66GyESjkzHiGlx0ZcHHtq/001W3vi4MyAi
DgQN0Rpa+R1/TR2RsfVQhI9I+a5hkiHnkx9zLFK+o+d86VXGPPtKCPnVRhFP7/c2
Mlwf4RH+mt/cCEzxAGW6dOR5dJzKNkQpy8yF+ibA0+lxMTD/649ENQbI/Fi+xIh5
+4nQ3g03FnF4nQDxoFa6vroBT/OC/DG5fWRaoSeg7GnzH0zZBufps+f8bFENylbK
XTjufohb2vWzF6PVyuk9+sq2iSiVnmMajYCOMoNcjIKcSwa+1cUPmPu26F6PSLKW
K6MIQw9ysqqpRpa1OBJiWAG9kFd27suN/zbvQvEO+uEcHwLozpBIGM2dpDCilD5U
/8jIJFSxMIwq16ApstO7
=ZCfW
-----END PGP SIGNATURE-----

--KbRlJ7rsgYPVCYDX--
