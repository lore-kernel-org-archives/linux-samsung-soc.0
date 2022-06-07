Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 851EEC43334
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  7 Jun 2022 07:03:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237430AbiFGHDh (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 7 Jun 2022 03:03:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43682 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237433AbiFGHDc (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 7 Jun 2022 03:03:32 -0400
Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6407613FAF
        for <linux-samsung-soc@vger.kernel.org>; Tue,  7 Jun 2022 00:03:29 -0700 (PDT)
Received: from epcas2p4.samsung.com (unknown [182.195.41.56])
        by mailout2.samsung.com (KnoxPortal) with ESMTP id 20220607070327epoutp0233b45803284cd7b686766a1359de56a1~2RKl8oINt1913219132epoutp02K
        for <linux-samsung-soc@vger.kernel.org>; Tue,  7 Jun 2022 07:03:27 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20220607070327epoutp0233b45803284cd7b686766a1359de56a1~2RKl8oINt1913219132epoutp02K
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1654585407;
        bh=NBWjWlY2TaMrSi0e6sb5p2UTiyWC5KJi9atCINvmi4Q=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=JqS/R+Nzw1twS1Qo+7CJenPQJxeiF1ohB8bjpRvj8AVAcCRYcm+G6O7FvlFY9aogn
         52Dmhqki8jvtYDEpoxWyOxPvszivTtdVRtMeVgCIdZfqiLRdVK0E95a+4RDHY7jUCI
         bxrxQ+nizynZuINDdgK77D/akzjEkQSp4UKh7Txg=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
        epcas2p1.samsung.com (KnoxPortal) with ESMTP id
        20220607070327epcas2p11495398b886ba6b78a04873894ff4b32~2RKlZTjxm2164421644epcas2p1K;
        Tue,  7 Jun 2022 07:03:27 +0000 (GMT)
Received: from epsmges2p3.samsung.com (unknown [182.195.36.101]) by
        epsnrtp2.localdomain (Postfix) with ESMTP id 4LHLt60TZSz4x9Pt; Tue,  7 Jun
        2022 07:03:26 +0000 (GMT)
Received: from epcas2p1.samsung.com ( [182.195.41.53]) by
        epsmges2p3.samsung.com (Symantec Messaging Gateway) with SMTP id
        22.86.10028.C38FE926; Tue,  7 Jun 2022 16:03:24 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
        epcas2p3.samsung.com (KnoxPortal) with ESMTPA id
        20220607070324epcas2p3d0402fec67aedd72e4bd6a39d12a3394~2RKio-jo80996109961epcas2p3g;
        Tue,  7 Jun 2022 07:03:24 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
        epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20220607070324epsmtrp294010cb0a01c8de904102870f3c9bd70~2RKioRpzr0739507395epsmtrp2e;
        Tue,  7 Jun 2022 07:03:24 +0000 (GMT)
X-AuditID: b6c32a47-589ff7000000272c-48-629ef83c58f1
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
        epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
        AF.74.11276.C38FE926; Tue,  7 Jun 2022 16:03:24 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.9.51]) by
        epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20220607070324epsmtip2e8198172b9c674ec97530df82973963d~2RKicVvMy1355813558epsmtip2f;
        Tue,  7 Jun 2022 07:03:24 +0000 (GMT)
From:   Chanho Park <chanho61.park@samsung.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Alim Akhtar <alim.akhtar@samsung.com>,
        linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Chanho Park <chanho61.park@samsung.com>
Subject: [PATCH RESEND v3 2/2] arm64: dts: exynosautov9-sadk: enable
 secondary ufs devices
Date:   Tue,  7 Jun 2022 16:02:51 +0900
Message-Id: <20220607070251.15795-3-chanho61.park@samsung.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220607070251.15795-1-chanho61.park@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprEJsWRmVeSWpSXmKPExsWy7bCmqa7Nj3lJBh93qFs8mLeNzeLyfm2L
        +UfOsVr0vXjIbLH39VZ2i02Pr7FazDi/j8mide8RdgcOj02rOtk87lzbw+axeUm9R9+WVYwe
        nzfJBbBGZdtkpCampBYppOYl56dk5qXbKnkHxzvHm5oZGOoaWlqYKynkJeam2iq5+AToumXm
        AF2ipFCWmFMKFApILC5W0rezKcovLUlVyMgvLrFVSi1IySkwL9ArTswtLs1L18tLLbEyNDAw
        MgUqTMjO2D/7OWPBVs6Ky01/2BsYb7J3MXJySAiYSHSfm8fSxcjFISSwg1Fi9+ObTBDOJ0aJ
        ufs2M0M43xglbvU+ZINp2fzjKyNEYi+jxMsdP6Ccj4wSU65eZwKpYhPQldjy/BVYQkRgOqPE
        mYcQLcwgLU9bv7CAVAkLxEh0Nr0Dm8sioCrx9/YasG5eATuJC2sPQ+2Tl9gwv5cZxOYUsJdo
        6D3HClEjKHFy5hOwOcxANc1bZ4MdKyHwkV3izraFjBDNLhIHepZCDRKWeHV8C9TfUhKf3+2F
        ihdLLJ31iQmiuYFR4vK2X1AJY4lZz9qBBnEAbdCUWL9LH8SUEFCWOHILai+fRMfhv+wQYV6J
        jjYhiEZ1iQPbp7NA2LIS3XM+s0LYHhIzW85AA3gSo8TNjg9sExgVZiF5ZxaSd2YhLF7AyLyK
        USy1oDg3PbXYqMAYHsnJ+bmbGMGJU8t9B+OMtx/0DjEycTAeYpTgYFYS4fWfPDdJiDclsbIq
        tSg/vqg0J7X4EKMpMLAnMkuJJucDU3deSbyhiaWBiZmZobmRqYG5kjivV8qGRCGB9MSS1OzU
        1ILUIpg+Jg5OqQam1Xk7V34y/XB157v4q0f/b++Q3nD56oHHE8VrRRav3zd/U+LddNUtX9fM
        fZPwjWXrXgtPpecbfp5x3CITE9lvHf3gdvHVtFeHlZr+8dxxnK+TOonn756UNM7Nq9/u5/k9
        43MI60X5C08nXC5fdz2x6mDysgsbFeP8DVLZTCOXtDU/meq8pVZWczmrocbUjd05CRLXswXO
        +P2+rnp/vV3tTjOm9/GbNWP7Tl9T3mvy/UeB+0TF2xsdY7O/C8evOswp9PjX9fWnagweXz5f
        tWa1s6Hm7+rdoorHw0wmvWfmiJ49y9v0/cqPMj+NFoh9jfi75UcV30eWn1fi7vA+/3yAxcGS
        Jfpet+O0VH4L1uKuWXFKLMUZiYZazEXFiQBFaCDqJQQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrFLMWRmVeSWpSXmKPExsWy7bCSvK7Nj3lJBm9aeC0ezNvGZnF5v7bF
        /CPnWC36Xjxkttj7eiu7xabH11gtZpzfx2TRuvcIuwOHx6ZVnWwed67tYfPYvKTeo2/LKkaP
        z5vkAlijuGxSUnMyy1KL9O0SuDL2z37OWLCVs+Jy0x/2Bsab7F2MnBwSAiYSm398Zexi5OIQ
        EtjNKLF4+hYmiISsxLN3O6CKhCXutxxhhSh6zyjxfsUtNpAEm4CuxJbnrxhBbBGB6YwSU5d6
        gdjMAvuB7PvhILawQJTEz0cvWUBsFgFVib+314At4BWwk7iw9jAbxAJ5iQ3ze5lBbE4Be4mG
        3nOsILYQUM3Ku5NZIeoFJU7OfMICMV9eonnrbOYJjAKzkKRmIUktYGRaxSiZWlCcm55bbFhg
        mJdarlecmFtcmpeul5yfu4kRHNxamjsYt6/6oHeIkYmD8RCjBAezkgiv/+S5SUK8KYmVValF
        +fFFpTmpxYcYpTlYlMR5L3SdjBcSSE8sSc1OTS1ILYLJMnFwSjUwiS8/IqM5hfmw2Lp30od/
        Zm/deN2Tyb/56HozN5tSbqGQHNb96569WHvs85vNLYzxe9LOiv4Sua59ucjtZ93ibxI7tshX
        x0um/G6aPnvNg/dCxdL/eTc7NotPvqq3v9P95zyPFU46PwwlCqfFXS5ZXnFSN8w7Tjno1kOO
        pIsbpsW/ubRqzurFHxfUyB3gXMfqKB90p3j1bF43/d33/+8Ie2a52qrN/K2Grd9d9W/qX+5G
        3Horacam1iC6upBzAss1kRNiAhl7pbJ3n30hemvqp36xQtctR6+9Om4ccv2WqOOCN3V7L/fP
        KarQfjLhzDdlg/VXptx0P/7OTbqzRsVyV+6XBTIRAuHTfu9jzU13L1NiKc5INNRiLipOBACG
        AcK/3QIAAA==
X-CMS-MailID: 20220607070324epcas2p3d0402fec67aedd72e4bd6a39d12a3394
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20220607070324epcas2p3d0402fec67aedd72e4bd6a39d12a3394
References: <20220607070251.15795-1-chanho61.park@samsung.com>
        <CGME20220607070324epcas2p3d0402fec67aedd72e4bd6a39d12a3394@epcas2p3.samsung.com>
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

