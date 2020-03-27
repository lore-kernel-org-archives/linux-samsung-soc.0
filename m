Return-Path: <SRS0=2lPF=5M=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5E4FC43331
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 27 Mar 2020 13:00:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 79D6E2082E
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 27 Mar 2020 13:00:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="PazEVDiF"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726742AbgC0NAO (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 27 Mar 2020 09:00:14 -0400
Received: from mailout1.w1.samsung.com ([210.118.77.11]:40004 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727247AbgC0NAO (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 27 Mar 2020 09:00:14 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20200327130012euoutp016b892c9a9b43b6402a2f290c3ecdf191~AKrHjHo2f2484324843euoutp01x
        for <linux-samsung-soc@vger.kernel.org>; Fri, 27 Mar 2020 13:00:12 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20200327130012euoutp016b892c9a9b43b6402a2f290c3ecdf191~AKrHjHo2f2484324843euoutp01x
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1585314012;
        bh=Tp4f9EC9cHcL0ZJMQbVOcXwJ6LX3NpDz4ACJoQ6/Fkw=;
        h=From:To:Cc:Subject:Date:References:From;
        b=PazEVDiFXP8Y/IoCL/Rya4ijuDGDQgIKMO7b+BFyiUhdlqydeWj5gpEBpjSv62wgi
         p46UHEC1zEnYOrikeadau7LS4iosWEHgMq1YTB0k5WRm/IVfctWDoadqBamluQOzL3
         shtUDZIbQG4NJGDnZeAeD00fd+wSjg7Rrjv2NiC0=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20200327130012eucas1p24e0447221dcf6998db8d4b20ac576147~AKrHXAAs60939809398eucas1p2O;
        Fri, 27 Mar 2020 13:00:12 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges1new.samsung.com (EUCPMTA) with SMTP id 61.6F.61286.CD8FD7E5; Fri, 27
        Mar 2020 13:00:12 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20200327130011eucas1p1c82b341aff9583d8e9c11fad9d8a64f4~AKrG_TLvi2178421784eucas1p11;
        Fri, 27 Mar 2020 13:00:11 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20200327130011eusmtrp1af608afddff33c6a473d8396e4b9353b~AKrG86DOQ1652416524eusmtrp1t;
        Fri, 27 Mar 2020 13:00:11 +0000 (GMT)
X-AuditID: cbfec7f2-f0bff7000001ef66-d3-5e7df8dcbd15
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id CC.52.07950.BD8FD7E5; Fri, 27
        Mar 2020 13:00:11 +0000 (GMT)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20200327130011eusmtip1b1166d730d998d1df8e2a66f91a5bd2e~AKrGnBP9k0099000990eusmtip1t;
        Fri, 27 Mar 2020 13:00:11 +0000 (GMT)
From:   Marek Szyprowski <m.szyprowski@samsung.com>
To:     linux-samsung-soc@vger.kernel.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: [PATCH v2 1/4] ARM: dts: exynos: Enable WLAN support for the
 UniversalC210 board
Date:   Fri, 27 Mar 2020 14:00:05 +0100
Message-Id: <20200327130005.20340-1-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrJIsWRmVeSWpSXmKPExsWy7djP87p3ftTGGZz4w2axccZ6VovrX56z
        Wpw/v4HdYsb5fUwWa4/cZXdg9di0qpPNo2/LKkaPz5vkApijuGxSUnMyy1KL9O0SuDKm31nE
        VPCdq2L3qo9sDYyfOboYOTgkBEwkdp0p7WLk4hASWMEo8fzNSVYI5wujxJbWZiCHE8j5zCjx
        4VolTMOeVYYQNcsZJa4v/M4E13Br3jImkAY2AUOJrrddbCC2iICqxOe2BewgRcwC24Cm9j5g
        BkkIC0RLvG/bBWazABU1LbjCCLKBV8BW4sYmJZCwhIC8xOoNB5hBeiUE9rBJbDr4kBki4SIx
        93cDE4QtLPHq+BZ2CFtG4vTkHhaIhmZGiYfn1rJDOD2MEpebZjBCVFlL3Dn3iw1kG7OApsT6
        XfoQYUeJQ2dnMEK8ySdx460gSJgZyJy0bTozRJhXoqNNCKJaTWLW8XVwaw9euAR1modE+9IJ
        zJCAi5XY8X4n+wRGuVkIuxYwMq5iFE8tLc5NTy02zEst1ytOzC0uzUvXS87P3cQIjPDT/45/
        2sH49VLSIUYBDkYlHt4VV2vjhFgTy4orcw8xSnAwK4nwPo2siRPiTUmsrEotyo8vKs1JLT7E
        KM3BoiTOa7zoZayQQHpiSWp2ampBahFMlomDU6qBUdJ1s/fsNRo6D0u6T3Y1mM1xkT13LUnD
        hH+ycO+vjat3/Q9TLDN+d5zhipnusXUzODvYhXVXdBxf01E5+4TCLEGZEy3dzFFxl1axZFwR
        MFsy6eGC1Ef/FkoY3a5X3ez1J6guhclmhf57nn8mKomzGY85qvle5OXxDQlfmlQceOfSFeWt
        xzdZKbEUZyQaajEXFScCAJnPWa7sAgAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrPLMWRmVeSWpSXmKPExsVy+t/xu7q3f9TGGXxermGxccZ6VovrX56z
        Wpw/v4HdYsb5fUwWa4/cZXdg9di0qpPNo2/LKkaPz5vkApij9GyK8ktLUhUy8otLbJWiDS2M
        9AwtLfSMTCz1DI3NY62MTJX07WxSUnMyy1KL9O0S9DKm31nEVPCdq2L3qo9sDYyfOboYOTgk
        BEwk9qwy7GLk5BASWMooce6MGogtISAjcXJaAyuELSzx51oXWxcjF1DNJ0aJ23unMIEk2AQM
        JbregiQ4OUQEVCU+ty1gByliFtjBKLFlx1uwbmGBSInJzS/YQWwWoKKmBVcYQRbzCthK3Nik
        BLFAXmL1hgPMExh5FjAyrGIUSS0tzk3PLTbSK07MLS7NS9dLzs/dxAgMrG3Hfm7Zwdj1LvgQ
        owAHoxIP74qrtXFCrIllxZW5hxglOJiVRHifRtbECfGmJFZWpRblxxeV5qQWH2I0Bdo9kVlK
        NDkfGPR5JfGGpobmFpaG5sbmxmYWSuK8HQIHY4QE0hNLUrNTUwtSi2D6mDg4pRoYMx5VMSUv
        /Pqn7KZC6AeX9u8Xfy2Xcejt2vxlVvKMaZHc2eG/Db6qMXbw5AcYhqzX9V4y7eO1X6sklnja
        +03fyHU6MlqxqFYx/IrZOtZjF2fu7ZZ3MY9Xk1R5r/xJrOlz538lEa0l8b175svtZ36r0rWx
        pU7YIHG1h12gqStX9r34TQ9fPAtWYinOSDTUYi4qTgQABB3KN0ICAAA=
X-CMS-MailID: 20200327130011eucas1p1c82b341aff9583d8e9c11fad9d8a64f4
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20200327130011eucas1p1c82b341aff9583d8e9c11fad9d8a64f4
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200327130011eucas1p1c82b341aff9583d8e9c11fad9d8a64f4
References: <CGME20200327130011eucas1p1c82b341aff9583d8e9c11fad9d8a64f4@eucas1p1.samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Add a node for BCM4330/2 SDIO chip on SDHCI bus #3 and the required MMC
power sequence node for the Exynos4210-based UniversalC210 board.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 .../boot/dts/exynos4210-universal_c210.dts    | 28 +++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm/boot/dts/exynos4210-universal_c210.dts b/arch/arm/boot/dts/exynos4210-universal_c210.dts
index 9dda6bdb9253..c78423a2d10f 100644
--- a/arch/arm/boot/dts/exynos4210-universal_c210.dts
+++ b/arch/arm/boot/dts/exynos4210-universal_c210.dts
@@ -50,6 +50,11 @@
 		enable-active-high;
 	};
 
+	wlan_pwrseq: sdhci3-pwrseq {
+		compatible = "mmc-pwrseq-simple";
+		reset-gpios = <&gpe3 1 GPIO_ACTIVE_LOW>;
+	};
+
 	gpio-keys {
 		compatible = "gpio-keys";
 
@@ -563,6 +568,29 @@
 	status = "okay";
 };
 
+&sdhci_3 {
+	status = "okay";
+
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	non-removable;
+	bus-width = <4>;
+	mmc-pwrseq = <&wlan_pwrseq>;
+	vmmc-supply = <&ldo5_reg>;
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&sd3_clk>, <&sd3_cmd>, <&sd3_bus4>;
+
+	brcmf: wifi@1 {
+		compatible = "brcm,bcm4330-fmac";
+		reg = <1>;
+		interrupt-parent = <&gpx2>;
+		interrupts = <5 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-names = "host-wake";
+	};
+};
+
 &serial_0 {
 	status = "okay";
 	/delete-property/dmas;
-- 
2.17.1

