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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26ECAC2D0A3
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  3 Nov 2020 18:45:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DAFB2216C4
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  3 Nov 2020 18:44:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="RNTMl7kC"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729470AbgKCSox (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 3 Nov 2020 13:44:53 -0500
Received: from mailout1.w1.samsung.com ([210.118.77.11]:45386 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729453AbgKCSov (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 3 Nov 2020 13:44:51 -0500
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20201103184433euoutp015ba8537e233d05486e57adab396d275b~EE73JgYqH1372213722euoutp015
        for <linux-samsung-soc@vger.kernel.org>; Tue,  3 Nov 2020 18:44:33 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20201103184433euoutp015ba8537e233d05486e57adab396d275b~EE73JgYqH1372213722euoutp015
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1604429073;
        bh=1CRMsr8d3qfWwBOh3um1xjPZi2IDD4zoiGQW+ukRtlw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=RNTMl7kCaS1JdNe7KEG5Fxgs9EMdwUoxpO6udT96FC20RoVKzfgLPh+1MF/WP0V6R
         VtqQkI5GvHTWx5jrNHK8p1jDspDDzmKgrVQNpOI/E9mQpYIpjrcB8Du4eAnTFVBB0+
         Z0yrGr4cxUnmvNBcbWAkYrVRhMGxH70gbCzMx4+Y=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20201103184418eucas1p1fbe85cf2cd1f43b503a1f14792db3343~EE7pcpPM41969619696eucas1p1l;
        Tue,  3 Nov 2020 18:44:18 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges2new.samsung.com (EUCPMTA) with SMTP id CF.C2.05997.205A1AF5; Tue,  3
        Nov 2020 18:44:18 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20201103184417eucas1p2ae35b1c02361c2814d31ddc5fb27794d~EE7o7NFv_2526225262eucas1p2I;
        Tue,  3 Nov 2020 18:44:17 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20201103184417eusmtrp1a7f3a275d414a3cf9e743d9d0ea795ea~EE7o6eFf90237602376eusmtrp1h;
        Tue,  3 Nov 2020 18:44:17 +0000 (GMT)
X-AuditID: cbfec7f4-677ff7000000176d-1e-5fa1a5026814
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id B0.84.06017.105A1AF5; Tue,  3
        Nov 2020 18:44:17 +0000 (GMT)
Received: from localhost (unknown [106.120.51.46]) by eusmtip1.samsung.com
        (KnoxPortal) with ESMTPA id
        20201103184417eusmtip17f4d5606053a873efbb830ba64dff370~EE7owDLIW2794627946eusmtip1n;
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
Subject: [PATCH v2 1/6] ARM: dts: exynos: Fix Ethernet interface description
 for Odroid XU3
Date:   Tue,  3 Nov 2020 19:44:07 +0100
Message-Id: <20201103184412.18874-2-l.stelmach@samsung.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201103184412.18874-1-l.stelmach@samsung.com>
MIME-Version: 1.0
Organization: Samsung R&D Institute Poland
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrEKsWRmVeSWpSXmKPExsWy7djPc7pMSxfGGzTsELTYOGM9q8X8I+dY
        Lfofv2a2OH9+A7vFzUMrGC02Pb7GanF51xw2ixnn9zFZrNt4i91i7ZG77Bate4+wO3B77Jx1
        l91j06pONo/NS+o9+rasYvT4vEkugDWKyyYlNSezLLVI3y6BK+P9pjXsBc/YKk6vnsvYwHiI
        tYuRk0NCwETi7+Lp7F2MXBxCAisYJZqfrmGBcL4AOWfPglUJCXxmlPgyVxam4+OHl6wQRcsZ
        Jda/amOCcJ4zSlz/9oEJpIpNwFGif+kJsCoRgelMEkv3zGcGcZgF9jFK7Lw3hRmkSlggVmLK
        ijdgO1gEVCVe3bsE1s0rYC2x5OQZNoh98hLty7eD2ZwCNhLbXnczQtQISpyc+YQFxOYX0JJY
        03QdzGYGqm/eOhtsmYTAOXaJ+zPWMUIMcpGY2LIU6m1hiVfHt7BD2DISpyf3ADVzANn1EpMn
        mUH09jBKbJvzgwWixlrizrlfbCA1zAKaEut36UOEHSU2bdvJCNHKJ3HjrSDECXwSk7ZNZ4YI
        80p0tAlBVKtIrOvfAzVQSqL31QrGCYxKs5A8MwvJA7MQdi1gZF7FKJ5aWpybnlpslJdarlec
        mFtcmpeul5yfu4kRmJJO/zv+ZQfjrj9JhxgFOBiVeHgdUhfEC7EmlhVX5h5ilOBgVhLhdTp7
        Ok6INyWxsiq1KD++qDQntfgQozQHi5I4r/Gil7FCAumJJanZqakFqUUwWSYOTqkGxqbu0DN7
        TsrwP3Xbyu7EoqLPVjLp1NKYCx2WTcdfLY/fNnH7YeWq9h8Hik9f7k2dY56Y5r3Ru+uyYsry
        qpczZXq/cTf/PlUuxRe/d7a37fw7W89NYjnEVP1PYnVR9YxLPY0Mj+0lvPqVLJ4GyHjfCQ9v
        +1CVc+6hI7/aRdek+e+uuSk737t5TomlOCPRUIu5qDgRAJPyl4tFAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrMIsWRmVeSWpSXmKPExsVy+t/xu7qMSxfGG9y4rmexccZ6Vov5R86x
        WvQ/fs1scf78BnaLm4dWMFpsenyN1eLyrjlsFjPO72OyWLfxFrvF2iN32S1a9x5hd+D22Dnr
        LrvHplWdbB6bl9R79G1ZxejxeZNcAGuUnk1RfmlJqkJGfnGJrVK0oYWRnqGlhZ6RiaWeobF5
        rJWRqZK+nU1Kak5mWWqRvl2CXsb7TWvYC56xVZxePZexgfEQaxcjJ4eEgInExw8vgWwuDiGB
        pYwSx9+9AHI4gBJSEivnpkPUCEv8udbFBlHzlFGi+8QbJpAEm4CjRP/SE2DNIgLzmSROze4A
        c5gF9jFK7D+6mB2kSlggWqLtyBqwDhYBVYlX9y6B2bwC1hJLTp5hg1ghL9G+fDuYzSlgI7Ht
        dTcjiC0EVPNn8mpWiHpBiZMzn7CAXMcsoC6xfp4QSJhfQEtiTdN1FhCbGWhM89bZzBMYhWYh
        6ZiF0DELSdUCRuZVjCKppcW56bnFRnrFibnFpXnpesn5uZsYgRG47djPLTsYu94FH2IU4GBU
        4uF1SF0QL8SaWFZcmXuIUYKDWUmE1+ns6Tgh3pTEyqrUovz4otKc1OJDjKZAb05klhJNzgcm
        h7ySeENTQ3MLS0NzY3NjMwslcd4OgYMxQgLpiSWp2ampBalFMH1MHJxSDYzbLxtMe2zvw5fA
        eKmu4nZnhqvy2h+3lukfq77Hzpanv0NmrlbslZLT02+dEdGI3tgVFRRf0CnV2rY1xHfNsqPn
        KoK2pa/41CRZWvTPpyPW986WwsUOT8UMfjQdO7H8VZT6u4xt4f9ut4u90PRM/zGX41Pde+Xi
        3GC922lhvqw3Lpoo6bPt41FiKc5INNRiLipOBAAMB4EI1gIAAA==
X-CMS-MailID: 20201103184417eucas1p2ae35b1c02361c2814d31ddc5fb27794d
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20201103184417eucas1p2ae35b1c02361c2814d31ddc5fb27794d
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20201103184417eucas1p2ae35b1c02361c2814d31ddc5fb27794d
References: <20201103184412.18874-1-l.stelmach@samsung.com>
        <CGME20201103184417eucas1p2ae35b1c02361c2814d31ddc5fb27794d@eucas1p2.samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Assign appropriate compatible properties.

Signed-off-by: Łukasz Stelmach <l.stelmach@samsung.com>
---
 arch/arm/boot/dts/exynos5422-odroidxu3.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/exynos5422-odroidxu3.dts b/arch/arm/boot/dts/exynos5422-odroidxu3.dts
index d0f6ac5fa79d..0fa8bea781ff 100644
--- a/arch/arm/boot/dts/exynos5422-odroidxu3.dts
+++ b/arch/arm/boot/dts/exynos5422-odroidxu3.dts
@@ -76,13 +76,13 @@ &usbhost2 {
 	#size-cells = <0>;
 
 	hub@1 {
-		compatible = "usb8087,0024";
+		compatible = "usb0424,9514";
 		reg = <1>;
 		#address-cells = <1>;
 		#size-cells = <0>;
 
 		ethernet: usbether@1 {
-			compatible = "usb0c45,6310";
+			compatible = "usb0424,ec00";
 			reg = <1>;
 			local-mac-address = [00 00 00 00 00 00]; /* Filled in by a bootloader */
 		};
-- 
2.26.2

