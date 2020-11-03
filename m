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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56244C388F7
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  3 Nov 2020 18:45:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 05F5522226
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  3 Nov 2020 18:45:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="fNpqzEsM"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729465AbgKCSox (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 3 Nov 2020 13:44:53 -0500
Received: from mailout1.w1.samsung.com ([210.118.77.11]:45388 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729458AbgKCSov (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 3 Nov 2020 13:44:51 -0500
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20201103184433euoutp01a23e80f094315578e8a3491a1879c8fa~EE73O_LbE1326313263euoutp01_
        for <linux-samsung-soc@vger.kernel.org>; Tue,  3 Nov 2020 18:44:33 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20201103184433euoutp01a23e80f094315578e8a3491a1879c8fa~EE73O_LbE1326313263euoutp01_
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1604429073;
        bh=RSkEIzrtJiw3sP1zG4MRVGuJkbWdz5Cm5l24dOAb+O4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=fNpqzEsMkhxGG9Y3ykUXVD5j9zkS0h4JtAWO4qp4hCKP7AtSzXJKUPRiyj8cWRb0G
         ax8OmbI7JEO4nHPFq9vgzsO7Hx8EQyB3uYNM3rRqxlscsY5fshezZ9zoAXi+go4QU0
         wgkldN/Sr+fdE8FoZTgt0/PHqlr2s5ddykamqjco=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20201103184418eucas1p12a8ebdc9be66dfd9ce3c43cc35ba60a1~EE7pnrlmg1968219682eucas1p1V;
        Tue,  3 Nov 2020 18:44:18 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges1new.samsung.com (EUCPMTA) with SMTP id 78.13.06456.205A1AF5; Tue,  3
        Nov 2020 18:44:18 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20201103184418eucas1p242bfce393134713bc1d21d0776b2f9ca~EE7pS8WGd2525425254eucas1p2P;
        Tue,  3 Nov 2020 18:44:18 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20201103184418eusmtrp16babefe9478985cdd2a685d7c59a7b02~EE7pSUl740548305483eusmtrp1d;
        Tue,  3 Nov 2020 18:44:18 +0000 (GMT)
X-AuditID: cbfec7f2-809ff70000001938-bd-5fa1a50289d5
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id 71.84.06017.205A1AF5; Tue,  3
        Nov 2020 18:44:18 +0000 (GMT)
Received: from localhost (unknown [106.120.51.46]) by eusmtip2.samsung.com
        (KnoxPortal) with ESMTPA id
        20201103184417eusmtip2126c21d60dc8dc59b0600145b26f3218~EE7pEgbiS2597425974eusmtip2W;
        Tue,  3 Nov 2020 18:44:17 +0000 (GMT)
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
Subject: [PATCH v2 2/6] ARM: dts: exynos: Add an alias for the Ethernet
 interface on Odroid XU3
Date:   Tue,  3 Nov 2020 19:44:08 +0100
Message-Id: <20201103184412.18874-3-l.stelmach@samsung.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201103184412.18874-1-l.stelmach@samsung.com>
MIME-Version: 1.0
Organization: Samsung R&D Institute Poland
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrAKsWRmVeSWpSXmKPExsWy7djPc7pMSxfGGxz4I2uxccZ6Vov5R86x
        WvQ/fs1scf78BnaLm4dWMFpsenyN1eLyrjlsFjPO72OyWLfxFrvF2iN32S1a9x5hd+D22Dnr
        LrvHplWdbB6bl9R79G1ZxejxeZNcAGsUl01Kak5mWWqRvl0CV0br7/SCc6wVe2dvYG9gvMPS
        xcjBISFgIvHiu3IXIxeHkMAKRokTDe+YIZwvjBKtJ08wQTifGSVWPp/P2sXICdbR0nOBFSKx
        nFHi4o5lUM5zRolNu6exg1SxCThK9C89AZYQEZjOJLF0z3ywwcwC+xgldt6bwgxSJSyQKNF/
        YysbiM0ioCpxd8J8RhCbV8Ba4vqkL8wQ++Ql2pdvB6vhFLCR2Pa6G6pGUOLkzCcsIDa/gJbE
        mqbrYDYzUH3z1tlgyyQEzrFLvHxyG2qQi0THouNsELawxKvjW9ghbBmJ05N7oMFRLzF5khlE
        bw+jxLY5P1ggaqwl7pz7xQZSwyygKbF+lz5EuaPEloMlECafxI23ghAX8ElM2jadGSLMK9HR
        JgQxQ0ViXf8eqHlSEr2vVjBOYFSaheSXWUjun4WwagEj8ypG8dTS4tz01GLDvNRyveLE3OLS
        vHS95PzcTYzAdHT63/FPOxi/Xko6xCjAwajEw+uQuiBeiDWxrLgy9xCjBAezkgiv09nTcUK8
        KYmVValF+fFFpTmpxYcYpTlYlMR5jRe9jBUSSE8sSc1OTS1ILYLJMnFwSjUw5huUNx6Obils
        Mt52e7G3hm7g3X9nqoyzMjV1X73rfGnVorl4fdXN55sFH/ItuCwmYnHsDcfTufP8LzGIJC78
        osBrfrmp94lTAIvjjZsHK3KWOpnmCczbtLolcJbLvZJzEx7yzf3Rk7ffY3Xj9lmMkQ8l/p35
        YbfgyIyw5eJvBLwunTUwcLxbq8RSnJFoqMVcVJwIAAKuKgFDAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrIIsWRmVeSWpSXmKPExsVy+t/xe7pMSxfGG3w9wmaxccZ6Vov5R86x
        WvQ/fs1scf78BnaLm4dWMFpsenyN1eLyrjlsFjPO72OyWLfxFrvF2iN32S1a9x5hd+D22Dnr
        LrvHplWdbB6bl9R79G1ZxejxeZNcAGuUnk1RfmlJqkJGfnGJrVK0oYWRnqGlhZ6RiaWeobF5
        rJWRqZK+nU1Kak5mWWqRvl2CXkbr7/SCc6wVe2dvYG9gvMPSxcjJISFgItHSc4G1i5GLQ0hg
        KaPEr+MnmLsYOYASUhIr56ZD1AhL/LnWxQZiCwk8ZZT4McUSxGYTcJToX3oCrFdEYD6TxKnZ
        HWAOs8A+Ron9Rxezg1QJC8RLXP6+FMxmEVCVuDthPiOIzStgLXF90hdmiA3yEu3Lt4Nt4BSw
        kdj2upsRYpu1xJ/Jq1kh6gUlTs58wgJyHLOAusT6eUIgYX4BLYk1TdfBnmEGGtO8dTbzBEah
        WUg6ZiF0zEJStYCReRWjSGppcW56brGRXnFibnFpXrpecn7uJkZg9G079nPLDsaud8GHGAU4
        GJV4eB1SF8QLsSaWFVfmHmKU4GBWEuF1Ons6Tog3JbGyKrUoP76oNCe1+BCjKdCbE5mlRJPz
        gYkhryTe0NTQ3MLS0NzY3NjMQkmct0PgYIyQQHpiSWp2ampBahFMHxMHp1QDY2mS5dkzEdcU
        cg/phKjzWfl0P1Vete6eXpV0Yo6z3z+PTXWd2/VqlplIBlg0dHutttTn5Hp07US7s494UNGf
        7twLuwt+Lgidd7o/UqVpY8nDXSwHbfbwuity9jw/P+/gvbMP5cr/v+Da+eXq5n1PPlcWqm1N
        lH64PrF95ovF731WrLbqnLpivRJLcUaioRZzUXEiAM7hie7UAgAA
X-CMS-MailID: 20201103184418eucas1p242bfce393134713bc1d21d0776b2f9ca
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20201103184418eucas1p242bfce393134713bc1d21d0776b2f9ca
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20201103184418eucas1p242bfce393134713bc1d21d0776b2f9ca
References: <20201103184412.18874-1-l.stelmach@samsung.com>
        <CGME20201103184418eucas1p242bfce393134713bc1d21d0776b2f9ca@eucas1p2.samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Add an alias to enable bootloaders to find the Ethernet
interface and assign a MAC address.

Signed-off-by: Łukasz Stelmach <l.stelmach@samsung.com>
---
 arch/arm/boot/dts/exynos5422-odroidxu3.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5422-odroidxu3.dts b/arch/arm/boot/dts/exynos5422-odroidxu3.dts
index 0fa8bea781ff..2a4153484664 100644
--- a/arch/arm/boot/dts/exynos5422-odroidxu3.dts
+++ b/arch/arm/boot/dts/exynos5422-odroidxu3.dts
@@ -15,6 +15,10 @@
 / {
 	model = "Hardkernel Odroid XU3";
 	compatible = "hardkernel,odroid-xu3", "samsung,exynos5800", "samsung,exynos5";
+
+	aliases {
+		ethernet = &ethernet;
+	};
 };
 
 &i2c_0 {
-- 
2.26.2

