Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34CBAC19F21
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 27 Jul 2022 06:06:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229955AbiG0GGX (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 27 Jul 2022 02:06:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229816AbiG0GGW (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 27 Jul 2022 02:06:22 -0400
Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F51F3DBC0
        for <linux-samsung-soc@vger.kernel.org>; Tue, 26 Jul 2022 23:06:19 -0700 (PDT)
Received: from epcas2p3.samsung.com (unknown [182.195.41.55])
        by mailout3.samsung.com (KnoxPortal) with ESMTP id 20220727060614epoutp03e4b341be1d7fb2be91bbff57dd80df57~Fmo5xqMVM3243732437epoutp03C
        for <linux-samsung-soc@vger.kernel.org>; Wed, 27 Jul 2022 06:06:14 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20220727060614epoutp03e4b341be1d7fb2be91bbff57dd80df57~Fmo5xqMVM3243732437epoutp03C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1658901974;
        bh=7ewi9ZlsfU/HIGy4SnV0kCCQKYK0FPt39S08XtUQYoE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=nh31C7Nb0/BSBsSO2P3ytSLw2o7iAmenJ4lpZ9uD/dRjt0MqILe707NnVzl2Sk74c
         RtorUrmYfP7EQ1ei+VPRr29xd/xvhlsWXgV3QzLM0b48UPLXS8FiBiSXdJXjcdCchb
         8JwomqKXPDCUMCnYlscILU2WQ9NpRKZ1G2s9yLSY=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
        epcas2p2.samsung.com (KnoxPortal) with ESMTP id
        20220727060613epcas2p26bdcaf003c6406eaaf690bd182254041~Fmo5EGWW72397223972epcas2p2g;
        Wed, 27 Jul 2022 06:06:13 +0000 (GMT)
Received: from epsmges2p3.samsung.com (unknown [182.195.36.89]) by
        epsnrtp1.localdomain (Postfix) with ESMTP id 4Lt3F11N7cz4x9QG; Wed, 27 Jul
        2022 06:06:13 +0000 (GMT)
Received: from epcas2p3.samsung.com ( [182.195.41.55]) by
        epsmges2p3.samsung.com (Symantec Messaging Gateway) with SMTP id
        C2.6D.09642.5D5D0E26; Wed, 27 Jul 2022 15:06:13 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
        epcas2p4.samsung.com (KnoxPortal) with ESMTPA id
        20220727060612epcas2p4b844ea92fe11c302337a320b222947d3~Fmo4M4gws2914429144epcas2p4p;
        Wed, 27 Jul 2022 06:06:12 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
        epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20220727060612epsmtrp1b06bdaedca7577c55e7da4e91d52d58b~Fmo4L0At90521005210epsmtrp1r;
        Wed, 27 Jul 2022 06:06:12 +0000 (GMT)
X-AuditID: b6c32a47-5e1ff700000025aa-c5-62e0d5d52f40
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
        epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
        33.50.08802.4D5D0E26; Wed, 27 Jul 2022 15:06:12 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.9.51]) by
        epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20220727060612epsmtip1aef76668bddfa03250c2d9a7bc8953a4~Fmo3-rpj52961129611epsmtip1N;
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
Subject: [PATCH 3/6] dt-bindings: clock: exynosautov9: add schema for
 cmu_fsys0/1
Date:   Wed, 27 Jul 2022 15:01:43 +0900
Message-Id: <20220727060146.9228-4-chanho61.park@samsung.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220727060146.9228-1-chanho61.park@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrNJsWRmVeSWpSXmKPExsWy7bCmue7Vqw+SDA50sFk8mLeNzeLyfm2L
        61+es1rMP3KO1aLvxUNmi72vt7JbbHp8jdXiY889VosZ5/cxWVw85WrRuvcIu8XhN+2sFv+u
        bWSxeN4HFF+16w+jA7/H+xut7B47Z91l99i0qpPN4861PWwem5fUe/RtWcXo8XmTXAB7VLZN
        RmpiSmqRQmpecn5KZl66rZJ3cLxzvKmZgaGuoaWFuZJCXmJuqq2Si0+ArltmDtDVSgpliTml
        QKGAxOJiJX07m6L80pJUhYz84hJbpdSClJwC8wK94sTc4tK8dL281BIrQwMDI1OgwoTsjDkX
        XjAXvBGq2H+ji72BcSNvFyMnh4SAicSVw1MYQWwhgR2MEneX2HQxcgHZnxglNvTdYodwPjNK
        LG5dxQrTMaV/GhtEYhejRHP3VWYI5yOjxNYVV5lAqtgEdCW2PH/FCJIQEXjMJHH4SBtYC7NA
        G5PEtGcbwWYJCwRLfJz4ACjBwcEioCrROSMcJMwrYCvRevotE8Q6eYnrN9uYQWxOATuJHWt2
        MkHUCEqcnPmEBcRmBqpp3jqbGaJ+LYfEvGZVCNtFYuKZdWwQtrDEq+Nb2CFsKYmX/W1QdrHE
        0lmfmEBukxBoYJS4vO0XVIOxxKxn7YwgtzELaEqs36UPYkoIKEscuQW1lk+i4/Bfdogwr0RH
        mxBEo7rEge3TWSBsWYnuOZ+hAech8fjXOVZIWE0EBtzyBUwTGBVmIflmFpJvZiEsXsDIvIpR
        LLWgODc9tdiowBgew8n5uZsYwalYy30H44y3H/QOMTJxMB5ilOBgVhLhTYi+nyTEm5JYWZVa
        lB9fVJqTWnyI0RQY1BOZpUST84HZIK8k3tDE0sDEzMzQ3MjUwFxJnNcrZUOikEB6Yklqdmpq
        QWoRTB8TB6dUA5NLj0fFrHLpPyphzyX0ds7rDjoaUjr1tNyDH8b5/wSfykTNk7ybENfdMvHb
        /GrJlfqvE7f5la/VtTukL2rZfKlePeW7UiGf+tLHnQdCJtl2rtYXu9oxcatT286PHSfF3u60
        nxu9oWiKvpjZocDiu9eKzVYpume9eX1oa0KHM1fN04pTjkf6/37fcT6xwvxc4+RpEf7PJy4s
        XBLxJ+nNPgEt1+r16ck2e5KLdt92SpaZ/eOyWVd8DseRQyrCf1N/e3C/Lz6vMmfanT8rD7v5
        d3S7rK7N/z/bZoona/Ka1O27+4KmzL6ebn8w0UBtc6B81zmRtaq8c+oWT9EMiS9z3XHD5Pzq
        iz4LmFdVHryTlqjEUpyRaKjFXFScCAD4AqL8TgQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrGLMWRmVeSWpSXmKPExsWy7bCSnO6Vqw+SDLZuUrR4MG8bm8Xl/doW
        1788Z7WYf+Qcq0Xfi4fMFntfb2W32PT4GqvFx557rBYzzu9jsrh4ytWide8RdovDb9pZLf5d
        28hi8bwPKL5q1x9GB36P9zda2T12zrrL7rFpVSebx51re9g8Ni+p9+jbsorR4/MmuQD2KC6b
        lNSczLLUIn27BK6MORdeMBe8EarYf6OLvYFxI28XIyeHhICJxJT+aWwgtpDADkaJC5ekIOKy
        Es/e7WCHsIUl7rccYe1i5AKqec8ocatlPSNIgk1AV2LL81eMIAkRgedMElNWHARzmAW6mCTu
        tH0CaxcWCJTovXCZuYuRg4NFQFWic0Y4SJhXwFai9fRbJogN8hLXb7Yxg9icAnYSO9bsZIK4
        yFZi5qsmFoh6QYmTM5+A2cxA9c1bZzNPYBSYhSQ1C0lqASPTKkbJ1ILi3PTcYsMCo7zUcr3i
        xNzi0rx0veT83E2M4KjR0trBuGfVB71DjEwcjIcYJTiYlUR4E6LvJwnxpiRWVqUW5ccXleak
        Fh9ilOZgURLnvdB1Ml5IID2xJDU7NbUgtQgmy8TBKdXAZL5ruqLERcnkXeEKm8V+s+yoZeD+
        5SYj4Bux5vIky7RvVw8cjFkZePv1p3CTn2fPWbvE2czW6/W472L1hOHGVflOvo5vt/bXLFi7
        dkr950CF7mIW7wjz3bMO1yUrrGFSYUl4re1Rs0xVYZ96zZrWaWafFzLtu7Bf23jK+4N5eV0p
        jX8lvPofv7mpq5yTzsWlnWV3vnf7BSH7wAmS23auK0nZ9SRrV2v93c/NbyaJdEkydOpKhv3K
        qQlQ7mxYtCFfyCl54/mNwtcePlto3DPBYt3dle/jp3E4W+wSWVUwO0Xzm9X1f3rbT69ZMNOn
        /3VeXKZcg59ZXE6z6PkwjkM9vKvlfuws04t+nWKzb6ufEktxRqKhFnNRcSIAQZQCegkDAAA=
X-CMS-MailID: 20220727060612epcas2p4b844ea92fe11c302337a320b222947d3
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20220727060612epcas2p4b844ea92fe11c302337a320b222947d3
References: <20220727060146.9228-1-chanho61.park@samsung.com>
        <CGME20220727060612epcas2p4b844ea92fe11c302337a320b222947d3@epcas2p4.samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Add "samsung,exynosautov9-cmu-fsys0/1" compatibles to illustrate
cmu_fsys0 and fsys1 for Exynos Auto v9 SoC.

Signed-off-by: Chanho Park <chanho61.park@samsung.com>
---
 .../clock/samsung,exynosautov9-clock.yaml     | 44 +++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/samsung,exynosautov9-clock.yaml b/Documentation/devicetree/bindings/clock/samsung,exynosautov9-clock.yaml
index eafc715d2d02..2ab4642679c0 100644
--- a/Documentation/devicetree/bindings/clock/samsung,exynosautov9-clock.yaml
+++ b/Documentation/devicetree/bindings/clock/samsung,exynosautov9-clock.yaml
@@ -35,6 +35,8 @@ properties:
       - samsung,exynosautov9-cmu-top
       - samsung,exynosautov9-cmu-busmc
       - samsung,exynosautov9-cmu-core
+      - samsung,exynosautov9-cmu-fsys0
+      - samsung,exynosautov9-cmu-fsys1
       - samsung,exynosautov9-cmu-fsys2
       - samsung,exynosautov9-cmu-peric0
       - samsung,exynosautov9-cmu-peric1
@@ -107,6 +109,48 @@ allOf:
             - const: oscclk
             - const: dout_clkcmu_core_bus
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: samsung,exynosautov9-cmu-fsys0
+
+    then:
+      properties:
+        clocks:
+          items:
+            - description: External reference clock (26 MHz)
+            - description: CMU_FSYS0 bus clock (from CMU_TOP)
+            - description: CMU_FSYS0 pcie clock (from CMU_TOP)
+
+        clock-names:
+          items:
+            - const: oscclk
+            - const: dout_clkcmu_fsys0_bus
+            - const: dout_clkcmu_fsys0_pcie
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: samsung,exynosautov9-cmu-fsys1
+
+    then:
+      properties:
+        clocks:
+          items:
+            - description: External reference clock (26 MHz)
+            - description: CMU_FSYS1 bus clock (from CMU_TOP)
+            - description: CMU_FSYS1 mmc card clock (from CMU_TOP)
+            - description: CMU_FSYS1 usb clock (from CMU_TOP)
+
+        clock-names:
+          items:
+            - const: oscclk
+            - const: dout_clkcmu_fsys1_bus
+            - const: dout_clkcmu_fsys1_mmc_card
+            - const: dout_clkcmu_fsys1_usbdrd
+
   - if:
       properties:
         compatible:
-- 
2.37.1

