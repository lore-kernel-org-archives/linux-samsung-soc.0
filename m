From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [GIT PULL 3/3] 2nd Round Samsung mach-exynos for v3.12
Date: Wed, 28 Aug 2013 00:57:25 +0900
Message-ID: <521CCC65.3070605@samsung.com>
References: <1f7701cea1f1$431f2d30$c95d8790$%kim@samsung.com> <3145165.ZB7l3vNJ7a@amdc1032> <CADGdYn7_Gm7rwkhRSUmvktB_hHNboY8eB5fi8E62-Br5Vk5D0A@mail.gmail.com> <4070794.XxjluIqBpK@amdc1032> <CADGdYn7YWscQ_EOqjbq29pNHvoxa0qqXHZeOBuz-Wi22H=Dc_w@mail.gmail.com> <87bo4j6aii.fsf@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f49.google.com ([209.85.220.49]:52484 "EHLO
	mail-pa0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751627Ab3H0P5j (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 27 Aug 2013 11:57:39 -0400
Received: by mail-pa0-f49.google.com with SMTP id ld10so4997845pab.22
        for <linux-samsung-soc@vger.kernel.org>; Tue, 27 Aug 2013 08:57:38 -0700 (PDT)
In-Reply-To: <87bo4j6aii.fsf@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kevin Hilman <khilman@linaro.org>
Cc: amit daniel kachhap <amit.daniel@samsung.com>, arm@kernel.org, Arnd Bergmann <arnd@arndb.de>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Olof Johansson <olof@lixom.net>, LAK <linux-arm-kernel@lists.infradead.org>

On 08/27/13 13:08, Kevin Hilman wrote:
> amit daniel kachhap<amit.daniel@samsung.com>  writes:
>
>> Submitted the V2 version of this patch with your suggestion.
>
> So will there be an updated branch (and pull request) with these changes?
>
OK, Bart's concern makes sense so I replaced with Amit's v2 patch.

Kevin, here is updated branch so please pull following.

If any problems, please kindly let me know.

Thanks,
Kukjin

The following changes since commit ad81f0545ef01ea651886dddac4bef6cec930092:

   Linux 3.11-rc1 (2013-07-14 15:18:27 -0700)

are available in the git repository at:

   git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git 
tags/samsung-mach-exynos-v2

for you to fetch changes up to 1e9fec0e40deff9d18e4197b5f5f99f85f5d36a5:

   ARM: EXYNOS: Skip C1 cpuidle state for exynos5440 (2013-08-28 
00:51:21 +0900)

----------------------------------------------------------------
update mach-exynos v2 for v3.12
- enable ARCH_HAS_BANDGAP for exynos SoCs
- always enable PM domains for exynos4x12
- skip C1 cpuidle state for exynos5440

----------------------------------------------------------------
Amit Daniel Kachhap (2):
       ARM: EXYNOS: enable ARCH_HAS_BANDGAP
       ARM: EXYNOS: Skip C1 cpuidle state for exynos5440

Bartlomiej Zolnierkiewicz (1):
       ARM: EXYNOS: always enable PM domains support for EXYNOS4X12

  arch/arm/mach-exynos/Kconfig   | 7 +++++++
  arch/arm/mach-exynos/cpuidle.c | 3 +++
  2 files changed, 10 insertions(+)
