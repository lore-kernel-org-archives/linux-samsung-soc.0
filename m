Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 338A8C433FE
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 23 May 2022 12:12:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235294AbiEWMMT (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 23 May 2022 08:12:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43362 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235373AbiEWMMS (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 23 May 2022 08:12:18 -0400
Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3FEC229CA8
        for <linux-samsung-soc@vger.kernel.org>; Mon, 23 May 2022 05:12:16 -0700 (PDT)
Received: from epcas2p3.samsung.com (unknown [182.195.41.55])
        by mailout2.samsung.com (KnoxPortal) with ESMTP id 20220523121213epoutp0263baec046e28a0d5694b42ad2eb00383~xus5EhyG31100811008epoutp02V
        for <linux-samsung-soc@vger.kernel.org>; Mon, 23 May 2022 12:12:13 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20220523121213epoutp0263baec046e28a0d5694b42ad2eb00383~xus5EhyG31100811008epoutp02V
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1653307933;
        bh=a3X5upy0G/6XSx5f8C2kRlnOVx5CnyfMHG/0jKuJr1U=;
        h=From:To:Cc:Subject:Date:References:From;
        b=dR24zZMKzVznYT36S3nHtkIEMs4USogUpndEDaTwTI1fTp5/zff0P8LOEIMQjZIyA
         1L4FoeeGw1Kp3khdhg03ecpkDmLKbmoJx2CfvrQOSo3rldH7YPriFHJRYjXhZNyiGu
         tVx+WOBxS2juidyU5spILpdYPdUJ67rVOcGm0AOk=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
        epcas2p2.samsung.com (KnoxPortal) with ESMTP id
        20220523121212epcas2p247f374e1873402793a1543058cf063f7~xus4x7vSI0928709287epcas2p2v;
        Mon, 23 May 2022 12:12:12 +0000 (GMT)
Received: from epsmges2p4.samsung.com (unknown [182.195.36.99]) by
        epsnrtp4.localdomain (Postfix) with ESMTP id 4L6GRG4bqYz4x9Pw; Mon, 23 May
        2022 12:12:10 +0000 (GMT)
Received: from epcas2p1.samsung.com ( [182.195.41.53]) by
        epsmges2p4.samsung.com (Symantec Messaging Gateway) with SMTP id
        32.16.09694.A1A7B826; Mon, 23 May 2022 21:12:10 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
        epcas2p1.samsung.com (KnoxPortal) with ESMTPA id
        20220523121210epcas2p11d0b4f27edd5a403b2fd7d3833d577ff~xus2RPLfj2307023070epcas2p1T;
        Mon, 23 May 2022 12:12:10 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
        epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20220523121210epsmtrp28a471db664af6a22242722f604ac2f53~xus2Qj3iS2440224402epsmtrp2s;
        Mon, 23 May 2022 12:12:10 +0000 (GMT)
X-AuditID: b6c32a48-495ff700000025de-96-628b7a1a6cb4
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
        epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
        51.6A.08924.A1A7B826; Mon, 23 May 2022 21:12:10 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.9.51]) by
        epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20220523121210epsmtip2f555080bae029e34d150c666b2782635~xus2E29u41575615756epsmtip2X;
        Mon, 23 May 2022 12:12:10 +0000 (GMT)
From:   Chanho Park <chanho61.park@samsung.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Alim Akhtar <alim.akhtar@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Sam Protsenko <semen.protsenko@linaro.org>,
        linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Chanho Park <chanho61.park@samsung.com>
Subject: [PATCH v3 0/2] syscon reboot/reboot_mode support for exynosautov9
Date:   Mon, 23 May 2022 21:12:42 +0900
Message-Id: <20220523121244.67341-1-chanho61.park@samsung.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrPKsWRmVeSWpSXmKPExsWy7bCmqa5UVXeSQUenosWDedvYLC7v17a4
        /uU5q8X8I+dYLfpePGS2mHF+H5NF694j7BbP+/YxOXB4bFrVyeZx59oeNo++LasYPT5vkgtg
        icq2yUhNTEktUkjNS85PycxLt1XyDo53jjc1MzDUNbS0MFdSyEvMTbVVcvEJ0HXLzAG6Qkmh
        LDGnFCgUkFhcrKRvZ1OUX1qSqpCRX1xiq5RakJJTYF6gV5yYW1yal66Xl1piZWhgYGQKVJiQ
        nbFy70u2giNsFXdeLWdqYDzI2sXIySEhYCLRMWELUxcjF4eQwA5Gie+HHjFCOJ8YJQ7+e8kO
        4XxmlLgxZzE7TMvGB5ehErsYJfYueMcK4XxklFgxex0zSBWbgK7EluevGEFsEYF4ifNvGllA
        ipgFXjJKnLj0AMjh4BAW8JL49V4apIZFQFXiz/1/TCA2r4CdxNaFnxkhtslLbJjfywwRF5Q4
        OfMJC4jNDBRv3jqbGWSmhMAldom7LROhPnKRuDh7LjOELSzx6vgWqLOlJD6/28sGYRdLLJ31
        iQmiuYFR4vK2X1AJY4lZz9oZQY5jFtCUWL9LH8SUEFCWOHILai+fRMfhv+wQYV6JjjYhiEZ1
        iQPbp7NA2LIS3XM+Q13jITHr0QGwC4QEYiUWfulgncAoPwvJN7OQfDMLYe8CRuZVjGKpBcW5
        6anFRgUm8FhNzs/dxAhOiVoeOxhnv/2gd4iRiYPxEKMEB7OSCO/2xI4kId6UxMqq1KL8+KLS
        nNTiQ4ymwPCdyCwlmpwPTMp5JfGGJpYGJmZmhuZGpgbmSuK8XikbEoUE0hNLUrNTUwtSi2D6
        mDg4pRqY5J2vTBKR7Yh8IjStZt8s1dppfNpTD9/t8Q71btxgc+hpWW9yi9ku392MqVfUe7L/
        3kra/nC5arrxnZI7681dHS3f3387f5nLnpola/aE1sac7psja3dw0Q/B1o87zBXLk5QOHbh0
        5qVVgWtvdqQ11zNhqYWpzVFW4jxr7HY7qt0/cLLbqfUWl/EOmQu36jMnXBS9XJ8/b8PfdXM3
        em0qfSXbzbqsqOjr22oDtr3yPDzbbFu+qF5TDO5WZfglGiae8ugg52KnNW8D0/gtNW2URRaH
        ymtlbQ/9vmFtqfrFWvOVvFnlXp5mL1NbOPaoLv7S4nW7nenDS5uXRnMfmt2TXLnN9IFswYW9
        33vDJB8osRRnJBpqMRcVJwIA4G7FfhIEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrHLMWRmVeSWpSXmKPExsWy7bCSvK5UVXeSwZWvvBYP5m1js7i8X9vi
        +pfnrBbzj5xjteh78ZDZYsb5fUwWrXuPsFs879vH5MDhsWlVJ5vHnWt72Dz6tqxi9Pi8SS6A
        JYrLJiU1J7MstUjfLoErY+Xel2wFR9gq7rxaztTAeJC1i5GTQ0LARGLjg8vsXYxcHEICOxgl
        Liz4xQKRkJV49m4HO4QtLHG/5QgrRNF7Ron/mx8zgSTYBHQltjx/xQhiiwjESyw994MFpIhZ
        4C2jxL8HM4ESHBzCAl4Sv95Lg9SwCKhK/Ln/D6yXV8BOYuvCz4wQC+QlNszvZYaIC0qcnPkE
        7AhmoHjz1tnMExj5ZiFJzUKSWsDItIpRMrWgODc9t9iwwCgvtVyvODG3uDQvXS85P3cTIzhI
        tbR2MO5Z9UHvECMTB+MhRgkOZiUR3u2JHUlCvCmJlVWpRfnxRaU5qcWHGKU5WJTEeS90nYwX
        EkhPLEnNTk0tSC2CyTJxcEo1MHXn9ZxcrTrz3NW5JtpOVoLOOyUWCq+c/K76Ts/+0yxOn1l+
        F2/V4nsa7lmzfUeK9Qa9wzsuTFD9GrHK8hTn+/XFfx/WXlJ2D626q2b/afmvzJCfX+cvDg5z
        EPOdGfiwZ9/rf28q0kzY5wsJaUeJ5jho1fJulHsky3xo+TudtmUZjv/MPpif+81UXHl9Waj5
        8a7Xl/Pl+3N5rj29KHj08tXs1Vv9pGdte+MW/pezr/15wBrmF8kPTvyJWvZ0WaHO+cXKc2oW
        Ge1m2nLf4lnwzrVfG3iEgzYGK8S+7VZ3CdeYXMOhGaQptpN9gav9mtQ5N1uEPyQseuK06EMN
        r77kw241W6GMO5//3xSyyDnFz6nEUpyRaKjFXFScCAC5AimnwQIAAA==
X-CMS-MailID: 20220523121210epcas2p11d0b4f27edd5a403b2fd7d3833d577ff
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20220523121210epcas2p11d0b4f27edd5a403b2fd7d3833d577ff
References: <CGME20220523121210epcas2p11d0b4f27edd5a403b2fd7d3833d577ff@epcas2p1.samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

This adds to support syscon reboot and reboot_mode for Exynos Auto v9 SoC.

Changes from v2:
- Change license of samsung,boot-mode.h to (GPL-2.0-only OR BSD-2-Clause)
- Add copyright of samsung,boot-mode.h
- Change ifdef guard __DT_BINDINGS_SAMSUNG_BOOT_MODE_H
- Remove brackets of the definitions

Changes from v1:
- Add samsung,boot-mode.h header which include reboot mode definitions
- syscon-reboot-mode -> reboot-mode

Chanho Park (2):
  dt-bindings: soc: add samsung,boot-mode definitions
  arm64: dts: exynoautov9: add syscon reboot/reboot_mode support

 arch/arm64/boot/dts/exynos/exynosautov9.dtsi | 17 +++++++++++++++++
 include/dt-bindings/soc/samsung,boot-mode.h  | 18 ++++++++++++++++++
 2 files changed, 35 insertions(+)
 create mode 100644 include/dt-bindings/soc/samsung,boot-mode.h

-- 
2.36.1

