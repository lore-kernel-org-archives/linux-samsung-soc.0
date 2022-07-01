Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11C82CCA485
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  1 Jul 2022 01:55:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232632AbiGABzD (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 30 Jun 2022 21:55:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232533AbiGABzC (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 30 Jun 2022 21:55:02 -0400
Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AAB305C977
        for <linux-samsung-soc@vger.kernel.org>; Thu, 30 Jun 2022 18:54:57 -0700 (PDT)
Received: from epcas2p2.samsung.com (unknown [182.195.41.54])
        by mailout3.samsung.com (KnoxPortal) with ESMTP id 20220701015453epoutp037a37013a2d12bc80f76a1ef25e65778a~9kcBl-nIG2922429224epoutp03E
        for <linux-samsung-soc@vger.kernel.org>; Fri,  1 Jul 2022 01:54:53 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20220701015453epoutp037a37013a2d12bc80f76a1ef25e65778a~9kcBl-nIG2922429224epoutp03E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1656640493;
        bh=foC5n8Te4E4jn4upxJl+YEdvesc+5QiyaaflKrqsO0s=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=c7zEO7/1xtYlmwI10PKp+zHnKWHQE5YI5ErVeTxQadxD7+eVKggZfj1QAPez9GO3R
         tSceuLZjdrXR81ZoBHsMJGJwtVGblBpBSaNzfSkl3B/qIHDF276Fu6qFtfJJyznNQc
         Wu8EgRT9QmrCY8ykK4xI2C1IOeqkshcSCthj/NRA=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
        epcas2p3.samsung.com (KnoxPortal) with ESMTP id
        20220701015452epcas2p3675c47b2505af964feb0ccb14c765316~9kcA2RgGX2621126211epcas2p3s;
        Fri,  1 Jul 2022 01:54:52 +0000 (GMT)
Received: from epsmges2p1.samsung.com (unknown [182.195.36.70]) by
        epsnrtp4.localdomain (Postfix) with ESMTP id 4LYyv002mqz4x9Q8; Fri,  1 Jul
        2022 01:54:52 +0000 (GMT)
Received: from epcas2p1.samsung.com ( [182.195.41.53]) by
        epsmges2p1.samsung.com (Symantec Messaging Gateway) with SMTP id
        4A.97.09666.BE35EB26; Fri,  1 Jul 2022 10:54:51 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
        epcas2p1.samsung.com (KnoxPortal) with ESMTPA id
        20220701015451epcas2p15355e8f1777824f73b402899c4afd40a~9kb-hVklF2754627546epcas2p1I;
        Fri,  1 Jul 2022 01:54:51 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
        epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20220701015451epsmtrp2eead5033effb68a50c98615ffe81d122~9kb-ggZYY1047610476epsmtrp2R;
        Fri,  1 Jul 2022 01:54:51 +0000 (GMT)
X-AuditID: b6c32a45-45bff700000025c2-79-62be53eb1a48
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
        epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
        6A.E4.08905.BE35EB26; Fri,  1 Jul 2022 10:54:51 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.9.51]) by
        epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20220701015450epsmtip21e69a16683e03071c9d536c946a5f724~9kb-QlCQV0169701697epsmtip29;
        Fri,  1 Jul 2022 01:54:50 +0000 (GMT)
From:   Chanho Park <chanho61.park@samsung.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Alim Akhtar <alim.akhtar@samsung.com>,
        Sam Protsenko <semen.protsenko@linaro.org>,
        Jaewon Kim <jaewon02.kim@samsung.com>,
        devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Chanho Park <chanho61.park@samsung.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 2/5] dt-bindings: serial: samsung: add exynosautov9-uart
 compatible
Date:   Fri,  1 Jul 2022 10:52:23 +0900
Message-Id: <20220701015226.32781-3-chanho61.park@samsung.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220701015226.32781-1-chanho61.park@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprBJsWRmVeSWpSXmKPExsWy7bCmqe7r4H1JBs3fLS0ezNvGZnF5v7bF
        /CPnWC12NBxhteh78ZDZYu/rrewWmx5fY7WYcX4fk0Xr3iPsFs/79jE5cHlsWtXJ5nHn2h42
        j81L6j36tqxi9Pi8SS6ANSrbJiM1MSW1SCE1Lzk/JTMv3VbJOzjeOd7UzMBQ19DSwlxJIS8x
        N9VWycUnQNctMwfoJiWFssScUqBQQGJxsZK+nU1RfmlJqkJGfnGJrVJqQUpOgXmBXnFibnFp
        XrpeXmqJlaGBgZEpUGFCdsbrt74FO9gr1izsYmtg7GHrYuTkkBAwkdjbsIAZxBYS2MEo0bTB
        pIuRC8j+xChx49QHRgjnG6PE2xP7mGA6Vu5dzASR2Mso0dq+jB3C+cgoMfXvfxaQKjYBXYkt
        z18xgtgiAvESzy+8B4szC5xiklh3NxjEFhaIkFi1/SlYnEVAVeLpgYnsIDavgJ3ErG/9rBDb
        5CU2zO8Fu49TwF7i3/65UDWCEidnPoGaKS/RvHU2M8gREgJ/2SUabv9ggWh2kWi838UOYQtL
        vDq+BcqWkvj8bi80AIolls76xATR3MAocXnbL6iEscSsZ+1AH3AAbdCUWL9LH8SUEFCWOHIL
        ai+fRMfhv+wQYV6JjjYhiEZ1iQPbp0NdICvRPecz1CseEpPe/YQG3CRGieuLGpkmMCrMQvLO
        LCTvzEJYvICReRWjWGpBcW56arFRgSE8gpPzczcxgpOolusOxslvP+gdYmTiYDzEKMHBrCTC
        yzZvb5IQb0piZVVqUX58UWlOavEhRlNgYE9klhJNzgem8bySeEMTSwMTMzNDcyNTA3MlcV6v
        lA2JQgLpiSWp2ampBalFMH1MHJxSDUybHDLv6XH8kWmaU3PvvI0603W261JJdnteN+3tf96y
        eYt4+jlmH4Mn7D8ToqbHGmT61bQJnQid0sXiUPz8476SzXxnDJ4xLJPq4TtwTGXqIZV1Ytfe
        9vW8cP/scSnEfWvKQ/8/Ylc2uaUsF/xl7+i2uCWm8br6lFnWH05LZK30TPC9Vn0p5u5ei4r+
        8Ghhr6P3jjdf9RUWcHD8uW9P9yqLTp2qnjl8nS3+QTovfyjpy/UdLD4+z2PaC7EzGVmsPE2H
        S0Uv7tLb9Lp8fnoU10Hl/RJ1u02WCsls/e8zQ/7Whc7X2p1S0769n3SzepI8xxLllSV/50fI
        7txp9ag6d2VtqrvaBDfdCWIl3jLsXUosxRmJhlrMRcWJAMomkl4rBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrCLMWRmVeSWpSXmKPExsWy7bCSvO7r4H1JBovmcFo8mLeNzeLyfm2L
        +UfOsVrsaDjCatH34iGzxd7XW9ktNj2+xmox4/w+JovWvUfYLZ737WNy4PLYtKqTzePOtT1s
        HpuX1Hv0bVnF6PF5k1wAaxSXTUpqTmZZapG+XQJXxuu3vgU72CvWLOxia2DsYeti5OSQEDCR
        WLl3MVMXIxeHkMBuRoklu7uYIBKyEs/e7WCHsIUl7rccYYUoes8oMXnHZbAiNgFdiS3PXzGC
        2CIC8RKbvyxkASliFjjHJHFk+UcWkISwQJjEtq79YOtYBFQlnh6YCDaVV8BOYta3flaIDfIS
        G+b3MoPYnAL2Ev/2zwWrEQKqWf3uNjNEvaDEyZlPwGYyA9U3b53NPIFRYBaS1CwkqQWMTKsY
        JVMLinPTc4sNCwzzUsv1ihNzi0vz0vWS83M3MYIDXktzB+P2VR/0DjEycTAeYpTgYFYS4WWb
        tzdJiDclsbIqtSg/vqg0J7X4EKM0B4uSOO+FrpPxQgLpiSWp2ampBalFMFkmDk6pBqa9xs8f
        Hn788wpbbF+GhZdU1VmeVXuqnpsv2OFX4ejjk+9w7akp4zruuED9mKyAmXl7NC8pZRh/rLtt
        9PSXmt6cHWlOnvJcnExH/+pL7y5be/2w34ZDO91v1y9rlTprHTlvf77zl7kvDr7pnLi57NrS
        6FOnZj5xurK+vOrq/lJhNYu3V5+WTnFX/aVzSeabQe+800eOWL9501CwNneJsI32xKXa95u6
        84SEGT75Pr62Pf6AzgeGvw1f1/NYnFuieO7hQc7E6Y9rCthOrr2ZOlNrnvuhzp1fBKV733GW
        Rp+QUL6VkPS2q4tbUONkwLe3Gb93LU4rnJk+Jc7bd6G7yfkgFbmKvx+4FJY8dd049fgjJZbi
        jERDLeai4kQAgwh0OOcCAAA=
X-CMS-MailID: 20220701015451epcas2p15355e8f1777824f73b402899c4afd40a
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20220701015451epcas2p15355e8f1777824f73b402899c4afd40a
References: <20220701015226.32781-1-chanho61.park@samsung.com>
        <CGME20220701015451epcas2p15355e8f1777824f73b402899c4afd40a@epcas2p1.samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Add samsung,exynosautov9-uart dedicated compatible for representing
uart of Exynos Auto v9 SoC.

Signed-off-by: Chanho Park <chanho61.park@samsung.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/serial/samsung_uart.yaml | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/serial/samsung_uart.yaml b/Documentation/devicetree/bindings/serial/samsung_uart.yaml
index 901c1e2cea28..41d3b082eb72 100644
--- a/Documentation/devicetree/bindings/serial/samsung_uart.yaml
+++ b/Documentation/devicetree/bindings/serial/samsung_uart.yaml
@@ -17,7 +17,10 @@ description: |+
 
 properties:
   compatible:
-    items:
+    oneOf:
+      - items:
+          - const: samsung,exynosautov9-uart
+          - const: samsung,exynos850-uart
       - enum:
           - apple,s5l-uart
           - axis,artpec8-uart
-- 
2.36.1

