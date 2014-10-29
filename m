From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH V7 03/12] drm/bridge: Add helper functions for drm_bridge
Date: Wed, 29 Oct 2014 10:16:49 +0100
Message-ID: <20141029091648.GC27900@ulmo>
References: <1409149783-12416-1-git-send-email-ajaykumar.rs@samsung.com>
 <1409149783-12416-4-git-send-email-ajaykumar.rs@samsung.com>
 <20141027190137.GT26941@phenom.ffwll.local>
 <CAOw6vbLNOqp=X4epwDPb7zT-j2+oUuLoeV2S=x+oGPLQwK+Z7Q@mail.gmail.com>
 <CAKMK7uEch65=ZuaG=4JY2u3S3w5RND+uNc5+qL=tWxDLfEqEwQ@mail.gmail.com>
 <20141028142946.GA17770@ulmo>
 <20141029075127.GM26941@phenom.ffwll.local>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1327862629=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20141029075127.GM26941@phenom.ffwll.local>
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
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Jingoo Han <jg1.han@samsung.com>, sunil joshi <joshi@samsung.com>, dri-devel <dri-devel@lists.freedesktop.org>, Ajay kumar <ajaynumb@gmail.com>, Thierry Reding <treding@nvidia.com>, Prashanth G <prashanth.g@samsung.com>, Ajay Kumar <ajaykumar.rs@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org


--===============1327862629==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="YD3LsXFS42OYHhNZ"
Content-Disposition: inline


--YD3LsXFS42OYHhNZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 29, 2014 at 08:51:27AM +0100, Daniel Vetter wrote:
> On Tue, Oct 28, 2014 at 03:29:47PM +0100, Thierry Reding wrote:
> > On Mon, Oct 27, 2014 at 11:20:31PM +0100, Daniel Vetter wrote:
> > > On Mon, Oct 27, 2014 at 8:58 PM, Sean Paul <seanpaul@chromium.org> wr=
ote:
> > > >>> @@ -660,8 +662,11 @@ struct drm_bridge_funcs {
> > > >>>   * @driver_private: pointer to the bridge driver's internal cont=
ext
> > > >>>   */
> > > >>>  struct drm_bridge {
> > > >>> -     struct drm_device *dev;
> > > >>> +     struct device *dev;
> > > >>
> > > >> Please don't rename the ->dev pointer into drm. Because _all_ the =
other
> > > >> drm structures still call it ->dev. Also, can't we use struct devi=
ce_node
> > > >> here like we do in the of helpers Russell added? See 7e435aad38083
> > > >>
> > > >
> > > > I think this is modeled after the naming in drm_panel, FWIW. Howeve=
r,
> > > > seems reasonable to keep the device_node instead.
> > >=20
> > > Hm, indeed. Tbh I vote to rename drm_panel->drm to ->dev and like with
> > > drm_crtc drop the struct device and go directly to a struct
> > > device_node. Since we don't really need the sturct device, the only
> > > thing we care about is the of_node. For added bonus wrap an #ifdef
> > > CONFIG_OF around all the various struct device_node in drm_foo.h.
> > > Should be all fairly simple to pull off with cocci.
> > >=20
> > > Thierry?
> >=20
> > The struct device * is in DRM panel because there's nothing device tree
> > specific about the concept. Having a struct device_node * instead would
> > indicate that it can only be used with a device tree, whereas the
> > framework doesn't care the tiniest bit what type of device we have.
> >=20
> > While the trend clearly is to use more device tree, I don't think we
> > should make it impossible for anybody else to use these frameworks.
> >=20
> > There are other advantages to keeping a struct device *, like having
> > access to the proper device and its name. Also you get access to the
> > device_node * via dev->of_node anyway. I don't see any advantage in
> > switching to just a struct device_node *, only disadvantages.
>=20
> Well the idea is to make the lookup key specific, and conditional on
> #CONFIG_OF. If there's going to be another neat way to enumerate platform
> devices then I think we should add that, too. Or maybe we should have a
> void *platform_data or so.
>=20
> The reason I really don't want a struct device * in core drm structures is
> that two releases down the road people will have found tons of really
> great ways to abuse them and re-create a midlayer. DRM core really should
> only care about the sw objects and not be hw specific at all. Heck there's
> not even an requirement to have any piece of actual hw, you could write a
> completely fake drm driver (for e.g. testing like the new v4l driver).
>=20
> Tbh I wonder a bit why we even have this registery embedded into the core
> drm objects. Essentially the only thing you're doing is a list that maps
> some platform specific key onto some subsystem specific driver structure
> or fails the lookup. So instead of putting all these low-level details
> into drm core structures can't we just have a generic hashtable/list for
> this, plus some static inline helpers that cast the void * you get into
> the one you want?
>=20
> I also get the feeling that this really should be in the driver core (like
> the component helpers), and that we should think a lot harder about
> lifetimes and refcounting (see my other reply on that).

Yes, that sounds very useful indeed. Also see my reply to yours. =3D)

Thierry

--YD3LsXFS42OYHhNZ
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJUULCAAAoJEN0jrNd/PrOhpZAP/0t/IMJc9bNF8VwBL10Q2DFG
4rtCT1wGNE09lz4gwVsR0y32nlY1DQr/1wDVsPtC+KBxU18qv5bmekmApT6K0/1y
l/etU0EgJ3QOCyaBQpLRQL3h+CsFPf4jdqeyxDMazuCwddgZn8Y7NRpfmGyc+kRm
HoKX3X8DZnSP4HMwtK/VLPEvFuat2HijU3Nwm7Nu79c6x/cs3AWDQofSvFhaISlT
BvlH8oK8RNMcB+8aUVw63FRvXvENTifG9Tg2acG0OzO22TWVYJ5zjoKx0cvQ8vl7
5UPENtBsBePzvzY6ohCc6w+JfeuS1Xal/lsnk/BmydJYA1XKh8GU+PenJYx2BCQp
FosEF/aJWRkt1e6Tfo0PThGENkXr1m4k1kerDLMB06TKCQ/6VsdnWiLbqCaI2tae
ONA1Wl287uXBPrHwnzhERIg710DfPHr4DbhjSOzdOU/AtT8eMfVreWjWt7BvBkcT
+l8bAS2iqnHX1YJ1TB0SCj6xa/Yg+aFJyj/g6r8ZF/u+CCguAHoho5ElcgfDdup4
YINWlTR6tIpIu+hMsaGOe3jeZ3F/i4w0olLBCuQXA1iWYl5nG8HpZF4279TjEkpv
EUkgCmyHZ3jmqoJMxyOiyRI98x677Th1OsB4g/yr+SfXSK0p/4t5PkKnbvFkMTRI
mgpF5am7NUOrN+u32DSk
=3gTf
-----END PGP SIGNATURE-----

--YD3LsXFS42OYHhNZ--

--===============1327862629==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHA6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK

--===============1327862629==--
