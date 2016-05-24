From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 1/4] drm: add generic zpos property
Date: Tue, 24 May 2016 17:01:02 +0300
Message-ID: <1759669.AN6p92X2mM@avalon>
References: <1463048902-9388-1-git-send-email-benjamin.gaignard@linaro.org> <3485783.RE56tryr7C@avalon> <20160512205409.GW4329@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:59954 "EHLO
	galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755116AbcEXOAs convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 24 May 2016 10:00:48 -0400
In-Reply-To: <20160512205409.GW4329@intel.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Ville =?ISO-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Cc: Benjamin Gaignard <benjamin.gaignard@linaro.org>, dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, daniel@ffwll.ch, linaro-mm-sig@lists.linaro.org, Marek Szyprowski <m.szyprowski@samsung.com>, Inki Dae <inki.dae@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, Gustavo Padovan <gustavo@padovan.org>, vincent.abriou@st.com, fabien.dessenne@st.com

Hi Ville,

On Thursday 12 May 2016 23:54:09 Ville Syrj=E4l=E4 wrote:
> On Thu, May 12, 2016 at 11:15:42PM +0300, Laurent Pinchart wrote:
> > On Thursday 12 May 2016 22:46:05 Ville Syrj=E4l=E4 wrote:
> >> On Thu, May 12, 2016 at 10:20:12PM +0300, Laurent Pinchart wrote:
> >>> On Thursday 12 May 2016 14:51:55 Ville Syrj=E4l=E4 wrote:
> >>>> On Thu, May 12, 2016 at 12:28:19PM +0200, Benjamin Gaignard wrot=
e:
> >>>>> From: Marek Szyprowski <m.szyprowski@samsung.com>
> >>>>>=20
> >>>>> This patch adds support for generic plane's zpos property prope=
rty
> >>>>> with well-defined semantics:
> >>>>> - added zpos properties to plane and plane state structures
> >>>>> - added helpers for normalizing zpos properties of given set of
> >>>>>   planes
> >>>>> - well defined semantics: planes are sorted by zpos values and =
then
> >>>>>   plane id value if zpos equals
> >>>>>=20
> >>>>> Normalized zpos values are calculated automatically when generi=
c
> >>>>> muttable zpos property has been initialized. Drivers can simply=
 use
> >>>>> plane_state->normalized_zpos in their atomic_check and/or
> >>>>> plane_update callbacks without any additional calls to DRM core=
=2E
> >>>>>=20
> >>>>> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> >>>>>=20
> >>>>> Compare to Marek's original patch zpos property is now specific=
 to
> >>>>> each plane and no more to the core.
> >>>>> Normalize function take care of the range of per plane defined =
range
> >>>>> before set normalized_zpos.
> >>>>>=20
> >>>>> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@linaro.org>
> >>>>>=20
> >>>>> Cc: Inki Dae <inki.dae@samsung.com>
> >>>>> Cc: Daniel Vetter <daniel@ffwll.ch>
> >>>>> Cc: Ville Syrjala <ville.syrjala@linux.intel.com>
> >>>>> Cc: Joonyoung Shim <jy0922.shim@samsung.com>
> >>>>> Cc: Seung-Woo Kim <sw0312.kim@samsung.com>
> >>>>> Cc: Andrzej Hajda <a.hajda@samsung.com>
> >>>>> Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> >>>>> Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
> >>>>> Cc: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
> >>>>> Cc: Gustavo Padovan <gustavo@padovan.org>
> >>>>> Cc: vincent.abriou@st.com
> >>>>> Cc: fabien.dessenne@st.com
> >>>>> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> >>>>> ---
> >>>>>=20
> >>>>>  Documentation/DocBook/gpu.tmpl      |  10 ++
> >>>>>  drivers/gpu/drm/Makefile            |   2 +-
> >>>>>  drivers/gpu/drm/drm_atomic.c        |   4 +
> >>>>>  drivers/gpu/drm/drm_atomic_helper.c |   6 +
> >>>>>  drivers/gpu/drm/drm_blend.c         | 229 ++++++++++++++++++++=
+++++
> >>>>>  drivers/gpu/drm/drm_crtc_internal.h |   3 +
> >>>>>  include/drm/drm_crtc.h              |  28 +++++
> >>>>>  7 files changed, 281 insertions(+), 1 deletion(-)
> >>>>>  create mode 100644 drivers/gpu/drm/drm_blend.c
> >>>=20
> >>> [snip]
> >>>=20
> >>>>> diff --git a/drivers/gpu/drm/drm_blend.c
> >>>>> b/drivers/gpu/drm/drm_blend.c
> >>>>> new file mode 100644
> >>>>> index 0000000..eef59bb
> >>>>> --- /dev/null
> >>>>> +++ b/drivers/gpu/drm/drm_blend.c
> >>>>> @@ -0,0 +1,229 @@
> >>>=20
> >>> [snip]
> >>>=20
> >>>>> +static int drm_atomic_state_zpos_cmp(const void *a, const void=
 *b)
> >>>>> +{
> >>>>> +	const struct drm_plane_state *sa =3D *(struct drm_plane_state=
 **)a;
> >>>>> +	const struct drm_plane_state *sb =3D *(struct drm_plane_state=
 **)b;
> >>>>> +
> >>>>> +	if (sa->zpos !=3D sb->zpos)
> >>>>> +		return sa->zpos - sb->zpos;
> >>>>> +	else
> >>>>> +		return sa->plane->base.id - sb->plane->base.id;
> >>>>> +}
> >>>>=20
> >>>> Still not really convinced this normalization is a good idea whe=
n we
> >>>> have atomic. It made sense before atomic since otherwise you mig=
ht
> >>>> not be able to swap the zpos of two planes without shutting one =
of them
> >>>> down, but it makes interpreting the zpos prop values more confus=
ing.
> >>>> And with atomic we don't actually need it AFAICS. Or do we have =
an
> >>>> actual use case for this behaviour?
> >>>=20
> >>> Speaking selfishly about my use case (rcar-du-drm), I need to sor=
t
> >>> planes in display order from 0 to N-1 as that's how the hardware =
is
> >>> programmed. Normalization gives me an array of sorted planes, whi=
ch is
> >>> exactly what I need. I expect other drivers to have similar
> >>> requirements, so normalization in the core will allow code sharin=
g.
> >>=20
> >> It just eliminates duplicate zpos values. It won't re-sort your pl=
ane
> >> states magically or anything like that. Nor does it guarantee that
> >> the zpos values for the actually visible planes are even contiguou=
s.
> >=20
> > To make normalization useful in my case I need contiguous values st=
arting
> > at 0.
>=20
> Contigious values for all the planes on the whole device or on one cr=
tc?
> And what about the visible vs. not plane issue? Is it OK to have an
> invisible plane somewhere in the middle of the zpos sequence?

In my case it would be per-CRTC, and invisible planes in the middle wou=
ldn't=20
be an issue.

To make normalization useful it needs to compute values that are usable=
 by the=20
majority of drivers. The question then becomes what should those values=
 be ?=20
Generally speaking they should be easy to convert to driver-specific va=
lues.=20
That's why I believe we need feedback from driver developers on this to=
pic.

> >>> Now, is your concern that allowing two planes to have the same zp=
os
> >>> isn't needed with the atomic API ? I agree with that, but it woul=
d also
> >>> make it impossible to swap two planes using the legacy API implem=
ented
> >>> on top of atomic drivers. I'll let others decide whether this is
> >>> considered as a concern.
> >=20
> > Any opinion on this ?
>=20
> Not really. I already asked if we had a good use case for it. Dunno i=
f
> anyone has one.

Non-atomic userspace needing to swap planes is such a use case. The que=
stion=20
is whether we want to support it.

=46or atomic, the reason I can see to support the same feature is to ma=
ke it=20
easier for userspace to modify the zorder of a plane without requiring =
updates=20
to all other planes. I don't have a strong opinion on that, but we need=
 to=20
decide whether we want to support it or not.

> >>> While at it, Benjamin told me that you've requested configurable
> >>> min/max values per plane, what are your use cases for that ? On t=
he same
> >>> topic, please see below.
> >>>=20
> >>>>> +
> >>>>> +/**
> >>>>> + * drm_atomic_helper_crtc_normalize_zpos - calculate normalize=
d
> >>>>> zpos values
> >>>>> + * @crtc: crtc with planes, which have to be considered for
> >>>>> normalization
> >>>>> + * @crtc_state: new atomic state to apply
> >>>>> + *
> >>>>> + * This function checks new states of all planes assigned to g=
iven
> >>>>> crtc and
> >>>>> + * calculates normalized zpos value for them. Planes are compa=
red
> >>>>> first by their
> >>>>> + * zpos values, then by plane id (if zpos equals). Plane with
> >>>>> lowest zpos value
> >>>>> + * is at the bottom. The plane_state->normalized_zpos is then
> >>>>> filled with unique
> >>>>> + * values from 0 to number of active planes in crtc minus one.
> >>>>> + *
> >>>>> + * RETURNS
> >>>>> + * Zero for success or -errno
> >>>>> + */
> >>>>> +int drm_atomic_helper_crtc_normalize_zpos(struct drm_crtc *crt=
c,
> >>>>> +					  struct drm_crtc_state *crtc_state)
> >>>>> +{
> >>>>> +	struct drm_atomic_state *state =3D crtc_state->state;
> >>>>> +	struct drm_device *dev =3D crtc->dev;
> >>>>> +	int total_planes =3D dev->mode_config.num_total_plane;
> >>>>> +	struct drm_plane_state **states;
> >>>>> +	struct drm_plane *plane;
> >>>>> +	int i, zpos, n =3D 0;
> >>>>> +	int ret =3D 0;
> >>>>> +
> >>>>> +	DRM_DEBUG_ATOMIC("[CRTC:%d:%s] calculating normalized zpos
> >>>>> values\n",
> >>>>> +			 crtc->base.id, crtc->name);
> >>>>> +
> >>>>> +	states =3D kmalloc(total_planes * sizeof(*states), GFP_KERNEL=
);
> >>>>=20
> >>>> kmalloc_array(..., GFP_TEMPORARY);
> >>>>=20
> >>>>> +	if (!states)
> >>>>> +		return -ENOMEM;
> >>>>> +
> >>>>> +	/*
> >>>>> +	 * Normalization process might create new states for planes w=
hich
> >>>>> +	 * normalized_zpos has to be recalculated.
> >>>>> +	 */
> >>>>> +	drm_for_each_plane_mask(plane, dev, crtc_state->plane_mask) {
> >>>>> +		struct drm_plane_state *plane_state =3D
> >>>>> +			drm_atomic_get_plane_state(state, plane);
> >>>>> +		if (IS_ERR(plane_state)) {
> >>>>> +			ret =3D PTR_ERR(plane_state);
> >>>>> +			goto done;
> >>>>> +		}
> >>>>=20
> >>>> Hmm. So if we change the zpos for any plane, we get to re-check =
every
> >>>> plane. Not the most efficient thing perhaps, since on some hardw=
are
> >>>> you might only have a subset of planes that can even change thei=
r
> >>>> zpos. OTOH I suppose it does make life a bit simpler when you do=
n't
> >>>> have to think which planes might be affected, so I guess it's fi=
ne.
> >>>>=20
> >>>>> +		states[n++] =3D plane_state;
> >>>>> +		DRM_DEBUG_ATOMIC("[PLANE:%d:%s] processing zpos value %d\n",
> >>>>> +				 plane->base.id, plane->name,
> >>>>> +				 plane_state->zpos);
> >>>>> +	}
> >>>>> +
> >>>>> +	sort(states, n, sizeof(*states), drm_atomic_state_zpos_cmp, N=
ULL);
> >>>>> +
> >>>>> +	for (i =3D 0, zpos =3D 0; i < n; i++, zpos++) {
> >>>>> +		plane =3D states[i]->plane;
> >>>>> +
> >>>>> +		zpos =3D max_t(int, zpos, states[i]->zpos);
> >>>=20
> >>> The purpose of this code is to support the per-plane min/max zpos
> >>> values. As Benjamin explained, for example if the zpos range is [=
0,2]
> >>> for plane X and [4,6] for plane Y, we need to be sure the min zpo=
s value
> >>> of plane Y is 4. To this I replied that's exactly what I'd rather=
 avoid.
> >>> I think the core code should take care of sorting planes, taking =
driver-
> >>> specific constraints into account when possible (too exotic const=
raints
> >>> can always be implemented directly by drivers), and then leave to=
 the
> >>> drivers the responsibility of taking the sorted planes array and
> >>> computing whatever hardware-specific configuration is needed. Sor=
ting
> >>> planes from 0 to N-1 seems to be like a better API than having se=
mi-
> >>> random values for the normalized zpos. Do we have use cases that
> >>> wouldn't be covered by a simpler implementation ?
> >>=20
> >> The point of exposing ranges is to give userspace at least some ch=
ance
> >> of getting the order right. Otherwise it'll just have to randomly =
try
> >> different orders until something works. Most hardware is quite
> >> constrained in this.
> >=20
> > Could you educate me by giving a few real world examples ?
>=20
> Well, on Intel we have the simple case on many platforms (bottom->top=
):
> primary->sprite->cursor
> Most PC hardware from some years ago was similar. More modern stuff f=
rom
> the other vendors might be more capable, not sure.
>=20
> We also have another class of Intel hardware which has primary, two
> sprites, and a cursor. The cursor is always on top, the other three
> planes can be in any order amongst themselves.
>=20
> The oldest Intel hardware we support is even more flexible. Those had
> sort of 1 proper primary plane, 2 sprite planes, 1 video overlay, and
> 2 cursor planes. Normally they're spread among two crtcs, but they
> can all be moved to a single crtc and then ordering constraints betwe=
en
> them are fairly convoluted.

Thank you for the information.

> As far as I can remember OMAP (at least 3 and maybe 4) had a totally
> fixed order. GFX->VID1->VID2. Perhaps they changed this later, dunno.

OMAP3 has a fixed Z-order, while OMAP4 seems to be configurable accordi=
ng to=20
the omapdrm driver.

> One extra complication in this is destination color keying. What that
> tends to do effectively is push some sprite/overlay plane below the
> primary and punch a hole into the primary, but otherwise the
> sprite/overlay sits above the primary. Not sure if we should make thi=
s
> sort of thing explicit in the zpos API or if we should just declare
> color keying somehow magic and potentially ignore some of the zpos
> properties.

Color-keying is a quite common feature, I think we should standardize=20
properties to support it, which would then require defining the behavio=
ur,=20
including how it interacts with Z-order.

> >> Some don't support changing the zpos at all, in which case we woul=
d set
> >> min=3D=3Dmax.
> >=20
> > But all this doesn't require adjusting the normalized zpos to take =
the
> > original zpos constraints into account, does it ? Why can normalize=
d_zpos

s/can/can't/

> > be constrained to the range 0 to N-1, giving drivers the sorted pla=
nes
> > and then letting them convert that to device-specific values ?
>=20
> Oh, I didn't even notice that it was mixing up the normalized and
> non-normalized coordinates. Yes, that does seem wrong to me. The fact=
 that
> the ioctl would have rejected the out of range non-normalized coordin=
ates
> should already guarantee that the resulting normalized coordinates en=
d
> up in roughly the right order. That is, at least the order between di=
fferent
> "zpos groups" of planes would be already respected. Eg. in the Intel =
"3
> freely ordered planes + cursor" case there would be no way to push th=
e
> cursor below any other plane.

I agree with you, and I still think that computing the zpos_normalized =
values=20
in the 0 to N-1 range (N being the number of visible planes for the CRT=
C)=20
would be the best option.

--=20
Regards,

Laurent Pinchart
