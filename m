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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25CDAC388F2
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  3 Nov 2020 18:44:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 53F8A216C4
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  3 Nov 2020 18:44:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="m7Oy3vdx"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725957AbgKCSog (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 3 Nov 2020 13:44:36 -0500
Received: from mailout2.w1.samsung.com ([210.118.77.12]:45290 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725997AbgKCSof (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 3 Nov 2020 13:44:35 -0500
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20201103184423euoutp027f5a390e496912e14b821460bcab8c8c~EE7uDnJ4B2225922259euoutp02V
        for <linux-samsung-soc@vger.kernel.org>; Tue,  3 Nov 2020 18:44:23 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20201103184423euoutp027f5a390e496912e14b821460bcab8c8c~EE7uDnJ4B2225922259euoutp02V
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1604429063;
        bh=CD8PV9+DVNTjwVhXbw0MfsqVXZWcsjj6P9aCEJW6Go8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=m7Oy3vdxk8Sj533lCSfhG8HGjFnrobVU0kErj6aeDEbnS68RS2WffsAem0bAQoK0H
         ODhHSeXR8SVnVWkS+o02IV+C71wRP78+OBfrZzNr7PShWKxqYyruXKxUtScUz/TeZ6
         3PtydzyJULVlDazP/TEwYoakbSCLjPRv1uJomB9M=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20201103184419eucas1p2035a050c9135055c1bdb234f256dc132~EE7qXJg7V0616106161eucas1p2A;
        Tue,  3 Nov 2020 18:44:19 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges1new.samsung.com (EUCPMTA) with SMTP id 49.13.06456.305A1AF5; Tue,  3
        Nov 2020 18:44:19 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20201103184418eucas1p2f99b978bb007670d49741421744696f9~EE7p2s6N72526225262eucas1p2J;
        Tue,  3 Nov 2020 18:44:18 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20201103184418eusmtrp11b8cf6552fa5f4f2ecded6a4e6212a36~EE7p2GTdN0548305483eusmtrp1e;
        Tue,  3 Nov 2020 18:44:18 +0000 (GMT)
X-AuditID: cbfec7f2-809ff70000001938-bf-5fa1a5033783
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id 32.84.06017.205A1AF5; Tue,  3
        Nov 2020 18:44:18 +0000 (GMT)
Received: from localhost (unknown [106.120.51.46]) by eusmtip2.samsung.com
        (KnoxPortal) with ESMTPA id
        20201103184418eusmtip2725d825f266d1c44bdd3ad8c5fef2684~EE7ptpeOi1233912339eusmtip2Q;
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
Subject: [PATCH v2 4/6] ARM: dts: exynos: Add Ethernet interface description
 for Odroid XU
Date:   Tue,  3 Nov 2020 19:44:10 +0100
Message-Id: <20201103184412.18874-5-l.stelmach@samsung.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201103184412.18874-1-l.stelmach@samsung.com>
MIME-Version: 1.0
Organization: Samsung R&D Institute Poland
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA02Se0hTcRTH+Xl3tztrdp2CB4ukVUJCmlRySQuViAUKRRRkj7X0pqJO21VT
        oRTNyud8os7IB75Nzel86x/D8pUzDGyZj9Ai3IgePrJJ0bY7yf++55zP9zzgEJiwHXcmwmWx
        tFwmjRRxbTldr35rj2K1VZJjVQZHqr20DacqhrU4pVg2YNTU1Ase9V7TgCjV8gxOve17yqVK
        p4ZsqNb2WR7VMjzPo9IHh3m+u8S9ynmeWNWUwRV31CSLczubkHhVtf8CHmTrE0JHhsfTco8z
        t2zDCvrqsZhSfsL0zCKegjS8TMQngDwB39babDKRLSEkGxB0FxmtwRqCtbksCyUkVxEMr0i3
        HbrFWZzN1yP4sXSfNXxBsGTYsBi4pB8oakdxc8GRLLGB2oEKzBxg5BCC3oUizEw5kNehuDiX
        Y9Yc8jB8N+YgsxaQ3pBnXOCw41zgcX0316z5pA90GbKsjD2MlX2yMHtIN3ie+s6iMROfpi63
        DANSy4O6+Rou2+gsjGVMWq92AP1Ip1Xvg4nCbJOZMOlkKCzwYr3ZCLqeblqX8IY5rZFrZjDy
        CLT1ebBpP3i43oJYqx3ovtqzK9hBQVcJxqYF8OSRkKUPQatiwNrQGXL0DSgPiZQ7jlHuOED5
        f1YlwpqQEx3HRIXSjKeMvufOSKOYOFmoe3B0lAqZHmni78jPHrQ+fVuDSAKJdgt86UqJEJfG
        M4lRGgQEJnIU+E9O3BQKQqSJSbQ8WiKPi6QZDdpLcEROguPVKzeEZKg0lo6g6Rhavl21IfjO
        KSjw1J/o+g/Kqvz4ogjVudDR5nS+jG70a2775ZKmlpVd1nWoD1xZDsxJbBRfUs/Onk6oqyof
        kTjG6B/cSdlSfJYMntTqgw5+XD0ftFrsJH+jv3otXDDxbGsjoF/SQF/sd/J3DQhu4boYq3u8
        FD4v74rGGdf4cYfy/NebvamDhbokEYcJk3q6YXJG+g//wu/IRAMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrMIsWRmVeSWpSXmKPExsVy+t/xe7pMSxfGG5w+ZWCxccZ6Vov5R86x
        WvQ/fs1scf78BnaLm4dWMFpsenyN1eLyrjlsFjPO72OyWLfxFrvF2iN32S1a9x5hd+D22Dnr
        LrvHplWdbB6bl9R79G1ZxejxeZNcAGuUnk1RfmlJqkJGfnGJrVK0oYWRnqGlhZ6RiaWeobF5
        rJWRqZK+nU1Kak5mWWqRvl2CXsakXcuZC2ZwVly6dp+1gfEQexcjJ4eEgInEjfu3WLsYuTiE
        BJYySkzftpati5EDKCElsXJuOkSNsMSfa11sEDVPGSUmN25iBEmwCThK9C89AdYsIjCfSeLU
        7A4wh1lgH6PE/qOLwVYIC0RJzDt7FsxmEVCV+PCrF6ybV8BaYsKveywQK+Ql2pdvZwOxOQVs
        JLa97garEQKq+TN5NStEvaDEyZlPWECuYxZQl1g/TwgkzC+gJbGm6TrYGGagMc1bZzNPYBSa
        haRjFkLHLCRVCxiZVzGKpJYW56bnFhvpFSfmFpfmpesl5+duYgRG4LZjP7fsYOx6F3yIUYCD
        UYmH1yF1QbwQa2JZcWXuIUYJDmYlEV6ns6fjhHhTEiurUovy44tKc1KLDzGaAr05kVlKNDkf
        mBzySuINTQ3NLSwNzY3Njc0slMR5OwQOxggJpCeWpGanphakFsH0MXFwSjUwln/jfS6waXrJ
        qbp2/T0bfWtPLZn6P+K4727W9503frc4r7Y7Zdz1In/r6haJ1d3WCRr/dshxVnctOvtuF8+f
        g01tu5i/rqj57vKD8+R2+YqTt2ZdX+7+L+Xn+kdTfVZyaassv9bL0i4nUt59QenRI6G7nzS2
        HHjiILEm+GqJmqZWtL5s7YqlkUosxRmJhlrMRcWJAABkIY/WAgAA
X-CMS-MailID: 20201103184418eucas1p2f99b978bb007670d49741421744696f9
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20201103184418eucas1p2f99b978bb007670d49741421744696f9
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20201103184418eucas1p2f99b978bb007670d49741421744696f9
References: <20201103184412.18874-1-l.stelmach@samsung.com>
        <CGME20201103184418eucas1p2f99b978bb007670d49741421744696f9@eucas1p2.samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Add Ethernet interface description for Odroid XU.

Add an alias to enable bootloaders to find the Ethernet
interface and assign a MAC address.

Signed-off-by: Łukasz Stelmach <l.stelmach@samsung.com>
---
 arch/arm/boot/dts/exynos5410-odroidxu.dts | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5410-odroidxu.dts b/arch/arm/boot/dts/exynos5410-odroidxu.dts
index 75b4150c26d7..882d9296fa5d 100644
--- a/arch/arm/boot/dts/exynos5410-odroidxu.dts
+++ b/arch/arm/boot/dts/exynos5410-odroidxu.dts
@@ -19,6 +19,10 @@ / {
 	model = "Hardkernel Odroid XU";
 	compatible = "hardkernel,odroid-xu", "samsung,exynos5410", "samsung,exynos5";
 
+	aliases {
+		ethernet = &ethernet;
+	};
+
 	memory@40000000 {
 		device_type = "memory";
 		reg = <0x40000000 0x7ea00000>;
@@ -653,3 +657,14 @@ &usbdrd3_1 {
 	vdd33-supply = <&ldo12_reg>;
 	vdd10-supply = <&ldo15_reg>;
 };
+
+&usbhost2 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	ethernet: usbether@2 {
+		compatible = "usb0424,9730";
+		reg = <2>;
+		local-mac-address = [00 00 00 00 00 00]; /* Filled in by a bootloader */
+	};
+};
-- 
2.26.2

