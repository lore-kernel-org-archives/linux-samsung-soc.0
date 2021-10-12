Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA773C43219
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 12 Oct 2021 00:25:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B2EF9604DC
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 12 Oct 2021 00:25:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232602AbhJLA15 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 11 Oct 2021 20:27:57 -0400
Received: from mailout4.samsung.com ([203.254.224.34]:47633 "EHLO
        mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234084AbhJLA1z (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 11 Oct 2021 20:27:55 -0400
Received: from epcas2p1.samsung.com (unknown [182.195.41.53])
        by mailout4.samsung.com (KnoxPortal) with ESMTP id 20211012002553epoutp04eae133e166b69a1c6e5088cb18089ade~tINhT88N11714017140epoutp04O
        for <linux-samsung-soc@vger.kernel.org>; Tue, 12 Oct 2021 00:25:53 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20211012002553epoutp04eae133e166b69a1c6e5088cb18089ade~tINhT88N11714017140epoutp04O
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1633998353;
        bh=MIicerWLPzGdyxdgUQE93xtyJsmHnzp39CPlO1XJNXE=;
        h=From:To:Cc:Subject:Date:References:From;
        b=CweV384O+aUM5TujIkQARy7eahaOQl5rruZsvn4I1xdrPvWdbe4Zt49I6rJkk2BCl
         xlpPpCd4G33lynF4/ZHnslHRByxvhqaDDEfhlWhsqcYDHZJMoe2EBmxRHq3oiYqEl4
         7MTPGcK4335DpkJuyrf4f08vKoubDVv4mgleO800=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
        epcas2p3.samsung.com (KnoxPortal) with ESMTP id
        20211012002552epcas2p348fe68c6864050a19ba2bc6b18542a66~tINg6Wlj00637906379epcas2p3V;
        Tue, 12 Oct 2021 00:25:52 +0000 (GMT)
Received: from epsmges2p1.samsung.com (unknown [182.195.36.91]) by
        epsnrtp2.localdomain (Postfix) with ESMTP id 4HSxK14sVCz4x9QH; Tue, 12 Oct
        2021 00:25:41 +0000 (GMT)
Received: from epcas2p3.samsung.com ( [182.195.41.55]) by
        epsmges2p1.samsung.com (Symantec Messaging Gateway) with SMTP id
        8E.68.09717.DF5D4616; Tue, 12 Oct 2021 09:25:34 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
        epcas2p1.samsung.com (KnoxPortal) with ESMTPA id
        20211012002533epcas2p11a4fd237c519be0ed30d15f9839691f0~tINPD9Bpo1956319563epcas2p1C;
        Tue, 12 Oct 2021 00:25:33 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
        epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20211012002533epsmtrp1b2fec1fe6873afd2e659f272e296ee0f~tINPC2jbf2356023560epsmtrp1O;
        Tue, 12 Oct 2021 00:25:33 +0000 (GMT)
X-AuditID: b6c32a45-4abff700000025f5-08-6164d5fd5515
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
        epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
        7A.97.09091.DF5D4616; Tue, 12 Oct 2021 09:25:33 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.9.51]) by
        epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20211012002533epsmtip273e3bae163d21144816c85a964796ac3~tINO5Rowy1904819048epsmtip2R;
        Tue, 12 Oct 2021 00:25:33 +0000 (GMT)
From:   Chanho Park <chanho61.park@samsung.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Tomasz Figa <tomasz.figa@gmail.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Chanho Park <chanho61.park@samsung.com>
Subject: [PATCH v4 0/3] add initial support for exynosautov9
Date:   Tue, 12 Oct 2021 09:23:11 +0900
Message-Id: <20211012002314.38965-1-chanho61.park@samsung.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupkk+LIzCtJLcpLzFFi42LZdljTXPff1ZREgyn3mCwu79e2mH/kHKvF
        xrc/mCym/FnOZDHj/D4mi9a9R9gtDr9pZ7VYtesPowOHx6yGXjaPnbPusntsWtXJ5nHn2h42
        j74tqxg9Pm+SC2CLyrbJSE1MSS1SSM1Lzk/JzEu3VfIOjneONzUzMNQ1tLQwV1LIS8xNtVVy
        8QnQdcvMAbpHSaEsMacUKBSQWFyspG9nU5RfWpKqkJFfXGKrlFqQklNgXqBXnJhbXJqXrpeX
        WmJlaGBgZApUmJCdcXbROsaCuXwV8y89Z2lgvMvdxcjJISFgIvHn+RfmLkYuDiGBHYwSHbdv
        s0A4nxglTj2bDJX5xiixaWojC0zLy6YVbBCJvYwSW+9/YYJwPjJK7L5wiBGkik1AV2LL81eM
        IAkRgU5GiZXftjGBJJgFDjBKbLlgB2ILC9hIbGi5yw5iswioSryd/x2ohoODV8BOYtqNDIht
        8hJHfnUyg9i8AoISJ2c+YYEYIy/RvHU22HkSAo/YJVZsvcEO0eAi0XT1EiOELSzx6vgWqLiU
        xMv+NnaIhm5GidZH/6ESqxklOht9IGx7iV/Tt7CCHMEsoCmxfpc+iCkhoCxx5BbUXj6JjsN/
        2SHCvBIdbUIQjeoSB7ZPhwaQrET3nM+sELaHxMyei2DXCAnESqxo3c86gVF+FpJvZiH5ZhbC
        3gWMzKsYxVILinPTU4uNCgzhsZqcn7uJEZwmtVx3ME5++0HvECMTB+MhRgkOZiUR3rccKYlC
        vCmJlVWpRfnxRaU5qcWHGE2BwTuRWUo0OR+YqPNK4g1NLA1MzMwMzY1MDcyVxHnn/nNKFBJI
        TyxJzU5NLUgtgulj4uCUamBqEPjD9tei5asMQ9RewfOWEUnPpxyyWxbgl87CHpX479CH/XZx
        Zvsn8KttyHgaMGXO04VzRKeuC07a1tzvUNPw/06hm3jSndAKXVfGq37db4UMbEMDvwVX3bow
        8YLI2v9Flw44nFQVunLsUTMz5+f/Xiclv7/aazTzKcPzgl19jK5ZLpdkg7ry4h8c3LWj4dra
        d3yanlv8tX7wTP/7P5nrtwlDxj2txG5v91U/C32+XFiZHHtvZxWn17JHPZ8eRwudzlMUnjj7
        ckSx9i2xPdXWopv03F7fjbjr0eSVV3nc8lbiOqf3xTX3rBYzfTwjVmgqJFn2eOsTk6ZdOlqO
        Si561yQnCfBuCZrj3DSPMU2JpTgj0VCLuag4EQDwGVEiHAQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrJLMWRmVeSWpSXmKPExsWy7bCSvO7fqymJBm8+qlpc3q9tMf/IOVaL
        jW9/MFlM+bOcyWLG+X1MFq17j7BbHH7TzmqxatcfRgcOj1kNvWweO2fdZffYtKqTzePOtT1s
        Hn1bVjF6fN4kF8AWxWWTkpqTWZZapG+XwJVxdtE6xoK5fBXzLz1naWC8y93FyMkhIWAi8bJp
        BVsXIxeHkMBuRomrmz8xQiRkJZ6928EOYQtL3G85wgpR9J5RYsKJFWAJNgFdiS3PXzGCJEQE
        uhkl+ht7mUAcZoEjjBL/v/9iAakSFrCR2NByF6yDRUBV4u3870BFHBy8AnYS025kQGyQlzjy
        q5MZxOYVEJQ4OfMJWCszULx562zmCYx8s5CkZiFJLWBkWsUomVpQnJueW2xYYJiXWq5XnJhb
        XJqXrpecn7uJERy6Wpo7GLev+qB3iJGJg/EQowQHs5II71uOlEQh3pTEyqrUovz4otKc1OJD
        jNIcLErivBe6TsYLCaQnlqRmp6YWpBbBZJk4OKUamAKnXeLt7D4UGLj5Lvvb6f+nzQu+2T7n
        kCbPMt+Uh+kcc3f+XtXSzvDaV8ZzJpNX1IaOXRHmF0wmTDZflfz88ZOjM7fbz1f0Yn1iy2cq
        fXXfHbFp27ZvytH7sKqsYMqvh3eez07Wvbf90grLVkPdWa/ebJ19bk+WZaGwQ+jG4G3XqwW/
        ly1lkY6ZVLyh5o3Z75A0u4Ud7+6IPXi/6t+Dy+k69pcTDV6WyfV1LXt1S6z3jsZCK/m2SWu3
        z27boLz/xAq2f1fXzfS5cKfqsNmUrp6bld//zJWc/ESjlSmKVWz1vQThpQ+vRDgVyWZ9euVq
        GryqYYJiqZSm4IMHa5JqI+rmHC6OXSl5WbfMYcHaCakvlViKMxINtZiLihMBX9dwoMwCAAA=
X-CMS-MailID: 20211012002533epcas2p11a4fd237c519be0ed30d15f9839691f0
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20211012002533epcas2p11a4fd237c519be0ed30d15f9839691f0
References: <CGME20211012002533epcas2p11a4fd237c519be0ed30d15f9839691f0@epcas2p1.samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

This patchset supports minimal set for ExynosAuto v9 SoC and SADK board.
This contains serial_0 as uart console and ufs_0 for rootfs storage.
Regarding UFS, it depends on UFS patchset[1].

[1]: https://lore.kernel.org/linux-samsung-soc/20211007080934.108804-1-chanho61.park@samsung.com/T/#t

Changes since v3:
- Correct pinctrl label naming
- Fix dtbs_check warnings / cpu, gic, and uart address
- Correct ufs-core-clock node name

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

Chanho Park (3):
  dt-bindings: mfd: add samsung,exynosautov9-sysreg compatible
  arm64: dts: exynos: add initial support for exynosautov9 SoC
  arm64: dts: exynos: add minimal support for exynosautov9 sadk board

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

