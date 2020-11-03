Return-Path: <SRS0=6Xyg=EJ=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 842FEC2D0A3
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  3 Nov 2020 14:05:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0E51E22264
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  3 Nov 2020 14:05:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="P1oSSwQ4"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729391AbgKCODH (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 3 Nov 2020 09:03:07 -0500
Received: from mailout2.w1.samsung.com ([210.118.77.12]:58573 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729375AbgKCOCj (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 3 Nov 2020 09:02:39 -0500
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20201103140227euoutp025f30d9e7dcafffa7759744b1a8b2285a~EBFkQG1zh2844228442euoutp02b
        for <linux-samsung-soc@vger.kernel.org>; Tue,  3 Nov 2020 14:02:27 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20201103140227euoutp025f30d9e7dcafffa7759744b1a8b2285a~EBFkQG1zh2844228442euoutp02b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1604412147;
        bh=tJfgu1SkaVfjsc886pjn1u73kdx29LwbGBpYZWEiaws=;
        h=From:To:Cc:Subject:Date:References:From;
        b=P1oSSwQ43sOK7ho0pw9yL6HDenY3OgUcm+RF8Hy3V+n8w7D5QO2egJdBvVo8XBnQ7
         LlwuAroRS8I+ddSQexvoBsO+bGEobvWy3uK8vwI2IrGoV0JAdFLVI7ZxfnVJChdr8s
         lmxL+z0mdYue2HW6l0ecDnNrsYfg6sG7EFtLJgY4=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20201103140222eucas1p20f873e6a3fd8c02bd8f3b54c1be04c8d~EBFfW99Hz0816408164eucas1p2P;
        Tue,  3 Nov 2020 14:02:22 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges2new.samsung.com (EUCPMTA) with SMTP id 78.EC.05997.EE261AF5; Tue,  3
        Nov 2020 14:02:22 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20201103140221eucas1p1c4479a8a89e7e9a05c7582462d79e5c7~EBFeow0qP3147931479eucas1p14;
        Tue,  3 Nov 2020 14:02:21 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20201103140221eusmtrp27fda68fe12ab16ca40f956678baf4655~EBFeoPmJE2587725877eusmtrp2g;
        Tue,  3 Nov 2020 14:02:21 +0000 (GMT)
X-AuditID: cbfec7f4-677ff7000000176d-aa-5fa162ee5d72
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id 1B.6E.06314.DE261AF5; Tue,  3
        Nov 2020 14:02:21 +0000 (GMT)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20201103140221eusmtip11eaf3924f4e782b03034b62498c53143~EBFeT8mwY0957909579eusmtip17;
        Tue,  3 Nov 2020 14:02:21 +0000 (GMT)
From:   Marek Szyprowski <m.szyprowski@samsung.com>
To:     linux-samsung-soc@vger.kernel.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: [PATCH] ARM: dts: exynos: Enable DWC2 dual-role support on
 OdroidU3+ boards
Date:   Tue,  3 Nov 2020 15:02:14 +0100
Message-Id: <20201103140214.21690-1-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrBIsWRmVeSWpSXmKPExsWy7djP87rvkhbGG1xaImOxccZ6Vovz5zew
        W8w4v4/JYu2Ru+wOLB6bVnWyefRtWcXo8XmTXABzFJdNSmpOZllqkb5dAlfGglPfmAtOC1U8
        2P6euYFxN38XIyeHhICJxNzeCexdjFwcQgIrGCUOb2hjhXC+MErs/7GfBcL5zChxcOsjdpiW
        3p+zmCESyxklZtzZyATX8uZXBwtIFZuAoUTX2y42EFtEQFXic9sCsCXMAn2MEtf3zmUGSQgL
        hElsXDCDEcRmASo6e246E4jNK2ArcfTLPhaIdfISqzccAFsnIbCBTeLglu9QCReJXU9hbGGJ
        V8e3QN0nI/F/53wmiIZmRomH59ayQzg9jBKXmyDWSQhYS9w59wvoPg6gmzQl1u/Shwg7Spxf
        dQIsLCHAJ3HjrSBImBnInLRtOjNEmFeio00IolpNYtbxdXBrD164xAxhe0g873gFdpqQQKzE
        tzONbBMY5WYh7FrAyLiKUTy1tDg3PbXYKC+1XK84Mbe4NC9dLzk/dxMjML5P/zv+ZQfjrj9J
        hxgFOBiVeHgdUhfEC7EmlhVX5h5ilOBgVhLhdTp7Ok6INyWxsiq1KD++qDQntfgQozQHi5I4
        r/Gil7FCAumJJanZqakFqUUwWSYOTqkGRrHiQv3oJx6vOkrD5/+803RXy1xnhvi2yoh1Rz+n
        71T1nS185V3a3Un7fuXvEd11IaDcdZP7c69py5aWzmvxvZ3Qkvn+6u0Jfkr1vt3bKvM6tHX5
        LB5oLJVdteiPu2TFhv70QoWLnVeeFrPn7j8QW9ykpBR1YqXJ21naRRfnblry48nRtR6PNyux
        FGckGmoxFxUnAgCQB8hb6wIAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrNLMWRmVeSWpSXmKPExsVy+t/xu7pvkxbGG9zcqmWxccZ6Vovz5zew
        W8w4v4/JYu2Ru+wOLB6bVnWyefRtWcXo8XmTXABzlJ5NUX5pSapCRn5xia1StKGFkZ6hpYWe
        kYmlnqGxeayVkamSvp1NSmpOZllqkb5dgl7GglPfmAtOC1U82P6euYFxN38XIyeHhICJRO/P
        WcwgtpDAUkaJLY2iEHEZiZPTGlghbGGJP9e62LoYuYBqPjFK3L89nQkkwSZgKNH1FiTBySEi
        oCrxuW0BO0gRs8AERonznTOAEhwcwgIhEpe3CYLUsADVnD0H0csrYCtx9Ms+FogF8hKrNxxg
        nsDIs4CRYRWjSGppcW56brGhXnFibnFpXrpecn7uJkZgQG079nPzDsZLG4MPMQpwMCrx8Dqk
        LogXYk0sK67MPcQowcGsJMLrdPZ0nBBvSmJlVWpRfnxRaU5q8SFGU6DlE5mlRJPzgcGeVxJv
        aGpobmFpaG5sbmxmoSTO2yFwMEZIID2xJDU7NbUgtQimj4mDU6qBsSNt+rSH95VmChxSPCx7
        5IOMpfmPi50Ci/Q3beBhuvTh1R4hJpMZ1kXTKnnmcLKc+zVx2nUDycVtsnP/PFmZt/2Gb7Kf
        47JeS69G986Y6y1GkwxV9rV+2aLPkRfUEjK79NjMYscs86fOhb+ThF4u7U7avzKu2GtFsXPc
        1+mtLKlzzVPj2zb7K7EUZyQaajEXFScCAPvJngI+AgAA
X-CMS-MailID: 20201103140221eucas1p1c4479a8a89e7e9a05c7582462d79e5c7
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20201103140221eucas1p1c4479a8a89e7e9a05c7582462d79e5c7
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20201103140221eucas1p1c4479a8a89e7e9a05c7582462d79e5c7
References: <CGME20201103140221eucas1p1c4479a8a89e7e9a05c7582462d79e5c7@eucas1p1.samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

MicroUSB port on OdroidU3+ boards can operate both as peripheral or as
host port. Till now it was configured as pheriperal only port, but it
turned out that the DWC2 driver code already handles everything needed to
support USB role-switch, so switch it to dual-role (OTG) mode. This has
no effect on OdroidU3 (with 'plus') and OdroidX2, which doesn't have USB
needed ID pin and VBUS wiring. Those will still operate correctly in
pheriperal mode only.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 arch/arm/boot/dts/exynos4412-odroid-common.dtsi |  1 -
 arch/arm/boot/dts/exynos4412-odroidu3.dts       | 14 ++++++++++++++
 arch/arm/boot/dts/exynos4412-odroidx.dts        |  4 ++++
 3 files changed, 18 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/exynos4412-odroid-common.dtsi b/arch/arm/boot/dts/exynos4412-odroid-common.dtsi
index 2a6f5b1d7645..2b20d9095d9f 100644
--- a/arch/arm/boot/dts/exynos4412-odroid-common.dtsi
+++ b/arch/arm/boot/dts/exynos4412-odroid-common.dtsi
@@ -255,7 +255,6 @@
 };
 
 &hsotg {
-	dr_mode = "peripheral";
 	status = "okay";
 	vusb_d-supply = <&ldo15_reg>;
 	vusb_a-supply = <&ldo12_reg>;
diff --git a/arch/arm/boot/dts/exynos4412-odroidu3.dts b/arch/arm/boot/dts/exynos4412-odroidu3.dts
index b8549d846f86..746c2a99a83c 100644
--- a/arch/arm/boot/dts/exynos4412-odroidu3.dts
+++ b/arch/arm/boot/dts/exynos4412-odroidu3.dts
@@ -21,6 +21,15 @@
 		reg = <0x40000000 0x7FF00000>;
 	};
 
+	vbus_otg_reg: voltage-regulator-1 {
+		compatible = "regulator-fixed";
+		regulator-name = "VBUS_VDD_5.0V";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		gpio = <&gpl2 0 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
 	leds {
 		compatible = "gpio-leds";
 		led1 {
@@ -105,6 +114,11 @@
 	phy-names = "hsic0", "hsic1";
 };
 
+&hsotg {
+	dr_mode = "otg";
+	vbus-supply = <&vbus_otg_reg>;
+};
+
 &sound {
 	model = "Odroid-U3";
 	samsung,audio-widgets =
diff --git a/arch/arm/boot/dts/exynos4412-odroidx.dts b/arch/arm/boot/dts/exynos4412-odroidx.dts
index 46381e9097f4..d6ee62bf336c 100644
--- a/arch/arm/boot/dts/exynos4412-odroidx.dts
+++ b/arch/arm/boot/dts/exynos4412-odroidx.dts
@@ -76,6 +76,10 @@
 	};
 };
 
+&hsotg {
+	dr_mode = "peripheral";
+};
+
 &mshc_0 {
 	vqmmc-supply = <&buck8_reg>;
 };
-- 
2.17.1

