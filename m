Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABDBDC433F5
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  3 May 2022 10:58:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234612AbiECLBj (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 3 May 2022 07:01:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234625AbiECLBe (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 3 May 2022 07:01:34 -0400
Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0EEBC24973
        for <linux-samsung-soc@vger.kernel.org>; Tue,  3 May 2022 03:57:54 -0700 (PDT)
Received: from epcas2p1.samsung.com (unknown [182.195.41.53])
        by mailout3.samsung.com (KnoxPortal) with ESMTP id 20220503105735epoutp0312c8b396b542f970c82dfaed3126ea58~rkyBDVeB30801108011epoutp03S
        for <linux-samsung-soc@vger.kernel.org>; Tue,  3 May 2022 10:57:35 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20220503105735epoutp0312c8b396b542f970c82dfaed3126ea58~rkyBDVeB30801108011epoutp03S
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1651575455;
        bh=uPWVcTp8KjUt8wP9J5xP7vNJt3IzLFZ3DAa81uXTRjg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=WE6s+c5EdFNqQc84NnKtG1LF6loWTKhQKC8LddiOpvmjwCJl1dpqk4qOYahgMYD1h
         im5VyhDFx8BV99kSYf5ks1YCTcLmVigyUHmhxEhogKMcYx0qK//5gkHWI48UoE0B/5
         s57e/BXwL0cIFei6mFzNPg8jcXe3Mh+8tylr79O4=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
        epcas2p2.samsung.com (KnoxPortal) with ESMTP id
        20220503105733epcas2p2ce1f3b86173db29f5c90aa581ce6b1fc~rkx-5xIfV1964119641epcas2p2E;
        Tue,  3 May 2022 10:57:33 +0000 (GMT)
Received: from epsmges2p4.samsung.com (unknown [182.195.36.68]) by
        epsnrtp3.localdomain (Postfix) with ESMTP id 4KsxkM1lfMz4x9Q8; Tue,  3 May
        2022 10:57:31 +0000 (GMT)
Received: from epcas2p2.samsung.com ( [182.195.41.54]) by
        epsmges2p4.samsung.com (Symantec Messaging Gateway) with SMTP id
        B3.DA.09694.A9A01726; Tue,  3 May 2022 19:57:30 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
        epcas2p3.samsung.com (KnoxPortal) with ESMTPA id
        20220503105729epcas2p37342dc05e91c9007aa61d950c2bfe447~rkx8MXFoi2361523615epcas2p3-;
        Tue,  3 May 2022 10:57:29 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
        epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20220503105729epsmtrp12f5d97db971408dea4f9aca785f04b79~rkx8Ljmj30279502795epsmtrp1h;
        Tue,  3 May 2022 10:57:29 +0000 (GMT)
X-AuditID: b6c32a48-47fff700000025de-9a-62710a9a7df6
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
        epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
        64.42.08853.99A01726; Tue,  3 May 2022 19:57:29 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.9.51]) by
        epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20220503105729epsmtip29090e289ba25d6c15e9828478f3faeef~rkx8AvD9t1107511075epsmtip2F;
        Tue,  3 May 2022 10:57:29 +0000 (GMT)
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
Subject: [PATCH v2 10/12] arm64: dts: exynosautov9: add initial cmu clock
 nodes
Date:   Tue,  3 May 2022 19:59:12 +0900
Message-Id: <20220503105914.117625-11-chanho61.park@samsung.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220503105914.117625-1-chanho61.park@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrEJsWRmVeSWpSXmKPExsWy7bCmme4srsIkg80T9C0ezNvGZnF5v7bF
        9S/PWS3mHznHatH34iGzxd7XW9ktPvbcY7WYcX4fk8XFU64WrXuPsFscftPOavHv2kYWi+d9
        QPFVu/4wOvB5vL/Ryu6xc9Zddo9NqzrZPO5c28Pm0bdlFaPH501yAWxR2TYZqYkpqUUKqXnJ
        +SmZeem2St7B8c7xpmYGhrqGlhbmSgp5ibmptkouPgG6bpk5QMcqKZQl5pQChQISi4uV9O1s
        ivJLS1IVMvKLS2yVUgtScgrMC/SKE3OLS/PS9fJSS6wMDQyMTIEKE7IzOnbdYC3ol6x4suAW
        WwPjE+EuRk4OCQETiYunrrOA2EICOxgltp7h7GLkArI/MUpcef6ADcL5xijxZe1kdpiOmRs7
        mCASexklDjx4zQzhfGSUuP93DitIFZuArsSW568YQRIiAl3MEhf77rGAOMwCWxkljt+YBdTP
        wSEsEChxf7MhSAOLgKrEhu27mUBsXgEHicm3ehhBSiQE5CX+LQ4FCXMCha/vOgdVIihxcuYT
        sLuZgUqat84GO0JCYCmHxIfr59ggTnWR6Dx4D+psYYlXx7dA2VISL/vboOxiiaWzPjFBNDcw
        Slze9guq2Vhi1rN2sCOYBTQl1u/Sh7hHWeLILai9fBIdh/+yQ4R5JTrahCAa1SUObJ/OAmHL
        SnTP+cwKYXtIHPz8igUSVpMZJX4cvcY4gVFhFpJ3ZiF5ZxbC4gWMzKsYxVILinPTU4uNCkzg
        MZycn7uJEZx4tTx2MM5++0HvECMTB+MhRgkOZiURXuelBUlCvCmJlVWpRfnxRaU5qcWHGE2B
        YT2RWUo0OR+Y+vNK4g1NLA1MzMwMzY1MDcyVxHm9UjYkCgmkJ5akZqemFqQWwfQxcXBKNTBZ
        LxAI7t0gqROUHisUXjB1OX/qwQNbFpdd/FBYY7jhfg/fl2v5/oc+y28v2er/9KDyllSGTzH7
        GnVzOabtSdIxVqptE+WRszHUDHgkEJ6j/s/N/962/uVOiXEb01r6/NTTtr9U5RHZYLan+clN
        O824fRHnf2xYnvXwxDnW5yl/yhfPEd1UXsPnHnq3xuGkifUXrU9R+sf0P3a33dWIWKb68H74
        az+WNW07gwoUdu2+al5yP2hd1JnjP87Vn0+u1GX5ZDz5gdIM6UMbvGwZ/D3bDetfB26b+Hm/
        xN7miefKqmu6KoyiZulKVi6Qfb75wcQnFy/aRsw4X5WcyFn4dO+VcgGOH87aLu+OTa54fFGJ
        pTgj0VCLuag4EQD2vO3cRQQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrHLMWRmVeSWpSXmKPExsWy7bCSvO5MrsIkg08bjS0ezNvGZnF5v7bF
        9S/PWS3mHznHatH34iGzxd7XW9ktPvbcY7WYcX4fk8XFU64WrXuPsFscftPOavHv2kYWi+d9
        QPFVu/4wOvB5vL/Ryu6xc9Zddo9NqzrZPO5c28Pm0bdlFaPH501yAWxRXDYpqTmZZalF+nYJ
        XBkdu26wFvRLVjxZcIutgfGJcBcjJ4eEgInEzI0dTF2MXBxCArsZJa5f/MQIkZCVePZuBzuE
        LSxxv+UIK0TRe0aJtTv7wBJsAroSW56/YgRJiAhMYJZ4c+UDO4jDLLCTUeLOq1NsIFXCAv4S
        8w+vZQWxWQRUJTZs380EYvMKOEhMvtUD1M0BtEJe4t/iUJAwJ1D4+q5zYCVCAvYSO/9uZ4Yo
        F5Q4OfMJC4jNDFTevHU28wRGgVlIUrOQpBYwMq1ilEwtKM5Nzy02LDDMSy3XK07MLS7NS9dL
        zs/dxAiOEi3NHYzbV33QO8TIxMF4iFGCg1lJhNd5aUGSEG9KYmVValF+fFFpTmrxIUZpDhYl
        cd4LXSfjhQTSE0tSs1NTC1KLYLJMHJxSDUxzktkvlRx9b9hicawiZMXWPdvkv2ra/Lg8s0Dx
        xcZmVwZTjpSr0Rp7l/K+WG2sFH5zwkrj+99MgnT8Xn30u9id+W9yamiHs7DNCbvNEyv6F5p2
        dZ52d57yy3Gre/GTvKLGxqJfU9x/9u7xX+JaVjKZy15+yfPV11JMlTzuqdvM6jsScLSkd5Uo
        A/eOrdNTL3InqRQve2b/3D6T5Y9zmOXJ+9zBLucWV/fMWnAwXO1S7bH1j6d8aZd+Ha68yizi
        X/L5BxWVSgzrNQqFeL7udhAXebvGTPV9jYzAT39royN9Wx4vKXlycbfLZJmOZ+7+BiopXDe8
        7juKzs/erfDh56FH8evl9PPZj5s8sZprHaHEUpyRaKjFXFScCACBu4iqAQMAAA==
X-CMS-MailID: 20220503105729epcas2p37342dc05e91c9007aa61d950c2bfe447
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20220503105729epcas2p37342dc05e91c9007aa61d950c2bfe447
References: <20220503105914.117625-1-chanho61.park@samsung.com>
        <CGME20220503105729epcas2p37342dc05e91c9007aa61d950c2bfe447@epcas2p3.samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Add cmu_top, cmu_busmc, cmu_core, cmu_fsys and peric0/c1/s clock nodes.

Signed-off-by: Chanho Park <chanho61.park@samsung.com>
---
 arch/arm64/boot/dts/exynos/exynosautov9.dtsi | 84 ++++++++++++++++++++
 1 file changed, 84 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynosautov9.dtsi b/arch/arm64/boot/dts/exynos/exynosautov9.dtsi
index 807d500d6022..32c670b8a9b8 100644
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
 		gic: interrupt-controller@10101000 {
 			compatible = "arm,gic-400";
 			#interrupt-cells = <3>;
-- 
2.36.0

