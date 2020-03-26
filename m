Return-Path: <SRS0=zaGS=5L=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43802C43331
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 26 Mar 2020 14:39:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0D31D206F8
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 26 Mar 2020 14:39:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="Lz1UvlRX"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726340AbgCZOja (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 26 Mar 2020 10:39:30 -0400
Received: from mailout1.w1.samsung.com ([210.118.77.11]:35674 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727612AbgCZOja (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 26 Mar 2020 10:39:30 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20200326143928euoutp0165bfc74025eb9035ed05cbded526acd9~-4YgKpdrp2933929339euoutp01V
        for <linux-samsung-soc@vger.kernel.org>; Thu, 26 Mar 2020 14:39:28 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20200326143928euoutp0165bfc74025eb9035ed05cbded526acd9~-4YgKpdrp2933929339euoutp01V
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1585233568;
        bh=/9mJ9DEW6jOBwx2pkN7iLxUxTbFE36d2XqrLPSrjWjM=;
        h=From:To:Cc:Subject:Date:References:From;
        b=Lz1UvlRX4D+QM7sE26+Jzteqj4lAYjY2iRjetmK6DIPX83tubN6p/8BydFAc5kvGn
         TD7Bel3NHJSyoBB2cc2D0znQK5m/vU7NF87L5GmBTyDbwhyzVFcI1ktF/aWbsGEn9e
         SV8uaAlZMj1xm/RfO2T2JsvYLZra7K9wrcUEj0wc=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20200326143928eucas1p24954f07fb031774e51b83b5ea2a0d9be~-4Yf67Sxm3122331223eucas1p2S;
        Thu, 26 Mar 2020 14:39:28 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges2new.samsung.com (EUCPMTA) with SMTP id 73.9E.60679.F9EBC7E5; Thu, 26
        Mar 2020 14:39:27 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20200326143927eucas1p2f9c85d3eaf4beaf07d0ff55a9be768a9~-4YfivSLa3122331223eucas1p2R;
        Thu, 26 Mar 2020 14:39:27 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20200326143927eusmtrp2b0039440a0c0453ea5b9c20b7633f50f~-4YfiJ2my3054530545eusmtrp2Q;
        Thu, 26 Mar 2020 14:39:27 +0000 (GMT)
X-AuditID: cbfec7f4-0e5ff7000001ed07-12-5e7cbe9fc9a0
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id A2.DF.07950.F9EBC7E5; Thu, 26
        Mar 2020 14:39:27 +0000 (GMT)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20200326143927eusmtip134917b24fe18a66b5d1e3d1cba1e7ca7~-4YfQb0Xb2586025860eusmtip1W;
        Thu, 26 Mar 2020 14:39:27 +0000 (GMT)
From:   Marek Szyprowski <m.szyprowski@samsung.com>
To:     linux-samsung-soc@vger.kernel.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: [PATCH] ARM: dts: exynos: Convert to new i2c-gpio bindings
Date:   Thu, 26 Mar 2020 15:39:09 +0100
Message-Id: <20200326143909.21798-1-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrLIsWRmVeSWpSXmKPExsWy7djP87rz99XEGdxYYGGxccZ6VovrX56z
        Wpw/v4HdYsb5fUwWa4/cZXdg9di0qpPNo2/LKkaPz5vkApijuGxSUnMyy1KL9O0SuDJ2bLjN
        UtCrV/Hh/AH2Bsblal2MnBwSAiYS75ZsZO5i5OIQEljBKLF39lIo5wujRM+e2awQzmdGiclf
        NjHBtJxZupQRIrGcUeLUj0VscC3b/n5gA6liEzCU6HrbBWaLCKhKfG5bwA5SxCywjVFiS+8D
        ZpCEsICzxOZfy1hBbBagomvnZrOD2LwCthLb3z9mhFgnL7F6wwGwoyQEdrBJPJoxkRki4SLR
        +fUXC4QtLPHq+BZ2CFtG4v/O+UwQDc2MEg/PrWWHcHoYJS43zYAaay1x59wvoPs4gG7SlFi/
        Sx8i7Chx7/wndpCwhACfxI23giBhZiBz0rbpzBBhXomONiGIajWJWcfXwa09eOES1GkeEhse
        3QezhQRiJT7/3ck+gVFuFsKuBYyMqxjFU0uLc9NTi43yUsv1ihNzi0vz0vWS83M3MQIj/fS/
        4192MO76k3SIUYCDUYmHV6OlJk6INbGsuDL3EKMEB7OSCO/TSKAQb0piZVVqUX58UWlOavEh
        RmkOFiVxXuNFL2OFBNITS1KzU1MLUotgskwcnFINjNx1QefO5dauzLty0aLavrWnS29BkvJr
        EQFph8jti1qnyU39Vf3WJXXSK+PICUfudLRObFznoHF7P0dOevS8LXKhi8xrbL7PX/KG16JE
        iP+n1T7Ts3v/rn3qfPf42eWzqz6HnYjl2Gab9ercv4nrnzBtvLRfSde8JnbjJ7uVa7sTIj8d
        zJXYf0yJpTgj0VCLuag4EQA2p7/o8AIAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrELMWRmVeSWpSXmKPExsVy+t/xu7rz99XEGTw5q2SxccZ6VovrX56z
        Wpw/v4HdYsb5fUwWa4/cZXdg9di0qpPNo2/LKkaPz5vkApij9GyK8ktLUhUy8otLbJWiDS2M
        9AwtLfSMTCz1DI3NY62MTJX07WxSUnMyy1KL9O0S9DJ2bLjNUtCrV/Hh/AH2Bsblal2MnBwS
        AiYSZ5YuZexi5OIQEljKKDF3x0J2iISMxMlpDawQtrDEn2tdbBBFnxglGmduZQZJsAkYSnS9
        BUlwcogIqEp8blvADlLELLCDUWLLjrdg3cICzhKbfy0Ds1mAiq6dmw22gVfAVmL7+8eMEBvk
        JVZvOMA8gZFnASPDKkaR1NLi3PTcYiO94sTc4tK8dL3k/NxNjMDw2nbs55YdjF3vgg8xCnAw
        KvHwarTUxAmxJpYVV+YeYpTgYFYS4X0aCRTiTUmsrEotyo8vKs1JLT7EaAq0fCKzlGhyPjD0
        80riDU0NzS0sDc2NzY3NLJTEeTsEDsYICaQnlqRmp6YWpBbB9DFxcEo1MLrpv5o0/4n+S85n
        ZzyX7traEL5t+Zrve3Ze71Of+US+7dmZBmWn313PKj2yDzty/7oh6i/RluScfGHzxJ3hr5pP
        rFmpanBrp+l8k/9v7nA9PTVftmfVppsPPv1PzGzrnKX7UDFN8l+PU9ccFce0/qy3F22+aoWv
        b5liPevG2pyc+dJTX93rejZbiaU4I9FQi7moOBEArFXVNUUCAAA=
X-CMS-MailID: 20200326143927eucas1p2f9c85d3eaf4beaf07d0ff55a9be768a9
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20200326143927eucas1p2f9c85d3eaf4beaf07d0ff55a9be768a9
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200326143927eucas1p2f9c85d3eaf4beaf07d0ff55a9be768a9
References: <CGME20200326143927eucas1p2f9c85d3eaf4beaf07d0ff55a9be768a9@eucas1p2.samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The updated "i2c-gpio" driver bindings require to define the SDA and SCL
GPIO lines in the separate properties and mark both as GPIO_OPEN_DRAIN.
Covert all Exynos dts files to follow this style.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 arch/arm/boot/dts/exynos3250-monk.dts           | 3 ++-
 arch/arm/boot/dts/exynos3250-rinato.dts         | 3 ++-
 arch/arm/boot/dts/exynos4210-i9100.dts          | 4 ++--
 arch/arm/boot/dts/exynos4210-universal_c210.dts | 3 ++-
 arch/arm/boot/dts/exynos4412-galaxy-s3.dtsi     | 6 ++++--
 arch/arm/boot/dts/exynos4412-midas.dtsi         | 9 ++++++---
 arch/arm/boot/dts/exynos5250-arndale.dts        | 5 ++---
 7 files changed, 20 insertions(+), 13 deletions(-)

diff --git a/arch/arm/boot/dts/exynos3250-monk.dts b/arch/arm/boot/dts/exynos3250-monk.dts
index 248bd372fe70..ca29d7ed8216 100644
--- a/arch/arm/boot/dts/exynos3250-monk.dts
+++ b/arch/arm/boot/dts/exynos3250-monk.dts
@@ -57,7 +57,8 @@
 
 	i2c_max77836: i2c-gpio-0 {
 		compatible = "i2c-gpio";
-		gpios = <&gpd0 2 GPIO_ACTIVE_HIGH>, <&gpd0 3 GPIO_ACTIVE_HIGH>;
+		sda-gpios = <&gpd0 2 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+		scl-gpios = <&gpd0 3 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
 		#address-cells = <1>;
 		#size-cells = <0>;
 
diff --git a/arch/arm/boot/dts/exynos3250-rinato.dts b/arch/arm/boot/dts/exynos3250-rinato.dts
index e511f1726182..5f4e8f5a8b96 100644
--- a/arch/arm/boot/dts/exynos3250-rinato.dts
+++ b/arch/arm/boot/dts/exynos3250-rinato.dts
@@ -57,7 +57,8 @@
 
 	i2c_max77836: i2c-gpio-0 {
 		compatible = "i2c-gpio";
-		gpios = <&gpd0 2 GPIO_ACTIVE_HIGH>, <&gpd0 3 GPIO_ACTIVE_HIGH>;
+		sda-gpios = <&gpd0 2 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+		scl-gpios = <&gpd0 3 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
 		#address-cells = <1>;
 		#size-cells = <0>;
 
diff --git a/arch/arm/boot/dts/exynos4210-i9100.dts b/arch/arm/boot/dts/exynos4210-i9100.dts
index a4147113f0c4..6d0c04d77a39 100644
--- a/arch/arm/boot/dts/exynos4210-i9100.dts
+++ b/arch/arm/boot/dts/exynos4210-i9100.dts
@@ -128,8 +128,8 @@
 		#address-cells = <1>;
 		#size-cells = <0>;
 
-		sda-gpios = <&gpy4 0 GPIO_ACTIVE_HIGH>;
-		scl-gpios = <&gpy4 1 GPIO_ACTIVE_HIGH>;
+		sda-gpios = <&gpy4 0 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+		scl-gpios = <&gpy4 1 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
 		i2c-gpio,delay-us = <5>;
 
 		battery@36 {
diff --git a/arch/arm/boot/dts/exynos4210-universal_c210.dts b/arch/arm/boot/dts/exynos4210-universal_c210.dts
index 3f8abb7428ab..5c150a347ff9 100644
--- a/arch/arm/boot/dts/exynos4210-universal_c210.dts
+++ b/arch/arm/boot/dts/exynos4210-universal_c210.dts
@@ -170,7 +170,8 @@
 
 	hdmi_ddc: i2c-ddc {
 		compatible = "i2c-gpio";
-		gpios = <&gpe4 2 GPIO_ACTIVE_HIGH &gpe4 3 GPIO_ACTIVE_HIGH>;
+		sda-gpios = <&gpe4 2 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+		scl-gpios = <&gpe4 3 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
 		i2c-gpio,delay-us = <100>;
 		#address-cells = <1>;
 		#size-cells = <0>;
diff --git a/arch/arm/boot/dts/exynos4412-galaxy-s3.dtsi b/arch/arm/boot/dts/exynos4412-galaxy-s3.dtsi
index f910aa924bfb..53b3ca3effab 100644
--- a/arch/arm/boot/dts/exynos4412-galaxy-s3.dtsi
+++ b/arch/arm/boot/dts/exynos4412-galaxy-s3.dtsi
@@ -53,7 +53,8 @@
 
 	i2c_ak8975: i2c-gpio-0 {
 		compatible = "i2c-gpio";
-		gpios = <&gpy2 4 GPIO_ACTIVE_HIGH>, <&gpy2 5 GPIO_ACTIVE_HIGH>;
+		sda-gpios = <&gpy2 4 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+		scl-gpios = <&gpy2 5 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
 		i2c-gpio,delay-us = <2>;
 		#address-cells = <1>;
 		#size-cells = <0>;
@@ -68,7 +69,8 @@
 
 	i2c_cm36651: i2c-gpio-2 {
 		compatible = "i2c-gpio";
-		gpios = <&gpf0 0 GPIO_ACTIVE_HIGH>, <&gpf0 1 GPIO_ACTIVE_HIGH>;
+		sda-gpios = <&gpf0 0 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+		scl-gpios = <&gpf0 1 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
 		i2c-gpio,delay-us = <2>;
 		#address-cells = <1>;
 		#size-cells = <0>;
diff --git a/arch/arm/boot/dts/exynos4412-midas.dtsi b/arch/arm/boot/dts/exynos4412-midas.dtsi
index aa20396ae543..2c8111c6b065 100644
--- a/arch/arm/boot/dts/exynos4412-midas.dtsi
+++ b/arch/arm/boot/dts/exynos4412-midas.dtsi
@@ -140,7 +140,8 @@
 
 	i2c_max77693: i2c-gpio-1 {
 		compatible = "i2c-gpio";
-		gpios = <&gpm2 0 GPIO_ACTIVE_HIGH>, <&gpm2 1 GPIO_ACTIVE_HIGH>;
+		sda-gpios = <&gpm2 0 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+		scl-gpios = <&gpm2 1 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
 		i2c-gpio,delay-us = <2>;
 		#address-cells = <1>;
 		#size-cells = <0>;
@@ -188,7 +189,8 @@
 
 	i2c_max77693_fuel: i2c-gpio-3 {
 		compatible = "i2c-gpio";
-		gpios = <&gpf1 5 GPIO_ACTIVE_HIGH>, <&gpf1 4 GPIO_ACTIVE_HIGH>;
+		sda-gpios = <&gpf1 5 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+		scl-gpios = <&gpf1 4 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
 		i2c-gpio,delay-us = <2>;
 		#address-cells = <1>;
 		#size-cells = <0>;
@@ -228,7 +230,8 @@
 
 	i2c-mhl {
 		compatible = "i2c-gpio";
-		gpios = <&gpf0 4 GPIO_ACTIVE_HIGH>, <&gpf0 6 GPIO_ACTIVE_HIGH>;
+		sda-gpios = <&gpf0 4 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+		scl-gpios = <&gpf0 6 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
 		i2c-gpio,delay-us = <100>;
 		#address-cells = <1>;
 		#size-cells = <0>;
diff --git a/arch/arm/boot/dts/exynos5250-arndale.dts b/arch/arm/boot/dts/exynos5250-arndale.dts
index dbf3d8167fe6..c4cc7611898c 100644
--- a/arch/arm/boot/dts/exynos5250-arndale.dts
+++ b/arch/arm/boot/dts/exynos5250-arndale.dts
@@ -641,9 +641,8 @@
 		pinctrl-0 = <&i2c2_gpio_bus>;
 		status = "okay";
 		compatible = "i2c-gpio";
-		gpios = <&gpa0 6 0 /* sda */
-			 &gpa0 7 0 /* scl */
-			>;
+		sda-gpios = <&gpa0 6 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+		scl-gpios = <&gpa0 7 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
 		i2c-gpio,delay-us = <2>;
 		#address-cells = <1>;
 		#size-cells = <0>;
-- 
2.17.1

