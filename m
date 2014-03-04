From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [RFC PATCH v2 19/21] ARM: dts: exynos5250-arndale: add dsi and
 panel nodes
Date: Tue, 4 Mar 2014 14:40:17 +0200
Message-ID: <5315C9B1.5030401@ti.com>
References: <1392204688-4591-1-git-send-email-a.hajda@samsung.com> <1392204688-4591-20-git-send-email-a.hajda@samsung.com> <53108FA0.4040903@ti.com> <53109193.3000604@ti.com> <5315C07B.3090705@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="G28D5tb5matwX7cCe7aVxeN40J6k9WwAt"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from devils.ext.ti.com ([198.47.26.153]:37088 "EHLO
	devils.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756976AbaCDMkh (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 4 Mar 2014 07:40:37 -0500
In-Reply-To: <5315C07B.3090705@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Andrzej Hajda <a.hajda@samsung.com>, dri-devel@lists.freedesktop.org
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kyungmin Park <kyungmin.park@samsung.com>, Rob Herring <robh+dt@kernel.org>, Kumar Gala <galak@codeaurora.org>, Grant Likely <grant.likely@linaro.org>, Sean Paul <seanpaul@chromium.org>, Marek Szyprowski <m.szyprowski@samsung.com>

--G28D5tb5matwX7cCe7aVxeN40J6k9WwAt
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On 04/03/14 14:00, Andrzej Hajda wrote:

> I have made video path binding optional, in case of video bus
> if the specific video path is not present driver uses the bus it is
> connected to.
> In case DSI panel is controlled via different bus the path should be
> specified
> explicitly.
>=20
> I have no strong feelings against making this binding required but as
> you have
> stated above "in this case it's obvious" and for me quite redundant.

Yes, it's a good point. I didn't realize they were optional, I thought
they were not defined at all. I hadn't even thought that they could be
optional, I guess because in my uses there's always a reason to have
them. Even for a simple DSI command mode panel, I have information in
the DSI master's endpoint:

dsi {
	...

	dsi1_out_ep: endpoint {
		remote-endpoint =3D <&lcd0_in>;
		lanes =3D <0 1 2 3 4 5>;
	};
};

which forces to use an endpoint in the panel also.

And, actually, I think in your case also you would need an endpoint for
the dsi master, if you wanted to support multiple endpoints. You
currently have, for example, PLL clock freq as the DSI master's
property, but it should really be a property of the DSI master's endpoint=
=2E

I.e. if you have two DSI panels connected to the same DSI master, in a
way that only one can be enabled at a time (there would probably be a
mux to select where the DSI lanes go, we have that on some development
boards), you could well need different clock frequencies for the panels.

> What is the gain in specifying explicitly video paths in such cases?

- Until we (everyone interested in this) have thought about it fully and
agreed that video paths in cases like this are optional, you would be
safer to specify them explicitly. That way your bindings are valid in
either case.

- Uniformity. If in most cases we need to specify the video paths,
either because the control path is different than the data path, or
because there is need for endpoint specific information, having video
paths as optional for some specific cases may needlessly complicate the
code.

 Tomi



--G28D5tb5matwX7cCe7aVxeN40J6k9WwAt
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.14 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQIcBAEBAgAGBQJTFcmxAAoJEPo9qoy8lh71yhoP/RCWKmi6QTB4F9xFMRkjwqOH
uKfszgIm6SCLHREFguS1n/ddIGmwUpj5VIe7nbNPjKhy1aYeXis6FGZzStdzG/TJ
FwQZK8UnfoKX1wmqRcWPUs6OWfNtXyHMRHNgJFteT3LUvU/UUBfGwIBmu4/k1oNs
dl7oAXZriANHl7ZJp0mbn55nxIom1UkFEwxd+F9e7PbW9LimJv1IT6Hr9DWVHFjs
S06Zruy8RXNtkcDlu22w6XpfY60djh/7tgFNEHwYrFMEg4Lmab5KTTPTh94mtTwc
gml1h+FRo5eKUGunxW+esX0Zenfl0UmbVDohSm7n5bGaqNJPJpEM1juZUGnc68KW
RT6ReM73XAf/3ImMgPpio1Dpz2CELqkzH+9yiYz+gxSlMbahlQsGdgOctqaTpFcb
prw+eGnUEOaaEzRg72pke2oFuZc/GH2ioDclgAX31ufrValdLVwteZDk+0Hd8HIc
7Zz6vI3ah1tc5VTkz9OhiUcpNQOd7bmRhO3BzZHhYlGh6MDpEa7Am3pn9S13an12
6g4riDEtKWTembXh4vIDVRCn6M8B7OEoaLoaoKiUt6CDoFPp/zeKU6aOKfINeTuC
NgUqhIf9xiCOX+waue4uEC9wZvPVQWMHEkDwUCk3rHM6R9yiSKD6vtlMbVr5fgpN
y8KLFkTgrbsEz+9qlSr+
=Lcl7
-----END PGP SIGNATURE-----

--G28D5tb5matwX7cCe7aVxeN40J6k9WwAt--
