From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH V7 11/12] Documentation: bridge: Add documentation for
 ps8622 DT properties
Date: Mon, 6 Oct 2014 14:34:00 +0300
Message-ID: <54327E28.5050400@ti.com>
References: <1409150399-12534-1-git-send-email-ajaykumar.rs@samsung.com> <5419760A.7020908@ti.com> <20140922075424.GB1470@ulmo> <54202C86.3040808@ti.com> <20140923062111.GE30514@ulmo> <54213DAC.5010806@ti.com> <20140923095314.GS30514@ulmo> <542160DF.2040008@ti.com> <20140923145833.GI5982@ulmo> <54228A15.4090901@ti.com> <20140925062324.GB12423@ulmo>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="Vsgu5gVcuVod1RC0aMWa8bJx52IvdqrpU"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from arroyo.ext.ti.com ([192.94.94.40]:56022 "EHLO arroyo.ext.ti.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751488AbaJFLeR (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 6 Oct 2014 07:34:17 -0400
In-Reply-To: <20140925062324.GB12423@ulmo>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Ajay Kumar <ajaykumar.rs@samsung.com>, dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, inki.dae@samsung.com, robdclark@gmail.com, daniel.vetter@ffwll.ch, seanpaul@google.com, ajaynumb@gmail.com, jg1.han@samsung.com, joshi@samsung.com, prashanth.g@samsung.com, Laurent Pinchart <laurent.pinchart@ideasonboard.com>

--Vsgu5gVcuVod1RC0aMWa8bJx52IvdqrpU
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

On 25/09/14 09:23, Thierry Reding wrote:

> How are cameras different? The CPU wants to capture video data from the=

> camera, so it needs to go look for a video capture device, which in tur=
n
> needs to involve a sensor.

Let's say we have an XXX-to-YYY encoder. We use that encoder to convert
the SoC's XXX output to YYY, which is then shown on a panel. So, in this
case, the encoder's DT node will have a "panel" or "output" phandle,
pointing to the panel.

We then use the exact same encoder in a setup in which we have a camera
which outputs XXX, which the encoder then converts to YYY, which is then
captured by the SoC. Here the "output" phandle would point to the SoC.

>>> If you go the other way around, how do you detect how things connect?=

>>> Where do you get the information about the panel so you can trace bac=
k
>>> to the origin?
>>
>> When the panel driver probes, it registers itself as a panel and gets
>> its video source. Similarly a bridge in between gets its video source,=

>> which often would be the SoC, i.e. the origin.
>=20
> That sounds backwards to me. The device tree serves the purpose of
> supplementing missing information that can't be probed if hardware is
> too stupid. I guess that's one of the primary reasons for structuring i=
t
> the way we do, from the CPU point of view, because it allows the CPU to=

> probe via the device tree.
>=20
> Probing is always done downstream, so you'd start by looking at some
> type of bus interface and query it for what devices are present on the
> bus. Take for example PCI: the CPU only needs to know how to access the=

> host bridge and will then probe devices behind each of the ports on tha=
t
> bridge. Some of those devices will be bridges, too, so it will continue=

> to probe down the hierarchy.
>=20
> Without DT you don't have a means to know that there was a panel before=

> you've actually gone and probed your whole hierarchy and found a GPU
> with some sort of output that a panel can be connected to. I think it
> makes a lot of sense to describe things in the same way in DT.

Maybe I don't quite follow, but it sounds to be you are mixing control
and data. For control, all you say is true. The CPU probes the devices
on control busses, either with the aid of HW or the aid of DT, going
downstream.

But the data paths are a different matter. The CPU/SoC may not even be
involved in the whole data path. You could have a sensor on the board
directly connected to a panel. Both are controlled by the CPU, but the
data path goes from the sensor to the panel (or vice versa). There's no
way the data paths can be "CPU centric" in that case.

Also, a difference with the data paths compared to control paths is that
they are not strictly needed for operation. An encoder can generate an
output without enabling its input (test pattern or maybe blank screen,
or maybe a screen with company logo). Or an encoder with two inputs
might only get the second input when the user requests a very high res
mode. So it is possible that the data paths are lazily initialized.

You do know that there is a panel right after the device is probed
according to its control bus. It doesn't mean that the data paths are
there yet. In some cases the user space needs to reconfigure the data
paths before a panel has an input and can be used to show an image from
the SoC's display subsystem.

The point here being that the data path bindings don't really relate to
the probing part. You can probe no matter which way the data path
bindings go, and no matter if there actually exists (yet) a probed
device on the other end of a data path phandle.

While I think having video data connections in DT either way, downstream
or upstream, would work, it has felt most natural for me to have the
phandles from video sinks to video sources.

The reason for that is that I think the video sink has to be in control
of its source. It's the sink that tells the source to start or stop or
reconfigure. So I have had need to get the video source from a video
sink, but I have never had the need to get the video sinks from video
sources.

 Tomi



--Vsgu5gVcuVod1RC0aMWa8bJx52IvdqrpU
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJUMn4oAAoJEPo9qoy8lh71fcYP+wef8+dXw68BgGGaYgEj2xXX
9WqqBX6ReXkWFDYs91EC4ikyetMaYPterMbaZLvaU1yVMMOXZ+W/BcZj0vaORwJT
LuIJw8hH0shTB3fOn9ivcX8NoczRhsnD0X7HlEGMfQQEn8X082nbGOGQ8ewjyTze
GjJIbYOxLoTC78O+0ksxa/vjXYhCjHasjPWjyi+eXj0iIaIPBUlZgWxgNUZRZTM3
GMS97gD7wffm3rCcJb4Jsa0fLEjiQB3k65Qg9+SFQzcm+h6obWgKm1/Xf6ekoG4C
CT05ST7ab3dG4v+Pvr2TeUG+3MWyk2msVbbGI8HRfMDmrvaZWI2vFWD6mHNWT3cH
mlMGrdadorDQCbg4p3CaTUdK4Zt7QrWZ17HS1UZnKbGXpcuDOXF5o8wR3AO7e9zX
XOUx8ihvXIeIfmeoLjFna2NaCtQYgpLF+cYXb8yzNIZ1u1wP5OW2+h3BhYdKAa7T
TKaVTWNG2ceavy/UlO718xTNrlKSiamdoxaiqAjko8Db+zgJwcMTAKBfuv7u2Qtv
2Noi8L46WzKmHGDSyvqMYSzXq5nyrqNG+ADthX4P0s74ji1OzfMuaptXypUy+bpQ
KLbUsck5N7gfUpdHBms5ALZQWtqjhl6ik4R6NVjVT1crK7SzbOuUynRCN2BJaLXN
ylElYSpCzZ6Uol1DYhd4
=fWqN
-----END PGP SIGNATURE-----

--Vsgu5gVcuVod1RC0aMWa8bJx52IvdqrpU--
