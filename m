From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH V7 11/12] Documentation: bridge: Add documentation for
 ps8622 DT properties
Date: Wed, 24 Sep 2014 12:08:37 +0300
Message-ID: <54228A15.4090901@ti.com>
References: <1409150399-12534-1-git-send-email-ajaykumar.rs@samsung.com> <5419760A.7020908@ti.com> <20140922075424.GB1470@ulmo> <54202C86.3040808@ti.com> <20140923062111.GE30514@ulmo> <54213DAC.5010806@ti.com> <20140923095314.GS30514@ulmo> <542160DF.2040008@ti.com> <20140923145833.GI5982@ulmo>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="NbGcMAWJWkihmncc2QFXaKmI1wS2lSDIi"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from devils.ext.ti.com ([198.47.26.153]:50798 "EHLO
	devils.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752982AbaIXJIv (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 24 Sep 2014 05:08:51 -0400
In-Reply-To: <20140923145833.GI5982@ulmo>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Ajay Kumar <ajaykumar.rs@samsung.com>, dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, inki.dae@samsung.com, robdclark@gmail.com, daniel.vetter@ffwll.ch, seanpaul@google.com, ajaynumb@gmail.com, jg1.han@samsung.com, joshi@samsung.com, prashanth.g@samsung.com, Laurent Pinchart <laurent.pinchart@ideasonboard.com>

--NbGcMAWJWkihmncc2QFXaKmI1wS2lSDIi
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

On 23/09/14 17:58, Thierry Reding wrote:

>> But if a panel driver controls its video source, it makes sense for th=
e
>> panel driver to get its video source in its probe, and that happens
>> easiest if the panel has a link to the video source.
>=20
> That's an orthogonal problem. You speak about the link in software here=
,
> whereas the phandles only represent the link in the description of
> hardware. Now DT describes hardware from the perspective of the CPU, so=

> it's sort of like a cave that you're trying to explore. You start at th=
e
> top with the address bus, from where a couple of tunnels lead to the
> various peripherals on the address bus. A display controller might have=

> another tunnel to a panel, etc.

We don't do that for GPIOs, regulators, etc. either. And for video data
there are no address buses. Yes, for DSI and similar we have a control
bus, but that is modeled differently than the video data path.

Now, I'm fine with starting from the CPU, going outwards. I agree that
it's probably better to model it in the direction of the data stream,
even if that would make the SW a bit more complex.

However, I do think it's not as clear as you make it sound, especially
if we take cameras/sensors into account as Laurent explained elsewhere
in this thread.

> If you go the other way around, how do you detect how things connect?
> Where do you get the information about the panel so you can trace back
> to the origin?

When the panel driver probes, it registers itself as a panel and gets
its video source. Similarly a bridge in between gets its video source,
which often would be the SoC, i.e. the origin.

 Tomi



--NbGcMAWJWkihmncc2QFXaKmI1wS2lSDIi
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJUIooVAAoJEPo9qoy8lh71Zl0P/2siTDSQiaqPObwTDpVR2bn+
+wvaFqk/LtFJxeDxptVvGBJLI7KPlMhe/XqH7mpJr4oBGML16o750m7SJPsh+d6V
5uvdxCS5fEA+JgZQwAfuz1PI1tOsLEgGnWtVZeup8K45Sis8JP7ioXOGnR2hobV9
jbyl9GYWS7DwnvFPEHwsGnuayDXgKHIQHkBbGSMvxOGjxpq9ZbKUBKbqyow/epi7
46C8vOHqnjm7QiijMHtDXYsC1EoW4zekm63ljVRJxp4wn4PXuOKOrGFHe6zaDICs
4eFiwr5Q6KuZa9FdHWwjnwHHVSiJShyzAkb6Z9hysJDeVAxp4UOMreg2NZbW9YFc
skDzvN0eQLPHkzyX+dcxqtntbExYY2JG7sot/6wGxCSS7wlJ2X0PnoO0OeVGeafT
BD01plzEDasQQeTYATWQXd2tGHHdemaXnhrBoPhAJY4a59lKER62zyJkYN4s7oe7
Dpa8g9LzEyt3PDBAZFLhJNlcCIUupGhrsHeYSwsD3mpHQ/Gu+Kqz16g/hPGVfxvL
v593x9TS/9XrGNAvKirX/cVoNwrbP0rySjmoqSrbGlGMtWn060AHSrv71u/pMpDC
z28rO2PyJUFD05LCbyJzgWgARXEao0wH5F30ejFtae6Ue7ZgiuaVKgBhcKh/vpn/
g/Br1ifyBLswH5n1dNQr
=EUl1
-----END PGP SIGNATURE-----

--NbGcMAWJWkihmncc2QFXaKmI1wS2lSDIi--
