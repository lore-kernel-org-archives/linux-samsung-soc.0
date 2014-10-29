From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH V7 03/12] drm/bridge: Add helper functions for drm_bridge
Date: Wed, 29 Oct 2014 10:14:37 +0100
Message-ID: <20141029091436.GB27900@ulmo>
References: <1409149783-12416-1-git-send-email-ajaykumar.rs@samsung.com>
 <1409149783-12416-4-git-send-email-ajaykumar.rs@samsung.com>
 <20141027190137.GT26941@phenom.ffwll.local>
 <CAOw6vbLNOqp=X4epwDPb7zT-j2+oUuLoeV2S=x+oGPLQwK+Z7Q@mail.gmail.com>
 <CAKMK7uEch65=ZuaG=4JY2u3S3w5RND+uNc5+qL=tWxDLfEqEwQ@mail.gmail.com>
 <CAKMK7uEtNMOTg2j9XYN91_gRWWxHCfnb57HHpsdXki+T-rvwYg@mail.gmail.com>
 <20141028143548.GB17770@ulmo>
 <20141029074314.GL26941@phenom.ffwll.local>
 <20141029083821.GA27900@ulmo>
 <20141029085702.GP26941@phenom.ffwll.local>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0714887908=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20141029085702.GP26941@phenom.ffwll.local>
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


--===============0714887908==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ADZbWkCsHQ7r3kzd"
Content-Disposition: inline


--ADZbWkCsHQ7r3kzd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 29, 2014 at 09:57:02AM +0100, Daniel Vetter wrote:
> On Wed, Oct 29, 2014 at 09:38:23AM +0100, Thierry Reding wrote:
> > On Wed, Oct 29, 2014 at 08:43:14AM +0100, Daniel Vetter wrote:
> > > On Tue, Oct 28, 2014 at 03:35:50PM +0100, Thierry Reding wrote:
> > > > On Mon, Oct 27, 2014 at 11:26:30PM +0100, Daniel Vetter wrote:
> > > > > On Mon, Oct 27, 2014 at 11:20 PM, Daniel Vetter <daniel@ffwll.ch>=
 wrote:
> > > > > > On Mon, Oct 27, 2014 at 8:58 PM, Sean Paul <seanpaul@chromium.o=
rg> wrote:
> > > > > >>>> @@ -660,8 +662,11 @@ struct drm_bridge_funcs {
> > > > > >>>>   * @driver_private: pointer to the bridge driver's internal=
 context
> > > > > >>>>   */
> > > > > >>>>  struct drm_bridge {
> > > > > >>>> -     struct drm_device *dev;
> > > > > >>>> +     struct device *dev;
> > > > > >>>
> > > > > >>> Please don't rename the ->dev pointer into drm. Because _all_=
 the other
> > > > > >>> drm structures still call it ->dev. Also, can't we use struct=
 device_node
> > > > > >>> here like we do in the of helpers Russell added? See 7e435aad=
38083
> > > > > >>>
> > > > > >>
> > > > > >> I think this is modeled after the naming in drm_panel, FWIW. H=
owever,
> > > > > >> seems reasonable to keep the device_node instead.
> > > > > >
> > > > > > Hm, indeed. Tbh I vote to rename drm_panel->drm to ->dev and li=
ke with
> > > > > > drm_crtc drop the struct device and go directly to a struct
> > > > > > device_node. Since we don't really need the sturct device, the =
only
> > > > > > thing we care about is the of_node. For added bonus wrap an #if=
def
> > > > > > CONFIG_OF around all the various struct device_node in drm_foo.=
h.
> > > > > > Should be all fairly simple to pull off with cocci.
> > > > > >
> > > > > > Thierry?
> > > > >=20
> > > > > Looking at the of_drm_find_panel function I actually wonder how t=
hat
> > > > > works - the drm_panel doesn't really need to stick around afaics.
> > > > > After all panel_list is global so some other driver can unload.
> > > > > Russell's of support for possible_crtcs code works differently si=
nce
> > > > > it only looks at per-drm_device lists.
> > > >=20
> > > > I don't understand. Panels are global resources that get registered=
 by
> > > > some driver that isn't tied to the DRM device until attached. It ca=
n't
> > > > be in a per-DRM device list, because it's external to the device.
> > > >=20
> > > > And yes, they can go away when a driver is unloaded, though it's no=
t the
> > > > typical use-case.
> > > >=20
> > > > > This bridge code here though suffers from the same. So to me this
> > > > > looks rather fishy.
> > > >=20
> > > > Well, this version of the DRM bridge support was written to be clos=
e to
> > > > DRM panel, so it isn't really surprising that it's similar =3D), bu=
t like
> > > > I said, I don't really understand what you think is wrong with it.
> > >=20
> > > You have a mutex to protect the global list of bridges/panels. But if=
 you
> > > do a lookup you don't grab a reference count on the panel, so the mom=
ent
> > > you drop the list mutex the panel/bridge can go away.
> > >=20
> > > Yes usually you don't unload a driver on a soc but soc isn't everythi=
ng
> > > and designing new stuff to not be hotunplug save isn't great either.
> >=20
> > Yeah, I certainly agree that adding proper reference counting would be a
> > good thing. I think perhaps we could just take a reference on the struct
> > device * to prevent it from disappearing.
> >=20
> > Although perhaps I misunderstand what you mean by "go away".
>=20
> I meant the drm_panel/bridge could go away any second, since nothing
> prevents a module unload of the panel/bridge driver. So in theory you
> could get the unregister call right after you've done the lookup. Which
> means the bridge/panel pointer you've just returned is freed memory.

Ah yes, I see now.

> I think we nee try_get_module for the code and kref on the actual data
> structures.

Agreed, that should do the trick. We'd probably need some sort of logic
to also make operations return something like -ENODEV when the
underlying device has disappeared. I think David had introduced
something similar for DRM device not so long ago?

> That makes the entire thing a bit non-trivial, which is why I think it
> would be better as some generic helper. Which then gets embedded or
> instantiated for specific cases, like dt&drm_panel or dt&drm_bridge.
> Or maybe even acpi&drm_bridge, who knows ;-)

I worry a little about type safety. How will this generic helper know
what registry to look in for? Or conversely, if all these resources are
added to a single registry how do you know that they're of the correct
type? Failing to ensure this could cause situations where you're asking
for a panel and get a bridge in return because you've wrongly wired it
up in device tree for example.

But perhaps if both the registry and the device parts are turned into
helpers we could still have a single core implementation and then
instantiate that for each type, something roughly like this:

	struct registry {
		struct list_head list;
		struct mutex lock;
	};

	struct registry_record {
		struct list_head list;
		struct module *owner;
		struct kref *ref;

		struct device *dev;
	};

	int registry_add(struct registry *registry, struct registry_record *record)
	{
		...
		try_module_get(record->owner);
		...
	}

	struct registry_record *registry_find_by_of_node(struct registry *registry,
							 struct device_node *np)
	{
		...
		kref_get(...);
		...
	}

That way it should be possible to embed these into other structures,
like so:

	struct drm_panel {
		struct registry_record record;
		...
	};

	static struct registry drm_panels;

	int drm_panel_add(struct drm_panel *panel)
	{
		return registry_add(&drm_panels, &panel->record);
	}

	struct drm_panel *of_drm_panel_find(struct device_node *np)
	{
		struct registry_record *record;

		record =3D registry_find_by_of_node(&drm_panels, np);

		return container_of(record, struct drm_panel, record);
	}

Is that what you had in mind?

Thierry

--ADZbWkCsHQ7r3kzd
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJUUK/8AAoJEN0jrNd/PrOhATgP/0ivRos0dC6A/ZlCZAbeb/m9
c12TOWM84f1OW83zERAoomOS1btwZEWtMl7wZQKAzyUtRzkQrJyfB66l0Alk6D+D
lgdpQQKiu5U1unGLQF1NmAGyMLvip+WK+BzBMFfpoeVPyxIaFK+16py8hfO3Co09
gxgjrVqo8eT+0nSPnD2Y6kFI3Fcoc0Z3BS6nVpKtQqZFXd5IoU7t5esuMA1FbR3D
nWzLJ6dI/Ehp6cy+OyJHTHYadXNfrvLF4rN/BdYdaayImbT4Tgwn48DWtGzZOHK3
bVMSD2E1HToGnr5rpnbCxK0VsCfNKJyrktVO/Rghdk+kjhESvhAK55kGmgXgo4le
5iA5PdwhvDwDVpIAP7waKarc3U0KmFn1KV5i8fSHCK+qtT1yvW/ihL2dBp+19qZ3
wd95mKsstLGeWQMfdvdLFLlDfNMrZHokBDrp+lg8upt/1WABODdzTrGgtPwcjPGr
4U+VEIgjFZ4ybSu53Iu4fSLs4FTSRWOdVjCmstNq/RsKV0a7rsKwwe+O7rZQQESO
a+JEfOOA5hWOCSwDSMr30Q9oKRNeVkZked8CZTIhM5oeE0cHE9zVm8wAXs207gT3
Qin4gUGEaDpjBx9LJPnEjLNIhqlhVDjQdkWsVdSE4Khud89S2u3JhjcJnJjyVf17
as3bdMOd+u9R/TYFxie8
=PFXt
-----END PGP SIGNATURE-----

--ADZbWkCsHQ7r3kzd--

--===============0714887908==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHA6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK

--===============0714887908==--
