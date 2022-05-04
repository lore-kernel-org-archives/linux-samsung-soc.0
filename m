Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEA4AC4167B
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  4 May 2022 07:50:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345784AbiEDHyQ (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 4 May 2022 03:54:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51464 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345778AbiEDHxw (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 4 May 2022 03:53:52 -0400
Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CDA93C26
        for <linux-samsung-soc@vger.kernel.org>; Wed,  4 May 2022 00:50:14 -0700 (PDT)
Received: from epcas2p4.samsung.com (unknown [182.195.41.56])
        by mailout4.samsung.com (KnoxPortal) with ESMTP id 20220504075010epoutp044cc43497fd538da47248cc77375c5877~r13rFX3ty2258022580epoutp04B
        for <linux-samsung-soc@vger.kernel.org>; Wed,  4 May 2022 07:50:10 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20220504075010epoutp044cc43497fd538da47248cc77375c5877~r13rFX3ty2258022580epoutp04B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1651650610;
        bh=FgfNaRGrbsEvxgBKZLppqnMPQHFUIbURSVcXK6pr3Bk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=VsMBLpdrIIErN6wuGpOXUJmU+wKZWQ6k/8YsMNQK/CeHbczFK69y2Api7FofqIm89
         xOw18PWObtvPKs++jkmewOGi3N8wREf3rRD+U9Xw1g5WNetngwL8m0FXXLiWYU7Rrg
         ESS7aQH0O892ZFoeoMsUgFdrS55vFX5RUJ31QiDU=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
        epcas2p4.samsung.com (KnoxPortal) with ESMTP id
        20220504075010epcas2p441c1c73510a4974b544ed36eb5f0fa44~r13qinCJo1700717007epcas2p4u;
        Wed,  4 May 2022 07:50:10 +0000 (GMT)
Received: from epsmges2p1.samsung.com (unknown [182.195.36.70]) by
        epsnrtp2.localdomain (Postfix) with ESMTP id 4KtTWf5XN0z4x9Q3; Wed,  4 May
        2022 07:50:06 +0000 (GMT)
Received: from epcas2p4.samsung.com ( [182.195.41.56]) by
        epsmges2p1.samsung.com (Symantec Messaging Gateway) with SMTP id
        AB.E4.10069.C2032726; Wed,  4 May 2022 16:50:05 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
        epcas2p4.samsung.com (KnoxPortal) with ESMTPA id
        20220504075004epcas2p44c3c0246988d133a5da1fdfd2f17d0b9~r13ldif-21669516695epcas2p4L;
        Wed,  4 May 2022 07:50:04 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
        epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20220504075004epsmtrp1b1044812757aaf6b5b8dc1567a2de958~r13lazGs-2992129921epsmtrp1Z;
        Wed,  4 May 2022 07:50:04 +0000 (GMT)
X-AuditID: b6c32a45-a79ff70000002755-55-6272302c523b
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
        epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
        DC.EB.08924.C2032726; Wed,  4 May 2022 16:50:04 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.9.51]) by
        epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20220504075004epsmtip1536b2f92d9f0381111be15c7028449cb~r13lQdxCl2352523525epsmtip1h;
        Wed,  4 May 2022 07:50:04 +0000 (GMT)
From:   Chanho Park <chanho61.park@samsung.com>
To:     Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Sam Protsenko <semen.protsenko@linaro.org>,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org,
        Chanho Park <chanho61.park@samsung.com>
Subject: [PATCH v3 10/12] arm64: dts: exynosautov9: add initial cmu clock
 nodes
Date:   Wed,  4 May 2022 16:51:52 +0900
Message-Id: <20220504075154.58819-11-chanho61.park@samsung.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220504075154.58819-1-chanho61.park@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrIJsWRmVeSWpSXmKPExsWy7bCmha6uQVGSweS7jBYP5m1js7i8X9vi
        +pfnrBbzj5xjteh78ZDZYu/rrewWH3vusVrMOL+PyeLiKVeL1r1H2C0Ov2lntfh3bSOLxfM+
        oPiqXX8YHfg83t9oZffYOesuu8emVZ1sHneu7WHz6NuyitHj8ya5ALaobJuM1MSU1CKF1Lzk
        /JTMvHRbJe/geOd4UzMDQ11DSwtzJYW8xNxUWyUXnwBdt8wcoGOVFMoSc0qBQgGJxcVK+nY2
        RfmlJakKGfnFJbZKqQUpOQXmBXrFibnFpXnpenmpJVaGBgZGpkCFCdkZE3a/Yi/ol6w4uekC
        cwPjE+EuRg4OCQETiSXrfLoYuTiEBHYwSlw+/5gVwvnEKPF5eQcThPOZUeLCvTNsXYycYB2N
        E4+yQCR2MUqcOv8EyvnIKDG9bSMzSBWbgK7EluevGEESIgJdzBIX++6BVTELbGWUOH5jFhNI
        lbBAoMT79pUsIDaLgKrE4+ldrCA2r4C9xKqL21kgLpSX+Lc4FMTkBAo/3mABUSEocXLmE7BO
        ZqCK5q2zmUHGSwjM5ZC4+HQSO8SpLhKvdu6BsoUlXh3fAmVLSbzsb4OyiyWWzvrEBNHcAAyB
        bb+g/jSWmPWsnRFkMbOApsT6XfoQ5yhLHLkFtZdPouPwX3aIMK9ER5sQRKO6xIHt01kgbFmJ
        7jmfWSFsD4mFS0+BxYUEJjFKtNzQn8CoMAvJN7OQfDMLYe8CRuZVjGKpBcW56anFRgWG8AhO
        zs/dxAhOu1quOxgnv/2gd4iRiYPxEKMEB7OSCK/z0oIkId6UxMqq1KL8+KLSnNTiQ4ymwJCe
        yCwlmpwPTPx5JfGGJpYGJmZmhuZGpgbmSuK8XikbEoUE0hNLUrNTUwtSi2D6mDg4pRqYjFRX
        OE0wemjT7vxq948PORPWs5Rv/HHqT1y1cvRRdgW7WWlSahVME/WZDplPvjz/+rZ0T9W9H/3e
        zJq559Hd1ND036vry85o/l91tzb1z5nk8OpHlfWMRjvOHr1t+n2nzMnFOa+zW9+wztG7WlJp
        eqBLivdkFP/qz6l5p4unL/WfNqFbwVfQqedg+IsKoVkyMt/OFcx7f0ZB+n9o9und3V5BgssX
        Zu/IOrMv0XTBJCnVt4/cbN8zH1gaXpE96/tus+A9vzgid+9W7FJ62rwnZEVVscr++6c8FF7/
        1i10yEsME1Oa+Fvjr8f+qzO6WD+5tmf4LX5ZM43VJnTl3KZvBu/bv8x56Xll6e4JUrYrHyux
        FGckGmoxFxUnAgCxtrqCRAQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrDLMWRmVeSWpSXmKPExsWy7bCSnK6OQVGSwctZChYP5m1js7i8X9vi
        +pfnrBbzj5xjteh78ZDZYu/rrewWH3vusVrMOL+PyeLiKVeL1r1H2C0Ov2lntfh3bSOLxfM+
        oPiqXX8YHfg83t9oZffYOesuu8emVZ1sHneu7WHz6NuyitHj8ya5ALYoLpuU1JzMstQifbsE
        rowJu1+xF/RLVpzcdIG5gfGJcBcjJ4eEgIlE48SjLF2MXBxCAjsYJTo+3GODSMhKPHu3gx3C
        Fpa433KEFaLoPaPE3f6dLCAJNgFdiS3PXzGCJEQEJjBLvLnygR3EYRbYyShx59UpsFHCAv4S
        t59+B+tgEVCVeDy9ixXE5hWwl1h1cTtQnANohbzEv8WhICYnUPjxBgsQU0jATuLopCKIYkGJ
        kzOfgA1hBipu3jqbeQKjwCwkqVlIUgsYmVYxSqYWFOem5xYbFhjlpZbrFSfmFpfmpesl5+du
        YgRHiJbWDsY9qz7oHWJk4mA8xCjBwawkwuu8tCBJiDclsbIqtSg/vqg0J7X4EKM0B4uSOO+F
        rpPxQgLpiSWp2ampBalFMFkmDk6pBiY3JkuVnY3eD67vfrJsopD2L32uL+u7b77W/l+qeuKP
        xuONj5lyL20WdEj5bhGhPcGyfRYzi1v365bJO81i4u2Ci9uyavmiiu+1rBM6v9zT9Ypjjd6N
        u2ydnEtMFy1/NvFKVE//8wlbuf8sDdflVM7nNuUXOxmWqn/xgRO3nzjXG8GPFRn9y6v/x7FJ
        cze5vlFVn7zo+drFnmJdgkd21G+ZXM1kX6UgqXXIJDTvoN2EqUVJpfOzDRLvGh0pvxIlFaZa
        c43behtHh+qeDadOGJjfvmUYxm2YvXBP7eGnF9Or9Vbse1icX+7RUCa6i3HF+TmOPwQ1Pq4T
        Xr/cv3pKqFpFmNRf59PWTT+Ul1+wU2Ipzkg01GIuKk4EALTbP6z/AgAA
X-CMS-MailID: 20220504075004epcas2p44c3c0246988d133a5da1fdfd2f17d0b9
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20220504075004epcas2p44c3c0246988d133a5da1fdfd2f17d0b9
References: <20220504075154.58819-1-chanho61.park@samsung.com>
        <CGME20220504075004epcas2p44c3c0246988d133a5da1fdfd2f17d0b9@epcas2p4.samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Add cmu_top, cmu_busmc, cmu_core, cmu_fsys and peric0/c1/s clock nodes.

Signed-off-by: Chanho Park <chanho61.park@samsung.com>
---
 arch/arm64/boot/dts/exynos/exynosautov9.dtsi | 84 ++++++++++++++++++++
 1 file changed, 84 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynosautov9.dtsi b/arch/arm64/boot/dts/exynos/exynosautov9.dtsi
index 807d500d6022..c9cd3774f298 100644
--- a/arch/arm64/boot/dts/exynos/exynosautov9.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynosautov9.dtsi
@@ -6,6 +6,7 @@
  *
  */
 
+#include <dt-bindings/clock/samsung,exynosautov9.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/soc/samsung,exynos-usi.h>
 
@@ -190,6 +191,89 @@ chipid@10000000 {
 			reg = <0x10000000 0x24>;
 		};
 
+		cmu_peris: clock-controller@10020000 {
+			compatible = "samsung,exynosautov9-cmu-peris";
+			reg = <0x10020000 0x8000>;
+			#clock-cells = <1>;
+
+			clocks = <&xtcxo>,
+				 <&cmu_top DOUT_CLKCMU_PERIS_BUS>;
+			clock-names = "oscclk",
+				      "dout_clkcmu_peris_bus";
+		};
+
+		cmu_peric0: clock-controller@10200000 {
+			compatible = "samsung,exynosautov9-cmu-peric0";
+			reg = <0x10200000 0x8000>;
+			#clock-cells = <1>;
+
+			clocks = <&xtcxo>,
+				 <&cmu_top DOUT_CLKCMU_PERIC0_BUS>,
+				 <&cmu_top DOUT_CLKCMU_PERIC0_IP>;
+			clock-names = "oscclk",
+				      "dout_clkcmu_peric0_bus",
+				      "dout_clkcmu_peric0_ip";
+		};
+
+		cmu_peric1: clock-controller@10800000 {
+			compatible = "samsung,exynosautov9-cmu-peric1";
+			reg = <0x10800000 0x8000>;
+			#clock-cells = <1>;
+
+			clocks = <&xtcxo>,
+				 <&cmu_top DOUT_CLKCMU_PERIC1_BUS>,
+				 <&cmu_top DOUT_CLKCMU_PERIC1_IP>;
+			clock-names = "oscclk",
+				      "dout_clkcmu_peric1_bus",
+				      "dout_clkcmu_peric1_ip";
+		};
+
+		cmu_fsys2: clock-controller@17c00000 {
+			compatible = "samsung,exynosautov9-cmu-fsys2";
+			reg = <0x17c00000 0x8000>;
+			#clock-cells = <1>;
+
+			clocks = <&xtcxo>,
+				 <&cmu_top DOUT_CLKCMU_FSYS2_BUS>,
+				 <&cmu_top DOUT_CLKCMU_FSYS2_UFS_EMBD>,
+				 <&cmu_top DOUT_CLKCMU_FSYS2_ETHERNET>;
+			clock-names = "oscclk",
+				      "dout_clkcmu_fsys2_bus",
+				      "dout_fsys2_clkcmu_ufs_embd",
+				      "dout_fsys2_clkcmu_ethernet";
+		};
+
+		cmu_core: clock-controller@1b030000 {
+			compatible = "samsung,exynosautov9-cmu-core";
+			reg = <0x1b030000 0x8000>;
+			#clock-cells = <1>;
+
+			clocks = <&xtcxo>,
+				 <&cmu_top DOUT_CLKCMU_CORE_BUS>;
+			clock-names = "oscclk",
+				      "dout_clkcmu_core_bus";
+		};
+
+		cmu_busmc: clock-controller@1b200000 {
+			compatible = "samsung,exynosautov9-cmu-busmc";
+			reg = <0x1b200000 0x8000>;
+			#clock-cells = <1>;
+
+			clocks = <&xtcxo>,
+				 <&cmu_top DOUT_CLKCMU_BUSMC_BUS>;
+			clock-names = "oscclk",
+				      "dout_clkcmu_busmc_bus";
+		};
+
+		cmu_top: clock-controller@1b240000 {
+			compatible = "samsung,exynosautov9-cmu-top";
+			reg = <0x1b240000 0x8000>;
+			#clock-cells = <1>;
+
+			clocks = <&xtcxo>;
+			clock-names = "oscclk";
+		};
+
 		gic: interrupt-controller@10101000 {
 			compatible = "arm,gic-400";
 			#interrupt-cells = <3>;
-- 
2.36.0

