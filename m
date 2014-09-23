From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH V7 11/12] Documentation: bridge: Add documentation for
 ps8622 DT properties
Date: Tue, 23 Sep 2014 16:45:10 +0200
Message-ID: <20140923144509.GF5982@ulmo>
References: <1409150399-12534-1-git-send-email-ajaykumar.rs@samsung.com>
 <5419760A.7020908@ti.com>
 <CAEC9eQPn63upE6XEZZtJWGdOAhWWNvU9EhfOXJ=x0i467q+iMQ@mail.gmail.com>
 <5419B52D.4060107@ti.com> <20140922080629.GC1470@ulmo>
 <542030DD.3060906@ti.com> <20140923060452.GD30514@ulmo>
 <54213543.7000306@ti.com> <20140923093916.GR30514@ulmo>
 <54215A17.8050606@ti.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1063126265=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <54215A17.8050606@ti.com>
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Sean Paul <seanpaul@google.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, sunil joshi <joshi@samsung.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Ajay kumar <ajaynumb@gmail.com>, Prashanth G <prashanth.g@samsung.com>, Ajay Kumar <ajaykumar.rs@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org


--===============1063126265==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Zi0sgQQBxRFxMTsj"
Content-Disposition: inline


--Zi0sgQQBxRFxMTsj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 23, 2014 at 02:31:35PM +0300, Tomi Valkeinen wrote:
> On 23/09/14 12:39, Thierry Reding wrote:
>=20
> > My point is that if you use plain phandles you usually have the
> > meta-data already. Referring to the above example, bridge0 knows that it
> > should look for a bridge with phandle &bridge1, whereas bridge1 knows
> > that the device it is connected to is a panel.
>=20
> The bridge should not care what kind of device is there on the other
> end. The bridge just has an output, going to another video component.

You'll need to know at some point that one of the devices in a panel,
otherwise you can't treat it like a panel.

> >> Well, I can't say about this particular bridge, but afaik you can
> >> connect a parallel RGB signal to multiple panels just like that, witho=
ut
> >> any muxing.
> >=20
> > Right, but in that case you're not reconfiguring the signal in any way
> > for each of the panels. You send one single signal to all of them. For
>=20
> Yes, that's one use case, cloning. But I was not talking about that.
>=20
> > all intents and purposes there is only one panel. Well, I guess you
> > could have separate backlights for the panels. In that case though it
> > seems better to represent it at least as a virtual mux or bridge, or
> > perhaps a "mux panel".
>=20
> I was talking about the case where you have two totally different
> devices, let's say panels, connected to the same output. One could take
> a 16-bit parallel RGB signal, the other 24-bit. Only one of them can  be
> enabled at a time (from HW perspective both can be enabled at the same
> time, but then the other one shows garbage).

So we're essentially back to a mux, albeit maybe a virtual one.

Thierry

--Zi0sgQQBxRFxMTsj
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJUIYd1AAoJEN0jrNd/PrOh2BQP/R/JcsK7BJ/7kgVMxmguOsI3
3OzzR2hROlFxLx9n45Fp1SegKrZhSZn1DPJwG1cQGirRqDVhUIAADA1TwGyWw9fT
A2VV82JdEzSnBbMVFoeaWZ+k+2ROc9wVGf/QoTbtq3Qe5J4LFU11iqNwOy95aBeY
S7T842B1ljRQxQzOiUdeaCO9HMVT3Z8V1XpNlEepigMB9iezaMMbvDYEFRYiSZd1
KImRFc/Ydoah3B6GjqARHmfDWWBCDXzPfxP3MrB2Y/0TYOrZSDGTziReqfry/2ZW
IkgAWuZEvzYPeJ0vq7RQ1zCJHPOrBSxe0/9GUmKyCKkPwq/3LMdoGXe7IDN4W35a
RkYzSh++w1Xok99L7y4C+TYECgHcMXqb7WPIAXLAjE+Ff+F1GcpFAXmnC20+iBaa
+brQWIeKqKhTyA3IzS78KC9vk7uv3zVWB8a1N0WO68p3zudJcDuNR25hAVBMoJig
mXm+UTw2Nt4yTk5dZEpAX8xN1hpfzO6Bswl9OWq9W3ZduXXKQdrZ+S7v/qr2+aoQ
OwTNAd8C9n07sIpryVGVUjQCvRMBs0ULwdhrv9pmxmkkReNG3rz5YcUVj9tUuvc7
MwuFh4WtLbLDBWR5h94CL9lJtqdYDAScd1I5joNDftneEKQ3q6pjpGWRlwXW5X/N
WVRDaXXbB0LpVASfb2Pk
=WXti
-----END PGP SIGNATURE-----

--Zi0sgQQBxRFxMTsj--

--===============1063126265==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
http://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1063126265==--
