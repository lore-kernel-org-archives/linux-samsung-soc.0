Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FC5AC433EF
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  3 May 2022 10:58:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234502AbiECLBg (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 3 May 2022 07:01:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234538AbiECLBa (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 3 May 2022 07:01:30 -0400
Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 233A11DA67
        for <linux-samsung-soc@vger.kernel.org>; Tue,  3 May 2022 03:57:50 -0700 (PDT)
Received: from epcas2p1.samsung.com (unknown [182.195.41.53])
        by mailout2.samsung.com (KnoxPortal) with ESMTP id 20220503105735epoutp022e964d792d08d6647cd48e68a75b9a32~rkyBKeful1126311263epoutp02i
        for <linux-samsung-soc@vger.kernel.org>; Tue,  3 May 2022 10:57:35 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20220503105735epoutp022e964d792d08d6647cd48e68a75b9a32~rkyBKeful1126311263epoutp02i
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1651575455;
        bh=7jsOef8nU8lcAfokG7blrAB7Ak/JnujaWFbKZe9QzF8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=bq70/yiz+RRI0K3ZIH2KGMx71wEjNFOl6TavYop6cCNJ4jpbvVKBALFtCewvSM5h6
         +b4NIwEONiz5+R09UXcfadIP09jIuJtrqZuby46bXsaBgYhPi4F6A+cOFoj9vBDN5K
         RNfhCF8OjZH1LPS6qdS+kpyMJ6+ANLb9uzBP679E=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
        epcas2p1.samsung.com (KnoxPortal) with ESMTP id
        20220503105733epcas2p1aa19674ba203a181edf5ca0b5253835d~rkx-96rDN1158911589epcas2p1P;
        Tue,  3 May 2022 10:57:33 +0000 (GMT)
Received: from epsmges2p3.samsung.com (unknown [182.195.36.98]) by
        epsnrtp4.localdomain (Postfix) with ESMTP id 4KsxkL66RGz4x9Q5; Tue,  3 May
        2022 10:57:30 +0000 (GMT)
Received: from epcas2p4.samsung.com ( [182.195.41.56]) by
        epsmges2p3.samsung.com (Symantec Messaging Gateway) with SMTP id
        F1.E8.10028.A9A01726; Tue,  3 May 2022 19:57:30 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
        epcas2p1.samsung.com (KnoxPortal) with ESMTPA id
        20220503105730epcas2p1d033e65a2acb39fe23ea5c218d24896c~rkx8WN-x01158911589epcas2p1I;
        Tue,  3 May 2022 10:57:30 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
        epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20220503105730epsmtrp22e962c2fa77bdb7db9d39679a60c8e47~rkx8VZeC81021210212epsmtrp2S;
        Tue,  3 May 2022 10:57:30 +0000 (GMT)
X-AuditID: b6c32a47-589ff7000000272c-5f-62710a9a067f
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
        epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
        1D.A3.08924.99A01726; Tue,  3 May 2022 19:57:29 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.9.51]) by
        epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20220503105729epsmtip22fea1746e1a4dd47b67a016243dee07e~rkx8IqrBm1109211092epsmtip2F;
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
Subject: [PATCH v2 12/12] arm64: dts: exynosautov9: switch ufs clock node
Date:   Tue,  3 May 2022 19:59:14 +0900
Message-Id: <20220503105914.117625-13-chanho61.park@samsung.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220503105914.117625-1-chanho61.park@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrPJsWRmVeSWpSXmKPExsWy7bCmhe4srsIkg0m3tC0ezNvGZnF5v7bF
        9S/PWS3mHznHatH34iGzxd7XW9ktPvbcY7WYcX4fk8XFU64WrXuPsFscftPOavHv2kYWi+d9
        QPFVu/4wOvB5vL/Ryu6xc9Zddo9NqzrZPO5c28Pm0bdlFaPH501yAWxR2TYZqYkpqUUKqXnJ
        +SmZeem2St7B8c7xpmYGhrqGlhbmSgp5ibmptkouPgG6bpk5QMcqKZQl5pQChQISi4uV9O1s
        ivJLS1IVMvKLS2yVUgtScgrMC/SKE3OLS/PS9fJSS6wMDQyMTIEKE7IzTuz8y1rwgqvi6PvP
        LA2M9zi6GDk5JARMJM40XGADsYUEdjBKfGgR7mLkArI/MUqsnNbGBOF8ZpTYNOMkkMMB1rH1
        PB9EfBejRM/C+cwQzkdGiaVnPrOAjGIT0JXY8vwVI0hCRKCLWeJi3z0WEIdZYCujxPEbs5hA
        qoQFPCXenJzKCjKWRUBVYtuhFJAwr4CDxK9z25ghtslL/FscChLmBApf33WOCaJEUOLkzCdg
        u5iBSpq3zgY7QkJgJYdE67KtLBC/uUh8OXqLGcIWlnh1fAs7hC0l8fndXjYIu1hi6axPTBDN
        DYwSl7f9gkoYS8x61s4IcgSzgKbE+l36EPcoSxy5BbWXT6Lj8F92iDCvREebEESjusSB7dOh
        LpCV6J7zmRWixENiZqMqJKAnM0o0rUucwKgwC8kzs5A8Mwth7QJG5lWMYqkFxbnpqcVGBcbw
        6E3Oz93ECE65Wu47GGe8/aB3iJGJg/EQowQHs5IIr/PSgiQh3pTEyqrUovz4otKc1OJDjKbA
        gJ7ILCWanA9M+nkl8YYmlgYmZmaG5kamBuZK4rxeKRsShQTSE0tSs1NTC1KLYPqYODilGphS
        XpVuqP+4ylHkgeD/O1X7omS/tczf5xgn2W+Te0ND4NbbMi+GTucL3dZhn16FJ9w+NtvZ/ni2
        wcwF+S7uQTdknk+ZWLxjWvOX2CApYYMfVSecltoesbl1wfXnart/H9dvdrzo0ek2N28/u5hs
        Ss3vnZbey3jmVatXf3l+8eS9cJ8reXL/He+ITEibs7B+Wd6xlVHRl61CHsmKqOxV+fz8ymvl
        X+VzG5fPm35B6UMU35aLyXrz15xMuffypuX6ty/S40XmdJnvPbNqef/kmZxuczYtuXRKJ1X7
        +F/n7I23Ck49nJDG80V01nKrynWW07bO5W9e3m3hedzNf47SpZf7JtyTU1D/xd0ZNiflxpcS
        EyWW4oxEQy3mouJEABQX/AlCBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrDLMWRmVeSWpSXmKPExsWy7bCSvO5MrsIkgycLrC0ezNvGZnF5v7bF
        9S/PWS3mHznHatH34iGzxd7XW9ktPvbcY7WYcX4fk8XFU64WrXuPsFscftPOavHv2kYWi+d9
        QPFVu/4wOvB5vL/Ryu6xc9Zddo9NqzrZPO5c28Pm0bdlFaPH501yAWxRXDYpqTmZZalF+nYJ
        XBkndv5lLXjBVXH0/WeWBsZ7HF2MHBwSAiYSW8/zdTFycQgJ7GCUmPvtLmMXIydQXFbi2bsd
        7BC2sMT9liOsEEXvGSVuPjnPDJJgE9CV2PL8FSNIQkRgArPEmysf2EEcZoGdjBJ3Xp1iA6kS
        FvCUeHNyKivIOhYBVYlth1JAwrwCDhK/zm1jhrhCXuLf4lCQMCdQ+Pquc0wgtpCAvcTOv9uZ
        IcoFJU7OfMICYjMDlTdvnc08gVFgFpLULCSpBYxMqxglUwuKc9Nziw0LjPJSy/WKE3OLS/PS
        9ZLzczcxgiNES2sH455VH/QOMTJxMB5ilOBgVhLhdV5akCTEm5JYWZValB9fVJqTWnyIUZqD
        RUmc90LXyXghgfTEktTs1NSC1CKYLBMHp1QDU1TbYYvFu2X0MvQuMUlI1teyepis9V94ZOYd
        3gnP53HnM16a0HP/zSq2oAsJ2v4GCcte2D0+e+hidMwM3ZpXIoef8deqvfrfa2d9M2L1Mlmf
        nONxohoFNxfXrJFjWfJD27Yi1tfC8NnGJ3Jh1x863S5/Fn9gv1L2bV3bV1/eC8070uC2Tr1x
        X/2N1U9vnV1jf+Vpf2XovJ0Wq/z3rk/MW1KmoKvk59tsbMrRqRjVpLCoydrHQGgb/5pHDief
        vFd77/B11aMNbi3OHsen/U0K3ftq839n2UvvNLV3rXzDNLs0U17E5klOfu+5vEbJn3fPL9/0
        MejA7RdCSwouPNv7/fn2C/FPo821FSeGr0j3+6XEUpyRaKjFXFScCAByZ1VG/wIAAA==
X-CMS-MailID: 20220503105730epcas2p1d033e65a2acb39fe23ea5c218d24896c
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20220503105730epcas2p1d033e65a2acb39fe23ea5c218d24896c
References: <20220503105914.117625-1-chanho61.park@samsung.com>
        <CGME20220503105730epcas2p1d033e65a2acb39fe23ea5c218d24896c@epcas2p1.samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Use cmu_fsys's clock node instead of dummy ufs clock node.

Signed-off-by: Chanho Park <chanho61.park@samsung.com>
---
 arch/arm64/boot/dts/exynos/exynosautov9.dtsi | 14 ++------------
 1 file changed, 2 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/boot/dts/exynos/exynosautov9.dtsi b/arch/arm64/boot/dts/exynos/exynosautov9.dtsi
index f2f7565ba7cf..8b12c46dea3d 100644
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

