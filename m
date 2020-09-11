Return-Path: <SRS0=sx2+=CU=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A060BC433E2
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 11 Sep 2020 12:27:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 64C5221D92
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 11 Sep 2020 12:27:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="NNlmcU1g"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725730AbgIKM1S (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 11 Sep 2020 08:27:18 -0400
Received: from mailout1.w1.samsung.com ([210.118.77.11]:56191 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725897AbgIKMWt (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 11 Sep 2020 08:22:49 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20200911122247euoutp019748a0227ed19eec1dd1d3927cf0ae40~zuiaMTJP72162421624euoutp01J
        for <linux-samsung-soc@vger.kernel.org>; Fri, 11 Sep 2020 12:22:47 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20200911122247euoutp019748a0227ed19eec1dd1d3927cf0ae40~zuiaMTJP72162421624euoutp01J
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1599826967;
        bh=SLp2FU+Gf4QcTmn5ZNe0pd8AzqIfUICg0AA+/IjrJc0=;
        h=From:To:Cc:Subject:Date:References:From;
        b=NNlmcU1gDXxk9KDWtQ0WZ8CVzCV/YMCdwI9YUMktlsAH+xfRD4/4rbSSCmUEe/s9Y
         dVrtiPMQ6AxyY2toldis5owZ/KVsY1hCsmQd8A4OeyENw3exyqOP4hWkMUQtYy9hzs
         7LOsJMr+qCGPdGxNu54tawisbMnqcxsedQFQN2m8=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20200911122246eucas1p20c229aaa4233d16f869c24984efac0a6~zuiZ0qR3M0774907749eucas1p2J;
        Fri, 11 Sep 2020 12:22:46 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges2new.samsung.com (EUCPMTA) with SMTP id ED.E7.05997.61C6B5F5; Fri, 11
        Sep 2020 13:22:46 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20200911122246eucas1p1a8ccc7c5b970ce6aa9aa346d78ad69df~zuiZgm99a1103111031eucas1p1-;
        Fri, 11 Sep 2020 12:22:46 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20200911122246eusmtrp1ecb968282aba1cbd3db620759da0ae05~zuiZf-lED0934109341eusmtrp1V;
        Fri, 11 Sep 2020 12:22:46 +0000 (GMT)
X-AuditID: cbfec7f4-65dff7000000176d-24-5f5b6c161048
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id 3A.F7.06017.61C6B5F5; Fri, 11
        Sep 2020 13:22:46 +0100 (BST)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20200911122244eusmtip11c1cd6c51fd6c9f5fa9525947dd4f1f8~zuiXonxNI1995319953eusmtip1Z;
        Fri, 11 Sep 2020 12:22:44 +0000 (GMT)
From:   Marek Szyprowski <m.szyprowski@samsung.com>
To:     linux-samsung-soc@vger.kernel.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>
Subject: [PATCH] ARM: dts: exynos: Remove 'opp-shared' from Exynos4412 bus
 OPP-tables
Date:   Fri, 11 Sep 2020 14:22:36 +0200
Message-Id: <20200911122236.16805-1-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrPIsWRmVeSWpSXmKPExsWy7djP87piOdHxBt/XWVpsnLGe1eL6l+es
        FufPb2C3mHF+H5PF2iN32S0Ov2lndWDz2LSqk82jb8sqRo/Pm+QCmKO4bFJSczLLUov07RK4
        Mm6dXMZc8JO/Yvb8vWwNjMd5uhg5OSQETCTaf7xh7WLk4hASWMEo0b7oIzOE84VR4s380+wg
        VUICnxklmns8uhg5wDoerZGGqFnOKLFn2R52uIYZc6azgjSwCRhKdL3tYgOxRQRUJT63LQAr
        YhZ4yiixbHkXWJGwQLjExo9LWEBsFqCi2bsbwWxeAVuJyzvbWCDuk5dYveEAM4R9hE1i1zsm
        CNtFYsa89awQtrDEq+Nb2CFsGYnTk3tYQJZJCDQzSjw8t5YdwulhlLjcNIMRospa4s65X2wg
        /zALaEqs36UPEXaUeL16HzPEm3wSN94KgoSZgcxJ26ZDhXklOtqEIKrVJGYdXwe39uCFS1Bn
        ekjs29jLBgm4WIlDDx+zTWCUm4WwawEj4ypG8dTS4tz01GKjvNRyveLE3OLSvHS95PzcTYzA
        aD/97/iXHYy7/iQdYhTgYFTi4T1gFRUvxJpYVlyZe4hRgoNZSYTX6ezpOCHelMTKqtSi/Pii
        0pzU4kOM0hwsSuK8xotexgoJpCeWpGanphakFsFkmTg4pRoYO1Ii5l049j3GyV/KLDipYfYb
        y2aDW+Jr2otX2/xbkXK+O+m+djzvZMPz9xid9Y7XLX3NKbZEK+Dm0obC/Ib69S8c2U7oujvN
        P24eyxHacav5vojHA3GrnJc1P9axLPc9vr56nVmiyf/HR9RkJJqOfOG78PD5VTUht5erlvgH
        P7xb8+TciaQwJZbijERDLeai4kQAfaxlTPICAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrKLMWRmVeSWpSXmKPExsVy+t/xu7piOdHxBs/+KFtsnLGe1eL6l+es
        FufPb2C3mHF+H5PF2iN32S0Ov2lndWDz2LSqk82jb8sqRo/Pm+QCmKP0bIryS0tSFTLyi0ts
        laINLYz0DC0t9IxMLPUMjc1jrYxMlfTtbFJSczLLUov07RL0Mm6dXMZc8JO/Yvb8vWwNjMd5
        uhg5OCQETCQerZHuYuTkEBJYyihxfK0uiC0hICNxcloDK4QtLPHnWhdbFyMXUM0nRolXe1eD
        JdgEDCW63oIkODlEBFQlPrctYAcpYhZ4zihx/dQ0sISwQKjE8uZzYA0sQEWzdzeygNi8ArYS
        l3e2sUBskJdYveEA8wRGngWMDKsYRVJLi3PTc4uN9IoTc4tL89L1kvNzNzECg2zbsZ9bdjB2
        vQs+xCjAwajEw3vAKipeiDWxrLgy9xCjBAezkgiv09nTcUK8KYmVValF+fFFpTmpxYcYTYGW
        T2SWEk3OB0ZAXkm8oamhuYWlobmxubGZhZI4b4fAwRghgfTEktTs1NSC1CKYPiYOTqkGRtO6
        ujTfJUYn/jVXzq7b+nA+s4fskUNnyi4x5WzbFnTS7PS8Cfci2FVzt94SESirvLp3g9Utq7dq
        72/ZOR5g3n1oVVMzz89gfle2o8IrBdd0zHFj0rwxZenqA0fqNM9lzX5xbuZsF0XHL9OfvtA6
        /VAvjPHbtOtlJo2z0rde5PhlorXP8U3C8/NKLMUZiYZazEXFiQBC5qwoSAIAAA==
X-CMS-MailID: 20200911122246eucas1p1a8ccc7c5b970ce6aa9aa346d78ad69df
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20200911122246eucas1p1a8ccc7c5b970ce6aa9aa346d78ad69df
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200911122246eucas1p1a8ccc7c5b970ce6aa9aa346d78ad69df
References: <CGME20200911122246eucas1p1a8ccc7c5b970ce6aa9aa346d78ad69df@eucas1p1.samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Commits 1019fe2c7280 ("ARM: dts: exynos: Adjust bus related OPPs to the
values correct for Exynos5422 Odroids") and 9ff416cf45a0 ("ARM: dts:
exynos: Disable frequency scaling for FSYS bus on Odroid XU3 family")
revealed that 'opp-shared' property for the Exynos bus OPPs was used
incorrectly, what had the side-effect of disabling frequency scaling for
the second and latter buses sharing given OPP-table.

Fix this by removing bogus 'opp-shared' properties from Exynos4412 bus
OPP-tables. This restores frequency scaling for the following busses:
C2C, RightBus, and MFC.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 arch/arm/boot/dts/exynos4412.dtsi | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/arch/arm/boot/dts/exynos4412.dtsi b/arch/arm/boot/dts/exynos4412.dtsi
index c74b1be12671..8afa634b2314 100644
--- a/arch/arm/boot/dts/exynos4412.dtsi
+++ b/arch/arm/boot/dts/exynos4412.dtsi
@@ -404,7 +404,6 @@
 
 		bus_dmc_opp_table: opp_table1 {
 			compatible = "operating-points-v2";
-			opp-shared;
 
 			opp-100000000 {
 				opp-hz = /bits/ 64 <100000000>;
@@ -431,7 +430,6 @@
 
 		bus_acp_opp_table: opp_table2 {
 			compatible = "operating-points-v2";
-			opp-shared;
 
 			opp-100000000 {
 				opp-hz = /bits/ 64 <100000000>;
@@ -497,7 +495,6 @@
 
 		bus_leftbus_opp_table: opp_table3 {
 			compatible = "operating-points-v2";
-			opp-shared;
 
 			opp-100000000 {
 				opp-hz = /bits/ 64 <100000000>;
@@ -520,7 +517,6 @@
 
 		bus_display_opp_table: opp_table4 {
 			compatible = "operating-points-v2";
-			opp-shared;
 
 			opp-160000000 {
 				opp-hz = /bits/ 64 <160000000>;
@@ -532,7 +528,6 @@
 
 		bus_fsys_opp_table: opp_table5 {
 			compatible = "operating-points-v2";
-			opp-shared;
 
 			opp-100000000 {
 				opp-hz = /bits/ 64 <100000000>;
@@ -544,7 +539,6 @@
 
 		bus_peri_opp_table: opp_table6 {
 			compatible = "operating-points-v2";
-			opp-shared;
 
 			opp-50000000 {
 				opp-hz = /bits/ 64 <50000000>;
-- 
2.17.1

