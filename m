Return-Path: <SRS0=6Xyg=EJ=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B87AC388F2
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  3 Nov 2020 18:44:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D392220786
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  3 Nov 2020 18:44:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="tq1qGanV"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725997AbgKCSor (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 3 Nov 2020 13:44:47 -0500
Received: from mailout2.w1.samsung.com ([210.118.77.12]:45328 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729437AbgKCSoq (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 3 Nov 2020 13:44:46 -0500
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20201103184428euoutp02cacebd365ce8472abf5252d86f1bdca8~EE7yu5STp2226122261euoutp02X
        for <linux-samsung-soc@vger.kernel.org>; Tue,  3 Nov 2020 18:44:28 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20201103184428euoutp02cacebd365ce8472abf5252d86f1bdca8~EE7yu5STp2226122261euoutp02X
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1604429068;
        bh=AFQ1Xoh1P+fOWo/ZlEP5tE9qx1pmGB/HHsjLNt6xvks=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=tq1qGanV6xHpCFkVqzYaiSjMY4xoUzSXWAM0Bfcd0RlwESGPdWwjAlvaw69f5pviT
         2Kt4EHo+BBTSgSZOBSSzMvPaKIL74I6TFEXHE/uRmzL1+PObOjExWGO6bLNBiqyJ2Q
         dewIsWEgvfaQ2BMedrwnwsJ4cS4lIDwzxW+yNJzc=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20201103184419eucas1p1247ee6b3d3ba757cc81e4c4cf3b40695~EE7qW71971969619696eucas1p1n;
        Tue,  3 Nov 2020 18:44:19 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges1new.samsung.com (EUCPMTA) with SMTP id 39.13.06456.305A1AF5; Tue,  3
        Nov 2020 18:44:19 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20201103184418eucas1p221bebfee92d2753b11a158b765d77cc6~EE7pkeH3R2525825258eucas1p2I;
        Tue,  3 Nov 2020 18:44:18 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20201103184418eusmtrp179107d4703bfa61cd996e93a272dffbf~EE7pj3_WG0237602376eusmtrp1i;
        Tue,  3 Nov 2020 18:44:18 +0000 (GMT)
X-AuditID: cbfec7f2-7efff70000001938-be-5fa1a503394c
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id 0F.BB.06314.205A1AF5; Tue,  3
        Nov 2020 18:44:18 +0000 (GMT)
Received: from localhost (unknown [106.120.51.46]) by eusmtip1.samsung.com
        (KnoxPortal) with ESMTPA id
        20201103184418eusmtip1c866bb200424d28e3e9c1cf5a77270ac~EE7pZHf6-2263022630eusmtip1y;
        Tue,  3 Nov 2020 18:44:18 +0000 (GMT)
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
Subject: [PATCH v2 3/6] ARM: dts: exynos: Add Ethernet interface description
 for Odroid XU3 Lite
Date:   Tue,  3 Nov 2020 19:44:09 +0100
Message-Id: <20201103184412.18874-4-l.stelmach@samsung.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201103184412.18874-1-l.stelmach@samsung.com>
MIME-Version: 1.0
Organization: Samsung R&D Institute Poland
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrIKsWRmVeSWpSXmKPExsWy7djPc7rMSxfGG3zsELHYOGM9q8X8I+dY
        Lfofv2a2OH9+A7vFzUMrGC02Pb7GanF51xw2ixnn9zFZrNt4i91i7ZG77Bate4+wO3B77Jx1
        l91j06pONo/NS+o9+rasYvT4vEkugDWKyyYlNSezLLVI3y6BK+PbjB6mgvecFbN23mJtYPzN
        3sXIySEhYCLxcB6IzcUhJLCCUWJz3xc2COcLo8T+7avBqoQEPjNKHNgZDtPR3XQbqmM5o8S+
        48eZIJznjBJXXr9kAaliE3CU6F96ghUkISIwnUli6Z75zCAOs8A+Romd96Ywg1QJCyRJfD4w
        C8jm4GARUJWYfyIbJMwrYC3Rc7SRFWKdvET78u1sIDangI3EttfdjBA1ghInZz4BW8YvoCWx
        puk6mM0MVN+8dTbYLgmBS+wSO78uZYYY5CKxYM5FqK+FJV4d3wJly0icntzDAnKDhEC9xORJ
        ZhC9PYwS2+b8YIGosZa4c+4XG0gNs4CmxPpd+hBhR4m7v+axQ7TySdx4KwhxAp/EpG3TmSHC
        vBIdbUIQ1SoS6/r3QA2Ukuh9tYJxAqPSLCTPzELywCyEXQsYmVcxiqeWFuempxYb5qWW6xUn
        5haX5qXrJefnbmIEJqTT/45/2sH49VLSIUYBDkYlHl6H1AXxQqyJZcWVuYcYJTiYlUR4nc6e
        jhPiTUmsrEotyo8vKs1JLT7EKM3BoiTOa7zoZayQQHpiSWp2ampBahFMlomDU6qBsSZ/wX4T
        WfV3X1+z3hGK3HI3Pnf3RYPmF3diLx75m8m4Zsl6Dr3KlwW5lwRLVgqZvNMI3+quFbpYPT5x
        +UYXdwsLyyPSprsjj1bNFLq4WSU25lj2iwXzePYalN64oCwZtnzdH+Urnk2evhcb7goEPjl0
        ynT152uSk5657hLK8LVoucVrn7klU4mlOCPRUIu5qDgRAIaY175EAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrEIsWRmVeSWpSXmKPExsVy+t/xu7pMSxfGG3TekbbYOGM9q8X8I+dY
        Lfofv2a2OH9+A7vFzUMrGC02Pb7GanF51xw2ixnn9zFZrNt4i91i7ZG77Bate4+wO3B77Jx1
        l91j06pONo/NS+o9+rasYvT4vEkugDVKz6Yov7QkVSEjv7jEVina0MJIz9DSQs/IxFLP0Ng8
        1srIVEnfziYlNSezLLVI3y5BL+PbjB6mgvecFbN23mJtYPzN3sXIySEhYCLR3XQbyObiEBJY
        yihxtn0+UxcjB1BCSmLl3HSIGmGJP9e62CBqnjJKnGn/yAqSYBNwlOhfeoIVJCEiMJ9J4tTs
        DjCHWWAfo8T+o4vBVggLJEicWvmZEWQqi4CqxPwT2SBhXgFriZ6jjawQG+Ql2pdvZwOxOQVs
        JLa97mYEsYWAav5MXs0KUS8ocXLmExaQMcwC6hLr5wmBhPkFtCTWNF1nAbGZgcY0b53NPIFR
        aBaSjlkIHbOQVC1gZF7FKJJaWpybnltsqFecmFtcmpeul5yfu4kRGH/bjv3cvIPx0sbgQ4wC
        HIxKPLwOqQvihVgTy4orcw8xSnAwK4nwOp09HSfEm5JYWZValB9fVJqTWnyI0RToy4nMUqLJ
        +cDUkFcSb2hqaG5haWhubG5sZqEkztshcDBGSCA9sSQ1OzW1ILUIpo+Jg1OqgTHq+27WV/PY
        /Y8rCscrpuil1S5YoVayQHZp0ruGaUIym1fIxT/bME8tLNIv3HT/zP9TRW+XndY2+mv8N/Sa
        4sn4dzqK2wQnLhOOrf4qsWXfxyOMgbHxWyraLr3etXTiohctd79Hv79Ut35l6ieWh7XV36zm
        3nET2Gt9p0xku/y1li33zXZvPl+uxFKckWioxVxUnAgA8ZvU6tUCAAA=
X-CMS-MailID: 20201103184418eucas1p221bebfee92d2753b11a158b765d77cc6
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20201103184418eucas1p221bebfee92d2753b11a158b765d77cc6
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20201103184418eucas1p221bebfee92d2753b11a158b765d77cc6
References: <20201103184412.18874-1-l.stelmach@samsung.com>
        <CGME20201103184418eucas1p221bebfee92d2753b11a158b765d77cc6@eucas1p2.samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Add Ethernet interface description for Odroid XU3 Lite.

Add an alias to enable bootloaders to find the Ethernet
interface and assign a MAC address.

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

