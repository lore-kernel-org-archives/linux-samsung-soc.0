Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82CAAC4321E
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  4 May 2022 07:50:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345798AbiEDHyZ (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 4 May 2022 03:54:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345812AbiEDHx5 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 4 May 2022 03:53:57 -0400
Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B0EEBC2
        for <linux-samsung-soc@vger.kernel.org>; Wed,  4 May 2022 00:50:19 -0700 (PDT)
Received: from epcas2p2.samsung.com (unknown [182.195.41.54])
        by mailout3.samsung.com (KnoxPortal) with ESMTP id 20220504075013epoutp032ea336a721635f73d85f545d0d699fef~r13uDlLCy1430614306epoutp03G
        for <linux-samsung-soc@vger.kernel.org>; Wed,  4 May 2022 07:50:13 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20220504075013epoutp032ea336a721635f73d85f545d0d699fef~r13uDlLCy1430614306epoutp03G
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1651650613;
        bh=ovgyf7nb/43LcNJwkbyJaehog4t8tM3ilhcBo56dt7Q=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=hmgMXiZ4D1nohyWVTLl3EhBv2rUpXM2KPWw6i8laBlJSKOMAjDNQwK9cnHD5amI+x
         MLHSDTbNMLxP5pIVw9vSzIsXKMdfXUUHFbEAOh9WCdnHq6ZZRC/3oKQHRw9gpLeLnB
         DGu6OFD+zIk8cLvCzgl/UwJGVlkEiHp0zFAkhdx4=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
        epcas2p2.samsung.com (KnoxPortal) with ESMTP id
        20220504075013epcas2p2f8a6daf93352bd127352830007be576e~r13tb2CF12514825148epcas2p2M;
        Wed,  4 May 2022 07:50:13 +0000 (GMT)
Received: from epsmges2p4.samsung.com (unknown [182.195.36.92]) by
        epsnrtp2.localdomain (Postfix) with ESMTP id 4KtTWj3YYZz4x9QD; Wed,  4 May
        2022 07:50:09 +0000 (GMT)
Received: from epcas2p3.samsung.com ( [182.195.41.55]) by
        epsmges2p4.samsung.com (Symantec Messaging Gateway) with SMTP id
        05.6D.09694.D2032726; Wed,  4 May 2022 16:50:05 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
        epcas2p4.samsung.com (KnoxPortal) with ESMTPA id
        20220504075004epcas2p4d082e1aa4b35ec4720ea8ed2308878f5~r13llBV1K1669516695epcas2p4M;
        Wed,  4 May 2022 07:50:04 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
        epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20220504075004epsmtrp2692de94ae2eb97b0bf3495eccb4d6784~r13lkC-hH0425004250epsmtrp2G;
        Wed,  4 May 2022 07:50:04 +0000 (GMT)
X-AuditID: b6c32a48-495ff700000025de-e3-6272302d23e6
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
        epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
        DF.EB.08924.C2032726; Wed,  4 May 2022 16:50:04 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.9.51]) by
        epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20220504075004epsmtip1d49c28aaa7c22cf4064782f6690a3eca~r13laZx2g2390523905epsmtip1G;
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
Subject: [PATCH v3 12/12] arm64: dts: exynosautov9: switch ufs clock node
Date:   Wed,  4 May 2022 16:51:54 +0900
Message-Id: <20220504075154.58819-13-chanho61.park@samsung.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220504075154.58819-1-chanho61.park@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrIJsWRmVeSWpSXmKPExsWy7bCmua6uQVGSwYndghYP5m1js7i8X9vi
        +pfnrBbzj5xjteh78ZDZYu/rrewWH3vusVrMOL+PyeLiKVeL1r1H2C0Ov2lntfh3bSOLxfM+
        oPiqXX8YHfg83t9oZffYOesuu8emVZ1sHneu7WHz6NuyitHj8ya5ALaobJuM1MSU1CKF1Lzk
        /JTMvHRbJe/geOd4UzMDQ11DSwtzJYW8xNxUWyUXnwBdt8wcoGOVFMoSc0qBQgGJxcVK+nY2
        RfmlJakKGfnFJbZKqQUpOQXmBXrFibnFpXnpenmpJVaGBgZGpkCFCdkZPbsvsBW84Kp4ffoT
        SwPjPY4uRk4OCQETiYunHjN2MXJxCAnsYJSYs6+fDcL5xCgxZepNVgjnM6PE7797GGFabr26
        zg6R2MUocelqI1TVR0aJjdf3sIJUsQnoSmx5/gpssIhAF7PExb57LCAOs8BWRonjN2YxgVQJ
        C3hKXGyAmMsioCrRdeYLC4jNK2AvcfXeW6BJHED75CX+LQ4FMTmBwo83WEBUCEqcnPkErJoZ
        qKJ562xmiOvmckjcvMYFYbtIXNi0mA3CFpZ4dXwLO4QtJfH53V6oeLHE0lmfmEBOkxBoYJS4
        vO0XVMJYYtazdkaQvcwCmhLrd+lDXKMsceQW1Fo+iY7Df9khwrwSHW1CEI3qEge2T2eBsGUl
        uud8hvrDQ2LW1kpISE1ilPh09DPzBEaFWUiemYXkmVkIexcwMq9iFEstKM5NTy02KjCBR3By
        fu4mRnDa1fLYwTj77Qe9Q4xMHIyHGCU4mJVEeJ2XFiQJ8aYkVlalFuXHF5XmpBYfYjQFBvRE
        ZinR5Hxg4s8riTc0sTQwMTMzNDcyNTBXEuf1StmQKCSQnliSmp2aWpBaBNPHxMEp1cBkxSTZ
        +7DOZena96znDbbMW3Mh9EPn6YScxe9ZA92P3ttye+GsFYo3NPZzOMQc29Y9VYq5ZHHZrtYH
        cac4t0X+XajTyaLTHT91+TetGf5Rq/K3LDdezXaodpVif05oxf7yyqkz2Df6Cp7jXnSYi1nb
        OnBF3/m7jU/X2mmvkmVkMz3ZGxd6W/jCAU7vePcCFqeVCq7L2W7PumFUsGBtn8YERcb6mK+z
        AgJ6zsztybnSmtuXECZ3aVP+nV2rT+wXdtFy3/7emrPxVfTfrz+41IX2mwvFF/BU3jgifqF+
        8z3b7zwhst+/29uqblG5kHdc6unc+OsSfGZrZ3t/aTmlf3/TPReJx3Jv2rJcZ7HMlnFSYinO
        SDTUYi4qTgQA6IgGOkQEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrDLMWRmVeSWpSXmKPExsWy7bCSnK6OQVGSwZF/mhYP5m1js7i8X9vi
        +pfnrBbzj5xjteh78ZDZYu/rrewWH3vusVrMOL+PyeLiKVeL1r1H2C0Ov2lntfh3bSOLxfM+
        oPiqXX8YHfg83t9oZffYOesuu8emVZ1sHneu7WHz6NuyitHj8ya5ALYoLpuU1JzMstQifbsE
        roye3RfYCl5wVbw+/YmlgfEeRxcjJ4eEgInErVfX2bsYuTiEBHYwShyacIwdIiEr8ezdDihb
        WOJ+yxFWiKL3jBIvly5hBEmwCehKbHn+ihEkISIwgVnizZUPYKOYBXYyStx5dYoNpEpYwFPi
        YsMesA4WAVWJrjNfWEBsXgF7iav33gKN5QBaIS/xb3EoiMkJFH68wQLEFBKwkzg6qQiiWFDi
        5MwnYI3MQMXNW2czT2AUmIUkNQtJagEj0ypGydSC4tz03GLDAqO81HK94sTc4tK8dL3k/NxN
        jOAI0dLawbhn1Qe9Q4xMHIyHGCU4mJVEeJ2XFiQJ8aYkVlalFuXHF5XmpBYfYpTmYFES573Q
        dTJeSCA9sSQ1OzW1ILUIJsvEwSnVwGScfeDg6lNiJu4eGavf8TwrkpL6/emjW8F+x6z+/j2f
        1defvDlhj7NocOTWWwULF4W+Om7mWDgx4nOD88w2sSjV7Koab9MjTxTe2jGZyERcPHCjTFVp
        Xnzlz5d+h46s11JvOPjg1uzqU6JJDwVu6SQFVZWtY01+YlbHkSvPmrfe9o1z+Or9sxMMWh9L
        fHcVkNd7tOqBZKPB8QsC5x7d6rq8XlKDKfBP6rHi+oTFJx4xXDfd/ESkSkn6tMfLVx0sK1si
        GS8on360NopZyPdIXLjJtrKUPxoHDthP9Qn2n+NsKXrNLJc37Wf2YcXz+1Tk5kx9lJnHEfGz
        WOnwae/i+DZRriDPlW6ym9YkT80/rcRSnJFoqMVcVJwIAOD4aXj/AgAA
X-CMS-MailID: 20220504075004epcas2p4d082e1aa4b35ec4720ea8ed2308878f5
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20220504075004epcas2p4d082e1aa4b35ec4720ea8ed2308878f5
References: <20220504075154.58819-1-chanho61.park@samsung.com>
        <CGME20220504075004epcas2p4d082e1aa4b35ec4720ea8ed2308878f5@epcas2p4.samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Use cmu_fsys's clock node instead of dummy ufs clock node.

Signed-off-by: Chanho Park <chanho61.park@samsung.com>
---
 arch/arm64/boot/dts/exynos/exynosautov9.dtsi | 14 ++------------
 1 file changed, 2 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/boot/dts/exynos/exynosautov9.dtsi b/arch/arm64/boot/dts/exynos/exynosautov9.dtsi
index 68335fefa5f3..a8818b92e217 100644
--- a/arch/arm64/boot/dts/exynos/exynosautov9.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynosautov9.dtsi
@@ -157,16 +157,6 @@ xtcxo: clock {
 			clock-frequency = <26000000>;
 			clock-output-names = "oscclk";
 		};
-
-		/*
-		 * Keep the stub clock for ufs driver, until proper clock
-		 * driver is implemented.
-		 */
-		ufs_core_clock: ufs-core-clock {
-			compatible = "fixed-clock";
-			#clock-cells = <0>;
-			clock-frequency = <166562500>;
-		};
 	};
 
 	soc: soc@0 {
@@ -383,8 +373,8 @@ ufs_0: ufs0@17e00000 {
 				<0x17dc0000 0x2200>;  /* 3: UFS protector */
 			reg-names = "hci", "vs_hci", "unipro", "ufsp";
 			interrupts = <GIC_SPI 227 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&ufs_core_clock>,
-				<&ufs_core_clock>;
+			clocks = <&cmu_fsys2 CLK_GOUT_FSYS2_UFS_EMBD0_ACLK>,
+				 <&cmu_fsys2 CLK_GOUT_FSYS2_UFS_EMBD0_UNIPRO>;
 			clock-names = "core_clk", "sclk_unipro_main";
 			freq-table-hz = <0 0>, <0 0>;
 			pinctrl-names = "default";
-- 
2.36.0

