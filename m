From: Joe Kniss <djmk@google.com>
Subject: Re: [PATCH] Add drm ioctl DRM_IOCTL_MODE_GETFB2 &
	associated helpers.
Date: Tue, 1 Aug 2017 17:12:28 -0700
Message-ID: <CAOvnNvYMF_qBUAE-_DUMq-UgtmZ+Kdyrwf5JJgyEE+ujPkA4+g@mail.gmail.com>
References: <CAOvnNvYKXsy9dvOB0ge1WxQbwubPpzKofd=OGagKyft-yQJ1xw@mail.gmail.com>
 <1585370.MpXFX8O0mo@avalon>
 <CAOvnNvZoHv8prg2R57cgGx5w7h69=X3hQGrpP5iXaLujhOfzYA@mail.gmail.com>
 <14443434.mrJIj1bSop@avalon>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0171166815=="
Return-path: <intel-gfx-bounces@lists.freedesktop.org>
In-Reply-To: <14443434.mrJIj1bSop@avalon>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: amd-gfx@lists.freedesktop.org, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, Sean Paul <seanpaul@google.com>, michel.daenzer@amd.com, dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>, krzk@kernel.org, Alexandre Courbot <gnurou@gmail.com>, linux-samsung-soc@vger.kernel.org, jy0922.shim@samsung.com, linux-rockchip@lists.infradead.org, Kyungmin Park <kyungmin.park@samsung.com>, javier@osg.samsung.com, tomi.valkeinen@ti.com, bskeggs@redhat.com, CK HU <ck.hu@mediatek.com>, Andrey.Grodzovsky@amd.com, Joe Kniss <djmk@chromium.org>, Stephen Warren <swarren@wwwdotorg.org>, linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org, lin <ux-tegra@vger.kernel.org>, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, long jacob <mark.yao@rock-chips.com>, =?UTF-8?Q?St=C3=A9phane_Marche
List-Id: linux-samsung-soc@vger.kernel.org

--===============0171166815==
Content-Type: multipart/alternative; boundary="94eb2c07646095543d0555ba1e4c"

--94eb2c07646095543d0555ba1e4c
Content-Type: text/plain; charset="UTF-8"

On Tue, Aug 1, 2017 at 1:46 PM, Laurent Pinchart <
laurent.pinchart@ideasonboard.com> wrote:

> Hi Joe,
>
> On Tuesday 01 Aug 2017 10:24:25 Joe Kniss wrote:
> > On Tue, Aug 1, 2017 at 5:09 AM, Laurent Pinchart wrote:
> > > On Monday 31 Jul 2017 11:29:13 Joe Kniss wrote:
> > >> New getfb2 functionality uses drm_mode_fb_cmd2 struct to be symmetric
> > >> with addfb2.
> > >
> > > What's the use case for this ? We haven't needed such an ioctl for so
> long
> > > that it seemed to me that userspace doesn't really need it, but I
> could be
> > > wrong.
> >
> > Sorry, I failed to reference the original email.  Here it is:
> >
> > <snip>
> > I am a recent addition to Google's ChromeOS gfx team.   I am currently
> > working on display testing and reporting.   An important part of this is
> > our screen capture tool, which works by querying drm for crtcs, planes,
> and
> > fbs.  Unfortunately, there is only limited information available via
> > drmModeGetFB(), which often wrong information when drmModeAddFB2() was
> used
> > to create the fbs.   For example, if the pixel format is NV12 or YUV420,
> > the fb returned knows nothing about the additional buffer planes required
> > by these formats.   Ideally, we would like a function (e.g.
> drmModeGetFB2)
> > to return information symmetric with drmModeAddFB2 including the pixel
> > format id, buffer plane information etc.
> > </snip>
> >
> > ChromeOS has needed this functionality from the start, for both testing
> and
> > error reporting.  We got away with guessing the buffer's format (32bit
> > xrgb) until now.  We are now enabling overlays and more formats including
> > multi-planar (e.g. NV12).  Current getfb() reports neither the pixel
> format
> > nor  planar information.  Without this information, going forward, our
> gfx
> > testing is going to break.  It would be great if we had access to higher
> > level buffer structs (like gbm), but we generally don't since they would
> be
> > created by other apps (chrome browser, android apps, etc...).
>
> How is screen capture implemented ? Do you enumerate the framebuffers being
> scanned out, dump their contents and compose them manually based on the
> active
> plane configuration ? If so, isn't this very race-prone ?
>
>
Yes, this is basically it.  We identify the crtc to capture, query the
planes associated with it and their properties.  For each plane, we get the
fb, then a FD that we use to import a GBM buffer, which we map and
composite.  It's not ideal, but it's the only thing that will work across
all of our platforms and configs.   We either wait or sleep for consistent
testing captures.  I'm not sure what we can do about the race condition
without a much more substantial change...  We are currently looking into
some platform specific methods, but the current approach won't be going
away anytime soon.


> > >> Also modifies *_fb_create_handle() calls to accept a
> > >> format_plane_index so that handles for each plane can be generated.
> > >> Previously, many *_fb_create_handle() calls simply defaulted to plane
> 0
> > >> only.
> > >
> > > And with this patch the amd/amdgpu, armada, gma500, i915, mediatek,
> msm,
> > > nouveau and radeon drivers still do. Do none of them support
> multi-planar
> > > formats ?
> >
> > I would imagine that some of these do support multi-planar formats, but
> > they don't appear to have them implemented yet (except perhaps as offsets
> > into a single buffer).  I will certainly be looking into this soon, but
> any
> > changes will come in future patches.
> >
> > >> Signed-off-by: Joe Kniss <djmk@google.com>
> > >> ---
> > >>
> > >>  drivers/gpu/drm/amd/amdgpu/amdgpu_display.c |  5 +-
> > >>  drivers/gpu/drm/armada/armada_fb.c          |  1 +
> > >>  drivers/gpu/drm/drm_crtc_internal.h         |  2 +
> > >>  drivers/gpu/drm/drm_fb_cma_helper.c         | 11 ++--
> > >>  drivers/gpu/drm/drm_framebuffer.c           | 79
> +++++++++++++++++++-
> > >>  drivers/gpu/drm/drm_ioctl.c                 |  1 +
> > >>  drivers/gpu/drm/exynos/exynos_drm_fb.c      |  7 ++-
> > >>  drivers/gpu/drm/gma500/framebuffer.c        |  2 +
> > >>  drivers/gpu/drm/i915/intel_display.c        |  1 +
> > >>  drivers/gpu/drm/mediatek/mtk_drm_fb.c       |  1 +
> > >>  drivers/gpu/drm/msm/msm_fb.c                |  5 +-
> > >>  drivers/gpu/drm/nouveau/nouveau_display.c   |  1 +
> > >>  drivers/gpu/drm/omapdrm/omap_fb.c           |  5 +-
> > >>  drivers/gpu/drm/radeon/radeon_display.c     |  5 +-
> > >>  drivers/gpu/drm/rockchip/rockchip_drm_fb.c  |  6 ++-
> > >>  drivers/gpu/drm/tegra/fb.c                  |  9 +++-
> > >>  include/drm/drm_framebuffer.h               |  1 +
> > >>  include/uapi/drm/drm.h                      |  2 +
> > >>  18 files changed, 127 insertions(+), 17 deletions(-)
> > >
> > > [snip]
> > >
> > >> diff --git a/drivers/gpu/drm/drm_framebuffer.c
> > >> b/drivers/gpu/drm/drm_framebuffer.c index 28a0108a1ab8..67b3be1bedbc
> > >> 100644
> > >> --- a/drivers/gpu/drm/drm_framebuffer.c
> > >> +++ b/drivers/gpu/drm/drm_framebuffer.c
> > >> @@ -24,6 +24,7 @@
>
> [snip]
>
> > >> +/**
> > >> + * drm_mode_getfb2 - get FB info
> > >> + * @dev: drm device for the ioctl
> > >> + * @data: data pointer for the ioctl
> > >> + * @file_priv: drm file for the ioctl call
> > >> + *
> > >> + * Lookup the FB given its ID and return info about it.
> > >> + *
> > >> + * Called by the user via ioctl.
> > >> + *
> > >> + * Returns:
> > >> + * Zero on success, negative errno on failure.
> > >> + */
> > >> +int drm_mode_getfb2(struct drm_device *dev,
> > >> +                void *data, struct drm_file *file_priv)
> > >> +{
> > >> +     struct drm_mode_fb_cmd2 *r = data;
> > >> +     struct drm_framebuffer *fb;
> > >> +     int ret, i;
> > >> +
> > >> +     if (!drm_core_check_feature(dev, DRIVER_MODESET))
> > >> +             return -EINVAL;
> > >> +
> > >> +     fb = drm_framebuffer_lookup(dev, r->fb_id);
> > >> +     if (!fb)
> > >> +             return -ENOENT;
> > >> +
> > >> +     r->height = fb->height;
> > >> +     r->width = fb->width;
> > >> +     r->pixel_format = fb->format->format;
> > >> +     for (i = 0; i < 4; ++i) {
> > >> +             r->pitches[i] = fb->pitches[i];
> > >> +             r->offsets[i] = fb->offsets[i];
> > >> +             r->modifier[i] = fb->modifier;
> > >> +             r->handles[i] = 0;
> > >> +     }
> > >> +
> > >> +     for (i = 0; i < fb->format->num_planes; ++i) {
> > >> +             if (fb->funcs->create_handle) {
> > >> +                     if (drm_is_current_master(file_priv) ||
> > >> +                         capable(CAP_SYS_ADMIN) ||
> > >> +                         drm_is_control_client(file_priv)) {
> > >> +                             ret = fb->funcs->create_handle(fb, i,
> > >> file_priv,
> > >> +
> > >> &r->handles[i]);
> > >> +                             if (ret)
> > >> +                                     break;
> > >> +                     } else {
> > >> +                             /* GET_FB() is an unprivileged ioctl so
> we
> > >> must
> > >> +                              * not return a buffer-handle to
> > >> non-master
> > >> +                              * processes! For
> backwards-compatibility
> > >> +                              * reasons, we cannot make GET_FB()
> > >> privileged,
> > >> +                              * so just return an invalid handle for
> > >> +                              * non-masters. */
> > >
> > > There's no backward compatibility to handle here, just make it
> privileged
> > > if it has to be.
> >
> > Sure thing, sounds good.
> >
> > > > +                             r->handles[i] = 0;
> > > > +                             ret = 0;
> > > > +                     }
> > > > +             } else {
> > > > +                     ret = -ENODEV;
> > > > +                     break;
> > > > +             }
> > > > +     }
> > > > +
> > > > +     /* If handle creation failed, delete/dereference any that were
> > >
> > > made.
> > > */
> > >
> > > > +     if (ret) {
> > > > +             for (i = 0; i < 4; ++i) {
> > > > +                     if (r->handles[i])
> > > > +                             drm_gem_handle_delete(file_priv, r-
> > > >handles[i]);
> > >
> > > My initial reaction to this was to reply that not all drivers use GEM,
> but
> > > after some investigation it seems they actually do. If that's really
> the
> > > case, we could get rid of the .create_handle() operation completely,
> which
> > > should simplify the implementation of both DRM_IOCTL_MODE_GETFB and
> > > DRM_IOCTL_MODE_GETFB2.
> >
> > Deleting the handle is the same in all cases, but creating the handle
> > isn't consistent across the drivers.  I didn't see a clean way to
> simplify
> > this.
>
> Creating the handle seems to be fairly consistent, except for a very small
> number of special cases. If we stored the GEM object pointers in the
> drm_framebuffer structure, the common case would be simplified. Or maybe
> I've
> missed something :-)
>
>
I am sure this would be fine, I'd be happy to get rid of it.  I'll put
together a separate patch for this.



> > >> +                     r->handles[i] = 0;
> > >> +             }
> > >> +     }
> > >> +
> > >> +     drm_framebuffer_unreference(fb);
> > >> +
> > >> +     return ret;
> > >> +}
>
> [snip]
>
> > >> diff --git a/include/uapi/drm/drm.h b/include/uapi/drm/drm.h
> > >> index b2c52843bc70..c81c75335cca 100644
> > >> --- a/include/uapi/drm/drm.h
> > >> +++ b/include/uapi/drm/drm.h
> > >> @@ -814,6 +814,8 @@ extern "C" {
> > >>
> > >>  #define DRM_IOCTL_MODE_CREATEPROPBLOB        DRM_IOWR(0xBD, struct
> > >> drm_mode_create_blob)
> > >> #define DRM_IOCTL_MODE_DESTROYPROPBLOB        DRM_IOWR(0xBE, struct
> > >> drm_mode_destroy_blob)
> > >>
> > >> +#define DRM_IOCTL_MODE_GETFB2  DRM_IOWR(0xC4, struct
> drm_mode_fb_cmd2)
> > >> +
> > >
> > > Which tree is this based on ? The last defined ioctl
> > > (DRM_IOCTL_SYNCOBJ_FD_TO_HANDLE) is 0xC2 in drm-next and
> drm-misc-next.
> >
> > I just did a quick search for "DRM_IOWR 0xC*" and picked the first unused
> > one, there was a patch in-flight from last month that used 0xC3 (
> > https://lists.freedesktop.org/archives/amd-gfx/2017-June/010153.html).
> > Naturally, I'll set this to whatever is appropriate.
>
> The best is to base your patch on top of the drm-misc-next branch of the
> drm-
> misc tree. Whoever is merged first will win the ioctl number :-) Of course
> it
> means rebasing if someone else wins the race, but that shouldn't be a big
> deal.
>
>
Will do.


> > > >  /**
> > > >
> > > >   * Device specific ioctls should only be in their respective headers
> > > >   * The device specific ioctl range is from 0x40 to 0x9f.
>
> --
> Regards,
>
> Laurent Pinchart
>
>
I'll respond with an updated patch ASAP.

-- 
Dr. Joe Michael Kniss |  Google ChromeOS |  djmk@google.com   |
1-801-898-7977 <(801)%20898-7977>

--94eb2c07646095543d0555ba1e4c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Tue, Aug 1, 2017 at 1:46 PM, Laurent Pinchart <span dir=3D"ltr">&lt;=
<a href=3D"mailto:laurent.pinchart@ideasonboard.com" target=3D"_blank">laur=
ent.pinchart@ideasonboard<wbr>.com</a>&gt;</span> wrote:<br><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;pa=
dding-left:1ex">Hi Joe,<br>
<br>
On Tuesday 01 Aug 2017 10:24:25 Joe Kniss wrote:<br>
<div><div class=3D"m_-5589228979114224614m_-260341373603592650h5">&gt; On T=
ue, Aug 1, 2017 at 5:09 AM, Laurent Pinchart wrote:<br>
&gt; &gt; On Monday 31 Jul 2017 11:29:13 Joe Kniss wrote:<br>
&gt; &gt;&gt; New getfb2 functionality uses drm_mode_fb_cmd2 struct to be s=
ymmetric<br>
&gt; &gt;&gt; with addfb2.<br>
&gt; &gt;<br>
&gt; &gt; What&#39;s the use case for this ? We haven&#39;t needed such an =
ioctl for so long<br>
&gt; &gt; that it seemed to me that userspace doesn&#39;t really need it, b=
ut I could be<br>
&gt; &gt; wrong.<br>
&gt;<br>
&gt; Sorry, I failed to reference the original email.=C2=A0 Here it is:<br>
&gt;<br>
&gt; &lt;snip&gt;<br>
&gt; I am a recent addition to Google&#39;s ChromeOS gfx team.=C2=A0 =C2=A0=
I am currently<br>
&gt; working on display testing and reporting.=C2=A0 =C2=A0An important par=
t of this is<br>
&gt; our screen capture tool, which works by querying drm for crtcs, planes=
, and<br>
&gt; fbs.=C2=A0 Unfortunately, there is only limited information available =
via<br>
&gt; drmModeGetFB(), which often wrong information when drmModeAddFB2() was=
 used<br>
&gt; to create the fbs.=C2=A0 =C2=A0For example, if the pixel format is NV1=
2 or YUV420,<br>
&gt; the fb returned knows nothing about the additional buffer planes requi=
red<br>
&gt; by these formats.=C2=A0 =C2=A0Ideally, we would like a function (e.g. =
drmModeGetFB2)<br>
&gt; to return information symmetric with drmModeAddFB2 including the pixel=
<br>
&gt; format id, buffer plane information etc.<br>
&gt; &lt;/snip&gt;<br>
&gt;<br>
&gt; ChromeOS has needed this functionality from the start, for both testin=
g and<br>
&gt; error reporting.=C2=A0 We got away with guessing the buffer&#39;s form=
at (32bit<br>
&gt; xrgb) until now.=C2=A0 We are now enabling overlays and more formats i=
ncluding<br>
&gt; multi-planar (e.g. NV12).=C2=A0 Current getfb() reports neither the pi=
xel format<br>
&gt; nor=C2=A0 planar information.=C2=A0 Without this information, going fo=
rward, our gfx<br>
&gt; testing is going to break.=C2=A0 It would be great if we had access to=
 higher<br>
&gt; level buffer structs (like gbm), but we generally don&#39;t since they=
 would be<br>
&gt; created by other apps (chrome browser, android apps, etc...).<br>
<br>
</div></div>How is screen capture implemented ? Do you enumerate the frameb=
uffers being<br>
scanned out, dump their contents and compose them manually based on the act=
ive<br>
plane configuration ? If so, isn&#39;t this very race-prone ?<br>
<span><br></span></blockquote><div><br></div><div>Yes, this is basically it=
.=C2=A0 We identify the crtc to capture, query the planes associated with i=
t and their properties.=C2=A0 For each plane, we get the fb, then a FD that=
 we use to import a GBM buffer, which we map and composite.=C2=A0 It&#39;s =
not ideal, but it&#39;s the only thing that will work across all of our pla=
tforms and configs. =C2=A0 We either wait or sleep for consistent testing c=
aptures.=C2=A0 I&#39;m not sure what we can do about the race condition wit=
hout a much more substantial change...=C2=A0 We are currently looking into =
some platform specific methods, but the current approach won&#39;t be going=
 away anytime soon.=C2=A0</div><div>=C2=A0</div><blockquote class=3D"gmail_=
quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1=
ex"><span>
&gt; &gt;&gt; Also modifies *_fb_create_handle() calls to accept a<br>
&gt; &gt;&gt; format_plane_index so that handles for each plane can be gene=
rated.<br>
&gt; &gt;&gt; Previously, many *_fb_create_handle() calls simply defaulted =
to plane 0<br>
&gt; &gt;&gt; only.<br>
&gt; &gt;<br>
&gt; &gt; And with this patch the amd/amdgpu, armada, gma500, i915, mediate=
k, msm,<br>
&gt; &gt; nouveau and radeon drivers still do. Do none of them support mult=
i-planar<br>
&gt; &gt; formats ?<br>
&gt;<br>
&gt; I would imagine that some of these do support multi-planar formats, bu=
t<br>
&gt; they don&#39;t appear to have them implemented yet (except perhaps as =
offsets<br>
&gt; into a single buffer).=C2=A0 I will certainly be looking into this soo=
n, but any<br>
&gt; changes will come in future patches.<br>
&gt;<br>
&gt; &gt;&gt; Signed-off-by: Joe Kniss &lt;<a href=3D"mailto:djmk@google.co=
m" target=3D"_blank">djmk@google.com</a>&gt;<br>
&gt; &gt;&gt; ---<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;=C2=A0 drivers/gpu/drm/amd/amdgpu/amd<wbr>gpu_display.c |=C2=
=A0 5 +-<br>
&gt; &gt;&gt;=C2=A0 drivers/gpu/drm/armada/armada_<wbr>fb.c=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 1 +<br>
&gt; &gt;&gt;=C2=A0 drivers/gpu/drm/drm_crtc_inter<wbr>nal.h=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 2 +<br>
&gt; &gt;&gt;=C2=A0 drivers/gpu/drm/drm_fb_cma_hel<wbr>per.c=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0| 11 ++--<br>
</span>&gt; &gt;&gt;=C2=A0 drivers/gpu/drm/drm_framebuffe<wbr>r.c=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 79 +++++++++++++++++++-<br>
<span>&gt; &gt;&gt;=C2=A0 drivers/gpu/drm/drm_ioctl.c=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 1 +<br>
&gt; &gt;&gt;=C2=A0 drivers/gpu/drm/exynos/exynos_<wbr>drm_fb.c=C2=A0 =C2=
=A0 =C2=A0 |=C2=A0 7 ++-<br>
&gt; &gt;&gt;=C2=A0 drivers/gpu/drm/gma500/framebu<wbr>ffer.c=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 2 +<br>
&gt; &gt;&gt;=C2=A0 drivers/gpu/drm/i915/intel_dis<wbr>play.c=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 1 +<br>
&gt; &gt;&gt;=C2=A0 drivers/gpu/drm/mediatek/mtk_d<wbr>rm_fb.c=C2=A0 =C2=A0=
 =C2=A0 =C2=A0|=C2=A0 1 +<br>
&gt; &gt;&gt;=C2=A0 drivers/gpu/drm/msm/msm_fb.c=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 5 +-<br>
&gt; &gt;&gt;=C2=A0 drivers/gpu/drm/nouveau/nouvea<wbr>u_display.c=C2=A0 =
=C2=A0|=C2=A0 1 +<br>
&gt; &gt;&gt;=C2=A0 drivers/gpu/drm/omapdrm/omap_f<wbr>b.c=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 5 +-<br>
&gt; &gt;&gt;=C2=A0 drivers/gpu/drm/radeon/radeon_<wbr>display.c=C2=A0 =C2=
=A0 =C2=A0|=C2=A0 5 +-<br>
&gt; &gt;&gt;=C2=A0 drivers/gpu/drm/rockchip/rockc<wbr>hip_drm_fb.c=C2=A0 |=
=C2=A0 6 ++-<br>
&gt; &gt;&gt;=C2=A0 drivers/gpu/drm/tegra/fb.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 9 +++-<br>
&gt; &gt;&gt;=C2=A0 include/drm/drm_framebuffer.h=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 1 +<br>
&gt; &gt;&gt;=C2=A0 include/uapi/drm/drm.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 +<br>
&gt; &gt;&gt;=C2=A0 18 files changed, 127 insertions(+), 17 deletions(-)<br=
>
&gt; &gt;<br>
&gt; &gt; [snip]<br>
&gt; &gt;<br>
&gt; &gt;&gt; diff --git a/drivers/gpu/drm/drm_framebuf<wbr>fer.c<br>
&gt; &gt;&gt; b/drivers/gpu/drm/drm_framebuf<wbr>fer.c index 28a0108a1ab8..=
67b3be1bedbc<br>
&gt; &gt;&gt; 100644<br>
&gt; &gt;&gt; --- a/drivers/gpu/drm/drm_framebuf<wbr>fer.c<br>
&gt; &gt;&gt; +++ b/drivers/gpu/drm/drm_framebuf<wbr>fer.c<br>
&gt; &gt;&gt; @@ -24,6 +24,7 @@<br>
<br>
</span><div><div class=3D"m_-5589228979114224614m_-260341373603592650h5">[s=
nip]<br>
<br>
&gt; &gt;&gt; +/**<br>
&gt; &gt;&gt; + * drm_mode_getfb2 - get FB info<br>
&gt; &gt;&gt; + * @dev: drm device for the ioctl<br>
&gt; &gt;&gt; + * @data: data pointer for the ioctl<br>
&gt; &gt;&gt; + * @file_priv: drm file for the ioctl call<br>
&gt; &gt;&gt; + *<br>
&gt; &gt;&gt; + * Lookup the FB given its ID and return info about it.<br>
&gt; &gt;&gt; + *<br>
&gt; &gt;&gt; + * Called by the user via ioctl.<br>
&gt; &gt;&gt; + *<br>
&gt; &gt;&gt; + * Returns:<br>
&gt; &gt;&gt; + * Zero on success, negative errno on failure.<br>
&gt; &gt;&gt; + */<br>
&gt; &gt;&gt; +int drm_mode_getfb2(struct drm_device *dev,<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 void=
 *data, struct drm_file *file_priv)<br>
&gt; &gt;&gt; +{<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0struct drm_mode_fb_cmd2 *r =3D data;<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0struct drm_framebuffer *fb;<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0int ret, i;<br>
&gt; &gt;&gt; +<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0if (!drm_core_check_feature(dev, DRIVER_=
MODESET))<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EINV=
AL;<br>
&gt; &gt;&gt; +<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0fb =3D drm_framebuffer_lookup(dev, r-&gt=
;fb_id);<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0if (!fb)<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENOE=
NT;<br>
&gt; &gt;&gt; +<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0r-&gt;height =3D fb-&gt;height;<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0r-&gt;width =3D fb-&gt;width;<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0r-&gt;pixel_format =3D fb-&gt;format-&gt=
;format;<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt; 4; ++i) {<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0r-&gt;pitche=
s[i] =3D fb-&gt;pitches[i];<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0r-&gt;offset=
s[i] =3D fb-&gt;offsets[i];<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0r-&gt;modifi=
er[i] =3D fb-&gt;modifier;<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0r-&gt;handle=
s[i] =3D 0;<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; &gt;&gt; +<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt; fb-&gt;format-&gt;n=
um_planes; ++i) {<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (fb-&gt;f=
uncs-&gt;create_handle) {<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0if (drm_is_current_master(file_pr<wbr>iv) ||<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0capable(CAP_SYS_ADMIN) ||<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0drm_is_control_client(file_pr<wbr>iv)) {<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D fb-&gt;funcs-&gt;creat=
e_handle(fb, i,<br>
&gt; &gt;&gt; file_priv,<br>
&gt; &gt;&gt; +<br>
&gt; &gt;&gt; &amp;r-&gt;handles[i]);<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret)<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0br=
eak;<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0} else {<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* GET_FB() is an unprivileged=
 ioctl so we<br>
&gt; &gt;&gt; must<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * not return a buffer-handle =
to<br>
&gt; &gt;&gt; non-master<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * processes! For backwards-co=
mpatibility<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * reasons, we cannot make GET=
_FB()<br>
&gt; &gt;&gt; privileged,<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * so just return an invalid h=
andle for<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * non-masters. */<br>
&gt; &gt;<br>
&gt; &gt; There&#39;s no backward compatibility to handle here, just make i=
t privileged<br>
&gt; &gt; if it has to be.<br>
&gt;<br>
&gt; Sure thing, sounds good.<br>
&gt;<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0r-&gt;handles[i] =3D 0;<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D 0;<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0}<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br=
>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0ret =3D -ENODEV;<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0break;<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0/* If handle creation failed, delete/de=
reference any that were<br>
&gt; &gt;<br>
&gt; &gt; made.<br>
&gt; &gt; */<br>
&gt; &gt;<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0if (ret) {<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for (i =3D =
0; i &lt; 4; ++i) {<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0if (r-&gt;handles[i])<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0drm_gem_handle_delete(file_pr<=
wbr>iv, r-<br>
&gt; &gt; &gt;handles[i]);<br>
&gt; &gt;<br>
&gt; &gt; My initial reaction to this was to reply that not all drivers use=
 GEM, but<br>
&gt; &gt; after some investigation it seems they actually do. If that&#39;s=
 really the<br>
&gt; &gt; case, we could get rid of the .create_handle() operation complete=
ly, which<br>
&gt; &gt; should simplify the implementation of both DRM_IOCTL_MODE_GETFB a=
nd<br>
&gt; &gt; DRM_IOCTL_MODE_GETFB2.<br>
&gt;<br>
&gt; Deleting the handle is the same in all cases, but creating the handle<=
br>
&gt; isn&#39;t consistent across the drivers.=C2=A0 I didn&#39;t see a clea=
n way to simplify<br>
&gt; this.<br>
<br>
</div></div>Creating the handle seems to be fairly consistent, except for a=
 very small<br>
number of special cases. If we stored the GEM object pointers in the<br>
drm_framebuffer structure, the common case would be simplified. Or maybe I&=
#39;ve<br>
missed something :-)<br>
<span><br></span></blockquote><div><br></div><div>I am sure this would be f=
ine, I&#39;d be happy to get rid of it.=C2=A0 I&#39;ll put together a separ=
ate patch for this.</div><div><br></div><div>=C2=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex"><span>
&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0r-&gt;handles[i] =3D 0;<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; &gt;&gt; +<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0drm_framebuffer_unreference(f<wbr>b);<br=
>
&gt; &gt;&gt; +<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0return ret;<br>
&gt; &gt;&gt; +}<br>
<br>
[snip]<br>
<br>
</span><span>&gt; &gt;&gt; diff --git a/include/uapi/drm/drm.h b/include/ua=
pi/drm/drm.h<br>
&gt; &gt;&gt; index b2c52843bc70..c81c75335cca 100644<br>
&gt; &gt;&gt; --- a/include/uapi/drm/drm.h<br>
&gt; &gt;&gt; +++ b/include/uapi/drm/drm.h<br>
&gt; &gt;&gt; @@ -814,6 +814,8 @@ extern &quot;C&quot; {<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;=C2=A0 #define DRM_IOCTL_MODE_CREATEPROPBLOB=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 DRM_IOWR(0xBD, struct<br>
&gt; &gt;&gt; drm_mode_create_blob)<br>
&gt; &gt;&gt; #define DRM_IOCTL_MODE_DESTROYPROPBLOB<wbr>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 DRM_IOWR(0xBE, struct<br>
&gt; &gt;&gt; drm_mode_destroy_blob)<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; +#define DRM_IOCTL_MODE_GETFB2=C2=A0 DRM_IOWR(0xC4, struct dr=
m_mode_fb_cmd2)<br>
&gt; &gt;&gt; +<br>
&gt; &gt;<br>
&gt; &gt; Which tree is this based on ? The last defined ioctl<br>
&gt; &gt; (DRM_IOCTL_SYNCOBJ_FD_TO_HANDL<wbr>E) is 0xC2 in drm-next and drm=
-misc-next.<br>
&gt;<br>
&gt; I just did a quick search for &quot;DRM_IOWR 0xC*&quot; and picked the=
 first unused<br>
&gt; one, there was a patch in-flight from last month that used 0xC3 (<br>
&gt; <a href=3D"https://lists.freedesktop.org/archives/amd-gfx/2017-June/01=
0153.html" rel=3D"noreferrer" target=3D"_blank">https://lists.freedesktop.o=
rg/<wbr>archives/amd-gfx/2017-June/010<wbr>153.html</a>).<br>
&gt; Naturally, I&#39;ll set this to whatever is appropriate.<br>
<br>
</span>The best is to base your patch on top of the drm-misc-next branch of=
 the drm-<br>
misc tree. Whoever is merged first will win the ioctl number :-) Of course =
it<br>
means rebasing if someone else wins the race, but that shouldn&#39;t be a b=
ig<br>
deal.<br>
<div class=3D"m_-5589228979114224614m_-260341373603592650HOEnZb"><div class=
=3D"m_-5589228979114224614m_-260341373603592650h5"><br></div></div></blockq=
uote><div><br></div><div>Will do.</div><div>=C2=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex"><div class=3D"m_-5589228979114224614m_-260341373603592650HOEn=
Zb"><div class=3D"m_-5589228979114224614m_-260341373603592650h5">
&gt; &gt; &gt;=C2=A0 /**<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0* Device specific ioctls should only be in their=
 respective headers<br>
&gt; &gt; &gt;=C2=A0 =C2=A0* The device specific ioctl range is from 0x40 t=
o 0x9f.<br>
<br>
--<br>
Regards,<br>
<br>
Laurent Pinchart<br>
<br>
</div></div></blockquote></div><br>I&#39;ll respond with an updated patch A=
SAP.<br clear=3D"all"><div><br></div>-- <br><div class=3D"m_-55892289791142=
24614m_-260341373603592650gmail_signature" data-smartmail=3D"gmail_signatur=
e"><div dir=3D"ltr"><div><div dir=3D"ltr"><table cellspacing=3D"0" cellpadd=
ing=3D"0" style=3D"text-align:center;color:rgb(80,0,80);font-family:&#39;Ti=
mes New Roman&#39;"><tbody><tr style=3D"color:rgb(85,85,85);font-family:san=
s-serif;font-size:small"><td nowrap style=3D"border-top-style:solid;border-=
top-color:rgb(213,15,37);border-top-width:2px"><font size=3D"1"><font face=
=3D"garamond, serif">Dr. Joe Michael Kniss </font>|</font></td><td nowrap s=
tyle=3D"border-top-style:solid;border-top-color:rgb(51,105,232);border-top-=
width:2px"><font size=3D"1">=C2=A0<font face=3D"garamond, serif"><font colo=
r=3D"#0b5394">G</font><font color=3D"#cc0000">o</font><font color=3D"#bf900=
0">o</font><font color=3D"#0b5394">g</font><font color=3D"#38761d">l</font>=
<font color=3D"#cc0000">e</font><font color=3D"#000000">=C2=A0</font><font =
color=3D"#444444">ChromeOS</font></font><font color=3D"#000000">=C2=A0</fon=
t>|</font></td><td nowrap style=3D"border-top-style:solid;border-top-color:=
rgb(0,153,57);border-top-width:2px"><font size=3D"1"><font face=3D"garamond=
, serif">=C2=A0<a href=3D"mailto:djmk@google.com" target=3D"_blank">djmk<fo=
nt color=3D"#1155cc">@google.com</font></a>=C2=A0</font>=C2=A0</font></td><=
td nowrap style=3D"border-top-style:solid;border-top-color:rgb(238,178,17);=
border-top-width:2px"><font size=3D"1"><a value=3D"+16504298119" style=3D"c=
olor:rgb(17,85,204)">| </a><font face=3D"garamond, serif"><font color=3D"#1=
155cc"><a href=3D"tel:(801)%20898-7977" value=3D"+18018987977" target=3D"_b=
lank">1-801-898-7977</a></font><br></font></font></td></tr></tbody></table>=
</div></div></div></div>
</div></div>

--94eb2c07646095543d0555ba1e4c--

--===============0171166815==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KSW50ZWwtZ2Z4
IG1haWxpbmcgbGlzdApJbnRlbC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaW50ZWwtZ2Z4Cg==

--===============0171166815==--
