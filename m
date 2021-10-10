Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0DD5C433FE
	for <linux-samsung-soc@archiver.kernel.org>; Sun, 10 Oct 2021 03:25:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 88E7C606A5
	for <linux-samsung-soc@archiver.kernel.org>; Sun, 10 Oct 2021 03:25:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229744AbhJJD1F (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sat, 9 Oct 2021 23:27:05 -0400
Received: from mailout4.samsung.com ([203.254.224.34]:25912 "EHLO
        mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229907AbhJJD1E (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 9 Oct 2021 23:27:04 -0400
Received: from epcas2p2.samsung.com (unknown [182.195.41.54])
        by mailout4.samsung.com (KnoxPortal) with ESMTP id 20211010032504epoutp044c0cdd71e2bc5ce5b655b787ef8f2c2c~sjXaBh7Mv2083020830epoutp04J
        for <linux-samsung-soc@vger.kernel.org>; Sun, 10 Oct 2021 03:25:04 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20211010032504epoutp044c0cdd71e2bc5ce5b655b787ef8f2c2c~sjXaBh7Mv2083020830epoutp04J
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1633836304;
        bh=tziF0CK8TiQ9F3q2VKz+sIDVdiEtQ166g3MSWA2B3pM=;
        h=From:To:Cc:Subject:Date:References:From;
        b=P9kj7REesoh+3jLeJpd9qElthevH7YAnbZw3mgxhj/adp10WTNmD49s6ogLRv7RgZ
         F1EpfPwjeB0aCO9K1dR1SMFt87bMbWY9a6ORNEFUXH0n3Iv4VXkfA2JXoTjNNq0Rv8
         3NLI2boburjWQe4n1FraKcr+TLZDD2ebOdynFBqc=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
        epcas2p2.samsung.com (KnoxPortal) with ESMTP id
        20211010032503epcas2p288087266642ae5ffef1837e685dc83d1~sjXYo6-ob2883828838epcas2p2m;
        Sun, 10 Oct 2021 03:25:03 +0000 (GMT)
Received: from epsmges2p3.samsung.com (unknown [182.195.36.90]) by
        epsnrtp3.localdomain (Postfix) with ESMTP id 4HRnNn70SXz4x9Q2; Sun, 10 Oct
        2021 03:24:57 +0000 (GMT)
Received: from epcas2p2.samsung.com ( [182.195.41.54]) by
        epsmges2p3.samsung.com (Symantec Messaging Gateway) with SMTP id
        F7.D8.09749.90D52616; Sun, 10 Oct 2021 12:24:57 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
        epcas2p2.samsung.com (KnoxPortal) with ESMTPA id
        20211010032456epcas2p25241e07ab3ce673bcbb428f1c7c5a787~sjXSQQqsP1853818538epcas2p2U;
        Sun, 10 Oct 2021 03:24:56 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
        epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20211010032456epsmtrp1127b6c6e116f8353d230192c3947912a~sjXSPhlW-3229632296epsmtrp1Q;
        Sun, 10 Oct 2021 03:24:56 +0000 (GMT)
X-AuditID: b6c32a47-d29ff70000002615-6f-61625d092f47
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
        epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
        A6.85.08750.80D52616; Sun, 10 Oct 2021 12:24:56 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.9.51]) by
        epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20211010032456epsmtip2f19ac2aa64b6b595f0ec0435072172de~sjXSE--eQ1129911299epsmtip2x;
        Sun, 10 Oct 2021 03:24:56 +0000 (GMT)
From:   Chanho Park <chanho61.park@samsung.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Tomasz Figa <tomasz.figa@gmail.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Chanho Park <chanho61.park@samsung.com>
Subject: [PATCH v3 0/3] add initial support for exynosautov9
Date:   Sun, 10 Oct 2021 12:22:43 +0900
Message-Id: <20211010032246.146939-1-chanho61.park@samsung.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupgk+LIzCtJLcpLzFFi42LZdljTTJczNinRoO+UpcXl/doW84+cY7XY
        +PYHk8WUP8uZLGac38dk0br3CLvF4TftrBardv1hdODwmNXQy+axc9Zddo9NqzrZPO5c28Pm
        0bdlFaPH501yAWxR2TYZqYkpqUUKqXnJ+SmZeem2St7B8c7xpmYGhrqGlhbmSgp5ibmptkou
        PgG6bpk5QPcoKZQl5pQChQISi4uV9O1sivJLS1IVMvKLS2yVUgtScgrMC/SKE3OLS/PS9fJS
        S6wMDQyMTIEKE7Izrr0RL9jIXdF34Ah7A+NWzi5GTg4JAROJ6a3PWboYuTiEBHYwSkxdco4N
        wvnEKNH+ej2U85lR4sOd88wwLffubWOCSOwCSkydzQaSEBL4yCixeVENiM0moCux5fkrRpAi
        EYFORomV30A6ODmYBQ4wSmy5YAdiCwvYSOy/uBJsKouAqsSj32dZQWxeAXuJ3fM6WSG2yUsc
        +dXJDBEXlDg58wkLxBx5ieats5lBFkgI3GOXOPPqESNEg4vElXer2SFsYYlXx7dA2VISL/vb
        2CEauhklWh/9h0qsZpTobPSBsO0lfk3fArSZA2iDpsT6XfogpoSAssSRW1B7+SQ6Dv9lhwjz
        SnS0CUE0qksc2D6dBcKWleie8xnqfA+J1Vs72SHhEyvR+PI18wRG+VlIvpmF5JtZCHsXMDKv
        YhRLLSjOTU8tNiowhkdqcn7uJkZwktRy38E44+0HvUOMTByMhxglOJiVRHi1TBIThXhTEiur
        Uovy44tKc1KLDzGaAsN3IrOUaHI+ME3nlcQbmlgamJiZGZobmRqYK4nzzv3nlCgkkJ5Ykpqd
        mlqQWgTTx8TBKdXAFLiv8E3+mZdJTAslfvNt7W1tFrdP75BVeTxz/4Yb0+dzn03Ov6Nv9J+r
        KnZuh430lo9Wx/lvhRf0J8R83P1HgKn62qRE9qvB7wVtleWupn/Lr8iZen2Rl+S+9AveizTT
        5tVPZJFZKjrtwguRgDWXpB4e6l/mxKL+STnG2NdS4WhXxAymrKjus5EuLxTWtMR9c9jzWOnM
        mmrhCeZH+h9br5HUl6y6wmPFoSX0zrnSStlkSrdQkuffSXPze1aYNr+dv0Bq2++elTxPWm/1
        P424NtNnxX975oiAu2cUC1dODIwu3eIbYL8klcfzZVD8rhs2psY+bnyShww/Pqr3yJ4pvYh7
        0sPaq0Lx2qs/ndurxFKckWioxVxUnAgA13QkmxsEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrBLMWRmVeSWpSXmKPExsWy7bCSvC5HbFKiwZ4ORYvL+7Ut5h85x2qx
        8e0PJospf5YzWcw4v4/JonXvEXaLw2/aWS1W7frD6MDhMauhl81j56y77B6bVnWyedy5tofN
        o2/LKkaPz5vkAtiiuGxSUnMyy1KL9O0SuDKuvREv2Mhd0XfgCHsD41bOLkZODgkBE4l797Yx
        dTFycQgJ7GCU2NHxlxEiISvx7N0OdghbWOJ+yxFWEFtI4D2jxOqFiSA2m4CuxJbnrxhBmkUE
        uhkl+ht7wSYxCxxhlPj//RcLSJWwgI3E/osrmUFsFgFViUe/z4JN4hWwl9g9r5MVYoO8xJFf
        ncwQcUGJkzOfgPUyA8Wbt85mnsDINwtJahaS1AJGplWMkqkFxbnpucWGBUZ5qeV6xYm5xaV5
        6XrJ+bmbGMGBq6W1g3HPqg96hxiZOBgPMUpwMCuJ8GqZJCYK8aYkVlalFuXHF5XmpBYfYpTm
        YFES573QdTJeSCA9sSQ1OzW1ILUIJsvEwSnVwLT44HvB38qHL5j+mRmzZc+C/L1bj77eZF6s
        nlt47lPssSUcsembskzMbk5I1P55KF0s3vzpIeltwuv2K/la8ZTmqRzTdLE6ofteLcPdM7ks
        woRpQkz+Nzv/Y2suVSl8693CsmQi3zo5sztJ6x848RlXJlx+PLWi9OdCnWvP5py5VnvHv1J3
        tlX0Cy8R9w0Xj+34f+cT24kzB34dZ/x7Mye7S+Rjh0y3cxDzoTc5gafDFnJ3T5/LGxOvst/1
        7OOUcFGuVuFHGwqXiLP2J4ivm/V6qmf9Wg1bOYa/a1IKwr64vsqwltr0+kIUi/k2vurnq4xb
        2bbu4NHb9n3esv+RT0Ls7RleyE99vX3hxm/WlQlKLMUZiYZazEXFiQB4gBy8ywIAAA==
X-CMS-MailID: 20211010032456epcas2p25241e07ab3ce673bcbb428f1c7c5a787
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20211010032456epcas2p25241e07ab3ce673bcbb428f1c7c5a787
References: <CGME20211010032456epcas2p25241e07ab3ce673bcbb428f1c7c5a787@epcas2p2.samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

This patchset supports minimal set for ExynosAuto v9 SoC and SADK board.
This contains serial_0 as uart console and ufs_0 for rootfs storage.
Regarding UFS, it depends on UFS patchset[1].

[1]: https://lore.kernel.org/linux-samsung-soc/20211007080934.108804-1-chanho61.park@samsung.com/T/#t

Changes since v2:
- pinctrl patch has been merged. So, remove it from v3 patchset.
- Separate mfd/syscon.yaml dt-binding patch
- Use "-pins" suffix for all pinctrl node name but do not follow this for labels.

Changes since v1:
- add static and  __initconst of patch1
- Use pin and pins suffix for pinctrl nodes
- Remove non-SoC pins
- Move fixed rate clock nodes out of soc@0
- Add cortex-a76 compatibles to cpu and pmu node.
- Use lowercase of address representations
- Add pmu / syscon compatible.

 .../bindings/arm/samsung/samsung-boards.yaml  |    6 +
 .../devicetree/bindings/mfd/syscon.yaml       |    1 +
 arch/arm64/boot/dts/exynos/Makefile           |    3 +-
 .../boot/dts/exynos/exynosautov9-pinctrl.dtsi | 1189 +++++++++++++++++
 .../boot/dts/exynos/exynosautov9-sadk.dts     |   56 +
 arch/arm64/boot/dts/exynos/exynosautov9.dtsi  |  301 +++++
 6 files changed, 1555 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm64/boot/dts/exynos/exynosautov9-pinctrl.dtsi
 create mode 100644 arch/arm64/boot/dts/exynos/exynosautov9-sadk.dts
 create mode 100644 arch/arm64/boot/dts/exynos/exynosautov9.dtsi

-- 
2.33.0

