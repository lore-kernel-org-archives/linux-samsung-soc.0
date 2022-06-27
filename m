Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DD0BCCA486
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 27 Jun 2022 00:54:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229727AbiF0Ay1 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sun, 26 Jun 2022 20:54:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229732AbiF0AyY (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 26 Jun 2022 20:54:24 -0400
Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A5802DF7
        for <linux-samsung-soc@vger.kernel.org>; Sun, 26 Jun 2022 17:54:18 -0700 (PDT)
Received: from epcas2p1.samsung.com (unknown [182.195.41.53])
        by mailout3.samsung.com (KnoxPortal) with ESMTP id 20220627005415epoutp030b770d590d5baab9cfe0fe13e8700a27~8VB8QLBTi1135411354epoutp03_
        for <linux-samsung-soc@vger.kernel.org>; Mon, 27 Jun 2022 00:54:15 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20220627005415epoutp030b770d590d5baab9cfe0fe13e8700a27~8VB8QLBTi1135411354epoutp03_
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1656291255;
        bh=Mp0XHPJNdLvzShF0H9XMfYLY2xmD5UJhyjdG2znHERg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=veN6pOdtlqCC3U0XNPo4CsJqrf9YgisdZ/+RXvwmFSD/drVigeUhgEBGfY9S7XdAj
         Ff7xmWf51DQ1jIg2GlV+ljk4ubI9chyli1xHYC3pErdnINq9+IjAfLSbOj4KsoSVkf
         +bAFs1Zvg+DlZMxGGu4/BwvCQVoLY7Ozt40eEeig=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
        epcas2p3.samsung.com (KnoxPortal) with ESMTP id
        20220627005414epcas2p3735996495493e04de422c40df9b05691~8VB7g13hu1544515445epcas2p3i;
        Mon, 27 Jun 2022 00:54:14 +0000 (GMT)
Received: from epsmges2p3.samsung.com (unknown [182.195.36.91]) by
        epsnrtp2.localdomain (Postfix) with ESMTP id 4LWTkt0yhzz4x9Pt; Mon, 27 Jun
        2022 00:54:14 +0000 (GMT)
Received: from epcas2p1.samsung.com ( [182.195.41.53]) by
        epsmges2p3.samsung.com (Symantec Messaging Gateway) with SMTP id
        CA.98.09642.6BFF8B26; Mon, 27 Jun 2022 09:54:14 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
        epcas2p3.samsung.com (KnoxPortal) with ESMTPA id
        20220627005413epcas2p39750fb5876366881b8535ee516c1bebe~8VB6Soq8N1544515445epcas2p3f;
        Mon, 27 Jun 2022 00:54:13 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
        epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20220627005413epsmtrp2639166697df6e068ca2bec2919ebbb17~8VB6QpFBE0577205772epsmtrp2I;
        Mon, 27 Jun 2022 00:54:13 +0000 (GMT)
X-AuditID: b6c32a47-5f7ff700000025aa-06-62b8ffb6a1df
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
        epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
        A8.1A.08802.5BFF8B26; Mon, 27 Jun 2022 09:54:13 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.9.51]) by
        epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20220627005413epsmtip2c0acda0e5010b8d99fbf49a464e8b587~8VB6D8UoY1517115171epsmtip2e;
        Mon, 27 Jun 2022 00:54:12 +0000 (GMT)
From:   Chanho Park <chanho61.park@samsung.com>
To:     Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Alim Akhtar <alim.akhtar@samsung.com>,
        linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Chanho Park <chanho61.park@samsung.com>
Subject: [PATCH 1/3] dt-bindings: clock: exynosautov9: correct clock
 numbering of peric0/c1
Date:   Mon, 27 Jun 2022 09:52:08 +0900
Message-Id: <20220627005210.6473-2-chanho61.park@samsung.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220627005210.6473-1-chanho61.park@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrCJsWRmVeSWpSXmKPExsWy7bCmqe62/zuSDN69Y7F4MG8bm8Xl/doW
        1788Z7WYf+Qcq0Xfi4fMFntfb2W32PT4GqvFx557rBYzzu9jsrh4ytWide8RdovDb9pZLf5d
        28hisWrXH0YHPo/3N1rZPXbOusvusWlVJ5vHnWt72Dw2L6n36NuyitHj8ya5APaobJuM1MSU
        1CKF1Lzk/JTMvHRbJe/geOd4UzMDQ11DSwtzJYW8xNxUWyUXnwBdt8wcoIOVFMoSc0qBQgGJ
        xcVK+nY2RfmlJakKGfnFJbZKqQUpOQXmBXrFibnFpXnpenmpJVaGBgZGpkCFCdkZp+d6FRyT
        qOj6/YexgbFPtIuRk0NCwETi7JoDLF2MXBxCAjsYJf61PGWEcD4xSsxq/sUGUiUk8JlR4kOH
        NUzHtqUn2CGKdjFKHJ92lgnC+cgo0dFwjxmkik1AV2LL81dgo0QEHjNJHD7SBjaKWeAGo8Th
        rWBFwgKxEuuaz4HZLAKqEjt/TQSaxMHBK2ArcWWuMsQ2eYkN83uZQcKcAnYSTbNkQMK8AoIS
        J2c+YYGYKC/RvHU2M8gqCYGVHBKLJ95lguh1kTh2awaULSzx6vgWdghbSuLzu71sEHaxxNJZ
        n5ggmhsYJS5v+wWVMJaY9aydEWQxs4CmxPpd+iCmhICyxJFbUHv5JDoO/2WHCPNKdLQJQTSq
        SxzYPp0FwpaV6J7zmRXC9pBonTAPGlQTGSVmL1rNOIFRYRaSd2YheWcWwuIFjMyrGMVSC4pz
        01OLjQqM4fGbnJ+7iRGcfLXcdzDOePtB7xAjEwfjIUYJDmYlEd7X17cmCfGmJFZWpRblxxeV
        5qQWH2I0BQb1RGYp0eR8YPrPK4k3NLE0MDEzMzQ3MjUwVxLn9UrZkCgkkJ5YkpqdmlqQWgTT
        x8TBKdXAZHCL+23t+nZxlXsfa/WLNrWecp8e7q3Sbe7uOXlOfYRSzSvlE4URSSeP7eA2mB6Q
        7NG+fQKvfOLnyUm7s4/u2MrGWLG5rLLP36kjcrtM7mru73dui5c/8tm/b1aCyKrOg181XQu1
        dzvqWbOzbhQ/tld78plwxbPdOdyyF8yvlYjlvT3E0VcgGT1tTVvf0Wus8nZuE3NdFu+Yv9g3
        oi9i5YktjyZvTdpcdEKmaUZIZCq7zPKfX/jnMa2s4mBlL7tsf2bzzI8nra/1bJr6cbWkwq+y
        iRqvlf13GxWfncW9yW3zMf/YG11zAz4XpEjJq5YIz/eWZ6xTXZD1zdmNcdIvC/d9JhffMVX7
        3NzziHWeEktxRqKhFnNRcSIAkUVeXUcEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrPLMWRmVeSWpSXmKPExsWy7bCSvO7W/zuSDD6t5rB4MG8bm8Xl/doW
        1788Z7WYf+Qcq0Xfi4fMFntfb2W32PT4GqvFx557rBYzzu9jsrh4ytWide8RdovDb9pZLf5d
        28hisWrXH0YHPo/3N1rZPXbOusvusWlVJ5vHnWt72Dw2L6n36NuyitHj8ya5APYoLpuU1JzM
        stQifbsErozTc70KjklUdP3+w9jA2CfaxcjJISFgIrFt6Qn2LkYuDiGBHYwSj9vus0AkZCWe
        vdvBDmELS9xvOcIKUfSeUaL1/nQ2kASbgK7EluevGEESIgLPmSSmrDgI5jAL3GGUmDJ7NhNI
        lbBAtMSmhjWMIDaLgKrEzl8TgeIcHLwCthJX5ipDbJCX2DC/lxkkzClgJ9E0SwbEFAKq2Pss
        B6SCV0BQ4uTMJ2C3MQNVN2+dzTyBUWAWktQsJKkFjEyrGCVTC4pz03OLDQuM8lLL9YoTc4tL
        89L1kvNzNzGC40RLawfjnlUf9A4xMnEwHmKU4GBWEuF9fX1rkhBvSmJlVWpRfnxRaU5q8SFG
        aQ4WJXHeC10n44UE0hNLUrNTUwtSi2CyTBycUg1MmtXLnu6e5fKMZfH3gOZ/vff2nc7XmTrr
        Fv9inthDypkL2ZWntfeL+zoyvL2/jIt5yXa9p/mWnlrztGaYMp04qBnKoGMqssknSj5f3b2Z
        Z/6bDjV9M9tHt8Isfi5eefR1+erjH4xlf94LvGmv99p54u6vO5T45Wa6pKc8zy1y1I45sCNo
        +re+krqVq0KUQp1jJl1VkgkMq2g7W7xq78++rtWbBJ/+Xt22NnzXH4koM17HJd9yr37nO6fA
        mSn9t33H1A0sa7fy/InZUeNydrvI8zJ7uTTVAz5lUaHbrruapK6VrfdfVbwq3/vpS737H20q
        mTM29Fdv7X37/6LriWCmB1eTl2zUV/BvefTNagGLEktxRqKhFnNRcSIAQe+JagIDAAA=
X-CMS-MailID: 20220627005413epcas2p39750fb5876366881b8535ee516c1bebe
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20220627005413epcas2p39750fb5876366881b8535ee516c1bebe
References: <20220627005210.6473-1-chanho61.park@samsung.com>
        <CGME20220627005413epcas2p39750fb5876366881b8535ee516c1bebe@epcas2p3.samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

There are duplicated definitions of peric0 and peric1 cmu blocks. Thus,
they should be defined correctly as numerical order.

Fixes: 680e1c8370a2 ("dt-bindings: clock: add clock binding definitions for Exynos Auto v9")
Signed-off-by: Chanho Park <chanho61.park@samsung.com>
---
 .../dt-bindings/clock/samsung,exynosautov9.h  | 56 +++++++++----------
 1 file changed, 28 insertions(+), 28 deletions(-)

diff --git a/include/dt-bindings/clock/samsung,exynosautov9.h b/include/dt-bindings/clock/samsung,exynosautov9.h
index ea9f91b4eb1a..a7db6516593f 100644
--- a/include/dt-bindings/clock/samsung,exynosautov9.h
+++ b/include/dt-bindings/clock/samsung,exynosautov9.h
@@ -226,21 +226,21 @@
 #define CLK_GOUT_PERIC0_IPCLK_8		28
 #define CLK_GOUT_PERIC0_IPCLK_9		29
 #define CLK_GOUT_PERIC0_IPCLK_10	30
-#define CLK_GOUT_PERIC0_IPCLK_11	30
-#define CLK_GOUT_PERIC0_PCLK_0		31
-#define CLK_GOUT_PERIC0_PCLK_1		32
-#define CLK_GOUT_PERIC0_PCLK_2		33
-#define CLK_GOUT_PERIC0_PCLK_3		34
-#define CLK_GOUT_PERIC0_PCLK_4		35
-#define CLK_GOUT_PERIC0_PCLK_5		36
-#define CLK_GOUT_PERIC0_PCLK_6		37
-#define CLK_GOUT_PERIC0_PCLK_7		38
-#define CLK_GOUT_PERIC0_PCLK_8		39
-#define CLK_GOUT_PERIC0_PCLK_9		40
-#define CLK_GOUT_PERIC0_PCLK_10		41
-#define CLK_GOUT_PERIC0_PCLK_11		42
+#define CLK_GOUT_PERIC0_IPCLK_11	31
+#define CLK_GOUT_PERIC0_PCLK_0		32
+#define CLK_GOUT_PERIC0_PCLK_1		33
+#define CLK_GOUT_PERIC0_PCLK_2		34
+#define CLK_GOUT_PERIC0_PCLK_3		35
+#define CLK_GOUT_PERIC0_PCLK_4		36
+#define CLK_GOUT_PERIC0_PCLK_5		37
+#define CLK_GOUT_PERIC0_PCLK_6		38
+#define CLK_GOUT_PERIC0_PCLK_7		39
+#define CLK_GOUT_PERIC0_PCLK_8		40
+#define CLK_GOUT_PERIC0_PCLK_9		41
+#define CLK_GOUT_PERIC0_PCLK_10		42
+#define CLK_GOUT_PERIC0_PCLK_11		43
 
-#define PERIC0_NR_CLK			43
+#define PERIC0_NR_CLK			44
 
 /* CMU_PERIC1 */
 #define CLK_MOUT_PERIC1_BUS_USER	1
@@ -272,21 +272,21 @@
 #define CLK_GOUT_PERIC1_IPCLK_8		28
 #define CLK_GOUT_PERIC1_IPCLK_9		29
 #define CLK_GOUT_PERIC1_IPCLK_10	30
-#define CLK_GOUT_PERIC1_IPCLK_11	30
-#define CLK_GOUT_PERIC1_PCLK_0		31
-#define CLK_GOUT_PERIC1_PCLK_1		32
-#define CLK_GOUT_PERIC1_PCLK_2		33
-#define CLK_GOUT_PERIC1_PCLK_3		34
-#define CLK_GOUT_PERIC1_PCLK_4		35
-#define CLK_GOUT_PERIC1_PCLK_5		36
-#define CLK_GOUT_PERIC1_PCLK_6		37
-#define CLK_GOUT_PERIC1_PCLK_7		38
-#define CLK_GOUT_PERIC1_PCLK_8		39
-#define CLK_GOUT_PERIC1_PCLK_9		40
-#define CLK_GOUT_PERIC1_PCLK_10		41
-#define CLK_GOUT_PERIC1_PCLK_11		42
+#define CLK_GOUT_PERIC1_IPCLK_11	31
+#define CLK_GOUT_PERIC1_PCLK_0		32
+#define CLK_GOUT_PERIC1_PCLK_1		33
+#define CLK_GOUT_PERIC1_PCLK_2		34
+#define CLK_GOUT_PERIC1_PCLK_3		35
+#define CLK_GOUT_PERIC1_PCLK_4		36
+#define CLK_GOUT_PERIC1_PCLK_5		37
+#define CLK_GOUT_PERIC1_PCLK_6		38
+#define CLK_GOUT_PERIC1_PCLK_7		39
+#define CLK_GOUT_PERIC1_PCLK_8		40
+#define CLK_GOUT_PERIC1_PCLK_9		41
+#define CLK_GOUT_PERIC1_PCLK_10		42
+#define CLK_GOUT_PERIC1_PCLK_11		43
 
-#define PERIC1_NR_CLK			43
+#define PERIC1_NR_CLK			44
 
 /* CMU_PERIS */
 #define CLK_MOUT_PERIS_BUS_USER		1
-- 
2.36.1

