Return-Path: <SRS0=6Xyg=EJ=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA55FC388F7
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  3 Nov 2020 12:46:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2B681208B6
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  3 Nov 2020 12:46:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="Mjx2skEt"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728721AbgKCMqe (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 3 Nov 2020 07:46:34 -0500
Received: from mailout1.w1.samsung.com ([210.118.77.11]:33569 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729032AbgKCMqe (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 3 Nov 2020 07:46:34 -0500
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20201103124622euoutp0113e6a5ee6f0cd9516cf480a069c475b8~EADII99tF3052430524euoutp01a
        for <linux-samsung-soc@vger.kernel.org>; Tue,  3 Nov 2020 12:46:22 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20201103124622euoutp0113e6a5ee6f0cd9516cf480a069c475b8~EADII99tF3052430524euoutp01a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1604407582;
        bh=ELym5phWgP/cljX2n2rFypr5040wIE4gOG3SDAyZoOM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Mjx2skEtqYd17F9ut9K6iyCO1nkvyhDmZ6RSUjOGbuZwExnZAoRm2mrMKV/fqZKiK
         GRcf3Ral6gQMfUz3KMbpbUGPXNRBu+bK9CzfDwuud9bTXdepNCCAzB6m6B99v8Fm7J
         3g4Q+pCJDwkQUbN+sTHVMWkJ9wQb+oaynQBq4hrQ=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20201103124621eucas1p1b58c3f91cdd4447f359cb3157a8f48dc~EADHjzUA10135001350eucas1p1w;
        Tue,  3 Nov 2020 12:46:21 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges1new.samsung.com (EUCPMTA) with SMTP id 5B.DF.06456.D1151AF5; Tue,  3
        Nov 2020 12:46:21 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20201103124621eucas1p1e447d6d2eb3f29ecd657f0705f15960d~EADHHinP70134101341eucas1p1n;
        Tue,  3 Nov 2020 12:46:21 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20201103124621eusmtrp2a3374651e658a81423c3f4de149da465~EADHG6LXf1121611216eusmtrp2X;
        Tue,  3 Nov 2020 12:46:21 +0000 (GMT)
X-AuditID: cbfec7f2-7efff70000001938-74-5fa1511d84a3
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id 77.C4.06314.C1151AF5; Tue,  3
        Nov 2020 12:46:20 +0000 (GMT)
Received: from localhost (unknown [106.120.51.46]) by eusmtip2.samsung.com
        (KnoxPortal) with ESMTPA id
        20201103124620eusmtip2df1e2115b660cfc2ff7dfb9f689a5950~EADG7wlFC1103711037eusmtip2F;
        Tue,  3 Nov 2020 12:46:20 +0000 (GMT)
From:   =?UTF-8?q?=C5=81ukasz=20Stelmach?= <l.stelmach@samsung.com>
To:     Rob Herring <robh+dt@kernel.org>, Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Anand Moon <linux.amoon@gmail.com>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     =?UTF-8?q?Bart=C5=82omiej=20=C5=BBolnierkiewicz?= 
        <b.zolnierkie@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        =?UTF-8?q?=C5=81ukasz=20Stelmach?= <l.stelmach@samsung.com>
Subject: [PATCH 2/5] ARM: dts: exynos: Add Ethernet interface description
 for Odroid X3 Lite
Date:   Tue,  3 Nov 2020 13:46:15 +0100
Message-Id: <20201103124618.21358-3-l.stelmach@samsung.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201103124618.21358-1-l.stelmach@samsung.com>
MIME-Version: 1.0
Organization: Samsung R&D Institute Poland
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrIKsWRmVeSWpSXmKPExsWy7djP87qygQvjDe5dkrbYOGM9q8X8I+dY
        Lfofv2a2OH9+A7vFzUMrGC02Pb7GanF51xw2ixnn9zFZrNt4i91i7ZG77Bate4+wO3B77Jx1
        l91j06pONo/NS+o9+rasYvT4vEkugDWKyyYlNSezLLVI3y6BK+Pc8l7Wgj7OivtbWxkbGNex
        dzFyckgImEi82dbE3MXIxSEksIJR4uuWLYwQzhdGiR1bG9ggnM+MEu+3LGaDaZnzeysjiC0k
        sJxRYtVWG4ii54wSk1bvYQVJsAk4SvQvPcEKkhARmM4ksXTPfLAlzAL7GCV23pvCDFIlLBAn
        8fbqVbAOFgFVifMPG8Cu4hWwlrjY+RdqnbxE+/LtYDangI3Ei7e/mSBqBCVOznzCAmLzC2hJ
        rGm6DmYzA9U3b50NtkxC4By7xMPO26wQg1wkTt7vYIGwhSVeHd8CDQIZif875wMN5QCy6yUm
        TzKD6O1hlNg25wdUvbXEnXO/2EBqmAU0Jdbv0ocoB/rylSWEySdx460gxAV8EpO2TWeGCPNK
        dLQJQcxQkVjXvwdqnpRE76sVjBMYlWYh+WUWkvtnIaxawMi8ilE8tbQ4Nz212DAvtVyvODG3
        uDQvXS85P3cTIzAhnf53/NMOxq+Xkg4xCnAwKvHwOqQuiBdiTSwrrsw9xCjBwawkwut09nSc
        EG9KYmVValF+fFFpTmrxIUZpDhYlcV7jRS9jhQTSE0tSs1NTC1KLYLJMHJxSDYw+MZPOWc9d
        8kvZUSR7woHi+94is8IWnPlxwkv26xnpQufpO0/GVOU3vdh4/Vg1Y/+RCS+Fq4Uj/nccej/t
        7EyWtCfiGpJHRAt1cjJdv2WuMZWcuP3hsRsdWis8LIIO3Lp5b8LDvv0HY/Z8lItPlVDcLDLx
        WM7KvBrBdzmVBw4+VIhikdgspVCqxFKckWioxVxUnAgAkLcuEEQDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrIIsWRmVeSWpSXmKPExsVy+t/xe7oygQvjDc7dtrbYOGM9q8X8I+dY
        Lfofv2a2OH9+A7vFzUMrGC02Pb7GanF51xw2ixnn9zFZrNt4i91i7ZG77Bate4+wO3B77Jx1
        l91j06pONo/NS+o9+rasYvT4vEkugDVKz6Yov7QkVSEjv7jEVina0MJIz9DSQs/IxFLP0Ng8
        1srIVEnfziYlNSezLLVI3y5BL+Pc8l7Wgj7OivtbWxkbGNexdzFyckgImEjM+b2VEcQWEljK
        KLHuS0wXIwdQXEpi5dx0iBJhiT/Xuti6GLmASp4ySqycuIMZJMEm4CjRv/QEK0hCRGA+k8Sp
        2R1gDrPAPkaJ/UcXg20QFoiRODShAayDRUBV4vzDBrA4r4C1xMXOv2wQK+Ql2pdvB7M5BWwk
        Xrz9zQRyhRBQzb3/ChDlghInZz5hAQkzC6hLrJ8nBBLmF9CSWNN0nQXEZgaa0rx1NvMERqFZ
        SDpmIXTMQlK1gJF5FaNIamlxbnpusaFecWJucWleul5yfu4mRmD0bTv2c/MOxksbgw8xCnAw
        KvHwOqQuiBdiTSwrrsw9xCjBwawkwut09nScEG9KYmVValF+fFFpTmrxIUZToC8nMkuJJucD
        E0NeSbyhqaG5haWhubG5sZmFkjhvh8DBGCGB9MSS1OzU1ILUIpg+Jg5OqQZG5cvv8o4crq/9
        +urRL+8X9pH+trMTNwvNqDMW6rz+7N75IOOJwXWG+xIOcBzduUSx4At3SE7k8Vub2fdN/sHy
        Y798p9L7qIjwdXtLpstVz3+VWn7E84RMSr/d5i8fNDIcGNYc5au73KPzX8S9JrVfq1l72+lO
        rjN7Y7xkz4lb97BK39umLFOlxFKckWioxVxUnAgA6gENW9QCAAA=
X-CMS-MailID: 20201103124621eucas1p1e447d6d2eb3f29ecd657f0705f15960d
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20201103124621eucas1p1e447d6d2eb3f29ecd657f0705f15960d
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20201103124621eucas1p1e447d6d2eb3f29ecd657f0705f15960d
References: <20201103124618.21358-1-l.stelmach@samsung.com>
        <CGME20201103124621eucas1p1e447d6d2eb3f29ecd657f0705f15960d@eucas1p1.samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Add Ethernet interface description for Odroid X3 Lite.

Signed-off-by: Łukasz Stelmach <l.stelmach@samsung.com>
---
 .../boot/dts/exynos5422-odroidxu3-lite.dts    | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5422-odroidxu3-lite.dts b/arch/arm/boot/dts/exynos5422-odroidxu3-lite.dts
index 98feecad5489..62c5928aa994 100644
--- a/arch/arm/boot/dts/exynos5422-odroidxu3-lite.dts
+++ b/arch/arm/boot/dts/exynos5422-odroidxu3-lite.dts
@@ -16,6 +16,10 @@
 / {
 	model = "Hardkernel Odroid XU3 Lite";
 	compatible = "hardkernel,odroid-xu3-lite", "samsung,exynos5800", "samsung,exynos5";
+
+	aliases {
+		ethernet = &ethernet;
+	};
 };
 
 &arm_a7_pmu {
@@ -103,3 +107,21 @@ &pwm {
 &usbdrd_dwc3_1 {
 	dr_mode = "peripheral";
 };
+
+&usbhost2 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	hub@1 {
+		compatible = "usb0424,9514";
+		reg = <1>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		ethernet: usbether@1 {
+			compatible = "usb0424,ec00";
+			reg = <1>;
+			local-mac-address = [00 00 00 00 00 00]; /* Filled in by a bootloader */
+		};
+	};
+};
-- 
2.26.2

