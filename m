From: =?ks_c_5601-1987?B?w9bBvsiv?= <jhbird.choi@samsung.com>
Subject: [PATCH 2/2] ARM: samsung: call clk_get_rate for debugfs rate files
Date: Fri, 07 Sep 2012 16:21:50 +0900
Message-ID: <004b01cd8cc9$72a4f1e0$57eed5a0$%choi@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ks_c_5601-1987
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:34626 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751011Ab2IGHVx (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 7 Sep 2012 03:21:53 -0400
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout2.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0M9Y00E3GXRIPGK0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 07 Sep 2012 16:21:50 +0900 (KST)
Received: from DOJHBIRDCHO03 ([12.23.118.55])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0M9Y00J1QXSEDE10@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 07 Sep 2012 16:21:50 +0900 (KST)
References: 
In-reply-to: 
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: inux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, ben-linux@fluff.org

From: Colin Cross <ccross@android.com>

c->rate is rarely set, call clk_get_rate on the clock to print
the value in /d/clock/.../rate.

Signed-off-by: Colin Cross <ccross@android.com>
Signed-off-by: Jonghwan Choi <jhbird.choi@samsung.com>
---
 arch/arm/plat-samsung/clock.c |   10 +++++++++-
 1 files changed, 9 insertions(+), 1 deletions(-)

diff --git a/arch/arm/plat-samsung/clock.c b/arch/arm/plat-samsung/clock.c
index 9392959..b8ec1cf 100644
--- a/arch/arm/plat-samsung/clock.c
+++ b/arch/arm/plat-samsung/clock.c
@@ -454,6 +454,14 @@ static const struct file_operations clock_tree_fops = {
        .release        = single_release,
 };

+static int clock_rate_show(void *data, u64 *val)
+{
+       struct clk *c = data;
+       *val = clk_get_rate(c);
+       return 0;
+}
+DEFINE_SIMPLE_ATTRIBUTE(clock_rate_fops, clock_rate_show, NULL, "%llu\n");
+
 static int clk_debugfs_register_one(struct clk *c)
 {
        int err;
@@ -480,7 +488,7 @@ static int clk_debugfs_register_one(struct clk *c)
                goto err_out;
        }

-       d = debugfs_create_u32("rate", S_IRUGO, c->dent, (u32 *)&c->rate);
+       d = debugfs_create_file("rate", S_IRUGO, c->dent, c,
&clock_rate_fops);
        if (!d) {
                err = -ENOMEM;
                goto err_out;
--
1.7.1
