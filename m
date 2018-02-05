From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH] clk: samsung: Add git tree entry to MAINTAINERS
Date: Mon, 05 Feb 2018 15:41:58 +0100
Message-ID: <20180205144158.10500-1-s.nawrocki@samsung.com>
References: <CGME20180205144215epcas1p4f7da6d58948bac6f4f313108596a0fb4@epcas1p4.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:61613 "EHLO
        mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752612AbeBEOmS (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 5 Feb 2018 09:42:18 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-clk@vger.kernel.org
Cc: sboyd@codeaurora.org, mturquette@baylibre.com, linux-samsung-soc@vger.kernel.org, cw00.choi@samsung.com, linux-kernel@vger.kernel.org, krzk@kernel.org, tomasz.figa@gmail.com, b.zolnierkie@samsung.com, m.szyprowski@samsung.com, Sylwester Nawrocki <s.nawrocki@samsung.com>

Add a missing git tree entry for drivers/clk/samsung.

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index aa71ab52fd76..502442dc08eb 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12001,6 +12001,7 @@ M:	Tomasz Figa <tomasz.figa@gmail.com>
 M:	Chanwoo Choi <cw00.choi@samsung.com>
 S:	Supported
 L:	linux-samsung-soc@vger.kernel.org (moderated for non-subscribers)
+T:	git git://git.kernel.org/pub/scm/linux/kernel/git/snawrocki/clk.git
 F:	drivers/clk/samsung/
 F:	include/dt-bindings/clock/exynos*.h
 F:	Documentation/devicetree/bindings/clock/exynos*.txt
-- 
2.14.2
