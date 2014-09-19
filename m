From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH V7 11/12] Documentation: bridge: Add documentation for
 ps8622 DT properties
Date: Fri, 19 Sep 2014 17:28:37 +0300
Message-ID: <541C3D95.7080200@ti.com>
References: <1409150399-12534-1-git-send-email-ajaykumar.rs@samsung.com>	<5419760A.7020908@ti.com>	<CAEC9eQPn63upE6XEZZtJWGdOAhWWNvU9EhfOXJ=x0i467q+iMQ@mail.gmail.com>	<5419B52D.4060107@ti.com>	<CAEC9eQO2rfmVEKTCUJk+SpfdeUr81gN3stYV3wE6yR3E=-zonA@mail.gmail.com>	<541C279A.2030601@ti.com> <CAEC9eQMQrM289J+ukkshKtTo9dB=G4cvg-4zF6LR6snqE5BL0A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="GO1Cened6e0kAPP7GqNKoDFnnKqw892jc"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from arroyo.ext.ti.com ([192.94.94.40]:50956 "EHLO arroyo.ext.ti.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756284AbaISO2w (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 19 Sep 2014 10:28:52 -0400
In-Reply-To: <CAEC9eQMQrM289J+ukkshKtTo9dB=G4cvg-4zF6LR6snqE5BL0A@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Ajay kumar <ajaynumb@gmail.com>
Cc: Ajay Kumar <ajaykumar.rs@samsung.com>, InKi Dae <inki.dae@samsung.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Thierry Reding <thierry.reding@gmail.com>, Rob Clark <robdclark@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, Sean Paul <seanpaul@google.com>, Jingoo Han <jg1.han@samsung.com>, sunil joshi <joshi@samsung.com>, Prashanth G <prashanth.g@samsung.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>

--GO1Cened6e0kAPP7GqNKoDFnnKqw892jc
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 19/09/14 16:59, Ajay kumar wrote:

> I am not really able to understand, what's stopping us from using this
> bridge on a board with "complex" display connections. To use ps8622 dri=
ver,
> one needs to "attach" it to the DRM framework. For this, the DRM driver=


Remember that when we talk about DT bindings, there's no such thing as
DRM. We talk about hardware. The same bindings need to work on any
operating system.

> would need the DT node for ps8622 bridge. For which I use a phandle.

A complex one could be for example a case where you have two different
panels connected to ps8622, and you can switch between the two panels
with, say, a gpio. How do you present that with a simple phandle?

In the exynos5420-peach-pit.dts, which you linked earlier, I see a
"panel" property in the ps8625 node. That's missing from the bindings in
this patch. Why is that? How is the panel linked in this version?

> If some XYZ platform wishes to pick the DT node via a different method,=

> they are always welcome to do it. Just because I am not specifying a
> video port/endpoint in the DT binding example, would it mean that platf=
orm
> cannot make use of ports in future? If that is the case, I can add some=
thing

All the platforms share the same bindings for ps8622. If you now specify
that ps8622 bindings use a simple phandle, then anyone who uses ps8622
should support that.

Of course the bindings can be extended in the future. In that case the
drivers need to support both the old and the new bindings, which is
always a hassle.

Generally speaking, I sense that we have different views of how display
devices and drivers are structured. You say "If some XYZ platform wishes
to pick the DT node via a different method, they are always welcome to
do it.". This sounds to me that you see the connections between display
devices as something handled by a platform specific driver.

I, on the other hand, see connections between display devices as common
properties.

Say, we could have a display board, with a panel and an encoder and
maybe some other components, which takes parallel RGB as input. The same
display board could as well be connected to an OMAP board or to an
Exynos board.

I think the exact same display-board.dtsi file, which describes the
devices and connections in the display board, should be usable on both
OMAP and Exynos platforms. This means we need to have a common way to
describe video devices, just as we have for other things.

 Tomi



--GO1Cened6e0kAPP7GqNKoDFnnKqw892jc
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJUHD2VAAoJEPo9qoy8lh71u3cP/0lj+cMaortF7yLJHA9dlpiu
h/3xLFrkIe8yutuuA93HnKNDc4Fkb7HTzEn4+tRZ3n5HzbnGiaR6WZcjGswIp0HT
u9VC4FJ8o8RMjS/p7SeGJXhW16jQ+hjC1XAiqHOA6HdQA2ldtuuID8lbcoX51x2P
MSeF/Lk9CBlAVynPGQqxScbYWUd7eegoQKcig74GYV+dHeUokWgtFzGqJ1I12/fO
KSHRgJQUyD/V3j20z7Br3YlhZXdBvTlvaUN0bbZ7Y9sGFpb0MreL1GpTpFKWWy6S
QXCT+OR+CaWybqttJhgTkTFkGOO8YTDgxE1NJCHWRXX3y23HUU49TRW+8PZ8nbSe
sTJWTZBhLhTjIwQNHAupSI/0wYX9AfJZKzQk8JlGCpLuTRhqBqjOQull+1qj8Xyg
FDn+L34JXxqgLskZPS1qd57h6OF1c0U6LJSe8RdITOCN8pdj0mgRn37AdExhlkmx
0kBXjHpRtz5Opi4e1iaK55QLfswgZZZ54zBITsfYDp9TwSzlMFba1zQuq/nOsmin
W24f+K1hmv5MSvAREPtS1Uhm6UKG2zdvPym5wjFWN9to/PFhJy8N2LciS4q378JM
zl3tiFlunRooLvDx9KuNJbn3aRrBg8jZ7igo4++lfjX7OrYl/p60+LgGBkGaQi5A
ILdntIc5Orda9agLJsZR
=m4x5
-----END PGP SIGNATURE-----

--GO1Cened6e0kAPP7GqNKoDFnnKqw892jc--
