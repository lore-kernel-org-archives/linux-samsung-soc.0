From: Joe Kniss <djmk@google.com>
Subject: Re: [PATCH] Add drm ioctl DRM_IOCTL_MODE_GETFB2 &
	associated helpers.
Date: Tue, 1 Aug 2017 10:24:25 -0700
Message-ID: <CAOvnNvZoHv8prg2R57cgGx5w7h69=X3hQGrpP5iXaLujhOfzYA@mail.gmail.com>
References: <CAOvnNvYKXsy9dvOB0ge1WxQbwubPpzKofd=OGagKyft-yQJ1xw@mail.gmail.com>
 <20170731182913.136758-1-djmk@google.com> <1585370.MpXFX8O0mo@avalon>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1887489858=="
Return-path: <intel-gfx-bounces@lists.freedesktop.org>
In-Reply-To: <1585370.MpXFX8O0mo@avalon>
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
Cc: amd-gfx@lists.freedesktop.org, heiko@sntech.de, Sean Paul <seanpaul@google.com>, michel.daenzer@amd.com, dri-devel@lists.freedesktop.org, thierry.reding@gmail.com, krzk@kernel.org, gnurou@gmail.com, linux-samsung-soc@vger.kernel.org, jy0922.shim@samsung.com, linux-rockchip@lists.infradead.org, kyungmin.park@samsung.com, javier@osg.samsung.com, tomi.valkeinen@ti.com, bskeggs@redhat.com, nouveau@lists.freedesktop.org, ck.hu@mediatek.com, Andrey.Grodzovsky@amd.com, Joe Kniss <djmk@chromium.org>, swarren@wwwdotorg.org, linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org, lin <ux-tegra@vger.kernel.org>, linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org, mark.yao@rock-chips.com, =?UTF-8?Q?St=C3=A9phane_Marchesin?= <marcheu@google.com>, nils.wallmenius@gmail.com, freedreno@lists.freedesktop.org, sw0312.kim@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

--===============1887489858==
Content-Type: multipart/alternative; boundary="94eb2c1ba8cc4527630555b46b08"

--94eb2c1ba8cc4527630555b46b08
Content-Type: text/plain; charset="UTF-8"

Thanks for the quick review!

On Tue, Aug 1, 2017 at 5:09 AM, Laurent Pinchart <laurent.pinchart@
ideasonboard.com> wrote:

> Hi Joe,
>
> Thank you for the patch.
>
> On Monday 31 Jul 2017 11:29:13 Joe Kniss wrote:
> > New getfb2 functionality uses drm_mode_fb_cmd2 struct to be symmetric
> > with addfb2.
>
> What's the use case for this ? We haven't needed such an ioctl for so long
> that it seemed to me that userspace doesn't really need it, but I could be
> wrong.
>
> Sorry, I failed to reference the original email.  Here it is:
<snip>
 I am a recent addition to Google's ChromeOS gfx team.   I am currently
working on display testing and reporting.   An important part of this is
our screen capture tool, which works by querying drm for crtcs, planes, and
fbs.  Unfortunately, there is only limited information available via
drmModeGetFB(), which often wrong information when drmModeAddFB2() was used
to create the fbs.   For example, if the pixel format is NV12 or YUV420,
the fb returned knows nothing about the additional buffer planes required
by these formats.   Ideally, we would like a function (e.g. drmModeGetFB2)
to return information symmetric with drmModeAddFB2 including the pixel
format id, buffer plane information etc.
</snip>
ChromeOS has needed this functionality from the start, for both testing and
error reporting.  We got away with guessing the buffer's format (32bit
xrgb) until now.  We are now enabling overlays and more formats including
multi-planar (e.g. NV12).  Current getfb() reports neither the pixel format
nor  planar information.  Without this information, going forward, our gfx
testing is going to break.  It would be great if we had access to higher
level buffer structs (like gbm), but we generally don't since they would be
created by other apps (chrome browser, android apps, etc...).


> > Also modifies *_fb_create_handle() calls to accept a
> > format_plane_index so that handles for each plane can be generated.
> > Previously, many *_fb_create_handle() calls simply defaulted to plane 0
> > only.
>
> And with this patch the amd/amdgpu, armada, gma500, i915, mediatek, msm,
> nouveau and radeon drivers still do. Do none of them support multi-planar
> formats ?
>
> I would imagine that some of these do support multi-planar formats, but
they don't appear to have them implemented yet (except perhaps as offsets
into a single buffer).  I will certainly be looking into this soon, but any
changes will come in future patches.


> > Signed-off-by: Joe Kniss <djmk@google.com>
> > ---
> >  drivers/gpu/drm/amd/amdgpu/amdgpu_display.c |  5 +-
> >  drivers/gpu/drm/armada/armada_fb.c          |  1 +
> >  drivers/gpu/drm/drm_crtc_internal.h         |  2 +
> >  drivers/gpu/drm/drm_fb_cma_helper.c         | 11 ++--
> >  drivers/gpu/drm/drm_framebuffer.c           | 79
> +++++++++++++++++++++++++-
> >  drivers/gpu/drm/drm_ioctl.c                 |  1 +
> >  drivers/gpu/drm/exynos/exynos_drm_fb.c      |  7 ++-
> >  drivers/gpu/drm/gma500/framebuffer.c        |  2 +
> >  drivers/gpu/drm/i915/intel_display.c        |  1 +
> >  drivers/gpu/drm/mediatek/mtk_drm_fb.c       |  1 +
> >  drivers/gpu/drm/msm/msm_fb.c                |  5 +-
> >  drivers/gpu/drm/nouveau/nouveau_display.c   |  1 +
> >  drivers/gpu/drm/omapdrm/omap_fb.c           |  5 +-
> >  drivers/gpu/drm/radeon/radeon_display.c     |  5 +-
> >  drivers/gpu/drm/rockchip/rockchip_drm_fb.c  |  6 ++-
> >  drivers/gpu/drm/tegra/fb.c                  |  9 +++-
> >  include/drm/drm_framebuffer.h               |  1 +
> >  include/uapi/drm/drm.h                      |  2 +
> >  18 files changed, 127 insertions(+), 17 deletions(-)
>
> [snip]
>
> > diff --git a/drivers/gpu/drm/drm_framebuffer.c
> > b/drivers/gpu/drm/drm_framebuffer.c index 28a0108a1ab8..67b3be1bedbc
> 100644
> > --- a/drivers/gpu/drm/drm_framebuffer.c
> > +++ b/drivers/gpu/drm/drm_framebuffer.c
> > @@ -24,6 +24,7 @@
> >  #include <drm/drmP.h>
> >  #include <drm/drm_auth.h>
> >  #include <drm/drm_framebuffer.h>
> > +#include <drm/drm_gem.h>
> >
> >  #include "drm_crtc_internal.h"
>
> [snip]
>
> > +/**
> > + * drm_mode_getfb2 - get FB info
> > + * @dev: drm device for the ioctl
> > + * @data: data pointer for the ioctl
> > + * @file_priv: drm file for the ioctl call
> > + *
> > + * Lookup the FB given its ID and return info about it.
> > + *
> > + * Called by the user via ioctl.
> > + *
> > + * Returns:
> > + * Zero on success, negative errno on failure.
> > + */
> > +int drm_mode_getfb2(struct drm_device *dev,
> > +                void *data, struct drm_file *file_priv)
> > +{
> > +     struct drm_mode_fb_cmd2 *r = data;
> > +     struct drm_framebuffer *fb;
> > +     int ret, i;
> > +
> > +     if (!drm_core_check_feature(dev, DRIVER_MODESET))
> > +             return -EINVAL;
> > +
> > +     fb = drm_framebuffer_lookup(dev, r->fb_id);
> > +     if (!fb)
> > +             return -ENOENT;
> > +
> > +     r->height = fb->height;
> > +     r->width = fb->width;
> > +     r->pixel_format = fb->format->format;
> > +     for (i = 0; i < 4; ++i) {
> > +             r->pitches[i] = fb->pitches[i];
> > +             r->offsets[i] = fb->offsets[i];
> > +             r->modifier[i] = fb->modifier;
> > +             r->handles[i] = 0;
> > +     }
> > +
> > +     for (i = 0; i < fb->format->num_planes; ++i) {
> > +             if (fb->funcs->create_handle) {
> > +                     if (drm_is_current_master(file_priv) ||
> > +                         capable(CAP_SYS_ADMIN) ||
> > +                         drm_is_control_client(file_priv)) {
> > +                             ret = fb->funcs->create_handle(fb, i,
> > file_priv,
> > +
> > &r->handles[i]);
> > +                             if (ret)
> > +                                     break;
> > +                     } else {
> > +                             /* GET_FB() is an unprivileged ioctl so we
> > must
> > +                              * not return a buffer-handle to non-master
> > +                              * processes! For backwards-compatibility
> > +                              * reasons, we cannot make GET_FB()
> > privileged,
> > +                              * so just return an invalid handle for
> > +                              * non-masters. */
>
> There's no backward compatibility to handle here, just make it privileged
> if
> it has to be.
>
> Sure thing, sounds good.



> > +                             r->handles[i] = 0;
> > +                             ret = 0;
> > +                     }
> > +             } else {
> > +                     ret = -ENODEV;
> > +                     break;
> > +             }
> > +     }
> > +
> > +     /* If handle creation failed, delete/dereference any that were
> made.
> */
> > +     if (ret) {
> > +             for (i = 0; i < 4; ++i) {
> > +                     if (r->handles[i])
> > +                             drm_gem_handle_delete(file_priv, r-
> >handles[i]);
>
> My initial reaction to this was to reply that not all drivers use GEM, but
> after some investigation it seems they actually do. If that's really the
> case,
> we could get rid of the .create_handle() operation completely, which should
> simplify the implementation of both DRM_IOCTL_MODE_GETFB and
> DRM_IOCTL_MODE_GETFB2.
>
> Deleting the handle is the same in all cases, but creating the handle
isn't consistent across the drivers.  I didn't see a clean way to simplify
this.


> > +                     r->handles[i] = 0;
> > +             }
> > +     }
> > +
> > +     drm_framebuffer_unreference(fb);
> > +
> > +     return ret;
> > +}
>
> [snip]
>
> > diff --git a/drivers/gpu/drm/omapdrm/omap_fb.c
> > b/drivers/gpu/drm/omapdrm/omap_fb.c index 29dc677dd4d3..a982c72a773e
> 100644
> > --- a/drivers/gpu/drm/omapdrm/omap_fb.c
> > +++ b/drivers/gpu/drm/omapdrm/omap_fb.c
> > @@ -90,12 +90,15 @@ struct omap_framebuffer {
> >  };
> >
> >  static int omap_framebuffer_create_handle(struct drm_framebuffer *fb,
> > +             unsigned int format_plane_index,
> >               struct drm_file *file_priv,
> >               unsigned int *handle)
> >  {
> >       struct omap_framebuffer *omap_fb = to_omap_framebuffer(fb);
> > +     if (format_plane_index >= 4 || !omap_fb->planes[format_plane_
> index])
>
> The first check shouldn't be needed, the core should never call this
> operation
> with an index >= 4.
>
> I'll remove the check then.


> > +             return -ENOENT;
> >       return drm_gem_handle_create(file_priv,
> > -                     omap_fb->planes[0].bo, handle);
> > +                     omap_fb->planes[format_plane_index].bo, handle);
> >  }
>
> [snip]
>
> > diff --git a/include/uapi/drm/drm.h b/include/uapi/drm/drm.h
> > index b2c52843bc70..c81c75335cca 100644
> > --- a/include/uapi/drm/drm.h
> > +++ b/include/uapi/drm/drm.h
> > @@ -814,6 +814,8 @@ extern "C" {
> >  #define DRM_IOCTL_MODE_CREATEPROPBLOB        DRM_IOWR(0xBD, struct
> > drm_mode_create_blob)
> > #define DRM_IOCTL_MODE_DESTROYPROPBLOB        DRM_IOWR(0xBE, struct
> > drm_mode_destroy_blob)
> >
> > +#define DRM_IOCTL_MODE_GETFB2  DRM_IOWR(0xC4, struct drm_mode_fb_cmd2)
> > +
>
> Which tree is this based on ? The last defined ioctl
> (DRM_IOCTL_SYNCOBJ_FD_TO_HANDLE) is 0xC2 in drm-next and drm-misc-next.
>
> I just did a quick search for "DRM_IOWR 0xC*" and picked the first unused
one, there was a patch in-flight from last month that used 0xC3 (
https://lists.freedesktop.org/archives/amd-gfx/2017-June/010153.html).
Naturally, I'll set this to whatever is appropriate.


> >  /**
> >   * Device specific ioctls should only be in their respective headers
> >   * The device specific ioctl range is from 0x40 to 0x9f.
>
> --
> Regards,
>
> Laurent Pinchart
>
>
Thanks!
-j


-- 
Dr. Joe Michael Kniss |  Google ChromeOS |  djmk@google.com   |
1-801-898-7977 <(801)%20898-7977>

--94eb2c1ba8cc4527630555b46b08
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks for the quick review!=C2=A0<br><div class=3D"gmail_=
extra"><br><div class=3D"gmail_quote">On Tue, Aug 1, 2017 at 5:09 AM, Laure=
nt Pinchart <span dir=3D"ltr">&lt;<a href=3D"mailto:laurent.pinchart@ideaso=
nboard.com" target=3D"_blank">laurent.pinchart@<wbr>ideasonboard.com</a>&gt=
;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi Joe=
,<br>
<br>
Thank you for the patch.<br>
<span><br>
On Monday 31 Jul 2017 11:29:13 Joe Kniss wrote:<br>
&gt; New getfb2 functionality uses drm_mode_fb_cmd2 struct to be symmetric<=
br>
&gt; with addfb2.<br>
<br>
</span>What&#39;s the use case for this ? We haven&#39;t needed such an ioc=
tl for so long<br>
that it seemed to me that userspace doesn&#39;t really need it, but I could=
 be<br>
wrong.<br>
<span><br></span></blockquote><div>Sorry, I failed to reference the origina=
l email.=C2=A0 Here it is:=C2=A0</div><div>&lt;snip&gt;</div><div><span sty=
le=3D"font-size:12.8px">=C2=A0I am a recent addition to Google&#39;s Chrome=
OS gfx team. =C2=A0 I am currently working on display testing and reporting=
. =C2=A0 An important part of this is our screen capture tool, which works =
by querying drm for crtcs, planes, and fbs.=C2=A0 Unfortunately, there is o=
nly limited information available via drmModeGetFB(), which often wrong inf=
ormation when drmModeAddFB2() was used to create the fbs. =C2=A0 For exampl=
e, if the pixel format is NV12 or YUV420, the fb returned knows nothing abo=
ut the additional buffer planes required by these formats. =C2=A0 Ideally, =
we would like a function (e.g. drmModeGetFB2) to return information symmetr=
ic with drmModeAddFB2 including the pixel format id, buffer plane informati=
on etc. =C2=A0=C2=A0</span></div><div><span style=3D"font-size:12.8px">&lt;=
/snip&gt;</span></div><div>ChromeOS has needed this functionality from the =
start, for both testing and error reporting.=C2=A0 We got away with guessin=
g the buffer&#39;s format (32bit xrgb) until now.=C2=A0 We are now enabling=
 overlays and more formats including multi-planar (e.g. NV12).=C2=A0 Curren=
t getfb() reports neither the pixel format nor =C2=A0planar information.=C2=
=A0 Without this information, going forward, our gfx testing is going to br=
eak.=C2=A0 It would be great if we had access to higher level buffer struct=
s (like gbm), but we generally don&#39;t since they would be created by oth=
er apps (chrome browser, android apps, etc...).</div><div>=C2=A0</div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex"><span>
&gt; Also modifies *_fb_create_handle() calls to accept a<br>
&gt; format_plane_index so that handles for each plane can be generated.<br=
>
&gt; Previously, many *_fb_create_handle() calls simply defaulted to plane =
0<br>
&gt; only.<br>
<br>
</span>And with this patch the amd/amdgpu, armada, gma500, i915, mediatek, =
msm,<br>
nouveau and radeon drivers still do. Do none of them support multi-planar<b=
r>
formats ?<br>
<span><br></span></blockquote><div>I would imagine that some of these do su=
pport multi-planar formats, but they don&#39;t appear to have them implemen=
ted yet (except perhaps as offsets into a single buffer).=C2=A0 I will cert=
ainly be looking into this soon, but any changes will come in future patche=
s. =C2=A0</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex"><span>
&gt; Signed-off-by: Joe Kniss &lt;<a href=3D"mailto:djmk@google.com" target=
=3D"_blank">djmk@google.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 drivers/gpu/drm/amd/amdgpu/amd<wbr>gpu_display.c |=C2=A0 5 +-<br=
>
&gt;=C2=A0 drivers/gpu/drm/armada/armada_<wbr>fb.c=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 |=C2=A0 1 +<br>
&gt;=C2=A0 drivers/gpu/drm/drm_crtc_inter<wbr>nal.h=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0|=C2=A0 2 +<br>
&gt;=C2=A0 drivers/gpu/drm/drm_fb_cma_hel<wbr>per.c=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0| 11 ++--<br>
</span>&gt;=C2=A0 drivers/gpu/drm/drm_framebuffe<wbr>r.c=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0| 79 +++++++++++++++++++++++++-<br>
<span>&gt;=C2=A0 drivers/gpu/drm/drm_ioctl.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 1 +<br>
&gt;=C2=A0 drivers/gpu/drm/exynos/exynos_<wbr>drm_fb.c=C2=A0 =C2=A0 =C2=A0 =
|=C2=A0 7 ++-<br>
&gt;=C2=A0 drivers/gpu/drm/gma500/framebu<wbr>ffer.c=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 2 +<br>
&gt;=C2=A0 drivers/gpu/drm/i915/intel_dis<wbr>play.c=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 1 +<br>
&gt;=C2=A0 drivers/gpu/drm/mediatek/mtk_d<wbr>rm_fb.c=C2=A0 =C2=A0 =C2=A0 =
=C2=A0|=C2=A0 1 +<br>
&gt;=C2=A0 drivers/gpu/drm/msm/msm_fb.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 5 +-<br>
&gt;=C2=A0 drivers/gpu/drm/nouveau/nouvea<wbr>u_display.c=C2=A0 =C2=A0|=C2=
=A0 1 +<br>
&gt;=C2=A0 drivers/gpu/drm/omapdrm/omap_f<wbr>b.c=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 5 +-<br>
&gt;=C2=A0 drivers/gpu/drm/radeon/radeon_<wbr>display.c=C2=A0 =C2=A0 =C2=A0=
|=C2=A0 5 +-<br>
&gt;=C2=A0 drivers/gpu/drm/rockchip/rockc<wbr>hip_drm_fb.c=C2=A0 |=C2=A0 6 =
++-<br>
&gt;=C2=A0 drivers/gpu/drm/tegra/fb.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 9 +++-<br>
&gt;=C2=A0 include/drm/drm_framebuffer.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 1 +<br>
&gt;=C2=A0 include/uapi/drm/drm.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 +<br>
&gt;=C2=A0 18 files changed, 127 insertions(+), 17 deletions(-)<br>
<br>
</span>[snip]<br>
<span><br>
&gt; diff --git a/drivers/gpu/drm/drm_framebuf<wbr>fer.c<br>
&gt; b/drivers/gpu/drm/drm_framebuf<wbr>fer.c index 28a0108a1ab8..67b3be1be=
dbc 100644<br>
&gt; --- a/drivers/gpu/drm/drm_framebuf<wbr>fer.c<br>
&gt; +++ b/drivers/gpu/drm/drm_framebuf<wbr>fer.c<br>
&gt; @@ -24,6 +24,7 @@<br>
&gt;=C2=A0 #include &lt;drm/drmP.h&gt;<br>
&gt;=C2=A0 #include &lt;drm/drm_auth.h&gt;<br>
&gt;=C2=A0 #include &lt;drm/drm_framebuffer.h&gt;<br>
&gt; +#include &lt;drm/drm_gem.h&gt;<br>
&gt;<br>
&gt;=C2=A0 #include &quot;drm_crtc_internal.h&quot;<br>
<br>
</span>[snip]<br>
<div><div class=3D"gmail-m_-3711990965528987190h5"><br>
&gt; +/**<br>
&gt; + * drm_mode_getfb2 - get FB info<br>
&gt; + * @dev: drm device for the ioctl<br>
&gt; + * @data: data pointer for the ioctl<br>
&gt; + * @file_priv: drm file for the ioctl call<br>
&gt; + *<br>
&gt; + * Lookup the FB given its ID and return info about it.<br>
&gt; + *<br>
&gt; + * Called by the user via ioctl.<br>
&gt; + *<br>
&gt; + * Returns:<br>
&gt; + * Zero on success, negative errno on failure.<br>
&gt; + */<br>
&gt; +int drm_mode_getfb2(struct drm_device *dev,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 void *data, s=
truct drm_file *file_priv)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct drm_mode_fb_cmd2 *r =3D data;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct drm_framebuffer *fb;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int ret, i;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (!drm_core_check_feature(dev, DRIVER_MODESET))=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EINVAL;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0fb =3D drm_framebuffer_lookup(dev, r-&gt;fb_id);<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (!fb)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENOENT;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0r-&gt;height =3D fb-&gt;height;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0r-&gt;width =3D fb-&gt;width;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0r-&gt;pixel_format =3D fb-&gt;format-&gt;format;<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt; 4; ++i) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0r-&gt;pitches[i] =3D =
fb-&gt;pitches[i];<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0r-&gt;offsets[i] =3D =
fb-&gt;offsets[i];<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0r-&gt;modifier[i] =3D=
 fb-&gt;modifier;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0r-&gt;handles[i] =3D =
0;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt; fb-&gt;format-&gt;num_planes=
; ++i) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (fb-&gt;funcs-&gt;=
create_handle) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0if (drm_is_current_master(file_pr<wbr>iv) ||<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0capable(CAP_SYS_ADMIN) ||<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0drm_is_control_client(file_pr<wbr>iv)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D fb-&gt;funcs-&gt;create_handle(f=
b, i,<br>
&gt; file_priv,<br>
&gt; +<br>
&gt; &amp;r-&gt;handles[i]);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0} else {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* GET_FB() is an unprivileged ioctl so =
we<br>
&gt; must<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * not return a buffer-handle to non-mas=
ter<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * processes! For backwards-compatibilit=
y<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * reasons, we cannot make GET_FB()<br>
&gt; privileged,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * so just return an invalid handle for<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * non-masters. */<br>
<br>
</div></div>There&#39;s no backward compatibility to handle here, just make=
 it privileged if<br>
it has to be.<br>
<span><br></span></blockquote><div>Sure thing, sounds good.</div><div><br><=
/div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><sp=
an>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0r-&gt;handles[i] =3D 0;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D 0;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0ret =3D -ENODEV;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/* If handle creation failed, delete/dereference =
any that were made.<br>
*/<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (ret) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt; =
4; ++i) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0if (r-&gt;handles[i])<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0drm_gem_handle_delete(file_pr<wbr>iv, r-=
<br>
&gt;handles[i]);<br>
<br>
</span>My initial reaction to this was to reply that not all drivers use GE=
M, but<br>
after some investigation it seems they actually do. If that&#39;s really th=
e case,<br>
we could get rid of the .create_handle() operation completely, which should=
<br>
simplify the implementation of both DRM_IOCTL_MODE_GETFB and<br>
DRM_IOCTL_MODE_GETFB2.<br>
<span><br></span></blockquote><div>Deleting the handle is the same in all c=
ases, but creating the handle isn&#39;t consistent across the drivers.=C2=
=A0 I didn&#39;t see a clean way to simplify this.</div><div>=C2=A0</div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex"><span>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0r-&gt;handles[i] =3D 0;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0drm_framebuffer_unreference(f<wbr>b);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return ret;<br>
&gt; +}<br>
<br>
</span>[snip]<br>
<span><br>
&gt; diff --git a/drivers/gpu/drm/omapdrm/omap<wbr>_fb.c<br>
&gt; b/drivers/gpu/drm/omapdrm/omap<wbr>_fb.c index 29dc677dd4d3..a982c72a7=
73e 100644<br>
&gt; --- a/drivers/gpu/drm/omapdrm/omap<wbr>_fb.c<br>
&gt; +++ b/drivers/gpu/drm/omapdrm/omap<wbr>_fb.c<br>
&gt; @@ -90,12 +90,15 @@ struct omap_framebuffer {<br>
&gt;=C2=A0 };<br>
&gt;<br>
&gt;=C2=A0 static int omap_framebuffer_create_handle<wbr>(struct drm_frameb=
uffer *fb,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int format_p=
lane_index,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_file =
*file_priv,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int *ha=
ndle)<br>
&gt;=C2=A0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0struct omap_framebuffer *omap_fb =3D to_omap=
_framebuffer(fb);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (format_plane_index &gt;=3D 4 || !omap_fb-&gt;=
planes[format_plane_<wbr>index])<br>
<br>
</span>The first check shouldn&#39;t be needed, the core should never call =
this operation<br>
with an index &gt;=3D 4.<br>
<span><br></span></blockquote><div>I&#39;ll remove the check then.</div><di=
v>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><span>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENOENT;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0return drm_gem_handle_create(file_pri<wbr>v,=
<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0omap_fb-&gt;planes[0].bo, handle);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0omap_fb-&gt;planes[format_plane_<wbr>index].bo, handle);<br>
&gt;=C2=A0 }<br>
<br>
</span>[snip]<br>
<span><br>
&gt; diff --git a/include/uapi/drm/drm.h b/include/uapi/drm/drm.h<br>
&gt; index b2c52843bc70..c81c75335cca 100644<br>
&gt; --- a/include/uapi/drm/drm.h<br>
&gt; +++ b/include/uapi/drm/drm.h<br>
&gt; @@ -814,6 +814,8 @@ extern &quot;C&quot; {<br>
&gt;=C2=A0 #define DRM_IOCTL_MODE_CREATEPROPBLOB=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 DRM_IOWR(0xBD, struct<br>
&gt; drm_mode_create_blob)<br>
&gt; #define DRM_IOCTL_MODE_<wbr>DESTROYPROPBLOB=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 DRM_IOWR(0xBE, struct<br>
&gt; drm_mode_destroy_blob)<br>
&gt;<br>
&gt; +#define DRM_IOCTL_MODE_GETFB2=C2=A0 DRM_IOWR(0xC4, struct drm_mode_fb=
_cmd2)<br>
&gt; +<br>
<br>
</span>Which tree is this based on ? The last defined ioctl<br>
(DRM_IOCTL_SYNCOBJ_FD_TO_HANDL<wbr>E) is 0xC2 in drm-next and drm-misc-next=
.<br>
<span><br></span></blockquote><div>I just did a quick search for &quot;DRM_=
IOWR 0xC*&quot; and picked the first unused one, there was a patch in-fligh=
t from last month that used 0xC3 (<a href=3D"https://lists.freedesktop.org/=
archives/amd-gfx/2017-June/010153.html">https://lists.freedesktop.org/archi=
ves/amd-gfx/2017-June/010153.html</a>). =C2=A0 Naturally, I&#39;ll set this=
 to whatever is appropriate.</div><div>=C2=A0</div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex"><span>
&gt;=C2=A0 /**<br>
&gt;=C2=A0 =C2=A0* Device specific ioctls should only be in their respectiv=
e headers<br>
&gt;=C2=A0 =C2=A0* The device specific ioctl range is from 0x40 to 0x9f.<br=
>
<br>
--<br>
</span>Regards,<br>
<br>
Laurent Pinchart<br>
<br>
</blockquote></div><div class=3D"gmail_extra"><br></div>Thanks! =C2=A0</div=
><div class=3D"gmail_extra">-j<br><br clear=3D"all"><div><br></div>-- <br><=
div class=3D"gmail-m_-3711990965528987190gmail_signature"><div dir=3D"ltr">=
<div><div dir=3D"ltr"><table cellspacing=3D"0" cellpadding=3D"0" style=3D"t=
ext-align:center;color:rgb(80,0,80);font-family:&quot;Times New Roman&quot;=
"><tbody><tr style=3D"color:rgb(85,85,85);font-family:sans-serif;font-size:=
small"><td nowrap style=3D"border-top:2px solid rgb(213,15,37)"><font size=
=3D"1"><font face=3D"garamond, serif">Dr. Joe Michael Kniss </font>|</font>=
</td><td nowrap style=3D"border-top:2px solid rgb(51,105,232)"><font size=
=3D"1">=C2=A0<font face=3D"garamond, serif"><font color=3D"#0b5394">G</font=
><font color=3D"#cc0000">o</font><font color=3D"#bf9000">o</font><font colo=
r=3D"#0b5394">g</font><font color=3D"#38761d">l</font><font color=3D"#cc000=
0">e</font><font color=3D"#000000">=C2=A0</font><font color=3D"#444444">Chr=
omeOS</font></font><font color=3D"#000000">=C2=A0</font>|</font></td><td no=
wrap style=3D"border-top:2px solid rgb(0,153,57)"><font size=3D"1"><font fa=
ce=3D"garamond, serif">=C2=A0<a href=3D"mailto:djmk@google.com" target=3D"_=
blank">djmk<font color=3D"#1155cc">@google.com</font></a>=C2=A0</font>=C2=
=A0</font></td><td nowrap style=3D"border-top:2px solid rgb(238,178,17)"><f=
ont size=3D"1"><a value=3D"+16504298119" style=3D"color:rgb(17,85,204)">| <=
/a><font face=3D"garamond, serif"><font color=3D"#1155cc"><a href=3D"tel:(8=
01)%20898-7977" value=3D"+18018987977" target=3D"_blank">1-801-898-7977</a>=
</font><br></font></font></td></tr></tbody></table></div></div></div></div>
</div></div>

--94eb2c1ba8cc4527630555b46b08--

--===============1887489858==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KSW50ZWwtZ2Z4
IG1haWxpbmcgbGlzdApJbnRlbC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaW50ZWwtZ2Z4Cg==

--===============1887489858==--
