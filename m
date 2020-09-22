Return-Path: <SRS0=odV2=C7=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7C8DC4727D
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 22 Sep 2020 12:40:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 98D9D2399A
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 22 Sep 2020 12:40:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="J4vYzN/V"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726563AbgIVMk4 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 22 Sep 2020 08:40:56 -0400
Received: from mailout2.w1.samsung.com ([210.118.77.12]:38062 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726571AbgIVMk4 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 22 Sep 2020 08:40:56 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20200922124054euoutp0275289c4a944d926661139e40267d2e8d~3G4XVoMHh0716207162euoutp02y
        for <linux-samsung-soc@vger.kernel.org>; Tue, 22 Sep 2020 12:40:54 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20200922124054euoutp0275289c4a944d926661139e40267d2e8d~3G4XVoMHh0716207162euoutp02y
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1600778454;
        bh=n7DhkNHgAKAUHWx6vn8DcdQVMTQ0KFIjwWQaNDK71AI=;
        h=From:To:Cc:Subject:Date:References:From;
        b=J4vYzN/VpNt5sc/4rzmgn2g5n5J3Z9tFFGd38Mim1UV0CNRSxeHsGv56RrkzY6Cyh
         6GLAxp0KRXJwaCfb/z9J00EHYd/JfzPRnrCRgdhonV7m423XoaSK1uzwpC87is/jWZ
         lnY5/hU5k7DrIjlHUdPF7ZeMHJanuxpuHhhgccrg=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20200922124053eucas1p23a0d46ac4ee91259234afdc7b3b42ba0~3G4W7RRYi1467914679eucas1p2l;
        Tue, 22 Sep 2020 12:40:53 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges1new.samsung.com (EUCPMTA) with SMTP id 76.EE.06456.5D0F96F5; Tue, 22
        Sep 2020 13:40:53 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20200922124053eucas1p200d7381abf1d14e932f41ebc0f458c64~3G4WnEWSV1163211632eucas1p2E;
        Tue, 22 Sep 2020 12:40:53 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20200922124053eusmtrp17956ce56820123fd474a7ed303d03685~3G4WmayWL1098210982eusmtrp1M;
        Tue, 22 Sep 2020 12:40:53 +0000 (GMT)
X-AuditID: cbfec7f2-809ff70000001938-59-5f69f0d5a7da
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id 6A.41.06017.5D0F96F5; Tue, 22
        Sep 2020 13:40:53 +0100 (BST)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20200922124052eusmtip2c8136f6a70677dded2d0fb9626d825bc~3G4WLmmC61312913129eusmtip2B;
        Tue, 22 Sep 2020 12:40:52 +0000 (GMT)
From:   Marek Szyprowski <m.szyprowski@samsung.com>
To:     linux-clk@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Sylwester Nawrocki <snawrocki@kernel.org>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Stephen Boyd <sboyd@kernel.org>
Subject: [PATCH] clk: samsung: exynos4: mark 'chipid' clock as
 CLK_IGNORE_UNUSED
Date:   Tue, 22 Sep 2020 14:40:46 +0200
Message-Id: <20200922124046.10496-1-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrNIsWRmVeSWpSXmKPExsWy7djPc7pXP2TGG7xfpG2xccZ6VovrX56z
        Wpw/v4Hd4mPPPVaLGef3MVmsPXKX3eLftY0sFu1PXzI7cHhsWtXJ5tG3ZRWjx+dNcgHMUVw2
        Kak5mWWpRfp2CVwZ32YeYyyYJVBxcNlr9gbGt7xdjJwcEgImEqcPf2PtYuTiEBJYwSjx5c0B
        RpCEkMAXRonrJ3MhEp8ZJTZOe8sI0/G6/xkbRGI5o8TM9h+MEA5Qx5LZx8Cq2AQMJbredrGB
        2CICDhKfP70GK2IWaGGSeNq7hh0kISwQJHHx/VMmEJtFQFVi7vKLLCA2r4CtxIqdLSwQ6+Ql
        Vm84wAzSLCFwhk2ie+YXdoiEi8SDliVQRcISr45vgYrLSJye3MMC0dDMKPHw3Fp2CKeHUeJy
        0wyoL6wl7pz7BXQfB9BNmhLrd+lDhB0l5j8/wgoSlhDgk7jxVhAkzAxkTto2nRkizCvR0SYE
        Ua0mMev4Ori1By9cYoawPSSmTZ7NDgnHWIkvBxezTGCUm4WwawEj4ypG8dTS4tz01GLDvNRy
        veLE3OLSvHS95PzcTYzAJHD63/FPOxi/Xko6xCjAwajEw/viSWa8EGtiWXFl7iFGCQ5mJRFe
        p7On44R4UxIrq1KL8uOLSnNSiw8xSnOwKInzGi96GSskkJ5YkpqdmlqQWgSTZeLglGpg3BT3
        zjPSQcZ3tWfxt1WxM1tuHa27c8NOU7Z2do7NiVaT74Yb50n+jm0Qc4+wmPyEf27tcU3DvW6O
        Wmrsqw+J/zO9dvhDR0DKzz85/bLdd/ql159kq68wXDTDqlX0o0fwK/8MZZP7pl++6u8yV/cv
        yVv773cA09QVveU+638nTzGc4q7CphqjxFKckWioxVxUnAgAwg3Brv4CAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrALMWRmVeSWpSXmKPExsVy+t/xe7pXP2TGG8xdKWKxccZ6VovrX56z
        Wpw/v4Hd4mPPPVaLGef3MVmsPXKX3eLftY0sFu1PXzI7cHhsWtXJ5tG3ZRWjx+dNcgHMUXo2
        RfmlJakKGfnFJbZK0YYWRnqGlhZ6RiaWeobG5rFWRqZK+nY2Kak5mWWpRfp2CXoZ32YeYyyY
        JVBxcNlr9gbGt7xdjJwcEgImEq/7n7F1MXJxCAksZZSYsvolG0RCRuLktAZWCFtY4s+1Lqii
        T4wSs3t/gxWxCRhKdL3tArNFBJwkHqx7ww5iMwt0MEms/1gBYgsLBEg8mfQCLM4ioCoxd/lF
        FhCbV8BWYsXOFhaIBfISqzccYJ7AyLOAkWEVo0hqaXFuem6xkV5xYm5xaV66XnJ+7iZGYOht
        O/Zzyw7GrnfBhxgFOBiVeHhfPMmMF2JNLCuuzD3EKMHBrCTC63T2dJwQb0piZVVqUX58UWlO
        avEhRlOg5ROZpUST84FxkVcSb2hqaG5haWhubG5sZqEkztshcDBGSCA9sSQ1OzW1ILUIpo+J
        g1OqgbEw49OFh/zK+bvm7J3bftrqY8L1IyVe5g0568yT7un83X27o+Z4MOv5ynL+LYcOH66J
        cFdRYuZ6emHqr9v1/o43dvRKvO2yv3vV+cjKpt0zEybNdii+xrbjs+XsZW6PTCzO18jntClq
        JBvaz57Wu/WYcvpflXfMT6x3Jt6/+6JbqKTbTE7oXqwSS3FGoqEWc1FxIgDesNzXUwIAAA==
X-CMS-MailID: 20200922124053eucas1p200d7381abf1d14e932f41ebc0f458c64
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20200922124053eucas1p200d7381abf1d14e932f41ebc0f458c64
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200922124053eucas1p200d7381abf1d14e932f41ebc0f458c64
References: <CGME20200922124053eucas1p200d7381abf1d14e932f41ebc0f458c64@eucas1p2.samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The ChipID IO region has it's own clock, which is being disabled while
scanning for unused clocks. It turned out that some CPU hotplug, CPU idle
or even SOC firmware code depends on the reads from that area. Fix the
mysterious hang caused by entering deep CPU idle state by ignoring the
'chipid' clock during unused clocks scan, as there are no direct clients
for it which will keep it enabled.

Fixes: e062b571777f ("clk: exynos4: register clocks using common clock framework")
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/clk/samsung/clk-exynos4.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/samsung/clk-exynos4.c b/drivers/clk/samsung/clk-exynos4.c
index 436fcd279951..bf13e29a655c 100644
--- a/drivers/clk/samsung/clk-exynos4.c
+++ b/drivers/clk/samsung/clk-exynos4.c
@@ -927,7 +927,7 @@ static const struct samsung_gate_clock exynos4210_gate_clks[] __initconst = {
 	GATE(CLK_PCIE, "pcie", "aclk133", GATE_IP_FSYS, 14, 0, 0),
 	GATE(CLK_SMMU_PCIE, "smmu_pcie", "aclk133", GATE_IP_FSYS, 18, 0, 0),
 	GATE(CLK_MODEMIF, "modemif", "aclk100", GATE_IP_PERIL, 28, 0, 0),
-	GATE(CLK_CHIPID, "chipid", "aclk100", E4210_GATE_IP_PERIR, 0, 0, 0),
+	GATE(CLK_CHIPID, "chipid", "aclk100", E4210_GATE_IP_PERIR, 0, CLK_IGNORE_UNUSED, 0),
 	GATE(CLK_SYSREG, "sysreg", "aclk100", E4210_GATE_IP_PERIR, 0,
 			CLK_IGNORE_UNUSED, 0),
 	GATE(CLK_HDMI_CEC, "hdmi_cec", "aclk100", E4210_GATE_IP_PERIR, 11, 0,
@@ -969,7 +969,7 @@ static const struct samsung_gate_clock exynos4x12_gate_clks[] __initconst = {
 		0),
 	GATE(CLK_TSADC, "tsadc", "aclk133", E4X12_GATE_BUS_FSYS1, 16, 0, 0),
 	GATE(CLK_MIPI_HSI, "mipi_hsi", "aclk133", GATE_IP_FSYS, 10, 0, 0),
-	GATE(CLK_CHIPID, "chipid", "aclk100", E4X12_GATE_IP_PERIR, 0, 0, 0),
+	GATE(CLK_CHIPID, "chipid", "aclk100", E4X12_GATE_IP_PERIR, 0, CLK_IGNORE_UNUSED, 0),
 	GATE(CLK_SYSREG, "sysreg", "aclk100", E4X12_GATE_IP_PERIR, 1,
 			CLK_IGNORE_UNUSED, 0),
 	GATE(CLK_HDMI_CEC, "hdmi_cec", "aclk100", E4X12_GATE_IP_PERIR, 11, 0,
-- 
2.17.1

