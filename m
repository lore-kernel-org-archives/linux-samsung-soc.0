Return-Path: <SRS0=fp8F=YS=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B9F9CA9EBD
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 25 Oct 2019 09:34:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 217BD21D71
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 25 Oct 2019 09:34:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="cnSV3jpp"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730207AbfJYJes (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 25 Oct 2019 05:34:48 -0400
Received: from mailout1.w1.samsung.com ([210.118.77.11]:48694 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2394325AbfJYJes (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 25 Oct 2019 05:34:48 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20191025093446euoutp01c426ec2d9d7419f4c505e856391fd0b7~Q2hywNMYx2997529975euoutp010
        for <linux-samsung-soc@vger.kernel.org>; Fri, 25 Oct 2019 09:34:46 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20191025093446euoutp01c426ec2d9d7419f4c505e856391fd0b7~Q2hywNMYx2997529975euoutp010
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1571996086;
        bh=25Y2nKbpDpxNRsl7f/aIX2bdWnk64g2d8z8zecB+i+g=;
        h=From:To:Cc:Subject:Date:References:From;
        b=cnSV3jppGQme/PcaXDxH5NmWfsdPZId68zQ7ZZwcDHBc+jbXa/sVhR9vOEh7dvhcg
         IAILnj7MJQGotFSo8NzjH5NjP3zPieQiWAXTYKF2RV7HVyNz1WCGOSa19xxKKo/PjN
         CfHa57ZZkSCZTmyRAKH8KEQTu1HFgK2DQvweI1yo=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20191025093446eucas1p27297e757c5b704d231cf4483b1b61827~Q2hyXGegd0481204812eucas1p2B;
        Fri, 25 Oct 2019 09:34:46 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges3new.samsung.com (EUCPMTA) with SMTP id F7.BC.04374.6B1C2BD5; Fri, 25
        Oct 2019 10:34:46 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20191025093445eucas1p16ce610f491a9bd9b9ce894debcaec9be~Q2hx96yCX2336323363eucas1p1H;
        Fri, 25 Oct 2019 09:34:45 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20191025093445eusmtrp1841a5140b5887c16b74f226731b06f57~Q2hx4uV2t3072330723eusmtrp1P;
        Fri, 25 Oct 2019 09:34:45 +0000 (GMT)
X-AuditID: cbfec7f5-4f7ff70000001116-6d-5db2c1b67ba2
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id 39.2B.04117.5B1C2BD5; Fri, 25
        Oct 2019 10:34:45 +0100 (BST)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20191025093445eusmtip294b19bdc86140ab48ad5566b405e43a3~Q2hxeNpoA2450424504eusmtip2S;
        Fri, 25 Oct 2019 09:34:45 +0000 (GMT)
From:   Marek Szyprowski <m.szyprowski@samsung.com>
To:     linux-clk@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Sylwester Nawrocki <snawrocki@kernel.org>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Marian Mihailescu <mihailescu2m@gmail.com>
Subject: [PATCH] clk: samsung: exynos5420: Add SET_RATE_PARENT flag to
 clocks on G3D path
Date:   Fri, 25 Oct 2019 11:34:35 +0200
Message-Id: <20191025093435.12143-1-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrDIsWRmVeSWpSXmKPExsWy7djP87rbDm6KNbg/kcdi44z1rBbXvzxn
        tTh/fgO7xceee6wWM87vY7JYe+Quu8X6aT9ZLdqfvmR24PDYOesuu8emVZ1sHn1bVjF6fN4k
        F8ASxWWTkpqTWZZapG+XwJWxtbGNreCkbMWaKVOYGxj7JLsYOTkkBEwkPmx/xQRiCwmsYJT4
        /VECwv7CKHHuuTyE/ZlRorHLAqb+VOMn1i5GLqD4ckaJ3Vf3MEM4QA3fX04Dm8QmYCjR9baL
        DcQWEXCQ+PzpNSNIEbNAP5NEX99VZpCEsEC0xJOuG2BFLAKqEpd+z2YHsXkFbCW+rXnLDLFO
        XmL1hgNgGyQErrNJPLh8nxUi4SKx+doWqCJhiVfHt7BD2DISpyf3sEA0NDNKPDy3lh3C6WGU
        uNw0gxGiylri8PGLQJM4gG7SlFi/S7+LkR0o7CjxjRskKCHAJ3HjrSBILTOQOWnbdGaIMK9E
        R5sQxAg1iVnH18EtPXjhEtQxHhJbtj1lhARcrMTXFTcZJzDKzULYtICRcRWjeGppcW56arFx
        Xmq5XnFibnFpXrpecn7uJkZgGjj97/jXHYz7/iQdYhTgYFTi4X3RvzFWiDWxrLgy9xCjBAez
        kgjvbjWgEG9KYmVValF+fFFpTmrxIUZpDhYlcd5qhgfRQgLpiSWp2ampBalFMFkmDk6pBsaA
        pji7/Kuv0nYwum+8oXzNzzVlq42C/odV73fEepxvNVS0epT1xyrYN66mo/p47DSm6d4HVzKK
        ahrJKp5OyM6rUXxdftXw832OvQaPPXI/R17ftCfsUPAD9qkT35ebz3937Hw9r2364zWc7/9q
        ZjRefjFnVZ6YTbTRE/7qpZzJn0+8Xyjf/VWJpTgj0VCLuag4EQBaNwnk/wIAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrGLMWRmVeSWpSXmKPExsVy+t/xe7pbD26KNdj0Q9di44z1rBbXvzxn
        tTh/fgO7xceee6wWM87vY7JYe+Quu8X6aT9ZLdqfvmR24PDYOesuu8emVZ1sHn1bVjF6fN4k
        F8ASpWdTlF9akqqQkV9cYqsUbWhhpGdoaaFnZGKpZ2hsHmtlZKqkb2eTkpqTWZZapG+XoJex
        tbGNreCkbMWaKVOYGxj7JLsYOTkkBEwkTjV+Yu1i5OIQEljKKHFi0l0WiISMxMlpDawQtrDE
        n2tdbBBFnxgldryaD1bEJmAo0fUWJMHJISLgJPFg3Rt2kCJmgclMEtubloIVCQtEStw9OZUR
        xGYRUJW49Hs2O4jNK2Ar8W3NW2aIDfISqzccYJ7AyLOAkWEVo0hqaXFuem6xkV5xYm5xaV66
        XnJ+7iZGYBhuO/Zzyw7GrnfBhxgFOBiVeHgdJm2MFWJNLCuuzD3EKMHBrCTCu1sNKMSbklhZ
        lVqUH19UmpNafIjRFGj5RGYp0eR8YIzklcQbmhqaW1gamhubG5tZKInzdggcjBESSE8sSc1O
        TS1ILYLpY+LglGpg3BckHeuue/w8R6XzLTP7O5WNoS/X3Sn5oJymfa1UMFEoo6SjY4qO69bQ
        qZM/RQVy2zswzXp7IP5e2z4VMfu1p+fN3zwr8/+ahcItXuxzO874z9CtmGzHySgZKr4p63Qd
        2/PKjIDygJwG13UrWpQr2S9W802YestpLptg+NrNN+SiBA7k2soqsRRnJBpqMRcVJwIAS64t
        ZlkCAAA=
X-CMS-MailID: 20191025093445eucas1p16ce610f491a9bd9b9ce894debcaec9be
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20191025093445eucas1p16ce610f491a9bd9b9ce894debcaec9be
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20191025093445eucas1p16ce610f491a9bd9b9ce894debcaec9be
References: <CGME20191025093445eucas1p16ce610f491a9bd9b9ce894debcaec9be@eucas1p1.samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Add CLK_SET_RATE_PARENT flag to all clocks on the path from VPLL to G3D,
so the G3D MALI driver can simply adjust the rate of its clock by doing
a single clk_set_rate() call, without the need to know the whole clock
topology in Exynos542x SoCs.

Suggested-by: Marian Mihailescu <mihailescu2m@gmail.com>
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/clk/samsung/clk-exynos5420.c | 20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/drivers/clk/samsung/clk-exynos5420.c b/drivers/clk/samsung/clk-exynos5420.c
index 0aca98492029..a0f95b9c3239 100644
--- a/drivers/clk/samsung/clk-exynos5420.c
+++ b/drivers/clk/samsung/clk-exynos5420.c
@@ -611,7 +611,8 @@ static const struct samsung_mux_clock exynos5x_mux_clks[] __initconst = {
 	MUX(0, "mout_aclk66", mout_group1_p, SRC_TOP1, 8, 2),
 	MUX(0, "mout_aclk166", mout_group1_p, SRC_TOP1, 24, 2),
 
-	MUX(0, "mout_aclk_g3d", mout_group5_p, SRC_TOP2, 16, 1),
+	MUX_F(0, "mout_aclk_g3d", mout_group5_p, SRC_TOP2, 16, 1,
+	      CLK_SET_RATE_PARENT, 0),
 
 	MUX(0, "mout_user_aclk400_isp", mout_user_aclk400_isp_p,
 			SRC_TOP3, 0, 1),
@@ -653,8 +654,8 @@ static const struct samsung_mux_clock exynos5x_mux_clks[] __initconst = {
 			SRC_TOP5, 8, 1),
 	MUX(0, "mout_user_aclk266_g2d", mout_user_aclk266_g2d_p,
 			SRC_TOP5, 12, 1),
-	MUX(CLK_MOUT_G3D, "mout_user_aclk_g3d", mout_user_aclk_g3d_p,
-			SRC_TOP5, 16, 1),
+	MUX_F(CLK_MOUT_G3D, "mout_user_aclk_g3d", mout_user_aclk_g3d_p,
+			SRC_TOP5, 16, 1, CLK_SET_RATE_PARENT, 0),
 	MUX(0, "mout_user_aclk300_jpeg", mout_user_aclk300_jpeg_p,
 			SRC_TOP5, 20, 1),
 	MUX(CLK_MOUT_USER_ACLK300_DISP1, "mout_user_aclk300_disp1",
@@ -663,7 +664,8 @@ static const struct samsung_mux_clock exynos5x_mux_clks[] __initconst = {
 			mout_user_aclk300_gscl_p, SRC_TOP5, 28, 1),
 
 	MUX(0, "mout_sclk_mpll", mout_mpll_p, SRC_TOP6, 0, 1),
-	MUX(CLK_MOUT_VPLL, "mout_sclk_vpll", mout_vpll_p, SRC_TOP6, 4, 1),
+	MUX_F(CLK_MOUT_VPLL, "mout_sclk_vpll", mout_vpll_p, SRC_TOP6, 4, 1,
+	      CLK_SET_RATE_PARENT, 0),
 	MUX(CLK_MOUT_SCLK_SPLL, "mout_sclk_spll", mout_spll_p, SRC_TOP6, 8, 1),
 	MUX(0, "mout_sclk_ipll", mout_ipll_p, SRC_TOP6, 12, 1),
 	MUX(0, "mout_sclk_rpll", mout_rpll_p, SRC_TOP6, 16, 1),
@@ -707,7 +709,8 @@ static const struct samsung_mux_clock exynos5x_mux_clks[] __initconst = {
 			SRC_TOP12, 8, 1),
 	MUX(0, "mout_sw_aclk266_g2d", mout_sw_aclk266_g2d_p,
 			SRC_TOP12, 12, 1),
-	MUX(0, "mout_sw_aclk_g3d", mout_sw_aclk_g3d_p, SRC_TOP12, 16, 1),
+	MUX_F(0, "mout_sw_aclk_g3d", mout_sw_aclk_g3d_p, SRC_TOP12, 16, 1,
+	      CLK_SET_RATE_PARENT, 0),
 	MUX(0, "mout_sw_aclk300_jpeg", mout_sw_aclk300_jpeg_p,
 			SRC_TOP12, 20, 1),
 	MUX(CLK_MOUT_SW_ACLK300, "mout_sw_aclk300_disp1",
@@ -804,8 +807,8 @@ static const struct samsung_div_clock exynos5x_div_clks[] __initconst = {
 			DIV_TOP2, 8, 3),
 	DIV(CLK_DOUT_ACLK266_G2D, "dout_aclk266_g2d", "mout_aclk266_g2d",
 			DIV_TOP2, 12, 3),
-	DIV(CLK_DOUT_ACLK_G3D, "dout_aclk_g3d", "mout_aclk_g3d", DIV_TOP2,
-			16, 3),
+	DIV_F(CLK_DOUT_ACLK_G3D, "dout_aclk_g3d", "mout_aclk_g3d", DIV_TOP2,
+			16, 3, CLK_SET_RATE_PARENT, 0),
 	DIV(CLK_DOUT_ACLK300_JPEG, "dout_aclk300_jpeg", "mout_aclk300_jpeg",
 			DIV_TOP2, 20, 3),
 	DIV(CLK_DOUT_ACLK300_DISP1, "dout_aclk300_disp1",
@@ -1253,7 +1256,8 @@ static struct exynos5_subcmu_reg_dump exynos5x_gsc_suspend_regs[] = {
 };
 
 static const struct samsung_gate_clock exynos5x_g3d_gate_clks[] __initconst = {
-	GATE(CLK_G3D, "g3d", "mout_user_aclk_g3d", GATE_IP_G3D, 9, 0, 0),
+	GATE(CLK_G3D, "g3d", "mout_user_aclk_g3d", GATE_IP_G3D, 9,
+	     CLK_SET_RATE_PARENT, 0),
 };
 
 static struct exynos5_subcmu_reg_dump exynos5x_g3d_suspend_regs[] = {
-- 
2.17.1

