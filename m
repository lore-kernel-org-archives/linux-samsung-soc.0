From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH V7 11/12] Documentation: bridge: Add documentation for
 ps8622 DT properties
Date: Tue, 7 Oct 2014 11:25:56 +0300
Message-ID: <5433A394.4000406@ti.com>
References: <1409150399-12534-1-git-send-email-ajaykumar.rs@samsung.com> <353158006.4Zqtrv9CtX@avalon> <543390E2.1080108@ti.com> <5749335.iMpaHR0UO8@avalon>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="itQ4forRl4AGIpLGRtkPS6hUU2cfTPp9C"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from arroyo.ext.ti.com ([192.94.94.40]:55276 "EHLO arroyo.ext.ti.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752758AbaJGI0J (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 7 Oct 2014 04:26:09 -0400
In-Reply-To: <5749335.iMpaHR0UO8@avalon>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, Ajay kumar <ajaynumb@gmail.com>, Ajay Kumar <ajaykumar.rs@samsung.com>, InKi Dae <inki.dae@samsung.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Rob Clark <robdclark@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, Sean Paul <seanpaul@google.com>, Jingoo Han <jg1.han@samsung.com>, sunil joshi <joshi@samsung.com>, Prashanth G <prashanth.g@samsung.com>

--itQ4forRl4AGIpLGRtkPS6hUU2cfTPp9C
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

On 07/10/14 10:23, Laurent Pinchart wrote:

>> You mean the bridge driver would somehow take a peek into panel1 and
>> panel2 nodes, looking for bridge specific properties? Sounds somewhat
>> fragile to me... How would the bridge driver know a property is for th=
e
>> bridge?
>=20
> No, I mean the bridge driver should call the API provided by the panel =
objects=20
> to get information about the panels, and compute its configuration para=
meters=20
> from those. I'm not sure if that's possible though, it depends on wheth=
er the=20
> bridge parameters can be computed from information provided by the pane=
l.

Right. My example tried to show a case where they can't be queried. The
board or the wiring causes signal degradation, which can be fixed by
increasing the bridge output voltage slightly.

So it has nothing really to do with the panel, but the board.

I fully admit that it is a purely theoretical case, and I don't have any
real use cases in mind right now.

 Tomi



--itQ4forRl4AGIpLGRtkPS6hUU2cfTPp9C
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJUM6OUAAoJEPo9qoy8lh71ZkcP/R9y97p/bScA7pAnvaIJAxUO
5GM2WADTIp6aUJhaXCTyDlYoAOuoWsS+v5l0m+Titvgdw3TAysyBIsYEi4Poa03W
a1yf67/565W8DIYGWiRaYKNrzZW9a7yn8Wu6mOubxW4hgop1mLrjr0chRMlk0nYj
eKKPTES4OLBJYILFJ5R/urLON7V0hvdNBnub0NyzxJCobbVlF/jYZ1C3d7TUeu/q
aOMlILZJlMBJWEEkfq+0pqrOWdUGVu2nm2fuZiZK6TpcMX/OqUdp5k2T9mJY2CzG
v4Tr81ytKdvqBFc0K/i86sBP0AbKGcSDMqhmqBV89s6LOCeQ+GYLLdVqO5bu5TkH
K1sF/kMAEKUboFolEBq0+0QOWJG7831xT7uglXrpvChK0QRP9SpUOTeKwCev82/F
9cKBubRc+vEEYrgOkQ25vtyUN0bnQFwHfCyayKsh2Uvum0ROjfffYOsSLOZThA2d
dJJqWjGJzWauVZjtIvPHJJ1BARMpLI0U9grzQpjKm07P8evTFK24Mp9BrDOgxwrL
8vZL7Efw1f6WdXEwVMLmZSDAg7TbpbJAkOMK9mrqwi1c1ZyiF54OwgiiKoCc1q/e
wyt10h5o1gKl4T2WXwUM8nCQVIope6r2y5Xk3WqF0OxntzjXOkWN0kc3lRGhWzeV
ezuDLlre58eQ7Fzq79mz
=BqxK
-----END PGP SIGNATURE-----

--itQ4forRl4AGIpLGRtkPS6hUU2cfTPp9C--
