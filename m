From: Inki Dae <daeinki@gmail.com>
Subject: Re: [PATCH v2] exynos-drm: Fix unsupported GEM memory type error
 message to be clear
Date: Tue, 9 Aug 2016 22:32:12 +0900
Message-ID: <CAAQKjZMXf4C7e1isAHBCMxNps7xG2V_Fx66+Du8Ywhp02qcJ9A@mail.gmail.com>
References: <1470700100-13306-1-git-send-email-shuahkh@osg.samsung.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0805995474=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1470700100-13306-1-git-send-email-shuahkh@osg.samsung.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Shuah Khan <shuahkh@osg.samsung.com>
Cc: =?UTF-8?Q?Krzysztof_Koz=C5=82owski?= <k.kozlowski@samsung.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Seung-Woo Kim <sw0312.kim@samsung.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, DRI mailing list <dri-devel@lists.freedesktop.org>, Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: linux-samsung-soc@vger.kernel.org

--===============0805995474==
Content-Type: multipart/alternative; boundary=001a11466834d87e840539a391d6

--001a11466834d87e840539a391d6
Content-Type: text/plain; charset=UTF-8

Picked it up. :)

Thanks,
Inki Dae


2016-08-09 8:48 GMT+09:00 Shuah Khan <shuahkh@osg.samsung.com>:

> Fix unsupported GEM memory type error message to include the memory type
> information.
>
> Signed-off-by: Shuah Khan <shuahkh@osg.samsung.com>
> ---
> Changes since v1:
> -- Comment changed to read clearly
>
>  drivers/gpu/drm/exynos/exynos_drm_fb.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_fb.c
> b/drivers/gpu/drm/exynos/exynos_drm_fb.c
> index e016640..40ce841 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_fb.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_fb.c
> @@ -55,11 +55,11 @@ static int check_fb_gem_memory_type(struct drm_device
> *drm_dev,
>         flags = exynos_gem->flags;
>
>         /*
> -        * without iommu support, not support physically non-continuous
> memory
> -        * for framebuffer.
> +        * Physically non-contiguous memory type for framebuffer is not
> +        * supported without IOMMU.
>          */
>         if (IS_NONCONTIG_BUFFER(flags)) {
> -               DRM_ERROR("cannot use this gem memory type for fb.\n");
> +               DRM_ERROR("Non-contiguous GEM memory is not supported.\n");
>                 return -EINVAL;
>         }
>
> --
> 2.7.4
>
> --
> To unsubscribe from this list: send the line "unsubscribe
> linux-samsung-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>

--001a11466834d87e840539a391d6
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div>Picked it up. :)<br><br></div>Thanks,<br></div>I=
nki Dae<br><div><div><div><div><div><div><br><div class=3D"gmail_extra"><br=
><div class=3D"gmail_quote">2016-08-09 8:48 GMT+09:00 Shuah Khan <span dir=
=3D"ltr">&lt;<a href=3D"mailto:shuahkh@osg.samsung.com" target=3D"_blank">s=
huahkh@osg.samsung.com</a>&gt;</span>:<br><blockquote class=3D"gmail_quote"=
 style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><s=
pan class=3D"">Fix unsupported GEM memory type error message to include the=
 memory type<br>
information.<br>
<br>
Signed-off-by: Shuah Khan &lt;<a href=3D"mailto:shuahkh@osg.samsung.com">sh=
uahkh@osg.samsung.com</a>&gt;<br>
---<br>
</span>Changes since v1:<br>
-- Comment changed to read clearly<br>
<br>
=C2=A0drivers/gpu/drm/exynos/exynos_<wbr>drm_fb.c | 6 +++---<br>
=C2=A01 file changed, 3 insertions(+), 3 deletions(-)<br>
<br>
diff --git a/drivers/gpu/drm/exynos/<wbr>exynos_drm_fb.c b/drivers/gpu/drm/=
exynos/<wbr>exynos_drm_fb.c<br>
index e016640..40ce841 100644<br>
<span class=3D"">--- a/drivers/gpu/drm/exynos/<wbr>exynos_drm_fb.c<br>
+++ b/drivers/gpu/drm/exynos/<wbr>exynos_drm_fb.c<br>
@@ -55,11 +55,11 @@ static int check_fb_gem_memory_type(<wbr>struct drm_dev=
ice *drm_dev,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 flags =3D exynos_gem-&gt;flags;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 * without iommu support, not support physicall=
y non-continuous memory<br>
</span>-=C2=A0 =C2=A0 =C2=A0 =C2=A0 * for framebuffer.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * Physically non-contiguous memory type for fr=
amebuffer is not<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * supported without IOMMU.<br>
<span class=3D"">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (IS_NONCONTIG_BUFFER(flags)) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DRM_ERROR(&quot;can=
not use this gem memory type for fb.\n&quot;);<br>
</span>+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DRM_ERROR(&q=
uot;Non-contiguous GEM memory is not supported.\n&quot;);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -EINVAL;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
2.7.4<br>
</font></span><div class=3D"HOEnZb"><div class=3D"h5"><br>
--<br>
To unsubscribe from this list: send the line &quot;unsubscribe linux-samsun=
g-soc&quot; in<br>
the body of a message to <a href=3D"mailto:majordomo@vger.kernel.org">major=
domo@vger.kernel.org</a><br>
More majordomo info at=C2=A0 <a href=3D"http://vger.kernel.org/majordomo-in=
fo.html" rel=3D"noreferrer" target=3D"_blank">http://vger.kernel.org/<wbr>m=
ajordomo-info.html</a><br>
</div></div></blockquote></div><br></div></div></div></div></div></div></di=
v></div>

--001a11466834d87e840539a391d6--

--===============0805995474==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============0805995474==--
