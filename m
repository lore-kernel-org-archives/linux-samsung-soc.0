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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99CC2C388F2
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  3 Nov 2020 18:45:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 61E5E216C4
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  3 Nov 2020 18:45:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="UHrmmjRs"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729468AbgKCSox (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 3 Nov 2020 13:44:53 -0500
Received: from mailout2.w1.samsung.com ([210.118.77.12]:45327 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729429AbgKCSow (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 3 Nov 2020 13:44:52 -0500
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20201103184428euoutp027307fad3867128d8eb5c97de480c3a56~EE7y57KwO2927729277euoutp02C
        for <linux-samsung-soc@vger.kernel.org>; Tue,  3 Nov 2020 18:44:28 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20201103184428euoutp027307fad3867128d8eb5c97de480c3a56~EE7y57KwO2927729277euoutp02C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1604429068;
        bh=X5n64N6kj5gULS9ipRbmJr/IBJyN3axgfQr6eluL9Lg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=UHrmmjRs26Ad/uawKnaS9tL/5bH34cpcqxp9n6n5R2d44tFxeC4iHe2vs4fByuMqX
         AZH1yYccRkLa3V7y3Rn2wOHOI6vV3AamLQK9voaFirQs9smttmfTHaaLPTimLzrg6n
         4oIatJQigMx1idDb8xGBGwhFvpUrtiCfSxUIEg1Q=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20201103184420eucas1p29feafc6dbad3fdfe38625829902e1eee~EE7rmGpt00616406164eucas1p26;
        Tue,  3 Nov 2020 18:44:20 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges3new.samsung.com (EUCPMTA) with SMTP id AB.0F.06318.405A1AF5; Tue,  3
        Nov 2020 18:44:20 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20201103184419eucas1p1e5f855727fae95d992f8e95c7dbda787~EE7qmGWfZ1968619686eucas1p1h;
        Tue,  3 Nov 2020 18:44:19 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20201103184419eusmtrp1b56fab8163c69e98f6c77ee17d2a0dc1~EE7qleLXT0548305483eusmtrp1f;
        Tue,  3 Nov 2020 18:44:19 +0000 (GMT)
X-AuditID: cbfec7f5-371ff700000018ae-0d-5fa1a504a35e
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id CF.BB.06314.305A1AF5; Tue,  3
        Nov 2020 18:44:19 +0000 (GMT)
Received: from localhost (unknown [106.120.51.46]) by eusmtip1.samsung.com
        (KnoxPortal) with ESMTPA id
        20201103184419eusmtip103f5e6b1ba44483895603efda47fba32~EE7qWi-iT2261422614eusmtip1E;
        Tue,  3 Nov 2020 18:44:19 +0000 (GMT)
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
Subject: [PATCH v2 6/6] ARM: dts: exynos: Add Ethernet interface description
 for Odroid X/X2
Date:   Tue,  3 Nov 2020 19:44:12 +0100
Message-Id: <20201103184412.18874-7-l.stelmach@samsung.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201103184412.18874-1-l.stelmach@samsung.com>
MIME-Version: 1.0
Organization: Samsung R&D Institute Poland
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrAKsWRmVeSWpSXmKPExsWy7djPc7osSxfGG9w+rWaxccZ6Vov5R86x
        WvQ/fs1scf78BnaLm4dWMFpsenyN1eLyrjlsFjPO72OyWLfxFrvF2iN32S1a9x5hd+D22Dnr
        LrvHplWdbB6bl9R79G1ZxejxeZNcAGsUl01Kak5mWWqRvl0CV8bs6c9ZCrZyVzTMXMbewPib
        o4uRk0NCwESi+dEHZhBbSGAFo8Tdez5djFxA9hdGifauZkaIxGdGic3/q2Earq59zg5RtJxR
        4tSeOawQznNGiT23N7KCVLEJOEr0Lz0BlhARmM4ksXTPfGYQh1lgH6PEzntTwBYKC8RJXDv3
        CMxmEVCVOLLxGBOIzStgLbH3y3dWiH3yEu3Lt7OB2JwCNhLbXnczQtQISpyc+YQFxOYX0JJY
        03QdzGYGqm/eOhtsmYTAJXaJZR03gRIcQI6LxKHHDhAzhSVeHd/CDmHLSJye3ANVUi8xeZIZ
        RGsPo8S2OT9YIGqsJe6c+8UGUsMsoCmxfpc+RNhR4mdPIztEK5/EjbeCEBfwSUzaNp0ZIswr
        0dEmBFGtIrGufw/UQCmJ3lcrGCcwKs1C8sssJPfPQti1gJF5FaN4amlxbnpqsXFearlecWJu
        cWleul5yfu4mRmA6Ov3v+NcdjPv+JB1iFOBgVOLhdUhdEC/EmlhWXJl7iFGCg1lJhNfp7Ok4
        Id6UxMqq1KL8+KLSnNTiQ4zSHCxK4rzGi17GCgmkJ5akZqemFqQWwWSZODilGhhPV5+9kL5l
        0a6khapii4+yha1iMruwYwrD/fkMxucuXWlbtnnvvxkRAYHTekRO5b1OOzxJ+fpCy1P/LktH
        hy3g8VGL/Kvh8eVrX4/BnbWdszpW9wdJuCh+fm79PcRlT8HMW98yNWp2PFzN5PH68e+kVUct
        rL4LdRSz62Wz29xdu/+yXvkhT/5vSizFGYmGWsxFxYkAMYO/XUMDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrEIsWRmVeSWpSXmKPExsVy+t/xu7rMSxfGG6y/Lm+xccZ6Vov5R86x
        WvQ/fs1scf78BnaLm4dWMFpsenyN1eLyrjlsFjPO72OyWLfxFrvF2iN32S1a9x5hd+D22Dnr
        LrvHplWdbB6bl9R79G1ZxejxeZNcAGuUnk1RfmlJqkJGfnGJrVK0oYWRnqGlhZ6RiaWeobF5
        rJWRqZK+nU1Kak5mWWqRvl2CXsbs6c9ZCrZyVzTMXMbewPibo4uRk0NCwETi6trn7F2MXBxC
        AksZJY7M7WTuYuQASkhJrJybDlEjLPHnWhcbiC0k8JRR4ux7eRCbTcBRon/pCVaQXhGB+UwS
        p2Z3gDnMAvsYJfYfXcwOUiUsECOxZcMisG4WAVWJIxuPMYHYvALWEnu/fGeF2CAv0b58O1gN
        p4CNxLbX3YwQ26wl/kxezQpRLyhxcuYTFpDjmAXUJdbPEwIJ8wtoSaxpus4CYjMDjWneOpt5
        AqPQLCQdsxA6ZiGpWsDIvIpRJLW0ODc9t9hQrzgxt7g0L10vOT93EyMw/rYd+7l5B+OljcGH
        GAU4GJV4eB1SF8QLsSaWFVfmHmKU4GBWEuF1Ons6Tog3JbGyKrUoP76oNCe1+BCjKdCbE5ml
        RJPzgakhryTe0NTQ3MLS0NzY3NjMQkmct0PgYIyQQHpiSWp2ampBahFMHxMHp1QDY0OwJkdl
        yqxOkXwp7i+HTVTvCvFNjJBcrHLCvP9adjzXxS16V66muTK0fhddxiJ70eb3r4crfQ83nkmc
        0ljyRiqT+V1jqsjmqFv/+E6+i+w+ffnLgi0V1RvX1IssVI1VZbuRcZnz7LTpJ7ZNVUoWXlM3
        cePeNyo9bXl7GS/du26+ImV/zQ2z/0osxRmJhlrMRcWJAKL1QiXVAgAA
X-CMS-MailID: 20201103184419eucas1p1e5f855727fae95d992f8e95c7dbda787
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20201103184419eucas1p1e5f855727fae95d992f8e95c7dbda787
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20201103184419eucas1p1e5f855727fae95d992f8e95c7dbda787
References: <20201103184412.18874-1-l.stelmach@samsung.com>
        <CGME20201103184419eucas1p1e5f855727fae95d992f8e95c7dbda787@eucas1p1.samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Add Ethernet interface description for Odroid X/X2.

Add an alias to enable bootloaders to find the Ethernet
interface and assign a MAC address.

Signed-off-by: Łukasz Stelmach <l.stelmach@samsung.com>
---
 arch/arm/boot/dts/exynos4412-odroidx.dts | 28 ++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm/boot/dts/exynos4412-odroidx.dts b/arch/arm/boot/dts/exynos4412-odroidx.dts
index 3ea2a0101e80..2da220102883 100644
--- a/arch/arm/boot/dts/exynos4412-odroidx.dts
+++ b/arch/arm/boot/dts/exynos4412-odroidx.dts
@@ -15,6 +15,10 @@ / {
 	model = "Hardkernel ODROID-X board based on Exynos4412";
 	compatible = "hardkernel,odroid-x", "samsung,exynos4412", "samsung,exynos4";
 
+	aliases {
+		ethernet = &ethernet;
+	};
+
 	memory@40000000 {
 		device_type = "memory";
 		reg = <0x40000000 0x3FF00000>;
@@ -72,8 +76,32 @@ &buck8_reg {
 };
 
 &ehci {
+	#address-cells = <1>;
+	#size-cells = <0>;
 	phys = <&exynos_usbphy 2>;
 	phy-names = "hsic0";
+
+	hub@2 {
+		compatible = "usb0424,3503";
+		reg = <2>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		hub@1 {
+			compatible = "usb0424,9514";
+			reg = <1>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			ethernet: usbether@1 {
+				compatible = "usb0424,ec00";
+				reg = <1>;
+				local-mac-address = [00 00 00 00 00 00]; /* Filled in by a bootloader */
+			};
+		};
+	};
+
+
 };
 
 &mshc_0 {
-- 
2.26.2

