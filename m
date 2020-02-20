Return-Path: <SRS0=Yoj7=4I=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39703C11D0A
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 20 Feb 2020 14:28:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 128B5207FD
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 20 Feb 2020 14:28:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="C4j0aNN2"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727915AbgBTO2S (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 20 Feb 2020 09:28:18 -0500
Received: from mailout1.w1.samsung.com ([210.118.77.11]:44847 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727088AbgBTO2S (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 20 Feb 2020 09:28:18 -0500
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20200220142817euoutp01282d9ccb13a5ee22c951613727a6d742~1Ipvmo8m-1863218632euoutp01W
        for <linux-samsung-soc@vger.kernel.org>; Thu, 20 Feb 2020 14:28:17 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20200220142817euoutp01282d9ccb13a5ee22c951613727a6d742~1Ipvmo8m-1863218632euoutp01W
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1582208897;
        bh=FAP1Z/d8BDDBSfjJbi8KubLgk4AXWqgCXjZlBEOPwQM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=C4j0aNN2IfSNJx0M9YjuauQVCotvSI6wEB6RNUNAuGquub9h063mMMqgfwKQdnPfF
         iCtbGsXCH6PKWER/LbSjySBjGeZqRZphH4m9CwUU9jm2K2/EDIFCO7HCZkQe74w2RJ
         ZG4sMTuzS7f39am2mxw/6hEcCvIgUWgBDunUoNlc=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20200220142816eucas1p174c9a34b7c8e7195ba78d8744c89ac2e~1IpvactDy2802428024eucas1p1_;
        Thu, 20 Feb 2020 14:28:16 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges1new.samsung.com (EUCPMTA) with SMTP id C8.66.61286.0879E4E5; Thu, 20
        Feb 2020 14:28:16 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20200220142816eucas1p2469c4e011e192517b492c0203443234f~1Ipu8cbYt0164801648eucas1p2M;
        Thu, 20 Feb 2020 14:28:16 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20200220142816eusmtrp2b3194e4279b238856c164e5d87824211~1Ipu74yRG3236932369eusmtrp2G;
        Thu, 20 Feb 2020 14:28:16 +0000 (GMT)
X-AuditID: cbfec7f2-f0bff7000001ef66-1b-5e4e9780822c
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id D3.27.08375.0879E4E5; Thu, 20
        Feb 2020 14:28:16 +0000 (GMT)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20200220142816eusmtip1bfdfcde4e8aaddc2a1f2f8068e4d6298~1IpuowBHQ2791327913eusmtip11;
        Thu, 20 Feb 2020 14:28:16 +0000 (GMT)
From:   Marek Szyprowski <m.szyprowski@samsung.com>
To:     linux-samsung-soc@vger.kernel.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: [PATCH 2/2] ARM: dts: exynos: Make fixed regulators always-on on
 Arndale5250
Date:   Thu, 20 Feb 2020 15:28:06 +0100
Message-Id: <20200220142806.19340-2-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200220142806.19340-1-m.szyprowski@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrKIsWRmVeSWpSXmKPExsWy7djPc7oN0/3iDBqP6FlsnLGe1eL8+Q3s
        FjPO72OyWHvkLrsDi8emVZ1sHn1bVjF6fN4kF8AcxWWTkpqTWZZapG+XwJVxbvs11oITvBU/
        V79laWC8ydXFyMkhIWAicWDZf/YuRi4OIYEVjBKzFj9jgXC+MEpcmLCDCcL5zCjxY+FzFpiW
        I5MaoBLLGSXWTD+A0PLq0CNWkCo2AUOJrrddbCC2iICqxOe2BWBLmAX6GCWu753LDJIQFgiX
        uL7+H5jNAlS0+th0sGZeAVuJ/TcPM0Ksk5dYveEAWA2ngJ3Ev2PbGUEGSQgcYZP4Oncu1E0u
        Ek3PLzJB2MISr45vYYewZST+75zPBNHQzCjx8Nxadginh1HictMMqBXWEnfO/QK6lQPoPk2J
        9bv0IcKOEpevnmYCCUsI8EnceCsIEmYGMidtm84MEeaV6GgTgqhWk5h1fB3c2oMXLjFD2B4S
        S3btggbXRGA4/m1gmcAoPwth2QJGxlWM4qmlxbnpqcWGeanlesWJucWleel6yfm5mxiBkX/6
        3/FPOxi/Xko6xCjAwajEw1vR4BcnxJpYVlyZe4hRgoNZSYRXjQcoxJuSWFmVWpQfX1Sak1p8
        iFGag0VJnNd40ctYIYH0xJLU7NTUgtQimCwTB6dUA2Pc83YlE6sz9xS3aevMenYsXvikyg+O
        8slSJzondD5tjv/NriTkrxo559SivF7O9jVSnY2mJc/3FTRe+LhWY/cPwXfpVY8ftUx+dSGU
        McC7mC9ix1XWzsW57Hf3W6qdC9tfX8XEPNvtQNCWtub9PuEHprLc8n30zPWpksz2s4bbtp5e
        IvvWsE+JpTgj0VCLuag4EQDhPiIb+AIAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrKLMWRmVeSWpSXmKPExsVy+t/xu7oN0/3iDG58FrDYOGM9q8X58xvY
        LWac38dksfbIXXYHFo9NqzrZPPq2rGL0+LxJLoA5Ss+mKL+0JFUhI7+4xFYp2tDCSM/Q0kLP
        yMRSz9DYPNbKyFRJ384mJTUnsyy1SN8uQS/j3PZrrAUneCt+rn7L0sB4k6uLkZNDQsBE4sik
        BqYuRi4OIYGljBLL3/9ghUjISJyc1gBlC0v8udbFBlH0iVFi7dIzjCAJNgFDia63IAlODhEB
        VYnPbQvYQYqYBSYwSpzvnAGWEBYIlTjXPA2sgQWoaPWx6WBTeQVsJfbfPMwIsUFeYvWGA8wg
        NqeAncS/Y9vB4kJANdvmvGSawMi3gJFhFaNIamlxbnpusaFecWJucWleul5yfu4mRmAQbjv2
        c/MOxksbgw8xCnAwKvHwVjT4xQmxJpYVV+YeYpTgYFYS4VXjAQrxpiRWVqUW5ccXleakFh9i
        NAU6aiKzlGhyPjBC8kriDU0NzS0sDc2NzY3NLJTEeTsEDsYICaQnlqRmp6YWpBbB9DFxcEo1
        MMb6Pdv5jb3ticHChqoAUcMV2lFxwo5HlMtC4xVUH3FFRzvaP/rQ+rZa+P/0NVPYHUQnZJfl
        i+03WppkYJBn9C7k4T6PkvZlPmet0quC5zxskMyc5/UgJ5XfiPeCvVZt+S67d7Me/D+44NyZ
        jXyXTOxDTPZM2MQbvulsnFqQuJpnm8urD8+0lFiKMxINtZiLihMB5RRvTVgCAAA=
X-CMS-MailID: 20200220142816eucas1p2469c4e011e192517b492c0203443234f
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20200220142816eucas1p2469c4e011e192517b492c0203443234f
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200220142816eucas1p2469c4e011e192517b492c0203443234f
References: <20200220142806.19340-1-m.szyprowski@samsung.com>
        <CGME20200220142816eucas1p2469c4e011e192517b492c0203443234f@eucas1p2.samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The fixed regulators defined for Arndale5250 boards have no control lines,
so mark them as 'always-on' to better describe the hardware and also kill
the strange messages like 'MAIN_DC: disabling' after boot.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 arch/arm/boot/dts/exynos5250-arndale.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5250-arndale.dts b/arch/arm/boot/dts/exynos5250-arndale.dts
index bff24c61212b..6904091d4837 100644
--- a/arch/arm/boot/dts/exynos5250-arndale.dts
+++ b/arch/arm/boot/dts/exynos5250-arndale.dts
@@ -93,6 +93,7 @@
 			compatible = "regulator-fixed";
 			reg = <0>;
 			regulator-name = "MAIN_DC";
+			regulator-always-on;
 		};
 
 		mmc_reg: regulator@1 {
@@ -101,12 +102,14 @@
 			regulator-name = "VDD_MMC";
 			regulator-min-microvolt = <2800000>;
 			regulator-max-microvolt = <2800000>;
+			regulator-always-on;
 		};
 
 		reg_hdmi_en: regulator@2 {
 			compatible = "regulator-fixed";
 			reg = <2>;
 			regulator-name = "hdmi-en";
+			regulator-always-on;
 		};
 
 		vcc_1v2_reg: regulator@3 {
@@ -115,6 +118,7 @@
 			regulator-name = "VCC_1V2";
 			regulator-min-microvolt = <1200000>;
 			regulator-max-microvolt = <1200000>;
+			regulator-always-on;
 		};
 
 		vcc_1v8_reg: regulator@4 {
@@ -123,6 +127,7 @@
 			regulator-name = "VCC_1V8";
 			regulator-min-microvolt = <1800000>;
 			regulator-max-microvolt = <1800000>;
+			regulator-always-on;
 		};
 
 		vcc_3v3_reg: regulator@5 {
@@ -131,6 +136,7 @@
 			regulator-name = "VCC_3V3";
 			regulator-min-microvolt = <3300000>;
 			regulator-max-microvolt = <3300000>;
+			regulator-always-on;
 		};
 	};
 
-- 
2.17.1

