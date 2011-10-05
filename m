From: Kyungmin Park <kmpark@infradead.org>
Subject: Re: [GIT PULL] Samsung board-2 for v3.2
Date: Wed, 5 Oct 2011 17:51:11 +0900
Message-ID: <CAH9JG2XCeymVK8WjetnjWa3qumwJqmXu7wz_K2hX_u+LBjQTjw@mail.gmail.com>
References: <019b01cc8298$846170c0$8d245240$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qy0-f174.google.com ([209.85.216.174]:51213 "EHLO
	mail-qy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932659Ab1JEIvM convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 5 Oct 2011 04:51:12 -0400
Received: by qyk30 with SMTP id 30so4041029qyk.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 05 Oct 2011 01:51:11 -0700 (PDT)
In-Reply-To: <019b01cc8298$846170c0$8d245240$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Russell King <rmk+kernel@arm.linux.org.uk>, Ben Dooks <ben-linux@fluff.org>

Hi,

As you decide to rename the mach name, how to change the board name tog=
ether?
Historically samsung use the "mach-" prefix for board name, but others
are use the "board-" prefix.
So let's use the same convention as others?

How do you think?

Thank you,
Kyungmin Park

On Tue, Oct 4, 2011 at 10:21 PM, Kukjin Kim <kgene.kim@samsung.com> wro=
te:
> Hi Arnd,
>
> This is a second Samsung board stuff for v3.2 and includes new board,
> SMDK4412.
>
> Please pull from:
> =A0git://github.com/kgene/linux-samsung.git next-samsung-board-2
>
> As a note, since supporting SMDK4412 needs previous next-samsung-boar=
d
> branch so this is based on next-samsung-board which has been already =
merged
> into arm-soc and this includes converting boot_params to atag_offset =
for
> adding/changing boards in this time.
>
> If any problems, please let me know.
>
> One more as a note, the next-samsung-devel and next-samsung-devel-2 w=
ill be
> sent to you soon after testing ;)
>
> Thanks.
>
> Best regards,
> Kgene.
> --
> Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
> SW Solution Development Team, Samsung Electronics Co., Ltd.
>
> The following changes since commit 2520123382e97271e932377c83bca010c2=
65be55:
>
> =A0Merge branch 'next-samsung-board-v3.1' into next-samsung-board (20=
11-09-16
> 17:13:09 +0900)
>
> are available in the git repository at:
>
> =A0git://github.com/kgene/linux-samsung.git next-samsung-board-2
>
> Changhwan Youn (7):
> =A0 =A0 =A0ARM: EXYNOS4: Add support PPI in external GIC
> =A0 =A0 =A0ARM: EXYNOS4: Add support MCT PPI for EXYNOS4212
> =A0 =A0 =A0ARM: EXYNOS4: Add support new EXYNOS4412 SoC
> =A0 =A0 =A0ARM: EXYNOS4: Add support clock for EXYNOS4412
> =A0 =A0 =A0ARM: EXYNOS4: Add functions for gic interrupt handling
> =A0 =A0 =A0ARM: EXYNOS4: Add MCT support for EXYNOS4412
> =A0 =A0 =A0ARM: EXYNOS4: Add support SMDK4412 Board
>
> Tushar Behera (1):
> =A0 =A0 =A0ARM: EXYNOS4: convert boot_params to atag_offset
>
> =A0arch/arm/mach-exynos4/Kconfig =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0| =A0 14 ++
> =A0arch/arm/mach-exynos4/Makefile =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 | =A0 =A03 +-
> =A0arch/arm/mach-exynos4/clock.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0| =A0 =A04 +-
> =A0arch/arm/mach-exynos4/cpu.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0| =A0 21 ++-
> =A0arch/arm/mach-exynos4/include/mach/entry-macro.S =A0 | =A0 29 +++-
> =A0arch/arm/mach-exynos4/include/mach/irqs.h =A0 =A0 =A0 =A0 =A0| =A0=
 =A02 +
> =A0arch/arm/mach-exynos4/include/mach/map.h =A0 =A0 =A0 =A0 =A0 | =A0=
 =A01 -
> =A0arch/arm/mach-exynos4/include/mach/regs-mct.h =A0 =A0 =A0| =A0 =A0=
5 +-
> =A0arch/arm/mach-exynos4/mach-origen.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
| =A0 =A02 +-
> =A0.../{mach-smdk4212.c =3D> mach-smdk4x12.c} =A0 =A0 =A0 =A0 =A0 | =A0=
128 ++++++++-------
> =A0arch/arm/mach-exynos4/mach-smdkv310.c =A0 =A0 =A0 =A0 =A0 =A0 =A0|=
 =A0 =A04 +-
> =A0arch/arm/mach-exynos4/mct.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0| =A0166
> ++++++++++++--------
> =A0arch/arm/mach-exynos4/platsmp.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0| =A0 =A05 +-
> =A0arch/arm/plat-s5p/cpu.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0| =A0 =A09 +
> =A0arch/arm/plat-samsung/include/plat/cpu.h =A0 =A0 =A0 =A0 =A0 | =A0=
 =A08 +
> =A015 files changed, 251 insertions(+), 150 deletions(-)
> =A0rename arch/arm/mach-exynos4/{mach-smdk4212.c =3D> mach-smdk4x12.c=
} (61%)
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsu=
ng-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>
