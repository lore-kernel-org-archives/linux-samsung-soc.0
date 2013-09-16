From: Inki Dae <inki.dae@samsung.com>
Subject: Re: [PATCH] drm/exynos: fix return value check in
	lowlevel_buffer_allocate()
Date: Mon, 16 Sep 2013 22:04:41 +0900
Message-ID: <CAAQKjZN0iH71ODnm=rvdB8xN9K9u+TRXnabPQ86ZSVA6wMnC0A@mail.gmail.com>
References: <CAPgLHd-vMjfQEBfun=c8j7x-FPx_pGoTvOBBwKtmF+LTQjVNQw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1607687262=="
Return-path: <dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org>
In-Reply-To: <CAPgLHd-vMjfQEBfun=c8j7x-FPx_pGoTvOBBwKtmF+LTQjVNQw@mail.gmail.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Sender: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
Errors-To: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
To: Wei Yongjun <weiyj.lk@gmail.com>
Cc: Kukjin Kim <kgene.kim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, yongjun_wei@trendmicro.com.cn, DRI mailing list <dri-devel@lists.freedesktop.org>, Kyungmin Park <kyungmin.park@samsung.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: linux-samsung-soc@vger.kernel.org

--===============1607687262==
Content-Type: multipart/alternative; boundary=001a1133e330ed88c904e67fd85e

--001a1133e330ed88c904e67fd85e
Content-Type: text/plain; charset=ISO-8859-1

Applied.

Thanks,
Inki Dae


2013/9/11 Wei Yongjun <weiyj.lk@gmail.com>

> From: Wei Yongjun <yongjun_wei@trendmicro.com.cn>
>
> In case of error, the function drm_prime_pages_to_sg() returns ERR_PTR()
> and never returns NULL. The NULL test in the return value check should
> be replaced with IS_ERR().
>
> Signed-off-by: Wei Yongjun <yongjun_wei@trendmicro.com.cn>
> ---
>  drivers/gpu/drm/exynos/exynos_drm_buf.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_buf.c
> b/drivers/gpu/drm/exynos/exynos_drm_buf.c
> index 3445a0f..e3ee833 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_buf.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_buf.c
> @@ -90,9 +90,9 @@ static int lowlevel_buffer_allocate(struct drm_device
> *dev,
>         }
>
>         buf->sgt = drm_prime_pages_to_sg(buf->pages, nr_pages);
> -       if (!buf->sgt) {
> +       if (IS_ERR(buf->sgt)) {
>                 DRM_ERROR("failed to get sg table.\n");
> -               ret = -ENOMEM;
> +               ret = PTR_ERR(buf->sgt);
>                 goto err_free_attrs;
>         }
>
>
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
>

--001a1133e330ed88c904e67fd85e
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Applied.<br><br></div>Thanks,<br>Inki Dae<br></div><d=
iv class=3D"gmail_extra"><br><br><div class=3D"gmail_quote">2013/9/11 Wei Y=
ongjun <span dir=3D"ltr">&lt;<a href=3D"mailto:weiyj.lk@gmail.com" target=
=3D"_blank">weiyj.lk@gmail.com</a>&gt;</span><br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">From: Wei Yongjun &lt;<a href=3D"mailto:yong=
jun_wei@trendmicro.com.cn">yongjun_wei@trendmicro.com.cn</a>&gt;<br>
<br>
In case of error, the function drm_prime_pages_to_sg() returns ERR_PTR()<br=
>
and never returns NULL. The NULL test in the return value check should<br>
be replaced with IS_ERR().<br>
<br>
Signed-off-by: Wei Yongjun &lt;<a href=3D"mailto:yongjun_wei@trendmicro.com=
.cn">yongjun_wei@trendmicro.com.cn</a>&gt;<br>
---<br>
=A0drivers/gpu/drm/exynos/exynos_drm_buf.c | 4 ++--<br>
=A01 file changed, 2 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/drivers/gpu/drm/exynos/exynos_drm_buf.c b/drivers/gpu/drm/exyn=
os/exynos_drm_buf.c<br>
index 3445a0f..e3ee833 100644<br>
--- a/drivers/gpu/drm/exynos/exynos_drm_buf.c<br>
+++ b/drivers/gpu/drm/exynos/exynos_drm_buf.c<br>
@@ -90,9 +90,9 @@ static int lowlevel_buffer_allocate(struct drm_device *de=
v,<br>
=A0 =A0 =A0 =A0 }<br>
<br>
=A0 =A0 =A0 =A0 buf-&gt;sgt =3D drm_prime_pages_to_sg(buf-&gt;pages, nr_pag=
es);<br>
- =A0 =A0 =A0 if (!buf-&gt;sgt) {<br>
+ =A0 =A0 =A0 if (IS_ERR(buf-&gt;sgt)) {<br>
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 DRM_ERROR(&quot;failed to get sg table.\n&q=
uot;);<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 ret =3D -ENOMEM;<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 ret =3D PTR_ERR(buf-&gt;sgt);<br>
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto err_free_attrs;<br>
=A0 =A0 =A0 =A0 }<br>
<br>
<br>
<br>
_______________________________________________<br>
linux-arm-kernel mailing list<br>
<a href=3D"mailto:linux-arm-kernel@lists.infradead.org">linux-arm-kernel@li=
sts.infradead.org</a><br>
<a href=3D"http://lists.infradead.org/mailman/listinfo/linux-arm-kernel" ta=
rget=3D"_blank">http://lists.infradead.org/mailman/listinfo/linux-arm-kerne=
l</a><br>
</blockquote></div><br></div>

--001a1133e330ed88c904e67fd85e--

--===============1607687262==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
http://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1607687262==--
