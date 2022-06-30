Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82578C43334
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 30 Jun 2022 02:20:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231361AbiF3CUA (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 29 Jun 2022 22:20:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42288 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230527AbiF3CT7 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 29 Jun 2022 22:19:59 -0400
Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CACE036689
        for <linux-samsung-soc@vger.kernel.org>; Wed, 29 Jun 2022 19:19:55 -0700 (PDT)
Received: from epcas2p4.samsung.com (unknown [182.195.41.56])
        by mailout3.samsung.com (KnoxPortal) with ESMTP id 20220630021953epoutp03635b0659a1ff96d8c8a008b75c07a4c5~9RIkOiM711581615816epoutp03T
        for <linux-samsung-soc@vger.kernel.org>; Thu, 30 Jun 2022 02:19:53 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20220630021953epoutp03635b0659a1ff96d8c8a008b75c07a4c5~9RIkOiM711581615816epoutp03T
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1656555593;
        bh=XGrPHmw8/EjbFix+3viYi7oGMD+uIJXV8+LyemqtGdU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=UvP6XkgStXsv0nLxa2QIBiNRSXpLzheCbgfFOdjWklfKPglUgk6mLnr4rz+/IO4KS
         dw3SkKyBroFcqrJxuiyY2DY+OwxBUYnoJ+dxxmxXoPgVRaUJ/uRRDHkuKqfxi6gQ6s
         1IIfE6RBfygaZus90jgfhjERuJuTULk4RKzHMh3Q=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
        epcas2p3.samsung.com (KnoxPortal) with ESMTP id
        20220630021952epcas2p313cdb61e0da1d84a3faaaf79bae9478e~9RIj0gTev1312413124epcas2p3b;
        Thu, 30 Jun 2022 02:19:52 +0000 (GMT)
Received: from epsmges2p1.samsung.com (unknown [182.195.36.102]) by
        epsnrtp1.localdomain (Postfix) with ESMTP id 4LYMVJ3FWWz4x9Pv; Thu, 30 Jun
        2022 02:19:52 +0000 (GMT)
Received: from epcas2p4.samsung.com ( [182.195.41.56]) by
        epsmges2p1.samsung.com (Symantec Messaging Gateway) with SMTP id
        94.C1.09666.8480DB26; Thu, 30 Jun 2022 11:19:52 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
        epcas2p4.samsung.com (KnoxPortal) with ESMTPA id
        20220630021951epcas2p44f7b0f49a9d9209793e90cdc8ec0d536~9RIiluurm0961809618epcas2p43;
        Thu, 30 Jun 2022 02:19:51 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
        epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20220630021951epsmtrp266fe0bb1264e031615e2a8340896800b~9RIikWqRC1699116991epsmtrp2Z;
        Thu, 30 Jun 2022 02:19:51 +0000 (GMT)
X-AuditID: b6c32a45-471ff700000025c2-3e-62bd08487a18
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
        epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
        C1.1A.08905.7480DB26; Thu, 30 Jun 2022 11:19:51 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.9.51]) by
        epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20220630021951epsmtip2ce19f1e2c3daa2f9858138cc18495a69~9RIiYrp9b3173531735epsmtip2a;
        Thu, 30 Jun 2022 02:19:51 +0000 (GMT)
From:   Chanho Park <chanho61.park@samsung.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Alim Akhtar <alim.akhtar@samsung.com>,
        Sam Protsenko <semen.protsenko@linaro.org>,
        Jaewon Kim <jaewon02.kim@samsung.com>,
        devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Chanho Park <chanho61.park@samsung.com>
Subject: [PATCH v2 3/4] arm64: dts: exynosautov9: add pdma0 device tree node
Date:   Thu, 30 Jun 2022 11:16:55 +0900
Message-Id: <6cccac5c12b58cb590269f19a19715f005d2087e.1656554759.git.chanho61.park@samsung.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <cover.1656554759.git.chanho61.park@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupnk+LIzCtJLcpLzFFi42LZdljTQteDY2+SweNZEhYP5m1js7i8X9ti
        /pFzrBY7Go6wWvS9eMhssenxNVaLGef3MVm07j3CbvG8bx+TA6fHplWdbB53ru1h89i8pN6j
        b8sqRo/Pm+QCWKOybTJSE1NSixRS85LzUzLz0m2VvIPjneNNzQwMdQ0tLcyVFPISc1NtlVx8
        AnTdMnOAzlFSKEvMKQUKBSQWFyvp29kU5ZeWpCpk5BeX2CqlFqTkFJgX6BUn5haX5qXr5aWW
        WBkaGBiZAhUmZGcs3/2EseAve8WR+cUNjJfYuhg5OSQETCTW3lzNBGILCexglJjdLdTFyAVk
        f2KUWNXWxwrhfGOUON52Aa5jzZQV7BCJvYwSvWfOQjkfGSWur/jLDFLFJqArseX5K0YQW0Qg
        XuL5hfcsIEXMApOYJM53NIMVCQv4SMxo2Q20nIODRUBV4s1nERCTF6h+0X0LiGXyEhvm94JV
        cwrYSjSt/Q5m8woISpyc+YQFxGYGqmneOpsZov4nu8SC3iwI20ViyY4rTBC2sMSr41vYIWwp
        ic/v9kI9UyyxdNYnJpDTJAQaGCUub/sFlTCWmPWsnRHkHmYBTYn1u/RBTAkBZYkjt6DW8kl0
        HP7LDhHmlehoE4JoVJc4sH06C4QtK9E95zMrRImHRMdpA0g4T2CUmPIqbwKjwiwkv8xC8sss
        hLULGJlXMYqlFhTnpqcWGxUYwiM3OT93EyM4ZWq57mCc/PaD3iFGJg7GQ4wSHMxKIrwLz+xM
        EuJNSaysSi3Kjy8qzUktPsRoCgznicxSosn5wKSdVxJvaGJpYGJmZmhuZGpgriTO65WyIVFI
        ID2xJDU7NbUgtQimj4mDU6qBSSDu2VSJf+3x6TcaatuuXvawuLxnZruthfv69793Vjl1WNs+
        s9qvsLw+N331jc8cJhNP6fTZmD9b1z9D9leCV/bygBcK6nN2qS5/JX1PuHJPBr9/qfxOxqkx
        G58dVfA1YG2Kb6o58VD1sNTzw1emlf3MOXN+StwCxuVelevcdXd6eFf9EV+4t7dbeP6Z/kP/
        +iY9/GLrs/xabdKv7hhGTg2f/YERR5wWHpoqPMvgnvzjtUoL7IJjHW8xr9XsWBNpfnhB04Wz
        Z0VSZ2V5aK46Of+fgmZj196o1tyzWk4id5dvPjjf+ewp1nBxjkPRO+xUKgW8KhLdpmdufZd2
        9Nrhl7obGuSrcny4b3FktMosUmIpzkg01GIuKk4EAKkZ2K4iBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrLLMWRmVeSWpSXmKPExsWy7bCSvK47x94kg7+XFC0ezNvGZnF5v7bF
        /CPnWC12NBxhteh78ZDZYtPja6wWM87vY7Jo3XuE3eJ53z4mB06PTas62TzuXNvD5rF5Sb1H
        35ZVjB6fN8kFsEZx2aSk5mSWpRbp2yVwZSzf/YSx4C97xZH5xQ2Ml9i6GDk5JARMJNZMWcHe
        xcjFISSwm1Hi7/Q+qISsxLN3O9ghbGGJ+y1HWCGK3jNKtO3cxAqSYBPQldjy/BUjiC0iEC+x
        +ctCFpAiZoFpTBIdj2eAdQsL+EjMaNnN1MXIwcEioCrx5rMIiMkLVL/ovgXEfHmJDfN7mUFs
        TgFbiaa138FsIQEbid0LloKN5xUQlDg58wkLiM0MVN+8dTbzBEaBWUhSs5CkFjAyrWKUTC0o
        zk3PLTYsMMxLLdcrTswtLs1L10vOz93ECA5xLc0djNtXfdA7xMjEwXiIUYKDWUmEd+GZnUlC
        vCmJlVWpRfnxRaU5qcWHGKU5WJTEeS90nYwXEkhPLEnNTk0tSC2CyTJxcEo1MLXYW2+95hN/
        yWTRwe9eSTZtJVufLZrl2W0+sUGpKnB2tvO80z+2pS//3h8ps/3EzMCH74u1+BuDGCfEenDc
        /dnUzDZp3S0DB84Mh/0x1T6cP+6rX7VfeTi5t3GuK1Pcp7YOcd4fuactTM0Y3jUJXnhx/3/Q
        NJY/n2yNVx9zPeoyY/Prjzzpi0TnRmV26z6akHa/cbHc7PfLm/4Fy2xfUNNRHSL1ylpjoeud
        E9sbbmqeUGgIa8ysKw2/zJSsq3Nm6dTbm9fOD1z5sDxkgde8+pXay5dsVyyv3igZ/mFN18T/
        a1PFZ9+c+8GBWTs3eLPdypynZ2vfSp0JbGTZ+1Qnawovb/fSVtebc4Nv3LzOMF2JpTgj0VCL
        uag4EQBFvR9h4AIAAA==
X-CMS-MailID: 20220630021951epcas2p44f7b0f49a9d9209793e90cdc8ec0d536
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20220630021951epcas2p44f7b0f49a9d9209793e90cdc8ec0d536
References: <cover.1656554759.git.chanho61.park@samsung.com>
        <CGME20220630021951epcas2p44f7b0f49a9d9209793e90cdc8ec0d536@epcas2p4.samsung.com>
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

