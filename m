From: Leela Krishna Amudala <l.krishna@samsung.com>
Subject: Re: [PATCH 2/3] arm: samsung: Include the modified FIMD header file
Date: Mon, 30 Jul 2012 14:17:32 +0530
Message-ID: <CAL1wa8eVO5fC5D46oJYJN1-fmvMS6tU3-zT24KKcBcHGcsJtSg@mail.gmail.com>
References: <1343637905-17764-1-git-send-email-l.krishna@samsung.com>
	<1343637905-17764-3-git-send-email-l.krishna@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0965618575=="
Return-path: <dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org>
In-Reply-To: <1343637905-17764-3-git-send-email-l.krishna@samsung.com>
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

--===============0965618575==
Content-Type: multipart/alternative; boundary=f46d04287a170a7bf604c6081eb3

--f46d04287a170a7bf604c6081eb3
Content-Type: text/plain; charset=ISO-8859-1

Adding Marek.

On Mon, Jul 30, 2012 at 2:15 PM, Leela Krishna Amudala <
l.krishna@samsung.com> wrote:

> The fimd register headers have been moved to include/video/
> hence, modifying the machine files accordingly.
>
> Signed-off-by: Leela Krishna Amudala <l.krishna@samsung.com>
> ---
>  arch/arm/mach-exynos/mach-nuri.c           |    2 +-
>  arch/arm/mach-exynos/mach-origen.c         |    2 +-
>  arch/arm/mach-exynos/mach-smdk4x12.c       |    2 +-
>  arch/arm/mach-exynos/mach-smdkv310.c       |    2 +-
>  arch/arm/mach-exynos/mach-universal_c210.c |    2 +-
>  arch/arm/mach-exynos/setup-fimd0.c         |    2 +-
>  arch/arm/mach-s3c24xx/mach-smdk2416.c      |    2 +-
>  arch/arm/mach-s3c64xx/mach-anw6410.c       |    2 +-
>  arch/arm/mach-s3c64xx/mach-crag6410.c      |    2 +-
>  arch/arm/mach-s3c64xx/mach-hmt.c           |    2 +-
>  arch/arm/mach-s3c64xx/mach-mini6410.c      |    2 +-
>  arch/arm/mach-s3c64xx/mach-ncp.c           |    2 +-
>  arch/arm/mach-s3c64xx/mach-real6410.c      |    2 +-
>  arch/arm/mach-s3c64xx/mach-smartq5.c       |    2 +-
>  arch/arm/mach-s3c64xx/mach-smartq7.c       |    2 +-
>  arch/arm/mach-s3c64xx/mach-smdk6410.c      |    2 +-
>  arch/arm/mach-s5p64x0/mach-smdk6440.c      |    2 +-
>  arch/arm/mach-s5p64x0/mach-smdk6450.c      |    2 +-
>  arch/arm/mach-s5pc100/mach-smdkc100.c      |    2 +-
>  arch/arm/mach-s5pv210/mach-aquila.c        |    2 +-
>  arch/arm/mach-s5pv210/mach-goni.c          |    2 +-
>  arch/arm/mach-s5pv210/mach-smdkv210.c      |    2 +-
>  22 files changed, 22 insertions(+), 22 deletions(-)
>
> diff --git a/arch/arm/mach-exynos/mach-nuri.c
> b/arch/arm/mach-exynos/mach-nuri.c
> index f98a83a..573a0c4 100644
> --- a/arch/arm/mach-exynos/mach-nuri.c
> +++ b/arch/arm/mach-exynos/mach-nuri.c
> @@ -39,7 +39,7 @@
>  #include <asm/mach-types.h>
>
>  #include <plat/adc.h>
> -#include <plat/regs-fb-v4.h>
> +#include <video/samsung_fimd.h>
>  #include <plat/regs-serial.h>
>  #include <plat/cpu.h>
>  #include <plat/devs.h>
> diff --git a/arch/arm/mach-exynos/mach-origen.c
> b/arch/arm/mach-exynos/mach-origen.c
> index 5a12dc2..c69707e 100644
> --- a/arch/arm/mach-exynos/mach-origen.c
> +++ b/arch/arm/mach-exynos/mach-origen.c
> @@ -31,7 +31,7 @@
>  #include <video/platform_lcd.h>
>
>  #include <plat/regs-serial.h>
> -#include <plat/regs-fb-v4.h>
> +#include <video/samsung_fimd.h>
>  #include <plat/cpu.h>
>  #include <plat/devs.h>
>  #include <plat/sdhci.h>
> diff --git a/arch/arm/mach-exynos/mach-smdk4x12.c
> b/arch/arm/mach-exynos/mach-smdk4x12.c
> index b26beb1..8a8acff 100644
> --- a/arch/arm/mach-exynos/mach-smdk4x12.c
> +++ b/arch/arm/mach-exynos/mach-smdk4x12.c
> @@ -35,7 +35,7 @@
>  #include <plat/iic.h>
>  #include <plat/keypad.h>
>  #include <plat/mfc.h>
> -#include <plat/regs-fb.h>
> +#include <video/samsung_fimd.h>
>  #include <plat/regs-serial.h>
>  #include <plat/sdhci.h>
>
> diff --git a/arch/arm/mach-exynos/mach-smdkv310.c
> b/arch/arm/mach-exynos/mach-smdkv310.c
> index 3cfa688..c2df6e8 100644
> --- a/arch/arm/mach-exynos/mach-smdkv310.c
> +++ b/arch/arm/mach-exynos/mach-smdkv310.c
> @@ -28,7 +28,7 @@
>  #include <video/platform_lcd.h>
>  #include <plat/regs-serial.h>
>  #include <plat/regs-srom.h>
> -#include <plat/regs-fb-v4.h>
> +#include <video/samsung_fimd.h>
>  #include <plat/cpu.h>
>  #include <plat/devs.h>
>  #include <plat/fb.h>
> diff --git a/arch/arm/mach-exynos/mach-universal_c210.c
> b/arch/arm/mach-exynos/mach-universal_c210.c
> index 4d1f40d..e6fb471 100644
> --- a/arch/arm/mach-exynos/mach-universal_c210.c
> +++ b/arch/arm/mach-exynos/mach-universal_c210.c
> @@ -39,7 +39,7 @@
>  #include <plat/fb.h>
>  #include <plat/mfc.h>
>  #include <plat/sdhci.h>
> -#include <plat/regs-fb-v4.h>
> +#include <video/samsung_fimd.h>
>  #include <plat/fimc-core.h>
>  #include <plat/s5p-time.h>
>  #include <plat/camport.h>
> diff --git a/arch/arm/mach-exynos/setup-fimd0.c
> b/arch/arm/mach-exynos/setup-fimd0.c
> index 07a6dbe..53c4c51 100644
> --- a/arch/arm/mach-exynos/setup-fimd0.c
> +++ b/arch/arm/mach-exynos/setup-fimd0.c
> @@ -14,7 +14,7 @@
>  #include <linux/gpio.h>
>
>  #include <plat/gpio-cfg.h>
> -#include <plat/regs-fb-v4.h>
> +#include <video/samsung_fimd.h>
>
>  #include <mach/map.h>
>
> diff --git a/arch/arm/mach-s3c24xx/mach-smdk2416.c
> b/arch/arm/mach-s3c24xx/mach-smdk2416.c
> index c3100a0..c8d5f51 100644
> --- a/arch/arm/mach-s3c24xx/mach-smdk2416.c
> +++ b/arch/arm/mach-s3c24xx/mach-smdk2416.c
> @@ -52,7 +52,7 @@
>  #include <plat/udc.h>
>  #include <linux/platform_data/s3c-hsudc.h>
>
> -#include <plat/regs-fb-v4.h>
> +#include <video/samsung_fimd.h>
>  #include <plat/fb.h>
>
>  #include <plat/common-smdk.h>
> diff --git a/arch/arm/mach-s3c64xx/mach-anw6410.c
> b/arch/arm/mach-s3c64xx/mach-anw6410.c
> index ffa29dd..27e3087 100644
> --- a/arch/arm/mach-s3c64xx/mach-anw6410.c
> +++ b/arch/arm/mach-s3c64xx/mach-anw6410.c
> @@ -44,7 +44,7 @@
>  #include <plat/regs-serial.h>
>  #include <plat/iic.h>
>  #include <plat/fb.h>
> -#include <plat/regs-fb-v4.h>
> +#include <video/samsung_fimd.h>
>
>  #include <plat/clock.h>
>  #include <plat/devs.h>
> diff --git a/arch/arm/mach-s3c64xx/mach-crag6410.c
> b/arch/arm/mach-s3c64xx/mach-crag6410.c
> index 09cd812..66e8c69 100644
> --- a/arch/arm/mach-s3c64xx/mach-crag6410.c
> +++ b/arch/arm/mach-s3c64xx/mach-crag6410.c
> @@ -57,7 +57,7 @@
>  #include <mach/regs-gpio-memport.h>
>
>  #include <plat/regs-serial.h>
> -#include <plat/regs-fb-v4.h>
> +#include <video/samsung_fimd.h>
>  #include <plat/fb.h>
>  #include <plat/sdhci.h>
>  #include <plat/gpio-cfg.h>
> diff --git a/arch/arm/mach-s3c64xx/mach-hmt.c
> b/arch/arm/mach-s3c64xx/mach-hmt.c
> index 6890881..ab78c5e 100644
> --- a/arch/arm/mach-s3c64xx/mach-hmt.c
> +++ b/arch/arm/mach-s3c64xx/mach-hmt.c
> @@ -41,7 +41,7 @@
>  #include <plat/clock.h>
>  #include <plat/devs.h>
>  #include <plat/cpu.h>
> -#include <plat/regs-fb-v4.h>
> +#include <video/samsung_fimd.h>
>
>  #include "common.h"
>
> diff --git a/arch/arm/mach-s3c64xx/mach-mini6410.c
> b/arch/arm/mach-s3c64xx/mach-mini6410.c
> index 5539a25..4b9a9ff 100644
> --- a/arch/arm/mach-s3c64xx/mach-mini6410.c
> +++ b/arch/arm/mach-s3c64xx/mach-mini6410.c
> @@ -41,7 +41,7 @@
>  #include <plat/nand.h>
>  #include <plat/regs-serial.h>
>  #include <plat/ts.h>
> -#include <plat/regs-fb-v4.h>
> +#include <video/samsung_fimd.h>
>
>  #include <video/platform_lcd.h>
>
> diff --git a/arch/arm/mach-s3c64xx/mach-ncp.c
> b/arch/arm/mach-s3c64xx/mach-ncp.c
> index cad2e05..d4c8af0 100644
> --- a/arch/arm/mach-s3c64xx/mach-ncp.c
> +++ b/arch/arm/mach-s3c64xx/mach-ncp.c
> @@ -43,7 +43,7 @@
>  #include <plat/clock.h>
>  #include <plat/devs.h>
>  #include <plat/cpu.h>
> -#include <plat/regs-fb-v4.h>
> +#include <video/samsung_fimd.h>
>
>  #include "common.h"
>
> diff --git a/arch/arm/mach-s3c64xx/mach-real6410.c
> b/arch/arm/mach-s3c64xx/mach-real6410.c
> index 326b216..05f05d2 100644
> --- a/arch/arm/mach-s3c64xx/mach-real6410.c
> +++ b/arch/arm/mach-s3c64xx/mach-real6410.c
> @@ -42,7 +42,7 @@
>  #include <plat/nand.h>
>  #include <plat/regs-serial.h>
>  #include <plat/ts.h>
> -#include <plat/regs-fb-v4.h>
> +#include <video/samsung_fimd.h>
>
>  #include <video/platform_lcd.h>
>
> diff --git a/arch/arm/mach-s3c64xx/mach-smartq5.c
> b/arch/arm/mach-s3c64xx/mach-smartq5.c
> index d6266d8..aa225ff 100644
> --- a/arch/arm/mach-s3c64xx/mach-smartq5.c
> +++ b/arch/arm/mach-s3c64xx/mach-smartq5.c
> @@ -28,7 +28,7 @@
>  #include <plat/devs.h>
>  #include <plat/fb.h>
>  #include <plat/gpio-cfg.h>
> -#include <plat/regs-fb-v4.h>
> +#include <video/samsung_fimd.h>
>
>  #include "common.h"
>  #include "mach-smartq.h"
> diff --git a/arch/arm/mach-s3c64xx/mach-smartq7.c
> b/arch/arm/mach-s3c64xx/mach-smartq7.c
> index 0957d2a..6e9c070 100644
> --- a/arch/arm/mach-s3c64xx/mach-smartq7.c
> +++ b/arch/arm/mach-s3c64xx/mach-smartq7.c
> @@ -28,7 +28,7 @@
>  #include <plat/devs.h>
>  #include <plat/fb.h>
>  #include <plat/gpio-cfg.h>
> -#include <plat/regs-fb-v4.h>
> +#include <video/samsung_fimd.h>
>
>  #include "common.h"
>  #include "mach-smartq.h"
> diff --git a/arch/arm/mach-s3c64xx/mach-smdk6410.c
> b/arch/arm/mach-s3c64xx/mach-smdk6410.c
> index 0fe4f15..1803192 100644
> --- a/arch/arm/mach-s3c64xx/mach-smdk6410.c
> +++ b/arch/arm/mach-s3c64xx/mach-smdk6410.c
> @@ -72,7 +72,7 @@
>  #include <plat/ts.h>
>  #include <plat/keypad.h>
>  #include <plat/backlight.h>
> -#include <plat/regs-fb-v4.h>
> +#include <video/samsung_fimd.h>
>
>  #include "common.h"
>
> diff --git a/arch/arm/mach-s5p64x0/mach-smdk6440.c
> b/arch/arm/mach-s5p64x0/mach-smdk6440.c
> index 92fefad..0db0bdd 100644
> --- a/arch/arm/mach-s5p64x0/mach-smdk6440.c
> +++ b/arch/arm/mach-s5p64x0/mach-smdk6440.c
> @@ -52,7 +52,7 @@
>  #include <plat/s5p-time.h>
>  #include <plat/backlight.h>
>  #include <plat/fb.h>
> -#include <plat/regs-fb.h>
> +#include <video/smasung_fimd.h>
>  #include <plat/sdhci.h>
>
>  #include "common.h"
> diff --git a/arch/arm/mach-s5p64x0/mach-smdk6450.c
> b/arch/arm/mach-s5p64x0/mach-smdk6450.c
> index e2335ec..c641d33 100644
> --- a/arch/arm/mach-s5p64x0/mach-smdk6450.c
> +++ b/arch/arm/mach-s5p64x0/mach-smdk6450.c
> @@ -52,7 +52,7 @@
>  #include <plat/s5p-time.h>
>  #include <plat/backlight.h>
>  #include <plat/fb.h>
> -#include <plat/regs-fb.h>
> +#include <video/samsung_fimd.h>
>  #include <plat/sdhci.h>
>
>  #include "common.h"
> diff --git a/arch/arm/mach-s5pc100/mach-smdkc100.c
> b/arch/arm/mach-s5pc100/mach-smdkc100.c
> index 0c3ae38..e4df3d0 100644
> --- a/arch/arm/mach-s5pc100/mach-smdkc100.c
> +++ b/arch/arm/mach-s5pc100/mach-smdkc100.c
> @@ -51,7 +51,7 @@
>  #include <plat/ts.h>
>  #include <plat/audio.h>
>  #include <plat/backlight.h>
> -#include <plat/regs-fb-v4.h>
> +#include <video/samsung_fimd.h>
>
>  #include "common.h"
>
> diff --git a/arch/arm/mach-s5pv210/mach-aquila.c
> b/arch/arm/mach-s5pv210/mach-aquila.c
> index 78028df..8cbe4ac 100644
> --- a/arch/arm/mach-s5pv210/mach-aquila.c
> +++ b/arch/arm/mach-s5pv210/mach-aquila.c
> @@ -39,7 +39,7 @@
>  #include <plat/fimc-core.h>
>  #include <plat/sdhci.h>
>  #include <plat/s5p-time.h>
> -#include <plat/regs-fb-v4.h>
> +#include <video/samsung_fimd.h>
>
>  #include "common.h"
>
> diff --git a/arch/arm/mach-s5pv210/mach-goni.c
> b/arch/arm/mach-s5pv210/mach-goni.c
> index 822a559..e799a02 100644
> --- a/arch/arm/mach-s5pv210/mach-goni.c
> +++ b/arch/arm/mach-s5pv210/mach-goni.c
> @@ -49,7 +49,7 @@
>  #include <plat/clock.h>
>  #include <plat/s5p-time.h>
>  #include <plat/mfc.h>
> -#include <plat/regs-fb-v4.h>
> +#include <video/samsung_fimd.h>
>  #include <plat/camport.h>
>
>  #include <media/v4l2-mediabus.h>
> diff --git a/arch/arm/mach-s5pv210/mach-smdkv210.c
> b/arch/arm/mach-s5pv210/mach-smdkv210.c
> index 918b23d..3c569e5 100644
> --- a/arch/arm/mach-s5pv210/mach-smdkv210.c
> +++ b/arch/arm/mach-s5pv210/mach-smdkv210.c
> @@ -46,7 +46,7 @@
>  #include <plat/fb.h>
>  #include <plat/s5p-time.h>
>  #include <plat/backlight.h>
> -#include <plat/regs-fb-v4.h>
> +#include <video/samsung_fimd.h>
>  #include <plat/mfc.h>
>  #include <plat/clock.h>
>
> --
> 1.7.0.4
>
> --
> To unsubscribe from this list: send the line "unsubscribe
> linux-samsung-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>

--f46d04287a170a7bf604c6081eb3
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Adding Marek.<br><br>
<div class=3D"gmail_quote">On Mon, Jul 30, 2012 at 2:15 PM, Leela Krishna A=
mudala <span dir=3D"ltr">&lt;<a href=3D"mailto:l.krishna@samsung.com" targe=
t=3D"_blank">l.krishna@samsung.com</a>&gt;</span> wrote:<br>
<blockquote style=3D"BORDER-LEFT:#ccc 1px solid;MARGIN:0px 0px 0px 0.8ex;PA=
DDING-LEFT:1ex" class=3D"gmail_quote">The fimd register headers have been m=
oved to include/video/<br>hence, modifying the machine files accordingly.<b=
r>

<br>Signed-off-by: Leela Krishna Amudala &lt;<a href=3D"mailto:l.krishna@sa=
msung.com">l.krishna@samsung.com</a>&gt;<br>---<br>=A0arch/arm/mach-exynos/=
mach-nuri.c =A0 =A0 =A0 =A0 =A0 | =A0 =A02 +-<br>=A0arch/arm/mach-exynos/ma=
ch-origen.c =A0 =A0 =A0 =A0 | =A0 =A02 +-<br>

=A0arch/arm/mach-exynos/mach-smdk4x12.c =A0 =A0 =A0 | =A0 =A02 +-<br>=A0arc=
h/arm/mach-exynos/mach-smdkv310.c =A0 =A0 =A0 | =A0 =A02 +-<br>=A0arch/arm/=
mach-exynos/mach-universal_c210.c | =A0 =A02 +-<br>=A0arch/arm/mach-exynos/=
setup-fimd0.c =A0 =A0 =A0 =A0 | =A0 =A02 +-<br>

=A0arch/arm/mach-s3c24xx/mach-smdk2416.c =A0 =A0 =A0| =A0 =A02 +-<br>=A0arc=
h/arm/mach-s3c64xx/mach-anw6410.c =A0 =A0 =A0 | =A0 =A02 +-<br>=A0arch/arm/=
mach-s3c64xx/mach-crag6410.c =A0 =A0 =A0| =A0 =A02 +-<br>=A0arch/arm/mach-s=
3c64xx/mach-hmt.c =A0 =A0 =A0 =A0 =A0 | =A0 =A02 +-<br>

=A0arch/arm/mach-s3c64xx/mach-mini6410.c =A0 =A0 =A0| =A0 =A02 +-<br>=A0arc=
h/arm/mach-s3c64xx/mach-ncp.c =A0 =A0 =A0 =A0 =A0 | =A0 =A02 +-<br>=A0arch/=
arm/mach-s3c64xx/mach-real6410.c =A0 =A0 =A0| =A0 =A02 +-<br>=A0arch/arm/ma=
ch-s3c64xx/mach-smartq5.c =A0 =A0 =A0 | =A0 =A02 +-<br>

=A0arch/arm/mach-s3c64xx/mach-smartq7.c =A0 =A0 =A0 | =A0 =A02 +-<br>=A0arc=
h/arm/mach-s3c64xx/mach-smdk6410.c =A0 =A0 =A0| =A0 =A02 +-<br>=A0arch/arm/=
mach-s5p64x0/mach-smdk6440.c =A0 =A0 =A0| =A0 =A02 +-<br>=A0arch/arm/mach-s=
5p64x0/mach-smdk6450.c =A0 =A0 =A0| =A0 =A02 +-<br>

=A0arch/arm/mach-s5pc100/mach-smdkc100.c =A0 =A0 =A0| =A0 =A02 +-<br>=A0arc=
h/arm/mach-s5pv210/mach-aquila.c =A0 =A0 =A0 =A0| =A0 =A02 +-<br>=A0arch/ar=
m/mach-s5pv210/mach-goni.c =A0 =A0 =A0 =A0 =A0| =A0 =A02 +-<br>=A0arch/arm/=
mach-s5pv210/mach-smdkv210.c =A0 =A0 =A0| =A0 =A02 +-<br>

=A022 files changed, 22 insertions(+), 22 deletions(-)<br><br>diff --git a/=
arch/arm/mach-exynos/mach-nuri.c b/arch/arm/mach-exynos/mach-nuri.c<br>inde=
x f98a83a..573a0c4 100644<br>--- a/arch/arm/mach-exynos/mach-nuri.c<br>+++ =
b/arch/arm/mach-exynos/mach-nuri.c<br>

@@ -39,7 +39,7 @@<br>=A0#include &lt;asm/mach-types.h&gt;<br><br>=A0#includ=
e &lt;plat/adc.h&gt;<br>-#include &lt;plat/regs-fb-v4.h&gt;<br>+#include &l=
t;video/samsung_fimd.h&gt;<br>=A0#include &lt;plat/regs-serial.h&gt;<br>=A0=
#include &lt;plat/cpu.h&gt;<br>

=A0#include &lt;plat/devs.h&gt;<br>diff --git a/arch/arm/mach-exynos/mach-o=
rigen.c b/arch/arm/mach-exynos/mach-origen.c<br>index 5a12dc2..c69707e 1006=
44<br>--- a/arch/arm/mach-exynos/mach-origen.c<br>+++ b/arch/arm/mach-exyno=
s/mach-origen.c<br>

@@ -31,7 +31,7 @@<br>=A0#include &lt;video/platform_lcd.h&gt;<br><br>=A0#in=
clude &lt;plat/regs-serial.h&gt;<br>-#include &lt;plat/regs-fb-v4.h&gt;<br>=
+#include &lt;video/samsung_fimd.h&gt;<br>=A0#include &lt;plat/cpu.h&gt;<br=
>
=A0#include &lt;plat/devs.h&gt;<br>
=A0#include &lt;plat/sdhci.h&gt;<br>diff --git a/arch/arm/mach-exynos/mach-=
smdk4x12.c b/arch/arm/mach-exynos/mach-smdk4x12.c<br>index b26beb1..8a8acff=
 100644<br>--- a/arch/arm/mach-exynos/mach-smdk4x12.c<br>+++ b/arch/arm/mac=
h-exynos/mach-smdk4x12.c<br>

@@ -35,7 +35,7 @@<br>=A0#include &lt;plat/iic.h&gt;<br>=A0#include &lt;plat=
/keypad.h&gt;<br>=A0#include &lt;plat/mfc.h&gt;<br>-#include &lt;plat/regs-=
fb.h&gt;<br>+#include &lt;video/samsung_fimd.h&gt;<br>=A0#include &lt;plat/=
regs-serial.h&gt;<br>

=A0#include &lt;plat/sdhci.h&gt;<br><br>diff --git a/arch/arm/mach-exynos/m=
ach-smdkv310.c b/arch/arm/mach-exynos/mach-smdkv310.c<br>index 3cfa688..c2d=
f6e8 100644<br>--- a/arch/arm/mach-exynos/mach-smdkv310.c<br>+++ b/arch/arm=
/mach-exynos/mach-smdkv310.c<br>

@@ -28,7 +28,7 @@<br>=A0#include &lt;video/platform_lcd.h&gt;<br>=A0#includ=
e &lt;plat/regs-serial.h&gt;<br>=A0#include &lt;plat/regs-srom.h&gt;<br>-#i=
nclude &lt;plat/regs-fb-v4.h&gt;<br>+#include &lt;video/samsung_fimd.h&gt;<=
br>

=A0#include &lt;plat/cpu.h&gt;<br>=A0#include &lt;plat/devs.h&gt;<br>=A0#in=
clude &lt;plat/fb.h&gt;<br>diff --git a/arch/arm/mach-exynos/mach-universal=
_c210.c b/arch/arm/mach-exynos/mach-universal_c210.c<br>index 4d1f40d..e6fb=
471 100644<br>

--- a/arch/arm/mach-exynos/mach-universal_c210.c<br>+++ b/arch/arm/mach-exy=
nos/mach-universal_c210.c<br>@@ -39,7 +39,7 @@<br>=A0#include &lt;plat/fb.h=
&gt;<br>=A0#include &lt;plat/mfc.h&gt;<br>=A0#include &lt;plat/sdhci.h&gt;<=
br>

-#include &lt;plat/regs-fb-v4.h&gt;<br>+#include &lt;video/samsung_fimd.h&g=
t;<br>=A0#include &lt;plat/fimc-core.h&gt;<br>=A0#include &lt;plat/s5p-time=
.h&gt;<br>=A0#include &lt;plat/camport.h&gt;<br>diff --git a/arch/arm/mach-=
exynos/setup-fimd0.c b/arch/arm/mach-exynos/setup-fimd0.c<br>

index 07a6dbe..53c4c51 100644<br>--- a/arch/arm/mach-exynos/setup-fimd0.c<b=
r>+++ b/arch/arm/mach-exynos/setup-fimd0.c<br>@@ -14,7 +14,7 @@<br>=A0#incl=
ude &lt;linux/gpio.h&gt;<br><br>=A0#include &lt;plat/gpio-cfg.h&gt;<br>-#in=
clude &lt;plat/regs-fb-v4.h&gt;<br>

+#include &lt;video/samsung_fimd.h&gt;<br><br>=A0#include &lt;mach/map.h&gt=
;<br><br>diff --git a/arch/arm/mach-s3c24xx/mach-smdk2416.c b/arch/arm/mach=
-s3c24xx/mach-smdk2416.c<br>index c3100a0..c8d5f51 100644<br>--- a/arch/arm=
/mach-s3c24xx/mach-smdk2416.c<br>

+++ b/arch/arm/mach-s3c24xx/mach-smdk2416.c<br>@@ -52,7 +52,7 @@<br>=A0#inc=
lude &lt;plat/udc.h&gt;<br>=A0#include &lt;linux/platform_data/s3c-hsudc.h&=
gt;<br><br>-#include &lt;plat/regs-fb-v4.h&gt;<br>+#include &lt;video/samsu=
ng_fimd.h&gt;<br>

=A0#include &lt;plat/fb.h&gt;<br><br>=A0#include &lt;plat/common-smdk.h&gt;=
<br>diff --git a/arch/arm/mach-s3c64xx/mach-anw6410.c b/arch/arm/mach-s3c64=
xx/mach-anw6410.c<br>index ffa29dd..27e3087 100644<br>--- a/arch/arm/mach-s=
3c64xx/mach-anw6410.c<br>

+++ b/arch/arm/mach-s3c64xx/mach-anw6410.c<br>@@ -44,7 +44,7 @@<br>=A0#incl=
ude &lt;plat/regs-serial.h&gt;<br>=A0#include &lt;plat/iic.h&gt;<br>=A0#inc=
lude &lt;plat/fb.h&gt;<br>-#include &lt;plat/regs-fb-v4.h&gt;<br>+#include =
&lt;video/samsung_fimd.h&gt;<br>

<br>=A0#include &lt;plat/clock.h&gt;<br>=A0#include &lt;plat/devs.h&gt;<br>=
diff --git a/arch/arm/mach-s3c64xx/mach-crag6410.c b/arch/arm/mach-s3c64xx/=
mach-crag6410.c<br>index 09cd812..66e8c69 100644<br>--- a/arch/arm/mach-s3c=
64xx/mach-crag6410.c<br>

+++ b/arch/arm/mach-s3c64xx/mach-crag6410.c<br>@@ -57,7 +57,7 @@<br>=A0#inc=
lude &lt;mach/regs-gpio-memport.h&gt;<br><br>=A0#include &lt;plat/regs-seri=
al.h&gt;<br>-#include &lt;plat/regs-fb-v4.h&gt;<br>+#include &lt;video/sams=
ung_fimd.h&gt;<br>

=A0#include &lt;plat/fb.h&gt;<br>=A0#include &lt;plat/sdhci.h&gt;<br>=A0#in=
clude &lt;plat/gpio-cfg.h&gt;<br>diff --git a/arch/arm/mach-s3c64xx/mach-hm=
t.c b/arch/arm/mach-s3c64xx/mach-hmt.c<br>index 6890881..ab78c5e 100644<br>=
--- a/arch/arm/mach-s3c64xx/mach-hmt.c<br>

+++ b/arch/arm/mach-s3c64xx/mach-hmt.c<br>@@ -41,7 +41,7 @@<br>=A0#include =
&lt;plat/clock.h&gt;<br>=A0#include &lt;plat/devs.h&gt;<br>=A0#include &lt;=
plat/cpu.h&gt;<br>-#include &lt;plat/regs-fb-v4.h&gt;<br>+#include &lt;vide=
o/samsung_fimd.h&gt;<br>

<br>=A0#include &quot;common.h&quot;<br><br>diff --git a/arch/arm/mach-s3c6=
4xx/mach-mini6410.c b/arch/arm/mach-s3c64xx/mach-mini6410.c<br>index 5539a2=
5..4b9a9ff 100644<br>--- a/arch/arm/mach-s3c64xx/mach-mini6410.c<br>+++ b/a=
rch/arm/mach-s3c64xx/mach-mini6410.c<br>

@@ -41,7 +41,7 @@<br>=A0#include &lt;plat/nand.h&gt;<br>=A0#include &lt;pla=
t/regs-serial.h&gt;<br>=A0#include &lt;plat/ts.h&gt;<br>-#include &lt;plat/=
regs-fb-v4.h&gt;<br>+#include &lt;video/samsung_fimd.h&gt;<br><br>=A0#inclu=
de &lt;video/platform_lcd.h&gt;<br>

<br>diff --git a/arch/arm/mach-s3c64xx/mach-ncp.c b/arch/arm/mach-s3c64xx/m=
ach-ncp.c<br>index cad2e05..d4c8af0 100644<br>--- a/arch/arm/mach-s3c64xx/m=
ach-ncp.c<br>+++ b/arch/arm/mach-s3c64xx/mach-ncp.c<br>@@ -43,7 +43,7 @@<br=
>

=A0#include &lt;plat/clock.h&gt;<br>=A0#include &lt;plat/devs.h&gt;<br>=A0#=
include &lt;plat/cpu.h&gt;<br>-#include &lt;plat/regs-fb-v4.h&gt;<br>+#incl=
ude &lt;video/samsung_fimd.h&gt;<br><br>=A0#include &quot;common.h&quot;<br=
><br>

diff --git a/arch/arm/mach-s3c64xx/mach-real6410.c b/arch/arm/mach-s3c64xx/=
mach-real6410.c<br>index 326b216..05f05d2 100644<br>--- a/arch/arm/mach-s3c=
64xx/mach-real6410.c<br>+++ b/arch/arm/mach-s3c64xx/mach-real6410.c<br>

@@ -42,7 +42,7 @@<br>=A0#include &lt;plat/nand.h&gt;<br>=A0#include &lt;pla=
t/regs-serial.h&gt;<br>=A0#include &lt;plat/ts.h&gt;<br>-#include &lt;plat/=
regs-fb-v4.h&gt;<br>+#include &lt;video/samsung_fimd.h&gt;<br><br>=A0#inclu=
de &lt;video/platform_lcd.h&gt;<br>

<br>diff --git a/arch/arm/mach-s3c64xx/mach-smartq5.c b/arch/arm/mach-s3c64=
xx/mach-smartq5.c<br>index d6266d8..aa225ff 100644<br>--- a/arch/arm/mach-s=
3c64xx/mach-smartq5.c<br>+++ b/arch/arm/mach-s3c64xx/mach-smartq5.c<br>

@@ -28,7 +28,7 @@<br>=A0#include &lt;plat/devs.h&gt;<br>=A0#include &lt;pla=
t/fb.h&gt;<br>=A0#include &lt;plat/gpio-cfg.h&gt;<br>-#include &lt;plat/reg=
s-fb-v4.h&gt;<br>+#include &lt;video/samsung_fimd.h&gt;<br><br>=A0#include =
&quot;common.h&quot;<br>

=A0#include &quot;mach-smartq.h&quot;<br>diff --git a/arch/arm/mach-s3c64xx=
/mach-smartq7.c b/arch/arm/mach-s3c64xx/mach-smartq7.c<br>index 0957d2a..6e=
9c070 100644<br>--- a/arch/arm/mach-s3c64xx/mach-smartq7.c<br>+++ b/arch/ar=
m/mach-s3c64xx/mach-smartq7.c<br>

@@ -28,7 +28,7 @@<br>=A0#include &lt;plat/devs.h&gt;<br>=A0#include &lt;pla=
t/fb.h&gt;<br>=A0#include &lt;plat/gpio-cfg.h&gt;<br>-#include &lt;plat/reg=
s-fb-v4.h&gt;<br>+#include &lt;video/samsung_fimd.h&gt;<br><br>=A0#include =
&quot;common.h&quot;<br>

=A0#include &quot;mach-smartq.h&quot;<br>diff --git a/arch/arm/mach-s3c64xx=
/mach-smdk6410.c b/arch/arm/mach-s3c64xx/mach-smdk6410.c<br>index 0fe4f15..=
1803192 100644<br>--- a/arch/arm/mach-s3c64xx/mach-smdk6410.c<br>+++ b/arch=
/arm/mach-s3c64xx/mach-smdk6410.c<br>

@@ -72,7 +72,7 @@<br>=A0#include &lt;plat/ts.h&gt;<br>=A0#include &lt;plat/=
keypad.h&gt;<br>=A0#include &lt;plat/backlight.h&gt;<br>-#include &lt;plat/=
regs-fb-v4.h&gt;<br>+#include &lt;video/samsung_fimd.h&gt;<br><br>=A0#inclu=
de &quot;common.h&quot;<br>

<br>diff --git a/arch/arm/mach-s5p64x0/mach-smdk6440.c b/arch/arm/mach-s5p6=
4x0/mach-smdk6440.c<br>index 92fefad..0db0bdd 100644<br>--- a/arch/arm/mach=
-s5p64x0/mach-smdk6440.c<br>+++ b/arch/arm/mach-s5p64x0/mach-smdk6440.c<br>

@@ -52,7 +52,7 @@<br>=A0#include &lt;plat/s5p-time.h&gt;<br>=A0#include &lt=
;plat/backlight.h&gt;<br>=A0#include &lt;plat/fb.h&gt;<br>-#include &lt;pla=
t/regs-fb.h&gt;<br>+#include &lt;video/smasung_fimd.h&gt;<br>=A0#include &l=
t;plat/sdhci.h&gt;<br>

<br>=A0#include &quot;common.h&quot;<br>diff --git a/arch/arm/mach-s5p64x0/=
mach-smdk6450.c b/arch/arm/mach-s5p64x0/mach-smdk6450.c<br>index e2335ec..c=
641d33 100644<br>--- a/arch/arm/mach-s5p64x0/mach-smdk6450.c<br>+++ b/arch/=
arm/mach-s5p64x0/mach-smdk6450.c<br>

@@ -52,7 +52,7 @@<br>=A0#include &lt;plat/s5p-time.h&gt;<br>=A0#include &lt=
;plat/backlight.h&gt;<br>=A0#include &lt;plat/fb.h&gt;<br>-#include &lt;pla=
t/regs-fb.h&gt;<br>+#include &lt;video/samsung_fimd.h&gt;<br>=A0#include &l=
t;plat/sdhci.h&gt;<br>

<br>=A0#include &quot;common.h&quot;<br>diff --git a/arch/arm/mach-s5pc100/=
mach-smdkc100.c b/arch/arm/mach-s5pc100/mach-smdkc100.c<br>index 0c3ae38..e=
4df3d0 100644<br>--- a/arch/arm/mach-s5pc100/mach-smdkc100.c<br>+++ b/arch/=
arm/mach-s5pc100/mach-smdkc100.c<br>

@@ -51,7 +51,7 @@<br>=A0#include &lt;plat/ts.h&gt;<br>=A0#include &lt;plat/=
audio.h&gt;<br>=A0#include &lt;plat/backlight.h&gt;<br>-#include &lt;plat/r=
egs-fb-v4.h&gt;<br>+#include &lt;video/samsung_fimd.h&gt;<br><br>=A0#includ=
e &quot;common.h&quot;<br>

<br>diff --git a/arch/arm/mach-s5pv210/mach-aquila.c b/arch/arm/mach-s5pv21=
0/mach-aquila.c<br>index 78028df..8cbe4ac 100644<br>--- a/arch/arm/mach-s5p=
v210/mach-aquila.c<br>+++ b/arch/arm/mach-s5pv210/mach-aquila.c<br>@@ -39,7=
 +39,7 @@<br>

=A0#include &lt;plat/fimc-core.h&gt;<br>=A0#include &lt;plat/sdhci.h&gt;<br=
>=A0#include &lt;plat/s5p-time.h&gt;<br>-#include &lt;plat/regs-fb-v4.h&gt;=
<br>+#include &lt;video/samsung_fimd.h&gt;<br><br>=A0#include &quot;common.=
h&quot;<br>

<br>diff --git a/arch/arm/mach-s5pv210/mach-goni.c b/arch/arm/mach-s5pv210/=
mach-goni.c<br>index 822a559..e799a02 100644<br>--- a/arch/arm/mach-s5pv210=
/mach-goni.c<br>+++ b/arch/arm/mach-s5pv210/mach-goni.c<br>@@ -49,7 +49,7 @=
@<br>

=A0#include &lt;plat/clock.h&gt;<br>=A0#include &lt;plat/s5p-time.h&gt;<br>=
=A0#include &lt;plat/mfc.h&gt;<br>-#include &lt;plat/regs-fb-v4.h&gt;<br>+#=
include &lt;video/samsung_fimd.h&gt;<br>=A0#include &lt;plat/camport.h&gt;<=
br>
<br>
=A0#include &lt;media/v4l2-mediabus.h&gt;<br>diff --git a/arch/arm/mach-s5p=
v210/mach-smdkv210.c b/arch/arm/mach-s5pv210/mach-smdkv210.c<br>index 918b2=
3d..3c569e5 100644<br>--- a/arch/arm/mach-s5pv210/mach-smdkv210.c<br>+++ b/=
arch/arm/mach-s5pv210/mach-smdkv210.c<br>

@@ -46,7 +46,7 @@<br>=A0#include &lt;plat/fb.h&gt;<br>=A0#include &lt;plat/=
s5p-time.h&gt;<br>=A0#include &lt;plat/backlight.h&gt;<br>-#include &lt;pla=
t/regs-fb-v4.h&gt;<br>+#include &lt;video/samsung_fimd.h&gt;<br>=A0#include=
 &lt;plat/mfc.h&gt;<br>

=A0#include &lt;plat/clock.h&gt;<br><span class=3D"HOEnZb"><font color=3D"#=
888888"><br>--<br>1.7.0.4<br><br>--<br>To unsubscribe from this list: send =
the line &quot;unsubscribe linux-samsung-soc&quot; in<br>the body of a mess=
age to <a href=3D"mailto:majordomo@vger.kernel.org">majordomo@vger.kernel.o=
rg</a><br>

More majordomo info at =A0<a href=3D"http://vger.kernel.org/majordomo-info.=
html" target=3D"_blank">http://vger.kernel.org/majordomo-info.html</a><br><=
/font></span></blockquote></div><br>

--f46d04287a170a7bf604c6081eb3--

--===============0965618575==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
http://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0965618575==--
