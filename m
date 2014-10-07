From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH V7 11/12] Documentation: bridge: Add documentation for
 ps8622 DT properties
Date: Tue, 7 Oct 2014 13:30:36 +0300
Message-ID: <5433C0CC.5040804@ti.com>
References: <1409150399-12534-1-git-send-email-ajaykumar.rs@samsung.com>	<5419760A.7020908@ti.com>	<CAEC9eQPn63upE6XEZZtJWGdOAhWWNvU9EhfOXJ=x0i467q+iMQ@mail.gmail.com>	<5419B52D.4060107@ti.com>	<CAEC9eQO2rfmVEKTCUJk+SpfdeUr81gN3stYV3wE6yR3E=-zonA@mail.gmail.com>	<541C279A.2030601@ti.com>	<CAEC9eQMQrM289J+ukkshKtTo9dB=G4cvg-4zF6LR6snqE5BL0A@mail.gmail.com>	<541C3D95.7080200@ti.com> <CAEC9eQNshrP6wW_9mEDbFR5hRpW6Hy=GBFzV=rf05Wpxz6gtiw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="MnUiq6aniC6EIwTOE3RgcIoPN2HjohN4q"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from devils.ext.ti.com ([198.47.26.153]:51682 "EHLO
	devils.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753075AbaJGKau (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 7 Oct 2014 06:30:50 -0400
In-Reply-To: <CAEC9eQNshrP6wW_9mEDbFR5hRpW6Hy=GBFzV=rf05Wpxz6gtiw@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Ajay kumar <ajaynumb@gmail.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, Ajay Kumar <ajaykumar.rs@samsung.com>, InKi Dae <inki.dae@samsung.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Rob Clark <robdclark@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, Sean Paul <seanpaul@google.com>, Jingoo Han <jg1.han@samsung.com>, sunil joshi <joshi@samsung.com>, Prashanth G <prashanth.g@samsung.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>

--MnUiq6aniC6EIwTOE3RgcIoPN2HjohN4q
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 20/09/14 14:22, Ajay kumar wrote:

> Well, I am okay with using video ports to describe the relationship
> between the encoder, bridge and the panel.
> But, its just that I need to make use of 2 functions when phandle
> does it using just one function ;)
> -        panel_node =3D of_parse_phandle(dev->of_node, "panel", 0)
> +       endpoint =3D of_graph_get_next_endpoint(dev->of_node, NULL);
> +       if (!endpoint)
> +               return -EPROBE_DEFER;
> +
> +       panel_node =3D of_graph_get_remote_port_parent(endpoint);
> +       if (!panel_node)
> +               return -EPROBE_DEFER;
>=20
>=20
> If nobody else has objections over using of_graph functions instead
> of phandles, I can respin this patchset by making use of video ports.

The discussion did digress somewhat.

As a clarification, I'm in no way nack'ing this series because it
doesn't use the graphs for video connections. I don't see the simple
phandle bindings used here as broken as such.

 Tomi



--MnUiq6aniC6EIwTOE3RgcIoPN2HjohN4q
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJUM8DMAAoJEPo9qoy8lh71/ucP/jm0TSmLcuhRKi6rDUKxFQGe
oJ64yPEY586yToAqXsi/qZpEh5X5wwL47rvOq4Ttv8GBSONaAjQVIfHaxPghUP7X
7ahcSlRA/dryR4vKvp+RAq4Gtkyfynn73rTbNTBJAQNZMCCQIUr1BRyk9dk9Q4ek
6pKubhiGHda/KvUHyXyB+mhxHEkoZh5st5Nei+7ShRVtRtfsOVNN+g5409kzmRwj
2f3p6rQzLyYe2t1f2XingiShmniiyoPE7GHHoNb34aL+9X/OM/SKFOkAjgj6cpjM
VWkKYwB6/CZfjgaPM+Io/Z/2eNysf0Tpr4to1vaKf2qNd2ZlHsd6Wyf9S+Qc5etM
bzZM51IkliyV0Cutpd1hiU9zNbmKHewAd4TeOKF9iR/2TDLc6WWnYPK0kHeFyOl/
xEe/msJ2libLLMJZT+SQzZiUH/u/X5xRbrpcJhwCm7qo//79wLtsF6aulbl76pN3
X039oSHF1IRxIWBfMlVeWfntfG0JlNL4aQvewoutuFp1H8bM07z57Pv/m46QM0fj
Bj8Sj13sHuFx2FSbAA28DM+R7jMSR4eqwjOU5GvVK1FtO0CtCg2wzA4upHzI3VIH
l8Uxhl9BOc7ElIEKZydwNHV6nEs6XVLh9UBOIplZb5VDqZH4kgFKpFzFjUTJpe+x
rQXEIvCHbtcwxNylixo4
=KJrD
-----END PGP SIGNATURE-----

--MnUiq6aniC6EIwTOE3RgcIoPN2HjohN4q--
