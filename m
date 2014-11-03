From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH V7 03/12] drm/bridge: Add helper functions for drm_bridge
Date: Mon, 3 Nov 2014 09:06:04 +0100
Message-ID: <20141103080602.GB21002@ulmo.nvidia.com>
References: <1409149783-12416-1-git-send-email-ajaykumar.rs@samsung.com>
 <1409149783-12416-4-git-send-email-ajaykumar.rs@samsung.com>
 <20141027190137.GT26941@phenom.ffwll.local>
 <CAOw6vbLNOqp=X4epwDPb7zT-j2+oUuLoeV2S=x+oGPLQwK+Z7Q@mail.gmail.com>
 <CAKMK7uEch65=ZuaG=4JY2u3S3w5RND+uNc5+qL=tWxDLfEqEwQ@mail.gmail.com>
 <20141028142946.GA17770@ulmo>
 <20141029075127.GM26941@phenom.ffwll.local>
 <20141029091648.GC27900@ulmo>
 <20141031155940.GS26941@phenom.ffwll.local>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="gatW/ieO32f1wygP"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f176.google.com ([209.85.192.176]:46588 "EHLO
	mail-pd0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750805AbaKCIGK (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 3 Nov 2014 03:06:10 -0500
Received: by mail-pd0-f176.google.com with SMTP id ft15so11063880pdb.21
        for <linux-samsung-soc@vger.kernel.org>; Mon, 03 Nov 2014 00:06:09 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <20141031155940.GS26941@phenom.ffwll.local>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Daniel Vetter <daniel@ffwll.ch>
Cc: Sean Paul <seanpaul@chromium.org>, Thierry Reding <treding@nvidia.com>, Ajay Kumar <ajaykumar.rs@samsung.com>, dri-devel <dri-devel@lists.freedesktop.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, InKi Dae <inki.dae@samsung.com>, Rob Clark <robdclark@gmail.com>, Ajay kumar <ajaynumb@gmail.com>, Jingoo Han <jg1.han@samsung.com>, sunil joshi <joshi@samsung.com>, Prashanth G <prashanth.g@samsung.com>


--gatW/ieO32f1wygP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 31, 2014 at 04:59:40PM +0100, Daniel Vetter wrote:
> On Wed, Oct 29, 2014 at 10:16:49AM +0100, Thierry Reding wrote:
> > On Wed, Oct 29, 2014 at 08:51:27AM +0100, Daniel Vetter wrote:
> > > On Tue, Oct 28, 2014 at 03:29:47PM +0100, Thierry Reding wrote:
> > > > On Mon, Oct 27, 2014 at 11:20:31PM +0100, Daniel Vetter wrote:
> > > > > On Mon, Oct 27, 2014 at 8:58 PM, Sean Paul <seanpaul@chromium.org=
> wrote:
> > > > > >>> @@ -660,8 +662,11 @@ struct drm_bridge_funcs {
> > > > > >>>   * @driver_private: pointer to the bridge driver's internal =
context
> > > > > >>>   */
> > > > > >>>  struct drm_bridge {
> > > > > >>> -     struct drm_device *dev;
> > > > > >>> +     struct device *dev;
> > > > > >>
> > > > > >> Please don't rename the ->dev pointer into drm. Because _all_ =
the other
> > > > > >> drm structures still call it ->dev. Also, can't we use struct =
device_node
> > > > > >> here like we do in the of helpers Russell added? See 7e435aad3=
8083
> > > > > >>
> > > > > >
> > > > > > I think this is modeled after the naming in drm_panel, FWIW. Ho=
wever,
> > > > > > seems reasonable to keep the device_node instead.
> > > > >=20
> > > > > Hm, indeed. Tbh I vote to rename drm_panel->drm to ->dev and like=
 with
> > > > > drm_crtc drop the struct device and go directly to a struct
> > > > > device_node. Since we don't really need the sturct device, the on=
ly
> > > > > thing we care about is the of_node. For added bonus wrap an #ifdef
> > > > > CONFIG_OF around all the various struct device_node in drm_foo.h.
> > > > > Should be all fairly simple to pull off with cocci.
> > > > >=20
> > > > > Thierry?
> > > >=20
> > > > The struct device * is in DRM panel because there's nothing device =
tree
> > > > specific about the concept. Having a struct device_node * instead w=
ould
> > > > indicate that it can only be used with a device tree, whereas the
> > > > framework doesn't care the tiniest bit what type of device we have.
> > > >=20
> > > > While the trend clearly is to use more device tree, I don't think we
> > > > should make it impossible for anybody else to use these frameworks.
> > > >=20
> > > > There are other advantages to keeping a struct device *, like having
> > > > access to the proper device and its name. Also you get access to the
> > > > device_node * via dev->of_node anyway. I don't see any advantage in
> > > > switching to just a struct device_node *, only disadvantages.
> > >=20
> > > Well the idea is to make the lookup key specific, and conditional on
> > > #CONFIG_OF. If there's going to be another neat way to enumerate plat=
form
> > > devices then I think we should add that, too. Or maybe we should have=
 a
> > > void *platform_data or so.
> > >=20
> > > The reason I really don't want a struct device * in core drm structur=
es is
> > > that two releases down the road people will have found tons of really
> > > great ways to abuse them and re-create a midlayer. DRM core really sh=
ould
> > > only care about the sw objects and not be hw specific at all. Heck th=
ere's
> > > not even an requirement to have any piece of actual hw, you could wri=
te a
> > > completely fake drm driver (for e.g. testing like the new v4l driver).
> > >=20
> > > Tbh I wonder a bit why we even have this registery embedded into the =
core
> > > drm objects. Essentially the only thing you're doing is a list that m=
aps
> > > some platform specific key onto some subsystem specific driver struct=
ure
> > > or fails the lookup. So instead of putting all these low-level details
> > > into drm core structures can't we just have a generic hashtable/list =
for
> > > this, plus some static inline helpers that cast the void * you get in=
to
> > > the one you want?
> > >=20
> > > I also get the feeling that this really should be in the driver core =
(like
> > > the component helpers), and that we should think a lot harder about
> > > lifetimes and refcounting (see my other reply on that).
> >=20
> > Yes, that sounds very useful indeed. Also see my reply to yours. =3D)
>=20
> Just replying here with some of the irc discussions we've had. Since
> drm_bridge/panel isn't a core drm interface object exposed to userspace
> it's less critical. I still think that wasting a few brain cycles to have
> a clear separation between the abstract interface object and how to bind
> and unbind the pieces together is worthwhile, even though the cost when
> getting it wrong is much less severe than in the case of a mandatory piece
> of core infrastructure.
>=20
> I think in general the recent armsoc motivated drm infrastructure lacks a
> bit in attention to these details. E.g. the cma helpers are built into the
> drm.ko module, but clearly are auxilliary library code. So they should be
> pulled out and the headers clean up, so that we have a clear separation
> between core and helpers. Otherwise someone will sooner or later screw up
> and insert a helper depency into the core, and then we've started with the
> midlayer mess. Same goes with drm_bridge/panel, which didn't even bother
> to have separate headers from the core modeset header drm_crtc.h.

DRM panel does have a separate header. It's still built into the core
DRM module, but using a separate drm-$(CONFIG_DRM_PANEL) +=3D drm_panel.o
entry in the makefile. At the time it didn't seem worth to add a
completely separate module given the size of the code and the overhead
associated with having a separate module.

Do you still want me to split it off into a separate module to clarify
that it isn't part of the core?

> So would be great if someone could invest a bit of time into cleaning this
> up. Writing proper api docs also helps a lot with achieving a clean and
> sensible split ;-)

There's a bit of API documentation for panels, but I'll see if I can
find some time to enhance it.

Thierry

--gatW/ieO32f1wygP
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJUVzdqAAoJEN0jrNd/PrOhRtsQAJCSki3lBYz0qWAzaSbt8/HT
Ej508JErBpYiFlZ0hAg+IflboCimW6ork6OjP/gN58RckhoaM6KBok5mQuVaD6EI
mwW/EqaFAjl/iNR+tFVgDMrae/uK7+46pwgCKJ1Xx4Hv4DBp7lWBfZf6xkGMU0ge
jisdlyNl5oMpeGjUhGoeXvJidLLMar4/J+QCSimsEPTiKh+0wTslv2DnjkWidLsM
hlr7VM7Cjs38oOE/DR/hnKc9GQOwhjXjv51X2vu9ifQ9VHDtMivIO6UpG3DY0PlW
noDA/q/C8jX1JBsO4brvkgUNoLfGlnLa/DLOCQ1gZjS5p1H17EGp2KwVV/HEj8cU
P1hmDiXvylwuZNm+UgxNeBpVl9Nm0CVq5rpSRRulI0Rg1dGgAdwtYN5NDlC6rX69
/OVGJUe3xdpRGu3SPzBE56ammtsTX/aGPxy4dvffywBa1rDyKVT+OlNNLtQKOfue
8vbOhkINdxTyAljtU3OKqTC0AsFHwFKDEsD3O0kmTNbBvegnEQV4lByoYyXc6D3x
UoDMOf5pSZ0b+VtICFeGM6Y78jqElO3y3QW6IIC40xq8s6XxkeRRMedO8wgB3X7I
61gmYs4MjgoUE8FB4jNLDw7gxsYXqFsaznXhZtP9Ck0q1s+rV44NZlea1UOx1YmY
D1ggc64M9ln1vm0DvQz3
=M9xI
-----END PGP SIGNATURE-----

--gatW/ieO32f1wygP--
