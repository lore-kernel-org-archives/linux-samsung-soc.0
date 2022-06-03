Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44C8ACCA484
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  3 Jun 2022 02:04:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240200AbiFCCEh (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 2 Jun 2022 22:04:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240193AbiFCCEe (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 2 Jun 2022 22:04:34 -0400
Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD39B35DE0
        for <linux-samsung-soc@vger.kernel.org>; Thu,  2 Jun 2022 19:04:31 -0700 (PDT)
Received: from epcas2p1.samsung.com (unknown [182.195.41.53])
        by mailout3.samsung.com (KnoxPortal) with ESMTP id 20220603020430epoutp03ed7283b864803c7cbf81392acabfad4a~0_gbCoXip2320023200epoutp03I
        for <linux-samsung-soc@vger.kernel.org>; Fri,  3 Jun 2022 02:04:30 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20220603020430epoutp03ed7283b864803c7cbf81392acabfad4a~0_gbCoXip2320023200epoutp03I
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1654221870;
        bh=5SSPj1LfxW/EF3pUCS/AYMA44//xyOzjIW5aBpXgMok=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=uL2PiLIZsWw/o314hwjiQ1MNfRPjPPIn9mkeXoDW4avWnJg89t5pEynYLZgpD/lgf
         ev74ohSQ87Hab1k2HTkP+jtk/6TAo5i1NwEYTqL9U66GPfqJm55DRzE/LXY1Ma/JPB
         A/jp5izqhljd85HbOJLwCxKtI4OgeGOGdK9PD9wE=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
        epcas2p2.samsung.com (KnoxPortal) with ESMTP id
        20220603020429epcas2p2db575b16d25f2c3ceb314294c013f7ce~0_gan3C9j1796117961epcas2p2F;
        Fri,  3 Jun 2022 02:04:29 +0000 (GMT)
Received: from epsmges2p3.samsung.com (unknown [182.195.36.70]) by
        epsnrtp4.localdomain (Postfix) with ESMTP id 4LDmQz0lb7z4x9Q9; Fri,  3 Jun
        2022 02:04:27 +0000 (GMT)
Received: from epcas2p2.samsung.com ( [182.195.41.54]) by
        epsmges2p3.samsung.com (Symantec Messaging Gateway) with SMTP id
        8A.BD.10028.A2C69926; Fri,  3 Jun 2022 11:04:26 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
        epcas2p4.samsung.com (KnoxPortal) with ESMTPA id
        20220603020426epcas2p43e4c27b5a371e2fcdfa462c564d9c5e3~0_gXfzXtP2242022420epcas2p45;
        Fri,  3 Jun 2022 02:04:26 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
        epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20220603020426epsmtrp21bb1cd38d3e830222e1182b5e8cf738f~0_gXdgnDG0586805868epsmtrp2L;
        Fri,  3 Jun 2022 02:04:26 +0000 (GMT)
X-AuditID: b6c32a47-589ff7000000272c-d3-62996c2aaaa0
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
        epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
        A2.FF.08924.A2C69926; Fri,  3 Jun 2022 11:04:26 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.9.51]) by
        epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20220603020426epsmtip151c228652d4e8ede2f4fdbf4bf7a653e~0_gXUJk3k2907029070epsmtip1q;
        Fri,  3 Jun 2022 02:04:26 +0000 (GMT)
From:   Chanho Park <chanho61.park@samsung.com>
To:     Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     devicetree@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Chanho Park <chanho61.park@samsung.com>
Subject: [PATCH v3 1/5] dt-bindings: phy: samsung,ufs-phy: make pmu-syscon
 as phandle-array
Date:   Fri,  3 Jun 2022 11:04:06 +0900
Message-Id: <20220603020410.2976-2-chanho61.park@samsung.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220603020410.2976-1-chanho61.park@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrMJsWRmVeSWpSXmKPExsWy7bCmma5WzswkgzuPrS0ezNvGZnF5v7bF
        /CPnWC0uPO1hs+h78ZDZYu/rrewWmx5fY7WYsOobi8WM8/uYLFr3HmG32HnnBLMDt8emVZ1s
        Hneu7WHz2Lyk3qNvyypGj+M3tjN5fN4kF8AWlW2TkZqYklqkkJqXnJ+SmZduq+QdHO8cb2pm
        YKhraGlhrqSQl5ibaqvk4hOg65aZA3SdkkJZYk4pUCggsbhYSd/Opii/tCRVISO/uMRWKbUg
        JafAvECvODG3uDQvXS8vtcTK0MDAyBSoMCE7Y++hNuaC61wVexZdYW1g3MbRxcjJISFgInHq
        cjcLiC0ksINRYutOuy5GLiD7E6PEyXWnWCCcz4wSs85sZ4LpONnwhxGiYxejxJZ9ihBFHxkl
        dn2eBVbEJqArseX5K0aQhIhAO5PEiXtz2UEcZoHNQHMnbGAGqRIWiJW4svUBWAeLgKpE29ml
        YGN5BWwl9jycBrVOXmLD/F6wek4BO4nr074yQ9QISpyc+QTscGagmuats5kh6ns5JNYfTYOw
        XSQW/38KFReWeHV8CzuELSXx+d1eNgi7WGLprE9MIMdJCDQwSlze9gsqYSwx61k70EEcQAs0
        Jdbv0gcxJQSUJY7cglrLJ9Fx+C87RJhXoqNNCKJRXeLA9uksELasRPecz6wQtofE7O/bmSGB
        NZFR4tSPBywTGBVmIflmFpJvZiEsXsDIvIpRLLWgODc9tdiowBgew8n5uZsYwalVy30H44y3
        H/QOMTJxMB5ilOBgVhLhLdk1NUmINyWxsiq1KD++qDQntfgQoykwrCcyS4km5wOTe15JvKGJ
        pYGJmZmhuZGpgbmSOK9XyoZEIYH0xJLU7NTUgtQimD4mDk6pBqalxfZPJr957Wi6Jf5Zyg/u
        3qnzk+7sdbdN6RCSe2rMPfVb7NmotbcYA1ksXfQj3qVIN8bbH7wi5mfT7ri/inG76OuXCx8d
        yKlw47HqerHvn0WCbnVbl4kpo1dnc8rcPUU7Dh305uhynDzT6VJ/kKqxdmt3pAHL76RZDWK+
        94Iexzzi7Yk8bCXhyCWR6jz50u4Oj6LDzu9ylz257Vwb9ll9iurGqkSjPycSS082fWO/PKs/
        fHVZ488FPwWZ/m/PO9K3XU/R2VZ09fLCtXFFa+8ZXDd3+XyrS5Xju4Pj2d3L/Rg/71s16eKj
        aWFfym9ISe3kC+CYJF799G+rAodJha68VaDzNqNIfT3NK6K6SizFGYmGWsxFxYkABT9nhDYE
        AAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrALMWRmVeSWpSXmKPExsWy7bCSnK5Wzswkg8OHeSwezNvGZnF5v7bF
        /CPnWC0uPO1hs+h78ZDZYu/rrewWmx5fY7WYsOobi8WM8/uYLFr3HmG32HnnBLMDt8emVZ1s
        Hneu7WHz2Lyk3qNvyypGj+M3tjN5fN4kF8AWxWWTkpqTWZZapG+XwJWx91Abc8F1roo9i66w
        NjBu4+hi5OSQEDCRONnwh7GLkYtDSGAHo8TcvS3sEAlZiWfvdkDZwhL3W46wQhS9Z5R4eaud
        DSTBJqArseX5K7BuEYFuJok5m/qZQBxmge2MEh+WrmMBqRIWiJb4fqILzGYRUJVoO7uUEcTm
        FbCV2PNwGhPECnmJDfN7mUFsTgE7ievTvoLZQkA1z/uesUDUC0qcnPkEzGYGqm/eOpt5AqPA
        LCSpWUhSCxiZVjFKphYU56bnFhsWGOWllusVJ+YWl+al6yXn525iBEeCltYOxj2rPugdYmTi
        YDzEKMHBrCTCW7JrapIQb0piZVVqUX58UWlOavEhRmkOFiVx3gtdJ+OFBNITS1KzU1MLUotg
        skwcnFINTG3PX52auqj4lKlwZJP9NaOUqGPMFm942DWmbi+MNu8ou9i+i+nY3heckg2cM4Id
        Bd80tt7o/P+xitWJz2r1hu1vLH8fnczbNfPFIe1vv1Ufci+cavCsdsn08j+K580CDj203NB8
        ZE7H5uZLsf5VnbctF5z43Mmyqzvoz9GUnVvV1M6+Em2wNklbs+LK0VuTWuaWZk99Uc0dfdvg
        17b8s9WrqllCPstO69r623tH4sF9b4M3yv81aRSLdeMS67ha+Myhw+ft6lzGXXtESn+zXvla
        +m3qofUzfV6s71nnsrP5/OtPb4LK5+aael/9/uZpTW275y/+nxNWVH2dWDp9ceapd+dVJh8x
        dLY4VDTJ3tVPiaU4I9FQi7moOBEAqVpxLPMCAAA=
X-CMS-MailID: 20220603020426epcas2p43e4c27b5a371e2fcdfa462c564d9c5e3
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20220603020426epcas2p43e4c27b5a371e2fcdfa462c564d9c5e3
References: <20220603020410.2976-1-chanho61.park@samsung.com>
        <CGME20220603020426epcas2p43e4c27b5a371e2fcdfa462c564d9c5e3@epcas2p4.samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

To support secondary ufs phy devices, we need to get an offset value
from pmu-syscon.

Signed-off-by: Chanho Park <chanho61.park@samsung.com>
---
 .../devicetree/bindings/phy/samsung,ufs-phy.yaml   | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/phy/samsung,ufs-phy.yaml b/Documentation/devicetree/bindings/phy/samsung,ufs-phy.yaml
index f6ed1a005e7a..17897a3b5c9e 100644
--- a/Documentation/devicetree/bindings/phy/samsung,ufs-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/samsung,ufs-phy.yaml
@@ -40,9 +40,17 @@ properties:
       - const: tx0_symbol_clk
 
   samsung,pmu-syscon:
-    $ref: '/schemas/types.yaml#/definitions/phandle'
-    description: phandle for PMU system controller interface, used to
-                 control pmu registers bits for ufs m-phy
+    $ref: '/schemas/types.yaml#/definitions/phandle-array'
+    maxItems: 1
+    items:
+      minItems: 1
+      items:
+        - description: phandle for PMU system controller interface, used to
+                       control pmu registers bits for ufs m-phy
+        - description: offset of the pmu control register
+    description:
+      It can be phandle/offset pair. The second cell which can represent an
+      offset is optional.
 
 required:
   - "#phy-cells"
-- 
2.36.1

