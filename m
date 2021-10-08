Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8875EC433FE
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  8 Oct 2021 09:16:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6A81060EC0
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  8 Oct 2021 09:16:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236335AbhJHJSq (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 8 Oct 2021 05:18:46 -0400
Received: from mailout2.samsung.com ([203.254.224.25]:41740 "EHLO
        mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237458AbhJHJSp (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 8 Oct 2021 05:18:45 -0400
Received: from epcas2p4.samsung.com (unknown [182.195.41.56])
        by mailout2.samsung.com (KnoxPortal) with ESMTP id 20211008091648epoutp021da6bd3e52deef45edde5bb1b1d77aa4~sA37dhvRP2916129161epoutp02J
        for <linux-samsung-soc@vger.kernel.org>; Fri,  8 Oct 2021 09:16:48 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20211008091648epoutp021da6bd3e52deef45edde5bb1b1d77aa4~sA37dhvRP2916129161epoutp02J
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1633684608;
        bh=miAtkadnYd/2T/NQKtt07AJqR2dyJw61+Mh591sYDto=;
        h=From:To:Cc:Subject:Date:References:From;
        b=WUwsSNVd2coL0UkNe9JXyuJyCj9VWw/tKmYGyeW3I9J59mcfyc+fLMkJQ+d5YEX9O
         pZfg1g8HWRunrpM93vSsI4MeudtVoBLvAO+wvtcqcG5c7ppn3vj9SbpQSC05Sj6nNA
         btYb+A22b9T1CnMtxfOSmJeu9TojRrsU/8rgomrU=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
        epcas2p3.samsung.com (KnoxPortal) with ESMTP id
        20211008091647epcas2p30dedf6dddf88c297736544709383e5a7~sA36fdqpr2697626976epcas2p3m;
        Fri,  8 Oct 2021 09:16:47 +0000 (GMT)
Received: from epsmges2p4.samsung.com (unknown [182.195.36.88]) by
        epsnrtp1.localdomain (Postfix) with ESMTP id 4HQjHY1qDdz4x9Pv; Fri,  8 Oct
        2021 09:16:41 +0000 (GMT)
Received: from epcas2p4.samsung.com ( [182.195.41.56]) by
        epsmges2p4.samsung.com (Symantec Messaging Gateway) with SMTP id
        AC.F6.09472.87C00616; Fri,  8 Oct 2021 18:16:40 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
        epcas2p4.samsung.com (KnoxPortal) with ESMTPA id
        20211008091639epcas2p443a12d674adbb34aa5771cae2c0659fe~sA3ztrWHn0813808138epcas2p4f;
        Fri,  8 Oct 2021 09:16:39 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
        epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20211008091639epsmtrp2e3285115a7fdfeeef840887737c4de32~sA3zsqwij2378623786epsmtrp2r;
        Fri,  8 Oct 2021 09:16:39 +0000 (GMT)
X-AuditID: b6c32a48-d5fff70000002500-e7-61600c7807c5
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
        epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
        15.FD.08750.77C00616; Fri,  8 Oct 2021 18:16:39 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.9.51]) by
        epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20211008091639epsmtip1b3597f8e1a2c3270af2cf687f6617bad~sA3zf73Ow0184001840epsmtip1a;
        Fri,  8 Oct 2021 09:16:39 +0000 (GMT)
From:   Chanho Park <chanho61.park@samsung.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Tomasz Figa <tomasz.figa@gmail.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Chanho Park <chanho61.park@samsung.com>
Subject: [PATCH v2 0/3] add initial support for exynosautov9
Date:   Fri,  8 Oct 2021 18:14:40 +0900
Message-Id: <20211008091443.44625-1-chanho61.park@samsung.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmpnk+LIzCtJLcpLzFFi42LZdljTQreCJyHR4PEHZYvL+7Ut5h85x2qx
        8e0PJospf5YzWcw4v4/JonXvEXaLw2/aWS1W7frD6MDhMauhl81j56y77B6bVnWyedy5tofN
        o2/LKkaPz5vkAtiism0yUhNTUosUUvOS81My89JtlbyD453jTc0MDHUNLS3MlRTyEnNTbZVc
        fAJ03TJzgO5RUihLzCkFCgUkFhcr6dvZFOWXlqQqZOQXl9gqpRak5BSYF+gVJ+YWl+al6+Wl
        llgZGhgYmQIVJmRnTF5zkrlgIm/Fy9Ur2RoYn3J1MXJySAiYSMzva2bsYuTiEBLYwSjx5UIX
        C4TziVHi5KbN7BDOZ0aJ7nenmWBadn9cyAyR2MUocezmOrCEkMBHRolLm+RBbDYBXYktz1+B
        zRUR6GSUWPltG1gRs8ABRoktF+y6GDk4hAVsJNq7HEBMFgFViauHq0AqeAXsJDaumsMOsUte
        4sivTmaIuKDEyZlPWCCmyEs0b50NdoOEwD12ie2rJrFCNLhIXOvdCXWosMSr41ugBklJfH63
        lw2ioZtRovXRf6jEakaJzkYfCNte4tf0LawgBzELaEqs36UPYkoIKEscuQW1l0+i4/Bfdogw
        r0RHmxBEo7rEge3TWSBsWYnuOZ+hrvGQWPJoESskdGIlzh9awz6BUX4Wkm9mIflmFsLeBYzM
        qxjFUguKc9NTi40KTOBxmpyfu4kRnCK1PHYwzn77Qe8QIxMH4yFGCQ5mJRHefPvYRCHelMTK
        qtSi/Pii0pzU4kOMpsDgncgsJZqcD0zSeSXxhiaWBiZmZobmRqYG5krivHP/OSUKCaQnlqRm
        p6YWpBbB9DFxcEo1MJmY2Pncbf7yyfzcU5fHNyvDDGI/TVWTfJpUocD+qjFg98xL9hvrFSYl
        PhJxsfsop/pY9OJzfqHtfrxcSYJlLyRDe1y0rvVZroxLsb2rJbi++IhIwG7Z6tNSd+e/Sr+Y
        kOm/g5mHwTM+edfkT+/Wft/457GAVOWeUMkeQctQ0xT5HZ3/kjboPj0tLC49eaFvYa9b4/aE
        z5ecmNmstt/hdZD+GFeatdXd/WHRnLmrvbhK/0QYz/Ti1E93PMFk63Plm1zQhIwpNjkHYn+e
        SCk581Dmc0fY7VgXtRXSFx70BDgLxvfvm9+/6+gZtX9Cc+eoFF6trX9qm15wQT+m82lnk2K/
        +VKjE9PK3kw31pqixFKckWioxVxUnAgAs+goPBoEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrBLMWRmVeSWpSXmKPExsWy7bCSnG45T0KiwbH1xhaX92tbzD9yjtVi
        49sfTBZT/ixnsphxfh+TReveI+wWh9+0s1qs2vWH0YHDY1ZDL5vHzll32T02repk87hzbQ+b
        R9+WVYwenzfJBbBFcdmkpOZklqUW6dslcGVMXnOSuWAib8XL1SvZGhifcnUxcnJICJhI7P64
        kLmLkYtDSGAHo8SClYcZIRKyEs/e7WCHsIUl7rccYYUoes8osWfqbVaQBJuArsSW568YQRIi
        At2MEv2NvUwgDrPAEUaJ/99/sXQxcnAIC9hItHc5gJgsAqoSVw9XgfTyCthJbFw1B2qBvMSR
        X53MEHFBiZMzn7CA2MxA8eats5knMPLNQpKahSS1gJFpFaNkakFxbnpusWGBUV5quV5xYm5x
        aV66XnJ+7iZGcOBqae1g3LPqg94hRiYOxkOMEhzMSiK8+faxiUK8KYmVValF+fFFpTmpxYcY
        pTlYlMR5L3SdjBcSSE8sSc1OTS1ILYLJMnFwSjUwcbVWPl746b7x9i2nM7dL7N7Zc/H2St1v
        Alo2qlVheyNu+zV69qUsLbyy3PFxcCCHSeQPw32d03kCJ3tt5v/mNKFlFquXzIuT4kZBTxKd
        pxzgecZzYvHnv/N/93T4qCz/tKSqt57jxIr7TRU6nzIP1pxvztl280n35H/rmNbuyfmsHMuz
        auvGb+Fzfxrsf/r2zHqvyxP2HpEq5O+cfZzZkGfSldNeh7ZfkX85PaDR5Em9tojZfxO3Vwsd
        3zkYv35TNkN21qctMVKHJavWbFIMfxsQop67kPvGZ+XpHXx7j7LJeR3SN4691WRf2ZKgJ+XS
        uGc6W3zClydFbmejfFr7WIQb3xX7Cedtz8zOkv94S4mlOCPRUIu5qDgRAH7abp7LAgAA
X-CMS-MailID: 20211008091639epcas2p443a12d674adbb34aa5771cae2c0659fe
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20211008091639epcas2p443a12d674adbb34aa5771cae2c0659fe
References: <CGME20211008091639epcas2p443a12d674adbb34aa5771cae2c0659fe@epcas2p4.samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

This patchset supports minimal set for ExynosAuto v9 SoC and SADK board.
This contains serial_0 as uart console and ufs_0 for rootfs storage.
Regarding UFS, it depends on UFS patchset[1].

[1]: https://lore.kernel.org/linux-samsung-soc/20211007080934.108804-1-chanho61.park@samsung.com/T/#t

Changes since v1:
- add static and  __initconst of patch1
- Use pin and pins suffix for pinctrl nodes
- Remove non-SoC pins
- Move fixed rate clock nodes out of soc@0
- Add cortex-a76 compatibles to cpu and pmu node.
- Use lowercase of address representations
- Add pmu / syscon compatible.

Chanho Park (3):
  pinctrl: samsung: support ExynosAutov9 SoC pinctrl
  arm64: dts: exynos: add initial support for exynosautov9 SoC
  arm64: dts: exynos: add minimal support for exynosautov9 sadk board

 .../bindings/arm/samsung/samsung-boards.yaml  |    6 +
 .../devicetree/bindings/mfd/syscon.yaml       |    1 +
 .../bindings/pinctrl/samsung-pinctrl.txt      |    1 +
 arch/arm64/boot/dts/exynos/Makefile           |    3 +-
 .../boot/dts/exynos/exynosautov9-pinctrl.dtsi | 1189 +++++++++++++++++
 .../boot/dts/exynos/exynosautov9-sadk.dts     |   56 +
 arch/arm64/boot/dts/exynos/exynosautov9.dtsi  |  301 +++++
 .../pinctrl/samsung/pinctrl-exynos-arm64.c    |  108 ++
 drivers/pinctrl/samsung/pinctrl-samsung.c     |    2 +
 drivers/pinctrl/samsung/pinctrl-samsung.h     |    1 +
 10 files changed, 1667 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm64/boot/dts/exynos/exynosautov9-pinctrl.dtsi
 create mode 100644 arch/arm64/boot/dts/exynos/exynosautov9-sadk.dts
 create mode 100644 arch/arm64/boot/dts/exynos/exynosautov9.dtsi

-- 
2.33.0

