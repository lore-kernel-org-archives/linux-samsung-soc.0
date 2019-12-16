Return-Path: <SRS0=IpvG=2G=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CFCDC2D0C0
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 16 Dec 2019 13:14:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5D51E2072B
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 16 Dec 2019 13:14:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="W/I1zeGL"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727849AbfLPNO0 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 16 Dec 2019 08:14:26 -0500
Received: from mailout2.w1.samsung.com ([210.118.77.12]:48224 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727846AbfLPNO0 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 16 Dec 2019 08:14:26 -0500
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20191216131424euoutp029aa65fa45b1abe1615f27ad972ec95c8~g3EZVKn5_1582915829euoutp02X
        for <linux-samsung-soc@vger.kernel.org>; Mon, 16 Dec 2019 13:14:24 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20191216131424euoutp029aa65fa45b1abe1615f27ad972ec95c8~g3EZVKn5_1582915829euoutp02X
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1576502064;
        bh=i1cHA69tXmYbuVXT7kPvjti3xJZv9V13FraHyFdHx28=;
        h=From:To:Cc:Subject:Date:References:From;
        b=W/I1zeGLm2cy2KpcW6gAibvwrTOWqkftzDaVzpJJXF0oz0jcvATG73uN5OFjohNza
         xD59OA0+Ydc7zTWDBTE3KhbKacLXOjBT0DjGgJsHnCN6e9EasKA6vWE0NGjtuWIn5I
         SWgF5Rt3ugzra5quxVAkeGwGRWuuZAHpVmcqldRI=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20191216131423eucas1p17f87df1646b670537ca0cc2a4f27baca~g3EY0gPPC1855718557eucas1p15;
        Mon, 16 Dec 2019 13:14:23 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges1new.samsung.com (EUCPMTA) with SMTP id E1.CA.61286.F2387FD5; Mon, 16
        Dec 2019 13:14:23 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20191216131423eucas1p2162d6bf0a870357be9f0ab308641015b~g3EYbT4-N0316803168eucas1p2N;
        Mon, 16 Dec 2019 13:14:23 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20191216131423eusmtrp152303804333bee9a2cfadb08336547a2~g3EYat_bW3045930459eusmtrp1r;
        Mon, 16 Dec 2019 13:14:23 +0000 (GMT)
X-AuditID: cbfec7f2-f0bff7000001ef66-e5-5df7832f19b3
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id 14.44.08375.F2387FD5; Mon, 16
        Dec 2019 13:14:23 +0000 (GMT)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20191216131422eusmtip175022561335d172149a30b2ef56af16b~g3EX6sSFY1012910129eusmtip1d;
        Mon, 16 Dec 2019 13:14:22 +0000 (GMT)
From:   Marek Szyprowski <m.szyprowski@samsung.com>
To:     linux-clk@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Sylwester Nawrocki <snawrocki@kernel.org>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Marian Mihailescu <mihailescu2m@gmail.com>,
        Stephen Boyd <sboyd@kernel.org>
Subject: [PATCH v2] clk: samsung: exynos5420: Keep top G3D clocks enabled
Date:   Mon, 16 Dec 2019 14:14:07 +0100
Message-Id: <20191216131407.17225-1-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrKIsWRmVeSWpSXmKPExsWy7djPc7r6zd9jDX69VbbYOGM9q8X1L89Z
        Lc6f38Bu8bHnHqvFjPP7mCzWHrnLbrF+2k9Wi3/XNrJYtD99yezA6bFz1l12j02rOtk8+ras
        YvT4vEkugCWKyyYlNSezLLVI3y6BK6Nl1W2WgikqFX9/LWdpYPwu18XIySEhYCLx7/sxli5G
        Lg4hgRWMEk+evWGGcL4wStxd0QSV+cwosfDmDyaYlrUrpjNCJJYzSizecg2hZesJkH5ODjYB
        Q4mut11sILaIgIPE50+vwTqYBTYxSVxZswWsSFjAU2JTyzqwsSwCqhKPpnWwgti8ArYSkxes
        g1onL7F6wwGwDRIC99kkmvdvYIdIuEjc6f7CCmELS7w6vgUqLiNxenIPC0RDM6PEw3Nr2SGc
        HkaJy00zGCGqrCUOH78I1M0BdJOmxPpd+iCmhICjxINFDhAmn8SNt4IgxcxA5qRt05khwrwS
        HW1CEDPUJGYdXwe39eCFS8wQtofE7A3/wWwhgViJ1Wu7mScwys1CWLWAkXEVo3hqaXFuemqx
        YV5quV5xYm5xaV66XnJ+7iZGYGI4/e/4px2MXy8lHWIU4GBU4uGVKPkeK8SaWFZcmXuIUYKD
        WUmEd4cCUIg3JbGyKrUoP76oNCe1+BCjNAeLkjiv8aKXsUIC6YklqdmpqQWpRTBZJg5OqQbG
        8O+prUKrPZan3+qfppLtZh0YzLaIZ9HTCCVzc/MvTS8OFNnKvfAxEXA/qKJs8lNpsfG8b54i
        XE+YpPXvPJD/77c27Mnltwmsd7KuKNR1Vd35Mdu2brdXzd+sidqvTqVu4zGTVfHpkL0y5wlP
        YzizyOP9B2o2SzFfUdH6OqneNXa21LHUjUFKLMUZiYZazEXFiQC8Z91XCAMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrNLMWRmVeSWpSXmKPExsVy+t/xu7r6zd9jDV6v4LHYOGM9q8X1L89Z
        Lc6f38Bu8bHnHqvFjPP7mCzWHrnLbrF+2k9Wi3/XNrJYtD99yezA6bFz1l12j02rOtk8+ras
        YvT4vEkugCVKz6Yov7QkVSEjv7jEVina0MJIz9DSQs/IxFLP0Ng81srIVEnfziYlNSezLLVI
        3y5BL6Nl1W2WgikqFX9/LWdpYPwu18XIySEhYCKxdsV0xi5GLg4hgaWMEiuObWeBSMhInJzW
        wAphC0v8udbFBlH0iVHiyNw5jCAJNgFDia63IAlODhEBJ4kH696wgxQxC2xjkti5/T5Yt7CA
        p8SmlnVMIDaLgKrEo2kdYHFeAVuJyQsg4hIC8hKrNxxgnsDIs4CRYRWjSGppcW56brGhXnFi
        bnFpXrpecn7uJkZgQG479nPzDsZLG4MPMQpwMCrx8EqUfI8VYk0sK67MPcQowcGsJMK7QwEo
        xJuSWFmVWpQfX1Sak1p8iNEUaPlEZinR5HxgtOSVxBuaGppbWBqaG5sbm1koifN2CByMERJI
        TyxJzU5NLUgtgulj4uCUamBM5E9pSZa5EKHttWL2sdmrsvyTbCYUv8hRejIpZotQmP530cs9
        q4SlJyZf5nrw790JoUni54LXFb9qWL/7rNoBN49tooLXA2uan7Asi7E+Yz1lz1n/CK+NtY8l
        zr7ZE7DtnV9w4JzZ2QHvj6/SDPpcGhGn2tM06XKy1rMpIQElxQ/idsmnNVkrsRRnJBpqMRcV
        JwIAidcuoF4CAAA=
X-CMS-MailID: 20191216131423eucas1p2162d6bf0a870357be9f0ab308641015b
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20191216131423eucas1p2162d6bf0a870357be9f0ab308641015b
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20191216131423eucas1p2162d6bf0a870357be9f0ab308641015b
References: <CGME20191216131423eucas1p2162d6bf0a870357be9f0ab308641015b@eucas1p2.samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

In Exynos542x/5800 SoCs, the G3D leaf clocks are located in the G3D power
domain. This is similar to the other hardware modules and their power
domains. However there is one thing specific to G3D clocks hierarchy.
Unlike other hardware modules, the G3D clocks hierarchy doesn't have any
gate clock between the TOP part of the hierarchy and the part located in
the power domain and some SoC internal busses are sourced directly from
the TOP muxes. The consequence of this design if the fact that the TOP
part of the hierarchy has to be enabled permanently to ensure proper
operation of the SoC power related components (G3D power domain and
Exynos Power Management Unit for system suspend/resume).

This patch adds an explicit call to clk_prepare_enable() on the last MUX
in the TOP part of G3D clock hierarchy to keep it enabled permanently to
ensure that the internal busses get their clock regardless of the main
G3D clock enablement status.

This fixes following imprecise abort issue observed on Odroid XU3/XU4
after enabling Panfrost driver by commit 1a5a85c56402 "ARM: dts: exynos:
Add Mali/GPU node on Exynos5420 and enable it on Odroid XU3/4"):

panfrost 11800000.gpu: clock rate = 400000000
panfrost 11800000.gpu: failed to get regulator: -517
panfrost 11800000.gpu: regulator init failed -517
Power domain G3D disable failed
...
panfrost 11800000.gpu: clock rate = 400000000
8<--- cut here ---
Unhandled fault: imprecise external abort (0x1406) at 0x00000000
pgd = (ptrval)
[00000000] *pgd=00000000
Internal error: : 1406 [#1] PREEMPT SMP ARM
Modules linked in:
CPU: 7 PID: 53 Comm: kworker/7:1 Not tainted 5.4.0-rc8-next-20191119-00032-g56f1001191a6 #6923
Hardware name: SAMSUNG EXYNOS (Flattened Device Tree)
Workqueue: events deferred_probe_work_func
PC is at panfrost_gpu_soft_reset+0x94/0x110
LR is at ___might_sleep+0x128/0x2dc
...
[<c05c231c>] (panfrost_gpu_soft_reset) from [<c05c2704>] (panfrost_gpu_init+0x10/0x67c)
[<c05c2704>] (panfrost_gpu_init) from [<c05c15d0>] (panfrost_device_init+0x158/0x2cc)
[<c05c15d0>] (panfrost_device_init) from [<c05c0cb0>] (panfrost_probe+0x80/0x178)
[<c05c0cb0>] (panfrost_probe) from [<c05cfaa0>] (platform_drv_probe+0x48/0x9c)
[<c05cfaa0>] (platform_drv_probe) from [<c05cd20c>] (really_probe+0x1c4/0x474)
[<c05cd20c>] (really_probe) from [<c05cd694>] (driver_probe_device+0x78/0x1bc)
[<c05cd694>] (driver_probe_device) from [<c05cb374>] (bus_for_each_drv+0x74/0xb8)
[<c05cb374>] (bus_for_each_drv) from [<c05ccfa8>] (__device_attach+0xd4/0x16c)
[<c05ccfa8>] (__device_attach) from [<c05cc110>] (bus_probe_device+0x88/0x90)
[<c05cc110>] (bus_probe_device) from [<c05cc634>] (deferred_probe_work_func+0x4c/0xd0)
[<c05cc634>] (deferred_probe_work_func) from [<c0149df0>] (process_one_work+0x300/0x864)
[<c0149df0>] (process_one_work) from [<c014a3ac>] (worker_thread+0x58/0x5a0)
[<c014a3ac>] (worker_thread) from [<c0151174>] (kthread+0x12c/0x160)
[<c0151174>] (kthread) from [<c01010b4>] (ret_from_fork+0x14/0x20)
Exception stack(0xee03dfb0 to 0xee03dff8)
...
Code: e594300c e5933020 e3130c01 1a00000f (ebefff50).
---[ end trace badde2b74a65a540 ]---

In the above case, the Panfrost driver disables G3D clocks after failure
of getting the needed regulator and return with -EPROVE_DEFER code. This
causes G3D power domain disable failure and then, during second probe
an imprecise abort is triggered due to undefined power domain state.

Fixes: 45f10dabb56b ("clk: samsung: exynos5420: Add SET_RATE_PARENT flag to clocks on G3D path")
Fixes: c9f7567aff31 ("clk: samsung: exynos542x: Move G3D subsystem clocks to its sub-CMU")
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/clk/samsung/clk-exynos5420.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/clk/samsung/clk-exynos5420.c b/drivers/clk/samsung/clk-exynos5420.c
index 3a991ca1ee36..c9e5a1fb6653 100644
--- a/drivers/clk/samsung/clk-exynos5420.c
+++ b/drivers/clk/samsung/clk-exynos5420.c
@@ -12,6 +12,7 @@
 #include <linux/clk-provider.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
+#include <linux/clk.h>
 
 #include "clk.h"
 #include "clk-cpu.h"
@@ -1646,6 +1647,13 @@ static void __init exynos5x_clk_init(struct device_node *np,
 				     exynos5x_subcmus);
 	}
 
+	/*
+	 * Keep top part of G3D clock path enabled permanently to ensure
+	 * that the internal busses get their clock regardless of the
+	 * main G3D clock enablement status.
+	 */
+	clk_prepare_enable(__clk_lookup("mout_sw_aclk_g3d"));
+
 	samsung_clk_of_add_provider(np, ctx);
 }
 
-- 
2.17.1

