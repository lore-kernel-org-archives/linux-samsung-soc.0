Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B13A7C2B9F4
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 22 Jun 2021 13:05:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 919996113E
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 22 Jun 2021 13:05:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231365AbhFVNHx (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 22 Jun 2021 09:07:53 -0400
Received: from mailout1.samsung.com ([203.254.224.24]:50306 "EHLO
        mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231240AbhFVNHx (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 22 Jun 2021 09:07:53 -0400
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
        by mailout1.samsung.com (KnoxPortal) with ESMTP id 20210622130535epoutp01aeddba4c2789135a1a2e07db9fb313bd~K6U3E9f7F1523915239epoutp01D
        for <linux-samsung-soc@vger.kernel.org>; Tue, 22 Jun 2021 13:05:35 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20210622130535epoutp01aeddba4c2789135a1a2e07db9fb313bd~K6U3E9f7F1523915239epoutp01D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1624367135;
        bh=zX/Xx9xQltdLLFto+ROMce7uXxnLYlXqc6+w5MHvh+U=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=eapcSz8+fSPRT3A2xaYL86fwzVMV3rjJ6Die4IMgewmXcVjHv7puYAHplCl/5omkb
         lbSZex5arAyxQ9KA0btAMcwqP8BJ7L64KflQiRS+daS5tFmM7iqHS6k9jRqk2fx724
         sNdNm9S8zViGbrSVva5LoYKDUQGDVgS6iEh8YAw0=
Received: from epsmges5p1new.samsung.com (unknown [182.195.42.73]) by
        epcas5p1.samsung.com (KnoxPortal) with ESMTP id
        20210622130535epcas5p146ba50c9a15bd734625aeb6534b6c6bc~K6U20ANst0526305263epcas5p1J;
        Tue, 22 Jun 2021 13:05:35 +0000 (GMT)
Received: from epcas5p2.samsung.com ( [182.195.41.40]) by
        epsmges5p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
        AE.8A.09476.F10E1D06; Tue, 22 Jun 2021 22:05:35 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
        epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
        20210622130204epcas5p1192cd38abc4a0b49798355cecea9f763~K6RyegZ8T2755727557epcas5p1_;
        Tue, 22 Jun 2021 13:02:04 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
        epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20210622130204epsmtrp23b2e89bed8b1642e1cd3b50ac14a5e57~K6RydbfNO0900809008epsmtrp2m;
        Tue, 22 Jun 2021 13:02:04 +0000 (GMT)
X-AuditID: b6c32a49-6b7ff70000002504-98-60d1e01fc9db
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
        epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
        23.D7.08394.C4FD1D06; Tue, 22 Jun 2021 22:02:04 +0900 (KST)
Received: from Jaguar.sa.corp.samsungelectronics.net (unknown
        [107.108.73.139]) by epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20210622130203epsmtip127b62670911b16144070d4e71b809cdc~K6RxV8LV43046230462epsmtip1a;
        Tue, 22 Jun 2021 13:02:03 +0000 (GMT)
From:   Alim Akhtar <alim.akhtar@samsung.com>
To:     linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        robh+dt@kernel.org
Cc:     krzysztof.kozlowski@canonical.com,
        linux-samsung-soc@vger.kernel.org,
        Alim Akhtar <alim.akhtar@samsung.com>
Subject: [PATCH v2 2/2] arm64: dts: exynos5433: Add cpu cache information
Date:   Tue, 22 Jun 2021 18:35:51 +0530
Message-Id: <20210622130551.67446-2-alim.akhtar@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210622130551.67446-1-alim.akhtar@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrHIsWRmVeSWpSXmKPExsWy7bCmhq78g4sJBk2NkhYP5m1js9j49geT
        xabH11gtLu+aw2Yx4/w+JovWvUfYHdg8ZjX0snlsWtXJ5rF5Sb1H35ZVjB6fN8kFsEZx2aSk
        5mSWpRbp2yVwZdxq2MJa0K9QcXF6P1MD40uJLkZODgkBE4mrd36xdDFycQgJ7GaUWPbnCDuE
        84lRYuqcuVCZb4wSK+c+ZYVp2bOilxkisZdR4vWm1YwQTguTxNru7+wgVWwC2hJ3p29hArFF
        BGIkHu6ZB9bNLFAo8aLlJliNsICnRFPvO0YQm0VAVeL1rbMsIDavgI3E1HN7WCC2yUus3nCA
        GcTmFLCVmDTlEth9EgL72CVOfzjIDlHkIvFu/xEoW1ji1fEtULaUxOd3e9m6GDmA7GyJnl3G
        EOEaiaXzjkHNt5c4cGUOC0gJs4CmxPpd+hBhWYmpp9YxQZzMJ9H7+wkTRJxXYsc8GFtVovnd
        Vagx0hITu7tZITZ5SLT0pECCZAKjxPRPM5gnMMrNQtiwgJFxFaNkakFxbnpqsWmBYV5quV5x
        Ym5xaV66XnJ+7iZGcBLQ8tzBePfBB71DjEwcjIcYJTiYlUR4X2RfTBDiTUmsrEotyo8vKs1J
        LT7EKM3BoiTOu5T9UIKQQHpiSWp2ampBahFMlomDU6qBaf4uny1eiWmMLltN1+i/jeC9eclY
        4O6xmaL/ZF7YHGlsZnR3lftpP9H7oVA964/pu0/mPrk18Z74rRePru89aZLkp3CxiOfUKf8V
        6ufnWresydruvX3hyuXF+5ft3rjAYavpeuG47tClztoa5tVPP7w5H7zP98OLGexr2CUfzZgq
        33VaSfhOUdnreQdWLsy5vXv3bb7ynVIv3j802/PtyOquVykNJyfvW8X2QVYy+1BlId+Zlyad
        Ah+Tk9p+XFCIyZ7+0Cx3QvZVpUnaK9MKHNNKztkrn5wqx3nk0hv2Q7FnZ+nutjjA+6H77tl5
        hzQbKvhljLfH77t8e/8f96tdZwx3neiv1dl6c0Eob77kvLarSizFGYmGWsxFxYkAxQGma3ED
        AAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupjluLIzCtJLcpLzFFi42LZdlhJTtfn/sUEg3nXVCwezNvGZrHx7Q8m
        i02Pr7FaXN41h81ixvl9TBate4+wO7B5zGroZfPYtKqTzWPzknqPvi2rGD0+b5ILYI3isklJ
        zcksSy3St0vgyrjVsIW1oF+h4uL0fqYGxpcSXYycHBICJhJ7VvQydzFycQgJ7GaU2HXiFwtE
        Qlri+sYJ7BC2sMTKf8/BbCGBJiaJv501IDabgLbE3elbmLoYOThEBOIkWtdXg5jMAsUSp38x
        gVQIC3hKNPW+YwSxWQRUJV7fOgs2nVfARmLquT1Qm+QlVm84wAxicwrYSkyacglqk43E4rWr
        mCcw8i1gZFjFKJlaUJybnltsWGCYl1quV5yYW1yal66XnJ+7iREcZFqaOxi3r/qgd4iRiYPx
        EKMEB7OSCO+L7IsJQrwpiZVVqUX58UWlOanFhxilOViUxHkvdJ2MFxJITyxJzU5NLUgtgsky
        cXBKNTCt49coLdsYZfvzmYZAZCIfzz7ByqPms2541n4KYLu/0+dWyW+28ocVP66zvrq+3uKi
        hc+MZXPu/b32dsF3IRNfoW5Om2tb+N5bZS+46zavqHGDlkbOlcdHfu4zK/fttf4h+PbOPxfV
        7prNL62XSN8R6FrSV6P59870uI9zdh/x7eDavfR4xEz1VSUvo7Uq93NNszyrlOV8TedHusXL
        rYI72L1M1Nbde6Cp5DJ/RbjFg9QyicRY1ZgqM/5NKZKcke0bxC5/+S7z9XD195mTA7fsDPju
        0C15L/o2243ju3o/XGUT3MWv5CKdkXk64/daqe2ptlXzeCbmPH5ZfeBLhrGStuLxmgNL0zW/
        TQmvq0lSYinOSDTUYi4qTgQAUlcJN6ECAAA=
X-CMS-MailID: 20210622130204epcas5p1192cd38abc4a0b49798355cecea9f763
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
X-CMS-RootMailID: 20210622130204epcas5p1192cd38abc4a0b49798355cecea9f763
References: <20210622130551.67446-1-alim.akhtar@samsung.com>
        <CGME20210622130204epcas5p1192cd38abc4a0b49798355cecea9f763@epcas5p1.samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

This patch adds cpu caches information to its dt
nodes so that the same is available to userspace
via sysfs.
This SoC has 48/32 KB I/D cache for each A57 cores
with 2MB L2 cache.
And 32/32 KB I/D cache for each A53 cores with
256KB L2 cache.

Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
---
-Changes since v1:
* addressed Krzysztof's review comments

 arch/arm64/boot/dts/exynos/exynos5433.dtsi | 70 ++++++++++++++++++++++
 1 file changed, 70 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos5433.dtsi b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
index 18a912eee360..73aa0fa9b778 100644
--- a/arch/arm64/boot/dts/exynos/exynos5433.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
@@ -62,6 +62,13 @@
 			clock-names = "apolloclk";
 			operating-points-v2 = <&cluster_a53_opp_table>;
 			#cooling-cells = <2>;
+			i-cache-size = <0x8000>;
+			i-cache-line-size = <64>;
+			i-cache-sets = <256>;
+			d-cache-size = <0x8000>;
+			d-cache-line-size = <64>;
+			d-cache-sets = <128>;
+			next-level-cache = <&cluster_a53_l2>;
 		};
 
 		cpu1: cpu@101 {
@@ -72,6 +79,13 @@
 			clock-frequency = <1300000000>;
 			operating-points-v2 = <&cluster_a53_opp_table>;
 			#cooling-cells = <2>;
+			i-cache-size = <0x8000>;
+			i-cache-line-size = <64>;
+			i-cache-sets = <256>;
+			d-cache-size = <0x8000>;
+			d-cache-line-size = <64>;
+			d-cache-sets = <128>;
+			next-level-cache = <&cluster_a53_l2>;
 		};
 
 		cpu2: cpu@102 {
@@ -82,6 +96,13 @@
 			clock-frequency = <1300000000>;
 			operating-points-v2 = <&cluster_a53_opp_table>;
 			#cooling-cells = <2>;
+			i-cache-size = <0x8000>;
+			i-cache-line-size = <64>;
+			i-cache-sets = <256>;
+			d-cache-size = <0x8000>;
+			d-cache-line-size = <64>;
+			d-cache-sets = <128>;
+			next-level-cache = <&cluster_a53_l2>;
 		};
 
 		cpu3: cpu@103 {
@@ -92,6 +113,13 @@
 			clock-frequency = <1300000000>;
 			operating-points-v2 = <&cluster_a53_opp_table>;
 			#cooling-cells = <2>;
+			i-cache-size = <0x8000>;
+			i-cache-line-size = <64>;
+			i-cache-sets = <256>;
+			d-cache-size = <0x8000>;
+			d-cache-line-size = <64>;
+			d-cache-sets = <128>;
+			next-level-cache = <&cluster_a53_l2>;
 		};
 
 		cpu4: cpu@0 {
@@ -104,6 +132,13 @@
 			clock-names = "atlasclk";
 			operating-points-v2 = <&cluster_a57_opp_table>;
 			#cooling-cells = <2>;
+			i-cache-size = <0xc000>;
+			i-cache-line-size = <64>;
+			i-cache-sets = <256>;
+			d-cache-size = <0x8000>;
+			d-cache-line-size = <64>;
+			d-cache-sets = <256>;
+			next-level-cache = <&cluster_a57_l2>;
 		};
 
 		cpu5: cpu@1 {
@@ -114,6 +149,13 @@
 			clock-frequency = <1900000000>;
 			operating-points-v2 = <&cluster_a57_opp_table>;
 			#cooling-cells = <2>;
+			i-cache-size = <0xc000>;
+			i-cache-line-size = <64>;
+			i-cache-sets = <256>;
+			d-cache-size = <0x8000>;
+			d-cache-line-size = <64>;
+			d-cache-sets = <256>;
+			next-level-cache = <&cluster_a57_l2>;
 		};
 
 		cpu6: cpu@2 {
@@ -124,6 +166,13 @@
 			clock-frequency = <1900000000>;
 			operating-points-v2 = <&cluster_a57_opp_table>;
 			#cooling-cells = <2>;
+			i-cache-size = <0xc000>;
+			i-cache-line-size = <64>;
+			i-cache-sets = <256>;
+			d-cache-size = <0x8000>;
+			d-cache-line-size = <64>;
+			d-cache-sets = <256>;
+			next-level-cache = <&cluster_a57_l2>;
 		};
 
 		cpu7: cpu@3 {
@@ -134,6 +183,27 @@
 			clock-frequency = <1900000000>;
 			operating-points-v2 = <&cluster_a57_opp_table>;
 			#cooling-cells = <2>;
+			i-cache-size = <0xc000>;
+			i-cache-line-size = <64>;
+			i-cache-sets = <256>;
+			d-cache-size = <0x8000>;
+			d-cache-line-size = <64>;
+			d-cache-sets = <256>;
+			next-level-cache = <&cluster_a57_l2>;
+		};
+
+		cluster_a57_l2: l2-cache0 {
+			compatible = "cache";
+			cache-size = <0x200000>;
+			cache-line-size = <64>;
+			cache-sets = <2048>;
+		};
+
+		cluster_a53_l2: l2-cache1 {
+			compatible = "cache";
+			cache-size = <0x40000>;
+			cache-line-size = <64>;
+			cache-sets = <256>;
 		};
 	};
 
-- 
2.17.1

