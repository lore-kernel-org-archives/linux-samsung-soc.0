From: Felipe Balbi <balbi@ti.com>
Subject: Re: [PATCH 7/8] s3c-hsudc: use release_mem_region instead of
 release_resource
Date: Tue, 20 Dec 2011 23:09:48 +0200
Message-ID: <20111220210947.GA7352@legolas.emea.dhcp.ti.com>
References: <201112191938.22254.heiko@sntech.de>
 <201112191942.52629.heiko@sntech.de>
 <20111220201049.GB2577@n2100.arm.linux.org.uk>
Reply-To: balbi@ti.com
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="IJpNTDwzlM2Ie8A6"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from na3sys009aog110.obsmtp.com ([74.125.149.203]:50756 "EHLO
	na3sys009aog110.obsmtp.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752189Ab1LTVJz (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 20 Dec 2011 16:09:55 -0500
Content-Disposition: inline
In-Reply-To: <20111220201049.GB2577@n2100.arm.linux.org.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>, Felipe Balbi <balbi@ti.com>, Kukjin Kim <kgene.kim@samsung.com>, 'Ben Dooks' <ben-linux@fluff.org>, linux-samsung-soc@vger.kernel.org, Linux USB Mailing List <linux-usb@vger.kernel.org>, linux-arm-kernel@lists.infradead.org


--IJpNTDwzlM2Ie8A6
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 20, 2011 at 08:10:49PM +0000, Russell King - ARM Linux wrote:
> On Mon, Dec 19, 2011 at 07:42:52PM +0100, Heiko St=FCbner wrote:
> > As the memory region is requested through request_mem_region
> > use the correct paired method to release it in the error path
> > and don't go "beneath the API" as pointed out by Russel King.
>=20
> Please correct the spelling, thanks.

Just did, do you prefer that I add a Reported-by: Russell instead of
that mention ?

--=20
balbi

--IJpNTDwzlM2Ie8A6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAEBAgAGBQJO8PmbAAoJEIaOsuA1yqRE9I8P/3H7sUK2TJtkEofxiz55Rgp1
0gHIgRf/WSUjf1I9oGN8rPJAvpRZYS4f5qmYGgq5/r+WS0G1MUN6hMCp1xoMlOdv
yfOXZSzjJqK14Td3yJJj+WRlhZ2rRN7e24PJmtpcK+abP8hpQ/zp6UXlc0Yvx8PF
HlCT/uT+eufLiypVv8g3L/TcRkAtRkx5DiK779AUy57gndST8wacXCttcFcg4/jT
R6KwpeUJAbHOmbo1SG36df/1F7Z9rGu2Pc+iqh+T4AJ8P/dxgmzpvlq2TMG9YOgx
ud7HN3/3zwFT3YaQ9sLiZiLpt8/zROiMbfMu4F2paalX18tBl5udtz65vC+AWion
rp4229DjT63uunC9qQWefuKcKPkUudgZSr8Hsy/srm2WTVZXfwjfKXgGvriyh8JI
4PVV4qCSYWW0De1bd5pcbWKWWJ82AZv+jbb8a9aCUDYO312Qtm2cwu/spukGAAVq
Lb0PwjIB6NTUgOBZMsu0GWwpCIvBnEVtujQBb6uJw1/NN52g0CWh4IptFg4f2TzI
snNoRzLskoDmMMMNhjQbP2wrTMlYfgBbP9kwm167341nza0udUcHAx1A9Y/JAPdK
rTSGNebO8Qmu/SBb8ewcvEsnjDMZNopnwfh6YWFZ2VKUfSVARuXP7jYcuUztSadN
9jkpf+8VR4jAhb7gdfA4
=oKGL
-----END PGP SIGNATURE-----

--IJpNTDwzlM2Ie8A6--
