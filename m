From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH V7 03/12] drm/bridge: Add helper functions for drm_bridge
Date: Wed, 29 Oct 2014 09:38:23 +0100
Message-ID: <20141029083821.GA27900@ulmo>
References: <1409149783-12416-1-git-send-email-ajaykumar.rs@samsung.com>
 <1409149783-12416-4-git-send-email-ajaykumar.rs@samsung.com>
 <20141027190137.GT26941@phenom.ffwll.local>
 <CAOw6vbLNOqp=X4epwDPb7zT-j2+oUuLoeV2S=x+oGPLQwK+Z7Q@mail.gmail.com>
 <CAKMK7uEch65=ZuaG=4JY2u3S3w5RND+uNc5+qL=tWxDLfEqEwQ@mail.gmail.com>
 <CAKMK7uEtNMOTg2j9XYN91_gRWWxHCfnb57HHpsdXki+T-rvwYg@mail.gmail.com>
 <20141028143548.GB17770@ulmo>
 <20141029074314.GL26941@phenom.ffwll.local>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0913390894=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20141029074314.GL26941@phenom.ffwll.local>
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


--===============0913390894==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Kj7319i9nmIyA2yE"
Content-Disposition: inline


--Kj7319i9nmIyA2yE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 29, 2014 at 08:43:14AM +0100, Daniel Vetter wrote:
> On Tue, Oct 28, 2014 at 03:35:50PM +0100, Thierry Reding wrote:
> > On Mon, Oct 27, 2014 at 11:26:30PM +0100, Daniel Vetter wrote:
> > > On Mon, Oct 27, 2014 at 11:20 PM, Daniel Vetter <daniel@ffwll.ch> wro=
te:
> > > > On Mon, Oct 27, 2014 at 8:58 PM, Sean Paul <seanpaul@chromium.org> =
wrote:
> > > >>>> @@ -660,8 +662,11 @@ struct drm_bridge_funcs {
> > > >>>>   * @driver_private: pointer to the bridge driver's internal con=
text
> > > >>>>   */
> > > >>>>  struct drm_bridge {
> > > >>>> -     struct drm_device *dev;
> > > >>>> +     struct device *dev;
> > > >>>
> > > >>> Please don't rename the ->dev pointer into drm. Because _all_ the=
 other
> > > >>> drm structures still call it ->dev. Also, can't we use struct dev=
ice_node
> > > >>> here like we do in the of helpers Russell added? See 7e435aad38083
> > > >>>
> > > >>
> > > >> I think this is modeled after the naming in drm_panel, FWIW. Howev=
er,
> > > >> seems reasonable to keep the device_node instead.
> > > >
> > > > Hm, indeed. Tbh I vote to rename drm_panel->drm to ->dev and like w=
ith
> > > > drm_crtc drop the struct device and go directly to a struct
> > > > device_node. Since we don't really need the sturct device, the only
> > > > thing we care about is the of_node. For added bonus wrap an #ifdef
> > > > CONFIG_OF around all the various struct device_node in drm_foo.h.
> > > > Should be all fairly simple to pull off with cocci.
> > > >
> > > > Thierry?
> > >=20
> > > Looking at the of_drm_find_panel function I actually wonder how that
> > > works - the drm_panel doesn't really need to stick around afaics.
> > > After all panel_list is global so some other driver can unload.
> > > Russell's of support for possible_crtcs code works differently since
> > > it only looks at per-drm_device lists.
> >=20
> > I don't understand. Panels are global resources that get registered by
> > some driver that isn't tied to the DRM device until attached. It can't
> > be in a per-DRM device list, because it's external to the device.
> >=20
> > And yes, they can go away when a driver is unloaded, though it's not the
> > typical use-case.
> >=20
> > > This bridge code here though suffers from the same. So to me this
> > > looks rather fishy.
> >=20
> > Well, this version of the DRM bridge support was written to be close to
> > DRM panel, so it isn't really surprising that it's similar =3D), but li=
ke
> > I said, I don't really understand what you think is wrong with it.
>=20
> You have a mutex to protect the global list of bridges/panels. But if you
> do a lookup you don't grab a reference count on the panel, so the moment
> you drop the list mutex the panel/bridge can go away.
>=20
> Yes usually you don't unload a driver on a soc but soc isn't everything
> and designing new stuff to not be hotunplug save isn't great either.

Yeah, I certainly agree that adding proper reference counting would be a
good thing. I think perhaps we could just take a reference on the struct
device * to prevent it from disappearing.

Although perhaps I misunderstand what you mean by "go away".

Thierry

--Kj7319i9nmIyA2yE
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJUUKd9AAoJEN0jrNd/PrOhc+wQAK58d5YnfiJ4PZMK2PfZa/+g
8LUoJuIsnuGCK6OsdEqGHn2/6bUUhVBsyzPchBUX96oOxHB7SqdfGvnBSqv2e30R
/Rc6OR3O2qeW1L/wkgP8XDaXrwXHTLh1XyIPxruEpitJD3NkyGkLb7zNQzKOT6FK
Ify1LhqGDdIFN3mB5ufLWZJPhwyabxMSCxsOEnH0zhBYdmOl2FCqrg1aY3Ul1QFX
WY2Wlz1UitxRRigf0RpBzVbX1dzxWsk4Y1wlGaQ/tGS8j+Vl56eS/44ncdn+Dzde
eKMsVzYRy8BAGrcpEVpFV3yGi04J3+t6i8gYNeZAwT1K+fSNxYQyyChzM5fkfYEb
CLjovE8O2A3hBkVL7RKixI6OoLlzqkNlVTdSwNj/6OKDBXRcBftf3IXnKZi0mJi8
TQM3ASvFpx5UqY3JS/F78h44Q0VRUmZcPwuxdK6+1Zb6t2w1w+V3hFKEhNDeg9BZ
0LrCZSfuxi7eVSdLeIvqPjvFKfi4zgyvD3yZ5Of6zNdGq/Pd93ufISz7Zz0ZAn78
meFKtl8/Pipq57JTrdvVtY3Ye6TN+sPhzgyKxn9rX6DLVnw95NmdJFtax5ATJheW
3oxDk5+AtiXnPKCjH2C957glhEoA+ODYAgkUa2M83o4jz9ygbKjo+6Fb5K+LCaVn
5HrIW3eL7yMETpywSh/C
=d0Px
-----END PGP SIGNATURE-----

--Kj7319i9nmIyA2yE--

--===============0913390894==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHA6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK

--===============0913390894==--
