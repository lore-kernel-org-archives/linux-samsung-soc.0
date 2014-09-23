From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH V7 11/12] Documentation: bridge: Add documentation for
 ps8622 DT properties
Date: Tue, 23 Sep 2014 16:50:52 +0200
Message-ID: <20140923145051.GH5982@ulmo>
References: <1409150399-12534-1-git-send-email-ajaykumar.rs@samsung.com>
 <54213DAC.5010806@ti.com> <20140923095314.GS30514@ulmo>
 <8067599.NmrXQIO5A1@avalon>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1112437413=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <8067599.NmrXQIO5A1@avalon>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, seanpaul@google.com, daniel.vetter@ffwll.ch, joshi@samsung.com, dri-devel@lists.freedesktop.org, Tomi Valkeinen <tomi.valkeinen@ti.com>, ajaynumb@gmail.com, prashanth.g@samsung.com, Ajay Kumar <ajaykumar.rs@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org


--===============1112437413==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="bpVaumkpfGNUagdU"
Content-Disposition: inline


--bpVaumkpfGNUagdU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 23, 2014 at 02:12:52PM +0300, Laurent Pinchart wrote:
> On Tuesday 23 September 2014 11:53:15 Thierry Reding wrote:
> > On Tue, Sep 23, 2014 at 12:30:20PM +0300, Tomi Valkeinen wrote:
> > > On 23/09/14 09:21, Thierry Reding wrote:
> > > >> Well, I can write almost any kind of bindings, and then evidently =
my
> > > >> device would work. For me, on my board.
> > > >=20
> > > > Well, that's the whole problem with DT. For many devices we only ha=
ve a
> > > > single setup to test against. And even when we have several they of=
ten
> > > > are derived from each other. But the alternative would be to defer
> > > > (possibly indefinitely) merging support for a device until a second,
> > > > wildly different setup shows up. That's completely unreasonable and=
 we
> > > > need to start somewhere.
> > >=20
> > > Yes, but in this case we know of existing boards that have complex
> > > setups. It's not theoretical.
> >=20
> > Complex setups involving /this particular/ bridge and binding are
> > theoretical at this point, however.
> >=20
> > > > phandles should simply point to the next element in the pipeline an=
d the
> > > > OS abstractions should be good enough to handle the details about h=
ow to
> > > > chain the elements.
> > >=20
> > > I, on the other hand, would rather see the links the other way around.
> > > Panel having a link to the video source, etc.
> >=20
> > Why? It seems much more natural to describe this using the natural flow
> > of data. The device furthest away from the CPU should be the target of
> > the phandle. That way the DT can be used to trace the flow of data down
> > the pipeline.
> >=20
> > > The video graphs have two-way links, which of course is the safest
> > > options, but also more verbose and redundant.
> >=20
> > Right. If we take that line of thinking to the extreme we end up listing
> > individual registers in DT so that we can safely assume that we can
> > control all possible aspects of the device.
>=20
> And the other extreme would be to have a single DT node for the logical v=
ideo=20
> device with all information pertaining to it stored in C code. Extremes a=
re=20
> never good, we need to find a reasonable middle-ground here. I believe OF=
=20
> graph fulfills that requirement, it might be slightly more verbose than a=
=20
> single phandle, but it's also much more versatile.=20

Oh well, yet another one of these things where we'll never reach an
agreement I guess.

Thierry

--bpVaumkpfGNUagdU
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJUIYjLAAoJEN0jrNd/PrOhy7kP/3my4pSifsbGN241kJSCDMHa
+0e2yJ2iY2VKK4AAlkiJtDNXgZXf9eV1MbCRDhkDCSRbMo7+jk1iEqA6KjSD025I
9yBJ3y1gsG1qRyxG3T0pAxn5VLxxbI8tJzQvhFHjKPbg5tf3uEk2+lUdcC3Unvd6
hHPqUo8aCDWv7WRlJlBuT6TQBUCRebmt/rupKpdwr3YWqSf2gxw/PhB98ARPsVYn
c/ZIWP/O/cSjJg24XCLGXGR7Xgah+mJa1fF9IvkquYuiH8+ov7bz9Rhc0sbiHL12
hGvmdle/v3eqHCn8FN3OI7zsqZICwAqRormM4Sh6QomaSmdhf+juylnY3/PodcmV
FJnVK0VoqQ5+yf1ySqjsrF5m3oMz4nxjAwm64yUXstud41O5AmKe83f9su7OlZgv
onlaZdhLFO55Hfgejxnh8nGu5O+tYeI5yAEvOiTQV79l8MRaWY1o76vuScLLKVGL
8G+nGxYuHv5IgeNCMxzUp9Rym2EzNd5h8/ij7ZKYJ+BUQxYE72nDej5OsyIYmwP0
tgt/AElHTzVZ66wchHeiM6A35s9nLMkWhj1El5O1xocKdX7WrWAtLbwvKp1iJFuc
SZg0d3uvhf3VhqHeKDfAgVavQo41rZouRYz+C46YfdZXPvS/deOiIWswBwGXijzp
oSdfnC+yTz/eDEI3fu4P
=t+Bk
-----END PGP SIGNATURE-----

--bpVaumkpfGNUagdU--

--===============1112437413==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
http://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1112437413==--
