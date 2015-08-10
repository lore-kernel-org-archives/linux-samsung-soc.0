From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: [GIT PULL] Samsung mach fixes for 4.2
Date: Mon, 10 Aug 2015 10:52:10 +0900
Message-ID: <1439171530-971-1-git-send-email-k.kozlowski@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:38762 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752120AbbHJBwX (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 9 Aug 2015 21:52:23 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <k.kozlowski@samsung.com>

Dear Kukjin,

Please find latest two fixes for v4.2 cycle. You can find more detailed
description with the tag.

Best regards,
Krzysztof


The following changes since commit d770e558e21961ad6cfdf0ff7df0eb5d7d4f0754:

  Linux 4.2-rc1 (2015-07-05 11:01:52 -0700)

are available in the git repository at:

  https://github.com/krzk/linux.git tags/samsung-mach-fixes-4.2

for you to fetch changes up to 3e9f798784b30293012682021d5a0352f78658b8:

  ARM: EXYNOS: fix double of_node_put() on error path (2015-07-31 10:12:17 +0900)

----------------------------------------------------------------
Two fixes for bugs in Exynos power domain error exit path:
1. kfree() of read-only memory (name of power domain returned
   by kstrdup_const()),
2. Doubled of_node_put() leading to invalid ref count for OF node.

----------------------------------------------------------------
Vladimir Zapolskiy (2):
      ARM: EXYNOS: Fix potentian kfree() of ro memory
      ARM: EXYNOS: fix double of_node_put() on error path

 arch/arm/mach-exynos/pm_domains.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
