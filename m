Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AB23C04A68
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 29 Jul 2022 00:36:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233699AbiG2AgT (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 28 Jul 2022 20:36:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233676AbiG2AgS (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 28 Jul 2022 20:36:18 -0400
Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4725765665
        for <linux-samsung-soc@vger.kernel.org>; Thu, 28 Jul 2022 17:36:15 -0700 (PDT)
Received: from epcas2p1.samsung.com (unknown [182.195.41.53])
        by mailout1.samsung.com (KnoxPortal) with ESMTP id 20220729003613epoutp01b2f96770ec132f78a0f27c0e22176486~GJbVWgp3S0269602696epoutp01E
        for <linux-samsung-soc@vger.kernel.org>; Fri, 29 Jul 2022 00:36:13 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20220729003613epoutp01b2f96770ec132f78a0f27c0e22176486~GJbVWgp3S0269602696epoutp01E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1659054973;
        bh=UqZEbk3ZGslUU7AM/gfSgRiTLXgIYCkiVIdqh+advB8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=geKmN+6Wrj+j383lRBm1pSr088fF/dxmpTVPuiQg5Re+zzMfPqZ4iU7oRmuqIRPnr
         o4WLatAg++/yxlGqpK2iqkbObTsWl95KyfaVNMscqcI4cHsvwJYzefZ6Z1/Tg8mEHJ
         MUjJijKbMBTg2CuDe88LNL61glpr//SrNDEh1A8Y=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
        epcas2p1.samsung.com (KnoxPortal) with ESMTP id
        20220729003612epcas2p147b0fa410f9d85b18b8e61ac0ce5d3a9~GJbU2y1-w2636226362epcas2p1-;
        Fri, 29 Jul 2022 00:36:12 +0000 (GMT)
Received: from epsmges2p1.samsung.com (unknown [182.195.36.88]) by
        epsnrtp2.localdomain (Postfix) with ESMTP id 4Lv7qJ4Q2Sz4x9Pw; Fri, 29 Jul
        2022 00:36:12 +0000 (GMT)
Received: from epcas2p4.samsung.com ( [182.195.41.56]) by
        epsmges2p1.samsung.com (Symantec Messaging Gateway) with SMTP id
        1B.C1.09666.C7B23E26; Fri, 29 Jul 2022 09:36:12 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
        epcas2p3.samsung.com (KnoxPortal) with ESMTPA id
        20220729003611epcas2p3b041a6c19835d3ba25459cd4c3adc94f~GJbT4ZFHF2821828218epcas2p3i;
        Fri, 29 Jul 2022 00:36:11 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
        epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20220729003611epsmtrp21131ed9e8018fb24f70b93982ee8a47b~GJbT3elaH1035310353epsmtrp2Y;
        Fri, 29 Jul 2022 00:36:11 +0000 (GMT)
X-AuditID: b6c32a45-471ff700000025c2-22-62e32b7c352b
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
        epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
        B8.1B.08905.B7B23E26; Fri, 29 Jul 2022 09:36:11 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.9.51]) by
        epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20220729003611epsmtip2d1a3fa0d8e8cf1d1aa0aa2421a2a0b71~GJbTnq77b0075200752epsmtip2J;
        Fri, 29 Jul 2022 00:36:11 +0000 (GMT)
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
Subject: [PATCH v2 1/6] dt-bindings: clk: exynosautov9: add fys0 clock
 definitions
Date:   Fri, 29 Jul 2022 09:30:19 +0900
Message-Id: <6f70a59164ad2c5ce5581047ca39a91afc1105d9.1659054220.git.chanho61.park@samsung.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <cover.1659054220.git.chanho61.park@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrBJsWRmVeSWpSXmKPExsWy7bCmhW6N9uMkg7b5shYP5m1js7i8X9vi
        +pfnrBbzj5xjteh78ZDZYu/rrewWmx5fY7X42HOP1WLG+X1MFhdPuVq07j3CbnH4TTurxb9r
        G1ksnvcBxVft+sPowO/x/kYru8fOWXfZPTat6mTzuHNtD5vH5iX1Hn1bVjF6fN4kF8AelW2T
        kZqYklqkkJqXnJ+SmZduq+QdHO8cb2pmYKhraGlhrqSQl5ibaqvk4hOg65aZA3S1kkJZYk4p
        UCggsbhYSd/Opii/tCRVISO/uMRWKbUgJafAvECvODG3uDQvXS8vtcTK0MDAyBSoMCE748u0
        WywFz0UqOk5fYm5gPC/UxcjJISFgIvHs2yHWLkYuDiGBHYwSr++/ZIZwPjFKbLo0AyrzjVHi
        8YZ7rDAtLbOWs4DYQgJ7GSVa9+VB2B8ZJaYcVwax2QR0JbY8f8UI0iwi8JhJ4vCRNjYQh1mg
        jUli2rONYJOEBUIk3q3ewQZiswioSpzq6QeyOTh4BeIlGl/IQiyTl7h+s40ZxOYUsJXoavoO
        tphXQFDi5MwnYDYzUE3z1tnMEPVrOSRe3RIAGSMh4CJx4IoFRFhY4tXxLewQtpTE53d72SDs
        Yomlsz4xgZwmIdDAKHF52y+ohLHErGftjCBzmAU0Jdbv0ocYqSxx5BbUVj6JjsN/2SHCvBId
        bdAAVZc4sH06C4QtK9E95zMrRImHxK7TRpDQnMAosfXHYaYJjAqzkPwyC8kvsxD2LmBkXsUo
        llpQnJueWmxUYAiP3uT83E2M4CSs5bqDcfLbD3qHGJk4GA8xSnAwK4nwJkTfTxLiTUmsrEot
        yo8vKs1JLT7EaAoM6InMUqLJ+cA8kFcSb2hiaWBiZmZobmRqYK4kzuuVsiFRSCA9sSQ1OzW1
        ILUIpo+Jg1OqgcmL8dP17ZYX+gUKwtI/X+h5Uq516V/JN4Xe0h5h8Q0OZpsfLUzxSOu8zHRt
        CpPJ0YIVnxIEmFZ2r5266HGs4SPRWTkWMXWX4xtVZ7XeWm7bfs6sX2w9w3TTObI3pnR1Hv6+
        7EhFdvOmXb3XV0durDz2bW356TXp7n+faU+v7XrQrZ9n+jTmZMSc9TH9rFIxK614a6858D7d
        dHipf1/ooz+vgstjDASWubZMuMRzrv/6pK2GxwS3/ijcv4olbd/VV+oPeld610qETJH9x3gg
        OO7kgYkv/vsoBpw5YxC+z+Ytd/0GR+fnbxoENx/LaXjylj9G66HlidIlXc9r7iT9ZNt51Sxu
        rk2Y45k+Ts4/ah+VWIozEg21mIuKEwHnCaaySwQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrOLMWRmVeSWpSXmKPExsWy7bCSvG619uMkgyM3DS0ezNvGZnF5v7bF
        9S/PWS3mHznHatH34iGzxd7XW9ktNj2+xmrxseceq8WM8/uYLC6ecrVo3XuE3eLwm3ZWi3/X
        NrJYPO8Diq/a9YfRgd/j/Y1Wdo+ds+6ye2xa1cnmcefaHjaPzUvqPfq2rGL0+LxJLoA9issm
        JTUnsyy1SN8ugSvjy7RbLAXPRSo6Tl9ibmA8L9TFyMkhIWAi0TJrOUsXIxeHkMBuRol1nx8x
        QiRkJZ6928EOYQtL3G85wgpR9J5R4sKXK2AJNgFdiS3PXzGCJEQEnjNJTFlxEMxhFuhikrjT
        9gmsSlggSKJ95yxWEJtFQFXiVE8/WxcjBwevQLxE4wtZiA3yEtdvtjGD2JwCthJdTd9ZQGwh
        ARuJLcsWsYHYvAKCEidnPgGLMwPVN2+dzTyBUWAWktQsJKkFjEyrGCVTC4pz03OLDQsM81LL
        9YoTc4tL89L1kvNzNzGC40ZLcwfj9lUf9A4xMnEwHmKU4GBWEuFNiL6fJMSbklhZlVqUH19U
        mpNafIhRmoNFSZz3QtfJeCGB9MSS1OzU1ILUIpgsEwenVAPT1bQ9VhsFmVZ8z0+rU59+2u5s
        5568X5Fn5H/F797IFSzA9Gzx8ufyzUmi1uee1+zf9MjnjrlhT9a+vpbAhPOCV/bsszke0+Rh
        uExqQjyXkZ2hYYLJj3O9zZUSitPKmHLruer5BT4f2T339NIKwQvNNcuiggzF+B5uOxxuuC62
        UFFAxf3SrafsGVvDPbgTM18sEP7p8kTZ4sNewfMtG2csa26dcPve55eWCdt/vBFvaDOzfGXf
        VJGu+7b1nPhOe9+8+AQpi7W9C/muvL7js8qc3eTCrSMXqtasEjl/+hxvw5JYmxpfbXchS1f/
        HoGir/15M8yi3Jh/BzckOO5v6Z9jlVTd/Fqv3rfqq9jBJUosxRmJhlrMRcWJAHTfdXMKAwAA
X-CMS-MailID: 20220729003611epcas2p3b041a6c19835d3ba25459cd4c3adc94f
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20220729003611epcas2p3b041a6c19835d3ba25459cd4c3adc94f
References: <cover.1659054220.git.chanho61.park@samsung.com>
        <CGME20220729003611epcas2p3b041a6c19835d3ba25459cd4c3adc94f@epcas2p3.samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Add fsys0(for PCIe) clock definitions.

Signed-off-by: Chanho Park <chanho61.park@samsung.com>
Acked-by: Chanwoo Choi <cw00.choi@samsung.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../dt-bindings/clock/samsung,exynosautov9.h  | 43 +++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/include/dt-bindings/clock/samsung,exynosautov9.h b/include/dt-bindings/clock/samsung,exynosautov9.h
index ea9f91b4eb1a..6305a84396ce 100644
--- a/include/dt-bindings/clock/samsung,exynosautov9.h
+++ b/include/dt-bindings/clock/samsung,exynosautov9.h
@@ -185,6 +185,49 @@
 
 #define CORE_NR_CLK			6
 
+/* CMU_FSYS0 */
+#define CLK_MOUT_FSYS0_BUS_USER		1
+#define CLK_MOUT_FSYS0_PCIE_USER	2
+#define CLK_GOUT_FSYS0_BUS_PCLK		3
+
+#define CLK_GOUT_FSYS0_PCIE_GEN3_2L0_X1_REFCLK		4
+#define CLK_GOUT_FSYS0_PCIE_GEN3_2L0_X2_REFCLK		5
+#define CLK_GOUT_FSYS0_PCIE_GEN3_2L0_X1_DBI_ACLK	6
+#define CLK_GOUT_FSYS0_PCIE_GEN3_2L0_X1_MSTR_ACLK	7
+#define CLK_GOUT_FSYS0_PCIE_GEN3_2L0_X1_SLV_ACLK	8
+#define CLK_GOUT_FSYS0_PCIE_GEN3_2L0_X2_DBI_ACLK	9
+#define CLK_GOUT_FSYS0_PCIE_GEN3_2L0_X2_MSTR_ACLK	10
+#define CLK_GOUT_FSYS0_PCIE_GEN3_2L0_X2_SLV_ACLK	11
+#define CLK_GOUT_FSYS0_PCIE_GEN3_2L0_X2_PIPE_CLK	12
+#define CLK_GOUT_FSYS0_PCIE_GEN3A_2L0_CLK		13
+#define CLK_GOUT_FSYS0_PCIE_GEN3B_2L0_CLK		14
+
+#define CLK_GOUT_FSYS0_PCIE_GEN3_2L1_X1_REFCLK		15
+#define CLK_GOUT_FSYS0_PCIE_GEN3_2L1_X2_REFCLK		16
+#define CLK_GOUT_FSYS0_PCIE_GEN3_2L1_X1_DBI_ACLK	17
+#define CLK_GOUT_FSYS0_PCIE_GEN3_2L1_X1_MSTR_ACLK	18
+#define CLK_GOUT_FSYS0_PCIE_GEN3_2L1_X1_SLV_ACLK	19
+#define CLK_GOUT_FSYS0_PCIE_GEN3_2L1_X2_DBI_ACLK	20
+#define CLK_GOUT_FSYS0_PCIE_GEN3_2L1_X2_MSTR_ACLK	21
+#define CLK_GOUT_FSYS0_PCIE_GEN3_2L1_X2_SLV_ACLK	22
+#define CLK_GOUT_FSYS0_PCIE_GEN3_2L1_X2_PIPE_CLK	23
+#define CLK_GOUT_FSYS0_PCIE_GEN3A_2L1_CLK		24
+#define CLK_GOUT_FSYS0_PCIE_GEN3B_2L1_CLK		25
+
+#define CLK_GOUT_FSYS0_PCIE_GEN3_4L_X2_REFCLK		26
+#define CLK_GOUT_FSYS0_PCIE_GEN3_4L_X4_REFCLK		27
+#define CLK_GOUT_FSYS0_PCIE_GEN3_4L_X2_DBI_ACLK		28
+#define CLK_GOUT_FSYS0_PCIE_GEN3_4L_X2_MSTR_ACLK	29
+#define CLK_GOUT_FSYS0_PCIE_GEN3_4L_X2_SLV_ACLK		30
+#define CLK_GOUT_FSYS0_PCIE_GEN3_4L_X4_DBI_ACLK		31
+#define CLK_GOUT_FSYS0_PCIE_GEN3_4L_X4_MSTR_ACLK	32
+#define CLK_GOUT_FSYS0_PCIE_GEN3_4L_X4_SLV_ACLK		33
+#define CLK_GOUT_FSYS0_PCIE_GEN3_4L_X4_PIPE_CLK		34
+#define CLK_GOUT_FSYS0_PCIE_GEN3A_4L_CLK		35
+#define CLK_GOUT_FSYS0_PCIE_GEN3B_4L_CLK		36
+
+#define FSYS0_NR_CLK			37
+
 /* CMU_FSYS2 */
 #define CLK_MOUT_FSYS2_BUS_USER		1
 #define CLK_MOUT_FSYS2_UFS_EMBD_USER	2
-- 
2.37.1

