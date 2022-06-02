Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E682C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  2 Jun 2022 05:33:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230105AbiFBFds (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 2 Jun 2022 01:33:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54118 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230106AbiFBFdo (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 2 Jun 2022 01:33:44 -0400
Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 769A61E3009
        for <linux-samsung-soc@vger.kernel.org>; Wed,  1 Jun 2022 22:33:37 -0700 (PDT)
Received: from epcas2p1.samsung.com (unknown [182.195.41.53])
        by mailout3.samsung.com (KnoxPortal) with ESMTP id 20220602053333epoutp03cb0e3cb02b3b29a32103f2673f1251e9~0ttqQ9Gmh1197211972epoutp03i
        for <linux-samsung-soc@vger.kernel.org>; Thu,  2 Jun 2022 05:33:33 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20220602053333epoutp03cb0e3cb02b3b29a32103f2673f1251e9~0ttqQ9Gmh1197211972epoutp03i
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1654148013;
        bh=NBWjWlY2TaMrSi0e6sb5p2UTiyWC5KJi9atCINvmi4Q=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=feurMHa8HIomfQHkgaNL8nbdtR0CBsmB/KInusiUUZZLyu4kbCxIQjq8Z+6JOsPnD
         vBvPVJYOVjXWGpxePEQ29+t/Wf6OxhExYnvYRqcf6+xI+1Yphb8RxJOp4+H4ze5uym
         sBMw+2VjGup9pogl+JtQPEb9avpI5n6QzqFUjzRU=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
        epcas2p2.samsung.com (KnoxPortal) with ESMTP id
        20220602053332epcas2p2bbf486c6d8a18e60912c73062d8f0c6b~0ttpqwDIA2933229332epcas2p2A;
        Thu,  2 Jun 2022 05:33:32 +0000 (GMT)
Received: from epsmges2p4.samsung.com (unknown [182.195.36.99]) by
        epsnrtp2.localdomain (Postfix) with ESMTP id 4LDF6f6pDpz4x9Q7; Thu,  2 Jun
        2022 05:33:30 +0000 (GMT)
Received: from epcas2p2.samsung.com ( [182.195.41.54]) by
        epsmges2p4.samsung.com (Symantec Messaging Gateway) with SMTP id
        5B.1E.09694.AAB48926; Thu,  2 Jun 2022 14:33:30 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
        epcas2p2.samsung.com (KnoxPortal) with ESMTPA id
        20220602053329epcas2p263a77beaaa17d20655bbf55874760054~0ttnLwHC10634006340epcas2p2i;
        Thu,  2 Jun 2022 05:33:29 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
        epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20220602053329epsmtrp138e23b09f86bfc6019ef69ca7834cf06~0ttnKwZkU1619216192epsmtrp1F;
        Thu,  2 Jun 2022 05:33:29 +0000 (GMT)
X-AuditID: b6c32a48-47fff700000025de-ed-62984baab1f5
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
        epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
        36.1E.11276.9AB48926; Thu,  2 Jun 2022 14:33:29 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.9.51]) by
        epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20220602053329epsmtip2cc946e13eac19c236f59e98c88d2b61e~0ttm62US80794307943epsmtip2l;
        Thu,  2 Jun 2022 05:33:29 +0000 (GMT)
From:   Chanho Park <chanho61.park@samsung.com>
To:     Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     devicetree@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Chanho Park <chanho61.park@samsung.com>
Subject: [PATCH v2 6/6] arm64: dts: exynosautov9-sadk: enable secondary ufs
 devices
Date:   Thu,  2 Jun 2022 14:32:50 +0900
Message-Id: <20220602053250.62593-7-chanho61.park@samsung.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220602053250.62593-1-chanho61.park@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrCJsWRmVeSWpSXmKPExsWy7bCmme4q7xlJBj+v81s8mLeNzeLyfm2L
        +UfOsVpceNrDZtH34iGzxd7XW9ktNj2+xmoxYdU3FosZ5/cxWbTuPcJusfPOCWYHbo9NqzrZ
        PO5c28PmsXlJvUffllWMHsdvbGfy+LxJLoAtKtsmIzUxJbVIITUvOT8lMy/dVsk7ON453tTM
        wFDX0NLCXEkhLzE31VbJxSdA1y0zB+g6JYWyxJxSoFBAYnGxkr6dTVF+aUmqQkZ+cYmtUmpB
        Sk6BeYFecWJucWleul5eaomVoYGBkSlQYUJ2xv7ZzxkLtnJWXG76w97AeJO9i5GTQ0LAROLN
        i5dANheHkMAORon7v84wQzifGCX+/tzABuF8Y5Q4+vk8K0xL2/tnYLaQwF5GiYv7ayGKPjJK
        zHnzBizBJqArseX5K0aQhIhAO5PEiXtzwZYwC2xmlDg5YQMzSJWwQKhE46cLYDaLgKrE5AW7
        2EBsXgE7ibuvj0Ktk5fYML8XqIaDg1PAXmLLGQ+IEkGJkzOfsIDYzEAlzVtng90tIdDLIbHo
        9g2oXheJKdfOMELYwhKvjm+B+lpK4mV/G5RdLLF01icmiOYGRonL236xQSSMJWY9a2cEWcws
        oCmxfpc+iCkhoCxx5BbUXj6JjsN/2SHCvBIdbUIQjeoSB7ZPZ4GwZSW653yGusZDonP5M2jw
        TmKU2DLrPtsERoVZSN6ZheSdWQiLFzAyr2IUSy0ozk1PLTYqMIFHcXJ+7iZGcHLV8tjBOPvt
        B71DjEwcjIcYJTiYlUR4S3ZNTRLiTUmsrEotyo8vKs1JLT7EaAoM64nMUqLJ+cD0nlcSb2hi
        aWBiZmZobmRqYK4kzuuVsiFRSCA9sSQ1OzW1ILUIpo+Jg1OqgUmxhP9eSaftKw7vk3cXVHWo
        NnLeU7sjcf/IApaXRo9mMt2tW6qxhLlSJGbRK51lPvsOFj7+NyHrvQVn+d3LK369DHt6ZuFN
        810eO0oCpLdZ/+v02aVfLlW8f+MdTe7CuRwfTOXFXd5d59dvWM68M8Z++pPDacdf5T69Fh/O
        PDl8wvRrZ7jnMlUk57ZEiHM3nT/6eI/LvValiv7pGrfrSnyMNG+c5ovoe/NhSnrDZqXInAnb
        tvnmzTJ/NGPnvGypuo1VrHG3Vnib6ZV+es1VMeGwyrLsVaaBMxKa+6uD7j2zN5rQOvHOGh9T
        mRhvU/EN8ueN/2Rt85l/cPMlR857L1wuJhy8IfPrmZxFmGa0oLoSS3FGoqEWc1FxIgCOuorY
        NwQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrLLMWRmVeSWpSXmKPExsWy7bCSvO5K7xlJBjPfKVk8mLeNzeLyfm2L
        +UfOsVpceNrDZtH34iGzxd7XW9ktNj2+xmoxYdU3FosZ5/cxWbTuPcJusfPOCWYHbo9NqzrZ
        PO5c28PmsXlJvUffllWMHsdvbGfy+LxJLoAtissmJTUnsyy1SN8ugStj/+znjAVbOSsuN/1h
        b2C8yd7FyMkhIWAi0fb+GSuILSSwm1Fi11o2iLisxLN3O6BqhCXutxwBquECqnnPKHFv339G
        kASbgK7EluevGEESIgLdTBJzNvUzgTjMAtsZJT4sXcfSxcjBISwQLPHhugNIA4uAqsTkBbvA
        NvAK2EncfX2UFWKDvMSG+b3MIOWcAvYSW854QBxkJ7H58gZWiHJBiZMzn7CA2MxA5c1bZzNP
        YBSYhSQ1C0lqASPTKkbJ1ILi3PTcYsMCw7zUcr3ixNzi0rx0veT83E2M4BjQ0tzBuH3VB71D
        jEwcjIcYJTiYlUR4S3ZNTRLiTUmsrEotyo8vKs1JLT7EKM3BoiTOe6HrZLyQQHpiSWp2ampB
        ahFMlomDU6qBKc1TJDp208RMmQccr253X3u2YG9oQHWpErfWovT+Jyd/9ifVlTHI3MmLdldm
        PRPO5Vias6zme8KefxME2UWmrlizJWNti1r9zbsXN3fx3+IVvm3sp2H8waBE//F3r47b/E1s
        37cL11Ur6D8/X3Ciq/ds/BK99w9u39l5aMaeMg11rqLa+Ef6S36W+JZstpBk+xtmfHXvxMn2
        Ld6fm7eVBO6fXHjgjcO7VhPHHXI7zG0qGzlVeUUSDHSn/dxb/Fd8/+zXcj80m5QyrE2L3mop
        zjc/xWj+bPHidkMegcUvdvDbbT7kn3C29Mbm99af5Bl4d95erjX749mr3AftCtJeuL/qLXW9
        /z5D/tXaWxZWSizFGYmGWsxFxYkAAd4Ag/ACAAA=
X-CMS-MailID: 20220602053329epcas2p263a77beaaa17d20655bbf55874760054
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20220602053329epcas2p263a77beaaa17d20655bbf55874760054
References: <20220602053250.62593-1-chanho61.park@samsung.com>
        <CGME20220602053329epcas2p263a77beaaa17d20655bbf55874760054@epcas2p2.samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Enable ufs_1_phy and ufs_1 devices with ufs_1_fixed_vcc_reg regulator.

Signed-off-by: Chanho Park <chanho61.park@samsung.com>
---
 .../boot/dts/exynos/exynosautov9-sadk.dts      | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynosautov9-sadk.dts b/arch/arm64/boot/dts/exynos/exynosautov9-sadk.dts
index 17e568853eb6..2b30a7458297 100644
--- a/arch/arm64/boot/dts/exynos/exynosautov9-sadk.dts
+++ b/arch/arm64/boot/dts/exynos/exynosautov9-sadk.dts
@@ -39,6 +39,14 @@ ufs_0_fixed_vcc_reg: regulator-0 {
 		regulator-boot-on;
 		enable-active-high;
 	};
+
+	ufs_1_fixed_vcc_reg: regulator-1 {
+		compatible = "regulator-fixed";
+		regulator-name = "ufs-vcc";
+		gpio = <&gpg2 2 GPIO_ACTIVE_HIGH>;
+		regulator-boot-on;
+		enable-active-high;
+	};
 };
 
 &serial_0 {
@@ -49,12 +57,22 @@ &ufs_0_phy {
 	status = "okay";
 };
 
+&ufs_1_phy {
+	status = "okay";
+};
+
 &ufs_0 {
 	status = "okay";
 	vcc-supply = <&ufs_0_fixed_vcc_reg>;
 	vcc-fixed-regulator;
 };
 
+&ufs_1 {
+	status = "okay";
+	vcc-supply = <&ufs_1_fixed_vcc_reg>;
+	vcc-fixed-regulator;
+};
+
 &usi_0 {
 	status = "okay";
 };
-- 
2.36.1

