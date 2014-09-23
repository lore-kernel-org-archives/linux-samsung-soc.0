From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH V7 11/12] Documentation: bridge: Add documentation for
 ps8622 DT properties
Date: Tue, 23 Sep 2014 11:53:15 +0200
Message-ID: <20140923095314.GS30514@ulmo>
References: <1409150399-12534-1-git-send-email-ajaykumar.rs@samsung.com>
 <5419760A.7020908@ti.com> <20140922075424.GB1470@ulmo>
 <54202C86.3040808@ti.com> <20140923062111.GE30514@ulmo>
 <54213DAC.5010806@ti.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1945492364=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <54213DAC.5010806@ti.com>
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


--===============1945492364==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="/KohU7xR/z4Rz7fl"
Content-Disposition: inline


--/KohU7xR/z4Rz7fl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 23, 2014 at 12:30:20PM +0300, Tomi Valkeinen wrote:
> On 23/09/14 09:21, Thierry Reding wrote:
>=20
> >> Well, I can write almost any kind of bindings, and then evidently my
> >> device would work. For me, on my board.
> >=20
> > Well, that's the whole problem with DT. For many devices we only have a
> > single setup to test against. And even when we have several they often
> > are derived from each other. But the alternative would be to defer
> > (possibly indefinitely) merging support for a device until a second,
> > wildly different setup shows up. That's completely unreasonable and we
> > need to start somewhere.
>=20
> Yes, but in this case we know of existing boards that have complex
> setups. It's not theoretical.

Complex setups involving /this particular/ bridge and binding are
theoretical at this point, however.

> > phandles should simply point to the next element in the pipeline and the
> > OS abstractions should be good enough to handle the details about how to
> > chain the elements.
>=20
> I, on the other hand, would rather see the links the other way around.
> Panel having a link to the video source, etc.

Why? It seems much more natural to describe this using the natural flow
of data. The device furthest away from the CPU should be the target of
the phandle. That way the DT can be used to trace the flow of data down
the pipeline.

> The video graphs have two-way links, which of course is the safest
> options, but also more verbose and redundant.

Right. If we take that line of thinking to the extreme we end up listing
individual registers in DT so that we can safely assume that we can
control all possible aspects of the device.

Like I said, this seems to be the latest response to DT ABI stability
requirement. Add as much data to a DT node as possible so that it has
higher chances of being complete. The result is often overly complex DT
content that doesn't add any real value.

> When this was discussed earlier, it was unclear which way the links
> should be. It's true that only links to one direction are strictly
> needed, but the question raised was that if in the drivers we end up
> always going the links the other way, the performance penalty may be
> somewhat big. (If I recall right).

I doubt that graphs will become so complex that walking it would become
a performance bottleneck. In fact if we're constantly walking the graph
we're already doing something wrong. It should only be necessary when
the pipeline configuration changes, which should hopefully not be very
often (i.e. not several times per second).

Thierry

--/KohU7xR/z4Rz7fl
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJUIUMKAAoJEN0jrNd/PrOhwKoQAIXC7ydtMyumPcGZi40wge3K
tnRjRqpM1tU8H3fsxa6xq65+j+VBFnxp2JIFt8lHNloCdefCJvsXg6pGaKulull5
UqrhbP2rsAfiIxRS7Z1Qz+fwKL9mYAs2pqVZf9bsYeIDwSNrh9R+xMz8q5hk5rnV
Uevh9cCzIgbu/HaMKO3KQGz8AKlaGfXdG861zmC5kez49d236N52FMZNPN13oVMw
hFUAB5qPFVwkNTbhxq7lzaZ9c2ZDTSjYKWNZKWTKjXO/2L7m/nYNlrpNC4uDWcJy
Y/mnOYsI6UwjPr/dyh7RwrSgzfirLyIcrBYllDPqc1yXL3qhKRfKhrGgMg19qLza
hcbAcnpSCthU8c7eVmti9y9VdRByixcTCw10lqugFLPrDi4kXo2OTnaARXqVulG0
EdwbKlX6VJzwoHEAfg5eBfJbOQ4hbrCs8W2CODtQRRY4BbbNGLlLwS6Ky6EqbAIk
5IFmk2hUbfUwmsICqCZvAMSJ44tceLU7a68WUOkyvLLlOYBQIFQ8OHxfoDLQz2GQ
k8uGGDfwC1me8CbWD+IoDuwuA0TA+SBcPI5qRfrnvJCOmfk/VjCoA1WSR4f4nITE
07FxtEA84bR9emNs1kNxFopM6iKnZ2gO8C8F0y1NwN6rq2R6fN67aPi5lzPWOm1L
vPFDjCJzfUJS1TuhjLy5
=u709
-----END PGP SIGNATURE-----

--/KohU7xR/z4Rz7fl--

--===============1945492364==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
http://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1945492364==--
