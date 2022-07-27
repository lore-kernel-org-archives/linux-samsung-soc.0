Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A8F7C25B0E
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 27 Jul 2022 06:06:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230010AbiG0GG1 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 27 Jul 2022 02:06:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229499AbiG0GGX (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 27 Jul 2022 02:06:23 -0400
Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 254003DBC8
        for <linux-samsung-soc@vger.kernel.org>; Tue, 26 Jul 2022 23:06:19 -0700 (PDT)
Received: from epcas2p1.samsung.com (unknown [182.195.41.53])
        by mailout4.samsung.com (KnoxPortal) with ESMTP id 20220727060614epoutp04a23a5964ac0601f10fa0a9b69043eb3d~Fmo56MJ4r2961429614epoutp04g
        for <linux-samsung-soc@vger.kernel.org>; Wed, 27 Jul 2022 06:06:14 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20220727060614epoutp04a23a5964ac0601f10fa0a9b69043eb3d~Fmo56MJ4r2961429614epoutp04g
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1658901974;
        bh=qKmk9caegVuAaru6OiM6AzyLnhdi6ILNtRD2Uw2D6rE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=FG/YzV0KBy6PG+9Sba+hLhPqMNW3kpuQrJaP7t+EJDuylrd6obXWaju5eZwCq06qo
         qcLw9FUQ6OATmtbhAuiqhWiiSajiQjzYaPajliTT6+JW3hqGfE0c6B/RP8GVxydj0W
         9Di00L98gLvcndPSfjq0nLygQQST2lXWeXndTYps=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
        epcas2p3.samsung.com (KnoxPortal) with ESMTP id
        20220727060613epcas2p38eeb81d969b2d8cef82e8b6eea64395f~Fmo5OJ0T_1065410654epcas2p3C;
        Wed, 27 Jul 2022 06:06:13 +0000 (GMT)
Received: from epsmges2p3.samsung.com (unknown [182.195.36.99]) by
        epsnrtp2.localdomain (Postfix) with ESMTP id 4Lt3F11lYBz4x9Q0; Wed, 27 Jul
        2022 06:06:13 +0000 (GMT)
Received: from epcas2p4.samsung.com ( [182.195.41.56]) by
        epsmges2p3.samsung.com (Symantec Messaging Gateway) with SMTP id
        C3.6D.09642.5D5D0E26; Wed, 27 Jul 2022 15:06:13 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
        epcas2p3.samsung.com (KnoxPortal) with ESMTPA id
        20220727060612epcas2p3fa8d9a1e8ab3db929b3518ac8aca770c~Fmo4RxR401806418064epcas2p3K;
        Wed, 27 Jul 2022 06:06:12 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
        epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20220727060612epsmtrp2d14efc8ad93ca696bd4d2c4c8162d05d~Fmo4QEQ082781327813epsmtrp20;
        Wed, 27 Jul 2022 06:06:12 +0000 (GMT)
X-AuditID: b6c32a47-5e1ff700000025aa-c7-62e0d5d5ed0c
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
        epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
        43.50.08802.4D5D0E26; Wed, 27 Jul 2022 15:06:12 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.9.51]) by
        epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20220727060612epsmtip18ebb240c6309f29e4af4d8dff505d180~Fmo4EOAeW2960929609epsmtip1N;
        Wed, 27 Jul 2022 06:06:12 +0000 (GMT)
From:   Chanho Park <chanho61.park@samsung.com>
To:     Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Sam Protsenko <semen.protsenko@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Chanho Park <chanho61.park@samsung.com>
Subject: [PATCH 4/6] arm64: dts: exynosautov9: add fsys0/1 clock DT nodes
Date:   Wed, 27 Jul 2022 15:01:44 +0900
Message-Id: <20220727060146.9228-5-chanho61.park@samsung.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220727060146.9228-1-chanho61.park@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrHJsWRmVeSWpSXmKPExsWy7bCmhe7Vqw+SDC6e4LZ4MG8bm8Xl/doW
        1788Z7WYf+Qcq0Xfi4fMFntfb2W32PT4GqvFx557rBYzzu9jsrh4ytWide8RdovDb9pZLf5d
        28hi8bwPKL5q1x9GB36P9zda2T12zrrL7rFpVSebx51re9g8Ni+p9+jbsorR4/MmuQD2qGyb
        jNTElNQihdS85PyUzLx0WyXv4HjneFMzA0NdQ0sLcyWFvMTcVFslF58AXbfMHKCrlRTKEnNK
        gUIBicXFSvp2NkX5pSWpChn5xSW2SqkFKTkF5gV6xYm5xaV56Xp5qSVWhgYGRqZAhQnZGV0H
        /rIX7OOp6JnSydbA2MbVxcjJISFgIjHt53yWLkYuDiGBHYwSu5Y+ZoNwPjFK7L/ewwrhfGaU
        WLN1AxNMy+Q5S6GqdjFKNO+bB1X1kVFi4uVOZpAqNgFdiS3PXzGCJEQEHjNJHD7SBtbCLNDG
        JDHt2UZWkCphAU+J1jdrWEBsFgFVib6Wr+wgNq+ArcS0P7vYIfbJS1y/2QY2lVPATmLHmp1M
        EDWCEidnPgHrZQaqad46mxlkgYTASg6JFX1XoJpdJB5t+s0GYQtLvDq+BSouJfH53V6oeLHE
        0lmfmCCaGxglLm/7BZUwlpj1rB3oBw6gDZoS63fpg5gSAsoSR25B7eWT6Dj8lx0izCvR0SYE
        0agucWD7dBYIW1aie85nVgjbQ2L79PfMkNCayCjxvm8K6wRGhVlI3pmF5J1ZCIsXMDKvYhRL
        LSjOTU8tNiowhkdycn7uJkZwQtZy38E44+0HvUOMTByMhxglOJiVRHgTou8nCfGmJFZWpRbl
        xxeV5qQWH2I0BQb2RGYp0eR8YE7IK4k3NLE0MDEzMzQ3MjUwVxLn9UrZkCgkkJ5YkpqdmlqQ
        WgTTx8TBKdXAtPJicueBnNxyL/nIqzdnVx6KZ5NTL6g4cYrfo1VykpSQkvDy+32Oih3fuxqN
        l6053rnGSD7j+XuHV8eKfcqsaj9LVM29fuLWos7ttTGTXl/yF5y2SrHlZsuqw0mtc5d+YM1x
        O+ZePute+df6leofg59H6i3Vat/Mq1S/xCxphf3GqO98Ey6YblosXb+P/9IMfeVZx+/Ptu0w
        PHP49PS0rxxWk+/rLn2ryiWUOOmR+XnTlx9lmaf0HFjonXeLMf/Zsu9a0lxzWcV+WPtaKpsw
        /z8QzHcl6qqFKPcN5WAtn8S6Ktno9ZsFedmKf3fOuvFEKu5exte+fS9PtE+P7HjLfrTlKasB
        gw7zJ66tDFrySizFGYmGWsxFxYkAEL+GZVEEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrBLMWRmVeSWpSXmKPExsWy7bCSnO6Vqw+SDGbNUrN4MG8bm8Xl/doW
        1788Z7WYf+Qcq0Xfi4fMFntfb2W32PT4GqvFx557rBYzzu9jsrh4ytWide8RdovDb9pZLf5d
        28hi8bwPKL5q1x9GB36P9zda2T12zrrL7rFpVSebx51re9g8Ni+p9+jbsorR4/MmuQD2KC6b
        lNSczLLUIn27BK6MrgN/2Qv28VT0TOlka2Bs4+pi5OSQEDCRmDxnKVsXIxeHkMAORolFh3vY
        IRKyEs/e7YCyhSXutxxhhSh6zyjxctMDFpAEm4CuxJbnrxhBEiICz5kkpqw4COYwC3QxSdxp
        +wTWLizgKdH6Zg1YB4uAqkRfy1ewOK+ArcS0P7ugVshLXL/ZxgxicwrYSexYs5MJxBYCqpn5
        qokFol5Q4uTMJ2A2M1B989bZzBMYBWYhSc1CklrAyLSKUTK1oDg3PbfYsMAoL7Vcrzgxt7g0
        L10vOT93EyM4crS0djDuWfVB7xAjEwfjIUYJDmYlEd6E6PtJQrwpiZVVqUX58UWlOanFhxil
        OViUxHkvdJ2MFxJITyxJzU5NLUgtgskycXBKNTB1cU269emPm1uL7aHKjTWfNxzebDlz/YJ5
        Xsnmm3SL2XU+COx//1L5YNz9o10+H80/71F0enSizHGKs1vjbvWVH2q57t3lsntcqGX2OiWP
        LVhDxIl3+aWogg9SRp82s/7Mjyu2MF28kE0q+KRoh8LOfQJMsvZ2p0X9edSmddyLLBdnfGk7
        Rddra7HR2vXPsw4+/6S14MSGtG6mS4X+p/uS9vbOud24qNffpKdE4/T9ZEXzja/j0hYt6p6w
        RP1s8F95002PHjL37ozLTQm8Kt+T9IP93vXTkbJmc7JtTiz1yXyXemrnDMnFFQ96V3XF5P7M
        TVndJBt7oyjRuWhW+pdKj1cuKY6mcVs2BrsYGCuxFGckGmoxFxUnAgCx8UJXCwMAAA==
X-CMS-MailID: 20220727060612epcas2p3fa8d9a1e8ab3db929b3518ac8aca770c
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20220727060612epcas2p3fa8d9a1e8ab3db929b3518ac8aca770c
References: <20220727060146.9228-1-chanho61.park@samsung.com>
        <CGME20220727060612epcas2p3fa8d9a1e8ab3db929b3518ac8aca770c@epcas2p3.samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Add cmu_fsys0 and cmu_fsys1 for PCIe clocks and USB/MMC clocks
respectively.

Signed-off-by: Chanho Park <chanho61.park@samsung.com>
---
 arch/arm64/boot/dts/exynos/exynosautov9.dtsi | 28 ++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynosautov9.dtsi b/arch/arm64/boot/dts/exynos/exynosautov9.dtsi
index 2013718532f3..58b3b0c5d3fc 100644
--- a/arch/arm64/boot/dts/exynos/exynosautov9.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynosautov9.dtsi
@@ -207,6 +207,34 @@ cmu_peric1: clock-controller@10800000 {
 				      "dout_clkcmu_peric1_ip";
 		};
 
+		cmu_fsys0: clock-controller@17700000 {
+			compatible = "samsung,exynosautov9-cmu-fsys0";
+			reg = <0x17700000 0x8000>;
+			#clock-cells = <1>;
+
+			clocks = <&xtcxo>,
+				 <&cmu_top DOUT_CLKCMU_FSYS0_BUS>,
+				 <&cmu_top DOUT_CLKCMU_FSYS0_PCIE>;
+			clock-names = "oscclk",
+				      "dout_clkcmu_fsys0_bus",
+				      "dout_clkcmu_fsys0_pcie";
+		};
+
+		cmu_fsys1: clock-controller@17040000 {
+			compatible = "samsung,exynosautov9-cmu-fsys1";
+			reg = <0x17040000 0x8000>;
+			#clock-cells = <1>;
+
+			clocks = <&xtcxo>,
+				 <&cmu_top DOUT_CLKCMU_FSYS1_BUS>,
+				 <&cmu_top GOUT_CLKCMU_FSYS1_MMC_CARD>,
+				 <&cmu_top DOUT_CLKCMU_FSYS1_USBDRD>;
+			clock-names = "oscclk",
+				      "dout_clkcmu_fsys1_bus",
+				      "gout_clkcmu_fsys1_mmc_card",
+				      "dout_clkcmu_fsys1_usbdrd";
+		};
+
 		cmu_fsys2: clock-controller@17c00000 {
 			compatible = "samsung,exynosautov9-cmu-fsys2";
 			reg = <0x17c00000 0x8000>;
-- 
2.37.1

