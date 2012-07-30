From: Leela Krishna Amudala <l.krishna@samsung.com>
Subject: Re: [PATCH 3/3] driver: Include the modified FIMD header file
Date: Mon, 30 Jul 2012 14:18:07 +0530
Message-ID: <CAL1wa8fDhZ1pqvxOFsm+jG4rd8HRobGg-2NHh0TeAjmB-=kHow@mail.gmail.com>
References: <1343637905-17764-1-git-send-email-l.krishna@samsung.com>
	<1343637905-17764-4-git-send-email-l.krishna@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1469378723=="
Return-path: <dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org>
In-Reply-To: <1343637905-17764-4-git-send-email-l.krishna@samsung.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Sender: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
Errors-To: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-fbdev@vger.kernel.org, linux-samsung-soc@vger.kernel.org, jg1.han@samsung.com, joshi@samsung.com, dri-devel@lists.freedesktop.org, kgene.kim@samsung.com, ben-linux@fluff.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

--===============1469378723==
Content-Type: multipart/alternative; boundary=047d7b339f4516bdf904c6082049

--047d7b339f4516bdf904c6082049
Content-Type: text/plain; charset=ISO-8859-1

Adding Marek

On Mon, Jul 30, 2012 at 2:15 PM, Leela Krishna Amudala <
l.krishna@samsung.com> wrote:

> The fimd register headers have been moved to include/video/
> hence, modifying the driver files accordingly.
>
> Signed-off-by: Leela Krishna Amudala <l.krishna@samsung.com>
> ---
>  drivers/gpu/drm/exynos/exynos_drm_fimd.c |    2 +-
>  drivers/video/s3c-fb.c                   |    2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
> b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
> index 29fdbfe..8da90f9 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
> @@ -20,7 +20,7 @@
>  #include <linux/pm_runtime.h>
>
>  #include <drm/exynos_drm.h>
> -#include <plat/regs-fb-v4.h>
> +#include <video/samsung_fimd.h>
>
>  #include "exynos_drm_drv.h"
>  #include "exynos_drm_fbdev.h"
> diff --git a/drivers/video/s3c-fb.c b/drivers/video/s3c-fb.c
> index 69bf9d0..1226fdd 100644
> --- a/drivers/video/s3c-fb.c
> +++ b/drivers/video/s3c-fb.c
> @@ -26,7 +26,7 @@
>  #include <linux/pm_runtime.h>
>
>  #include <mach/map.h>
> -#include <plat/regs-fb-v4.h>
> +#include <video/samsung_fimd.h>
>  #include <plat/fb.h>
>
>  /* This driver will export a number of framebuffer interfaces depending
> --
> 1.7.0.4
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-fbdev" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>

--047d7b339f4516bdf904c6082049
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Adding Marek<br><br>
<div class=3D"gmail_quote">On Mon, Jul 30, 2012 at 2:15 PM, Leela Krishna A=
mudala <span dir=3D"ltr">&lt;<a href=3D"mailto:l.krishna@samsung.com" targe=
t=3D"_blank">l.krishna@samsung.com</a>&gt;</span> wrote:<br>
<blockquote style=3D"BORDER-LEFT:#ccc 1px solid;MARGIN:0px 0px 0px 0.8ex;PA=
DDING-LEFT:1ex" class=3D"gmail_quote">The fimd register headers have been m=
oved to include/video/<br>hence, modifying the driver files accordingly.<br=
>

<br>Signed-off-by: Leela Krishna Amudala &lt;<a href=3D"mailto:l.krishna@sa=
msung.com">l.krishna@samsung.com</a>&gt;<br>---<br>=A0drivers/gpu/drm/exyno=
s/exynos_drm_fimd.c | =A0 =A02 +-<br>=A0drivers/video/s3c-fb.c =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 | =A0 =A02 +-<br>

=A02 files changed, 2 insertions(+), 2 deletions(-)<br><br>diff --git a/dri=
vers/gpu/drm/exynos/exynos_drm_fimd.c b/drivers/gpu/drm/exynos/exynos_drm_f=
imd.c<br>index 29fdbfe..8da90f9 100644<br>--- a/drivers/gpu/drm/exynos/exyn=
os_drm_fimd.c<br>

+++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c<br>@@ -20,7 +20,7 @@<br>=A0#=
include &lt;linux/pm_runtime.h&gt;<br><br>=A0#include &lt;drm/exynos_drm.h&=
gt;<br>-#include &lt;plat/regs-fb-v4.h&gt;<br>+#include &lt;video/samsung_f=
imd.h&gt;<br>

<br>=A0#include &quot;exynos_drm_drv.h&quot;<br>=A0#include &quot;exynos_dr=
m_fbdev.h&quot;<br>diff --git a/drivers/video/s3c-fb.c b/drivers/video/s3c-=
fb.c<br>index 69bf9d0..1226fdd 100644<br>--- a/drivers/video/s3c-fb.c<br>++=
+ b/drivers/video/s3c-fb.c<br>

@@ -26,7 +26,7 @@<br>=A0#include &lt;linux/pm_runtime.h&gt;<br><br>=A0#incl=
ude &lt;mach/map.h&gt;<br>-#include &lt;plat/regs-fb-v4.h&gt;<br>+#include =
&lt;video/samsung_fimd.h&gt;<br>=A0#include &lt;plat/fb.h&gt;<br><br>=A0/* =
This driver will export a number of framebuffer interfaces depending<br>

<span class=3D"HOEnZb"><font color=3D"#888888">--<br>1.7.0.4<br><br>--<br>T=
o unsubscribe from this list: send the line &quot;unsubscribe linux-fbdev&q=
uot; in<br>the body of a message to <a href=3D"mailto:majordomo@vger.kernel=
.org">majordomo@vger.kernel.org</a><br>

More majordomo info at =A0<a href=3D"http://vger.kernel.org/majordomo-info.=
html" target=3D"_blank">http://vger.kernel.org/majordomo-info.html</a><br><=
/font></span></blockquote></div><br>

--047d7b339f4516bdf904c6082049--

--===============1469378723==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
http://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1469378723==--
