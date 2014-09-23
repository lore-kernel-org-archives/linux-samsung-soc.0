From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH V7 11/12] Documentation: bridge: Add documentation for
 ps8622 DT properties
Date: Tue, 23 Sep 2014 14:31:35 +0300
Message-ID: <54215A17.8050606@ti.com>
References: <1409150399-12534-1-git-send-email-ajaykumar.rs@samsung.com> <5419760A.7020908@ti.com> <CAEC9eQPn63upE6XEZZtJWGdOAhWWNvU9EhfOXJ=x0i467q+iMQ@mail.gmail.com> <5419B52D.4060107@ti.com> <20140922080629.GC1470@ulmo> <542030DD.3060906@ti.com> <20140923060452.GD30514@ulmo> <54213543.7000306@ti.com> <20140923093916.GR30514@ulmo>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="iOhc9gDveE6KeQx1KUdtGl57Q11mAl98r"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from arroyo.ext.ti.com ([192.94.94.40]:34307 "EHLO arroyo.ext.ti.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754454AbaIWLbt (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 23 Sep 2014 07:31:49 -0400
In-Reply-To: <20140923093916.GR30514@ulmo>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Ajay kumar <ajaynumb@gmail.com>, Ajay Kumar <ajaykumar.rs@samsung.com>, InKi Dae <inki.dae@samsung.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Rob Clark <robdclark@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, Sean Paul <seanpaul@google.com>, Jingoo Han <jg1.han@samsung.com>, sunil joshi <joshi@samsung.com>, Prashanth G <prashanth.g@samsung.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>

--iOhc9gDveE6KeQx1KUdtGl57Q11mAl98r
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

On 23/09/14 12:39, Thierry Reding wrote:

> My point is that if you use plain phandles you usually have the
> meta-data already. Referring to the above example, bridge0 knows that i=
t
> should look for a bridge with phandle &bridge1, whereas bridge1 knows
> that the device it is connected to is a panel.

The bridge should not care what kind of device is there on the other
end. The bridge just has an output, going to another video component.

>> Well, I can't say about this particular bridge, but afaik you can
>> connect a parallel RGB signal to multiple panels just like that, witho=
ut
>> any muxing.
>=20
> Right, but in that case you're not reconfiguring the signal in any way
> for each of the panels. You send one single signal to all of them. For

Yes, that's one use case, cloning. But I was not talking about that.

> all intents and purposes there is only one panel. Well, I guess you
> could have separate backlights for the panels. In that case though it
> seems better to represent it at least as a virtual mux or bridge, or
> perhaps a "mux panel".

I was talking about the case where you have two totally different
devices, let's say panels, connected to the same output. One could take
a 16-bit parallel RGB signal, the other 24-bit. Only one of them can  be
enabled at a time (from HW perspective both can be enabled at the same
time, but then the other one shows garbage).

 Tomi



--iOhc9gDveE6KeQx1KUdtGl57Q11mAl98r
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJUIVoXAAoJEPo9qoy8lh71pBwQAJPxNFrzypbdnDNTwHey5jn0
R4rHlE1UGl3FdMifVL7HR2Nb0YG5GwrUmWGUwzbCLrX8OsUlefNopeLi5TGu5oBP
t69htKvuP1im56zYFVPTGtRwHGh7VRvRapCg1kLTV89hn/zjLCKwTODAbbNmtQ+h
ozfNSL+QXFictxpYABlCV79dvR/c7Zg5V5z9i1tjhnqOpXOwVcgmArl9drdsMliF
0Nu19Mgx12OJlEk2XdNwur8JOIUtE/u6J7eTsCrgyCSizzcKnNaKKm5IS1RnSF07
WvHUh8vMZne9Ymc87zscMdTK2YH+NSObbgZJYUbrnoxvrU1+vqTOmit54MBC1uuK
R87dp8oJM7ouijDrimhjL6APdyLcgPDnC4tlkWNRSjaidoAhbZiWNpZGAo5tGUi6
SK0hj7Ahn4QmBl21yMoosxLwStxGHEE0UO0qedqXjmAfknEpIfASPZ09VJlhR9LR
QfrlvuZcC98M8HGAkblWYXtlodlwD99FgH8JFhV2+8hx3mzLPDQUa2rEy0Tq+Nyi
82P3EjeFTTbcYbPxMl8JvB094ZxtJAllUSAgKSVgrf4/y9MB2tcrYJ3ABPsq5Tlg
fQCoLHROfLWbM1hf0lTH9iihD1oMc/n5LkxeNl3tFJDSAbtWHjK1bhUH83GEdjXA
K03aM8hlalJ2/ZBXhAx4
=qIaK
-----END PGP SIGNATURE-----

--iOhc9gDveE6KeQx1KUdtGl57Q11mAl98r--
