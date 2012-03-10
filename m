From: Olof Johansson <olof@lixom.net>
Subject: Re: [GIT PULL 2/4] Samsung devel-pd for v3.4
Date: Sat, 10 Mar 2012 10:05:15 -0800
Message-ID: <CAOesGMjff3gVNJQ5FpJuSf+uvVDW8k22b+Xcikot-isM-4-6iw@mail.gmail.com>
References: <4F5B7C81.6080301@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-gx0-f174.google.com ([209.85.161.174]:35552 "EHLO
	mail-gx0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751172Ab2CJSFQ convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 10 Mar 2012 13:05:16 -0500
Received: by gghe5 with SMTP id e5so1622632ggh.19
        for <linux-samsung-soc@vger.kernel.org>; Sat, 10 Mar 2012 10:05:15 -0800 (PST)
In-Reply-To: <4F5B7C81.6080301@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>, "Rafael J. Wysocki" <rjw@sisk.pl>
Cc: Arnd Bergmann <arnd@arndb.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>

Hi Rafael,

The below series contains two patches that have been sent to you, and
that are sitting in the pm-domains branch.

Two questions before I pull this into arm-soc:

1) Are you 100% sure this will be submitted to 3.4? And if so, will
you send it early during the merge window?
2) Are you 100% sure you will not rebase the branch into which you
pulled the v3.4-for-rafael branch?

I am asking because if we pull this in, and you rebase between now and
when it's sent in, we're risking merge conflicts that will be painful
to resolve. We've been bitten by that from other dependencies in the
past so we're being careful.


Thanks,

-Olof

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
>
> Sachin Kamat (2):
> =A0 =A0 =A0ARM: EXYNOS: Hook up G2D PD to generic PD infrastructure
> =A0 =A0 =A0ARM: EXYNOS: Hook up JPEG PD to generic PD infrastructure
>
> Thomas Abraham (2):
> =A0 =A0 =A0PM / Domains: Add OF support
> =A0 =A0 =A0ARM: EXYNOS: Hook up power domains to generic power domain
> infrastructure
>
> =A0.../bindings/arm/exynos/power_domain.txt =A0 =A0 =A0 =A0 =A0 | =A0=
 21 ++
> =A0arch/arm/mach-exynos/Kconfig =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 | =A0 10 +-
> =A0arch/arm/mach-exynos/Makefile =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0| =A0 =A02 +-
> =A0arch/arm/mach-exynos/dev-pd.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0| =A0139 --------------
> =A0arch/arm/mach-exynos/mach-nuri.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 | =A0 11 -
> =A0arch/arm/mach-exynos/mach-origen.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 | =A0 14 --
> =A0arch/arm/mach-exynos/mach-smdkv310.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 |=
 =A0 12 --
> =A0arch/arm/mach-exynos/mach-universal_c210.c =A0 =A0 =A0 =A0 | =A0 1=
7 --
> =A0arch/arm/mach-exynos/pm_domains.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0| =A0201
> ++++++++++++++++++++
> =A0drivers/base/power/domain.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0| =A0 32 +++
> =A0include/linux/pm_domain.h =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0| =A0 12 ++
> =A011 files changed, 268 insertions(+), 203 deletions(-)
> =A0create mode 100644
> Documentation/devicetree/bindings/arm/exynos/power_domain.txt
> =A0delete mode 100644 arch/arm/mach-exynos/dev-pd.c
> =A0create mode 100644 arch/arm/mach-exynos/pm_domains.c
