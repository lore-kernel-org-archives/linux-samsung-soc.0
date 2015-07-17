From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: [GIT PULL] ARM: defconfig: Improvements for 4.3
Date: Fri, 17 Jul 2015 15:51:17 +0900
Message-ID: <1437115877-22010-1-git-send-email-k.kozlowski@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:16542 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754560AbbGQGvo (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 17 Jul 2015 02:51:44 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <k.kozlowski@samsung.com>

Dear Kukjin,

Few defconfig related changes.

Description along with a tag.
You can find them also on the lists with my reviewed-by.

Best regards,
Krzysztof


The following changes since commit 1c4c7159ed2468f3ac4ce5a7f08d79663d381a93:

  Merge tag 'ext4_for_linus_stable' of git://git.kernel.org/pub/scm/linux/kernel/git/tytso/ext4 (2015-07-05 16:24:54 -0700)

are available in the git repository at:


  https://github.com/krzk/linux.git tags/samsung-defconfig-4.3

for you to fetch changes up to 5efedc7617df7add295702f21f11dd7e7a67b76e:

  ARM: multi_v7_defconfig: Enable max77802 regulator (2015-07-16 15:57:31 +0900)

----------------------------------------------------------------
Defconfig changes around Exynos based boards:
1. Enable sound on Odroid XU3 on exynos defconfig.
2. Enable NTC thermistors for Chromebooks on exynos and multi_v7.
3. Enable main PMIC regulator for Chromebooks on multi_v7.
4. Clean up in multi_v7 - remove old (non-existing) configs.

----------------------------------------------------------------
Anand Moon (1):
      ARM: exynos_defconfig: Enable CONFIG_SND_SOC_ODROIDX2 for Odroid-XU3

Javier Martinez Canillas (4):
      ARM: multi_v7_defconfig: Remove old Samsung USB PHY configs
      ARM: multi_v7_defconfig: Enable NTC Thermistors support
      ARM: exynos_defconfig: Enable NTC Thermistors support
      ARM: multi_v7_defconfig: Enable max77802 regulator

 arch/arm/configs/exynos_defconfig   | 3 +++
 arch/arm/configs/multi_v7_defconfig | 5 +++--
 2 files changed, 6 insertions(+), 2 deletions(-)
