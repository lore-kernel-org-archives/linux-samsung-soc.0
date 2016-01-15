From: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v3 1/3] drm: add generic zpos property
Date: Fri, 15 Jan 2016 11:12:25 +0100
Message-ID: <20160115101225.GG19130@phenom.ffwll.local>
References: <1452605960-21194-1-git-send-email-m.szyprowski@samsung.com>
 <1452605960-21194-2-git-send-email-m.szyprowski@samsung.com>
 <20160114104623.GR23290@intel.com>
 <5698B73A.3000300@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wm0-f67.google.com ([74.125.82.67]:36602 "EHLO
	mail-wm0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757344AbcAOKMZ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 15 Jan 2016 05:12:25 -0500
Received: by mail-wm0-f67.google.com with SMTP id l65so2027943wmf.3
        for <linux-samsung-soc@vger.kernel.org>; Fri, 15 Jan 2016 02:12:25 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <5698B73A.3000300@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>, dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, Inki Dae <inki.dae@samsung.com>, Daniel Vetter <daniel@ffwll.ch>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, Gustavo Padovan <gustavo@padovan.org>, Benjamin Gaignard <benjamin.gaignard@linaro.org>, vincent.abriou@st.com, fabien.dessenne@st.com

On Fri, Jan 15, 2016 at 10:09:14AM +0100, Marek Szyprowski wrote:
> Hello,
>=20
> On 2016-01-14 11:46, Ville Syrj=C3=A4l=C3=A4 wrote:
> >On Tue, Jan 12, 2016 at 02:39:18PM +0100, Marek Szyprowski wrote:
> >>This patch adds support for generic plane's zpos property property =
with
> >>well-defined semantics:
> >>- added zpos properties to drm core and plane state structures
> >>- added helpers for normalizing zpos properties of given set of pla=
nes
> >>- well defined semantics: planes are sorted by zpos values and then=
 plane
> >>   id value if zpos equals
> >>
> >>Normalized zpos values are calculated automatically when generic
> >>muttable zpos property has been initialized. Drivers can simply use
> >>plane_state->normalized_zpos in their atomic_check and/or plane_upd=
ate
> >>callbacks without any additional calls to DRM core.
> >>
> >>Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> >>---
> >>  Documentation/DocBook/gpu.tmpl      |  14 ++++-
> >>  drivers/gpu/drm/drm_atomic.c        |   4 ++
> >>  drivers/gpu/drm/drm_atomic_helper.c | 116 +++++++++++++++++++++++=
+++++++++++++
> >>  drivers/gpu/drm/drm_crtc.c          |  53 ++++++++++++++++
> >>  include/drm/drm_crtc.h              |  14 +++++
> >>  5 files changed, 199 insertions(+), 2 deletions(-)
> >>
> >>diff --git a/Documentation/DocBook/gpu.tmpl b/Documentation/DocBook=
/gpu.tmpl
> >>index 6c6e81a9eaf4..f6b7236141b6 100644
> >>--- a/Documentation/DocBook/gpu.tmpl
> >>+++ b/Documentation/DocBook/gpu.tmpl
> >>@@ -2004,7 +2004,7 @@ void intel_crt_init(struct drm_device *dev)
> >>  	<td valign=3D"top" >Description/Restrictions</td>
> >>  	</tr>
> >>  	<tr>
> >>-	<td rowspan=3D"37" valign=3D"top" >DRM</td>
> >>+	<td rowspan=3D"38" valign=3D"top" >DRM</td>
> >>  	<td valign=3D"top" >Generic</td>
> >>  	<td valign=3D"top" >=E2=80=9Crotation=E2=80=9D</td>
> >>  	<td valign=3D"top" >BITMASK</td>
> >>@@ -2256,7 +2256,7 @@ void intel_crt_init(struct drm_device *dev)
> >>  	<td valign=3D"top" >property to suggest an Y offset for a connec=
tor</td>
> >>  	</tr>
> >>  	<tr>
> >>-	<td rowspan=3D"3" valign=3D"top" >Optional</td>
> >>+	<td rowspan=3D"4" valign=3D"top" >Optional</td>
> >>  	<td valign=3D"top" >=E2=80=9Cscaling mode=E2=80=9D</td>
> >>  	<td valign=3D"top" >ENUM</td>
> >>  	<td valign=3D"top" >{ "None", "Full", "Center", "Full aspect" }<=
/td>
> >>@@ -2280,6 +2280,16 @@ void intel_crt_init(struct drm_device *dev)
> >>  	<td valign=3D"top" >TBD</td>
> >>  	</tr>
> >>  	<tr>
> >>+	<td valign=3D"top" > "zpos" </td>
> >>+	<td valign=3D"top" >RANGE</td>
> >>+	<td valign=3D"top" >Min=3D0, Max=3D255</td>
> >>+	<td valign=3D"top" >Plane</td>
> >>+	<td valign=3D"top" >Plane's 'z' position during blending (0 for b=
ackground, 255 for frontmost).
> >>+		If two planes assigned to same CRTC have equal zpos values, the =
plane with higher plane
> >>+		id is treated as closer to front. Can be IMMUTABLE if driver doe=
sn't support changing
> >>+		planes' order.</td>
> >I don't think this is going to work very well. Mixing the same range
> >of 0-255 for all planes, with potentially some of them being
> >IMMUTABLE for sure won't end well, or at least won't allow userspace=
 to
> >see if there are any constraints between the zpos of the planes.
> >
> >So I think what we should do is let the driver specify the valid ran=
ge,
> >and get rid of the obj id based conflict resolution in favor of just
> >rejecting conflicts outright. In cases where you can't move the plan=
es
> >between crtcs, the driver ought to specify the range based on the
> >number of planes present on the crtc. If planes can be moved between=
s
> >crtcs the range obviously needs to be larger to accomodate all the
> >possible planes on the crtc.
> >
> >Eg. on Intel VLV/CHV we could have the following setup:
> >primary  zpos 0-2
> >sprite 0 zpos 0-2
> >sprite 1 zpos 0-2
> >cursor   zpos 3
> >
> >That makes it very clear the curso is always on top, and the other
> >planes can be rearranged more or less freely. These planes can't be
> >moved between crtcs, so each there's an identical set of planes for
> >each crtc.
> >
> >On old Intel hw (gen2/3) we could have something like:
> >plane A zpos 0-3
> >plane B zpos 0-3
> >plane C zpos 0-3
> >overlay zpos 0-3
> >cursor B zpos 4
> >cursor A zpos 5
> >
> >Most of these planes can be moved between crtcs, and IIRC there
> >are probably more constraints on exactly how they can be stacked, bu=
t
> >this is at least fairly close to the truth. Again the cursors are al=
ways
> >on top, and in this case the order between the two cursor planes is =
also
> >fixed.
>=20
> I wasn't aware of a hardware, which has limited configuration of zpos=
 only
> to some planes. I thought only about 2 cases: either completely confi=
gurable
> planes arrangement, or planes fixed to some hw dependent order. I see=
 no
> problem to let drivers to define their own limits for mutable zpos pr=
operty.
>=20
> Now the question is weather we should allow to set the non-zero minim=
al
> value
> for mutable zpos? I can imagine that there might be a hardware, which=
 has
> fixed background plane and a few configurable overlay planes. I assum=
e that
> in such case, the calculated normalized_zpos should still start from =
zero.

The usual approach is to switch the property from a global one in
dev->mode_config.*_prop to a per-object one in e.g. plane->zpos_prop. W=
e
can still register the name, but have different limits/types. That way =
you
could register a global mutable zpos with the range 0-3 and an immutabl=
e
zpos with values 4 or 5 for cursors. The generic decoding would still b=
e
fairly simple.

	} else if (property =3D=3D plane->zpos_property) {
		state->zpos =3D val;
	} else if (property =3D=3D config->zpos_property) {
		state->zpos =3D val;

Plus some checking that no one attached both the global and obj-local
property of the same name to the same object.

Since this is a fairly simple add-on change and current drivers that
support zpos don't need it I think it makes total sense to do this as a
follow-up when we need it.

But might be good to document this somewhere (either commit message or
kerneldoc for zpos).

> >I did originally have the same obj id based sorting idea (and even
> >posted some kind of a patch for it IIRC) but that was before atomic
> >existed, so there was a real need to allow reordering the planes wit=
h
> >just a single setplane ioctl call. With atomic I don't see any real
> >benefit from it the obj id based sorting, and as I've noted there ar=
e
> >definitely downsides to it.
>=20
> What are the downsides of using obj id as additional sorting criteria=
? It
> solves all the ambiguities and simplifies checks (there is no need to=
 check
> if there are 2 planes of the same zpos value).

I think the sorting also has an upside that it avoids having to change =
all
the drivers, or adding some kind of flag. Drivers which don't support z=
pos
just get a sorted normlized zpos. If we don't do that we'd have to put
some unique default zpos in, which is going to make things messy.

Cheers, Daniel
--=20
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
