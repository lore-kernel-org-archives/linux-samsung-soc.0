Return-Path: <SRS0=1mvF=YQ=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57B74CA9EB6
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 23 Oct 2019 07:41:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id EE3B12064A
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 23 Oct 2019 07:41:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="lQoysMkv"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389889AbfJWHln (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 23 Oct 2019 03:41:43 -0400
Received: from mailout1.w1.samsung.com ([210.118.77.11]:58563 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389484AbfJWHln (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 23 Oct 2019 03:41:43 -0400
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20191023074141euoutp01ad9c39769c7c154d8d0a4ad14977ae88~QNsfKl9Zw1834918349euoutp01C
        for <linux-samsung-soc@vger.kernel.org>; Wed, 23 Oct 2019 07:41:41 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20191023074141euoutp01ad9c39769c7c154d8d0a4ad14977ae88~QNsfKl9Zw1834918349euoutp01C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1571816501;
        bh=iE5kVB5Of0jxC8Vo7qHZ39FklcEMsMNsY+5+nrQZITE=;
        h=From:To:Cc:Subject:Date:References:From;
        b=lQoysMkvVwyrQZlkRMQ3+kGvLg7IQlG9/WNAK5djTtbdcXTx+lMFMWuv3cCVHAs4b
         vt10d7Kl6i6upYPwvtXufh2imcNNXlbYn2GwfvL9GM4Xa49AQ4V0J8aoDtnsuqYY5q
         gudMOBm9b5t1z2QUG7AhMFnGJS/qvh6Isqjznvh0=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20191023074141eucas1p2c736db6af2458a57fd2c444f0e3e16de~QNse8EtYv1509315093eucas1p24;
        Wed, 23 Oct 2019 07:41:41 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges2new.samsung.com (EUCPMTA) with SMTP id 3D.FB.04309.53400BD5; Wed, 23
        Oct 2019 08:41:41 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20191023074140eucas1p2c236bde672f33d4fe32ed61545515cc3~QNsefTxNT2439624396eucas1p2b;
        Wed, 23 Oct 2019 07:41:40 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20191023074140eusmtrp220543a2fc1b70a37b0fe6e36a6e291bd~QNseejUW01871118711eusmtrp2f;
        Wed, 23 Oct 2019 07:41:40 +0000 (GMT)
X-AuditID: cbfec7f4-ae1ff700000010d5-f5-5db004355bb1
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id 97.09.04166.43400BD5; Wed, 23
        Oct 2019 08:41:40 +0100 (BST)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20191023074140eusmtip208d505d4659fd85f38dc408fb7d5efef~QNseBZUHx0550505505eusmtip2L;
        Wed, 23 Oct 2019 07:41:40 +0000 (GMT)
From:   Marek Szyprowski <m.szyprowski@samsung.com>
To:     linux-clk@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Sylwester Nawrocki <snawrocki@kernel.org>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Marian Mihailescu <mihailescu2m@gmail.com>
Subject: [PATCH] clk: samsung: exynos542x: Move G3D subsystem clocks to its
 sub-CMU
Date:   Wed, 23 Oct 2019 09:41:18 +0200
Message-Id: <20191023074118.3012-1-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrPIsWRmVeSWpSXmKPExsWy7djPc7qmLBtiDeYfFbPYOGM9q8X1L89Z
        Lc6f38Bu8bHnHqvFjPP7mCzWHrnLbrF+2k9Wi/anL5kdODx2zrrL7rFpVSebR9+WVYwenzfJ
        BbBEcdmkpOZklqUW6dslcGUsPXyMteCIVMWlq7PYGhjPiHUxcnJICJhI/O+Yx9jFyMUhJLCC
        UeLk3HNMEM4XRonNx3eyQTifGSUa7j9mh2lp29LCDGILCSxnlLg1RwKu48qjmSwgCTYBQ4mu
        t11sILaIgIPE50+vwXYwC/QzSfT1XQXrFhYIlVhwdB9YEYuAqsSbrXeBijg4eAVsJGatYoJY
        Ji+xesMBZpBeCYHbbBJnp35ihUi4SHw58JENwhaWeHV8C9R1MhL/d85ngmhoZpR4eG4tO4TT
        wyhxuWkGI0SVtcTh4xdZQbYxC2hKrN+lDxF2lDh75D0LSFhCgE/ixltBkDAzkDlp23RmiDCv
        REebEES1msSs4+vg1h68cIkZwvaQeH7jJiskgGIlPs9fxzKBUW4Wwq4FjIyrGMVTS4tz01OL
        jfJSy/WKE3OLS/PS9ZLzczcxApPB6X/Hv+xg3PUn6RCjAAejEg+vw/t1sUKsiWXFlbmHGCU4
        mJVEeO8YrI0V4k1JrKxKLcqPLyrNSS0+xCjNwaIkzlvN8CBaSCA9sSQ1OzW1ILUIJsvEwSnV
        wCjfPf3CBObgNr8PDJZNy3zUstd9yOO5WH4j1E7xTNeLpwnufg8Npaoca16+L/554Zq/7JSS
        71/PV6rxMX7S/fO+3GTJeYtyd3XtT6Y6v54z1965bzrtkzzXdEVZ9obwlgXtn6dqe5z/96Tx
        vccd/tvuG4KTEgUdD1zIrUlW75ho/dstWf5kuxJLcUaioRZzUXEiAIG/z+UCAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrKLMWRmVeSWpSXmKPExsVy+t/xe7omLBtiDeYcMbbYOGM9q8X1L89Z
        Lc6f38Bu8bHnHqvFjPP7mCzWHrnLbrF+2k9Wi/anL5kdODx2zrrL7rFpVSebR9+WVYwenzfJ
        BbBE6dkU5ZeWpCpk5BeX2CpFG1oY6RlaWugZmVjqGRqbx1oZmSrp29mkpOZklqUW6dsl6GUs
        PXyMteCIVMWlq7PYGhjPiHUxcnJICJhItG1pYe5i5OIQEljKKNH/6hQjREJG4uS0BlYIW1ji
        z7UuNoiiT4wShw6uYAFJsAkYSnS9BUlwcogIOEk8WPeGHaSIWWAyk8T2pqVgRcICwRLXH79m
        BrFZBFQl3my9C7SBg4NXwEZi1iomiAXyEqs3HGCewMizgJFhFaNIamlxbnpusaFecWJucWle
        ul5yfu4mRmAQbjv2c/MOxksbgw8xCnAwKvHwzvi4LlaINbGsuDL3EKMEB7OSCO8dg7WxQrwp
        iZVVqUX58UWlOanFhxhNgXZPZJYSTc4HRkheSbyhqaG5haWhubG5sZmFkjhvh8DBGCGB9MSS
        1OzU1ILUIpg+Jg5OqQZG/l1Hr6QpSyQblLcvmdXNu0dp7fJVIS/2L77i9i7w2xP1aTMreOyO
        Fis2n0qxs1jGZHIzjm21hI+J3JJvy0JcYssP3V4lvK1v90J553lZPM137K5OXHv7Q6jinYSy
        I1q26btXS32RSTxhOuPNo6igw9Gn7/4vfH4q+ddHsZAWhlan3wx6BeJPlFiKMxINtZiLihMB
        Adc7AlgCAAA=
X-CMS-MailID: 20191023074140eucas1p2c236bde672f33d4fe32ed61545515cc3
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20191023074140eucas1p2c236bde672f33d4fe32ed61545515cc3
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20191023074140eucas1p2c236bde672f33d4fe32ed61545515cc3
References: <CGME20191023074140eucas1p2c236bde672f33d4fe32ed61545515cc3@eucas1p2.samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

G3D clocks require special handling of their parent bus clock during power
domain on/off sequences. Those clocks were not initially added to the
sub-CMU handler, because that time there was no open-source driver for the
G3D (MALI Panfrost) hardware module and it was not possible to test it.

This patch fixes this issue. Parent clock for G3D hardware block is now
properly preserved during G3D power domain on/off sequence. This restores
proper MALI Panfrost performance broken by commit 8686764fc071
("ARM: dts: exynos: Add G3D power domain to Exynos542x").

Reported-by: Marian Mihailescu <mihailescu2m@gmail.com>
Fixes: b06a532bf1fa ("clk: samsung: Add Exynos5 sub-CMU clock driver")
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
Tested-by: Marian Mihailescu <mihailescu2m@gmail.com>
---
 drivers/clk/samsung/clk-exynos5420.c | 21 +++++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/samsung/clk-exynos5420.c b/drivers/clk/samsung/clk-exynos5420.c
index 7670cc596c74..dfa862d55246 100644
--- a/drivers/clk/samsung/clk-exynos5420.c
+++ b/drivers/clk/samsung/clk-exynos5420.c
@@ -1172,8 +1172,6 @@ static const struct samsung_gate_clock exynos5x_gate_clks[] __initconst = {
 	GATE(CLK_SCLK_ISP_SENSOR2, "sclk_isp_sensor2", "dout_isp_sensor2",
 			GATE_TOP_SCLK_ISP, 12, CLK_SET_RATE_PARENT, 0),
 
-	GATE(CLK_G3D, "g3d", "mout_user_aclk_g3d", GATE_IP_G3D, 9, 0, 0),
-
 	/* CDREX */
 	GATE(CLK_CLKM_PHY0, "clkm_phy0", "dout_sclk_cdrex",
 			GATE_BUS_CDREX0, 0, 0, 0),
@@ -1248,6 +1246,15 @@ static struct exynos5_subcmu_reg_dump exynos5x_gsc_suspend_regs[] = {
 	{ DIV2_RATIO0, 0, 0x30 },	/* DIV dout_gscl_blk_300 */
 };
 
+static const struct samsung_gate_clock exynos5x_g3d_gate_clks[] __initconst = {
+	GATE(CLK_G3D, "g3d", "mout_user_aclk_g3d", GATE_IP_G3D, 9, 0, 0),
+};
+
+static struct exynos5_subcmu_reg_dump exynos5x_g3d_suspend_regs[] = {
+	{ GATE_IP_G3D, 0x3ff, 0x3ff },	/* G3D gates */
+	{ SRC_TOP5, 0, BIT(16) },	/* MUX mout_user_aclk_g3d */
+};
+
 static const struct samsung_div_clock exynos5x_mfc_div_clks[] __initconst = {
 	DIV(0, "dout_mfc_blk", "mout_user_aclk333", DIV4_RATIO, 0, 2),
 };
@@ -1320,6 +1327,14 @@ static const struct exynos5_subcmu_info exynos5x_gsc_subcmu = {
 	.pd_name	= "GSC",
 };
 
+static const struct exynos5_subcmu_info exynos5x_g3d_subcmu = {
+	.gate_clks	= exynos5x_g3d_gate_clks,
+	.nr_gate_clks	= ARRAY_SIZE(exynos5x_g3d_gate_clks),
+	.suspend_regs	= exynos5x_g3d_suspend_regs,
+	.nr_suspend_regs = ARRAY_SIZE(exynos5x_g3d_suspend_regs),
+	.pd_name	= "G3D",
+};
+
 static const struct exynos5_subcmu_info exynos5x_mfc_subcmu = {
 	.div_clks	= exynos5x_mfc_div_clks,
 	.nr_div_clks	= ARRAY_SIZE(exynos5x_mfc_div_clks),
@@ -1351,6 +1366,7 @@ static const struct exynos5_subcmu_info exynos5800_mau_subcmu = {
 static const struct exynos5_subcmu_info *exynos5x_subcmus[] = {
 	&exynos5x_disp_subcmu,
 	&exynos5x_gsc_subcmu,
+	&exynos5x_g3d_subcmu,
 	&exynos5x_mfc_subcmu,
 	&exynos5x_mscl_subcmu,
 };
@@ -1358,6 +1374,7 @@ static const struct exynos5_subcmu_info *exynos5x_subcmus[] = {
 static const struct exynos5_subcmu_info *exynos5800_subcmus[] = {
 	&exynos5x_disp_subcmu,
 	&exynos5x_gsc_subcmu,
+	&exynos5x_g3d_subcmu,
 	&exynos5x_mfc_subcmu,
 	&exynos5x_mscl_subcmu,
 	&exynos5800_mau_subcmu,
-- 
2.17.1

