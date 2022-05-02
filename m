Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2296C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  2 May 2022 09:01:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1383983AbiEBJE6 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 2 May 2022 05:04:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1384016AbiEBJEp (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 2 May 2022 05:04:45 -0400
Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30668583AC
        for <linux-samsung-soc@vger.kernel.org>; Mon,  2 May 2022 02:01:14 -0700 (PDT)
Received: from epcas2p3.samsung.com (unknown [182.195.41.55])
        by mailout2.samsung.com (KnoxPortal) with ESMTP id 20220502090107epoutp02417f0a50816ae82c13cf429eaa887133~rPjDO-Xb-0999409994epoutp02V
        for <linux-samsung-soc@vger.kernel.org>; Mon,  2 May 2022 09:01:07 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20220502090107epoutp02417f0a50816ae82c13cf429eaa887133~rPjDO-Xb-0999409994epoutp02V
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1651482067;
        bh=MA4GmXVbrT+ZFlbfmp7APDbyvksDjC//PhPioNn6Iaw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=jPki935dmvYBINY+ChcHGte7eQGlnIoPN/Ik517MSNQ1c3o3eKTTfgiiUaS7R1IS0
         DF/c1E0aUdEq6MroaKKtZ89mVaZ0H9ZAJmOKwQzoDv90Xpo4x2kNhKyTm2e1nVRDe0
         5k8UveSE71UytWJEBAJYlI9OncfEBjHh3jxUnL5A=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
        epcas2p3.samsung.com (KnoxPortal) with ESMTP id
        20220502090107epcas2p35a31c348913e00aae5744b745d2db1f4~rPjCucfQ01120311203epcas2p3S;
        Mon,  2 May 2022 09:01:07 +0000 (GMT)
Received: from epsmges2p2.samsung.com (unknown [182.195.36.99]) by
        epsnrtp1.localdomain (Postfix) with ESMTP id 4KsHBR0RL2z4x9QK; Mon,  2 May
        2022 09:01:03 +0000 (GMT)
Received: from epcas2p2.samsung.com ( [182.195.41.54]) by
        epsmges2p2.samsung.com (Symantec Messaging Gateway) with SMTP id
        3B.53.09764.DCD9F626; Mon,  2 May 2022 18:01:02 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
        epcas2p2.samsung.com (KnoxPortal) with ESMTPA id
        20220502090101epcas2p25f432efec210ebe4e5179719524bd346~rPi9WTgfk0159201592epcas2p2z;
        Mon,  2 May 2022 09:01:01 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
        epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20220502090101epsmtrp1dd6022ecc83f37c684c30a33d93fac38~rPi9TWKa42529725297epsmtrp1f;
        Mon,  2 May 2022 09:01:01 +0000 (GMT)
X-AuditID: b6c32a46-f75ff70000002624-f0-626f9dcdbc97
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
        epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
        CF.EB.08853.DCD9F626; Mon,  2 May 2022 18:01:01 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.9.51]) by
        epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20220502090101epsmtip204af5b7e0163a145abd9e784f172a622~rPi9JsFae1727017270epsmtip25;
        Mon,  2 May 2022 09:01:01 +0000 (GMT)
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
Subject: [PATCH 12/12] arm64: dts: exynosautov9: switch ufs clock node
Date:   Mon,  2 May 2022 18:02:30 +0900
Message-Id: <20220502090230.12853-13-chanho61.park@samsung.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220502090230.12853-1-chanho61.park@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrEJsWRmVeSWpSXmKPExsWy7bCmme65uflJBh3TGC0ezNvGZnF5v7bF
        9S/PWS3mHznHatH34iGzxd7XW9ktPvbcY7WYcX4fk8XFU64WrXuPsFscftPOavHv2kYWi+d9
        QPFVu/4wOvB5vL/Ryu6xc9Zddo9NqzrZPO5c28Pm0bdlFaPH501yAWxR2TYZqYkpqUUKqXnJ
        +SmZeem2St7B8c7xpmYGhrqGlhbmSgp5ibmptkouPgG6bpk5QMcqKZQl5pQChQISi4uV9O1s
        ivJLS1IVMvKLS2yVUgtScgrMC/SKE3OLS/PS9fJSS6wMDQyMTIEKE7IzjnV8Yy54wVXxd8ps
        pgbGexxdjJwcEgImEl0TX7F3MXJxCAnsYJRYsKeHGcL5xChx7O9GJgjnG6PE5dN72GFaJn37
        wAKR2MsoceT9TRaQhJDAR0aJT3cNQGw2AV2JLc9fMYIUiQh0MUtc7LsH1sEssJVR4viNWUwg
        VcICbhLf5l8Gs1kEVCUOfH7DCmLzCthLXF69EcjmAFonL/FvcShImBMofGbrc0aIEkGJkzOf
        gC1mBipp3job7G4JgYUcEq/3LGeD6HWRWPIrAuJqYYlXx7dAfSAl8bK/Dcoullg66xMTRG8D
        0JvbfrFBJIwlZj1rZwSZwyygKbF+lz7ESGWJI7eg1vJJdBz+yw4R5pXoaBOCaFSXOLB9OguE
        LSvRPeczK4TtIfHt+iFoUE9ilNj3YjvbBEaFWUi+mYXkm1kIixcwMq9iFEstKM5NTy02KjCC
        x3Byfu4mRnDi1XLbwTjl7Qe9Q4xMHIyHGCU4mJVEeNs25CQJ8aYkVlalFuXHF5XmpBYfYjQF
        BvVEZinR5Hxg6s8riTc0sTQwMTMzNDcyNTBXEuf1StmQKCSQnliSmp2aWpBaBNPHxMEp1cDU
        rDXZRqLwpc0ksT7FmbWLDL43eD8PVX/26P+P5DLGrbb+uvuz1hs57zq47bCTkYTTTCfT9d9X
        7DlgtPL09jWRCQGsrQy9z0K4YjRzt62S/7NtYl9axvGXy45djH1jO2vqlNqwBUxB5Tv2J6dW
        Tbqw+32lo/QDw9fbu3edUvh3VD2hVNqxVzTg5t4thxQWFkUK/Z+Zs3HP82zdSqur/pzXzjBL
        MxbX6Kx5cezMLnulyNOn9917HHX6QLTHR5mTntvM8wSfLqmS9tLewHok/d7dc+123BcXzrx6
        5cGNPxbT/ojq8++9tF9BxTTjbfMM2fprKo0H3S5tFTeU+5ntZFO9uqfXQWWC8pabJ00sBHVa
        lViKMxINtZiLihMBuri2qkUEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrHLMWRmVeSWpSXmKPExsWy7bCSvO7ZuflJBrumClk8mLeNzeLyfm2L
        61+es1rMP3KO1aLvxUNmi72vt7JbfOy5x2ox4/w+JouLp1wtWvceYbc4/Kad1eLftY0sFs/7
        gOKrdv1hdODzeH+jld1j56y77B6bVnWyedy5tofNo2/LKkaPz5vkAtiiuGxSUnMyy1KL9O0S
        uDKOdXxjLnjBVfF3ymymBsZ7HF2MnBwSAiYSk759YOli5OIQEtjNKNHfN58NIiEr8ezdDnYI
        W1jifssRVoii94wSy079AytiE9CV2PL8FSNIQkRgArPEmysf2EEcZoGdjBJ3Xp0CqxIWcJP4
        Nv8yE4jNIqAqceDzG1YQm1fAXuLy6o1ANgfQCnmJf4tDQcKcQOEzW58zgthCAnYSP07cZ4Yo
        F5Q4OfMJC4jNDFTevHU28wRGgVlIUrOQpBYwMq1ilEwtKM5Nzy02LDDMSy3XK07MLS7NS9dL
        zs/dxAiOEi3NHYzbV33QO8TIxMF4iFGCg1lJhLdtQ06SEG9KYmVValF+fFFpTmrxIUZpDhYl
        cd4LXSfjhQTSE0tSs1NTC1KLYLJMHJxSDUyZ00R2HdRXF+l7NrthfiGneNrhgw17/grudQzV
        SnZVWRtvz/Dh/Jn4N4aJVZnnpl3SnFO8ZWNkQ7OidAmD68XnedfMEqNzXHy49L0KU/9oblh4
        pOxwaHPpsiY3UbXTcgJJggf6F0uel/uslLE7it/g6NrUI+LqiRoVWhMO/51mm7H8ZV1sU130
        Wv8Ovv2HD4WwcrUGXxDOXn5H/WZ1bE3Kilv3917x+sPrZXTRR9jdtWLZyq+3H29p+iswe1bG
        4ZzGRSK+akwFbDMnmFhv+y/388UR/YjZYqX+Ij96oz+pHipfpveYb9vp169qyuJizpgK7XvA
        +Tn615KVt5KDH2T0r/CRiFsXzrur57hGshJLcUaioRZzUXEiADVmc+wBAwAA
X-CMS-MailID: 20220502090101epcas2p25f432efec210ebe4e5179719524bd346
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20220502090101epcas2p25f432efec210ebe4e5179719524bd346
References: <20220502090230.12853-1-chanho61.park@samsung.com>
        <CGME20220502090101epcas2p25f432efec210ebe4e5179719524bd346@epcas2p2.samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Use cmu_fsys's clock node instead of dummy ufs clock node.

Signed-off-by: Chanho Park <chanho61.park@samsung.com>
---
 arch/arm64/boot/dts/exynos/exynosautov9.dtsi | 14 ++------------
 1 file changed, 2 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/boot/dts/exynos/exynosautov9.dtsi b/arch/arm64/boot/dts/exynos/exynosautov9.dtsi
index 149cf8c2a797..d4328307a6cc 100644
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
@@ -371,8 +361,8 @@ ufs_0: ufs0@17e00000 {
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

