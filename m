Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 639B6CCA47C
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  2 Jun 2022 05:33:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230118AbiFBFdq (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 2 Jun 2022 01:33:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229974AbiFBFdo (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 2 Jun 2022 01:33:44 -0400
Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D10380218
        for <linux-samsung-soc@vger.kernel.org>; Wed,  1 Jun 2022 22:33:37 -0700 (PDT)
Received: from epcas2p1.samsung.com (unknown [182.195.41.53])
        by mailout4.samsung.com (KnoxPortal) with ESMTP id 20220602053332epoutp04eb0154987ef04d7f4b90b6631c0658f2~0ttqKUoXA0839608396epoutp04y
        for <linux-samsung-soc@vger.kernel.org>; Thu,  2 Jun 2022 05:33:32 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20220602053332epoutp04eb0154987ef04d7f4b90b6631c0658f2~0ttqKUoXA0839608396epoutp04y
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1654148012;
        bh=H8PocrFmk9EXhUhBzdiSu6B6SsAREiwwPU3cBKm2TFI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Bd5jR+bFzJ9NXOFuVvJElQdoZAihyZ2c6vz12mII0HrhNDS6MH6ccfMJVA56FF6jB
         uhbZ5Vp0i3ZIBpxh9D7ABA+sCxy0iub+4dWBN6z90R8LOlU1mulRGqkOZYojP0VrmW
         xLCPqCzSYHJcWhB1srAPf0qsb5IB7sV1vSgNwM+M=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
        epcas2p4.samsung.com (KnoxPortal) with ESMTP id
        20220602053332epcas2p401784b5e2968ad35552970b53e02afcd~0ttpieswm0310603106epcas2p43;
        Thu,  2 Jun 2022 05:33:32 +0000 (GMT)
Received: from epsmges2p3.samsung.com (unknown [182.195.36.89]) by
        epsnrtp4.localdomain (Postfix) with ESMTP id 4LDF6f3tqnz4x9QG; Thu,  2 Jun
        2022 05:33:30 +0000 (GMT)
Received: from epcas2p3.samsung.com ( [182.195.41.55]) by
        epsmges2p3.samsung.com (Symantec Messaging Gateway) with SMTP id
        0F.06.10028.9AB48926; Thu,  2 Jun 2022 14:33:29 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
        epcas2p4.samsung.com (KnoxPortal) with ESMTPA id
        20220602053329epcas2p4c2baca2d161814f5d51dc48722f904b1~0ttmxAS9n0810308103epcas2p4U;
        Thu,  2 Jun 2022 05:33:29 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
        epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20220602053329epsmtrp188a1e1c7ee74502d99822c3bb1fe7f94~0ttmv170G1619216192epsmtrp1B;
        Thu,  2 Jun 2022 05:33:29 +0000 (GMT)
X-AuditID: b6c32a47-589ff7000000272c-72-62984ba9802f
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
        epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
        EB.28.08924.9AB48926; Thu,  2 Jun 2022 14:33:29 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.9.51]) by
        epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20220602053329epsmtip2b6d4dc7454f96113809bee3321b07638~0ttmilbGL0794907949epsmtip2p;
        Thu,  2 Jun 2022 05:33:28 +0000 (GMT)
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
Subject: [PATCH v2 1/6] dt-bindings: phy: samsung,ufs-phy: make pmu-syscon
 as phandle-array
Date:   Thu,  2 Jun 2022 14:32:45 +0900
Message-Id: <20220602053250.62593-2-chanho61.park@samsung.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220602053250.62593-1-chanho61.park@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrCJsWRmVeSWpSXmKPExsWy7bCmue5K7xlJBjNPaVg8mLeNzeLyfm2L
        +UfOsVpceNrDZtH34iGzxd7XW9ktNj2+xmoxYdU3FosZ5/cxWbTuPcJusfPOCWYHbo9NqzrZ
        PO5c28PmsXlJvUffllWMHsdvbGfy+LxJLoAtKtsmIzUxJbVIITUvOT8lMy/dVsk7ON453tTM
        wFDX0NLCXEkhLzE31VbJxSdA1y0zB+g6JYWyxJxSoFBAYnGxkr6dTVF+aUmqQkZ+cYmtUmpB
        Sk6BeYFecWJucWleul5eaomVoYGBkSlQYUJ2xutjP5kKjnJVzJi6h62BcRVHFyMnh4SAicSz
        Nc9Zuxi5OIQEdjBKvHo4iQnC+cQocfHCbmYI5zOjRNeVd4wwLYvur2WBSOxilDh2fhcrSEJI
        4COjxPd5xiA2m4CuxJbnrxhBikQE2pkkTtybyw7iMAtsZpQ4OWEDM0iVsECsxNqrs9lBbBYB
        VYlvTYvZQGxeATuJN7uOsEKsk5fYML8XqJ6Dg1PAXmLLGQ+IEkGJkzOfsIDYzEAlzVtng50q
        ITCVQ6J1/0l2iF4Xia7bD6BsYYlXx7dA2VISL/vboOxiiaWzPjFBNDcwSlze9osNImEsMetZ
        OyPIYmYBTYn1u/RBTAkBZYkjt6D28kl0HP7LDhHmlehoE4JoVJc4sH06C4QtK9E95zPUJx4S
        Z089hYb1JEaJz9O3sk1gVJiF5J1ZSN6ZhbB4ASPzKkax1ILi3PTUYqMCY3gUJ+fnbmIEJ1ct
        9x2MM95+0DvEyMTBeIhRgoNZSYS3ZNfUJCHelMTKqtSi/Pii0pzU4kOMpsCwnsgsJZqcD0zv
        eSXxhiaWBiZmZobmRqYG5krivF4pGxKFBNITS1KzU1MLUotg+pg4OKUamLbfc3+Vkxrde7fk
        292N+y61aXbVtgl/UnM6E9u8K/5mzM7Hu9P+XmAwnChnt3mnUz1b5IaI/WucJP1qXnFvdvP7
        P+njvk9KendW3T0lsFfApPSsvNrH3oW8y3a9uz6p7OOGR3GX16/ZK7V0ZlPHqyaT0JX395x9
        OvWMYMgWsTIfpXzXOWZp/L/8HvuUZX+yl7c+WCbQKaL10Ta677afY86+PdYquXOWRMxgNxW9
        ILzRddPsh0esrbMF/Xm/lWatrPy/P5TbL+6HvuJu/Qh3+70K3N6hVzM8LpXbzvAPm/GP827b
        6d9nNvx8VeH7d2paKUONU+it79kCE283eRZ8435xIrT/57eZNd86u7gnv1BiKc5INNRiLipO
        BAB+FzmHNwQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrPLMWRmVeSWpSXmKPExsWy7bCSvO5K7xlJBg1XOSwezNvGZnF5v7bF
        /CPnWC0uPO1hs+h78ZDZYu/rrewWmx5fY7WYsOobi8WM8/uYLFr3HmG32HnnBLMDt8emVZ1s
        Hneu7WHz2Lyk3qNvyypGj+M3tjN5fN4kF8AWxWWTkpqTWZZapG+XwJXx+thPpoKjXBUzpu5h
        a2BcxdHFyMkhIWAisej+WpYuRi4OIYEdjBLTl65ng0jISjx7t4MdwhaWuN9yhBWi6D2jxJ+5
        JxhBEmwCuhJbnr9iBEmICHQzSczZ1M8E4jALbGeU+LB0HQtIlbBAtMTKaduZQGwWAVWJb02L
        wVbwCthJvNkFMhZkhbzEhvm9zF2MHBycAvYSW854gISFgEo2X97AClEuKHFy5hOwkcxA5c1b
        ZzNPYBSYhSQ1C0lqASPTKkbJ1ILi3PTcYsMCo7zUcr3ixNzi0rx0veT83E2M4DjQ0trBuGfV
        B71DjEwcjIcYJTiYlUR4S3ZNTRLiTUmsrEotyo8vKs1JLT7EKM3BoiTOe6HrZLyQQHpiSWp2
        ampBahFMlomDU6qBafaJM1rf56S82rFDly9SYd+WV/9men3ePKvn4cyq3dxPw5k2WNdx5tse
        WHP79aL7Hua6OfNYN9SLv7CrPyboxOGwgEcnQMkq9MvJpLvH9iucSdyQqMA3WfTrGSHN0pbs
        ioVMO3xfRBzs+GAeqPY98tfN78Ub1ymduGKTmXV42nZ7hnuptjot3+ewveW2vrV34frdd7+2
        yd7pWXPJOP7eRU2+zLBXMy1u/71QF+6y6LX1j+S6CW+K+Q6JB4tKf0/90cspuLW4YbLo6yvy
        LTyF0n/4i9nLfs2e6P1rTkxBf8SVDQ87O9wyfv0I8HB757vk3QQTM271ak2WwtlPeL6yaaVf
        +9/2xZNL89h7gzvv5iixFGckGmoxFxUnAgChGS9K8gIAAA==
X-CMS-MailID: 20220602053329epcas2p4c2baca2d161814f5d51dc48722f904b1
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20220602053329epcas2p4c2baca2d161814f5d51dc48722f904b1
References: <20220602053250.62593-1-chanho61.park@samsung.com>
        <CGME20220602053329epcas2p4c2baca2d161814f5d51dc48722f904b1@epcas2p4.samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

To support secondary ufs phy devices, we need to get an offset value
from pmu-syscon.

Signed-off-by: Chanho Park <chanho61.park@samsung.com>
---
 .../devicetree/bindings/phy/samsung,ufs-phy.yaml    | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/phy/samsung,ufs-phy.yaml b/Documentation/devicetree/bindings/phy/samsung,ufs-phy.yaml
index f6ed1a005e7a..d0ba92aa578d 100644
--- a/Documentation/devicetree/bindings/phy/samsung,ufs-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/samsung,ufs-phy.yaml
@@ -40,9 +40,16 @@ properties:
       - const: tx0_symbol_clk
 
   samsung,pmu-syscon:
-    $ref: '/schemas/types.yaml#/definitions/phandle'
-    description: phandle for PMU system controller interface, used to
-                 control pmu registers bits for ufs m-phy
+    $ref: '/schemas/types.yaml#/definitions/phandle-array'
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

