From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH V7 11/12] Documentation: bridge: Add documentation for
 ps8622 DT properties
Date: Fri, 19 Sep 2014 15:54:50 +0300
Message-ID: <541C279A.2030601@ti.com>
References: <1409150399-12534-1-git-send-email-ajaykumar.rs@samsung.com>	<5419760A.7020908@ti.com>	<CAEC9eQPn63upE6XEZZtJWGdOAhWWNvU9EhfOXJ=x0i467q+iMQ@mail.gmail.com>	<5419B52D.4060107@ti.com> <CAEC9eQO2rfmVEKTCUJk+SpfdeUr81gN3stYV3wE6yR3E=-zonA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="AxLQKvb7qRmNVrJuVJ1DKjsPXB884rf3D"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from bear.ext.ti.com ([192.94.94.41]:55753 "EHLO bear.ext.ti.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756137AbaISMzF (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 19 Sep 2014 08:55:05 -0400
In-Reply-To: <CAEC9eQO2rfmVEKTCUJk+SpfdeUr81gN3stYV3wE6yR3E=-zonA@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Ajay kumar <ajaynumb@gmail.com>
Cc: Ajay Kumar <ajaykumar.rs@samsung.com>, InKi Dae <inki.dae@samsung.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Thierry Reding <thierry.reding@gmail.com>, Rob Clark <robdclark@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, Sean Paul <seanpaul@google.com>, Jingoo Han <jg1.han@samsung.com>, sunil joshi <joshi@samsung.com>, Prashanth G <prashanth.g@samsung.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>

--AxLQKvb7qRmNVrJuVJ1DKjsPXB884rf3D
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 18/09/14 08:50, Ajay kumar wrote:

>>> Why do we need a complex graph when it can be handled using a simple =
phandle?
>>
>> Maybe in your case you can handle it with simple phandle. Can you
>> guarantee that it's enough for everyone, on all platforms?
> Yes, as of now exynos5420-peach-pit and exynos5250-spring boards use
> this. In case of both, the phandle to bridge node is passed to the
> exynos_dp node.
>=20
>> The point of the ports/endpoint graph is to also support more
>> complicated scenarios. If you now create ps8622 bindings that do not
>> support those graphs, the no one else using ps8622 can use
>> ports/endpoint graphs either.
>>
>> Btw, is there an example how the bridge with these bindings is used in=
 a
>> board's .dts file? I couldn't find any example with a quick search. So=

>> it's unclear to me what the "simple phandle" actually is.
> Please refer to the following link:
> https://git.kernel.org/cgit/linux/kernel/git/kgene/linux-samsung.git/tr=
ee/arch/arm/boot/dts/exynos5420-peach-pit.dts?id=3Dsamsung-dt#n129
> Let me know if you still think we would need to describe it as a comple=
x graph!

Yes, I think so. I'm not the DRM maintainer, though.

I think we have two options:

1) Describe the video component connections with the ports/endpoints
properly for all new display device bindings, and know that it's
(hopefully) future proof and covers even the more complex boards that
use the devices.

or

2) Use some simple methods to describe the links, like single phandle as
you do, knowing that we can't support more complex boards in the future.

I see some exynos boards already using the ports/endpoints, like
arch/arm/boot/dts/exynos4412-trats2.dts. Why not use it for all new
display devices?

 Tomi



--AxLQKvb7qRmNVrJuVJ1DKjsPXB884rf3D
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJUHCeaAAoJEPo9qoy8lh71kCkP/iPA5hM0uWtOdH9vBriFc36Z
wKuwJ2QRQn/Vy9St8y02PMyZe0jjC5tx1NphRBPhuJ7SwbL6kxzwq5rppoZdvPgs
zB2qzaFUdSOp7CHeb6ezAKTp8kpXNh4Z3dfVyItC6RdXFXJgZVeoFmIr6lWQjDM3
tNdGjOFhJWlt2kA0PiZ2ZphebnBQ5CKd8yQZH5Eg3bb607uRUZoN7Jz1bisNb32G
y4xJjmYqi9q7oFFjrsYMZz5qbZA4+zFJ1969HUavaxalz7/i1SRNWMDlGPq1uBj/
M3hGY88J9rdv6p/g6ciRfkIVCfjjSQkQ5BbyxQyselwKpMGVyaVrofmJV6gOCudk
kChHoAa4XoDlh+oRK3Fc66CbAKSkrcCKycoaEcwygyPPIsxaGQC05nr9GO8CrZiP
vSj4LmnscOcmlwD7Oj0lAtmD8WzylZmfc6QwS1PbjNBLFHX2cwlPdqP9Kvw45VW5
NEjhSb6pRcgpv7Gxaq/I8iDH7WOCnTAlzoPWF8v6SGSr+ideelks1zmDKOvaEYwQ
6z/dCyGfWzq3a3UaAwMV4n+ijNs9Owy9tDWYPlys6aBxiv+jHqAw0CnGHQPPkY3L
0DdOgx38XW9PTBtDbBAuacDtc5fzCVR94TThVcWtP+JvCj7TG8pNqQ60jUGvfCRQ
UKZlIhV31xrxKpksH2dQ
=VVVN
-----END PGP SIGNATURE-----

--AxLQKvb7qRmNVrJuVJ1DKjsPXB884rf3D--
