From: Inki Dae <inki.dae@samsung.com>
Subject: Re: [PATCH] drm/exynos: Add check for IOMMU while passing physically
	continous memory flag
Date: Fri, 2 Aug 2013 16:28:37 +0900
Message-ID: <CAAQKjZNBPxBxR-4PXbhOdX0V1inMkauE-xZ+0kwnfVTgqpCEVg@mail.gmail.com>
References: <1375355972-25276-1-git-send-email-vikas.sajjan@linaro.org>
	<5151790.EBRlE0cTxf@flatron>
	<CAF6AEGvmd20MJ_=69kYahkeTySVbhc2GgiUNwCDFXuDWgeGAfQ@mail.gmail.com>
	<CAD025yRZBDh6ssSUbY-mo2mo-WqrUS3R56bD-QrBvaBbWX_HMQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1355097520=="
Return-path: <dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org>
In-Reply-To: <CAD025yRZBDh6ssSUbY-mo2mo-WqrUS3R56bD-QrBvaBbWX_HMQ@mail.gmail.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Sender: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
Errors-To: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
To: Vikas Sajjan <vikas.sajjan@linaro.org>
Cc: "kgene.kim" <kgene.kim@samsung.com>, Patch Tracking <patches@linaro.org>, DRI mailing list <dri-devel@lists.freedesktop.org>, sunil joshi <joshi@samsung.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, linaro-kernel@lists.linaro.org, "arun.kk" <arun.kk@samsung.com>, linux-media@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

--===============1355097520==
Content-Type: multipart/alternative; boundary=001a11c33c02378b3604e2f1e84f

--001a11c33c02378b3604e2f1e84f
Content-Type: text/plain; charset=ISO-8859-1

2013/8/2 Vikas Sajjan <vikas.sajjan@linaro.org>

> Hi Rob,
>
> On 2 August 2013 06:03, Rob Clark <robdclark@gmail.com> wrote:
> > On Thu, Aug 1, 2013 at 7:20 PM, Tomasz Figa <tomasz.figa@gmail.com>
> wrote:
> >> Hi Vikas,
> >>
> >> On Thursday 01 of August 2013 16:49:32 Vikas Sajjan wrote:
> >>> While trying to get boot-logo up on exynos5420 SMDK which has eDP panel
> >>> connected with resolution 2560x1600, following error occured even with
> >>> IOMMU enabled:
> >>> [0.880000] [drm:lowlevel_buffer_allocate] *ERROR* failed to allocate
> >>> buffer. [0.890000] [drm] Initialized exynos 1.0.0 20110530 on minor 0
> >>>
> >>> This patch fixes the issue by adding a check for IOMMU.
> >>>
> >>> Signed-off-by: Vikas Sajjan <vikas.sajjan@linaro.org>
> >>> Signed-off-by: Arun Kumar <arun.kk@samsung.com>
> >>> ---
> >>>  drivers/gpu/drm/exynos/exynos_drm_fbdev.c |    9 ++++++++-
> >>>  1 file changed, 8 insertions(+), 1 deletion(-)
> >>>
> >>> diff --git a/drivers/gpu/drm/exynos/exynos_drm_fbdev.c
> >>> b/drivers/gpu/drm/exynos/exynos_drm_fbdev.c index 8e60bd6..2a86666
> >>> 100644
> >>> --- a/drivers/gpu/drm/exynos/exynos_drm_fbdev.c
> >>> +++ b/drivers/gpu/drm/exynos/exynos_drm_fbdev.c
> >>> @@ -16,6 +16,7 @@
> >>>  #include <drm/drm_crtc.h>
> >>>  #include <drm/drm_fb_helper.h>
> >>>  #include <drm/drm_crtc_helper.h>
> >>> +#include <drm/exynos_drm.h>
> >>>
> >>>  #include "exynos_drm_drv.h"
> >>>  #include "exynos_drm_fb.h"
> >>> @@ -143,6 +144,7 @@ static int exynos_drm_fbdev_create(struct
> >>> drm_fb_helper *helper, struct platform_device *pdev = dev->platformdev;
> >>>       unsigned long size;
> >>>       int ret;
> >>> +     unsigned int flag;
> >>>
> >>>       DRM_DEBUG_KMS("surface width(%d), height(%d) and bpp(%d\n",
> >>>                       sizes->surface_width, sizes->surface_height,
> >>> @@ -166,7 +168,12 @@ static int exynos_drm_fbdev_create(struct
> >>> drm_fb_helper *helper, size = mode_cmd.pitches[0] * mode_cmd.height;
> >>>
> >>>       /* 0 means to allocate physically continuous memory */
> >>> -     exynos_gem_obj = exynos_drm_gem_create(dev, 0, size);
> >>> +     if (!is_drm_iommu_supported(dev))
> >>> +             flag = 0;
> >>> +     else
> >>> +             flag = EXYNOS_BO_NONCONTIG;
> >>
> >> While noncontig memory might be used for devices that support IOMMU,
> there
> >> should be no problem with using contig memory for them, so this seems
> more
> >> like masking the original problem rather than tracking it down.
> >
> > it is probably a good idea to not require contig memory when it is not
> > needed for performance or functionality (and if it is only
> > performance, then fallback gracefully to non-contig).. but yeah, would
> > be good to know if this is masking another issue all the same
> >
>
> Whats happening with CONTIG flag and with IOMMU,  is
>
>  __iommu_alloc_buffer() ---> dma_alloc_from_contiguous() and in this
> function it fails at
> this condition check  if (pageno >= cma->count)
>
> So I tried increasing the CONFIG_CMA_SIZE_MBYTES to 24,  this check
> succeeds and it works well without my patch.
>
> But what about the case where CONFIG_CMA is disabled , yet i want
> bigger memory for a device.
>  I think using IOMMU we can achieve this.
>
>  correct me, if i am wrong.
>
>
I'm on summer vacation so I'm afraid that I cannot test and look into it
but I guess you guy didn't declare CMA region for Exynos drm. And in this
case, the size of CMA declared region is 16MB as default. That is why works
well after increasing default size, CONFIG_CMA_SIZE_MBYTES, to 24MB. And I
mentioned long time ago, we are required to use physically contiguous
memory in case that bootloader uses physically contiguous memory for its
own framebuffer, and kernel wants to share the bootloader's framebuffer
region to resolve flickering issue while booted; that is required for
product. And one question, is there any reason that you guy should use
non-contiguous memory for framebuffer with iommu?

Thanks,
Inki Dae


>
> > BR,
> > -R
> >
> >> Could you check why the allocation fails when requesting contiguous
> >> memory?
> >>
> >> Best regards,
> >> Tomasz
> >>
> >> --
> >> To unsubscribe from this list: send the line "unsubscribe linux-media"
> in
> >> the body of a message to majordomo@vger.kernel.org
> >> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
>
>
> --
> Thanks and Regards
>  Vikas Sajjan
> --
> To unsubscribe from this list: send the line "unsubscribe linux-media" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>

--001a11c33c02378b3604e2f1e84f
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<br><br><div class=3D"gmail_quote">2013/8/2 Vikas Sajjan <span dir=3D"ltr">=
&lt;<a href=3D"mailto:vikas.sajjan@linaro.org" target=3D"_blank">vikas.sajj=
an@linaro.org</a>&gt;</span><br><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;padding-left:1ex;border-left-color:rgb(204,204,204=
);border-left-width:1px;border-left-style:solid">
Hi Rob,<br>
<div><div class=3D"h5"><br>
On 2 August 2013 06:03, Rob Clark &lt;<a href=3D"mailto:robdclark@gmail.com=
">robdclark@gmail.com</a>&gt; wrote:<br>
&gt; On Thu, Aug 1, 2013 at 7:20 PM, Tomasz Figa &lt;<a href=3D"mailto:toma=
sz.figa@gmail.com">tomasz.figa@gmail.com</a>&gt; wrote:<br>
&gt;&gt; Hi Vikas,<br>
&gt;&gt;<br>
&gt;&gt; On Thursday 01 of August 2013 16:49:32 Vikas Sajjan wrote:<br>
&gt;&gt;&gt; While trying to get boot-logo up on exynos5420 SMDK which has =
eDP panel<br>
&gt;&gt;&gt; connected with resolution 2560x1600, following error occured e=
ven with<br>
&gt;&gt;&gt; IOMMU enabled:<br>
&gt;&gt;&gt; [0.880000] [drm:lowlevel_buffer_allocate] *ERROR* failed to al=
locate<br>
&gt;&gt;&gt; buffer. [0.890000] [drm] Initialized exynos 1.0.0 20110530 on =
minor 0<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; This patch fixes the issue by adding a check for IOMMU.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Signed-off-by: Vikas Sajjan &lt;<a href=3D"mailto:vikas.sajjan=
@linaro.org">vikas.sajjan@linaro.org</a>&gt;<br>
&gt;&gt;&gt; Signed-off-by: Arun Kumar &lt;<a href=3D"mailto:arun.kk@samsun=
g.com">arun.kk@samsung.com</a>&gt;<br>
&gt;&gt;&gt; ---<br>
&gt;&gt;&gt; =A0drivers/gpu/drm/exynos/exynos_drm_fbdev.c | =A0 =A09 ++++++=
++-<br>
&gt;&gt;&gt; =A01 file changed, 8 insertions(+), 1 deletion(-)<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; diff --git a/drivers/gpu/drm/exynos/exynos_drm_fbdev.c<br>
&gt;&gt;&gt; b/drivers/gpu/drm/exynos/exynos_drm_fbdev.c index 8e60bd6..2a8=
6666<br>
&gt;&gt;&gt; 100644<br>
&gt;&gt;&gt; --- a/drivers/gpu/drm/exynos/exynos_drm_fbdev.c<br>
&gt;&gt;&gt; +++ b/drivers/gpu/drm/exynos/exynos_drm_fbdev.c<br>
&gt;&gt;&gt; @@ -16,6 +16,7 @@<br>
&gt;&gt;&gt; =A0#include &lt;drm/drm_crtc.h&gt;<br>
&gt;&gt;&gt; =A0#include &lt;drm/drm_fb_helper.h&gt;<br>
&gt;&gt;&gt; =A0#include &lt;drm/drm_crtc_helper.h&gt;<br>
&gt;&gt;&gt; +#include &lt;drm/exynos_drm.h&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; =A0#include &quot;exynos_drm_drv.h&quot;<br>
&gt;&gt;&gt; =A0#include &quot;exynos_drm_fb.h&quot;<br>
&gt;&gt;&gt; @@ -143,6 +144,7 @@ static int exynos_drm_fbdev_create(struct<=
br>
&gt;&gt;&gt; drm_fb_helper *helper, struct platform_device *pdev =3D dev-&g=
t;platformdev;<br>
&gt;&gt;&gt; =A0 =A0 =A0 unsigned long size;<br>
&gt;&gt;&gt; =A0 =A0 =A0 int ret;<br>
&gt;&gt;&gt; + =A0 =A0 unsigned int flag;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; =A0 =A0 =A0 DRM_DEBUG_KMS(&quot;surface width(%d), height(%d) =
and bpp(%d\n&quot;,<br>
&gt;&gt;&gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 sizes-&gt;surface_=
width, sizes-&gt;surface_height,<br>
&gt;&gt;&gt; @@ -166,7 +168,12 @@ static int exynos_drm_fbdev_create(struct=
<br>
&gt;&gt;&gt; drm_fb_helper *helper, size =3D mode_cmd.pitches[0] * mode_cmd=
.height;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; =A0 =A0 =A0 /* 0 means to allocate physically continuous memor=
y */<br>
&gt;&gt;&gt; - =A0 =A0 exynos_gem_obj =3D exynos_drm_gem_create(dev, 0, siz=
e);<br>
&gt;&gt;&gt; + =A0 =A0 if (!is_drm_iommu_supported(dev))<br>
&gt;&gt;&gt; + =A0 =A0 =A0 =A0 =A0 =A0 flag =3D 0;<br>
&gt;&gt;&gt; + =A0 =A0 else<br>
&gt;&gt;&gt; + =A0 =A0 =A0 =A0 =A0 =A0 flag =3D EXYNOS_BO_NONCONTIG;<br>
&gt;&gt;<br>
&gt;&gt; While noncontig memory might be used for devices that support IOMM=
U, there<br>
&gt;&gt; should be no problem with using contig memory for them, so this se=
ems more<br>
&gt;&gt; like masking the original problem rather than tracking it down.<br=
>
&gt;<br>
&gt; it is probably a good idea to not require contig memory when it is not=
<br>
&gt; needed for performance or functionality (and if it is only<br>
&gt; performance, then fallback gracefully to non-contig).. but yeah, would=
<br>
&gt; be good to know if this is masking another issue all the same<br>
&gt;<br>
<br>
</div></div>Whats happening with CONTIG flag and with IOMMU, =A0is<br>
<br>
=A0__iommu_alloc_buffer() ---&gt; dma_alloc_from_contiguous() and in this<b=
r>
function it fails at<br>
this condition check =A0if (pageno &gt;=3D cma-&gt;count)<br>
<br>
So I tried increasing the CONFIG_CMA_SIZE_MBYTES to 24, =A0this check<br>
succeeds and it works well without my patch.<br>
<br>
But what about the case where CONFIG_CMA is disabled , yet i want<br>
bigger memory for a device.<br>
=A0I think using IOMMU we can achieve this.<br>
<br>
=A0correct me, if i am wrong.<br>
<div class=3D"im HOEnZb"><br></div></blockquote><div>=A0</div><div>I&#39;m =
on summer vacation=A0so I&#39;m afraid that I cannot=A0test and look into i=
t but I guess you guy didn&#39;t declare=A0CMA=A0region for Exynos drm. And=
 in this case, the size of CMA declared region is 16MB as default.=A0That i=
s why works well after increasing default size, CONFIG_CMA_SIZE_MBYTES, to =
24MB. And I mentioned long time ago, we are required to use physically cont=
iguous memory in case that bootloader=A0uses physically contiguous memory f=
or its own framebuffer, and kernel wants to share the bootloader&#39;s fram=
ebuffer region to resolve flickering issue while booted; that is required f=
or product. And one question, is there any reason that you guy should=A0use=
 non-contiguous memory for framebuffer with iommu?</div>
<div>=A0</div><div>Thanks,</div><div>Inki Dae</div><div>=A0</div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;padding-left:1ex;=
border-left-color:rgb(204,204,204);border-left-width:1px;border-left-style:=
solid">
<div class=3D"im HOEnZb">
<br>
&gt; BR,<br>
&gt; -R<br>
&gt;<br>
&gt;&gt; Could you check why the allocation fails when requesting contiguou=
s<br>
&gt;&gt; memory?<br>
&gt;&gt;<br>
&gt;&gt; Best regards,<br>
&gt;&gt; Tomasz<br>
&gt;&gt;<br>
&gt;&gt; --<br>
&gt;&gt; To unsubscribe from this list: send the line &quot;unsubscribe lin=
ux-media&quot; in<br>
&gt;&gt; the body of a message to <a href=3D"mailto:majordomo@vger.kernel.o=
rg">majordomo@vger.kernel.org</a><br>
&gt;&gt; More majordomo info at =A0<a href=3D"http://vger.kernel.org/majord=
omo-info.html" target=3D"_blank">http://vger.kernel.org/majordomo-info.html=
</a><br>
<br>
<br>
<br>
--<br>
</div><div class=3D"im HOEnZb">Thanks and Regards<br>
=A0Vikas Sajjan<br>
</div><div class=3D"HOEnZb"><div class=3D"h5">--<br>
To unsubscribe from this list: send the line &quot;unsubscribe linux-media&=
quot; in<br>
the body of a message to <a href=3D"mailto:majordomo@vger.kernel.org">major=
domo@vger.kernel.org</a><br>
More majordomo info at =A0<a href=3D"http://vger.kernel.org/majordomo-info.=
html" target=3D"_blank">http://vger.kernel.org/majordomo-info.html</a><br>
</div></div></blockquote></div><br>

--001a11c33c02378b3604e2f1e84f--

--===============1355097520==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
http://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1355097520==--
