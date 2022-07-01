Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7799CCA486
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  1 Jul 2022 01:55:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232479AbiGABzE (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 30 Jun 2022 21:55:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232442AbiGABzC (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 30 Jun 2022 21:55:02 -0400
Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A410B5C976
        for <linux-samsung-soc@vger.kernel.org>; Thu, 30 Jun 2022 18:54:57 -0700 (PDT)
Received: from epcas2p1.samsung.com (unknown [182.195.41.53])
        by mailout1.samsung.com (KnoxPortal) with ESMTP id 20220701015452epoutp01da8f7169f4652b1f314f885780e53f5d~9kcA7K8vI3186931869epoutp01o
        for <linux-samsung-soc@vger.kernel.org>; Fri,  1 Jul 2022 01:54:52 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20220701015452epoutp01da8f7169f4652b1f314f885780e53f5d~9kcA7K8vI3186931869epoutp01o
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1656640492;
        bh=XGrPHmw8/EjbFix+3viYi7oGMD+uIJXV8+LyemqtGdU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=qN1yAoOGXA1g5Od7bmti+o1uPDwYgcDACD4hlnDiEG1d/U/4viVzIO0oMGtGRLV7n
         BuwiIWR1eACCXJM/2kewGzf3fVM8eTaTNcwfffBPk9CnbGxH6AgNeS4Oyd/u/aESw9
         lxO8769V0+6K7g+fwyOa+tpt3sevvevgbGA8cEXk=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
        epcas2p2.samsung.com (KnoxPortal) with ESMTP id
        20220701015452epcas2p2f06854bb1c7d4190bb96a18545507893~9kcAdJZ4_0426604266epcas2p2S;
        Fri,  1 Jul 2022 01:54:52 +0000 (GMT)
Received: from epsmges2p4.samsung.com (unknown [182.195.36.99]) by
        epsnrtp2.localdomain (Postfix) with ESMTP id 4LYytz5J1Dz4x9QB; Fri,  1 Jul
        2022 01:54:51 +0000 (GMT)
Received: from epcas2p2.samsung.com ( [182.195.41.54]) by
        epsmges2p4.samsung.com (Symantec Messaging Gateway) with SMTP id
        9F.F3.09662.BE35EB26; Fri,  1 Jul 2022 10:54:51 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
        epcas2p2.samsung.com (KnoxPortal) with ESMTPA id
        20220701015451epcas2p2834c160df3be05cf73ff30eb597d10af~9kb-pQpBS3108431084epcas2p2l;
        Fri,  1 Jul 2022 01:54:51 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
        epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20220701015451epsmtrp2afbf3528128b82014019720c35a1164b~9kb-oaogm1047610476epsmtrp2S;
        Fri,  1 Jul 2022 01:54:51 +0000 (GMT)
X-AuditID: b6c32a48-9f7ff700000025be-69-62be53eb48fa
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
        epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
        C3.43.08802.BE35EB26; Fri,  1 Jul 2022 10:54:51 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.9.51]) by
        epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20220701015451epsmtip251909966596563dea6e3812c94e3ee23~9kb-a8nMm0490404904epsmtip2M;
        Fri,  1 Jul 2022 01:54:51 +0000 (GMT)
From:   Chanho Park <chanho61.park@samsung.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Alim Akhtar <alim.akhtar@samsung.com>,
        Sam Protsenko <semen.protsenko@linaro.org>,
        Jaewon Kim <jaewon02.kim@samsung.com>,
        devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Chanho Park <chanho61.park@samsung.com>
Subject: [PATCH v3 3/5] arm64: dts: exynosautov9: add pdma0 device tree node
Date:   Fri,  1 Jul 2022 10:52:24 +0900
Message-Id: <20220701015226.32781-4-chanho61.park@samsung.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220701015226.32781-1-chanho61.park@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprMJsWRmVeSWpSXmKPExsWy7bCmme7r4H1JBq+uaFg8mLeNzeLyfm2L
        +UfOsVrsaDjCatH34iGzxabH11gtZpzfx2TRuvcIu8Xzvn1MDpwem1Z1snncubaHzWPzknqP
        vi2rGD0+b5ILYI3KtslITUxJLVJIzUvOT8nMS7dV8g6Od443NTMw1DW0tDBXUshLzE21VXLx
        CdB1y8wBOkdJoSwxpxQoFJBYXKykb2dTlF9akqqQkV9cYquUWpCSU2BeoFecmFtcmpeul5da
        YmVoYGBkClSYkJ2xfPcTxoK/7BVH5hc3MF5i62Lk5JAQMJE4/XA/cxcjF4eQwA5GiV2/fzNC
        OJ8YJa5ve8IK4XxmlPjcMxmohQOspb+fDyK+i1HiVec6JgjnI6PEykXNTCBz2QR0JbY8f8UI
        YosIxEs8v/CeBaSIWWASk8T5jmZmkEnCAj4SJ88JgdSwCKhKHOtfD1bPK2An0bJ/EgvEffIS
        G+b3MoPYnAL2Ev/2z2WHqBGUODnzCVgNM1BN89bZYD9ICPxkl9jyaTMTRLOLxOctM6AGCUu8
        Or6FHcKWkvj8bi80AIolls76xATR3MAocXnbL6iEscSsZ+2MIIcyC2hKrN+lD/G9ssSRW1B7
        +SQ6Dv9lhwjzSnS0CUE0qksc2D4daqusRPecz6wQtofEroZN0NCdxCjx9HkH4wRGhVlI3pmF
        5J1ZCIsXMDKvYhRLLSjOTU8tNiowgUdwcn7uJkZw6tTy2ME4++0HvUOMTByMhxglOJiVRHjZ
        5u1NEuJNSaysSi3Kjy8qzUktPsRoCgzsicxSosn5wOSdVxJvaGJpYGJmZmhuZGpgriTO65Wy
        IVFIID2xJDU7NbUgtQimj4mDU6qBqZ9nau+PuXfXpXReOeLUyRax0vR73pEIK/f1OwR9jSW/
        rS0MLWtpKZ7r2z97y63PNvp3KsL7DhnIXl/httzdaW/a97vTJrAt8r4hqXfDq3gPj2p2Jr88
        f4h6+OSLGn/ncy04xTXp/WPVvDj/mi1aPuvenxe9Wf117ycx/zP/ni8P6T1x7nKja8eUDZuS
        k+LkFTmPZPZPyq9Jmm7d/abqA/eeg5zXWH7kX93QH5dwpO1ydTKPf0zF6jO6Z+o/XpC98Pjb
        h96uEz4v18VX6280WGm27XnJkrg/0xY8+9jWYs3K0FgnXnDO+49Mot7LZ10fNwvGbzXz7ok3
        zb3jnSDTtfR88AoeQelHbas3P1ogrMRSnJFoqMVcVJwIANFlhkMmBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrDLMWRmVeSWpSXmKPExsWy7bCSvO7r4H1JBi/XClo8mLeNzeLyfm2L
        +UfOsVrsaDjCatH34iGzxabH11gtZpzfx2TRuvcIu8Xzvn1MDpwem1Z1snncubaHzWPzknqP
        vi2rGD0+b5ILYI3isklJzcksSy3St0vgyli++wljwV/2iiPzixsYL7F1MXJwSAiYSPT383Ux
        cnEICexglLj7ZRFrFyMnUFxW4tm7HewQtrDE/ZYjYHEhgfeMEg0va0FsNgFdiS3PXzGC2CIC
        8RKbvyxkARnELDCNSaLj8Qx2kAXCAj4SJ88JgdSwCKhKHOtfD1bPK2An0bJ/EgvEfHmJDfN7
        mUFsTgF7iX/757JD7LKTWP3uNjNEvaDEyZlPwOqZgeqbt85mnsAoMAtJahaS1AJGplWMkqkF
        xbnpucWGBUZ5qeV6xYm5xaV56XrJ+bmbGMEBrqW1g3HPqg96hxiZOBgPMUpwMCuJ8LLN25sk
        xJuSWFmVWpQfX1Sak1p8iFGag0VJnPdC18l4IYH0xJLU7NTUgtQimCwTB6dUA1PKxKW2FfP2
        xlffVtL4MvU747uNsYvTjrz+e5ArbmYIk9rtjPslGWxBNpft0k8GZofyLTKbvMnhkYGcqYdS
        w8Le+zfVXkl0+84SKV6tNNVnTvnh7K6moz/UN3fsf3A2TP/7uh/XXyddyOkLS5+3I+XBjK+K
        /8r7X7m+EP/YWyXNP3nt8X/u9y84KrVEfwjZ8Wsn7yFH4fu+7z2jjsZ57+xdLpNy59SK5PQl
        D3qa3x2VXxGm9GKi9FSV7k8Pz/QedAux1paOzM8/er360m3Nq7ceuz+ZHi+2btG17QrpTyqD
        TibdmCcTc0yWJ3L7krzE1toH/hybnnzUeBrUyPY4T8LrJs+m3SWFnpasCRosUl1KLMUZiYZa
        zEXFiQCt9X1y3wIAAA==
X-CMS-MailID: 20220701015451epcas2p2834c160df3be05cf73ff30eb597d10af
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20220701015451epcas2p2834c160df3be05cf73ff30eb597d10af
References: <20220701015226.32781-1-chanho61.park@samsung.com>
        <CGME20220701015451epcas2p2834c160df3be05cf73ff30eb597d10af@epcas2p2.samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Add an ARM pl330 dma controller DT node as pdma0.

Signed-off-by: Chanho Park <chanho61.park@samsung.com>
---
 arch/arm64/boot/dts/exynos/exynosautov9.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynosautov9.dtsi b/arch/arm64/boot/dts/exynos/exynosautov9.dtsi
index 00411d4c9c5a..c4cfa93e4c2e 100644
--- a/arch/arm64/boot/dts/exynos/exynosautov9.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynosautov9.dtsi
@@ -266,6 +266,16 @@ gic: interrupt-controller@10101000 {
 						 IRQ_TYPE_LEVEL_HIGH)>;
 		};
 
+		pdma0: dma-controller@1b2e0000 {
+			compatible = "arm,pl330", "arm,primecell";
+			reg = <0x1b2e0000 0x1000>;
+			interrupts = <GIC_SPI 48 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cmu_busmc CLK_GOUT_BUSMC_PDMA0_PCLK>;
+			clock-names = "apb_pclk";
+			arm,pl330-broken-no-flushp;
+			#dma-cells = <1>;
+		};
+
 		pinctrl_alive: pinctrl@10450000 {
 			compatible = "samsung,exynosautov9-pinctrl";
 			reg = <0x10450000 0x1000>;
-- 
2.36.1

