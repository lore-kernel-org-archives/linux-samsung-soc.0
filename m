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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22907C55178
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  3 Nov 2020 18:45:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B9CA422226
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  3 Nov 2020 18:45:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="BSAkQwqW"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729428AbgKCSot (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 3 Nov 2020 13:44:49 -0500
Received: from mailout1.w1.samsung.com ([210.118.77.11]:45371 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729429AbgKCSoq (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 3 Nov 2020 13:44:46 -0500
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20201103184428euoutp0142a358d2a7069a921f3c0f8da1f97d0e~EE7y1Q9eD1326313263euoutp018
        for <linux-samsung-soc@vger.kernel.org>; Tue,  3 Nov 2020 18:44:28 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20201103184428euoutp0142a358d2a7069a921f3c0f8da1f97d0e~EE7y1Q9eD1326313263euoutp018
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1604429068;
        bh=terzoYDOErK+rP1nw6I708y2Kao7c4Emc97iPIks/bg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=BSAkQwqWngs1+SU5SL3sSUC09uqsEBuvKFXRCqYb0NHtHuWY/vXtl9ngWlYbdToMK
         Xu4KXBVmDdNX/enEI+h+wQ56Il+TQM3CrbxWbx6nB+kJs4RWc+NTGaIqvSoIhpyDBN
         998if9WWfLaVwNa07l5Sl4RzRw2jwDFltdUnua8w=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20201103184419eucas1p168d90f1899e5604af38a4c92c9a8fcb9~EE7qeQzzx1968219682eucas1p1X;
        Tue,  3 Nov 2020 18:44:19 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges2new.samsung.com (EUCPMTA) with SMTP id 80.D2.05997.305A1AF5; Tue,  3
        Nov 2020 18:44:19 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20201103184419eucas1p148b9a8b6bb513191c6d341e47969f6bd~EE7qOlnmt1968619686eucas1p1g;
        Tue,  3 Nov 2020 18:44:19 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20201103184419eusmtrp176a6ad1c32d2948b681f663a8b52e6ab~EE7qOABr-0237602376eusmtrp1j;
        Tue,  3 Nov 2020 18:44:19 +0000 (GMT)
X-AuditID: cbfec7f4-65dff7000000176d-1f-5fa1a503b61c
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id F2.84.06017.305A1AF5; Tue,  3
        Nov 2020 18:44:19 +0000 (GMT)
Received: from localhost (unknown [106.120.51.46]) by eusmtip2.samsung.com
        (KnoxPortal) with ESMTPA id
        20201103184419eusmtip2d7fe508752d78e4a0957e156979ca704~EE7qB8-Cr1233912339eusmtip2R;
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
Subject: [PATCH v2 5/6] ARM: dts: exynos: Add Ethernet interface description
 for Odroid U3
Date:   Tue,  3 Nov 2020 19:44:11 +0100
Message-Id: <20201103184412.18874-6-l.stelmach@samsung.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201103184412.18874-1-l.stelmach@samsung.com>
MIME-Version: 1.0
Organization: Samsung R&D Institute Poland
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA02Se0hTcRTH++3u7t7Nptcp7GCSNuwPDbUXdUnJB0EjJCTBP8rS5a4PclM2
        NS1IKyxTa84Hzvk2xSnmcpql6JS5tBIdKphmCmUhqUWkkEVEbtfK/87j8z3fc+CQmKgT9yCT
        lemMSilLkfAE3J6RHzZ/rLkh9qBB50l36ow4XWedwGnN0ipG22yPCXrOYkC0aWkGp6f7qnm0
        zmbm0B2dbwj6kXWBoPMGrESok7RXv0BITW33eNKuphzpg+42JF037Y3EzwuC5UxKciajCjwZ
        J0gya81E2it+VtvGd04uWiIKEJ8E6ijMfKvFCpCAFFEGBJMP13A22UCgzW/lssk6gi5d+z+J
        1Ty43WhBsGrs2NYvI1j4uuageFQYaJpfOGa5UxUcaO6vc1AYZUbQu1i2lZCkGxUDQ0WZdgGX
        2g+N7w08eyykgqBv1r6I3c4L7rY8ddT5VDD0rBYilnGFl5UfuPbYhfKD9luvHTG2xd9+UuXw
        AmqKgJapVcLuBdQpaC8/x850g5XR7u1zPGGstIjLIjlQWnKMlRYh6Kne5LJMELyd+MmzMxjl
        C8a+QLYcBmu1mzgrdYbZz67sBs5Q0lOBsWUh5N8RsbQPdGj6twd6wP0VAypGEv2OW/Q79tf/
        96pHWBsSMxlqRSKjPqxkrgaoZQp1hjIxID5VYUJbjzT2e3TjGer7ddmCKBJJdgtDmfpYES7L
        VGcrLAhITOIuDB8fuyQSymXZ1xhVaqwqI4VRW9AekisRC480frooohJl6cwVhkljVH+7HJLv
        kYtCNgoW+cXxNYMHSk54VZ2WJz4vTBAvRWS5+NniPk672I5bohqifM9El+drycoRb0w+OOSv
        1ygjh/YNx2jPTg4rE24a8kZy31mX/aJbZUXisqyIMGrektI6hwc6XQhk3GcGponqXZ7Xh76E
        OJfNTxhrFpd5TZnh3uZoH4V8/IaEq06SHfLDVGrZH3vvdWJEAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrMIsWRmVeSWpSXmKPExsVy+t/xe7rMSxfGG9xYy2GxccZ6Vov5R86x
        WvQ/fs1scf78BnaLm4dWMFpsenyN1eLyrjlsFjPO72OyWLfxFrvF2iN32S1a9x5hd+D22Dnr
        LrvHplWdbB6bl9R79G1ZxejxeZNcAGuUnk1RfmlJqkJGfnGJrVK0oYWRnqGlhZ6RiaWeobF5
        rJWRqZK+nU1Kak5mWWqRvl2CXsa+ifvYC05xVqz68p2pgfExexcjJ4eEgInEkX37WboYuTiE
        BJYySrxfeoati5EDKCElsXJuOkSNsMSfa11sEDVPGSWm/mtiBkmwCThK9C89wQqSEBGYzyRx
        anYHmMMssI9RYv/RxWArhAWiJK6sv8QGYrMIqEoserQCzOYVsJbYdeMNK8QKeYn25dvB4pwC
        NhLbXnczgthCQDV/Jq9mhagXlDg58wkLyHXMAuoS6+cJgYT5BbQk1jRdZwGxmYHGNG+dzTyB
        UWgWko5ZCB2zkFQtYGRexSiSWlqcm55bbKRXnJhbXJqXrpecn7uJERiB24793LKDsetd8CFG
        AQ5GJR5eh9QF8UKsiWXFlbmHGCU4mJVEeJ3Ono4T4k1JrKxKLcqPLyrNSS0+xGgK9OZEZinR
        5HxgcsgriTc0NTS3sDQ0NzY3NrNQEuftEDgYIySQnliSmp2aWpBaBNPHxMEp1cB4xWz2811Z
        ezlP32vg0H9yfnqgWdEbixlS+7KfNPmIaIa9rc3bMs3uj/apZ1FTy1asUJzkMstJwFQnq8Ws
        +7LS3wcMOat5Au6sjL75y+7SOo8pmjvEnhg+czQR9HnwSoEtL8Tvxd6VzV7pXH//L08tuBM2
        P81VrGgVUwLbuW/RIooznsltuiWtxFKckWioxVxUnAgAOeJfjtYCAAA=
X-CMS-MailID: 20201103184419eucas1p148b9a8b6bb513191c6d341e47969f6bd
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20201103184419eucas1p148b9a8b6bb513191c6d341e47969f6bd
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20201103184419eucas1p148b9a8b6bb513191c6d341e47969f6bd
References: <20201103184412.18874-1-l.stelmach@samsung.com>
        <CGME20201103184419eucas1p148b9a8b6bb513191c6d341e47969f6bd@eucas1p1.samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Add Ethernet interface description for Odroid U3.

Add an alias to enable bootloaders to find the Ethernet
interface and assign a MAC address.

Signed-off-by: Łukasz Stelmach <l.stelmach@samsung.com>
---
 arch/arm/boot/dts/exynos4412-odroidu3.dts | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm/boot/dts/exynos4412-odroidu3.dts b/arch/arm/boot/dts/exynos4412-odroidu3.dts
index b8549d846f86..b503f04db923 100644
--- a/arch/arm/boot/dts/exynos4412-odroidu3.dts
+++ b/arch/arm/boot/dts/exynos4412-odroidu3.dts
@@ -16,6 +16,10 @@ / {
 	model = "Hardkernel ODROID-U3 board based on Exynos4412";
 	compatible = "hardkernel,odroid-u3", "samsung,exynos4412", "samsung,exynos4";
 
+	aliases {
+		ethernet = &ethernet;
+	};
+
 	memory@40000000 {
 		device_type = "memory";
 		reg = <0x40000000 0x7FF00000>;
@@ -101,8 +105,16 @@ &usb3503 {
 };
 
 &ehci {
+	#address-cells = <1>;
+	#size-cells = <0>;
 	phys = <&exynos_usbphy 2>, <&exynos_usbphy 3>;
 	phy-names = "hsic0", "hsic1";
+
+	ethernet: usbether@2 {
+		compatible = "usb0424,9730";
+		reg = <2>;
+		local-mac-address = [00 00 00 00 00 00]; /* Filled in by a bootloader */
+	};
 };
 
 &sound {
-- 
2.26.2

