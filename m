Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40993CCA479
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  2 Jun 2022 05:33:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229549AbiFBFdp (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 2 Jun 2022 01:33:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229899AbiFBFdo (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 2 Jun 2022 01:33:44 -0400
Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41FBF48E52
        for <linux-samsung-soc@vger.kernel.org>; Wed,  1 Jun 2022 22:33:37 -0700 (PDT)
Received: from epcas2p3.samsung.com (unknown [182.195.41.55])
        by mailout3.samsung.com (KnoxPortal) with ESMTP id 20220602053332epoutp035d227d0da41370ec263feba3a0c8928c~0ttpVOOr41194811948epoutp03c
        for <linux-samsung-soc@vger.kernel.org>; Thu,  2 Jun 2022 05:33:31 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20220602053332epoutp035d227d0da41370ec263feba3a0c8928c~0ttpVOOr41194811948epoutp03c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1654148012;
        bh=VFA8ToDGFJJ+rQ3o4nzu+uSsB+cXH7/i59mTnfMkBhE=;
        h=From:To:Cc:Subject:Date:References:From;
        b=suway6glYBZfE54AfZCaYHQck8tEJLXyVbrOsZzVCfP4Mcfjdvsf3OFeXBWa1xS5b
         2xNMteuHxZRHytg0thOl3gb0chJpr0X1j+a+OSOb2v97uY49uuQ/cTfBq0QNlDhb1F
         k0rP2WY0x6fV3k5KtUjk0lC6bGNJytE5tMaeSqts=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
        epcas2p4.samsung.com (KnoxPortal) with ESMTP id
        20220602053331epcas2p467a4f7b63c418539adec037006dcab6c~0ttoiD1Dd2584825848epcas2p4S;
        Thu,  2 Jun 2022 05:33:31 +0000 (GMT)
Received: from epsmges2p2.samsung.com (unknown [182.195.36.99]) by
        epsnrtp3.localdomain (Postfix) with ESMTP id 4LDF6d4cH9z4x9QG; Thu,  2 Jun
        2022 05:33:29 +0000 (GMT)
Received: from epcas2p2.samsung.com ( [182.195.41.54]) by
        epsmges2p2.samsung.com (Symantec Messaging Gateway) with SMTP id
        9D.23.09764.9AB48926; Thu,  2 Jun 2022 14:33:29 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
        epcas2p4.samsung.com (KnoxPortal) with ESMTPA id
        20220602053329epcas2p402901736895e6cb802a04cc3f95d172e~0ttmtY5de0310603106epcas2p4v;
        Thu,  2 Jun 2022 05:33:29 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
        epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20220602053329epsmtrp118228ec3584b55ca28bf2a63a352f711~0ttmqlqUY1617116171epsmtrp1T;
        Thu,  2 Jun 2022 05:33:29 +0000 (GMT)
X-AuditID: b6c32a46-f75ff70000002624-ea-62984ba96e37
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
        epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
        C2.1E.11276.8AB48926; Thu,  2 Jun 2022 14:33:29 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.9.51]) by
        epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20220602053328epsmtip27649cc1e591b05eb5bec57e29a26cb33~0ttmeBY-H0794307943epsmtip2j;
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
Subject: [PATCH v2 0/6] support secondary ufs for Exynos Auto v9 SoC
Date:   Thu,  2 Jun 2022 14:32:44 +0900
Message-Id: <20220602053250.62593-1-chanho61.park@samsung.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprGJsWRmVeSWpSXmKPExsWy7bCmme5K7xlJBhfWqlg8mLeNzeLyfm2L
        +UfOsVpceNrDZtH34iGzxd7XW9ktNj2+xmoxYdU3FosZ5/cxWbTuPcJusfPOCWYHbo9NqzrZ
        PO5c28PmsXlJvUffllWMHsdvbGfy+LxJLoAtKtsmIzUxJbVIITUvOT8lMy/dVsk7ON453tTM
        wFDX0NLCXEkhLzE31VbJxSdA1y0zB+g6JYWyxJxSoFBAYnGxkr6dTVF+aUmqQkZ+cYmtUmpB
        Sk6BeYFecWJucWleul5eaomVoYGBkSlQYUJ2xp+OSUwFf7gq2i7/Z2lgfMrRxcjJISFgIvH9
        3jlGEFtIYAejxPRlil2MXED2J0aJO+tb2SES3xgldqzShml48+Y6VMNeRonTM+whGj4ySly5
        OZUVJMEmoCux5fkrRpCEiEA7k8SJe3PZQRxmgc2MEicnbGAGqRIWcJF4vuQwG4jNIqAqsel8
        MwuIzStgJ7Hw7nJGiHXyEhvm9zJDxAUlTs58AlbDDBRv3jqbGWSohMBXdolFszeyQzS4SFzq
        XckEYQtLvDq+BSouJfGyvw3KLpZYOusTE0RzA6PE5W2/2CASxhKznrUDbeYA2qApsX6XPogp
        IaAsceQW1F4+iY7Df9khwrwSHW1CEI3qEge2T2eBsGUluud8ZoWwPST+X5nABAmtWIm1C58w
        T2CUn4Xkm1lIvpmFsHcBI/MqRrHUguLc9NRiowIjeKQm5+duYgQnUC23HYxT3n7QO8TIxMF4
        iFGCg1lJhLdk19QkId6UxMqq1KL8+KLSnNTiQ4ymwPCdyCwlmpwPTOF5JfGGJpYGJmZmhuZG
        pgbmSuK8XikbEoUE0hNLUrNTUwtSi2D6mDg4pRqYTi07kLsr5dDJySZ/hcWfpN/ckHKuSurJ
        Vl2z6aXNE263WyxSePF76amioJ2O7L1s1w6KXDeM7muOctSy2BUmF9e/8cV9/ZQI1VW3O2ad
        6pRfkcPL/bC/6elDlSmifRGfHRWv2Jy91yp10u6h/Mm4d98mLr/B5JOoJLzgrVG6qOCzL3t/
        5XCUSTdITuJnXvL+bcUkG8mzu/xevq2vs372S22lz5+N0/+o9y19fZV/xUKOucaVb5Zw9FRN
        //9kNcdM07LTx751yNr7RC/4dd08e+KrA/Mlfgi0eZ22ib5fKPWPy9f/bLXCa5Gszw9fHWpU
        l81oXlR8xlRrAtu9zp25L/YKrWwU2yqbFfP7d4fVGyWW4oxEQy3mouJEADMnrggpBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrBLMWRmVeSWpSXmKPExsWy7bCSvO5K7xlJBhtmMVs8mLeNzeLyfm2L
        +UfOsVpceNrDZtH34iGzxd7XW9ktNj2+xmoxYdU3FosZ5/cxWbTuPcJusfPOCWYHbo9NqzrZ
        PO5c28PmsXlJvUffllWMHsdvbGfy+LxJLoAtissmJTUnsyy1SN8ugSvjT8ckpoI/XBVtl/+z
        NDA+5ehi5OSQEDCRePPmOmMXIxeHkMBuRomfHxewQSRkJZ6928EOYQtL3G85wgpR9J5R4vzT
        6YwgCTYBXYktz1+BdYsIdDNJzNnUzwTiMAtsZ5T4sHQdC0iVsICLxPMlh8HGsgioSmw63wwW
        5xWwk1h4dzkjxAp5iQ3ze5kh4oISJ2c+AathBoo3b53NPIGRbxaS1CwkqQWMTKsYJVMLinPT
        c4sNCwzzUsv1ihNzi0vz0vWS83M3MYIDW0tzB+P2VR/0DjEycTAeYpTgYFYS4S3ZNTVJiDcl
        sbIqtSg/vqg0J7X4EKM0B4uSOO+FrpPxQgLpiSWp2ampBalFMFkmDk6pBiY3pwWJzx7InToh
        r2XRVsVo/2TVm3X9ivvvy+QmeC8qt9h4ziptyuzVP++/bIidsvvbEdWD+yfumlJYPIthXW5S
        q6TF067XpyfNU7fcf3+t7ClrlWjt6BspX48JW2V98OH8KK22zmhHx9x99SvenV1vXXPIMN5d
        uOY8x9s5Pn88XnHHvF2ev3jXt3un5dvvXZ4rI7P65/OdfqbrPYI/TGJsmfX5QeS0l7N/iVz9
        8/3d/rd/n7qWPhWODVd23rhDeXGb3UUXdcf/4vL88nP+cOqkXC9fzbpv3cT4q5Z9B0pfqh1h
        nzBpQemJRrPn125aZnLzfPPnKkw69NpOQDPyg7Di+cm+mWHS8Wtd1z9K/uSrpsRSnJFoqMVc
        VJwIALGRwiHbAgAA
X-CMS-MailID: 20220602053329epcas2p402901736895e6cb802a04cc3f95d172e
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20220602053329epcas2p402901736895e6cb802a04cc3f95d172e
References: <CGME20220602053329epcas2p402901736895e6cb802a04cc3f95d172e@epcas2p4.samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

To support ufs #1 for Exynos Auto v9 SoC, we need to control its own pmu
register. So, we need to specify the offset of the register via an
argument of syscon node.
Regarding UFS HCI driver, we need to specify different sysreg
configuration for UFS #1's io coherency setting.

Changes from v1:
- dt-bindings: Correct tab align and add "minItems: 1" to make the second
  cell as optional.
- Add 0001- patch to constify phy_cfg.
- Allocate phy->isol and copy data from drvdata to avoid const qualifier
  error
- Add 0004- patch to apply dt style for ufs0 as Krzysztof's suggestion
- Align tab and apply ufs node naming for device tree nodes

Chanho Park (6):
  dt-bindings: phy: samsung,ufs-phy: make pmu-syscon as phandle-array
  phy: samsung: ufs: constify samsung_ufs_phy_cfg
  phy: samsung: ufs: support secondary ufs phy
  arm64: dts: exynosautov9: adjust DT style of ufs nodes
  arm64: dts: exynosautov9: add secondary ufs devices
  arm64: dts: exynosautov9-sadk: enable secondary ufs devices

 .../bindings/phy/samsung,ufs-phy.yaml         | 13 ++++--
 .../boot/dts/exynos/exynosautov9-sadk.dts     | 18 ++++++++
 arch/arm64/boot/dts/exynos/exynosautov9.dtsi  | 44 ++++++++++++++++---
 drivers/phy/samsung/phy-samsung-ufs.c         | 18 ++++++--
 drivers/phy/samsung/phy-samsung-ufs.h         |  4 +-
 5 files changed, 83 insertions(+), 14 deletions(-)

-- 
2.36.1

