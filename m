From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH V7 11/12] Documentation: bridge: Add documentation for
 ps8622 DT properties
Date: Tue, 23 Sep 2014 16:58:34 +0200
Message-ID: <20140923145833.GI5982@ulmo>
References: <1409150399-12534-1-git-send-email-ajaykumar.rs@samsung.com>
 <5419760A.7020908@ti.com> <20140922075424.GB1470@ulmo>
 <54202C86.3040808@ti.com> <20140923062111.GE30514@ulmo>
 <54213DAC.5010806@ti.com> <20140923095314.GS30514@ulmo>
 <542160DF.2040008@ti.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1217406036=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <542160DF.2040008@ti.com>
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


--===============1217406036==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="GBuTPvBEOL0MYPgd"
Content-Disposition: inline


--GBuTPvBEOL0MYPgd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 23, 2014 at 03:00:31PM +0300, Tomi Valkeinen wrote:
> On 23/09/14 12:53, Thierry Reding wrote:
>=20
> >> Yes, but in this case we know of existing boards that have complex
> >> setups. It's not theoretical.
> >=20
> > Complex setups involving /this particular/ bridge and binding are
> > theoretical at this point, however.
>=20
> Right, but this discussion, at least from my part, has not so much been
> about this particular bridge, but bridges in general.
>=20
> So I don't have any requirements for this bridge driver/bindings to
> support complex use cases at the time being.
>=20
> But I do want us to have an option to use the bridge in the future in
> such complex case. And yes, we can't guarantee that we'd hit the
> bindings right whatever we do, but we should think about it and at least
> try.
>=20
> >>> phandles should simply point to the next element in the pipeline and =
the
> >>> OS abstractions should be good enough to handle the details about how=
 to
> >>> chain the elements.
> >>
> >> I, on the other hand, would rather see the links the other way around.
> >> Panel having a link to the video source, etc.
> >=20
> > Why? It seems much more natural to describe this using the natural flow
> > of data. The device furthest away from the CPU should be the target of
> > the phandle. That way the DT can be used to trace the flow of data down
> > the pipeline.
>=20
> Because I see video components "using" their video sources. A panel uses
> an encoder to produce video data for the panel. An encoder uses its
> video source to produce video data. A bit like a device uses a gpio, or
> a pwm.
>=20
> Especially with more complex encoders/panels having the panel/encoder in
> control of its video source is often the easiest (only?) way to manage
> the job. This has worked well on OMAP, whereas the earlier model where
> the video source controlled the video sink was full of problems. Not
> that that exactly proves anything, but that's my experience, and I
> didn't find any easy solutions when the video source was in control.
>=20
> So while the video data flows from SoC to the panel, the control goes
> the other way. Whether the DT links should model the video data or
> control, I don't know. Both feel natural to me.
>=20
> But if a panel driver controls its video source, it makes sense for the
> panel driver to get its video source in its probe, and that happens
> easiest if the panel has a link to the video source.

That's an orthogonal problem. You speak about the link in software here,
whereas the phandles only represent the link in the description of
hardware. Now DT describes hardware from the perspective of the CPU, so
it's sort of like a cave that you're trying to explore. You start at the
top with the address bus, from where a couple of tunnels lead to the
various peripherals on the address bus. A display controller might have
another tunnel to a panel, etc.

If you go the other way around, how do you detect how things connect?
Where do you get the information about the panel so you can trace back
to the origin?

Thierry

--GBuTPvBEOL0MYPgd
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJUIYqZAAoJEN0jrNd/PrOhSb8P/0K0y3azLeHKMiuWOnoQ8iWr
nziobwpUwwZe9//aHxfj9ymI0ZVdcT9pSCTcS53DYxHGksOua95SGrdSssja7U2c
a/E6I7fsjuQRSVAJNcyQx+uqzM/D6iUIZ3BJ5Dg7gSAFOlzIvNQUuUC0wOQDklVp
VVqmV4Kdi3m+6uF+TWbsn0g57qknFYqEcgqNkj7pZGxM1YSpqczy9Y01JODs2NKy
fMbxq7o0u47ocsalvsxB0w62kuJZKEKmER9kBQM3J1HL/Mn516uUARggPWen00HS
KCgRnjPlYruplTTuW3Z0seREDb4IlMLyLYi+bimB2+OvoBZNCjuVY2Olrzy14ngV
ambB2O4zGIjhYphVeo0RtCnWVz9RzvoRG4ZEwNCoImwF61ePG0N5rHEjL708Ho3Q
bfB+J7mBgMgK2RP78fSEzw11AM1THKCIEwx9+Y/eg0iv0L6XPfxeS5cQMVbBSYM8
4E0rCnLdHxWsWcMJrOspNtaEo1pwk+krZH0RALYm+bHvGeI8OQX0TZf7Et89wbm/
s3zoDgCwIL0EA1bbsUvnCPw54wzTZjKm+AP4oi6OLBmCq0bfuZn/5JOG4A4mnfSO
brVYkMIumwSv5vniZ5WUFNocwhW8wOqF096jLW+Mmb9Evh62zwMjTBuAYnXXsJoj
4Br/TVpcEjFu/7NEvgNk
=yJpC
-----END PGP SIGNATURE-----

--GBuTPvBEOL0MYPgd--

--===============1217406036==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
http://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1217406036==--
