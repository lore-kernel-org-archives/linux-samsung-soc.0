From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH V7 11/12] Documentation: bridge: Add documentation for
 ps8622 DT properties
Date: Thu, 25 Sep 2014 08:23:25 +0200
Message-ID: <20140925062324.GB12423@ulmo>
References: <1409150399-12534-1-git-send-email-ajaykumar.rs@samsung.com>
 <5419760A.7020908@ti.com> <20140922075424.GB1470@ulmo>
 <54202C86.3040808@ti.com> <20140923062111.GE30514@ulmo>
 <54213DAC.5010806@ti.com> <20140923095314.GS30514@ulmo>
 <542160DF.2040008@ti.com> <20140923145833.GI5982@ulmo>
 <54228A15.4090901@ti.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2085334853=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <54228A15.4090901@ti.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, seanpaul@google.com, daniel.vetter@ffwll.ch, joshi@samsung.com, dri-devel@lists.freedesktop.org, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, ajaynumb@gmail.com, prashanth.g@samsung.com, Ajay Kumar <ajaykumar.rs@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org


--===============2085334853==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="aVD9QWMuhilNxW9f"
Content-Disposition: inline


--aVD9QWMuhilNxW9f
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 24, 2014 at 12:08:37PM +0300, Tomi Valkeinen wrote:
> On 23/09/14 17:58, Thierry Reding wrote:
>=20
> >> But if a panel driver controls its video source, it makes sense for the
> >> panel driver to get its video source in its probe, and that happens
> >> easiest if the panel has a link to the video source.
> >=20
> > That's an orthogonal problem. You speak about the link in software here,
> > whereas the phandles only represent the link in the description of
> > hardware. Now DT describes hardware from the perspective of the CPU, so
> > it's sort of like a cave that you're trying to explore. You start at the
> > top with the address bus, from where a couple of tunnels lead to the
> > various peripherals on the address bus. A display controller might have
> > another tunnel to a panel, etc.
>=20
> We don't do that for GPIOs, regulators, etc. either. And for video data
> there are no address buses. Yes, for DSI and similar we have a control
> bus, but that is modeled differently than the video data path.

GPIOs and regulators are just auxiliary devices that some other device
needs to operate. For instance if you want to know how to operate the
GPIO or regulator, the same still applies. You start from the CPU and
look up the GPIO controller and then the index of the GPIO within that
controller. For regulators you'd typically go and look for an I2C bus
that has a PMIC, which will expose the regulator.

Now for a device such as a display panel, what you want to do is control
the display panel. If part of how you control it involves toggling a
GPIO or a regulator, then you get access to those via phandles. And then
controlling the GPIO and regulator becomes the same as above. So it's a
matter of compositing devices in that case.

For the video data you use the phandles to model the path that video
data takes, with all the devices in that path chained together. So while
both approaches use the same mechanism (phandle) to describe the
relationships, the nature of the relationships is quite different.

> Now, I'm fine with starting from the CPU, going outwards. I agree that
> it's probably better to model it in the direction of the data stream,
> even if that would make the SW a bit more complex.
>=20
> However, I do think it's not as clear as you make it sound, especially
> if we take cameras/sensors into account as Laurent explained elsewhere
> in this thread.

How are cameras different? The CPU wants to capture video data from the
camera, so it needs to go look for a video capture device, which in turn
needs to involve a sensor.

It isn't so much about following the data stream itself, but rather the
connections between devices that the CPU needs to involve in order to
initiate the data flow.

> > If you go the other way around, how do you detect how things connect?
> > Where do you get the information about the panel so you can trace back
> > to the origin?
>=20
> When the panel driver probes, it registers itself as a panel and gets
> its video source. Similarly a bridge in between gets its video source,
> which often would be the SoC, i.e. the origin.

That sounds backwards to me. The device tree serves the purpose of
supplementing missing information that can't be probed if hardware is
too stupid. I guess that's one of the primary reasons for structuring it
the way we do, from the CPU point of view, because it allows the CPU to
probe via the device tree.

Probing is always done downstream, so you'd start by looking at some
type of bus interface and query it for what devices are present on the
bus. Take for example PCI: the CPU only needs to know how to access the
host bridge and will then probe devices behind each of the ports on that
bridge. Some of those devices will be bridges, too, so it will continue
to probe down the hierarchy.

Without DT you don't have a means to know that there was a panel before
you've actually gone and probed your whole hierarchy and found a GPU
with some sort of output that a panel can be connected to. I think it
makes a lot of sense to describe things in the same way in DT.

Thierry

--aVD9QWMuhilNxW9f
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJUI7TcAAoJEN0jrNd/PrOhK2kQAL4K3WZYfy0lt9CO/KFalTAo
LWQQ76R8gknAe1vJuge2JYOH2SsZc+r1ou9+NhYSwCz9Lhokoe3rwsTTVQ+L0KoL
GQOKDxBWChic9ka6OfLfrxgxHFJhcfE9xopSiwH2qNxWvkeZU4hyxGoNAAxN05N5
nhu15Zl2YlC8ZmtexUgbsvKKlrTPwulsesFscSeefL6rcEkXr7ZHg0kmZOYPhJQs
kMR+D7ajykV/RYtixsK8Sp1j+jquAn+2w6aEth8ue4RltjSJU3z8lexnKGN7KCli
QPXdOUBQjRzmX1p8ukMoXnVz5fmHm6XWnx7aGeqFb1Pa6CEPS7ePlt6oMDL73/14
OtnR0utFsfSaxd515o7YE/Q1vjGj6WU8I8DoZRyMwVapj2RuxJazUe8MU+z7Z0VH
we5OSAF1UbdwIWhnXvVzCSwhasfTH4o5r4OizrQuCfX4HLwt1pLuZzlr3GU/96bY
7FxpGmPa1DEL5+qu+ur/nuMcTMoUrNPq7IbobC8FiBHq2xMaE1WwGQ5YYKN9sM4h
5raJviKy8bmO1xwY0l93b4qHbKJmYR68TfkOkDLpLTaFAe8Vgnh4RJYIj9woupKh
HlpPZQEuidtFH0KXB+6cNQpe38cPrF90bXwh1ASVmeN3SPD5HNYp1Gm9OEBUU3uI
ku97YWyCxrTU3xggudI1
=RLco
-----END PGP SIGNATURE-----

--aVD9QWMuhilNxW9f--

--===============2085334853==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
http://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============2085334853==--
