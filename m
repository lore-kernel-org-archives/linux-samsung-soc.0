Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3012CCA47D
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  3 Jun 2022 02:04:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240144AbiFCCEh (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 2 Jun 2022 22:04:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240200AbiFCCEe (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 2 Jun 2022 22:04:34 -0400
Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7397039698
        for <linux-samsung-soc@vger.kernel.org>; Thu,  2 Jun 2022 19:04:32 -0700 (PDT)
Received: from epcas2p1.samsung.com (unknown [182.195.41.53])
        by mailout2.samsung.com (KnoxPortal) with ESMTP id 20220603020430epoutp02ae7b378f0f7dece338821e93330bf27e~0_ga-5SrQ0743907439epoutp02X
        for <linux-samsung-soc@vger.kernel.org>; Fri,  3 Jun 2022 02:04:30 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20220603020430epoutp02ae7b378f0f7dece338821e93330bf27e~0_ga-5SrQ0743907439epoutp02X
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1654221870;
        bh=1xDi2uqdIZyRSSKjAMcD4/NNmO07IOtQu/3O9HtKFN0=;
        h=From:To:Cc:Subject:Date:References:From;
        b=jNvVxxSio4avKTxxplZ63N5lAjnoNEWZ3ywL8QRc+fvl3V+ZhznakNfp0M32sBtWh
         WToOpagEu/p8nSL/EYuhafWOCbg+753DpPpYdbLUInFiZCzBTohlG4wGp4wTi+IuWK
         2mMh2Cv/COdW3yUhc+haf85e50wF2wEkvcYebmg0=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
        epcas2p2.samsung.com (KnoxPortal) with ESMTP id
        20220603020429epcas2p2da19fa79623f0fa45797a62b5e6b263c~0_gaVwIDX1635416354epcas2p2d;
        Fri,  3 Jun 2022 02:04:29 +0000 (GMT)
Received: from epsmges2p3.samsung.com (unknown [182.195.36.92]) by
        epsnrtp2.localdomain (Postfix) with ESMTP id 4LDmQy5Tvwz4x9Q9; Fri,  3 Jun
        2022 02:04:26 +0000 (GMT)
Received: from epcas2p4.samsung.com ( [182.195.41.56]) by
        epsmges2p3.samsung.com (Symantec Messaging Gateway) with SMTP id
        A8.BD.10028.A2C69926; Fri,  3 Jun 2022 11:04:26 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
        epcas2p4.samsung.com (KnoxPortal) with ESMTPA id
        20220603020426epcas2p4799d10beba3455061b8d8e965904cafe~0_gXe6YyW2972129721epcas2p4Y;
        Fri,  3 Jun 2022 02:04:26 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
        epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20220603020426epsmtrp20caaccfffcc77cecdb47de4cd274f111~0_gXcbwqa0586805868epsmtrp2K;
        Fri,  3 Jun 2022 02:04:26 +0000 (GMT)
X-AuditID: b6c32a47-573ff7000000272c-cc-62996c2aa266
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
        epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
        92.FF.08924.A2C69926; Fri,  3 Jun 2022 11:04:26 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.9.51]) by
        epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20220603020426epsmtip140820b0d69c3e19e575a2b34e614134e~0_gXPtNzg2995029950epsmtip1W;
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
Subject: [PATCH v3 0/5] support secondary ufs for Exynos Auto v9 SoC
Date:   Fri,  3 Jun 2022 11:04:05 +0900
Message-Id: <20220603020410.2976-1-chanho61.park@samsung.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprGJsWRmVeSWpSXmKPExsWy7bCmha5Wzswkg67L2hYP5m1js7i8X9ti
        /pFzrBYXnvawWfS9eMhssff1VnaLTY+vsVpMWPWNxWLG+X1MFq17j7Bb7LxzgtmB22PTqk42
        jzvX9rB5bF5S79G3ZRWjx/Eb25k8Pm+SC2CLyrbJSE1MSS1SSM1Lzk/JzEu3VfIOjneONzUz
        MNQ1tLQwV1LIS8xNtVVy8QnQdcvMAbpOSaEsMacUKBSQWFyspG9nU5RfWpKqkJFfXGKrlFqQ
        klNgXqBXnJhbXJqXrpeXWmJlaGBgZApUmJCdce/5FcaCMzwVU6ecZ29g/M/ZxcjJISFgIrHm
        9iTmLkYuDiGBHYwSbb+OMkI4nxglprf0s0A4nxklDi6+B1TGAdYye2ElSLeQwC5Gibm/4yBq
        PjJKtFzpZQRJsAnoSmx5/gpskohAO5PEiXtz2UEcZoHNjBInJ2wAmyQs4CJxaUMRSAOLgKrE
        l2sfWUBsXgFbiWf9b9kg7pOX2DC/lxkiLihxcuYTsBpmoHjz1tlgd0sI/GSX+Pn1EBNEg4vE
        m7Yr7BC2sMSr41ugbCmJz+/2Qg0tllg66xMTRHMDo8Tlbb+gEsYSs561M4IcxyygKbF+lz7E
        x8oSR25B7eWT6Dj8lx0izCvR0SYE0agucWD7dBYIW1aie85nVgjbQ+Lli8MskMCKlTjV08sy
        gVF+FpJvZiH5ZhbC3gWMzKsYxVILinPTU4uNCozhkZqcn7uJEZxAtdx3MM54+0HvECMTB+Mh
        RgkOZiUR3pJdU5OEeFMSK6tSi/Lji0pzUosPMZoCw3cis5Rocj4wheeVxBuaWBqYmJkZmhuZ
        GpgrifN6pWxIFBJITyxJzU5NLUgtgulj4uCUamByUn5hVnUyd53cEjZV+5MOj9q6b2V+bP6i
        KBHz6Dpv79GShVcSue3XWX5ZV1+1nbE4p+ZfzjevjPdnDnOovjHXf/Ft/wxD6bjZU/4J/u/3
        5JESZKuTlD8d5XfiusJ1c/fA1ZEF2ySFN9U+9j5+dGvi6a+V0rergn/cbHVZ+vn6xFf675o0
        DbhW8r0S3Tyl+5VtWeTs077td+Pm6TGIaxjO1Jt2uL1suu/ueacsbfg7jvFa2Rp2P24qvpb/
        O53t8aG913S2Mtj9y93mpHr03Z4t52sPyV0KNXuzadLRtz+blcL33bL41bekUDonpFld1fvq
        +mkCL9W/L3Er31XVOo/xz7QvkRMNFNS3rj1bsdxHiaU4I9FQi7moOBEAvJ/+PikEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrGLMWRmVeSWpSXmKPExsWy7bCSnK5Wzswkg3MPOS0ezNvGZnF5v7bF
        /CPnWC0uPO1hs+h78ZDZYu/rrewWmx5fY7WYsOobi8WM8/uYLFr3HmG32HnnBLMDt8emVZ1s
        Hneu7WHz2Lyk3qNvyypGj+M3tjN5fN4kF8AWxWWTkpqTWZZapG+XwJVx7/kVxoIzPBVTp5xn
        b2D8z9nFyMEhIWAiMXthZRcjF4eQwA5GictbprF3MXICxWUlnr3bAWULS9xvOcIKUfSeUaLj
        5nomkASbgK7EluevGEESIgLdTBJzNvUzgTjMAtsZJT4sXccCskJYwEXi0oYikAYWAVWJL9c+
        soDYvAK2Es/637JBbJCX2DC/lxkiLihxcuYTsBpmoHjz1tnMExj5ZiFJzUKSWsDItIpRMrWg
        ODc9t9iwwCgvtVyvODG3uDQvXS85P3cTIziotbR2MO5Z9UHvECMTB+MhRgkOZiUR3pJdU5OE
        eFMSK6tSi/Lji0pzUosPMUpzsCiJ817oOhkvJJCeWJKanZpakFoEk2Xi4JRqYFrQNLdzc7bB
        M9knKd5/FjRtXrby/K942R+Rd0+01VemfMuTdBWdq5OonNVdriQcNedNzoXYaZd2llyZWdH4
        /fUC6S8TrO8mr9r455y4hsS/n4kPGie7tb0yXlUq8nuScLwBb/j6mRMXLF3QuXLqvPim54qz
        WlitZR8vLVp7IibpWcruKzd/TbysuKpgWTrH1e71x05bM/0WsLDfyTD7737bkpL+zl0CR7dW
        85n/8OZJWPfKdvoTFa5ZBcvCquwc3f/N3c8R90ltzR+38P/7JSWubL6yWpKn2ZzpzL2PSmKR
        szYoNBxc87L5gG7tffeQy3X/NdnyWB+z/O0NKTivX3Kj6uV07fL5y+w3MYruPcusxFKckWio
        xVxUnAgA9q/3wdkCAAA=
X-CMS-MailID: 20220603020426epcas2p4799d10beba3455061b8d8e965904cafe
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20220603020426epcas2p4799d10beba3455061b8d8e965904cafe
References: <CGME20220603020426epcas2p4799d10beba3455061b8d8e965904cafe@epcas2p4.samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

To support ufs #1 for Exynos Auto v9 SoC, we need to control its own pmu
register. So, we need to specify the offset of the register via an
argument of syscon node.

Changes from v2:
- Exclude dts patchset because they'll be queued by Krzysztof after
  v5.19 merge window.
- 0001-dt-bindings: Add "maxItems: 1" to the first level pmu-syscon
  items as suggested by Krzysztof
- 0002: The patch has been added to clarify the variable name
- 0004: The patch has been added to remove drvdata pointer as suggested
  by Krzysztof

Changes from v1:
- dt-bindings: Correct tab align and add "minItems: 1" to make the second
  cell as optional.
- Add 0001- patch to constify phy_cfg.
- Allocate phy->isol and copy data from drvdata to avoid const qualifier
  error
- Add 0004- patch to apply dt style for ufs0 as Krzysztof's suggestion
- Align tab and apply ufs node naming for device tree nodes

Chanho Park (5):
  dt-bindings: phy: samsung,ufs-phy: make pmu-syscon as phandle-array
  phy: samsung: ufs: rename cfg to cfgs for clarification
  phy: samsung: ufs: constify samsung_ufs_phy_cfg
  phy: samsung: ufs: remove drvdata from struct samsung_ufs_phy
  phy: samsung: ufs: support secondary ufs phy

 .../bindings/phy/samsung,ufs-phy.yaml         | 14 ++++++++---
 drivers/phy/samsung/phy-exynos7-ufs.c         |  2 +-
 drivers/phy/samsung/phy-exynosautov9-ufs.c    |  2 +-
 drivers/phy/samsung/phy-samsung-ufs.c         | 18 +++++++++-----
 drivers/phy/samsung/phy-samsung-ufs.h         | 24 ++++++++++---------
 5 files changed, 38 insertions(+), 22 deletions(-)

-- 
2.36.1

