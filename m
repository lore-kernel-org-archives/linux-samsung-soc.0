From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: [GIT PULL] Non-critical fixes for v4.3
Date: Fri, 24 Jul 2015 15:34:55 +0900
Message-ID: <1437719695-22340-1-git-send-email-k.kozlowski@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:21259 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751359AbbGXGfC (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 24 Jul 2015 02:35:02 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <k.kozlowski@samsung.com>

Dear Kukjin,

Previously you did not picked up the fix for cpufreq memory leak.
I am sending it again with respective acks from LKML. Also another
minor improvement in the set.

Best regards,
Krzysztof


The following changes since commit 1c4c7159ed2468f3ac4ce5a7f08d79663d381a93:

  Merge tag 'ext4_for_linus_stable' of git://git.kernel.org/pub/scm/linux/kernel/git/tytso/ext4 (2015-07-05 16:24:54 -0700)

are available in the git repository at:


  https://github.com/krzk/linux.git tags/samsung-fixes-non-critical-v4.3-2

for you to fetch changes up to 434213f727c12fab8657c8db3d23da4b0463365d:

  video: fbdev: s3c-fb: Constify platform_device_id (2015-07-24 15:17:32 +0900)

----------------------------------------------------------------
Improvements for Exynos boards:
1. Fix memory leak in cpufreq error path.
2. Constify platform_device_id in video/fbdev/s3c-fb.

----------------------------------------------------------------
Krzysztof Kozlowski (1):
      video: fbdev: s3c-fb: Constify platform_device_id

Shailendra Verma (1):
      cpufreq: exynos: Fix for memory leak in case SOC name does not match

 drivers/cpufreq/exynos-cpufreq.c | 6 ++++--
 drivers/video/fbdev/s3c-fb.c     | 2 +-
 2 files changed, 5 insertions(+), 3 deletions(-)
