Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC511CCA482
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  1 Jul 2022 01:55:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232591AbiGABzC (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 30 Jun 2022 21:55:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32844 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232223AbiGABzB (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 30 Jun 2022 21:55:01 -0400
Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B11255C9D4
        for <linux-samsung-soc@vger.kernel.org>; Thu, 30 Jun 2022 18:54:57 -0700 (PDT)
Received: from epcas2p4.samsung.com (unknown [182.195.41.56])
        by mailout3.samsung.com (KnoxPortal) with ESMTP id 20220701015452epoutp030a34d961a6dac639dceda556167b58d3~9kcAswdZs3018430184epoutp03w
        for <linux-samsung-soc@vger.kernel.org>; Fri,  1 Jul 2022 01:54:52 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20220701015452epoutp030a34d961a6dac639dceda556167b58d3~9kcAswdZs3018430184epoutp03w
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1656640492;
        bh=dc5BZSrh8Qzb5+NzapevGb8fICfGbUyOB0tNOPIqj/c=;
        h=From:To:Cc:Subject:Date:References:From;
        b=XNqtUmWPCqSRKRK7ijPYvuIS7LZ5M0Hz3gahGbF8KmNl2x/i5FzGbCCEXyzCsqtxP
         Pb+W8azyAeJDNhZgaluBDsAzJknXqo/TBxI24qLmFWxmBteD/W5QBAQs4bzPaaOtbr
         zPB3t5L66qtCyxD40f4sfSsCMVDch8I2uJJvSMfc=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
        epcas2p1.samsung.com (KnoxPortal) with ESMTP id
        20220701015451epcas2p1da5c11009b17aca7baeecff6bf7886ba~9kcALD0jy2754627546epcas2p1K;
        Fri,  1 Jul 2022 01:54:51 +0000 (GMT)
Received: from epsmges2p2.samsung.com (unknown [182.195.36.91]) by
        epsnrtp4.localdomain (Postfix) with ESMTP id 4LYytz2gjDz4x9QT; Fri,  1 Jul
        2022 01:54:51 +0000 (GMT)
Received: from epcas2p3.samsung.com ( [182.195.41.55]) by
        epsmges2p2.samsung.com (Symantec Messaging Gateway) with SMTP id
        E5.CF.09650.BE35EB26; Fri,  1 Jul 2022 10:54:51 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
        epcas2p4.samsung.com (KnoxPortal) with ESMTPA id
        20220701015450epcas2p486f1a131e1d8d11979e1e61d6250a4f2~9kb-RUHZw0812008120epcas2p4F;
        Fri,  1 Jul 2022 01:54:50 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
        epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20220701015450epsmtrp1de094a657f32c39e0c704d955d7e6b75~9kb-QSo9g0894608946epsmtrp1_;
        Fri,  1 Jul 2022 01:54:50 +0000 (GMT)
X-AuditID: b6c32a46-0b9ff700000025b2-97-62be53eb0a61
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
        epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
        C9.E4.08905.AE35EB26; Fri,  1 Jul 2022 10:54:50 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.9.51]) by
        epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20220701015450epsmtip216f1482943b9d919633d1f7b6a9b70ff~9kb-CMgud0445504455epsmtip2U;
        Fri,  1 Jul 2022 01:54:50 +0000 (GMT)
From:   Chanho Park <chanho61.park@samsung.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Alim Akhtar <alim.akhtar@samsung.com>,
        Sam Protsenko <semen.protsenko@linaro.org>,
        Jaewon Kim <jaewon02.kim@samsung.com>,
        devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Chanho Park <chanho61.park@samsung.com>
Subject: [PATCH v3 0/5] support USI for Exynos Auto v9 SoC
Date:   Fri,  1 Jul 2022 10:52:21 +0900
Message-Id: <20220701015226.32781-1-chanho61.park@samsung.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupgk+LIzCtJLcpLzFFi42LZdljTXPd18L4kg3/dIhYP5m1js7i8X9ti
        /pFzrBY7Go6wWvS9eMhssenxNVaLGef3MVm07j3CbvG8bx+TA6fHplWdbB53ru1h89i8pN6j
        b8sqRo/Pm+QCWKOybTJSE1NSixRS85LzUzLz0m2VvIPjneNNzQwMdQ0tLcyVFPISc1NtlVx8
        AnTdMnOAzlFSKEvMKQUKBSQWFyvp29kU5ZeWpCpk5BeX2CqlFqTkFJgX6BUn5haX5qXr5aWW
        WBkaGBiZAhUmZGf8f/CYreAsd8Xa2YdYGxi3cHYxcnJICJhIzPm/ir2LkYtDSGAHo8SBtZeZ
        QBJCAp8YJV52lEAkvjFK7Jv6mhGm4/eKTjaIxF5GieP9z6DaPzJK/H75ig2kik1AV2LL81dg
        HSIC8RLPL7xnASliFpjEJHG+o5kZJCEsYCVx8+JnsH0sAqoSl74+BLN5BewkvrcuYYJYJy+x
        YX4vM0RcUOLkzCcsIDYzULx562xmkKESArfYJV6f2sQG0eAi8WbaAShbWOLV8S3sELaUxMv+
        Nii7WGLprE9MEM0NjBKXt/2CajCWmPWsHehsDqANmhLrd+mDmBICyhJHbkHt5ZPoOPyXHSLM
        K9HRJgTRqC5xYPt0FghbVqJ7zmdWCNtD4kHjeVZIkMZKrH3ziH0Co/wsJN/MQvLNLIS9CxiZ
        VzGKpRYU56anFhsVGMFjNTk/dxMjOElque1gnPL2g94hRiYOxkOMEhzMSiK8bPP2JgnxpiRW
        VqUW5ccXleakFh9iNAWG70RmKdHkfGCaziuJNzSxNDAxMzM0NzI1MFcS5/VK2ZAoJJCeWJKa
        nZpakFoE08fEwSnVwHQ22HOuqN7lCtMJtu3b//0Vlt7dL/K9LEg5cFfGr1qji4qHvA/tl87X
        v+/l2Xzo2z8rxkKVWsvwmLPvsxKmRGoa1b/lC2VheV6/PE9q94oPbxYdOxmkWVW2TeOh8TXV
        Mp907RKzT/vkbeIS05077dMzZycemN5vksk/MXOb1/wFAtvCq1VPTDoWdcp0gnDrk45O1fO/
        pLYKT7LQSRaYYVBt7VAweX7c+tUrF51Imv1HUHhvQrRRivDj9ulrVNLXCqwUK9jfsYDtsfic
        UueQuHzt7TIzfU7K1G1ucvwkEBZdfMEqkWNnlsPqHWXHeA0f9t560+J4OkLeIk4+bWZBi/4t
        s5fMk7Ny9feJMUgrsRRnJBpqMRcVJwIAp+NlIhsEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrBLMWRmVeSWpSXmKPExsWy7bCSvO6r4H1JBssOGVs8mLeNzeLyfm2L
        +UfOsVrsaDjCatH34iGzxabH11gtZpzfx2TRuvcIu8Xzvn1MDpwem1Z1snncubaHzWPzknqP
        vi2rGD0+b5ILYI3isklJzcksSy3St0vgyvj/4DFbwVnuirWzD7E2MG7h7GLk5JAQMJH4vaKT
        rYuRi0NIYDejxNxbnxghErISz97tYIewhSXutxxhhSh6zyixv6+VFSTBJqArseX5K7AGEYF4
        ic1fFrKAFDELTGOS6Hg8A6xbWMBK4ubFz0wgNouAqsSlrw/BbF4BO4nvrUuYIDbIS2yY38sM
        EReUODnzCQuIzQwUb946m3kCI98sJKlZSFILGJlWMUqmFhTnpucWGxYY5qWW6xUn5haX5qXr
        JefnbmIEB66W5g7G7as+6B1iZOJgPMQowcGsJMLLNm9vkhBvSmJlVWpRfnxRaU5q8SFGaQ4W
        JXHeC10n44UE0hNLUrNTUwtSi2CyTBycUg1M042etXEviLskfWpF9Lu5yXfcCl7lC9Rtcr3/
        /M5Vp02TE3c1f5Y5IbP3AIeRwMMaP+kXUvv+t5sa/r+9x0Xh4d/yTiMFqcXTnsvJLY7XWjup
        OMx3Oo/8BY/HJrX91l4/ePYuLOQ4fSbxxN9ojojTPxNXfLB4bfCmw0dZPMn0VJnXLZFSkb83
        hNa/C+fe8fdf9AUzneqVBQ7/RBqa2IM/fzEoDvOoZ/q4TFpI//ALrY0ZvO0MPDHfenOaVRN6
        d5jJuovm8R/cOePeuwPf8i/Nu8gX5eWXwjj/jAiDXefdObofD05XWXipdbb4xnt8OawqNTl/
        zh2z/epxe9kargsTQhlmPTZeKbPzQW5v47I8JZbijERDLeai4kQArby8HMsCAAA=
X-CMS-MailID: 20220701015450epcas2p486f1a131e1d8d11979e1e61d6250a4f2
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20220701015450epcas2p486f1a131e1d8d11979e1e61d6250a4f2
References: <CGME20220701015450epcas2p486f1a131e1d8d11979e1e61d6250a4f2@epcas2p4.samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Add to support USI(Universal Serial Interface) for Exynos Auto v9 SoC.
This patchset is built on top of below patchset.
- spi patchset:
https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next
- serial patch to expand serial devices to 12:
git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/tty.git
in the tty-testing branch.

The SoC supports up to 12 USIs so they can be configured as below
- 12 x UARTs(4pins)
- 12 x SPIs(4pins)
- 24 x I2C
- 12 x UARTS(2pin) and 12 x I2C

Changes from v2:
- Add R-B tags for #1 and #2 dt-binding patches
- Separate usi0 changes

Changes from v1:
- Move all usi nodes from exynosautov9-usi.dtsi to exynosautov9.dtsi as
  suggested by Krzysztof
- Add exynosautov9-usi and exynosautov9-uart compatibles
- Drop unnecessary /* USI: */ comments
- Separate phandles of dmas nodes

Chanho Park (5):
  dt-bindings: soc: samsung: usi: add exynosautov9-usi compatible
  dt-bindings: serial: samsung: add exynosautov9-uart compatible
  arm64: dts: exynosautov9: add pdma0 device tree node
  arm64: dts: exynosautov9: prepare usi0 changes
  arm64: dts: exynosautov9: add usi device tree nodes

 .../bindings/serial/samsung_uart.yaml         |    5 +-
 .../bindings/soc/samsung/exynos-usi.yaml      |    8 +-
 .../boot/dts/exynos/exynosautov9-sadk.dts     |    2 +
 arch/arm64/boot/dts/exynos/exynosautov9.dtsi  | 1087 ++++++++++++++++-
 4 files changed, 1094 insertions(+), 8 deletions(-)

-- 
2.36.1

