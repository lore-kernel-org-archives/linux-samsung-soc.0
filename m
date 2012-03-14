From: Olof Johansson <olof@lixom.net>
Subject: Re: [GIT PULL 2/4] Samsung devel-pd for v3.4
Date: Tue, 13 Mar 2012 17:53:06 -0700
Message-ID: <CAOesGMg8iv=jE52sFs-np4HXuokMstZt8igHTQBJ4wJNOCae9A@mail.gmail.com>
References: <4F5B7C81.6080301@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-yx0-f174.google.com ([209.85.213.174]:51988 "EHLO
	mail-yx0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S964959Ab2CNAxG convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 13 Mar 2012 20:53:06 -0400
Received: by mail-yx0-f174.google.com with SMTP id l12so1239758yen.19
        for <linux-samsung-soc@vger.kernel.org>; Tue, 13 Mar 2012 17:53:06 -0700 (PDT)
In-Reply-To: <4F5B7C81.6080301@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: Arnd Bergmann <arnd@arndb.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "Rafael J. Wysocki" <rjw@sisk.pl>

Hi,

On Sat, Mar 10, 2012 at 8:08 AM, Kukjin Kim <kgene.kim@samsung.com> wro=
te:
> Hi Arnd, Olof,
>
> This is Generic Power Domain patches for EXYNOS. Basically, Thomas' p=
atches,
> adding support Generic Power Domain patches are in Rafael's tree,
> linux-pm/linux-next and see below merge commit.
> http://git.kernel.org/?p=3Dlinux/kernel/git/rafael/linux-pm.git;a=3Dc=
ommit;h=3Ddcaad77a8074b6de58e745546bc543d5538404f2
> And this adds hooking up G2D and JPEG to Generic PD.
>
> Please pull and here is my preferred resolution when merge this after
> next/board-samsung.
>
> diff --cc arch/arm/mach-exynos/mach-universal_c210.c
> index 3663aee,0262417..0b944eb
> --- a/arch/arm/mach-exynos/mach-universal_c210.c
> +++ b/arch/arm/mach-exynos/mach-universal_c210.c
> @@@ -1053,10 -981,6 +1052,7 @@@ static struct platform_device *univer=
sa
> =A0 =A0 =A0 =A0&s5p_device_mfc,
> =A0 =A0 =A0 =A0&s5p_device_mfc_l,
> =A0 =A0 =A0 =A0&s5p_device_mfc_r,
> - =A0 =A0 =A0 &exynos4_device_pd[PD_MFC],
> - =A0 =A0 =A0 &exynos4_device_pd[PD_LCD0],
> - =A0 =A0 =A0 &exynos4_device_pd[PD_CAM],
> =A0+ =A0 =A0 =A0&cam_vt_dio_fixed_reg_dev,
> =A0 =A0 =A0 =A0&cam_i_core_fixed_reg_dev,
> =A0 =A0 =A0 =A0&cam_s_if_fixed_reg_dev,
> =A0 =A0 =A0 =A0&s5p_device_fimc_md,
>
> If any problems, please kindly let me know.
>
> Thanks.
>
> Best regards,
> Kgene.
> --
> Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
> SW Solution Development Team, Samsung Electronics Co., Ltd.
>
> The following changes since commit 192cfd58774b4d17b2fe8bdc77d89c2ef4=
e0591d:
>
> =A0Linux 3.3-rc6 (2012-03-03 17:08:09 -0800)
>
> are available in the git repository at:
> =A0git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.=
git
> next/devel-samsung-pd


Pulled, thanks!


-Olof
