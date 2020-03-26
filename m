Return-Path: <SRS0=zaGS=5L=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 192FDC2D0E5
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 26 Mar 2020 15:08:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D37352076A
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 26 Mar 2020 15:08:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="XRoJBO2U"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727815AbgCZPIQ (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 26 Mar 2020 11:08:16 -0400
Received: from mailout2.w1.samsung.com ([210.118.77.12]:38496 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726401AbgCZPIQ (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 26 Mar 2020 11:08:16 -0400
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20200326150814euoutp02a7d37b2084fa813c3e779b5c4756d1ba~-4xn91rVz0266602666euoutp02l
        for <linux-samsung-soc@vger.kernel.org>; Thu, 26 Mar 2020 15:08:14 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20200326150814euoutp02a7d37b2084fa813c3e779b5c4756d1ba~-4xn91rVz0266602666euoutp02l
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1585235294;
        bh=+qZCAjNlrJBZ87rKlNz+yVmttpxSJ0Zo2EZt95anH/0=;
        h=From:To:Cc:Subject:Date:References:From;
        b=XRoJBO2UqmFX4HUGyf3QRhGO74dMKVrXsZ/rhGBZiamjSa8RgoMT6Kd5jzsUsczUz
         sWG+DwVfmoZLz6AfLU9bECeyFKBgON5MkV/ZRnbPSynEQubvJ7ehsU/UD5WVQydmBK
         u2oUOsUrzNxU6EeyI+5vRMc1MgImiFlpL9QXYrEY=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20200326150814eucas1p2a7b55bd851b66d8bbea501c39789d3d3~-4xntQKS_1892118921eucas1p23;
        Thu, 26 Mar 2020 15:08:14 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges3new.samsung.com (EUCPMTA) with SMTP id 40.11.60698.E55CC7E5; Thu, 26
        Mar 2020 15:08:14 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20200326150814eucas1p1e4133a361a23385aa3fdf940980bdfce~-4xnc01zi2557525575eucas1p1v;
        Thu, 26 Mar 2020 15:08:14 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20200326150814eusmtrp2839dab9544b52da6ca2056ca17802238~-4xncLBFa1606416064eusmtrp2p;
        Thu, 26 Mar 2020 15:08:14 +0000 (GMT)
X-AuditID: cbfec7f5-a29ff7000001ed1a-7f-5e7cc55eaf32
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id 32.24.07950.D55CC7E5; Thu, 26
        Mar 2020 15:08:14 +0000 (GMT)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20200326150813eusmtip16446d5bdda9f363438625922641e0dd2~-4xnIdAdF1743717437eusmtip1C;
        Thu, 26 Mar 2020 15:08:13 +0000 (GMT)
From:   Marek Szyprowski <m.szyprowski@samsung.com>
To:     linux-samsung-soc@vger.kernel.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: [PATCH] ARM: dts: exynos: Correct the MAX8997 interrupts on the
 Trats board
Date:   Thu, 26 Mar 2020 16:08:06 +0100
Message-Id: <20200326150806.27221-1-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrNIsWRmVeSWpSXmKPExsWy7djP87pxR2viDL6sFbTYOGM9q8X1L89Z
        Lc6f38BuMeP8PiaLtUfusjuwemxa1cnm0bdlFaPH501yAcxRXDYpqTmZZalF+nYJXBl3tj1m
        LGjhqDgz4y9TA+M9ti5GTg4JAROJIwc6gWwuDiGBFYwSm9bPYoRwvjBKNGzrY4dwPjNKbLk7
        jx2m5faEw4wgtpDAckaJnR/Z4DqmHngLVsQmYCjR9bYLbIeIgKrE57YFYJOYBbYBTep9wAyS
        EBYIk9i3/i0riM0CVPTl7AmwqbwCthJfX/xjhNgmL7F6wwFmCHsLm8TJR7kQtovE2g9zoC4S
        lnh1fAuULSPxf+d8JpBlEgLNjBIPz61lh3B6GCUuN82AmmotcefcL6DzOIBO0pRYv0sfIuwo
        saF9IzNIWEKAT+LGW0GQMDOQOWnbdKgwr0RHmxBEtZrErOPr4NYevHAJ6kwPiTUzvrJAAihW
        4vTEbpYJjHKzEHYtYGRcxSieWlqcm55abJyXWq5XnJhbXJqXrpecn7uJERjlp/8d/7qDcd+f
        pEOMAhyMSjy8DW01cUKsiWXFlbmHGCU4mJVEeJ9GAoV4UxIrq1KL8uOLSnNSiw8xSnOwKInz
        Gi96GSskkJ5YkpqdmlqQWgSTZeLglGpg9FAX8Gsti9/qeKv+9E+WFtXYDsEjVSdKbi4rvdZZ
        F+tfktmTkyO1sLejjH9Lx+eAb72BRvMeFIsu+35HMXZZzLLjS5+slPtReZDn/853199sMe1x
        /5glzZmbeFdvg9qnRY9uqopfui/Jc/253u/YKlX/VT8yikPPXus3eqdhuX72tronMxjqlFiK
        MxINtZiLihMB+PFJee4CAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrELMWRmVeSWpSXmKPExsVy+t/xu7pxR2viDK7cZ7LYOGM9q8X1L89Z
        Lc6f38BuMeP8PiaLtUfusjuwemxa1cnm0bdlFaPH501yAcxRejZF+aUlqQoZ+cUltkrRhhZG
        eoaWFnpGJpZ6hsbmsVZGpkr6djYpqTmZZalF+nYJehl3tj1mLGjhqDgz4y9TA+M9ti5GTg4J
        AROJ2xMOM3YxcnEICSxllHhz6R8jREJG4uS0BlYIW1jiz7UuNoiiT4wSHzdNBEuwCRhKdL3t
        ApskIqAq8bltATtIEbPADkaJLTveghUJC4RI3Dp0jRnEZgEq+nL2BNgGXgFbia8vYLbJS6ze
        cIB5AiPPAkaGVYwiqaXFuem5xUZ6xYm5xaV56XrJ+bmbGIHhte3Yzy07GLveBR9iFOBgVOLh
        1WipiRNiTSwrrsw9xCjBwawkwvs0EijEm5JYWZValB9fVJqTWnyI0RRo+URmKdHkfGDo55XE
        G5oamltYGpobmxubWSiJ83YIHIwREkhPLEnNTk0tSC2C6WPi4JRqYHSwt9Uyn/tG/JPexNPf
        /Ba3vdtpfM88iE32gO9Bzzzpaw77vU6ePX30/A59i53pE5t+ll138n2atj3cbdXJfZaWGw2X
        NKlFSb5dk8V/JO3nqV8Ra8J9Hlw5/njzhaehDbGVxs7tlxN/3r/968LyDF0G5ScGB+Zd+p3v
        /GVTizrPBZ5rjVePqkYosRRnJBpqMRcVJwIA4p9oc0UCAAA=
X-CMS-MailID: 20200326150814eucas1p1e4133a361a23385aa3fdf940980bdfce
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20200326150814eucas1p1e4133a361a23385aa3fdf940980bdfce
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200326150814eucas1p1e4133a361a23385aa3fdf940980bdfce
References: <CGME20200326150814eucas1p1e4133a361a23385aa3fdf940980bdfce@eucas1p1.samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Remove the 'interrupts' and 'interrupts-parent' properties, which have
been superseded by the interrupts-extended property. While touching this,
fix the interrupts flags to correctly describe the hardware.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 arch/arm/boot/dts/exynos4210-trats.dts | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/exynos4210-trats.dts b/arch/arm/boot/dts/exynos4210-trats.dts
index c15c6d7cd352..3d791db6095c 100644
--- a/arch/arm/boot/dts/exynos4210-trats.dts
+++ b/arch/arm/boot/dts/exynos4210-trats.dts
@@ -285,11 +285,10 @@
 
 	max8997_pmic@66 {
 		compatible = "maxim,max8997-pmic";
-		interrupts-extended = <&gpx0 7 0>, <&gpx2 3 0>;
 
 		reg = <0x66>;
-		interrupt-parent = <&gpx0>;
-		interrupts = <7 IRQ_TYPE_NONE>;
+		interrupts-extended = <&gpx0 7 IRQ_TYPE_LEVEL_LOW>,
+				      <&gpx2 3 IRQ_TYPE_EDGE_FALLING>;
 
 		max8997,pmic-buck1-uses-gpio-dvs;
 		max8997,pmic-buck2-uses-gpio-dvs;
-- 
2.17.1

