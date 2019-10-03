Return-Path: <SRS0=KEKd=X4=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7015AC10F14
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  3 Oct 2019 10:08:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2F3A32086A
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  3 Oct 2019 10:08:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="Z+w9e8AZ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726070AbfJCKIX (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 3 Oct 2019 06:08:23 -0400
Received: from mailout1.w1.samsung.com ([210.118.77.11]:56693 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728322AbfJCKIX (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 3 Oct 2019 06:08:23 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20191003100821euoutp01faeb06aab88ca8b9c7e3e2157e7ba75d~KGy1P8ZwO2359323593euoutp01r
        for <linux-samsung-soc@vger.kernel.org>; Thu,  3 Oct 2019 10:08:21 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20191003100821euoutp01faeb06aab88ca8b9c7e3e2157e7ba75d~KGy1P8ZwO2359323593euoutp01r
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1570097301;
        bh=xXUl/EO8xaQfl6diJ8FYWPSA6W6BlDwHBTYnG68qRRQ=;
        h=From:To:Cc:Subject:Date:References:From;
        b=Z+w9e8AZm7PYwDQwRC5ne/qwECmUG2wlveytULsIfuxIwytoAi6csgmRzW4y2OjJI
         qKVjDqwEt083tCUSyNzf8pDLw2fXcZ7RsEGWUZ0cz8jLTTNOw2pNlKstaRPmFCbusV
         tjpE+mkBvCb1l1y97I6zVUiau0NK9d1p1f7ug1JQ=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20191003100820eucas1p2729cca30454177c31456e3ae1b33fc51~KGy0v3yj11612116121eucas1p2u;
        Thu,  3 Oct 2019 10:08:20 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges3new.samsung.com (EUCPMTA) with SMTP id 2B.CC.04374.498C59D5; Thu,  3
        Oct 2019 11:08:20 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20191003100820eucas1p194ffb6c01f826583ad2ed9d44d144375~KGy0d5Fp10482404824eucas1p1h;
        Thu,  3 Oct 2019 10:08:20 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20191003100820eusmtrp262fb084f859c3655cf49b5927f4a624a~KGy0dTHaI3161431614eusmtrp2b;
        Thu,  3 Oct 2019 10:08:20 +0000 (GMT)
X-AuditID: cbfec7f5-4f7ff70000001116-62-5d95c89473eb
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id F7.72.04166.498C59D5; Thu,  3
        Oct 2019 11:08:20 +0100 (BST)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20191003100820eusmtip2a278524be6f26c809ac5dd74387fe6aa~KGy0FLdkC0770607706eusmtip2Y;
        Thu,  3 Oct 2019 10:08:20 +0000 (GMT)
From:   Marek Szyprowski <m.szyprowski@samsung.com>
To:     linux-samsung-soc@vger.kernel.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Kamil Konieczny <k.konieczny@partner.samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>
Subject: [PATCH v6] ARM: dts: exynos: add initial data for coupled
 regulators for Exynos5422/5800
Date:   Thu,  3 Oct 2019 12:08:14 +0200
Message-Id: <20191003100814.11545-1-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrMIsWRmVeSWpSXmKPExsWy7djP87pTTkyNNZjUZ2WxccZ6VovrX56z
        WvTt+89ocf78BnaLGef3MVmsPXKX3YHNY9OqTjaPg+/2MHn0bVnF6PF5k1wASxSXTUpqTmZZ
        apG+XQJXxpZVLAXzbCoeL9vK3MD4Sa+LkZNDQsBEou3SJ0YQW0hgBaPEmZlJXYxcQPYXRon1
        Sz6xQzifGSV62xazwnTcmL0GKrGcUeL4jl8scC0njr1mB6liEzCU6HrbxQZiiwioSnxuWwDW
        wSzwmlHiVtNFsISwQLLE8p+XmUBsFqCiNc3LgeIcHLwCthLH7zJBbJOXWL3hADOEfYJNYtXM
        AAjbReLCpGNQNcISr45vYYewZST+75zPBLJLQqCZUeLhubXsEE4Po8TlphmMEFXWEoePX2QF
        WcYsoCmxfpc+RNhRYunWGywgYQkBPokbbwVBwsxA5qRt05khwrwSHW1CENVqErOOr4Nbe/DC
        JagzPSQOL5vMDgnSWIlN2w4wTmCUm4WwawEj4ypG8dTS4tz01GLjvNRyveLE3OLSvHS95Pzc
        TYzAqD/97/jXHYz7/iQdYhTgYFTi4Z1xb0qsEGtiWXFl7iFGCQ5mJRHeS+uBQrwpiZVVqUX5
        8UWlOanFhxilOViUxHmrGR5ECwmkJ5akZqemFqQWwWSZODilGhjnqFov7bt3hZ3ljrnM3JUn
        GR9/VGUL+BvVkH7gwpX9V1vMLjAnzOA59+jL7uyvMU3svt8vrd2x+u2zq05qGf8S9ZMuFcqm
        Xb7fkJnYHcAR8n7ZChHv6/dN7fsq/lj9OuDWWOIUyam/bcHKBZnxh28y5CfODV2turc2682P
        jqlbjl3r+H5omsNRJZbijERDLeai4kQAOEEi0fYCAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrJLMWRmVeSWpSXmKPExsVy+t/xe7pTTkyNNVj+QcVi44z1rBbXvzxn
        tejb95/R4vz5DewWM87vY7JYe+QuuwObx6ZVnWweB9/tYfLo27KK0ePzJrkAlig9m6L80pJU
        hYz84hJbpWhDCyM9Q0sLPSMTSz1DY/NYKyNTJX07m5TUnMyy1CJ9uwS9jC2rWArm2VQ8XraV
        uYHxk14XIyeHhICJxI3Za9hBbCGBpYwSXz/7QMRlJE5Oa2CFsIUl/lzrYuti5AKq+cQocX/K
        CWaQBJuAoUTXW5AEJ4eIgKrE57YF7CBFzAJvGSXenF/DBJIQFkiU+Lt8GdgkFqCiNc3LgRo4
        OHgFbCWO32WCWCAvsXrDAeYJjDwLGBlWMYqklhbnpucWG+oVJ+YWl+al6yXn525iBAbbtmM/
        N+9gvLQx+BCjAAejEg/vjHtTYoVYE8uKK3MPMUpwMCuJ8F5aDxTiTUmsrEotyo8vKs1JLT7E
        aAq0eyKzlGhyPjAS8kriDU0NzS0sDc2NzY3NLJTEeTsEDsYICaQnlqRmp6YWpBbB9DFxcEo1
        MFYsbLyVrnM665CnjfrR4yktW9QFjzO4L4pfpfaxSnLnlIsG62eveHJL5tXPDoeGhXONyt5+
        fH+q8rPcSW5fY+YlMWrRuyQu/L++PEVPQn7xw9ztT/deZFsaKndaqUIipmE7Q/Ch1Wq7+4+n
        t8c6va6+drO9l5Hznna5XaNuQL7s4bjEJdsu5imxFGckGmoxFxUnAgDAlK5DTAIAAA==
X-CMS-MailID: 20191003100820eucas1p194ffb6c01f826583ad2ed9d44d144375
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20191003100820eucas1p194ffb6c01f826583ad2ed9d44d144375
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20191003100820eucas1p194ffb6c01f826583ad2ed9d44d144375
References: <CGME20191003100820eucas1p194ffb6c01f826583ad2ed9d44d144375@eucas1p1.samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Declare Exynos5422/5800 voltage ranges for opp points for big cpu core and
bus wcore and couple their voltage supllies as vdd_arm and vdd_int should
be in 300mV range.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
[k.konieczny: add missing patch description]
Signed-off-by: Kamil Konieczny <k.konieczny@partner.samsung.com>
Reviewed-by: Chanwoo Choi <cw00.choi@samsung.com>
---
v6:
- rebased on top of v5.4-rc1
---
 arch/arm/boot/dts/exynos5420.dtsi             | 34 +++++++++----------
 arch/arm/boot/dts/exynos5422-odroid-core.dtsi |  4 +++
 arch/arm/boot/dts/exynos5800-peach-pi.dts     |  4 +++
 arch/arm/boot/dts/exynos5800.dtsi             | 32 ++++++++---------
 4 files changed, 41 insertions(+), 33 deletions(-)

diff --git a/arch/arm/boot/dts/exynos5420.dtsi b/arch/arm/boot/dts/exynos5420.dtsi
index 6b7f75645988..036ac4924eb3 100644
--- a/arch/arm/boot/dts/exynos5420.dtsi
+++ b/arch/arm/boot/dts/exynos5420.dtsi
@@ -48,62 +48,62 @@
 
 		opp-1800000000 {
 			opp-hz = /bits/ 64 <1800000000>;
-			opp-microvolt = <1250000>;
+			opp-microvolt = <1250000 1250000 1500000>;
 			clock-latency-ns = <140000>;
 		};
 		opp-1700000000 {
 			opp-hz = /bits/ 64 <1700000000>;
-			opp-microvolt = <1212500>;
+			opp-microvolt = <1212500 1212500 1500000>;
 			clock-latency-ns = <140000>;
 		};
 		opp-1600000000 {
 			opp-hz = /bits/ 64 <1600000000>;
-			opp-microvolt = <1175000>;
+			opp-microvolt = <1175000 1175000 1500000>;
 			clock-latency-ns = <140000>;
 		};
 		opp-1500000000 {
 			opp-hz = /bits/ 64 <1500000000>;
-			opp-microvolt = <1137500>;
+			opp-microvolt = <1137500 1137500 1500000>;
 			clock-latency-ns = <140000>;
 		};
 		opp-1400000000 {
 			opp-hz = /bits/ 64 <1400000000>;
-			opp-microvolt = <1112500>;
+			opp-microvolt = <1112500 1112500 1500000>;
 			clock-latency-ns = <140000>;
 		};
 		opp-1300000000 {
 			opp-hz = /bits/ 64 <1300000000>;
-			opp-microvolt = <1062500>;
+			opp-microvolt = <1062500 1062500 1500000>;
 			clock-latency-ns = <140000>;
 		};
 		opp-1200000000 {
 			opp-hz = /bits/ 64 <1200000000>;
-			opp-microvolt = <1037500>;
+			opp-microvolt = <1037500 1037500 1500000>;
 			clock-latency-ns = <140000>;
 		};
 		opp-1100000000 {
 			opp-hz = /bits/ 64 <1100000000>;
-			opp-microvolt = <1012500>;
+			opp-microvolt = <1012500 1012500 1500000>;
 			clock-latency-ns = <140000>;
 		};
 		opp-1000000000 {
 			opp-hz = /bits/ 64 <1000000000>;
-			opp-microvolt = < 987500>;
+			opp-microvolt = < 987500 987500 1500000>;
 			clock-latency-ns = <140000>;
 		};
 		opp-900000000 {
 			opp-hz = /bits/ 64 <900000000>;
-			opp-microvolt = < 962500>;
+			opp-microvolt = < 962500 962500 1500000>;
 			clock-latency-ns = <140000>;
 		};
 		opp-800000000 {
 			opp-hz = /bits/ 64 <800000000>;
-			opp-microvolt = < 937500>;
+			opp-microvolt = < 937500 937500 1500000>;
 			clock-latency-ns = <140000>;
 		};
 		opp-700000000 {
 			opp-hz = /bits/ 64 <700000000>;
-			opp-microvolt = < 912500>;
+			opp-microvolt = < 912500 912500 1500000>;
 			clock-latency-ns = <140000>;
 		};
 	};
@@ -1168,23 +1168,23 @@
 
 			opp00 {
 				opp-hz = /bits/ 64 <84000000>;
-				opp-microvolt = <925000>;
+				opp-microvolt = <925000 925000 1400000>;
 			};
 			opp01 {
 				opp-hz = /bits/ 64 <111000000>;
-				opp-microvolt = <950000>;
+				opp-microvolt = <950000 950000 1400000>;
 			};
 			opp02 {
 				opp-hz = /bits/ 64 <222000000>;
-				opp-microvolt = <950000>;
+				opp-microvolt = <950000 950000 1400000>;
 			};
 			opp03 {
 				opp-hz = /bits/ 64 <333000000>;
-				opp-microvolt = <950000>;
+				opp-microvolt = <950000 950000 1400000>;
 			};
 			opp04 {
 				opp-hz = /bits/ 64 <400000000>;
-				opp-microvolt = <987500>;
+				opp-microvolt = <987500 987500 1400000>;
 			};
 		};
 
diff --git a/arch/arm/boot/dts/exynos5422-odroid-core.dtsi b/arch/arm/boot/dts/exynos5422-odroid-core.dtsi
index 059fa32d1a8f..8a34a861c191 100644
--- a/arch/arm/boot/dts/exynos5422-odroid-core.dtsi
+++ b/arch/arm/boot/dts/exynos5422-odroid-core.dtsi
@@ -601,6 +601,8 @@
 				regulator-max-microvolt = <1500000>;
 				regulator-always-on;
 				regulator-boot-on;
+				regulator-coupled-with = <&buck3_reg>;
+				regulator-coupled-max-spread = <300000>;
 
 				regulator-state-mem {
 					regulator-off-in-suspend;
@@ -613,6 +615,8 @@
 				regulator-max-microvolt = <1400000>;
 				regulator-always-on;
 				regulator-boot-on;
+				regulator-coupled-with = <&buck2_reg>;
+				regulator-coupled-max-spread = <300000>;
 
 				regulator-state-mem {
 					regulator-off-in-suspend;
diff --git a/arch/arm/boot/dts/exynos5800-peach-pi.dts b/arch/arm/boot/dts/exynos5800-peach-pi.dts
index 60ca3d685247..c1e38139ce4f 100644
--- a/arch/arm/boot/dts/exynos5800-peach-pi.dts
+++ b/arch/arm/boot/dts/exynos5800-peach-pi.dts
@@ -257,6 +257,8 @@
 				regulator-always-on;
 				regulator-boot-on;
 				regulator-ramp-delay = <12500>;
+				regulator-coupled-with = <&buck3_reg>;
+				regulator-coupled-max-spread = <300000>;
 				regulator-state-mem {
 					regulator-off-in-suspend;
 				};
@@ -269,6 +271,8 @@
 				regulator-always-on;
 				regulator-boot-on;
 				regulator-ramp-delay = <12500>;
+				regulator-coupled-with = <&buck2_reg>;
+				regulator-coupled-max-spread = <300000>;
 				regulator-state-mem {
 					regulator-off-in-suspend;
 				};
diff --git a/arch/arm/boot/dts/exynos5800.dtsi b/arch/arm/boot/dts/exynos5800.dtsi
index 16177d815ee4..1be7eb60439a 100644
--- a/arch/arm/boot/dts/exynos5800.dtsi
+++ b/arch/arm/boot/dts/exynos5800.dtsi
@@ -22,61 +22,61 @@
 
 &cluster_a15_opp_table {
 	opp-1700000000 {
-		opp-microvolt = <1250000>;
+		opp-microvolt = <1250000 1250000 1500000>;
 	};
 	opp-1600000000 {
-		opp-microvolt = <1250000>;
+		opp-microvolt = <1250000 1250000 1500000>;
 	};
 	opp-1500000000 {
-		opp-microvolt = <1100000>;
+		opp-microvolt = <1100000 1100000 1500000>;
 	};
 	opp-1400000000 {
-		opp-microvolt = <1100000>;
+		opp-microvolt = <1100000 1100000 1500000>;
 	};
 	opp-1300000000 {
-		opp-microvolt = <1100000>;
+		opp-microvolt = <1100000 1100000 1500000>;
 	};
 	opp-1200000000 {
-		opp-microvolt = <1000000>;
+		opp-microvolt = <1000000 1000000 1500000>;
 	};
 	opp-1100000000 {
-		opp-microvolt = <1000000>;
+		opp-microvolt = <1000000 1000000 1500000>;
 	};
 	opp-1000000000 {
-		opp-microvolt = <1000000>;
+		opp-microvolt = <1000000 1000000 1500000>;
 	};
 	opp-900000000 {
-		opp-microvolt = <1000000>;
+		opp-microvolt = <1000000 1000000 1500000>;
 	};
 	opp-800000000 {
-		opp-microvolt = <900000>;
+		opp-microvolt = <900000 900000 1500000>;
 	};
 	opp-700000000 {
-		opp-microvolt = <900000>;
+		opp-microvolt = <900000 900000 1500000>;
 	};
 	opp-600000000 {
 		opp-hz = /bits/ 64 <600000000>;
-		opp-microvolt = <900000>;
+		opp-microvolt = <900000 900000 1500000>;
 		clock-latency-ns = <140000>;
 	};
 	opp-500000000 {
 		opp-hz = /bits/ 64 <500000000>;
-		opp-microvolt = <900000>;
+		opp-microvolt = <900000 900000 1500000>;
 		clock-latency-ns = <140000>;
 	};
 	opp-400000000 {
 		opp-hz = /bits/ 64 <400000000>;
-		opp-microvolt = <900000>;
+		opp-microvolt = <900000 900000 1500000>;
 		clock-latency-ns = <140000>;
 	};
 	opp-300000000 {
 		opp-hz = /bits/ 64 <300000000>;
-		opp-microvolt = <900000>;
+		opp-microvolt = <900000 900000 1500000>;
 		clock-latency-ns = <140000>;
 	};
 	opp-200000000 {
 		opp-hz = /bits/ 64 <200000000>;
-		opp-microvolt = <900000>;
+		opp-microvolt = <900000 900000 1500000>;
 		clock-latency-ns = <140000>;
 	};
 };
-- 
2.17.1

