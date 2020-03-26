Return-Path: <SRS0=zaGS=5L=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E25DBC43331
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 26 Mar 2020 09:46:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B0FC92076A
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 26 Mar 2020 09:46:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="Lc+9XPyN"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726292AbgCZJqk (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 26 Mar 2020 05:46:40 -0400
Received: from mailout2.w1.samsung.com ([210.118.77.12]:40659 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727780AbgCZJqh (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 26 Mar 2020 05:46:37 -0400
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20200326094635euoutp029bedd8394ea3374fad950205f2571e8a~-0YypD8kf2204122041euoutp02E
        for <linux-samsung-soc@vger.kernel.org>; Thu, 26 Mar 2020 09:46:35 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20200326094635euoutp029bedd8394ea3374fad950205f2571e8a~-0YypD8kf2204122041euoutp02E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1585215995;
        bh=rcy9OgnMjlR9HqiN9vy+xOGxRYOJgLNMn6cjYfenBLA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Lc+9XPyN7pPAntABcTcFCspDfLk4Qp7QRNOpmgeUaczm5oAxm8VmotmwOwOAIhHP3
         CyC48bqb4BS2yxhmij749BH0aIO13Q55RMyPsGxt18zszRGiwfXAg7QKiZZwMtDpRc
         0t3QCNTeZwcNt1r8vA+FEmdAs5D78sv5XszQSmRo=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20200326094635eucas1p206390d1309a886719ea567e671ffc788~-0YyV19n02482624826eucas1p2a;
        Thu, 26 Mar 2020 09:46:35 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges3new.samsung.com (EUCPMTA) with SMTP id 5B.AD.60698.BF97C7E5; Thu, 26
        Mar 2020 09:46:35 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20200326094635eucas1p2220473a93430f9319130dfc2449033b7~-0YyDNLCo2487324873eucas1p2V;
        Thu, 26 Mar 2020 09:46:35 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20200326094635eusmtrp2d2a051c57250534eeff7ca0d19595a79~-0YyCnMla0813208132eusmtrp2H;
        Thu, 26 Mar 2020 09:46:35 +0000 (GMT)
X-AuditID: cbfec7f5-a29ff7000001ed1a-9c-5e7c79fbbdbd
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id 8B.C2.07950.BF97C7E5; Thu, 26
        Mar 2020 09:46:35 +0000 (GMT)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20200326094634eusmtip2ce15c865bff9400ccab504ccac7c2f1f~-0Yxsoas52446224462eusmtip2M;
        Thu, 26 Mar 2020 09:46:34 +0000 (GMT)
From:   Marek Szyprowski <m.szyprowski@samsung.com>
To:     linux-samsung-soc@vger.kernel.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: [PATCH 2/4] ARM: dts: exynos: Enable WLAN support for the Trats
 board
Date:   Thu, 26 Mar 2020 10:46:24 +0100
Message-Id: <20200326094626.28308-3-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200326094626.28308-1-m.szyprowski@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrFIsWRmVeSWpSXmKPExsWy7djP87q/K2viDC7PU7LYOGM9q8X1L89Z
        Lc6f38BuMeP8PiaLtUfusjuwemxa1cnm0bdlFaPH501yAcxRXDYpqTmZZalF+nYJXBn39s9l
        KTjGVXH20ha2BsYDHF2MnBwSAiYSO6asYuli5OIQEljBKNG5bS0ThPOFUWLW3N1Qmc+MEq9f
        XGaGadm/aSMjRGI5o8SrSSvZ4Voedu0Gq2ITMJToetvFBmKLCKhKfG5bAFbELLCNUWJL7wOw
        ImGBAIkXE26xg9gsQEXTe5tYQGxeAVuJ5XP2MEGsk5dYveEAWD2ngJ3E4mnfwG6SELjMJvH9
        +AZGiCIXibX3t7FD2MISr45vgbJlJP7vnM8E0dAMdN65tewQTg+jxOWmGVDd1hJ3zv0CupUD
        6D5NifW79CHCjhKbvzazgoQlBPgkbrwVBAkzA5mTtk1nhgjzSnS0CUFUq0nMOr4Obu3BC5eg
        weUhMWlpIzQcJzJKrJmxhGkCo/wshGULGBlXMYqnlhbnpqcWG+ellusVJ+YWl+al6yXn525i
        BKaA0/+Of93BuO9P0iFGAQ5GJR7eCPPqOCHWxLLiytxDjBIczEoivE8ja+KEeFMSK6tSi/Lj
        i0pzUosPMUpzsCiJ8xovehkrJJCeWJKanZpakFoEk2Xi4JRqYLR/sPtlHNPPc3ciPuhOzT+k
        01otrp62R1bma9z6S+t33nqdvtVi8ca9Obt3326p+xQo2jWr6f37vM46h8+Hpa7Up922sWHb
        d3GbXubVA46nDl7t/PFVdOP6GIs1p+WYrbI1k8+/S3VTSNR9N6GiQDDxk+epfw/Y9Rfnn6tJ
        vRHq5s7BdiRmEb8SS3FGoqEWc1FxIgC+lZIW/QIAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrFLMWRmVeSWpSXmKPExsVy+t/xe7q/K2viDL7/5rLYOGM9q8X1L89Z
        Lc6f38BuMeP8PiaLtUfusjuwemxa1cnm0bdlFaPH501yAcxRejZF+aUlqQoZ+cUltkrRhhZG
        eoaWFnpGJpZ6hsbmsVZGpkr6djYpqTmZZalF+nYJehn39s9lKTjGVXH20ha2BsYDHF2MnBwS
        AiYS+zdtZOxi5OIQEljKKHHr1mZGiISMxMlpDawQtrDEn2tdbBBFnxglli6cyQKSYBMwlOh6
        C5Lg5BARUJX43LaAHaSIWWAHo8SWHW/BuoUF/CQ2P+xgArFZgIqm9zaBNfMK2Eosn7OHCWKD
        vMTqDQeYQWxOATuJxdO+gdUIAdVsfPiQeQIj3wJGhlWMIqmlxbnpucVGesWJucWleel6yfm5
        mxiB4bjt2M8tOxi73gUfYhTgYFTi4d1gWR0nxJpYVlyZe4hRgoNZSYT3aWRNnBBvSmJlVWpR
        fnxRaU5q8SFGU6CjJjJLiSbnA2MlryTe0NTQ3MLS0NzY3NjMQkmct0PgYIyQQHpiSWp2ampB
        ahFMHxMHp1QDo9WjZk8Rp7IXK34sT+GWua3denWFC0u8g+xyy48ajLesjl4z2Pu9fNXbp8LR
        Z5xKip8cF1j4f09ce3yC0ZX+xKOLKx8bX/ojc/nHnCMnGPLe3F6vEiik3rjjYPQScZu3Bqut
        xGYu7o4S4ShrYH+c+/1yQG8lT2eM8Na9DHmGbhv3SfkYLhBJUGIpzkg01GIuKk4EAI9KlOpd
        AgAA
X-CMS-MailID: 20200326094635eucas1p2220473a93430f9319130dfc2449033b7
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20200326094635eucas1p2220473a93430f9319130dfc2449033b7
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200326094635eucas1p2220473a93430f9319130dfc2449033b7
References: <20200326094626.28308-1-m.szyprowski@samsung.com>
        <CGME20200326094635eucas1p2220473a93430f9319130dfc2449033b7@eucas1p2.samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Add a node for BCM4330/3 SDIO chip on SDHCI bus #3 and the required MMC
power sequence node for the Exynos4210-based Trats board.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 arch/arm/boot/dts/exynos4210-trats.dts | 29 ++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/arch/arm/boot/dts/exynos4210-trats.dts b/arch/arm/boot/dts/exynos4210-trats.dts
index 7c39dd1c4d3a..df901f113df5 100644
--- a/arch/arm/boot/dts/exynos4210-trats.dts
+++ b/arch/arm/boot/dts/exynos4210-trats.dts
@@ -121,6 +121,11 @@
 		};
 	};
 
+	wlan_pwrseq: sdhci3-pwrseq {
+		compatible = "mmc-pwrseq-simple";
+		reset-gpios = <&gpl1 2 GPIO_ACTIVE_LOW>;
+	};
+
 	fixed-rate-clocks {
 		xxti {
 			compatible = "samsung,clock-xxti";
@@ -471,6 +476,30 @@
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
+	vmmc-supply = <&tflash_reg>;
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&sd3_clk>, <&sd3_cmd>, <&sd3_bus4>;
+
+	brcmf: wifi@1 {
+		compatible = "brcm,bcm4330-fmac";
+		reg = <1>;
+
+		interrupt-parent = <&gpx2>;
+		interrupts = <5 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-names = "host-wake";
+	};
+};
+
 &serial_0 {
 	status = "okay";
 };
-- 
2.17.1

