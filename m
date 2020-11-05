Return-Path: <SRS0=idU0=EL=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5D2DC00A89
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  5 Nov 2020 11:48:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BB89620936
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  5 Nov 2020 11:48:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="XDNsSKiS"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730069AbgKELsc (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 5 Nov 2020 06:48:32 -0500
Received: from mailout1.w1.samsung.com ([210.118.77.11]:46049 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729916AbgKELsb (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 5 Nov 2020 06:48:31 -0500
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20201105114820euoutp01a7cf4fd4f4e921d1d89034a32e75e434~EmjCK9A-R0384903849euoutp01O
        for <linux-samsung-soc@vger.kernel.org>; Thu,  5 Nov 2020 11:48:20 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20201105114820euoutp01a7cf4fd4f4e921d1d89034a32e75e434~EmjCK9A-R0384903849euoutp01O
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1604576900;
        bh=o+qqyeKFY/AHvbZPrFMMQVQaRHK9L/AQDhnAjb0kKC0=;
        h=From:To:Cc:Subject:Date:References:From;
        b=XDNsSKiS++2jqRNxXcK5lX4c8NWgQey0cduk75jKVvcFuL4uaqvgGkRtv5l3XO3FZ
         B6FKG0kzA5Pc+LwRenCSES4QjBkzprwSZe0QJhPuIeCYT9WKsfKPqI1ZqiG5inD58Y
         pvJlbKuOMGSXQiDe7FqIwSCZu7ijIJVymfJxMUbg=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20201105114815eucas1p10625b22647fc0ec05b5c4840f80ddd09~Emi9KzpY02968929689eucas1p1B;
        Thu,  5 Nov 2020 11:48:15 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges3new.samsung.com (EUCPMTA) with SMTP id EC.5B.06318.E76E3AF5; Thu,  5
        Nov 2020 11:48:15 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20201105114814eucas1p18d9f11c44eec68738d929ad1a0263482~Emi8oVtYG2562525625eucas1p1P;
        Thu,  5 Nov 2020 11:48:14 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20201105114814eusmtrp100d1de05ba207fe7d641e28db6c93cc4~Emi8mcGW20565005650eusmtrp1z;
        Thu,  5 Nov 2020 11:48:14 +0000 (GMT)
X-AuditID: cbfec7f5-38bff700000018ae-e4-5fa3e67efa55
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id 60.85.06314.E76E3AF5; Thu,  5
        Nov 2020 11:48:14 +0000 (GMT)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20201105114814eusmtip11f72eb994a4ab7467fd700e51015a7f9~Emi8NMiDE1880618806eusmtip1G;
        Thu,  5 Nov 2020 11:48:14 +0000 (GMT)
From:   Marek Szyprowski <m.szyprowski@samsung.com>
To:     linux-samsung-soc@vger.kernel.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Markus Reichl <m.reichl@fivetechno.de>,
        Rob Herring <robh+dt@kernel.org>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH] ARM: dts: exynos: Use fixed index for the MMC devices
Date:   Thu,  5 Nov 2020 12:48:04 +0100
Message-Id: <20201105114804.18326-1-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrHIsWRmVeSWpSXmKPExsWy7djPc7r1zxbHG8y/yGixccZ6VovrX56z
        Wpw/v4Hd4vKuOWwWM87vY7J4eeQHo8XaI3fZLVr3HmF34PC4dafeY9OqTjaPvi2rGD0+b5IL
        YInisklJzcksSy3St0vgytg+/y1TQatCxeN1X5kbGFdLdTFyckgImEh8WvKXvYuRi0NIYAWj
        xPdLi9ggnC+MEt3nbrBCOJ8ZJX4vucsK03Ln+AGoxHJGicV3n7LCtexbuJMJpIpNwFCi620X
        G4gtIqAq8bltAdgSZoEFTBIL20+CJYQF3CSevZoC1sACVHRyThMjiM0rYCux7/Rzdoh18hKr
        NxxgBmmWELjOJnGy9yqQwwHkuEg8Xm8BUSMs8er4Fqh6GYnTk3tYIOqbGSUenlvLDuH0MEpc
        bprBCFFlLXHn3C82kEHMApoS63fpQ8x0lNj7OBXC5JO48VYQpJgZyJy0bTrUVl6JjjYhiBlq
        ErOOr4PbevDCJWYI20Pi9oLnYB8KCcRKnNv2gHECo9wshFULGBlXMYqnlhbnpqcWG+ellusV
        J+YWl+al6yXn525iBKaC0/+Of93BuO9P0iFGAQ5GJR5eB47F8UKsiWXFlbmHGCU4mJVEeJ3O
        no4T4k1JrKxKLcqPLyrNSS0+xCjNwaIkzmu86GWskEB6YklqdmpqQWoRTJaJg1OqgdFmRcT0
        XpnE5bOnTNm5rOZ0/67JWabHrjRWaHpt9eLS7nvdf8Gl2WbiK7WVn3p3frk/NezRuT9Brco9
        tod7UrO3/v9hw6UW3Pa80uWfo0H64rzmufMj397861W89qHcq9icb++VD5gpcF9b/3mLoxNL
        RO5f5fjoCpWU1sQ39h6753FdKgxw0lFiKc5INNRiLipOBABnRZQCAQMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrCLMWRmVeSWpSXmKPExsVy+t/xu7p1zxbHG/Q+lbPYOGM9q8X1L89Z
        Lc6f38BucXnXHDaLGef3MVm8PPKD0WLtkbvsFq17j7A7cHjculPvsWlVJ5tH35ZVjB6fN8kF
        sETp2RTll5akKmTkF5fYKkUbWhjpGVpa6BmZWOoZGpvHWhmZKunb2aSk5mSWpRbp2yXoZWyf
        /5apoFWh4vG6r8wNjKuluhg5OSQETCTuHD/ACmILCSxllPjcZQoRl5E4Oa2BFcIWlvhzrYut
        i5ELqOYTo8TiH0tZQBJsAoYSXW9BEpwcIgKqEp/bFrCDFDELLGOSuP63jR0kISzgJvHs1RQm
        EJsFqOjknCZGEJtXwFZi3+nn7BAb5CVWbzjAPIGRZwEjwypGkdTS4tz03GJDveLE3OLSvHS9
        5PzcTYzAENx27OfmHYyXNgYfYhTgYFTi4XXgWBwvxJpYVlyZe4hRgoNZSYTX6ezpOCHelMTK
        qtSi/Pii0pzU4kOMpkDLJzJLiSbnA+MjryTe0NTQ3MLS0NzY3NjMQkmct0PgYIyQQHpiSWp2
        ampBahFMHxMHp1QDY5Bn6C4DlxOfXtpZiJ19KblU4kKZesIXPdml5w60lW7pU5l4vNXFf/9U
        /7pHR7L39GadjZrobZzMmX9z7jL11Z4yHTkTt0zxWZI44fbfZQkaJs+8+IqTpStZHq93fX37
        RN/mdXMqLTqbUicc9zqtIr2+YKvnS2kriQO8vc3qCi+jJsb1Cq1RV2Ipzkg01GIuKk4EAAHJ
        CblXAgAA
X-CMS-MailID: 20201105114814eucas1p18d9f11c44eec68738d929ad1a0263482
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20201105114814eucas1p18d9f11c44eec68738d929ad1a0263482
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20201105114814eucas1p18d9f11c44eec68738d929ad1a0263482
References: <CGME20201105114814eucas1p18d9f11c44eec68738d929ad1a0263482@eucas1p1.samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Recently introduced asynchronous probe on the MMC devices can shuffle
block IDs in the system. Pin them to values equal to the physical MMC bus
number to ease booting in environments where UUIDs are not practical.

Use newly introduced aliases for mmcblk devices from commit fa2d0aa96941
("mmc: core: Allow setting slot index via device tree alias").

Suggested-by: Markus Reichl <m.reichl@fivetechno.de>
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 arch/arm/boot/dts/exynos3250.dtsi | 3 +++
 arch/arm/boot/dts/exynos4.dtsi    | 2 ++
 arch/arm/boot/dts/exynos4210.dtsi | 1 +
 arch/arm/boot/dts/exynos4412.dtsi | 1 +
 arch/arm/boot/dts/exynos5250.dtsi | 4 ++++
 arch/arm/boot/dts/exynos5260.dtsi | 3 +++
 arch/arm/boot/dts/exynos5410.dtsi | 3 +++
 arch/arm/boot/dts/exynos5420.dtsi | 3 +++
 8 files changed, 20 insertions(+)

diff --git a/arch/arm/boot/dts/exynos3250.dtsi b/arch/arm/boot/dts/exynos3250.dtsi
index 75ed82600ec8..510080bb4102 100644
--- a/arch/arm/boot/dts/exynos3250.dtsi
+++ b/arch/arm/boot/dts/exynos3250.dtsi
@@ -28,6 +28,9 @@
 	aliases {
 		pinctrl0 = &pinctrl_0;
 		pinctrl1 = &pinctrl_1;
+		mmc0 = &mshc_0;
+		mmc1 = &mshc_1;
+		mmc2 = &mshc_2;
 		mshc0 = &mshc_0;
 		mshc1 = &mshc_1;
 		mshc2 = &mshc_2;
diff --git a/arch/arm/boot/dts/exynos4.dtsi b/arch/arm/boot/dts/exynos4.dtsi
index a1e54449f33f..e266f890eea4 100644
--- a/arch/arm/boot/dts/exynos4.dtsi
+++ b/arch/arm/boot/dts/exynos4.dtsi
@@ -45,6 +45,8 @@
 		fimc1 = &fimc_1;
 		fimc2 = &fimc_2;
 		fimc3 = &fimc_3;
+		mmc1 = &sdhci_1;
+		mmc2 = &sdhci_2;
 		serial0 = &serial_0;
 		serial1 = &serial_1;
 		serial2 = &serial_2;
diff --git a/arch/arm/boot/dts/exynos4210.dtsi b/arch/arm/boot/dts/exynos4210.dtsi
index fddc661ded28..f1d0d5959b7f 100644
--- a/arch/arm/boot/dts/exynos4210.dtsi
+++ b/arch/arm/boot/dts/exynos4210.dtsi
@@ -23,6 +23,7 @@
 	compatible = "samsung,exynos4210", "samsung,exynos4";
 
 	aliases {
+		mmc0 = &sdhci_0;
 		pinctrl0 = &pinctrl_0;
 		pinctrl1 = &pinctrl_1;
 		pinctrl2 = &pinctrl_2;
diff --git a/arch/arm/boot/dts/exynos4412.dtsi b/arch/arm/boot/dts/exynos4412.dtsi
index fa8e8d6bc4d5..9fcf7383eb9d 100644
--- a/arch/arm/boot/dts/exynos4412.dtsi
+++ b/arch/arm/boot/dts/exynos4412.dtsi
@@ -28,6 +28,7 @@
 		pinctrl3 = &pinctrl_3;
 		fimc-lite0 = &fimc_lite_0;
 		fimc-lite1 = &fimc_lite_1;
+		mmc0 = &mshc_0;
 		mshc0 = &mshc_0;
 	};
 
diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos5250.dtsi
index 84677332a5a2..0a0436f92fac 100644
--- a/arch/arm/boot/dts/exynos5250.dtsi
+++ b/arch/arm/boot/dts/exynos5250.dtsi
@@ -30,6 +30,10 @@
 		gsc1 = &gsc_1;
 		gsc2 = &gsc_2;
 		gsc3 = &gsc_3;
+		mmc0 = &mmc_0;
+		mmc1 = &mmc_1;
+		mmc2 = &mmc_2;
+		mmc3 = &mmc_3;
 		mshc0 = &mmc_0;
 		mshc1 = &mmc_1;
 		mshc2 = &mmc_2;
diff --git a/arch/arm/boot/dts/exynos5260.dtsi b/arch/arm/boot/dts/exynos5260.dtsi
index 973448c4ad93..64bf1d8dc33b 100644
--- a/arch/arm/boot/dts/exynos5260.dtsi
+++ b/arch/arm/boot/dts/exynos5260.dtsi
@@ -21,6 +21,9 @@
 		i2c1 = &hsi2c_1;
 		i2c2 = &hsi2c_2;
 		i2c3 = &hsi2c_3;
+		mmc0 = &mmc_0;
+		mmc1 = &mmc_1;
+		mmc2 = &mmc_2;
 		pinctrl0 = &pinctrl_0;
 		pinctrl1 = &pinctrl_1;
 		pinctrl2 = &pinctrl_2;
diff --git a/arch/arm/boot/dts/exynos5410.dtsi b/arch/arm/boot/dts/exynos5410.dtsi
index 584ce62361b1..503859153769 100644
--- a/arch/arm/boot/dts/exynos5410.dtsi
+++ b/arch/arm/boot/dts/exynos5410.dtsi
@@ -24,6 +24,9 @@
 		pinctrl1 = &pinctrl_1;
 		pinctrl2 = &pinctrl_2;
 		pinctrl3 = &pinctrl_3;
+		mmc0 = &mmc_0;
+		mmc1 = &mmc_1;
+		mmc2 = &mmc_2;
 	};
 
 	cpus {
diff --git a/arch/arm/boot/dts/exynos5420.dtsi b/arch/arm/boot/dts/exynos5420.dtsi
index 23a8fd5c8a6e..3a3eadd890fb 100644
--- a/arch/arm/boot/dts/exynos5420.dtsi
+++ b/arch/arm/boot/dts/exynos5420.dtsi
@@ -19,6 +19,9 @@
 	compatible = "samsung,exynos5420", "samsung,exynos5";
 
 	aliases {
+		mmc0 = &mmc_0;
+		mmc1 = &mmc_1;
+		mmc2 = &mmc_2;
 		mshc0 = &mmc_0;
 		mshc1 = &mmc_1;
 		mshc2 = &mmc_2;
-- 
2.17.1

