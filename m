From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] ARM: Samsung: Remove unused code for the clocks debug-fs
 interface
Date: Wed, 05 Sep 2012 07:41:14 +0900
Message-ID: <227c01cd8aee$638ee0d0$2aaca270$%kim@samsung.com>
References: <1346603823-14422-1-git-send-email-sylvester.nawrocki@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:38661 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757813Ab2IDWlP (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 4 Sep 2012 18:41:15 -0400
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0M9U00634KCQ6B00@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 05 Sep 2012 07:41:14 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.119.152])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0M9U003GMKCQ9310@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 05 Sep 2012 07:41:14 +0900 (KST)
In-reply-to: <1346603823-14422-1-git-send-email-sylvester.nawrocki@gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Sylwester Nawrocki' <sylvester.nawrocki@gmail.com>
Cc: thomas.abraham@linaro.org, amit.daniel@samsung.com, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, jhbird.choi@samsung.com, arve@android.com

Sylwester Nawrocki wrote:
> 
> Commit f86c6660927614fcda257 "ARM: SAMSUNG: Add clkdev infrastructure"
> disabled population of the 'clocks' list - the clocks are now on the
> clkdev clock list. However, this effectively broke the existing clocks
> debug-fs interface on all Samsung platforms. Nobody complained about
> this missing feature for over one year, so remove the unused code.
> 
Yeah, could be. BTW, following will fix it on Samsung platforms?

From: Arve Hj<C3><B8>nnev<C3><A5>g <arve@android.com>
Subject: [PATCH] ARM: SAMSUNG: Fix clock debugfs code

Restore list add deleted by commit f86c66609276('ARM: SAMSUNG:
Add clkdev infrastructure') and fix clk_debugfs_register_one
to not crash when devname is NULL.

Signed-off-by: Arve Hj<C3><B8>nnev<C3><A5>g <arve@android.com>
Signed-off-by: Jonghwan Choi <jhbird.choi@samsung.com>
---
 arch/arm/plat-samsung/clock.c |   15 ++++++++++++++-
 1 files changed, 14 insertions(+), 1 deletions(-)

diff --git a/arch/arm/plat-samsung/clock.c b/arch/arm/plat-samsung/clock.c
index 65c5eca..b7338ce 100644
--- a/arch/arm/plat-samsung/clock.c
+++ b/arch/arm/plat-samsung/clock.c
@@ -281,6 +281,15 @@ int s3c24xx_register_clock(struct clk *clk)
 	if (clk->enable == NULL)
 		clk->enable = clk_null_enable;
 
+	/* add to the list of available clocks */
+
+	/* Quick check to see if this clock has already been registered. */
+	BUG_ON(clk->list.prev != clk->list.next);
+
+	spin_lock(&clocks_lock);
+	list_add(&clk->list, &clocks);
+	spin_unlock(&clocks_lock);
+
 	/* fill up the clk_lookup structure and register it*/
 	clk->lookup.dev_id = clk->devname;
 	clk->lookup.con_id = clk->name;
@@ -395,7 +404,11 @@ static int clk_debugfs_register_one(struct clk *c)
 	char s[255];
 	char *p = s;
 
-	p += sprintf(p, "%s", c->devname);
+	if (c->name)
+		p += sprintf(p, "%s", c->name);
+
+	if (c->devname)
+		p += sprintf(p, ":%s", c->devname);
 
 	d = debugfs_create_dir(s, pa ? pa->dent : clk_debugfs_root);
 	if (!d)
-- 
1.7.1

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.

> This functionality will be restored when switching to the common clock
> framework.
> 
> Signed-off-by: Sylwester Nawrocki <sylvester.nawrocki@gmail.com>
> ---
>  arch/arm/plat-samsung/clock.c              |   92
---------------------------
> -
>  arch/arm/plat-samsung/include/plat/clock.h |    8 +--
>  2 files changed, 1 insertions(+), 99 deletions(-)
