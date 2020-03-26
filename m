Return-Path: <SRS0=zaGS=5L=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9691C2D0E9
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 26 Mar 2020 09:46:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6DA76207FF
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 26 Mar 2020 09:46:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="tPXjkuYH"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727822AbgCZJql (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 26 Mar 2020 05:46:41 -0400
Received: from mailout2.w1.samsung.com ([210.118.77.12]:40655 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727773AbgCZJqg (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 26 Mar 2020 05:46:36 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20200326094635euoutp02cbb250b81c7ab8017889b3f12286bbc1~-0Yyc1KhI2181021810euoutp02f
        for <linux-samsung-soc@vger.kernel.org>; Thu, 26 Mar 2020 09:46:35 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20200326094635euoutp02cbb250b81c7ab8017889b3f12286bbc1~-0Yyc1KhI2181021810euoutp02f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1585215995;
        bh=Tp4f9EC9cHcL0ZJMQbVOcXwJ6LX3NpDz4ACJoQ6/Fkw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=tPXjkuYHkdl2guUdSHjyFNoMC3cnwmV0ldwN6V90C3WZmUceTj6Mx38rI22SkvMf8
         Hk1hOdAi/NOpCB8kWq3tlIhrdEHfeaUcRcagdoEMnh6VxdsFemyj5BLUF0WZeOkZgz
         s3fhBr53KWFznSh2QYvXP5QjPIlzK1u7ZILFCB1U=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20200326094635eucas1p111acc091182615b57a6fc0599629f005~-0YyLWGaB0331003310eucas1p1R;
        Thu, 26 Mar 2020 09:46:35 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges1new.samsung.com (EUCPMTA) with SMTP id 01.4C.61286.BF97C7E5; Thu, 26
        Mar 2020 09:46:35 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20200326094634eucas1p1d02b6124a500b7bac6a9702d93915c42~-0YxxRKCE2168621686eucas1p1y;
        Thu, 26 Mar 2020 09:46:34 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20200326094634eusmtrp2bfa763138a2e896e7f060ab162c99278~-0YxwuLjQ0813208132eusmtrp2G;
        Thu, 26 Mar 2020 09:46:34 +0000 (GMT)
X-AuditID: cbfec7f2-f0bff7000001ef66-ed-5e7c79fbdbf7
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id 2B.C2.07950.AF97C7E5; Thu, 26
        Mar 2020 09:46:34 +0000 (GMT)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20200326094634eusmtip2bc75d0473f1175ebcbb8c4aaa2e0a764~-0YxbZdlq2643126431eusmtip2W;
        Thu, 26 Mar 2020 09:46:34 +0000 (GMT)
From:   Marek Szyprowski <m.szyprowski@samsung.com>
To:     linux-samsung-soc@vger.kernel.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: [PATCH 1/4] ARM: dts: exynos: Enable WLAN support for the
 UniversalC210 board
Date:   Thu, 26 Mar 2020 10:46:23 +0100
Message-Id: <20200326094626.28308-2-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200326094626.28308-1-m.szyprowski@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrJIsWRmVeSWpSXmKPExsWy7djP87q/K2viDNY/F7fYOGM9q8X1L89Z
        Lc6f38BuMeP8PiaLtUfusjuwemxa1cnm0bdlFaPH501yAcxRXDYpqTmZZalF+nYJXBmTp/1h
        Lujiqdi96iNbA+Nnji5GTg4JAROJRfsnsHYxcnEICaxglPj/+RIzhPOFUeLp2n9QzmdGiW+v
        P7DBtHxp+M8EkVjOKLG1aS0jXMv/O83MIFVsAoYSXW+7wDpEBFQlPrctYAcpYhbYxiixpfcB
        WJGwQITEqTUnWEBsFqCiGYvWsIPYvAK2EotevGWEWCcvsXrDAbB6TgE7icXTvrGADJIQuMwm
        cfHQFqibXCQO3ZwB1SAs8er4FnYIW0bi/875TBANzYwSD8+tZYdwehglLjfBdFhL3Dn3C2gS
        B9B9mhLrd+lDhB0ldjR0M4GEJQT4JG68FQQJMwOZk7ZNZ4YI80p0tAlBVKtJzDq+Dm7twQuX
        mCFsD4m5Z9aALRISmMgocfWo1wRG+VkIuxYwMq5iFE8tLc5NTy02zEst1ytOzC0uzUvXS87P
        3cQITACn/x3/tIPx66WkQ4wCHIxKPLwbLKvjhFgTy4orcw8xSnAwK4nwPo2siRPiTUmsrEot
        yo8vKs1JLT7EKM3BoiTOa7zoZayQQHpiSWp2ampBahFMlomDU6qBUXy1Yu18eeOWv8JdZQ+z
        7I71PGLZPk3g0+OzWhfXfxN8FSg1+1KmZ/3V1QJ67Bf5ws69b4iXT2LduXP6BolZ7h8XSEvO
        XP/p36VmrgB2L5lrkpzxMYrHVparPDu8Kj770q3JnM3bJ/o4lJ2Te8hop/TtuQ7fy//T9TuM
        7+ROZbqowRZ94DFThhJLcUaioRZzUXEiAJXKF/L8AgAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrJLMWRmVeSWpSXmKPExsVy+t/xe7q/KmviDCZPNrPYOGM9q8X1L89Z
        Lc6f38BuMeP8PiaLtUfusjuwemxa1cnm0bdlFaPH501yAcxRejZF+aUlqQoZ+cUltkrRhhZG
        eoaWFnpGJpZ6hsbmsVZGpkr6djYpqTmZZalF+nYJehmTp/1hLujiqdi96iNbA+Nnji5GTg4J
        AROJLw3/mboYuTiEBJYySqxbMocZIiEjcXJaAyuELSzx51oXG4gtJPCJUeLflGgQm03AUKLr
        LURcREBV4nPbAnaQQcwCOxgltux4C9YsLBAm8WfvTDCbBahoxqI17CA2r4CtxKIXbxkhFshL
        rN5wAGwxp4CdxOJp31ggltlKbHz4kHkCI98CRoZVjCKppcW56bnFRnrFibnFpXnpesn5uZsY
        gcG47djPLTsYu94FH2IU4GBU4uHdYFkdJ8SaWFZcmXuIUYKDWUmE92lkTZwQb0piZVVqUX58
        UWlOavEhRlOgoyYyS4km5wMjJa8k3tDU0NzC0tDc2NzYzEJJnLdD4GCMkEB6YklqdmpqQWoR
        TB8TB6dUA2NuyoT9hinnZ711D9rHofvl9WONtKqshC8sYS9WP3i6QfzR9kmdFcWXelxSOM3+
        JGzw23DDb09g217VrOcBjVd6/LyE28ymls08Y/bJbs50eZd199Oy46bvyk31mnvFTVm+QH7a
        8VUdLTZHtvU+rF3x6XNpccgRxp/PArZLbpWLXF+tOedM0DklluKMREMt5qLiRAACD7KvXAIA
        AA==
X-CMS-MailID: 20200326094634eucas1p1d02b6124a500b7bac6a9702d93915c42
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20200326094634eucas1p1d02b6124a500b7bac6a9702d93915c42
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200326094634eucas1p1d02b6124a500b7bac6a9702d93915c42
References: <20200326094626.28308-1-m.szyprowski@samsung.com>
        <CGME20200326094634eucas1p1d02b6124a500b7bac6a9702d93915c42@eucas1p1.samsung.com>
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
+        status = "okay";
+
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        non-removable;
+        bus-width = <4>;
+        mmc-pwrseq = <&wlan_pwrseq>;
+        vmmc-supply = <&ldo5_reg>;
+
+        pinctrl-names = "default";
+        pinctrl-0 = <&sd3_clk>, <&sd3_cmd>, <&sd3_bus4>;
+
+        brcmf: wifi@1 {
+                compatible = "brcm,bcm4330-fmac";
+                reg = <1>;
+                interrupt-parent = <&gpx2>;
+                interrupts = <5 IRQ_TYPE_LEVEL_HIGH>;
+                interrupt-names = "host-wake";
+        };
+};
+
 &serial_0 {
 	status = "okay";
 	/delete-property/dmas;
-- 
2.17.1

