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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30C85C388F7
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  3 Nov 2020 12:47:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CDBA320735
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  3 Nov 2020 12:47:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="qrQAgTaN"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729089AbgKCMqu (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 3 Nov 2020 07:46:50 -0500
Received: from mailout1.w1.samsung.com ([210.118.77.11]:33634 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729092AbgKCMqq (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 3 Nov 2020 07:46:46 -0500
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20201103124630euoutp0136b4a8171581f5ccd2f921aa575256a3~EADPynET63052230522euoutp01f
        for <linux-samsung-soc@vger.kernel.org>; Tue,  3 Nov 2020 12:46:30 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20201103124630euoutp0136b4a8171581f5ccd2f921aa575256a3~EADPynET63052230522euoutp01f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1604407590;
        bh=idcewCpwuD4zhibmPin4TYiOxgaJuD+hxBhjlhsTzS4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=qrQAgTaNHTDtUJ9wDihcvqxMz7hqdbmiYVajpS94Bsa6lNWp6oe4WORpS44mpqC3i
         2yKfN/ku/R7p/RhZ2hwTYuQTs7xhgQQ4SCXBvmVp5+NOYXSTScK3AynV5kZsIrxL4X
         xQoRnDb0lpLqoocn/ysT6SA7w6OZHXyJ8GB5hYHs=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20201103124621eucas1p1c8bfb55e781291e31b913cc3773c7dc9~EADHSLM250360903609eucas1p1a;
        Tue,  3 Nov 2020 12:46:21 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges2new.samsung.com (EUCPMTA) with SMTP id 28.4E.05997.D1151AF5; Tue,  3
        Nov 2020 12:46:21 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20201103124620eucas1p14e76afe9fd53184f1a689b5a654e7e1e~EADGx7Uov0134101341eucas1p1m;
        Tue,  3 Nov 2020 12:46:20 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20201103124620eusmtrp208268653ed34140e20e8aeaff677a0a1~EADGxYMH71121611216eusmtrp2V;
        Tue,  3 Nov 2020 12:46:20 +0000 (GMT)
X-AuditID: cbfec7f4-677ff7000000176d-1f-5fa1511d9409
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id 76.C4.06314.C1151AF5; Tue,  3
        Nov 2020 12:46:20 +0000 (GMT)
Received: from localhost (unknown [106.120.51.46]) by eusmtip2.samsung.com
        (KnoxPortal) with ESMTPA id
        20201103124620eusmtip217101b12380ca8efb2305bcd26a1057f~EADGnKdcG1136311363eusmtip2i;
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
Subject: [PATCH 1/5] ARM: dts: exynos: Fix ethernet description for Odroid
 XU3
Date:   Tue,  3 Nov 2020 13:46:14 +0100
Message-Id: <20201103124618.21358-2-l.stelmach@samsung.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201103124618.21358-1-l.stelmach@samsung.com>
MIME-Version: 1.0
Organization: Samsung R&D Institute Poland
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA01SfSyUcRzf75577nnudHo8bL6jsp3UsiKx9hR5af1xq1X6r7Fw8QzF0T0o
        /qGMJDmRl7COW+Yyr5d3okmpebk2lRhZWErUjC3vcvdo+e/z/bx8X7YvidE1uA0ZroxhVUpF
        hEwkETa+WTYc2XupNPDobArB1BXU4IymewBn1JM/McZgqCWY4S4dYvSTn3BmsLVYxBQYOgRM
        dd0IwVR1jxFMyotuwttM3lI4Rsj1FfdE8udPE+WZ9RVIvqDf54v7STxC2IjwOFbl7BkkCfsw
        Mi6KHiJvPcm2T0LronQkJoFyg2+1Y8J0JCFpSodgc60OMwo0tYggc9acFxYQPFvRoXREmhI5
        8wzPlyPI6NQSfDGNIG/5vSktonxAXfYWNwpWVL4Ayto1mLHAqA4ELV8emVyWlC9o1nW4sa2Q
        coC+NS8jLaXcYWxJjfj97OBueZNpVzHlAd/nVgW8xwLePZ4SGvFuyhEq7wyZMLblT24oMs0C
        aoCA6byG7UZnIDtfL+SxJcz01BM83gObLRoBf1oi5GQf57MZCBqLl7b97jA6sCIyejDqENS0
        OvO0DxS01xJ81Bw+z1nwK5hDdmM+xtNSSEulefd+qFa3bze0gQczOpSFZIU7jinccUDh/1kl
        CKtA1mwsFxnKcseU7E0nThHJxSpDnYKjIvVo6416N3oWm1Hr2tUuRJFItkvqzZYE0rgijouP
        7EJAYjIr6en+3gBaGqKIT2BVUYGq2AiW60K2pFBmLXXV/rhCU6GKGPY6y0azqn+qgBTbJCHb
        NkNQvufJmI/Di7clzVKF/TyX6uaXuBCTaXd/0sd8sO9Cj9cBy4JOPx2RFoAXTaScu7Ykzvnl
        2hZ9OCFl/OJKvPpU7ir9uir5N72hdsideqgtt3YJaC51erl6Q9xHf/3Tf7nR6+yJHs5/NET2
        aq6+UtJ0cGLDX5t2PstnPtMsWCbkwhQujpiKU/wFD9HGQEIDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrPIsWRmVeSWpSXmKPExsVy+t/xe7oygQvjDb7tUrPYOGM9q8X8I+dY
        Lfofv2a2OH9+A7vFzUMrGC02Pb7GanF51xw2ixnn9zFZrNt4i91i7ZG77Bate4+wO3B77Jx1
        l91j06pONo/NS+o9+rasYvT4vEkugDVKz6Yov7QkVSEjv7jEVina0MJIz9DSQs/IxFLP0Ng8
        1srIVEnfziYlNSezLLVI3y5BL+PKrftsBdc5KuZNUm5g/MvWxcjBISFgIjH5o0UXIxeHkMBS
        RomFE38yQcSlJFbOTe9i5AQyhSX+XOtig6h5yiixc/tRJpAEm4CjRP/SE6wgCRGB+UwSp2Z3
        gDnMAvsYJfYfXcwOUiUs4Cdxq3kuI8hUFgFViTN/7EHCvALWEnd/9DNCbJCXaF++nQ3E5hSw
        kXjx9jfYEUJANff+K0CUC0qcnPmEBSTMLKAusX6eEEiYX0BLYk3TdRYQmxloSvPW2cwTGIVm
        IemYhdAxC0nVAkbmVYwiqaXFuem5xYZ6xYm5xaV56XrJ+bmbGIGRt+3Yz807GC9tDD7EKMDB
        qMTD65C6IF6INbGsuDL3EKMEB7OSCK/T2dNxQrwpiZVVqUX58UWlOanFhxhNgZ6cyCwlmpwP
        TAp5JfGGpobmFpaG5sbmxmYWSuK8HQIHY4QE0hNLUrNTUwtSi2D6mDg4pRoYlWdtW7943b/K
        MH2d/e+XLo3f9GS9y8Hj71/xy+Zc+JPqJKxwcvftjRu377hq4Rer4LzvbXVJ36Uv1ryGmfmH
        bQRTDuka/TkX4WiZzuZzd9fC675/c4seZ9i0Wz8XiNVbt+AWXwuzbXCttnvlC5HbE+2z89xv
        s4mWTDG+fVrbfEpfa2Sihke0EktxRqKhFnNRcSIACSProdICAAA=
X-CMS-MailID: 20201103124620eucas1p14e76afe9fd53184f1a689b5a654e7e1e
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20201103124620eucas1p14e76afe9fd53184f1a689b5a654e7e1e
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20201103124620eucas1p14e76afe9fd53184f1a689b5a654e7e1e
References: <20201103124618.21358-1-l.stelmach@samsung.com>
        <CGME20201103124620eucas1p14e76afe9fd53184f1a689b5a654e7e1e@eucas1p1.samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Create ethernet alias and assign appropriate compatible properties.

Signed-off-by: Łukasz Stelmach <l.stelmach@samsung.com>
---
 arch/arm/boot/dts/exynos5422-odroidxu3.dts | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/exynos5422-odroidxu3.dts b/arch/arm/boot/dts/exynos5422-odroidxu3.dts
index d0f6ac5fa79d..2a4153484664 100644
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
@@ -76,13 +80,13 @@ &usbhost2 {
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

