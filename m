Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5BE9CCA479
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 29 Jun 2022 01:59:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229473AbiF2B7T (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 28 Jun 2022 21:59:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229692AbiF2B7S (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 28 Jun 2022 21:59:18 -0400
Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4BC028E3A
        for <linux-samsung-soc@vger.kernel.org>; Tue, 28 Jun 2022 18:59:16 -0700 (PDT)
Received: from epcas2p2.samsung.com (unknown [182.195.41.54])
        by mailout3.samsung.com (KnoxPortal) with ESMTP id 20220629015914epoutp030525b5ef17d48fd3ecdb74861b984826~89NQWMRAf0663106631epoutp03F
        for <linux-samsung-soc@vger.kernel.org>; Wed, 29 Jun 2022 01:59:14 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20220629015914epoutp030525b5ef17d48fd3ecdb74861b984826~89NQWMRAf0663106631epoutp03F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1656467954;
        bh=tpb7L4kYy9RBb//WrckHj8bedxuRpSTAeB/th9IZLXY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Q0Vw/TUjX4YK2+DeS4KAvRbauBgeF/el23uH17F4Fj4/oY4ciXU76Byebo2Z3VSji
         r7VlgwWau3JQikVDWxDnaptVmpGD8Zb74H+Vj3mTV4Dpx/WuaDcMiuNTgwLGINw81w
         HGpBFOq0pasJsc4QLjBdSiA2CF+IG4tLvR16L3Pk=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
        epcas2p3.samsung.com (KnoxPortal) with ESMTP id
        20220629015914epcas2p34c161be963326c55f8d585c3d87c9865~89NP0xjKE2548325483epcas2p3S;
        Wed, 29 Jun 2022 01:59:14 +0000 (GMT)
Received: from epsmges2p4.samsung.com (unknown [182.195.36.90]) by
        epsnrtp1.localdomain (Postfix) with ESMTP id 4LXl4x3gZhz4x9Q1; Wed, 29 Jun
        2022 01:59:13 +0000 (GMT)
Received: from epcas2p3.samsung.com ( [182.195.41.55]) by
        epsmges2p4.samsung.com (Symantec Messaging Gateway) with SMTP id
        FB.35.09662.1F1BBB26; Wed, 29 Jun 2022 10:59:13 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
        epcas2p2.samsung.com (KnoxPortal) with ESMTPA id
        20220629015913epcas2p2403ccfdc43853ec60498b91b7ef374ea~89NO1oTUu1766417664epcas2p2D;
        Wed, 29 Jun 2022 01:59:13 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
        epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20220629015913epsmtrp128b88c26078085af185e76c358d647cd~89NO0u5_P2671026710epsmtrp1R;
        Wed, 29 Jun 2022 01:59:13 +0000 (GMT)
X-AuditID: b6c32a48-9f7ff700000025be-85-62bbb1f10417
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
        epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
        82.3A.08905.0F1BBB26; Wed, 29 Jun 2022 10:59:12 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.9.51]) by
        epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20220629015912epsmtip18e7ca60d6b179a7bc8aa0ea62fab7d0f~89NOj9ufY1166211662epsmtip1s;
        Wed, 29 Jun 2022 01:59:12 +0000 (GMT)
From:   Chanho Park <chanho61.park@samsung.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Alim Akhtar <alim.akhtar@samsung.com>,
        Sam Protsenko <semen.protsenko@linaro.org>,
        Jaewon Kim <jaewon02.kim@samsung.com>,
        devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Chanho Park <chanho61.park@samsung.com>
Subject: [PATCH 1/3] arm64: dts: exynosautov9: add pdma0 device tree node
Date:   Wed, 29 Jun 2022 10:56:48 +0900
Message-Id: <20220629015650.138527-2-chanho61.park@samsung.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220629015650.138527-1-chanho61.park@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprMJsWRmVeSWpSXmKPExsWy7bCmue7HjbuTDI6dFrd4MG8bm8Xl/doW
        84+cY7XY0XCE1aLvxUNmi02Pr7FazDi/j8mide8RdovnffuYHDg9Nq3qZPO4c20Pm8fmJfUe
        fVtWMXp83iQXwBqVbZORmpiSWqSQmpecn5KZl26r5B0c7xxvamZgqGtoaWGupJCXmJtqq+Ti
        E6DrlpkDdI6SQlliTilQKCCxuFhJ386mKL+0JFUhI7+4xFYptSAlp8C8QK84Mbe4NC9dLy+1
        xMrQwMDIFKgwITtjwbkG1oKX7BXTD3xmaWA8yNbFyMkhIWAi8e3xaSCbi0NIYAejxKS/r9kh
        nE+MEjcXPmGCcL4xSize9oMRpmXKk+VQVXsZJS5POQVV9ZFRovv9YrDBbAK6EluevwLrEBGI
        l3h+4T0LSBGzwCQmifMdzcxdjBwcwgKeEi+eG4HUsAioSuw7MZkJxOYVsJfYdOMbO8Q2eYkN
        83uZQWxOAQeJt/+2M0LUCEqcnPmEBcRmBqpp3jqbGaL+K7vE6fvqIOMlBFwkFk3MgggLS7w6
        vgVqpJTEy/42KLtYYumsT2D3Swg0AD2z7Rc0YIwlZj1rZwSZwyygKbF+lz7ESGWJI7egtvJJ
        dBz+yw4R5pXoaBOCaFSXOLB9OguELSvRPeczK4TtIbFrzztGSEhNZpR4MvsC2wRGhVlInpmF
        5JlZCIsXMDKvYhRLLSjOTU8tNiowgUdwcn7uJkZw6tTy2ME4++0HvUOMTByMhxglOJiVRHgX
        ntmZJMSbklhZlVqUH19UmpNafIjRFBjUE5mlRJPzgck7ryTe0MTSwMTMzNDcyNTAXEmc1ytl
        Q6KQQHpiSWp2ampBahFMHxMHp1QDU62pj1yO/Xo23kbvq6kVLcWvlscfDVOWyd1r0ZOspvZ5
        VdjHvs+tp7d4qUX47zlx86Pap/9n7z5YPvOiaIfE6g1LGY6wlAWf8g2r8NMKvONq8outonTC
        vmq7v8k822862+9REcleeKxuxbmrzXa36+aYplQHLM5MtVvb3fP/xm0p24r+398jM/IjbZnj
        5t79bRDRkFSzsH3hVX52m0vXlU5evh+7Yw579SMP5dXNpmd/HFjyK4/n4bMMe9YqOfFHGyMO
        830MdvavuHVP70kzc/q0WZ1K8dYXc39JXBRRTvmePcF+97K/uht+FGuo6G7YseJd6LaKslWz
        32dZ/cg0kAq3scs4/lk3/GddcvFZJZbijERDLeai4kQAVYEb2SYEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrPLMWRmVeSWpSXmKPExsWy7bCSnO6HjbuTDDactLJ4MG8bm8Xl/doW
        84+cY7XY0XCE1aLvxUNmi02Pr7FazDi/j8mide8RdovnffuYHDg9Nq3qZPO4c20Pm8fmJfUe
        fVtWMXp83iQXwBrFZZOSmpNZllqkb5fAlbHgXANrwUv2iukHPrM0MB5k62Lk5JAQMJGY8mQ5
        excjF4eQwG5GiZeHGlkgErISz97tYIewhSXutxxhhSh6zyjRdm02WIJNQFdiy/NXjCC2iEC8
        xOYvC1lAipgFpjFJdDyeAVTEwSEs4Cnx4rkRSA2LgKrEvhOTmUBsXgF7iU03vkEtkJfYML+X
        GcTmFHCQePtvO9hMIaCanbNWMUPUC0qcnPkE7DhmoPrmrbOZJzAKzEKSmoUktYCRaRWjZGpB
        cW56brFhgWFearlecWJucWleul5yfu4mRnCYa2nuYNy+6oPeIUYmDsZDjBIczEoivAvP7EwS
        4k1JrKxKLcqPLyrNSS0+xCjNwaIkznuh62S8kEB6YklqdmpqQWoRTJaJg1Oqgckg+dtD5ZtM
        /BOrq5cxG3+zWpk9f23tHs5GPbnlstPsdoWuufajXUEg4kNU9gL37fH/brr9ZcrMb465qtcW
        oGoyaccDa0OfaYd+PWq9WcwdZpD3+5xTsVmwldA/9SLxnxxcIhwFp63K2U5ZibLqfd3hveWw
        4OzdR9OuqH5bukjkMGcEQ31D1TnBdYfm7LtlkfXgzxrGsMBXyZlhvQt3/TttaKcplibNZzbV
        vS0v0qTl4b96oWtX9/37+cDaaccszS2Cp9bfD9neor8oR7uWefph1urorTfeJchcb5Tl+rKz
        R33O2bMtf/8ypDXbBbko71hyQCrlcGFFx7V2xeAvV+N6TKoqmiou7Lle2tMuqsRSnJFoqMVc
        VJwIAPnePbviAgAA
X-CMS-MailID: 20220629015913epcas2p2403ccfdc43853ec60498b91b7ef374ea
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20220629015913epcas2p2403ccfdc43853ec60498b91b7ef374ea
References: <20220629015650.138527-1-chanho61.park@samsung.com>
        <CGME20220629015913epcas2p2403ccfdc43853ec60498b91b7ef374ea@epcas2p2.samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Add an ARM pl330 dma controller DT node as pdma0.

Signed-off-by: Chanho Park <chanho61.park@samsung.com>
---
 arch/arm64/boot/dts/exynos/exynosautov9.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynosautov9.dtsi b/arch/arm64/boot/dts/exynos/exynosautov9.dtsi
index 00411d4c9c5a..3217d5fed018 100644
--- a/arch/arm64/boot/dts/exynos/exynosautov9.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynosautov9.dtsi
@@ -253,6 +253,16 @@ cmu_top: clock-controller@1b240000 {
 			clock-names = "oscclk";
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
 		gic: interrupt-controller@10101000 {
 			compatible = "arm,gic-400";
 			#interrupt-cells = <3>;
-- 
2.36.1

