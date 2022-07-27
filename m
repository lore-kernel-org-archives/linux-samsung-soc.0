Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23EB8C19F2B
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 27 Jul 2022 06:06:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230013AbiG0GGY (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 27 Jul 2022 02:06:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229760AbiG0GGW (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 27 Jul 2022 02:06:22 -0400
Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 259353FA02
        for <linux-samsung-soc@vger.kernel.org>; Tue, 26 Jul 2022 23:06:19 -0700 (PDT)
Received: from epcas2p2.samsung.com (unknown [182.195.41.54])
        by mailout3.samsung.com (KnoxPortal) with ESMTP id 20220727060614epoutp03b75d1b0c34097dc3e6b8745a7857d831~Fmo5qotiD3243732437epoutp03B
        for <linux-samsung-soc@vger.kernel.org>; Wed, 27 Jul 2022 06:06:14 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20220727060614epoutp03b75d1b0c34097dc3e6b8745a7857d831~Fmo5qotiD3243732437epoutp03B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1658901974;
        bh=jsnISKbv3qfCib12cq4Lr9D6KKAqml9KQAUaQOrfnL8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=F4mlseq/A4SiTu7uslOSWXviusjx3tt/YCPHXE8cSsPmutiy55BDitaRE++/ydNXS
         1coPWFEOxgOqghok9s0OzY+b+BqkaU5N8C5ezwksHCLyDhvcxVpQ//tc9ho1tNqO8f
         JhZdbvuz4pQ3hHqFFAihj1NHtqKrJn5jXWwPbcj8=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
        epcas2p2.samsung.com (KnoxPortal) with ESMTP id
        20220727060613epcas2p2d9f5999b968b23bd24e4adca3f117237~Fmo49wBfr2397223972epcas2p2e;
        Wed, 27 Jul 2022 06:06:13 +0000 (GMT)
Received: from epsmges2p3.samsung.com (unknown [182.195.36.100]) by
        epsnrtp3.localdomain (Postfix) with ESMTP id 4Lt3F10hD9z4x9QC; Wed, 27 Jul
        2022 06:06:13 +0000 (GMT)
Received: from epcas2p1.samsung.com ( [182.195.41.53]) by
        epsmges2p3.samsung.com (Symantec Messaging Gateway) with SMTP id
        B2.6D.09642.4D5D0E26; Wed, 27 Jul 2022 15:06:13 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
        epcas2p3.samsung.com (KnoxPortal) with ESMTPA id
        20220727060612epcas2p34e861279ece7fbd3c7c87ce02c7d795c~Fmo4IE9ux1302313023epcas2p3Y;
        Wed, 27 Jul 2022 06:06:12 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
        epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20220727060612epsmtrp29d5b3647de825907be6df8843b263fa8~Fmo4HM_7a2776027760epsmtrp2D;
        Wed, 27 Jul 2022 06:06:12 +0000 (GMT)
X-AuditID: b6c32a47-dff43a80000025aa-c4-62e0d5d4a6d1
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
        epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
        20.EB.08905.4D5D0E26; Wed, 27 Jul 2022 15:06:12 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.9.51]) by
        epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20220727060612epsmtip19856a6dc2d80f9c20e7910e43548404e~Fmo36-Ipi2960929609epsmtip1M;
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
Subject: [PATCH 2/6] dt-bindings: clock: exynosautov9: add fsys1 clock
 definitions
Date:   Wed, 27 Jul 2022 15:01:42 +0900
Message-Id: <20220727060146.9228-3-chanho61.park@samsung.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220727060146.9228-1-chanho61.park@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrDJsWRmVeSWpSXmKPExsWy7bCmqe7Vqw+SDK50MFo8mLeNzeLyfm2L
        61+es1rMP3KO1aLvxUNmi72vt7JbbHp8jdXiY889VosZ5/cxWVw85WrRuvcIu8XhN+2sFv+u
        bWSxeN4HFF+16w+jA7/H+xut7B47Z91l99i0qpPN4861PWwem5fUe/RtWcXo8XmTXAB7VLZN
        RmpiSmqRQmpecn5KZl66rZJ3cLxzvKmZgaGuoaWFuZJCXmJuqq2Si0+ArltmDtDVSgpliTml
        QKGAxOJiJX07m6L80pJUhYz84hJbpdSClJwC8wK94sTc4tK8dL281BIrQwMDI1OgwoTsjJdz
        jrAULOWumPj/GHMD4y3OLkZODgkBE4lTJw6xdDFycQgJ7GCUWDnnERuE84lR4uPkuewQzjdG
        iWm7zjDDtJxvXMIIkdjLKPHz+kt2kISQwEdGiesvZEBsNgFdiS3PX4EViQg8ZpI4fKQNbC6z
        QBuTxLRnG1lBqoQFQiRuTnjEBGKzCKhKvLn8CGgSBwevgK3EobXiENvkJa7fbAPbzClgJ7Fj
        zU6wcl4BQYmTM5+wgNjMQDXNW2czg8yXEFjLIfHv0RZGiGYXiTvvzrBB2MISr45vYYewpSQ+
        v9sLFS+WWDrrExNEcwOjxOVtv6ASxhKznrUzghzELKApsX6XPogpIaAsceQW1F4+iY7Df9kh
        wrwSHW1CEI3qEge2T2eBsGUluud8ZoWwPSRWHF/ICgm4iYwS3xousUxgVJiF5J1ZSN6ZhbB4
        ASPzKkax1ILi3PTUYqMCY3gUJ+fnbmIEJ2Mt9x2MM95+0DvEyMTBeIhRgoNZSYQ3Ifp+khBv
        SmJlVWpRfnxRaU5q8SFGU2BYT2SWEk3OB+aDvJJ4QxNLAxMzM0NzI1MDcyVxXq+UDYlCAumJ
        JanZqakFqUUwfUwcnFINTOXvlLfvS09jnPTg6YHuw3udX4mLbD+R988s94nww3yHH++7pszl
        u7lQfE5aDNfl5litOX3BRhNsNz2YpHQ93Sw4OnZTk2EXq//hv6dFK//e1HwpZB1qeXNy2NOk
        Buf3rN+b/RjaQ/031/l+zM+On8217Ur3Rd3YiVs5P3sUcbG2uXL2WMbVLf+8pSE2s9y8/M3s
        xzFxJtU8d62zxc8u+79+tfjRZ1x9hn3S9wKOXTis9OzYjAkTN2tu5JgVfTt9zy/n+rs3vbnO
        9BkYJZUfk3C+21/IHq+7pPW3bUKRu/PS76l3b0evdd57eBG7ZmOj3fPgU83xwWLHDGPmfY+J
        YdZ1tnTcf2rG6zLhU4+PKrEUZyQaajEXFScCABpOU15PBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrOLMWRmVeSWpSXmKPExsWy7bCSnO6Vqw+SDFa/krF4MG8bm8Xl/doW
        1788Z7WYf+Qcq0Xfi4fMFntfb2W32PT4GqvFx557rBYzzu9jsrh4ytWide8RdovDb9pZLf5d
        28hi8bwPKL5q1x9GB36P9zda2T12zrrL7rFpVSebx51re9g8Ni+p9+jbsorR4/MmuQD2KC6b
        lNSczLLUIn27BK6Ml3OOsBQs5a6Y+P8YcwPjLc4uRk4OCQETifONSxi7GLk4hAR2M0rs2v+U
        BSIhK/Hs3Q52CFtY4n7LEVaIoveMEuuXbgdLsAnoSmx5/gqsW0TgOZPElBUHwRxmgS4miTtt
        n8CqhAWCJN48msUIYrMIqEq8ufwIKM7BwStgK3ForTjEBnmJ6zfbmEFsTgE7iR1rdjKB2EJA
        JTNfNYFdxCsgKHFy5hMwmxmovnnrbOYJjAKzkKRmIUktYGRaxSiZWlCcm55bbFhgmJdarlec
        mFtcmpeul5yfu4kRHDdamjsYt6/6oHeIkYmD8RCjBAezkghvQvT9JCHelMTKqtSi/Pii0pzU
        4kOM0hwsSuK8F7pOxgsJpCeWpGanphakFsFkmTg4pRqYZC6JXv2/zrjqoItx10wBsWvv0vPm
        HunV4Ep8flPGN/qYMYPWj1nHmPrfa+4918359Gx7IlvzZye+r9zhAZtf7FdcWLtT8qMms6nS
        mV8SHddeu674s3qD0aFX0m+9v+wId7YquSf+iJPjR0nG/Vky/oIF3wvF9V3Lpr9d88StXKVS
        pCZl0uobASfOf9gb/zU6mNPr64usxd8bn2e9vh/8pKSl4oKZ/QHub5UhrKzfpN5Mtk65eKqy
        XSq+xGZmgxJHz/PYZ67sU3jW+a/f9G/Jpod3mpPvTeDfe67x+3czlw2mLaLx/Qeaz1wp2zBR
        vOnq8RNlxaWeRsLtIc/sLDYU9Xy/32B4lbPGfIGx56tTSizFGYmGWsxFxYkA7onKkgoDAAA=
X-CMS-MailID: 20220727060612epcas2p34e861279ece7fbd3c7c87ce02c7d795c
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20220727060612epcas2p34e861279ece7fbd3c7c87ce02c7d795c
References: <20220727060146.9228-1-chanho61.park@samsung.com>
        <CGME20220727060612epcas2p34e861279ece7fbd3c7c87ce02c7d795c@epcas2p3.samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Add fsys1(for usb and mmc) clock definitions.

Signed-off-by: Chanho Park <chanho61.park@samsung.com>
---
 .../dt-bindings/clock/samsung,exynosautov9.h  | 25 +++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/include/dt-bindings/clock/samsung,exynosautov9.h b/include/dt-bindings/clock/samsung,exynosautov9.h
index 6305a84396ce..7e11e681da5c 100644
--- a/include/dt-bindings/clock/samsung,exynosautov9.h
+++ b/include/dt-bindings/clock/samsung,exynosautov9.h
@@ -228,6 +228,31 @@
 
 #define FSYS0_NR_CLK			37
 
+/* CMU_FSYS1 */
+#define FOUT_MMC_PLL				1
+
+#define CLK_MOUT_FSYS1_BUS_USER			2
+#define CLK_MOUT_MMC_PLL			3
+#define CLK_MOUT_FSYS1_MMC_CARD_USER		4
+#define CLK_MOUT_FSYS1_USBDRD_USER		5
+#define CLK_MOUT_FSYS1_MMC_CARD			6
+
+#define CLK_DOUT_FSYS1_MMC_CARD			7
+
+#define CLK_GOUT_FSYS1_PCLK			8
+#define CLK_GOUT_FSYS1_MMC_CARD_SDCLKIN		9
+#define CLK_GOUT_FSYS1_MMC_CARD_ACLK		10
+#define CLK_GOUT_FSYS1_USB20DRD_0_REFCLK	11
+#define CLK_GOUT_FSYS1_USB20DRD_1_REFCLK	12
+#define CLK_GOUT_FSYS1_USB30DRD_0_REFCLK	13
+#define CLK_GOUT_FSYS1_USB30DRD_1_REFCLK	14
+#define CLK_GOUT_FSYS1_USB20_0_ACLK		15
+#define CLK_GOUT_FSYS1_USB20_1_ACLK		16
+#define CLK_GOUT_FSYS1_USB30_0_ACLK		17
+#define CLK_GOUT_FSYS1_USB30_1_ACLK		18
+
+#define FSYS1_NR_CLK				19
+
 /* CMU_FSYS2 */
 #define CLK_MOUT_FSYS2_BUS_USER		1
 #define CLK_MOUT_FSYS2_UFS_EMBD_USER	2
-- 
2.37.1

