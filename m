From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH v3 1/3] drm: add generic zpos property
Date: Fri, 15 Jan 2016 13:32:41 +0200
Message-ID: <20160115113241.GB23290@intel.com>
References: <1452605960-21194-1-git-send-email-m.szyprowski@samsung.com>
 <1452605960-21194-2-git-send-email-m.szyprowski@samsung.com>
 <20160114104623.GR23290@intel.com>
 <5698B73A.3000300@samsung.com>
 <20160115101225.GG19130@phenom.ffwll.local>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mga09.intel.com ([134.134.136.24]:54440 "EHLO mga09.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751095AbcAOLcr (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 15 Jan 2016 06:32:47 -0500
Content-Disposition: inline
In-Reply-To: <20160115101225.GG19130@phenom.ffwll.local>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Daniel Vetter <daniel@ffwll.ch>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, Inki Dae <inki.dae@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, Gustavo Padovan <gustavo@padovan.org>, Benjamin Gaignard <benjamin.gaignard@linaro.org>, vincent.abriou@st.com, fabien.dessenne@st.com

On Fri, Jan 15, 2016 at 11:12:25AM +0100, Daniel Vetter wrote:
> On Fri, Jan 15, 2016 at 10:09:14AM +0100, Marek Szyprowski wrote:
> > Hello,
> >=20
> > On 2016-01-14 11:46, Ville Syrj=C3=A4l=C3=A4 wrote:
> > >On Tue, Jan 12, 2016 at 02:39:18PM +0100, Marek Szyprowski wrote:
> > >>This patch adds support for generic plane's zpos property propert=
y with
> > >>well-defined semantics:
> > >>- added zpos properties to drm core and plane state structures
> > >>- added helpers for normalizing zpos properties of given set of p=
lanes
> > >>- well defined semantics: planes are sorted by zpos values and th=
en plane
> > >>   id value if zpos equals
> > >>
> > >>Normalized zpos values are calculated automatically when generic
> > >>muttable zpos property has been initialized. Drivers can simply u=
se
> > >>plane_state->normalized_zpos in their atomic_check and/or plane_u=
pdate
> > >>callbacks without any additional calls to DRM core.
> > >>
> > >>Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> > >>---
> > >>  Documentation/DocBook/gpu.tmpl      |  14 ++++-
> > >>  drivers/gpu/drm/drm_atomic.c        |   4 ++
> > >>  drivers/gpu/drm/drm_atomic_helper.c | 116 +++++++++++++++++++++=
+++++++++++++++
> > >>  drivers/gpu/drm/drm_crtc.c          |  53 ++++++++++++++++
> > >>  include/drm/drm_crtc.h              |  14 +++++
> > >>  5 files changed, 199 insertions(+), 2 deletions(-)
> > >>
> > >>diff --git a/Documentation/DocBook/gpu.tmpl b/Documentation/DocBo=
ok/gpu.tmpl
> > >>index 6c6e81a9eaf4..f6b7236141b6 100644
> > >>--- a/Documentation/DocBook/gpu.tmpl
> > >>+++ b/Documentation/DocBook/gpu.tmpl
> > >>@@ -2004,7 +2004,7 @@ void intel_crt_init(struct drm_device *dev)
> > >>  	<td valign=3D"top" >Description/Restrictions</td>
> > >>  	</tr>
> > >>  	<tr>
> > >>-	<td rowspan=3D"37" valign=3D"top" >DRM</td>
> > >>+	<td rowspan=3D"38" valign=3D"top" >DRM</td>
> > >>  	<td valign=3D"top" >Generic</td>
> > >>  	<td valign=3D"top" >=E2=80=9Crotation=E2=80=9D</td>
> > >>  	<td valign=3D"top" >BITMASK</td>
> > >>@@ -2256,7 +2256,7 @@ void intel_crt_init(struct drm_device *dev)
> > >>  	<td valign=3D"top" >property to suggest an Y offset for a conn=
ector</td>
> > >>  	</tr>
> > >>  	<tr>
> > >>-	<td rowspan=3D"3" valign=3D"top" >Optional</td>
> > >>+	<td rowspan=3D"4" valign=3D"top" >Optional</td>
> > >>  	<td valign=3D"top" >=E2=80=9Cscaling mode=E2=80=9D</td>
> > >>  	<td valign=3D"top" >ENUM</td>
> > >>  	<td valign=3D"top" >{ "None", "Full", "Center", "Full aspect" =
}</td>
> > >>@@ -2280,6 +2280,16 @@ void intel_crt_init(struct drm_device *dev=
)
> > >>  	<td valign=3D"top" >TBD</td>
> > >>  	</tr>
> > >>  	<tr>
> > >>+	<td valign=3D"top" > "zpos" </td>
> > >>+	<td valign=3D"top" >RANGE</td>
> > >>+	<td valign=3D"top" >Min=3D0, Max=3D255</td>
> > >>+	<td valign=3D"top" >Plane</td>
> > >>+	<td valign=3D"top" >Plane's 'z' position during blending (0 for=
 background, 255 for frontmost).
> > >>+		If two planes assigned to same CRTC have equal zpos values, th=
e plane with higher plane
> > >>+		id is treated as closer to front. Can be IMMUTABLE if driver d=
oesn't support changing
> > >>+		planes' order.</td>
> > >I don't think this is going to work very well. Mixing the same ran=
ge
> > >of 0-255 for all planes, with potentially some of them being
> > >IMMUTABLE for sure won't end well, or at least won't allow userspa=
ce to
> > >see if there are any constraints between the zpos of the planes.
> > >
> > >So I think what we should do is let the driver specify the valid r=
ange,
> > >and get rid of the obj id based conflict resolution in favor of ju=
st
> > >rejecting conflicts outright. In cases where you can't move the pl=
anes
> > >between crtcs, the driver ought to specify the range based on the
> > >number of planes present on the crtc. If planes can be moved betwe=
ens
> > >crtcs the range obviously needs to be larger to accomodate all the
> > >possible planes on the crtc.
> > >
> > >Eg. on Intel VLV/CHV we could have the following setup:
> > >primary  zpos 0-2
> > >sprite 0 zpos 0-2
> > >sprite 1 zpos 0-2
> > >cursor   zpos 3
> > >
> > >That makes it very clear the curso is always on top, and the other
> > >planes can be rearranged more or less freely. These planes can't b=
e
> > >moved between crtcs, so each there's an identical set of planes fo=
r
> > >each crtc.
> > >
> > >On old Intel hw (gen2/3) we could have something like:
> > >plane A zpos 0-3
> > >plane B zpos 0-3
> > >plane C zpos 0-3
> > >overlay zpos 0-3
> > >cursor B zpos 4
> > >cursor A zpos 5
> > >
> > >Most of these planes can be moved between crtcs, and IIRC there
> > >are probably more constraints on exactly how they can be stacked, =
but
> > >this is at least fairly close to the truth. Again the cursors are =
always
> > >on top, and in this case the order between the two cursor planes i=
s also
> > >fixed.
> >=20
> > I wasn't aware of a hardware, which has limited configuration of zp=
os only
> > to some planes. I thought only about 2 cases: either completely con=
figurable
> > planes arrangement, or planes fixed to some hw dependent order. I s=
ee no
> > problem to let drivers to define their own limits for mutable zpos =
property.
> >=20
> > Now the question is weather we should allow to set the non-zero min=
imal
> > value
> > for mutable zpos? I can imagine that there might be a hardware, whi=
ch has
> > fixed background plane and a few configurable overlay planes. I ass=
ume that
> > in such case, the calculated normalized_zpos should still start fro=
m zero.
>=20
> The usual approach is to switch the property from a global one in
> dev->mode_config.*_prop to a per-object one in e.g. plane->zpos_prop.=
 We
> can still register the name, but have different limits/types. That wa=
y you
> could register a global mutable zpos with the range 0-3 and an immuta=
ble
> zpos with values 4 or 5 for cursors. The generic decoding would still=
 be
> fairly simple.
>=20
> 	} else if (property =3D=3D plane->zpos_property) {
> 		state->zpos =3D val;
> 	} else if (property =3D=3D config->zpos_property) {
> 		state->zpos =3D val;
>=20
> Plus some checking that no one attached both the global and obj-local
> property of the same name to the same object.
>=20
> Since this is a fairly simple add-on change and current drivers that
> support zpos don't need it I think it makes total sense to do this as=
 a
> follow-up when we need it.
>=20
> But might be good to document this somewhere (either commit message o=
r
> kerneldoc for zpos).
>=20
> > >I did originally have the same obj id based sorting idea (and even
> > >posted some kind of a patch for it IIRC) but that was before atomi=
c
> > >existed, so there was a real need to allow reordering the planes w=
ith
> > >just a single setplane ioctl call. With atomic I don't see any rea=
l
> > >benefit from it the obj id based sorting, and as I've noted there =
are
> > >definitely downsides to it.
> >=20
> > What are the downsides of using obj id as additional sorting criter=
ia? It
> > solves all the ambiguities and simplifies checks (there is no need =
to check
> > if there are 2 planes of the same zpos value).
>=20
> I think the sorting also has an upside that it avoids having to chang=
e all
> the drivers, or adding some kind of flag. Drivers which don't support=
 zpos
> just get a sorted normlized zpos. If we don't do that we'd have to pu=
t
> some unique default zpos in, which is going to make things messy.

Why would it make it messy? We already assign the obj ids in order (in
practice), so assigning a unique zpos in order would end up doing with
the same result.

--=20
Ville Syrj=C3=A4l=C3=A4
Intel OTC
