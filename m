Return-Path: <SRS0=Yoj7=4I=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 054B3C11D05
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 20 Feb 2020 14:28:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id BA9C9208E4
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 20 Feb 2020 14:28:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="OtoaXG4F"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727761AbgBTO2Q (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 20 Feb 2020 09:28:16 -0500
Received: from mailout2.w1.samsung.com ([210.118.77.12]:35793 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727088AbgBTO2Q (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 20 Feb 2020 09:28:16 -0500
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20200220142814euoutp023dea4b38ec777980c1130a58ca40fb13~1Iptdedkv2782827828euoutp02R
        for <linux-samsung-soc@vger.kernel.org>; Thu, 20 Feb 2020 14:28:14 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20200220142814euoutp023dea4b38ec777980c1130a58ca40fb13~1Iptdedkv2782827828euoutp02R
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1582208894;
        bh=u7JaKV6i2x3yU+pU1Flu9M/afqddK4CNrlXT2x0MWJY=;
        h=From:To:Cc:Subject:Date:References:From;
        b=OtoaXG4FIvnCb2WGOXHiC6MELa4W3bzKAp5YRoAOMJ/+BrdqWalDeh+z32TED44zT
         ZoltiZpLr03yE5FCZ+YxWPaVJ/TuxS15tULQ2pDCE+mA+oEt8GtNqUrjj3+c4pzS28
         WFmWtvYIlfCf1lOZc4gKt8KFkOt2zKfXd7vzwpT8=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20200220142814eucas1p2af0187f56d1806c91d94a5f39a57d5b8~1IptRTxs_3210332103eucas1p2L;
        Thu, 20 Feb 2020 14:28:14 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges1new.samsung.com (EUCPMTA) with SMTP id 86.66.61286.E779E4E5; Thu, 20
        Feb 2020 14:28:14 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20200220142814eucas1p2a230d064c9cebcc029ce12b228fd31ac~1Ips8AZHw0579505795eucas1p2J;
        Thu, 20 Feb 2020 14:28:14 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20200220142814eusmtrp1f4234a9525744791859a5e7d9bc9a71e~1Ips7Z1hG3261632616eusmtrp1N;
        Thu, 20 Feb 2020 14:28:14 +0000 (GMT)
X-AuditID: cbfec7f2-ef1ff7000001ef66-12-5e4e977e45bc
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id B2.A4.07950.E779E4E5; Thu, 20
        Feb 2020 14:28:14 +0000 (GMT)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20200220142813eusmtip1373ee4991aed7404ff1553f8b7093931~1Ipspksb51719717197eusmtip1I;
        Thu, 20 Feb 2020 14:28:13 +0000 (GMT)
From:   Marek Szyprowski <m.szyprowski@samsung.com>
To:     linux-samsung-soc@vger.kernel.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: [PATCH 1/2] ARM: dts: exynos: Fix MMC regulator on Arndale5250
 board
Date:   Thu, 20 Feb 2020 15:28:05 +0100
Message-Id: <20200220142806.19340-1-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrKIsWRmVeSWpSXmKPExsWy7djPc7p10/3iDBa8lrPYOGM9q8X58xvY
        LWac38dksfbIXXYHFo9NqzrZPPq2rGL0+LxJLoA5issmJTUnsyy1SN8ugStjyYmtjAXnOCru
        vOpmbGCcwN7FyMkhIWAise7VWbYuRi4OIYEVjBJ//zxnhnC+MEp8ndXOCuF8ZpRYvvECI0zL
        wyNToRLLGSUaX39nA0mAtdyaUA9iswkYSnS97QKLiwioSnxuW8AO0sAs0McocX3vXKAdHBzC
        Av4S+/9wgJgsQDX3ZsaBlPMK2EpsuXEDape8xOoNB8AukhDYwCbxcu8DqISLxJd/v5khbGGJ
        V8e3QP0jI3F6cg8LREMzo8TDc2vZIZweRonLTTOguq0l7pz7xQaymVlAU2L9Ln2IsKPEsX17
        wG6TEOCTuPFWECTMDGRO2jYdKswr0dEmBFGtJjHr+Dq4tQcvXII6x0PiztEbTJAgiZV49HIj
        2wRGuVkIuxYwMq5iFE8tLc5NTy02zEst1ytOzC0uzUvXS87P3cQIjOzT/45/2sH49VLSIUYB
        DkYlHt6KBr84IdbEsuLK3EOMEhzMSiK8ajxAId6UxMqq1KL8+KLSnNTiQ4zSHCxK4rzGi17G
        CgmkJ5akZqemFqQWwWSZODilGhgX1U68Fl/x1eC6IZ/5eflXTa71Z3IvbNmteNPwDAcL66Of
        LlyP45trIw/artvT4nGd/Wj8H3POe0FTHZfo3Dy/yDrSr0Vwgvs56Z2ZJQ5Pl65x2yl+pf51
        bcdRHlvdnqLAu3r+qk0Bv1d7fPW/w7eouqDioXDaxv2OXzWETFZ8mjKfuZ3xo6wSS3FGoqEW
        c1FxIgAlmW1a6AIAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrDLMWRmVeSWpSXmKPExsVy+t/xu7p10/3iDG7M57bYOGM9q8X58xvY
        LWac38dksfbIXXYHFo9NqzrZPPq2rGL0+LxJLoA5Ss+mKL+0JFUhI7+4xFYp2tDCSM/Q0kLP
        yMRSz9DYPNbKyFRJ384mJTUnsyy1SN8uQS9jyYmtjAXnOCruvOpmbGCcwN7FyMkhIWAi8fDI
        VNYuRi4OIYGljBLNfy4zQyRkJE5Oa2CFsIUl/lzrYoMo+sQo0dh/lQ0kwSZgKNH1tgvMFhFQ
        lfjctoAdpIhZYAKjxPnOGWAJYQFfieXzDwJN4uBgASq6NzMOJMwrYCux5cYNRogF8hKrNxxg
        nsDIs4CRYRWjSGppcW56brGRXnFibnFpXrpecn7uJkZgSG079nPLDsaud8GHGAU4GJV4eCsa
        /OKEWBPLiitzDzFKcDArifCq8QCFeFMSK6tSi/Lji0pzUosPMZoC7Z7ILCWanA8M97ySeENT
        Q3MLS0NzY3NjMwslcd4OgYMxQgLpiSWp2ampBalFMH1MHJxSDYzOIS6hhV4n/j5bH3YhacUM
        PlU7+S2n1vpuP393q9H848nR/S1+oX1+Eks+tXpfKvesmObQoMjf8nJVRdnLf+Yyjo9LL9nf
        mefE7h35+ffusBLe738NeE6axryL/ROcLvTx7mOfRcv2bT2p0drpfa6p+ED1trebe63u6ito
        bvzEOlXtzrrPt4SUWIozEg21mIuKEwGLqWZ3PwIAAA==
X-CMS-MailID: 20200220142814eucas1p2a230d064c9cebcc029ce12b228fd31ac
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20200220142814eucas1p2a230d064c9cebcc029ce12b228fd31ac
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200220142814eucas1p2a230d064c9cebcc029ce12b228fd31ac
References: <CGME20200220142814eucas1p2a230d064c9cebcc029ce12b228fd31ac@eucas1p2.samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

According to the schematic, both eMMC and SDMMC use dedicated fixed
regulators connected directly to the DC5V and MAIN_DC rails. Remove the
GPX1-1 line assigned to the MMC regulator, because such control
connection doesn't exist. Also change its name to VDD_MMC to avoid
conflict with LDO18 output of S5M8767 PMIC.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 arch/arm/boot/dts/exynos5250-arndale.dts | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/exynos5250-arndale.dts b/arch/arm/boot/dts/exynos5250-arndale.dts
index f8ebc620f42d..bff24c61212b 100644
--- a/arch/arm/boot/dts/exynos5250-arndale.dts
+++ b/arch/arm/boot/dts/exynos5250-arndale.dts
@@ -98,11 +98,9 @@
 		mmc_reg: regulator@1 {
 			compatible = "regulator-fixed";
 			reg = <1>;
-			regulator-name = "VDD_33ON_2.8V";
+			regulator-name = "VDD_MMC";
 			regulator-min-microvolt = <2800000>;
 			regulator-max-microvolt = <2800000>;
-			gpio = <&gpx1 1 GPIO_ACTIVE_HIGH>;
-			enable-active-high;
 		};
 
 		reg_hdmi_en: regulator@2 {
-- 
2.17.1

