Return-Path: <SRS0=tYdk=ZN=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1E01C43215
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 21 Nov 2019 10:12:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id AF40B2089F
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 21 Nov 2019 10:12:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="NAI3W06u"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726014AbfKUKMC (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 21 Nov 2019 05:12:02 -0500
Received: from mailout1.w1.samsung.com ([210.118.77.11]:38378 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726165AbfKUKMB (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 21 Nov 2019 05:12:01 -0500
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20191121101159euoutp01d622ac25cc78da263f498235492f7b02~ZJc-aL85z1442814428euoutp01F
        for <linux-samsung-soc@vger.kernel.org>; Thu, 21 Nov 2019 10:11:59 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20191121101159euoutp01d622ac25cc78da263f498235492f7b02~ZJc-aL85z1442814428euoutp01F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1574331119;
        bh=VbYhHBXrQ+f9JjMUWur76w2gZqUs+ZT1uklf3hdsPNA=;
        h=From:To:Cc:Subject:Date:References:From;
        b=NAI3W06ukbHKJfrkx5YxZNeQbiDHEJkSiWOLbcLDT8+zbJ0GScq/4NcYTNex9+Azn
         YwqhhZoyVSTvBz0PvZfrMzRTEx2zjX00+/vY5Q+lKndDjo3XVwT440TpWSRhDS+zUM
         NIVKFH1ZftGTaQfQE1gngKumPW8WFUAOC+pyQfmU=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20191121101159eucas1p1ba3fe11736ba0b1f7f148ff6d8645e26~ZJc-H6lXq1800618006eucas1p1L;
        Thu, 21 Nov 2019 10:11:59 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges3new.samsung.com (EUCPMTA) with SMTP id B8.E7.04374.FE266DD5; Thu, 21
        Nov 2019 10:11:59 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20191121101158eucas1p26b1f74cd2396a2461530e684d17a82e8~ZJc_xhgZd2129221292eucas1p2J;
        Thu, 21 Nov 2019 10:11:58 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20191121101158eusmtrp151356fbcbf44e1001b83c0360f1f7cfd~ZJc_wDVv31441014410eusmtrp1T;
        Thu, 21 Nov 2019 10:11:58 +0000 (GMT)
X-AuditID: cbfec7f5-4ddff70000001116-3c-5dd662ef9291
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id 63.B9.04166.EE266DD5; Thu, 21
        Nov 2019 10:11:58 +0000 (GMT)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20191121101158eusmtip1d9bdb89752255ad1605b0d8717f83358~ZJc_OZGE82070020700eusmtip1_;
        Thu, 21 Nov 2019 10:11:58 +0000 (GMT)
From:   Marek Szyprowski <m.szyprowski@samsung.com>
To:     linux-clk@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Sylwester Nawrocki <snawrocki@kernel.org>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Marian Mihailescu <mihailescu2m@gmail.com>
Subject: [PATCH] clk: samsung: exynos5420: Keep top G3D clocks enabled
Date:   Thu, 21 Nov 2019 11:11:45 +0100
Message-Id: <20191121101145.15899-1-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrPIsWRmVeSWpSXmKPExsWy7djPc7rvk67FGnQ0M1tsnLGe1eL6l+es
        FufPb2C3+Nhzj9Vixvl9TBZrj9xlt1g/7SerRfvTl8wOHB47Z91l99i0qpPNo2/LKkaPz5vk
        AliiuGxSUnMyy1KL9O0SuDIa1uxkLtgnW7GleT5zA+MFyS5GTg4JAROJd3O3MncxcnEICaxg
        lGjsWwflfGGUeNr/jh3C+cwo8fncGpYuRg6wlr2bzCDiyxklbn7/yQjX0bPtEiPIXDYBQ4mu
        t11sILaIgIPE50+vwYqYBfqZJPr6rjKDJIQF3CS+zJsIVsQioCqxYO4+JhCbV8BW4nLnPRaI
        A+UlVm84AHaThMB9Nom/Ey+yQiRcJD5v38EOYQtLvDq+BcqWkTg9uYcFoqGZUeLhubXsEE4P
        o8TlphmMEFXWEoePg0ziALpJU2L9Ln2IsKPE1ccnWCH+5JO48VYQJMwMZE7aNp0ZIswr0dEm
        BFGtJjHr+Dq4tQcvXGKGsD0kjm3+A1YuJBAr8f2s0gRGuVkIqxYwMq5iFE8tLc5NTy02zkst
        1ytOzC0uzUvXS87P3cQITAan/x3/uoNx35+kQ4wCHIxKPLwCaldjhVgTy4orcw8xSnAwK4nw
        7rl+JVaINyWxsiq1KD++qDQntfgQozQHi5I4bzXDg2ghgfTEktTs1NSC1CKYLBMHp1QDI+/0
        2av/qfDufHVXRyN5YYH0eW6b+H+JJXK/66LLg/ZenZpxyGJis3jHfM2WdLmvR3LTFp67ZLH2
        XmLAb5u5PJlv3tS8aZde23iLc+4Of6191tvDfVraNW4Ur1DmP5304KKO1LN81/7iW59nHFva
        eZHVrvv37t/KHyY1rVVe9apwwWJbd5Wb65RYijMSDbWYi4oTAXD2WGUCAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrKLMWRmVeSWpSXmKPExsVy+t/xu7rvkq7FGjzpVrbYOGM9q8X1L89Z
        Lc6f38Bu8bHnHqvFjPP7mCzWHrnLbrF+2k9Wi/anL5kdODx2zrrL7rFpVSebR9+WVYwenzfJ
        BbBE6dkU5ZeWpCpk5BeX2CpFG1oY6RlaWugZmVjqGRqbx1oZmSrp29mkpOZklqUW6dsl6GU0
        rNnJXLBPtmJL83zmBsYLkl2MHBwSAiYSezeZdTFycQgJLGWUmNH7lb2LkRMoLiNxcloDK4Qt
        LPHnWhcbRNEnRolDE3qZQRJsAoYSXW9BEpwcIgJOEg/WvWEHKWIWmMwksb1pKQtIQljATeLL
        vIlgRSwCqhIL5u5jArF5BWwlLnfeY4HYIC+xesMB5gmMPAsYGVYxiqSWFuem5xYb6hUn5haX
        5qXrJefnbmIEBuG2Yz8372C8tDH4EKMAB6MSD6+A2tVYIdbEsuLK3EOMEhzMSiK8e65fiRXi
        TUmsrEotyo8vKs1JLT7EaAq0fCKzlGhyPjBC8kriDU0NzS0sDc2NzY3NLJTEeTsEDsYICaQn
        lqRmp6YWpBbB9DFxcEo1MAZEb6yYXO/fqsuafkl0m8a151q1XtfXCSyXr9zGH7Zf02f9q0lO
        Xv/TdCa75386dVJWy8vpxELBoFdr3d4wC4ixJKQ/mH00Iv7bt9u/L62cL65T9bRy6+VKfZ7s
        JRGnDHafefBVdkLEAfaHExxWr5BdufR24iQbme8nU5zrp92yMtjx2nKTcrgSS3FGoqEWc1Fx
        IgB/t6vQWAIAAA==
X-CMS-MailID: 20191121101158eucas1p26b1f74cd2396a2461530e684d17a82e8
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20191121101158eucas1p26b1f74cd2396a2461530e684d17a82e8
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20191121101158eucas1p26b1f74cd2396a2461530e684d17a82e8
References: <CGME20191121101158eucas1p26b1f74cd2396a2461530e684d17a82e8@eucas1p2.samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

All top clocks on G3D path has to be enabled all the time to allow proper
G3D power domain operation. This is achieved by adding CRITICAL flag to
"mout_sw_aclk_g3d" clock, what keeps this clock and all its parents
enabled.

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
 drivers/clk/samsung/clk-exynos5420.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/samsung/clk-exynos5420.c b/drivers/clk/samsung/clk-exynos5420.c
index 3a991ca1ee36..89126ba66995 100644
--- a/drivers/clk/samsung/clk-exynos5420.c
+++ b/drivers/clk/samsung/clk-exynos5420.c
@@ -712,7 +712,7 @@ static const struct samsung_mux_clock exynos5x_mux_clks[] __initconst = {
 	MUX(0, "mout_sw_aclk266_g2d", mout_sw_aclk266_g2d_p,
 			SRC_TOP12, 12, 1),
 	MUX_F(0, "mout_sw_aclk_g3d", mout_sw_aclk_g3d_p, SRC_TOP12, 16, 1,
-	      CLK_SET_RATE_PARENT, 0),
+	      CLK_IS_CRITICAL | CLK_SET_RATE_PARENT, 0),
 	MUX(0, "mout_sw_aclk300_jpeg", mout_sw_aclk300_jpeg_p,
 			SRC_TOP12, 20, 1),
 	MUX(CLK_MOUT_SW_ACLK300, "mout_sw_aclk300_disp1",
-- 
2.17.1

