From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [GIT PULL V2 3/3] 2nd Round Samsung mach-exynos-v2 for v3.12
Date: Wed, 28 Aug 2013 08:34:58 +0900
Message-ID: <232401cea37e$0afca7a0$20f5f6e0$%kim@samsung.com>
References: <1f7701cea1f1$431f2d30$c95d8790$%kim@samsung.com>
 <3145165.ZB7l3vNJ7a@amdc1032>
 <CADGdYn7_Gm7rwkhRSUmvktB_hHNboY8eB5fi8E62-Br5Vk5D0A@mail.gmail.com>
 <4070794.XxjluIqBpK@amdc1032>
 <CADGdYn7YWscQ_EOqjbq29pNHvoxa0qqXHZeOBuz-Wi22H=Dc_w@mail.gmail.com>
 <87bo4j6aii.fsf@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:53828 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751522Ab3H0XfB (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 27 Aug 2013 19:35:01 -0400
Received: from epcpsbgr5.samsung.com
 (u145.gpu120.samsung.co.kr [203.254.230.145])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MS700201QU59080@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 28 Aug 2013 08:34:58 +0900 (KST)
In-reply-to: <87bo4j6aii.fsf@linaro.org>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Kevin Hilman' <khilman@linaro.org>, 'amit daniel kachhap' <amit.daniel@samsung.com>
Cc: 'Bartlomiej Zolnierkiewicz' <b.zolnierkie@samsung.com>, 'linux-samsung-soc' <linux-samsung-soc@vger.kernel.org>, arm@kernel.org, 'Arnd Bergmann' <arnd@arndb.de>, 'Olof Johansson' <olof@lixom.net>, 'LAK' <linux-arm-kernel@lists.infradead.org>

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
