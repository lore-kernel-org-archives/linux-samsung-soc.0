From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [RFC PATCH v2 19/21] ARM: dts: exynos5250-arndale: add dsi and
 panel nodes
Date: Fri, 7 Mar 2014 14:32:05 +0200
Message-ID: <5319BC45.4040308@ti.com>
References: <1392204688-4591-1-git-send-email-a.hajda@samsung.com> <1392204688-4591-20-git-send-email-a.hajda@samsung.com> <53108FA0.4040903@ti.com> <53109193.3000604@ti.com> <5315C07B.3090705@samsung.com> <CAAQKjZPVvAxC7=voKJ1Jid3Ynnrjcg6s5m95fwetx7iDeZUN+w@mail.gmail.com> <5319B9FF.50201@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="JbbJ7UNUrqWHo2L7mDuqXwL4G8leuVpT5"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from arroyo.ext.ti.com ([192.94.94.40]:39336 "EHLO arroyo.ext.ti.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751266AbaCGMcZ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 7 Mar 2014 07:32:25 -0500
In-Reply-To: <5319B9FF.50201@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Andrzej Hajda <a.hajda@samsung.com>
Cc: Inki Dae <inki.dae@samsung.com>, DRI mailing list <dri-devel@lists.freedesktop.org>, Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kyungmin Park <kyungmin.park@samsung.com>, Rob Herring <robh+dt@kernel.org>, Kumar Gala <galak@codeaurora.org>, Grant Likely <grant.likely@linaro.org>, Marek Szyprowski <m.szyprowski@samsung.com>

--JbbJ7UNUrqWHo2L7mDuqXwL4G8leuVpT5
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On 07/03/14 14:22, Andrzej Hajda wrote:

> I think we should even extend the bindings to fimd:
> dsi {
>     port@0 {
>         dsi_0: endpoint {
>             remote-endpoint=3D<&fimd_0>;
>         }
>     }
>     port@1 {
>         dsi_1: endpoint {
>             remote-endpoint=3D<&lvds_0>;
>         }
>     }
> }
>=20
> fimd {
>     port@0 {
>         fimd_0: endpoint {
>             remote-endpoint=3D<&dsi_0>;
>         }
>     }
> }

If both fimd and dsi are SoC components, I don't see any strict need for
that. I think the ports/endpoints are only important when dealing with
external components, which can be used on any platform. For SoC internal
components you can have relevant data directly in the drivers, as it is
fixed (for that SoC).

Of course, if using ports for SoC internal components makes things
easier for you, I don't see any problems with it either.

For OMAP, the SoC's display blocks are all inside one bigger DSS
"container", so I have not seen need to represent the connections
between the internal components in the DT data.

If the display components were truly independent IPs on the SoC, then
using ports might make things easier.

 Tomi



--JbbJ7UNUrqWHo2L7mDuqXwL4G8leuVpT5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.14 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQIcBAEBAgAGBQJTGbxFAAoJEPo9qoy8lh71FasP/1nFZ7cOErF3O5Z9dC9f9YNP
UUucgHPrVFm1PuVoaddX3acpbhv/neccxEEloGx8qm9k4eeUF5v1RuH73FHNpafj
Ly/YSCAQ7gccDid0l6ZJ1KGezEHKse8wwM+vyuNCuLVAVwcQ5vMny4A9mdFElyBK
uHGmytmpfV15qj9kQqMRZO+kasUDDy3/Wz1khiQQL3dK4xpRrstgh5SMeJ9mNzxw
coK+GyexLRz8bUivfYhDd+tZndmxTUagpEhqFOeUFU9JL+b9QB3i7OZ67KamhNZR
55oSpFrFCj7PNxYi4MeZVSjvA6/hpmNLzq/KHA8c+ayjwnyFvgFNSQI8Xc6rIiPL
tZ9HImpeQcjtD/n6jjrtjGhRT28VSwaGtYISyQTNjHimfBraY/ESoIjoBwFIXa4D
Wn7ZFVcMQhyE1fEjnUPzTXieeSXH41GLQ17hD2nyGmqLW6Q2QMEJd4C/pRsyvhnN
jKoLUQTIreqRo0ujcSN1W0mqj5FpWPuS+qi6F9loq9sUBBgglvqJLiqWiMf0W1jG
dYp0NTX3jNMH1nImT4HdIaIxQEX+MIDYYPX82zfM9tMNuUc/aturr1c2fyuA9Ryf
XT4ceNTY931CHKeVV3iQh/b6IXdeCXSqlo78v5U6hgve2D7R/UC8CcMedZLrbl6Z
wb1IJFqA723fAwwryuvN
=QqC7
-----END PGP SIGNATURE-----

--JbbJ7UNUrqWHo2L7mDuqXwL4G8leuVpT5--
