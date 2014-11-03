From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH V7 03/12] drm/bridge: Add helper functions for drm_bridge
Date: Mon, 3 Nov 2014 09:01:58 +0100
Message-ID: <20141103080155.GA21002@ulmo.nvidia.com>
References: <20141027190137.GT26941@phenom.ffwll.local>
 <CAOw6vbLNOqp=X4epwDPb7zT-j2+oUuLoeV2S=x+oGPLQwK+Z7Q@mail.gmail.com>
 <CAKMK7uEch65=ZuaG=4JY2u3S3w5RND+uNc5+qL=tWxDLfEqEwQ@mail.gmail.com>
 <CAKMK7uEtNMOTg2j9XYN91_gRWWxHCfnb57HHpsdXki+T-rvwYg@mail.gmail.com>
 <20141028143548.GB17770@ulmo>
 <20141029074314.GL26941@phenom.ffwll.local>
 <20141029083821.GA27900@ulmo>
 <20141029085702.GP26941@phenom.ffwll.local>
 <20141029091436.GB27900@ulmo>
 <20141031155143.GQ26941@phenom.ffwll.local>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0228572314=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20141031155143.GQ26941@phenom.ffwll.local>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Daniel Vetter <daniel@ffwll.ch>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Russell King - ARM Linux <linux@arm.linux.org.uk>, Jingoo Han <jg1.han@samsung.com>, sunil joshi <joshi@samsung.com>, dri-devel <dri-devel@lists.freedesktop.org>, Ajay kumar <ajaynumb@gmail.com>, Thierry Reding <treding@nvidia.com>, Prashanth G <prashanth.g@samsung.com>, Ajay Kumar <ajaykumar.rs@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org


--===============0228572314==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="LZvS9be/3tNcYl/X"
Content-Disposition: inline


--LZvS9be/3tNcYl/X
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 31, 2014 at 04:51:43PM +0100, Daniel Vetter wrote:
> On Wed, Oct 29, 2014 at 10:14:37AM +0100, Thierry Reding wrote:
> > On Wed, Oct 29, 2014 at 09:57:02AM +0100, Daniel Vetter wrote:
> > > That makes the entire thing a bit non-trivial, which is why I think it
> > > would be better as some generic helper. Which then gets embedded or
> > > instantiated for specific cases, like dt&drm_panel or dt&drm_bridge.
> > > Or maybe even acpi&drm_bridge, who knows ;-)
> >=20
> > I worry a little about type safety. How will this generic helper know
> > what registry to look in for? Or conversely, if all these resources are
> > added to a single registry how do you know that they're of the correct
> > type? Failing to ensure this could cause situations where you're asking
> > for a panel and get a bridge in return because you've wrongly wired it
> > up in device tree for example.
> >=20
> > But perhaps if both the registry and the device parts are turned into
> > helpers we could still have a single core implementation and then
> > instantiate that for each type, something roughly like this:
> >=20
> > 	struct registry {
> > 		struct list_head list;
> > 		struct mutex lock;
> > 	};
> >=20
> > 	struct registry_record {
> > 		struct list_head list;
> > 		struct module *owner;
> > 		struct kref *ref;
> >=20
> > 		struct device *dev;
> > 	};
> >=20
> > 	int registry_add(struct registry *registry, struct registry_record *re=
cord)
> > 	{
> > 		...
> > 		try_module_get(record->owner);
> > 		...
> > 	}
> >=20
> > 	struct registry_record *registry_find_by_of_node(struct registry *regi=
stry,
> > 							 struct device_node *np)
> > 	{
> > 		...
> > 		kref_get(...);
> > 		...
> > 	}
> >=20
> > That way it should be possible to embed these into other structures,
> > like so:
> >=20
> > 	struct drm_panel {
> > 		struct registry_record record;
> > 		...
> > 	};
> >=20
> > 	static struct registry drm_panels;
> >=20
> > 	int drm_panel_add(struct drm_panel *panel)
> > 	{
> > 		return registry_add(&drm_panels, &panel->record);
> > 	}
> >=20
> > 	struct drm_panel *of_drm_panel_find(struct device_node *np)
> > 	{
> > 		struct registry_record *record;
> >=20
> > 		record =3D registry_find_by_of_node(&drm_panels, np);
> >=20
> > 		return container_of(record, struct drm_panel, record);
> > 	}
> >=20
> > Is that what you had in mind?
>=20
> Yeah I've thought that we should instantiate using macros even, so that we
> have per-type registries. So you'd smash the usual set of
> DECLARE/DEFINE_AUX_DEV_REGISTRY into headers/source files, and they'd take
> a (name, key, value) tripled. For the example here(of_drm_panel, struct
> device_node *, struct drm_panel *) or similar. I might be hand-waving over
> a few too many details though ;-)

Okay, I'll take a stab at this and see if I can convert DRM panel to it.

Thierry

--LZvS9be/3tNcYl/X
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJUVzZzAAoJEN0jrNd/PrOhRlAP/iKbFfyHCFUaH7e/ijj9mDST
qsdgaqUHvA1pzvYwyohLobay+Y0utikbqE7gOsUH7PcNliR2Fct3OH4hsWDzMxfa
/U5OAbTbOJhtNL+kMgxq2BqeceknfmwEeuHI6XJlwNcRxYRZkJaAEu0g7EARNGeK
fj7kO60hboiVvuwlpYNbbLZjvTFX2w6MCtNvk1NNbN1UXSnuRIKbehW+zjn5Hh5E
iXlJ4CuWmlz2yGxc8eksXAHtXtF9aNrWDe0+HqVCusuqCiVGuLAFkFmroqfnuXLd
+YBQAbzLARs9tsFPODmSwAFf7i4UswXIo90SG7TUFzKpPOp62bfx/uVyd/vroarg
jCU0HxlYYiCzICPW6S1zlCOrVlX2wbuZExKI9+gInsXT+U7CDSLrLMTY4YDpedGL
Rz5fSU3oajIeSLcM0Bg0ubFQh2gMEzmaKyToi/9ELN9ZYSnPNCIr5b6t4YJ5ezzh
gS/N05t1viZg1Gln4yep13y5Cj5CRJH73wP+PHHifD1cA2TY037O1sAND9YA3B2f
FbFZcYiV3UeRnx79VI0V2uNZQ9tPIMWOTk0Tw9bkp8atEO+LZLIJlW7XFqSm19IE
q9bosGHgiJR6UwRW89EBCLrC+z0sxcUn4GGn9UzZI2fQqce58Ctq93diH/o8xo7r
Ar9OAZdZjfSQe6QdarLT
=5SiX
-----END PGP SIGNATURE-----

--LZvS9be/3tNcYl/X--

--===============0228572314==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHA6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK

--===============0228572314==--
