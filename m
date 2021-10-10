Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F00E4C4167B
	for <linux-samsung-soc@archiver.kernel.org>; Sun, 10 Oct 2021 03:25:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D88E3606A5
	for <linux-samsung-soc@archiver.kernel.org>; Sun, 10 Oct 2021 03:25:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229792AbhJJD1G (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sat, 9 Oct 2021 23:27:06 -0400
Received: from mailout2.samsung.com ([203.254.224.25]:24523 "EHLO
        mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229895AbhJJD1E (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 9 Oct 2021 23:27:04 -0400
Received: from epcas2p1.samsung.com (unknown [182.195.41.53])
        by mailout2.samsung.com (KnoxPortal) with ESMTP id 20211010032504epoutp02fb17ee321c211f80115b51718c1cdb02~sjXZzpSO30541505415epoutp023
        for <linux-samsung-soc@vger.kernel.org>; Sun, 10 Oct 2021 03:25:04 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20211010032504epoutp02fb17ee321c211f80115b51718c1cdb02~sjXZzpSO30541505415epoutp023
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1633836304;
        bh=L6NMxTUF4a1Urvf9vrvwYkd2ZglWGRkKNPGh+IcqlZE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=b1oAFh7kpwk6yPQ9g7OtPQuxRVSqzKlnp+oia+nQx0nLELudn8c57KterW0YjH3sS
         HnnhdlYkdwS3XLuw9X5Rp4Pa08Zv66O+PfybM8NZgpSF6XUVXRZR9XIYXglp9RLjE+
         dQhQ0JxTCQu5HOQBhwWbEmtx9QKxrTv/YBq0X7M8=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
        epcas2p3.samsung.com (KnoxPortal) with ESMTP id
        20211010032503epcas2p38cd1fd8d75ba70360e7a8ceee05c69c9~sjXYag33Z3202032020epcas2p3C;
        Sun, 10 Oct 2021 03:25:03 +0000 (GMT)
Received: from epsmges2p1.samsung.com (unknown [182.195.36.89]) by
        epsnrtp3.localdomain (Postfix) with ESMTP id 4HRnNp4vJsz4x9Pr; Sun, 10 Oct
        2021 03:24:58 +0000 (GMT)
Received: from epcas2p4.samsung.com ( [182.195.41.56]) by
        epsmges2p1.samsung.com (Symantec Messaging Gateway) with SMTP id
        FB.71.09717.A0D52616; Sun, 10 Oct 2021 12:24:58 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
        epcas2p1.samsung.com (KnoxPortal) with ESMTPA id
        20211010032456epcas2p15f951954f7bc7ca505806fdcea4e6390~sjXSdU2OA0747107471epcas2p1K;
        Sun, 10 Oct 2021 03:24:56 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
        epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20211010032456epsmtrp16dbdeb4c0eb61f64d9b34c70933ffc11~sjXSaDi_S3229632296epsmtrp1T;
        Sun, 10 Oct 2021 03:24:56 +0000 (GMT)
X-AuditID: b6c32a45-4c1ff700000025f5-e9-61625d0a0800
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
        epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
        E7.85.08750.80D52616; Sun, 10 Oct 2021 12:24:56 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.9.51]) by
        epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20211010032456epsmtip28ea6e31a359ae13cbc28304b7d083e46~sjXSRUfMG1204912049epsmtip2z;
        Sun, 10 Oct 2021 03:24:56 +0000 (GMT)
From:   Chanho Park <chanho61.park@samsung.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Tomasz Figa <tomasz.figa@gmail.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Chanho Park <chanho61.park@samsung.com>
Subject: [PATCH v3 3/3] arm64: dts: exynos: add minimal support for
 exynosautov9 sadk board
Date:   Sun, 10 Oct 2021 12:22:46 +0900
Message-Id: <20211010032246.146939-4-chanho61.park@samsung.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211010032246.146939-1-chanho61.park@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprMJsWRmVeSWpSXmKPExsWy7bCmhS5XbFKiwcN7ghaX92tbzD9yjtVi
        49sfTBZT/ixnsphxfh+TReveI+wWh9+0s1qs2vWH0YHDY1ZDL5vHzll32T02repk87hzbQ+b
        R9+WVYwenzfJBbBFZdtkpCampBYppOYl56dk5qXbKnkHxzvHm5oZGOoaWlqYKynkJeam2iq5
        +AToumXmAN2jpFCWmFMKFApILC5W0rezKcovLUlVyMgvLrFVSi1IySkwL9ArTswtLs1L18tL
        LbEyNDAwMgUqTMjO2HtbraBRouLX3rvsDYxHhLsYOTkkBEwkvlxuZQWxhQR2MEos2uncxcgF
        ZH9ilLh2ZgobROIzo8Tlt+UwDRcmfmOEKNrFKHF/eTczhPMRqGP+VLAONgFdiS3PX4FViQh0
        Mkqs/LaNCSTBLHCAUWLLBTsQW1ggVqL9xT52EJtFQFVi65MFYM28AvYSKxfNYYZYJy9x5Fcn
        mM0p4CAxoeseM0SNoMTJmU9YIGbKSzRvnQ12hYTAV3aJlS8nsEE0u0h87f4IZQtLvDq+hR3C
        lpJ42d/GDtHQzSjR+ug/VGI1o0Rnow+EbS/xa/oWYMhwAG3QlFi/Sx/ElBBQljhyC2ovn0TH
        4b/sEGFeiY42IYhGdYkD26ezQNiyEt1zPrNC2B4Sbx98hYboZEaJTVvkJzAqzELyzSwk38xC
        2LuAkXkVo1hqQXFuemqxUYEhPH6T83M3MYJTp5brDsbJbz/oHWJk4mA8xCjBwawkwqtlkpgo
        xJuSWFmVWpQfX1Sak1p8iNEUGNYTmaVEk/OByTuvJN7QxNLAxMzM0NzI1MBcSZx37j+nRCGB
        9MSS1OzU1ILUIpg+Jg5OqQam2BNnD1m9WHjkyvNVPr3HzEUeF6U2OfJqfWtsmHqeJ3mG5uHH
        T74p8AmUB2g9TjbgZnhm+Jr539272664+eTLbc4KKp/9lkVL3pB/puez3cZKsbmmV5IuTo7o
        MHpyqPvWzrqUG6vncnMKvlZjlmx+tqdmynfZhhpV44UOSzR2CNlJdh75Y3njuWTebvNJ66K0
        di/ZsT6Y7UGU1Oq77X+l4xYeit109c1l2+8ma1Yr/D7lohdxxnChqzWDWN+C37sYp7hW+Dd3
        WIQvf3Ip79nRC3UP4yNSmn7wsKX/3d65O8FbWGrDi5czqjTfivipZG6YNLejLbLh4l6pd1x3
        Tufw/0liXjV1od0t4akWh398V2Ipzkg01GIuKk4EAClktJ8mBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrILMWRmVeSWpSXmKPExsWy7bCSvC5HbFKiQdNUXYvL+7Ut5h85x2qx
        8e0PJospf5YzWcw4v4/JonXvEXaLw2/aWS1W7frD6MDhMauhl81j56y77B6bVnWyedy5tofN
        o2/LKkaPz5vkAtiiuGxSUnMyy1KL9O0SuDL23lYraJSo+LX3LnsD4xHhLkZODgkBE4kLE78x
        djFycQgJ7GCU+LHxKTNEQlbi2bsd7BC2sMT9liOsEEXvGSUuvbrCApJgE9CV2PL8FVi3iEA3
        o0R/Yy8TiMMscIRR4v/3X2BVwgLREnemTAYbxSKgKrH1yQI2EJtXwF5i5aI5UOvkJY786gSz
        OQUcJCZ03QOzhYBqetY/YYKoF5Q4OfMJ2ExmoPrmrbOZJzAKzEKSmoUktYCRaRWjZGpBcW56
        brFhgVFearlecWJucWleul5yfu4mRnCoa2ntYNyz6oPeIUYmDsZDjBIczEoivFomiYlCvCmJ
        lVWpRfnxRaU5qcWHGKU5WJTEeS90nYwXEkhPLEnNTk0tSC2CyTJxcEo1MHUrPFtxUI5n5XlR
        g8ik+C+e5mVSnx2Wzul1Wmk8s0Wh2rZB8Hua/SMxpscbnrKslPy/PvUp56e/H7T2vDhew9c0
        69PLJd8UwjXk1wS5JpR7f9x2QS306sH89Z9VGm7+3GCSbDctwqxjYvr1P5pTU1UqrG7E2y1N
        mDZ1bfAvK/H2f4e9GxvLN1UsqMvYaKDmKMrlab0k4sPF2avf35vpb+bwLaL/uP9Gu6wV7+fo
        rJJZUvhBbfXlkuu71p8z2fDy2dnnCjtEOl/f4srffUv2wbQ+ztWBnA+fFB2QZalMTN0u7bJE
        LEZGt8lLZffWZSdzfs0RePQz/nnHwkJx91XfGN+Hf51h+Oxt2PRmqa+7151VYinOSDTUYi4q
        TgQAlODb1uQCAAA=
X-CMS-MailID: 20211010032456epcas2p15f951954f7bc7ca505806fdcea4e6390
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20211010032456epcas2p15f951954f7bc7ca505806fdcea4e6390
References: <20211010032246.146939-1-chanho61.park@samsung.com>
        <CGME20211010032456epcas2p15f951954f7bc7ca505806fdcea4e6390@epcas2p1.samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

SADK(Samsung Automotive Development Kit) is the development kit to
evaluate Exynos Auto v9 SoC. It has 16GB LPDDR4 DRAM and two
256GB Samsung UFS. This patch enables only serial console and ufs0
device.

Signed-off-by: Chanho Park <chanho61.park@samsung.com>
---
 .../bindings/arm/samsung/samsung-boards.yaml  |  6 ++
 arch/arm64/boot/dts/exynos/Makefile           |  3 +-
 .../boot/dts/exynos/exynosautov9-sadk.dts     | 56 +++++++++++++++++++
 3 files changed, 64 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm64/boot/dts/exynos/exynosautov9-sadk.dts

diff --git a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
index 0796f0c87727..ef6dc14be4b5 100644
--- a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
+++ b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
@@ -199,6 +199,12 @@ properties:
               - samsung,exynos7-espresso        # Samsung Exynos7 Espresso
           - const: samsung,exynos7
 
+      - description: Exynos Auto v9 based boards
+        items:
+          - enum:
+              - samsung,exynosautov9-sadk   # Samsung Exynos Auto v9 SADK
+          - const: samsung,exynosautov9
+
 required:
   - compatible
 
diff --git a/arch/arm64/boot/dts/exynos/Makefile b/arch/arm64/boot/dts/exynos/Makefile
index e0a2facde6a2..b41e86df0a84 100644
--- a/arch/arm64/boot/dts/exynos/Makefile
+++ b/arch/arm64/boot/dts/exynos/Makefile
@@ -2,4 +2,5 @@
 dtb-$(CONFIG_ARCH_EXYNOS) += \
 	exynos5433-tm2.dtb	\
 	exynos5433-tm2e.dtb	\
-	exynos7-espresso.dtb
+	exynos7-espresso.dtb	\
+	exynosautov9-sadk.dtb
diff --git a/arch/arm64/boot/dts/exynos/exynosautov9-sadk.dts b/arch/arm64/boot/dts/exynos/exynosautov9-sadk.dts
new file mode 100644
index 000000000000..ef46d7aa6e28
--- /dev/null
+++ b/arch/arm64/boot/dts/exynos/exynosautov9-sadk.dts
@@ -0,0 +1,56 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Samsung ExynosAutov9 SADK board device tree source
+ *
+ * Copyright (c) 2021 Samsung Electronics Co., Ltd.
+ *
+ */
+
+/dts-v1/;
+#include "exynosautov9.dtsi"
+#include <dt-bindings/gpio/gpio.h>
+
+/ {
+	model = "Samsung ExynosAuto v9 SADK board";
+	compatible = "samsung,exynosautov9-sadk", "samsung,exynosautov9";
+
+	#address-cells = <2>;
+	#size-cells = <2>;
+
+	aliases {
+		serial0 = &serial_0;
+	};
+
+	chosen {
+		stdout-path = &serial_0;
+	};
+
+	memory@80000000 {
+		device_type = "memory";
+		reg = <0x0 0x80000000 0x0 0x77000000>,
+		      <0x8 0x80000000 0x1 0x7ba00000>,
+		      <0xa 0x00000000 0x2 0x00000000>;
+	};
+
+	ufs_0_fixed_vcc_reg: regulator-0 {
+		compatible = "regulator-fixed";
+		regulator-name = "ufs-vcc";
+		gpio = <&gpq0 1 GPIO_ACTIVE_HIGH>;
+		regulator-boot-on;
+		enable-active-high;
+	};
+};
+
+&serial_0 {
+	status = "okay";
+};
+
+&ufs_0_phy {
+	status = "okay";
+};
+
+&ufs_0 {
+	status = "okay";
+	vcc-supply = <&ufs_0_fixed_vcc_reg>;
+	vcc-fixed-regulator;
+};
-- 
2.33.0

