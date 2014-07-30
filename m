From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH v6 10/14] drm/panel: add S6E3FA0 driver
Date: Wed, 30 Jul 2014 16:40:52 +0300
Message-ID: <53D8F5E4.1080301@ti.com>
References: <1405587689-1466-1-git-send-email-yj44.cho@samsung.com> <1405587689-1466-11-git-send-email-yj44.cho@samsung.com> <20140717103645.GD17877@ulmo> <53C87D2F.9000906@samsung.com> <53CCD5A8.6090406@samsung.com> <20140721091917.GK8843@ulmo> <53CCF70A.5010403@samsung.com> <53CDDD61.6000005@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="3JkDLsmuvKtmI7OhigoniVDGQKLHnk8Gn"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from arroyo.ext.ti.com ([192.94.94.40]:55627 "EHLO arroyo.ext.ti.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751472AbaG3NlS (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 30 Jul 2014 09:41:18 -0400
In-Reply-To: <53CDDD61.6000005@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: YoungJun Cho <yj44.cho@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, Thierry Reding <thierry.reding@gmail.com>
Cc: airlied@linux.ie, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux-samsung-soc@vger.kernel.org, kyungmin.park@samsung.com, inki.dae@samsung.com, kgene.kim@samsung.com, jy0922.shim@samsung.com, sw0312.kim@samsung.com, Guennadi Liakhovetski <g.liakhovetski@gmx.de>, Paul Mundt <paul.mundt@gmail.com>, Imre Deak <imre.deak@intel.com>

--3JkDLsmuvKtmI7OhigoniVDGQKLHnk8Gn
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

On 22/07/14 06:41, YoungJun Cho wrote:

> Yes, this command is related with Nokia.
>=20
> Last Friday, I met panel vendor guy for some issues.
> At the break time, I asked him for about this Read IDs(04H), why it is
> not included in DCS specification.
> He said that this command was originated by Nokia.
> In feature phone times, most of panel vendors wanted their panels to be=

> used by Nokia and Nokia wanted this command, so most of panel vendors
> still provide this command traditionally.

This is my understanding also. I think the whole MIPI DCS spec
originated from Nokia's command set.

 Tomi



--3JkDLsmuvKtmI7OhigoniVDGQKLHnk8Gn
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJT2PXkAAoJEPo9qoy8lh71aRAP/3IXsIcwxDnruqY2FEgooDFS
nvzwBm/V4J0v4BG1/HdWBlRvWgaE4mPSRiTFbLJKQ5Ya+DBLwTZ4JwbYoCV9Y8UC
S0DVS/C6quonQrUBPqoN0k+lgS0NGpkQKNGvrEeJPu2kIXcqHyaawROYoYTyJEH4
Oe06HPNq2D67LbRvEG4z28kn9HLXV8y2jyacVHkVgFDxYjLsHWUSFvULagCl7FJM
r0eEz7t2gjtt3ZFJtup8GM9DZjJkO1K8vrfPb5xJoE9bs3I0SBzI123R1NBI1PGC
j1CveZcDZ2ZKVtD9Ew70/Px1cmA1osvYC6VH39rcyVyaVL/Q31Mm8nQ9qEEsE30t
Ijw0WnZI9Bj7pJoRguZKDxHspXyjUKc16tq0XS/mwILu77YsWi5/YVdzWg4khXG/
NbwAjz/loyw/yAdaCE9uYhdu04V9kNrJDkckaoGJn1776jwQV+9tRtkP6OUnRDw5
J8FHv9+/yzat5GesJX1jZZjsfY1xa2EgwI4Zd3I0eSwAWlsqzYk2y9WY6xx525/1
9fZn9gOWOSGoOoGToF2y67G74IgeCnQ7gFn2GQUH1RuTvKXDjyAE3DLUT5EQA+A9
DQuwWqEe5tP0PJRmYiHGGZ36JmJDmgScdk8G5jfV9kojwoVD4i9Qe+z/3DJGQ8vB
k5QtizgvvuCPeOFeGrWQ
=BKr1
-----END PGP SIGNATURE-----

--3JkDLsmuvKtmI7OhigoniVDGQKLHnk8Gn--
