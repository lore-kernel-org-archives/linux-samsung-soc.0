From: Vladimir Zapolskiy <vz@mleia.com>
Subject: [PATCH v2 0/2] pd: fix resource deallocation on error path
Date: Fri, 31 Jul 2015 03:09:48 +0300
Message-ID: <1438301390-7397-1-git-send-email-vz@mleia.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from li271-223.members.linode.com ([178.79.152.223]:42162 "EHLO
	mail.mleia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750938AbbGaAJ4 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 30 Jul 2015 20:09:56 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Russell King <linux@arm.linux.org.uk>, Marek Szyprowski <m.szyprowski@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

The first change fixes a bug introduced by 2be2a3ff42a5, memory
allocated by kstrdup_const() must be always deallocated with
kfree_const(), otherwise there is a risk of kfree'ing ro memory.

The second change removes double of_node_put(), if
for_each_compatible_node() body execution is not terminated. This
prevents from object refcounter overflow over zero in OF_DYNAMIC
build.

Vladimir Zapolskiy (2):
  ARM: EXYNOS: pd: fix potentian kfree() of ro memory
  ARM: EXYNOS: fix double of_node_put() on error path

 arch/arm/mach-exynos/pm_domains.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

-- 
2.1.4
