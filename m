Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74D36C43334
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 23 Jun 2022 09:36:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231203AbiFWJg6 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 23 Jun 2022 05:36:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40614 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231129AbiFWJg5 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 23 Jun 2022 05:36:57 -0400
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3497496A0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 23 Jun 2022 02:36:47 -0700 (PDT)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20220623093642euoutp010d6dd1551a882a5b1c4199036f443504~7Nk9hZvCV1293212932euoutp01p
        for <linux-samsung-soc@vger.kernel.org>; Thu, 23 Jun 2022 09:36:42 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20220623093642euoutp010d6dd1551a882a5b1c4199036f443504~7Nk9hZvCV1293212932euoutp01p
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1655977002;
        bh=9SQtRTmptlpX2eGqJJoi05MYv1nLRS8ShWrPfcmNEaw=;
        h=From:To:Cc:Subject:Date:References:From;
        b=I5KTYmG2tTce9CcgLVSxT7XlipMQ/xd4waCzqg+6vYLjSR5g5vSLjiVW2PtqFUoBz
         /n6swMWDAOok5dJOaUTMfFTvJR5gEdx0PVUr9ygTzq7mc2rfpwcRzQOCnypC/1bDsa
         01DggtrJh/veLpDb/EsWMFBmjP9xFDJqTItYLZt8=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20220623093642eucas1p240329f627c8647972b312064db90f603~7Nk9OxwLv3038830388eucas1p2-;
        Thu, 23 Jun 2022 09:36:42 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges1new.samsung.com (EUCPMTA) with SMTP id 49.11.09664.A2434B26; Thu, 23
        Jun 2022 10:36:42 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20220623093641eucas1p11732bf2c875960f7a2bb1d6fe053bc81~7Nk81hrsl1208412084eucas1p16;
        Thu, 23 Jun 2022 09:36:41 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20220623093641eusmtrp22ad7045aa6572c61bfa82bbf1e156f44~7Nk80tqCu0744107441eusmtrp2K;
        Thu, 23 Jun 2022 09:36:41 +0000 (GMT)
X-AuditID: cbfec7f2-d97ff700000025c0-cb-62b4342a0565
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id F6.9E.09038.92434B26; Thu, 23
        Jun 2022 10:36:41 +0100 (BST)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20220623093641eusmtip2781fa68136cb39eb46e90a6c20c72eeb~7Nk8hdbQb1899918999eusmtip2F;
        Thu, 23 Jun 2022 09:36:41 +0000 (GMT)
From:   Marek Szyprowski <m.szyprowski@samsung.com>
To:     iommu@lists.linux-foundation.org, linux-samsung-soc@vger.kernel.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>
Subject: [PATCH] iommu/exynos: Make driver independent of the system page
 size
Date:   Thu, 23 Jun 2022 11:36:29 +0200
Message-Id: <20220623093629.32178-1-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrCIsWRmVeSWpSXmKPExsWy7djPc7paJluSDF5s47FYsN/aonP2BnaL
        Gef3MVmsPXKX3eLghyesDqweTw7OY/JYM28No8fkG8sZPfq2rGL0+LxJLoA1issmJTUnsyy1
        SN8ugSvjzqkGpoKp3BVbzu1kaWBcwNnFyMkhIWAi8XHCb7YuRi4OIYEVjBLbH+xih3C+MEpM
        fdDMBOF8ZpTobTvJDtNy9ucaZojEckaJxhfLWOFa1hz4zAJSxSZgKNH1tosNxBYRcJe4/uc5
        WJxZoEzi/P1HYLawQIDEhBnrwWwWAVWJh1sug9m8ArYS96evZYTYJi+xesMBsG0SAm/ZJV40
        9DNDJFwknm6YygJhC0u8Or4F6jwZif875wPdzQFk50v8nWEMEa6QuPZ6DVSrtcSdc7/YQEqY
        BTQl1u/Shwg7Snz/fpUVopNP4sZbQYiL+SQmbZvODBHmlehoE4KoVpOYdXwd3M6DFy5BlXhI
        bJwUABIWEoiVaLy6mH0Co9wshFULGBlXMYqnlhbnpqcWG+allusVJ+YWl+al6yXn525iBEb8
        6X/HP+1gnPvqo94hRiYOxkOMEhzMSiK8L/5vThLiTUmsrEotyo8vKs1JLT7EKM3BoiTOm5y5
        IVFIID2xJDU7NbUgtQgmy8TBKdXAlJY3d0ue5LoJjI3O007ff3f7558DSptYt25xuPQ0wHvS
        A6Hnu9e8mTXd/PTmmilWQRuOm6cY+t+WXtAcZJ/QXsrcxbtox+v4Ty/NhN9MXBfjHrPP2kuD
        c8JHrhUbrBtmSh97pdyQ6jNfpWK+rfbpjwd2Swu2/t8p+f/45DQWkwKjHPYVfs9ffrmQKHO+
        aa/2IR8zy8z8rU+F739ck6P86Oy2Mnu/la6ntn4Rs1TZYeZ9zvvcfQP/i4ZSrcdSTf9NWbCo
        UNZuZoJw7fbPgr8YA0L+Jfy13Su5y6vFfaZnxPvJdx/IFKz7dHjz+fsfPxbzqa0pbNSb+Nfu
        pajTZ5Vdzdo9irvFGr9Mk1k5raAms1GJpTgj0VCLuag4EQB7ZCzpZwMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrFLMWRmVeSWpSXmKPExsVy+t/xe7qaJluSDNbf1LNYsN/aonP2BnaL
        Gef3MVmsPXKX3eLghyesDqweTw7OY/JYM28No8fkG8sZPfq2rGL0+LxJLoA1Ss+mKL+0JFUh
        I7+4xFYp2tDCSM/Q0kLPyMRSz9DYPNbKyFRJ384mJTUnsyy1SN8uQS/jzqkGpoKp3BVbzu1k
        aWBcwNnFyMkhIWAicfbnGmYQW0hgKaPEipXKEHEZiZPTGlghbGGJP9e62LoYuYBqPjFKdOx5
        AtbAJmAo0fUWJMHJISLgKTHzbQtQAwcHs0CFRPsFfhBTWMBP4vpfJpAKFgFViYdbLrOA2LwC
        thL3p69lhBgvL7F6wwHmCYw8CxgZVjGKpJYW56bnFhvpFSfmFpfmpesl5+duYgQG2rZjP7fs
        YFz56qPeIUYmDsZDjBIczEoivC/+b04S4k1JrKxKLcqPLyrNSS0+xGgKtG8is5Rocj4w1PNK
        4g3NDEwNTcwsDUwtzYyVxHk9CzoShQTSE0tSs1NTC1KLYPqYODilGpiWBLGZW35L3cDCZi/L
        L/U9Yqn9X/l7kqf2q6eU3/M6UPDFk3ulRt1cwz1Js+3rd3q73i+UOvudf4nA2r47QbWKagHX
        9Z40z3HZc6fclm86c1NHd/7P3p8lzSd2ccm59HaWljdzJt3U2JAwZX0sW5150vw4Z5uztTPO
        ZEyuv1k70/Tv3kuKLiefftHsl/+9JvObrtDCVfskNSp+hu9VYbeo8fEJ9GveyTd7y1SGAs2/
        W6unC+3p+q50i2e99RKFzjidYo69Njy8bzxlVZ7dENmZYfhXYOIlcZc5e9n5S07ERV1uOKFx
        z++fkcxaM+MVn1y00iMPXmn7ztS7eXZR9RxFJjkbD1vJmKTfU3otlFiKMxINtZiLihMBxmWq
        q70CAAA=
X-CMS-MailID: 20220623093641eucas1p11732bf2c875960f7a2bb1d6fe053bc81
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20220623093641eucas1p11732bf2c875960f7a2bb1d6fe053bc81
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20220623093641eucas1p11732bf2c875960f7a2bb1d6fe053bc81
References: <CGME20220623093641eucas1p11732bf2c875960f7a2bb1d6fe053bc81@eucas1p1.samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

PAGE_{SIZE,SHIFT} macros depend on the configured kernel's page size, but
the driver expects values calculated as for 4KB pages. Fix this.

Reported-by: Robin Murphy <robin.murphy@arm.com>
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
Untested, because Exynos based boards I have doesn't boot with non-4KB
page size for other reasons.
---
 drivers/iommu/exynos-iommu.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/iommu/exynos-iommu.c b/drivers/iommu/exynos-iommu.c
index 71f2018e23fe..9c060505a46e 100644
--- a/drivers/iommu/exynos-iommu.c
+++ b/drivers/iommu/exynos-iommu.c
@@ -340,8 +340,7 @@ static void __sysmmu_set_ptbase(struct sysmmu_drvdata *data, phys_addr_t pgd)
 	if (MMU_MAJ_VER(data->version) < 5)
 		writel(pgd, data->sfrbase + REG_PT_BASE_ADDR);
 	else
-		writel(pgd >> PAGE_SHIFT,
-			     data->sfrbase + REG_V5_PT_BASE_PFN);
+		writel(pgd / SZ_4K, data->sfrbase + REG_V5_PT_BASE_PFN);
 
 	__sysmmu_tlb_invalidate(data);
 }
@@ -551,7 +550,7 @@ static void sysmmu_tlb_invalidate_entry(struct sysmmu_drvdata *data,
 		 * 64KB page can be one of 16 consecutive sets.
 		 */
 		if (MMU_MAJ_VER(data->version) == 2)
-			num_inv = min_t(unsigned int, size / PAGE_SIZE, 64);
+			num_inv = min_t(unsigned int, size / SZ_4K, 64);
 
 		if (sysmmu_block(data)) {
 			__sysmmu_tlb_invalidate_entry(data, iova, num_inv);
-- 
2.17.1

