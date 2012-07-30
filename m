From: Leela Krishna Amudala <l.krishna@samsung.com>
Subject: Re: [PATCH 0/3] ARM: SAMSUNG: Move FIMD headers to include/video/
Date: Mon, 30 Jul 2012 14:15:55 +0530
Message-ID: <CAL1wa8cBfgh8tMBe7L=udfwdRBOtRvfuwTSZNfZGFtsOyTxJpA@mail.gmail.com>
References: <1343637905-17764-1-git-send-email-l.krishna@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1182167374=="
Return-path: <dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org>
In-Reply-To: <1343637905-17764-1-git-send-email-l.krishna@samsung.com>
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

--===============1182167374==
Content-Type: multipart/alternative; boundary=e89a8ff245df45904a04c60818e4

--e89a8ff245df45904a04c60818e4
Content-Type: text/plain; charset=ISO-8859-1

Adding Marek.

This patchset based on Marek's comments.

Chages based on Marek comments
On Mon, Jul 30, 2012 at 2:15 PM, Leela Krishna Amudala <
l.krishna@samsung.com> wrote:

> This patchset moves the contents of regs-fb-v4.h and regs-fb.h from arch
> side
> to include/video/samsung_fimd.h
>
> This patchset is created and rebased against master branch of torvalds
> tree.
> Tested on smdk5250 board, build tested for other boards.
>
> Leela Krishna Amudala (3):
>   Move FIMD register headers to include/video/
>   arm: samsung: Include the modified FIMD header file
>   driver: Include the modified FIMD header file
>
>  arch/arm/mach-exynos/mach-nuri.c                |    2 +-
>  arch/arm/mach-exynos/mach-origen.c              |    2 +-
>  arch/arm/mach-exynos/mach-smdk4x12.c            |    2 +-
>  arch/arm/mach-exynos/mach-smdkv310.c            |    2 +-
>  arch/arm/mach-exynos/mach-universal_c210.c      |    2 +-
>  arch/arm/mach-exynos/setup-fimd0.c              |    2 +-
>  arch/arm/mach-s3c24xx/mach-smdk2416.c           |    2 +-
>  arch/arm/mach-s3c64xx/mach-anw6410.c            |    2 +-
>  arch/arm/mach-s3c64xx/mach-crag6410.c           |    2 +-
>  arch/arm/mach-s3c64xx/mach-hmt.c                |    2 +-
>  arch/arm/mach-s3c64xx/mach-mini6410.c           |    2 +-
>  arch/arm/mach-s3c64xx/mach-ncp.c                |    2 +-
>  arch/arm/mach-s3c64xx/mach-real6410.c           |    2 +-
>  arch/arm/mach-s3c64xx/mach-smartq5.c            |    2 +-
>  arch/arm/mach-s3c64xx/mach-smartq7.c            |    2 +-
>  arch/arm/mach-s3c64xx/mach-smdk6410.c           |    2 +-
>  arch/arm/mach-s5p64x0/mach-smdk6440.c           |    2 +-
>  arch/arm/mach-s5p64x0/mach-smdk6450.c           |    2 +-
>  arch/arm/mach-s5pc100/mach-smdkc100.c           |    2 +-
>  arch/arm/mach-s5pv210/mach-aquila.c             |    2 +-
>  arch/arm/mach-s5pv210/mach-goni.c               |    2 +-
>  arch/arm/mach-s5pv210/mach-smdkv210.c           |    2 +-
>  arch/arm/plat-samsung/include/plat/regs-fb-v4.h |  159 -------
>  arch/arm/plat-samsung/include/plat/regs-fb.h    |  403 -----------------
>  drivers/gpu/drm/exynos/exynos_drm_fimd.c        |    2 +-
>  drivers/video/s3c-fb.c                          |    2 +-
>  include/video/samsung_fimd.h                    |  533
> +++++++++++++++++++++++
>  27 files changed, 557 insertions(+), 586 deletions(-)
>  delete mode 100644 arch/arm/plat-samsung/include/plat/regs-fb-v4.h
>  delete mode 100644 arch/arm/plat-samsung/include/plat/regs-fb.h
>  create mode 100644 include/video/samsung_fimd.h
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-fbdev" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>

--e89a8ff245df45904a04c60818e4
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div>Adding=A0Marek.</div>
<div>=A0</div>
<div>This patchset based on Marek&#39;s comments.</div>
<div>=A0</div>
<div>Chages based on Marek comments<br></div>
<div class=3D"gmail_quote">On Mon, Jul 30, 2012 at 2:15 PM, Leela Krishna A=
mudala <span dir=3D"ltr">&lt;<a href=3D"mailto:l.krishna@samsung.com" targe=
t=3D"_blank">l.krishna@samsung.com</a>&gt;</span> wrote:<br>
<blockquote style=3D"BORDER-LEFT:#ccc 1px solid;MARGIN:0px 0px 0px 0.8ex;PA=
DDING-LEFT:1ex" class=3D"gmail_quote">This patchset moves the contents of r=
egs-fb-v4.h and regs-fb.h from arch side<br>to include/video/samsung_fimd.h=
<br>

<br>This patchset is created and rebased against master branch of torvalds =
tree.<br>Tested on smdk5250 board, build tested for other boards.<br><br>Le=
ela Krishna Amudala (3):<br>=A0 Move FIMD register headers to include/video=
/<br>

=A0 arm: samsung: Include the modified FIMD header file<br>=A0 driver: Incl=
ude the modified FIMD header file<br><br>=A0arch/arm/mach-exynos/mach-nuri.=
c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A0 =A02 +-<br>=A0arch/arm/mach-exynos/m=
ach-origen.c =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A0 =A02 +-<br>

=A0arch/arm/mach-exynos/mach-smdk4x12.c =A0 =A0 =A0 =A0 =A0 =A0| =A0 =A02 +=
-<br>=A0arch/arm/mach-exynos/mach-smdkv310.c =A0 =A0 =A0 =A0 =A0 =A0| =A0 =
=A02 +-<br>=A0arch/arm/mach-exynos/mach-universal_c210.c =A0 =A0 =A0| =A0 =
=A02 +-<br>=A0arch/arm/mach-exynos/setup-fimd0.c =A0 =A0 =A0 =A0 =A0 =A0 =
=A0| =A0 =A02 +-<br>

=A0arch/arm/mach-s3c24xx/mach-smdk2416.c =A0 =A0 =A0 =A0 =A0 | =A0 =A02 +-<=
br>=A0arch/arm/mach-s3c64xx/mach-anw6410.c =A0 =A0 =A0 =A0 =A0 =A0| =A0 =A0=
2 +-<br>=A0arch/arm/mach-s3c64xx/mach-crag6410.c =A0 =A0 =A0 =A0 =A0 | =A0 =
=A02 +-<br>=A0arch/arm/mach-s3c64xx/mach-hmt.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0| =A0 =A02 +-<br>

=A0arch/arm/mach-s3c64xx/mach-mini6410.c =A0 =A0 =A0 =A0 =A0 | =A0 =A02 +-<=
br>=A0arch/arm/mach-s3c64xx/mach-ncp.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A0=
 =A02 +-<br>=A0arch/arm/mach-s3c64xx/mach-real6410.c =A0 =A0 =A0 =A0 =A0 | =
=A0 =A02 +-<br>=A0arch/arm/mach-s3c64xx/mach-smartq5.c =A0 =A0 =A0 =A0 =A0 =
=A0| =A0 =A02 +-<br>

=A0arch/arm/mach-s3c64xx/mach-smartq7.c =A0 =A0 =A0 =A0 =A0 =A0| =A0 =A02 +=
-<br>=A0arch/arm/mach-s3c64xx/mach-smdk6410.c =A0 =A0 =A0 =A0 =A0 | =A0 =A0=
2 +-<br>=A0arch/arm/mach-s5p64x0/mach-smdk6440.c =A0 =A0 =A0 =A0 =A0 | =A0 =
=A02 +-<br>=A0arch/arm/mach-s5p64x0/mach-smdk6450.c =A0 =A0 =A0 =A0 =A0 | =
=A0 =A02 +-<br>

=A0arch/arm/mach-s5pc100/mach-smdkc100.c =A0 =A0 =A0 =A0 =A0 | =A0 =A02 +-<=
br>=A0arch/arm/mach-s5pv210/mach-aquila.c =A0 =A0 =A0 =A0 =A0 =A0 | =A0 =A0=
2 +-<br>=A0arch/arm/mach-s5pv210/mach-goni.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =
=A0 =A02 +-<br>=A0arch/arm/mach-s5pv210/mach-smdkv210.c =A0 =A0 =A0 =A0 =A0=
 | =A0 =A02 +-<br>

=A0arch/arm/plat-samsung/include/plat/regs-fb-v4.h | =A0159 -------<br>=A0a=
rch/arm/plat-samsung/include/plat/regs-fb.h =A0 =A0| =A0403 ---------------=
--<br>=A0drivers/gpu/drm/exynos/exynos_drm_fimd.c =A0 =A0 =A0 =A0| =A0 =A02=
 +-<br>=A0drivers/video/s3c-fb.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0| =A0 =A02 +-<br>

=A0include/video/samsung_fimd.h =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| =
=A0533 +++++++++++++++++++++++<br>=A027 files changed, 557 insertions(+), 5=
86 deletions(-)<br>=A0delete mode 100644 arch/arm/plat-samsung/include/plat=
/regs-fb-v4.h<br>=A0delete mode 100644 arch/arm/plat-samsung/include/plat/r=
egs-fb.h<br>

=A0create mode 100644 include/video/samsung_fimd.h<br><br>--<br>To unsubscr=
ibe from this list: send the line &quot;unsubscribe linux-fbdev&quot; in<br=
>the body of a message to <a href=3D"mailto:majordomo@vger.kernel.org">majo=
rdomo@vger.kernel.org</a><br>

More majordomo info at =A0<a href=3D"http://vger.kernel.org/majordomo-info.=
html" target=3D"_blank">http://vger.kernel.org/majordomo-info.html</a><br><=
/blockquote></div><br>

--e89a8ff245df45904a04c60818e4--

--===============1182167374==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
http://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1182167374==--
