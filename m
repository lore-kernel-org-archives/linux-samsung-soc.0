From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH V7 11/12] Documentation: bridge: Add documentation for
 ps8622 DT properties
Date: Mon, 22 Sep 2014 18:05:10 +0300
Message-ID: <54203AA6.1040103@ti.com>
References: <1409150399-12534-1-git-send-email-ajaykumar.rs@samsung.com>	<5419760A.7020908@ti.com>	<CAEC9eQPn63upE6XEZZtJWGdOAhWWNvU9EhfOXJ=x0i467q+iMQ@mail.gmail.com>	<5419B52D.4060107@ti.com>	<CAEC9eQO2rfmVEKTCUJk+SpfdeUr81gN3stYV3wE6yR3E=-zonA@mail.gmail.com>	<541C279A.2030601@ti.com>	<CAEC9eQMQrM289J+ukkshKtTo9dB=G4cvg-4zF6LR6snqE5BL0A@mail.gmail.com>	<541C3D95.7080200@ti.com>	<CAEC9eQNshrP6wW_9mEDbFR5hRpW6Hy=GBFzV=rf05Wpxz6gtiw@mail.gmail.com> <CABxcv=kGTmYtjDc0isgy=-Ga+w69zVefJwK1qQY7dmER5fhhJg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="uETLxIdIjLxgMxAJkuvWeJct2rhTw8vF8"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from devils.ext.ti.com ([198.47.26.153]:44069 "EHLO
	devils.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752344AbaIVPF3 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 22 Sep 2014 11:05:29 -0400
In-Reply-To: <CABxcv=kGTmYtjDc0isgy=-Ga+w69zVefJwK1qQY7dmER5fhhJg@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier@dowhile0.org>, Ajay kumar <ajaynumb@gmail.com>, Kukjin Kim <kgene.kim@samsung.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, Ajay Kumar <ajaykumar.rs@samsung.com>, InKi Dae <inki.dae@samsung.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Rob Clark <robdclark@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, Sean Paul <seanpaul@google.com>, Jingoo Han <jg1.han@samsung.com>, sunil joshi <joshi@samsung.com>, Prashanth G <prashanth.g@samsung.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>

--uETLxIdIjLxgMxAJkuvWeJct2rhTw8vF8
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 20/09/14 18:27, Javier Martinez Canillas wrote:

> I see that Documentation/devicetree/bindings/video/ti,omap-dss.txt
> mentions that the Video Ports binding documentation is in
> Documentation/devicetree/bindings/video/video-ports.txt but I don't
> see that this file exists in the kernel [1]. I see though that is was
> included on your series adding DSS DT support [2].
>=20
> Do you know what happened with this file?

Ah, I need to update the link. This describes the graph:

Documentation/devicetree/bindings/graph.txt

 Tomi



--uETLxIdIjLxgMxAJkuvWeJct2rhTw8vF8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJUIDqmAAoJEPo9qoy8lh71uTQP/0siZUpdAtIjQ93wXYQwoQeU
l5jLP5VSGX1ZNKGWDlYiH5yUeItoSE/yTVK0kyRaS6MI2KpFAf3FH5SOWQs4QbAE
3E826Sea968z/MjKzUttIweXLIi4KQS5qpDCQfsJUq29TzOEB7QuXLsWnbFR2Ump
woKo5/TaVf1LwBNxzPSoYHnIXXNj4ICcN7egJZ+bwjhB5oZMnqfdA20e88VsPcZU
NkVNPtPWKFuR8nGee9OGzG765dMPpvGv/4mYGHTi3kyiFJr1OkDLcY/amwhNjZfu
xZVLTaTO9p8cmSv5ingIQcK7J2odrTXCGh5DzoAtxe8WZ3013N6/Or/o78M06ihI
U9sWSbPf97R2oljrO+qM4nRFAH4fE5xlVZ6ub/TDOnoIv8j8ccxyos7VhhUvNw+F
ml6jCqS/AhJ2Ksa7I6E/dYtrywXDE/U3rN2HBY0i0Kw+T9pNDqe4eVuqWQnxpZp5
y2ltFvY/gqDv2p6T2Rzedc2Df/XCOq4uBr4JfFovP2RiWnntYOt99wULmxtXvQTe
hgPfen0mPZQT/P+Af9wkGECwMDZ1DCgBvZ3PA/ImQCONJQ14t+VdvCqauAq/pc02
l58/ORO2eYr0qkc/4JFIiD0uXQUW4pWIBguY2cyqPYVtjuLVK9oin5Hc52HyWxLi
njir1K7Ntk33puTwqYnv
=AXUC
-----END PGP SIGNATURE-----

--uETLxIdIjLxgMxAJkuvWeJct2rhTw8vF8--
