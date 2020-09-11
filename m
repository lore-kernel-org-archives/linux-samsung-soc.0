Return-Path: <SRS0=sx2+=CU=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E9A5C43461
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 11 Sep 2020 12:23:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F075822209
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 11 Sep 2020 12:23:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="Cxw+rkp5"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725889AbgIKMWz (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 11 Sep 2020 08:22:55 -0400
Received: from mailout1.w1.samsung.com ([210.118.77.11]:56129 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725816AbgIKMWi (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 11 Sep 2020 08:22:38 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20200911122231euoutp0170517115e25f3d21ff790c53ea76d6c7~zuiL1Pf4R2162421624euoutp01D
        for <linux-samsung-soc@vger.kernel.org>; Fri, 11 Sep 2020 12:22:31 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20200911122231euoutp0170517115e25f3d21ff790c53ea76d6c7~zuiL1Pf4R2162421624euoutp01D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1599826951;
        bh=u6AGqfQI4GzZru02vpMbPn3Zwm7YdaQejbS5JyJ8jX8=;
        h=From:To:Cc:Subject:Date:References:From;
        b=Cxw+rkp50lCDXurQN58RHtSW75kuY73uhGIB+qjRDNnMFSBBq4cRv+gAEXcSmcSdC
         lN8wYTuFjfyRMoOmaa/GEs9KjNnxSkEEB7F0PvYoTokuMk6zgg64He2iVtK07CIo+y
         TTnMlKyhmdE2er6zAvA24eAv6W6cv3RjGPdCpk6I=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20200911122231eucas1p18a6da9527d3843e304010601834ece32~zuiLj0sDk1292712927eucas1p13;
        Fri, 11 Sep 2020 12:22:31 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges3new.samsung.com (EUCPMTA) with SMTP id DC.93.06318.70C6B5F5; Fri, 11
        Sep 2020 13:22:31 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20200911122231eucas1p2c0964f2dc4326522a87fc0571ae58c37~zuiLB27gt2326723267eucas1p2q;
        Fri, 11 Sep 2020 12:22:31 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20200911122231eusmtrp18bdb91fbf78317bb72d00e03a3eb589b~zuiLBNVRq0944409444eusmtrp1P;
        Fri, 11 Sep 2020 12:22:31 +0000 (GMT)
X-AuditID: cbfec7f5-38bff700000018ae-7a-5f5b6c0707a5
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id 83.F7.06017.60C6B5F5; Fri, 11
        Sep 2020 13:22:30 +0100 (BST)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20200911122230eusmtip1485d9c605ae88d189ab34ff8d8db3428~zuiKlaySj2448724487eusmtip1K;
        Fri, 11 Sep 2020 12:22:30 +0000 (GMT)
From:   Marek Szyprowski <m.szyprowski@samsung.com>
To:     linux-samsung-soc@vger.kernel.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>
Subject: [PATCH] ARM: dts: exynos: Remove 'opp-shared' from Exynos3 bus
 OPP-tables
Date:   Fri, 11 Sep 2020 14:22:20 +0200
Message-Id: <20200911122220.13698-1-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrAIsWRmVeSWpSXmKPExsWy7djPc7rsOdHxBj9nqVhsnLGe1eL6l+es
        FufPb2C3mHF+H5PF2iN32S0Ov2lndWDz2LSqk82jb8sqRo/Pm+QCmKO4bFJSczLLUov07RK4
        Mt5uPcZasI+von+SXAPjHu4uRk4OCQETie3T5rB3MXJxCAmsYJT4tfkLE4TzhVHi2rRWFgjn
        M6PEjZlNQGUcYC3LHjFDxJczSuz9O5cFrmP+ux4mkLlsAoYSXW+72EBsEQFVic9tC8B2MAs8
        ZZRYtryLFSQhLBAi8XfNGRYQmwWo6P6pPrAGXgFbif4vF1ggDpSXWL3hANg6CYEDbBIrT25i
        g0i4SMy+9h3KFpZ4dXwLO4QtI3F6cg8LREMzo8TDc2vZIZweRonLTTMYIaqsJe6c+8UG8hCz
        gKbE+l36EGFHiY6+e6wQf/JJ3HgrCBJmBjInbZvODBHmlehoE4KoVpOYdXwd3NqDFy4xQ9ge
        EguOTQA7TUggVqL5+HLGCYxysxB2LWBkXMUonlpanJueWmycl1quV5yYW1yal66XnJ+7iREY
        76f/Hf+6g3Hfn6RDjAIcjEo8vAesouKFWBPLiitzDzFKcDArifA6nT0dJ8SbklhZlVqUH19U
        mpNafIhRmoNFSZzXeNHLWCGB9MSS1OzU1ILUIpgsEwenVANjAn+NlO6RO7VM3ELTJu2Ufnnl
        9I8PT/MtW19v3OwQ/rls25p/UwLv/lj/Zo73goQkbtv0hit/AlX3XHz9vlfadcmDw+q/FG/I
        7vxbckNiVaqBbnqbj0PyroQjlwVC+cLviEQpXJ6akWer/enpRvFMx9o3b+7MS7XztHtfl//h
        id++M39ueckVKrEUZyQaajEXFScCAPWBC3fzAgAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrKLMWRmVeSWpSXmKPExsVy+t/xu7psOdHxBvvWWllsnLGe1eL6l+es
        FufPb2C3mHF+H5PF2iN32S0Ov2lndWDz2LSqk82jb8sqRo/Pm+QCmKP0bIryS0tSFTLyi0ts
        laINLYz0DC0t9IxMLPUMjc1jrYxMlfTtbFJSczLLUov07RL0Mt5uPcZasI+von+SXAPjHu4u
        Rg4OCQETiWWPmLsYuTiEBJYySsy7dompi5ETKC4jcXJaAyuELSzx51oXG0TRJ0aJp3OOgBWx
        CRhKdL0FSXByiAioSnxuW8AOUsQs8JxR4vqpaWAJYYEgiYavk8AaWICK7p/qA4vzCthK9H+5
        wAKxQV5i9YYDzBMYeRYwMqxiFEktLc5Nzy020itOzC0uzUvXS87P3cQIDLJtx35u2cHY9S74
        EKMAB6MSD+8Bq6h4IdbEsuLK3EOMEhzMSiK8TmdPxwnxpiRWVqUW5ccXleakFh9iNAVaPpFZ
        SjQ5HxgBeSXxhqaG5haWhubG5sZmFkrivB0CB2OEBNITS1KzU1MLUotg+pg4OKUaGM9PfPJi
        6yHJKdslJMNzJl77yliau/KriWWYxtHX+S0mBgt09z76xh56Suedhc9X1YbFB37nid9bnHjB
        8nLcTu28da36Pvd3HQq0O1W3OkHzT7lH/KyPPUeclnhsbJm3hTUk/KRQ4t9vz57f8i3QmbH1
        xNsjrLu37VH3vBa/Pfpi04LbTyNV5XqUWIozEg21mIuKEwEBukFtSAIAAA==
X-CMS-MailID: 20200911122231eucas1p2c0964f2dc4326522a87fc0571ae58c37
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20200911122231eucas1p2c0964f2dc4326522a87fc0571ae58c37
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200911122231eucas1p2c0964f2dc4326522a87fc0571ae58c37
References: <CGME20200911122231eucas1p2c0964f2dc4326522a87fc0571ae58c37@eucas1p2.samsung.com>
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

Fix this by removing bogus 'opp-shared' properties from Exynos3 bus
OPP-tables. This restores frequency scaling for the following busses:
RightBus, LCD0, FSYS and MFC.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 arch/arm/boot/dts/exynos3250.dtsi | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/arch/arm/boot/dts/exynos3250.dtsi b/arch/arm/boot/dts/exynos3250.dtsi
index a1e93fb7f694..75ed82600ec8 100644
--- a/arch/arm/boot/dts/exynos3250.dtsi
+++ b/arch/arm/boot/dts/exynos3250.dtsi
@@ -775,7 +775,6 @@
 
 		bus_dmc_opp_table: opp_table1 {
 			compatible = "operating-points-v2";
-			opp-shared;
 
 			opp-50000000 {
 				opp-hz = /bits/ 64 <50000000>;
@@ -865,7 +864,6 @@
 
 		bus_leftbus_opp_table: opp_table2 {
 			compatible = "operating-points-v2";
-			opp-shared;
 
 			opp-50000000 {
 				opp-hz = /bits/ 64 <50000000>;
@@ -891,7 +889,6 @@
 
 		bus_mcuisp_opp_table: opp_table3 {
 			compatible = "operating-points-v2";
-			opp-shared;
 
 			opp-50000000 {
 				opp-hz = /bits/ 64 <50000000>;
@@ -912,7 +909,6 @@
 
 		bus_isp_opp_table: opp_table4 {
 			compatible = "operating-points-v2";
-			opp-shared;
 
 			opp-50000000 {
 				opp-hz = /bits/ 64 <50000000>;
@@ -933,7 +929,6 @@
 
 		bus_peril_opp_table: opp_table5 {
 			compatible = "operating-points-v2";
-			opp-shared;
 
 			opp-50000000 {
 				opp-hz = /bits/ 64 <50000000>;
-- 
2.17.1

