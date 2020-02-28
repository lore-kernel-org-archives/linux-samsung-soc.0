Return-Path: <SRS0=V4sZ=4Q=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0301FC3F2D2
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 28 Feb 2020 14:55:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id CAF61246A0
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 28 Feb 2020 14:55:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="Tf0dpJcq"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726788AbgB1OzZ (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 28 Feb 2020 09:55:25 -0500
Received: from mailout2.w1.samsung.com ([210.118.77.12]:50532 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726682AbgB1OzZ (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 28 Feb 2020 09:55:25 -0500
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20200228145523euoutp02192e00178208fbf27debf850eabe7538~3mLsj_zG33047430474euoutp02B
        for <linux-samsung-soc@vger.kernel.org>; Fri, 28 Feb 2020 14:55:23 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20200228145523euoutp02192e00178208fbf27debf850eabe7538~3mLsj_zG33047430474euoutp02B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1582901723;
        bh=DgP7CdS+p6Lc2KUh/DMBLn6XdxYcovRD+NnyeTXU3To=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Tf0dpJcq4tE/MnZ7cygbRQw4gJhLt9zC0/5hPhgv31mes2vtmwdsH9Zh5EhGLvNHf
         DG+EC7R3OAaRRkMaTwsuVHHuD/wl4EsdfwJ09SQH/qFf1ZqB/kfpNX04qruftaRHPV
         SMLsSlA9KjzEgvAtApIagb5LVt7vqdXlMrshZMLQ=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20200228145523eucas1p225114559afe0fe2775985a00bde6c500~3mLsR4Wqe0154801548eucas1p2_;
        Fri, 28 Feb 2020 14:55:23 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges2new.samsung.com (EUCPMTA) with SMTP id 74.91.60679.BD9295E5; Fri, 28
        Feb 2020 14:55:23 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20200228145522eucas1p240577364b62d00499ba1d45691c8430a~3mLr94xpv2874828748eucas1p27;
        Fri, 28 Feb 2020 14:55:22 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20200228145522eusmtrp2fc21735c793a30c878aeee5f62952042~3mLr9VHaJ1364013640eusmtrp2b;
        Fri, 28 Feb 2020 14:55:22 +0000 (GMT)
X-AuditID: cbfec7f4-0e5ff7000001ed07-b9-5e5929dbf8d0
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id 79.2C.08375.AD9295E5; Fri, 28
        Feb 2020 14:55:22 +0000 (GMT)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20200228145522eusmtip2bb331d6f77f03622b440d4086155439d~3mLrqe1K50342803428eusmtip2L;
        Fri, 28 Feb 2020 14:55:22 +0000 (GMT)
From:   Marek Szyprowski <m.szyprowski@samsung.com>
To:     linux-samsung-soc@vger.kernel.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Marian Mihailescu <mihailescu2m@gmail.com>
Subject: [PATCH 2/2] ARM: dts: exynos: Fix G3D power domain supply on
 Arndale Octa boards
Date:   Fri, 28 Feb 2020 15:55:02 +0100
Message-Id: <20200228145502.8316-2-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200228145502.8316-1-m.szyprowski@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrDIsWRmVeSWpSXmKPExsWy7djPc7q3NSPjDE60cFpsnLGe1eL8+Q3s
        FjPO72OyWHvkLrvF+mk/WR1YPXbOusvusWlVJ5tH35ZVjB6fN8kFsERx2aSk5mSWpRbp2yVw
        ZZyc/IK54BNnRcOOXWwNjJM4uhg5OSQETCTa3u9nA7GFBFYwSqxYltbFyAVkf2GU+NY9nRnC
        +cwosetMHwtMx58Fj9khEssZJXoW9TDDtXT9f8QEUsUmYCjR9bYLbK6IgKrE57YFYB3MAnsY
        JS6/PgiWEBaIljjybTvYWBagovXHF7OC2LwCNhKbfhxghlgnL7F6A4jNwcEpYCux4VgsRPg2
        m8TTGwUQtovEn/bPUNcJS7w6voUdwpaR+L9zPhPIXgmBZkaJh+fWskM4PUBHNM1ghKiylrhz
        7hcbyAJmAU2J9bv0IcKOEk07r4DtlRDgk7jxVhAkzAxkTto2HSrMK9HRJgRRrSYx6/g6uLUH
        L1yCut5D4tPC19DwmcAocW3XApYJjPKzEJYtYGRcxSieWlqcm55abJSXWq5XnJhbXJqXrpec
        n7uJEZgGTv87/mUH464/SYcYBTgYlXh4DzBExgmxJpYVV+YeYpTgYFYS4d34NTROiDclsbIq
        tSg/vqg0J7X4EKM0B4uSOK/xopexQgLpiSWp2ampBalFMFkmDk6pBsZ40bZqwfS4Fm/1nc++
        SuTuaA+vED+QV6U7M15P9itb7uGA2Grnc+7s1g9uLrm92YD3yXb7O62cepu57ojWvUl7kBj1
        car6aZ2Hbjt/TQ+y3V6iLzL/eObxcpG1MxQ2vVnneeKvmey9U89v7RXMcPr2dSPbRlWBdOGD
        G3KljpVu/+pn51H8Q1eJpTgj0VCLuag4EQDcApPl/wIAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrHLMWRmVeSWpSXmKPExsVy+t/xe7q3NCPjDDo+m1psnLGe1eL8+Q3s
        FjPO72OyWHvkLrvF+mk/WR1YPXbOusvusWlVJ5tH35ZVjB6fN8kFsETp2RTll5akKmTkF5fY
        KkUbWhjpGVpa6BmZWOoZGpvHWhmZKunb2aSk5mSWpRbp2yXoZZyc/IK54BNnRcOOXWwNjJM4
        uhg5OSQETCT+LHjM3sXIxSEksJRRYsHCZ4wQCRmJk9MaWCFsYYk/17rYIIo+MUqcPraADSTB
        JmAo0fW2C8wWEVCV+Ny2AGwSs8A+RomJXVvAuoUFIiU6p75jB7FZgIrWH18MFucVsJHY9OMA
        M8QGeYnVG0BsDg5OAVuJDcdiQcJCQCUT1h1jncDIt4CRYRWjSGppcW56brGhXnFibnFpXrpe
        cn7uJkZgWG479nPzDsZLG4MPMQpwMCrx8B5giIwTYk0sK67MPcQowcGsJMK78WtonBBvSmJl
        VWpRfnxRaU5q8SFGU6CbJjJLiSbnA2MmryTe0NTQ3MLS0NzY3NjMQkmct0PgYIyQQHpiSWp2
        ampBahFMHxMHp1QDY+S3JxO1pi2PDbOe8baM02+/3NO42q/99bwPywpWqb7fHfilTIT7e7G6
        2DsOI6ZDDxY01SYn8S8KWXOm5fRegZSW6/wHLm6Ys2t70Kerp/XmB3zc5WfxzDVliuoa9bvW
        0bW7jp78W+I8UWeXzlr+A8dZjplkXNBvY+N7Pf3+steWF9+lsk1dxqvEUpyRaKjFXFScCAB1
        PjTLYQIAAA==
X-CMS-MailID: 20200228145522eucas1p240577364b62d00499ba1d45691c8430a
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20200228145522eucas1p240577364b62d00499ba1d45691c8430a
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200228145522eucas1p240577364b62d00499ba1d45691c8430a
References: <20200228145502.8316-1-m.szyprowski@samsung.com>
        <CGME20200228145522eucas1p240577364b62d00499ba1d45691c8430a@eucas1p2.samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

G3D power domain in Exynos5420 SoC is supplied from PVDD_G3DS_1V0 and
PVDD_G3D_1V0. Besides the main GPU MALI module it also contains the power
domain control logic and clocks. Turning the power supplies off causes
the power domain to fail to operate properly if GPU drivers are loaded as
modules. GPU should use PVDD_G3D_1V0 supply mainly to control the DVFS.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 arch/arm/boot/dts/exynos5420-arndale-octa.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5420-arndale-octa.dts b/arch/arm/boot/dts/exynos5420-arndale-octa.dts
index ee28d30f5476..e9a09dd0a49b 100644
--- a/arch/arm/boot/dts/exynos5420-arndale-octa.dts
+++ b/arch/arm/boot/dts/exynos5420-arndale-octa.dts
@@ -584,6 +584,7 @@
 				regulator-name = "PVDD_G3DS_1V0";
 				regulator-min-microvolt = <800000>;
 				regulator-max-microvolt = <1100000>;
+				regulator-always-on;
 
 				regulator-state-mem {
 					regulator-on-in-suspend;
@@ -697,6 +698,7 @@
 				regulator-name = "PVDD_G3D_1V0";
 				regulator-min-microvolt = <800000>;
 				regulator-max-microvolt = <1400000>;
+				regulator-always-on;
 
 				regulator-state-mem {
 					regulator-off-in-suspend;
-- 
2.17.1

