Return-Path: <SRS0=J4qy=7K=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9D65C433E0
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 28 May 2020 08:15:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A0FA020B80
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 28 May 2020 08:15:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="byU9RVrA"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726803AbgE1IPm (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 28 May 2020 04:15:42 -0400
Received: from mailout2.w1.samsung.com ([210.118.77.12]:54134 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726770AbgE1IPl (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 28 May 2020 04:15:41 -0400
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20200528081540euoutp021957eb6d538f74618b138b3be665a4fd~TIyYiCim50903709037euoutp02Z
        for <linux-samsung-soc@vger.kernel.org>; Thu, 28 May 2020 08:15:40 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20200528081540euoutp021957eb6d538f74618b138b3be665a4fd~TIyYiCim50903709037euoutp02Z
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1590653740;
        bh=VQSszDtDziFjMdzYxKpIe08CqcC8Rb3rsogKDVBYqqY=;
        h=From:To:Cc:Subject:Date:References:From;
        b=byU9RVrA4y2BcN9B9TsUgK84yC7HIqa+Wsg0e1ht22UbKoyi4jn1iWZTaZnea3Zwh
         LwN5Nk8YW0paxi4hhUfdJb5rwX4DO2qybN7PkZ3BdF9KP7peB61ugCO1PRVr5D4c50
         7rzzGcKxtTKJ678tNADsijC7CE9/OZuhG5qQ/9FU=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20200528081539eucas1p19c17e7b5fda209e51c069997997f8fe2~TIyYURA4N2917629176eucas1p1Z;
        Thu, 28 May 2020 08:15:39 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges1new.samsung.com (EUCPMTA) with SMTP id ED.87.61286.B237FCE5; Thu, 28
        May 2020 09:15:39 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20200528081539eucas1p1590e576d26ffd51cb860e6c6040fc437~TIyX7kr850059600596eucas1p1G;
        Thu, 28 May 2020 08:15:39 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20200528081539eusmtrp132cfd217b58fe5feda9ac6ff81582078~TIyX7Bfc70865708657eusmtrp10;
        Thu, 28 May 2020 08:15:39 +0000 (GMT)
X-AuditID: cbfec7f2-ef1ff7000001ef66-a4-5ecf732bf20d
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id 56.BE.08375.B237FCE5; Thu, 28
        May 2020 09:15:39 +0100 (BST)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20200528081539eusmtip179453deef7ebc31b4d63f9585efda64f~TIyXlRFl42008620086eusmtip10;
        Thu, 28 May 2020 08:15:39 +0000 (GMT)
From:   Marek Szyprowski <m.szyprowski@samsung.com>
To:     linux-samsung-soc@vger.kernel.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: [PATCH] ARM: dts: exynos: Extend all Exynos5800 A15's OPPs with max
 voltage data
Date:   Thu, 28 May 2020 10:15:25 +0200
Message-Id: <20200528081525.14858-1-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrBIsWRmVeSWpSXmKPExsWy7djPc7raxefjDDZP0rXYOGM9q8X58xvY
        LWac38dksfbIXXYHFo9NqzrZPPq2rGL0+LxJLoA5issmJTUnsyy1SN8ugSvj+eL3TAVPuSoW
        7djN1MD4iaOLkZNDQsBE4ubvdaxdjFwcQgIrGCUe/JzDBuF8YZQ4c/4FVOYzo8Svw9eYYFoe
        np3IDJFYzijxbuFRVriWD1OOMIJUsQkYSnS97WIDsUUEVCU+ty1gByliFuhjlLi+dy4zSEJY
        IFriRdcMdhCbBahofsNyVhCbV8BWoqHtCBvEOnmJ1RsOgK2TEFjDJnHx1E4WiISLxITrcxkh
        bGGJV8e3sEPYMhKnJ/ewQDQ0M0o8PLeWHcLpYZS43DQDqsNa4s65X0ArOIBu0pRYv0sfIuwo
        0f1rHiNIWEKAT+LGW0GQMDOQOWnbdGaIMK9ER5sQRLWaxKzj6+DWHrxwiRnC9pDY2rsQ7Ewh
        gViJjwsmMU5glJuFsGsBI+MqRvHU0uLc9NRiw7zUcr3ixNzi0rx0veT83E2MwPg+/e/4px2M
        Xy8lHWIU4GBU4uHt8DoXJ8SaWFZcmXuIUYKDWUmE1+ns6Tgh3pTEyqrUovz4otKc1OJDjNIc
        LErivMaLXsYKCaQnlqRmp6YWpBbBZJk4OKUaGCNd5xU+OihyxSuMwUe/XbOoSmQSw10L46xV
        Norv+gXFpjh2/fzzxT2c9bfRnkMvlaIa7SN/To/69LDr5QTemWtezpe1LH+VJVlc5BKsZ1B4
        06Xo7rIq/qdSpU7BX6V9431dnqwubU/mdt14WHPezs9rC772+P8x3fFda23TL+sHnWIcUw/N
        VmIpzkg01GIuKk4EAPESYOTrAgAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrLLMWRmVeSWpSXmKPExsVy+t/xu7raxefjDI60iVhsnLGe1eL8+Q3s
        FjPO72OyWHvkLrsDi8emVZ1sHn1bVjF6fN4kF8AcpWdTlF9akqqQkV9cYqsUbWhhpGdoaaFn
        ZGKpZ2hsHmtlZKqkb2eTkpqTWZZapG+XoJfxfPF7poKnXBWLduxmamD8xNHFyMkhIWAi8fDs
        ROYuRi4OIYGljBI9x86xQyRkJE5Oa2CFsIUl/lzrYoMo+sQocfHTIzaQBJuAoUTX2y4wW0RA
        VeJz2wJ2kCJmgQmMEuc7Z4AlhAUiJWY2zWcCsVmAiuY3LAebyitgK9HQdoQNYoO8xOoNB5gn
        MPIsYGRYxSiSWlqcm55bbKhXnJhbXJqXrpecn7uJERhU24793LyD8dLG4EOMAhyMSjy8Bh7n
        4oRYE8uKK3MPMUpwMCuJ8DqdPR0nxJuSWFmVWpQfX1Sak1p8iNEUaPlEZinR5HxgwOeVxBua
        GppbWBqaG5sbm1koifN2CByMERJITyxJzU5NLUgtgulj4uCUamB0uGvpLbbnSpzdtqNrX1t7
        6Zwq2fX8Xs7V+2ziLkmxMhXzgjvfxjb35ydlzc+Qf3J1Um3/stictavSGdksVtTqzPXvW5Qr
        fGw7U4NxG0vcf84bMRnMn/W5mrxZVJ4te9IeVaQrVVZ2bldFRu2k/8HzvtpckN6R8SBnGm+y
        5IoKN+5djf1Jr5RYijMSDbWYi4oTASs+gB9AAgAA
X-CMS-MailID: 20200528081539eucas1p1590e576d26ffd51cb860e6c6040fc437
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20200528081539eucas1p1590e576d26ffd51cb860e6c6040fc437
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200528081539eucas1p1590e576d26ffd51cb860e6c6040fc437
References: <CGME20200528081539eucas1p1590e576d26ffd51cb860e6c6040fc437@eucas1p1.samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Exynos5422/5800 the regulator supply for the A15 cores ("vdd_arm") is
coupled with the regulator supply for the SoC internal circuits
("vdd_int"), thus all operating points that modify one of those supplies
have to specify a triplet of the min/target/max values to properly work
with regulator coupling.

Fixes: eaffc4de16c6 ("ARM: dts: exynos: Add missing CPU frequencies for Exynos5422/5800")
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 arch/arm/boot/dts/exynos5800.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/exynos5800.dtsi b/arch/arm/boot/dts/exynos5800.dtsi
index dfb99ab53c3e..526729dad53f 100644
--- a/arch/arm/boot/dts/exynos5800.dtsi
+++ b/arch/arm/boot/dts/exynos5800.dtsi
@@ -23,17 +23,17 @@
 &cluster_a15_opp_table {
 	opp-2000000000 {
 		opp-hz = /bits/ 64 <2000000000>;
-		opp-microvolt = <1312500>;
+		opp-microvolt = <1312500 1312500 1500000>;
 		clock-latency-ns = <140000>;
 	};
 	opp-1900000000 {
 		opp-hz = /bits/ 64 <1900000000>;
-		opp-microvolt = <1262500>;
+		opp-microvolt = <1262500 1262500 1500000>;
 		clock-latency-ns = <140000>;
 	};
 	opp-1800000000 {
 		opp-hz = /bits/ 64 <1800000000>;
-		opp-microvolt = <1237500>;
+		opp-microvolt = <1237500 1237500 1500000>;
 		clock-latency-ns = <140000>;
 	};
 	opp-1700000000 {
-- 
2.17.1

