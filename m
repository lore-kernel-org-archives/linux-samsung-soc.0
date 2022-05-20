Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72FCFC4332F
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 20 May 2022 11:52:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348700AbiETLw2 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 20 May 2022 07:52:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34612 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348758AbiETLw0 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 20 May 2022 07:52:26 -0400
Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AFE8F286FE
        for <linux-samsung-soc@vger.kernel.org>; Fri, 20 May 2022 04:52:24 -0700 (PDT)
Received: from epcas2p2.samsung.com (unknown [182.195.41.54])
        by mailout1.samsung.com (KnoxPortal) with ESMTP id 20220520115222epoutp01a4a0eefa609259f2b4c86a65e6d33e8b~wzftoeJqK2353123531epoutp01Y
        for <linux-samsung-soc@vger.kernel.org>; Fri, 20 May 2022 11:52:22 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20220520115222epoutp01a4a0eefa609259f2b4c86a65e6d33e8b~wzftoeJqK2353123531epoutp01Y
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1653047542;
        bh=xOf2Xowtoc2Hoon+h90C9d9Y25iQ2TVx4FyMiF7bDbg=;
        h=From:To:Cc:Subject:Date:References:From;
        b=par5W75DwJjZ8acPifA9Bu8Hmt3y5Z9Ne5oV9h91LZbqrpUjF6Lb1qEKKJHxWzBAO
         tkNlZGPtCv92BqgQMDU950OgTx7gzSyed44vE/mjAg9glTvZvpJWk6L0vmxbJx7Pvn
         aWrnQxpVypTdQ/HNMkV0uKTJ1oJnEFag+HlOmbeo=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
        epcas2p1.samsung.com (KnoxPortal) with ESMTP id
        20220520115222epcas2p1e995c4eac824c85bf38f932fce9c2895~wzfs49Q-m0197601976epcas2p1n;
        Fri, 20 May 2022 11:52:22 +0000 (GMT)
Received: from epsmges2p2.samsung.com (unknown [182.195.36.100]) by
        epsnrtp2.localdomain (Postfix) with ESMTP id 4L4Q7j6yv3z4x9Pt; Fri, 20 May
        2022 11:52:17 +0000 (GMT)
Received: from epcas2p3.samsung.com ( [182.195.41.55]) by
        epsmges2p2.samsung.com (Symantec Messaging Gateway) with SMTP id
        DF.0F.09764.1F087826; Fri, 20 May 2022 20:52:17 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
        epcas2p2.samsung.com (KnoxPortal) with ESMTPA id
        20220520115216epcas2p26c1e257460970bfecabd621bc733a85d~wzfn-gO7U2543525435epcas2p26;
        Fri, 20 May 2022 11:52:16 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
        epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20220520115216epsmtrp15e9c5f085cba73214e09d6e450f0c740~wzfn_xHwj1943319433epsmtrp1j;
        Fri, 20 May 2022 11:52:16 +0000 (GMT)
X-AuditID: b6c32a46-f75ff70000002624-1d-628780f1b8d5
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
        epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
        7D.19.08924.0F087826; Fri, 20 May 2022 20:52:16 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.9.51]) by
        epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20220520115216epsmtip2d3fd4e5103a69e883056ab05925ca7e1~wzfnwqHcc1018710187epsmtip21;
        Fri, 20 May 2022 11:52:16 +0000 (GMT)
From:   Chanho Park <chanho61.park@samsung.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Alim Akhtar <alim.akhtar@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Sam Protsenko <semen.protsenko@linaro.org>,
        linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Chanho Park <chanho61.park@samsung.com>
Subject: [PATCH v2 0/2] syscon reboot/reboot_mode support for exynosautov9
Date:   Fri, 20 May 2022 20:52:48 +0900
Message-Id: <20220520115250.57785-1-chanho61.park@samsung.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrPKsWRmVeSWpSXmKPExsWy7bCmue7HhvYkg7ULLC0ezNvGZnF5v7bF
        9S/PWS3mHznHatH34iGzxYzz+5gsWvceYbd43rePyYHDY9OqTjaPO9f2sHn0bVnF6PF5k1wA
        S1S2TUZqYkpqkUJqXnJ+SmZeuq2Sd3C8c7ypmYGhrqGlhbmSQl5ibqqtkotPgK5bZg7QFUoK
        ZYk5pUChgMTiYiV9O5ui/NKSVIWM/OISW6XUgpScAvMCveLE3OLSvHS9vNQSK0MDAyNToMKE
        7Iz2yb+YC26yVHz5f5WtgfEncxcjJ4eEgInE77fL2LsYuTiEBHYwShz9s58ZwvnEKDHnwSVG
        kCohgc+MEm8+WMB0NJ48A1W0i1Hi/qzVrBDOR0aJmVv6wTrYBHQltjx/BWaLCMRLnH/TyAJS
        xCzwklHixKUHLCAJYQEviftPv7GB2CwCqhJ/Zt5mB7F5BewkTm/8xQ6xTl5iw/xeZoi4oMTJ
        mU/AepmB4s1bZ4OdISFwil1i+pFmFogGF4nHBzezQtjCEq+Ob4EaJCXxsr8Nyi6WWDrrExNE
        cwOjxOVtv9ggEsYSs561A53NAbRBU2L9Ln0QU0JAWeLILai9fBIdh/+yQ4R5JTrahCAa1SUO
        bJ8OdYGsRPecz1AXeEg0P1oJDcVYifl/O9gnMMrPQvLNLCTfzELYu4CReRWjWGpBcW56arFR
        gRE8VpPzczcxglOiltsOxilvP+gdYmTiYDzEKMHBrCTCy5jbkiTEm5JYWZValB9fVJqTWnyI
        0RQYvhOZpUST84FJOa8k3tDE0sDEzMzQ3MjUwFxJnNcrZUOikEB6YklqdmpqQWoRTB8TB6dU
        A5Md7+NVtrEqrb+zVfzW/fT72iyscXSyjvOmp0dnti+sSYrf/M3KffvdBEPHU1fyZcJKPmWm
        1eUESF3qcb497XXRAe42/uhElks5qYWn72m7bl5z7jPrxAkfPr8Vy+hL8358qGbH78LIzZeN
        ZG/Irq71VLNdY6fP6nH4zqqOsoo5xXfP7XULiX9x3min0qmgN4ZnvI/zFrBtrZQwmtHc/VQ6
        tvxbU0unzuX8yXNvHI826rZ0ZZ4VXMTUuZpj/fcLprn8kV4J7/N4NrUymspz3t0XbdCm8sT0
        CJuI6JR9C63/VG/+nvw1XaPV0iNc5eOVi+/9F0x5fOlF4u0lH4pnLcn5nNy0f/vSh6deiR6e
        fUuJpTgj0VCLuag4EQDGWpaXEgQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrPLMWRmVeSWpSXmKPExsWy7bCSvO6HhvYkg00T9CwezNvGZnF5v7bF
        9S/PWS3mHznHatH34iGzxYzz+5gsWvceYbd43rePyYHDY9OqTjaPO9f2sHn0bVnF6PF5k1wA
        SxSXTUpqTmZZapG+XQJXRvvkX8wFN1kqvvy/ytbA+JO5i5GTQ0LARKLx5Bkgm4tDSGAHo8Tu
        J//ZIBKyEs/e7WCHsIUl7rccYYUoes8oseTnG0aQBJuArsSW56/AbBGBeIml536wgBQxC7xl
        lPj3YCZYQljAS+L+029gU1kEVCX+zLwNNpVXwE7i9MZfUBvkJTbM72WGiAtKnJz5hAXEZgaK
        N2+dzTyBkW8WktQsJKkFjEyrGCVTC4pz03OLDQuM8lLL9YoTc4tL89L1kvNzNzGCw1RLawfj
        nlUf9A4xMnEwHmKU4GBWEuFlzG1JEuJNSaysSi3Kjy8qzUktPsQozcGiJM57oetkvJBAemJJ
        anZqakFqEUyWiYNTqoFp1+0Km5LYeXoFx0Ut+qo9J+w+2nvPkYEjtS0mYKnGAl/n66Zr78/K
        yb90KL1lyexJh3Ne7JqqcOTIjj3f490+2Kw6xN/acd4wYv/HoBW5FXY2Wo9C7n5M3um+N+uz
        gvWvf2VVCRaSl1qvaJsY1f074F3xkf/LpiWnJnov/RVVlSC719Xq9aWUKH2jOR/iatZvfKWT
        na+okzZbZLZNzbPOqemB3AnLvO1uWaxqW3WrdnbL6ur5lqePuS3r2rpRbJNDYJkMk3fRKxv7
        57fTAxu/zdj4jceJsVq0hptTke971upJk25a1G7P81LraC+bWjvxVdqSr4IPChg4Fr0udl9o
        fm3rT1+ddp2qXQF+CieVWIozEg21mIuKEwHCro6QwgIAAA==
X-CMS-MailID: 20220520115216epcas2p26c1e257460970bfecabd621bc733a85d
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20220520115216epcas2p26c1e257460970bfecabd621bc733a85d
References: <CGME20220520115216epcas2p26c1e257460970bfecabd621bc733a85d@epcas2p2.samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

This adds to support syscon reboot and reboot_mode for Exynos Auto v9 SoC.

Changes from v1:
- Add samsung,boot-mode.h header which include reboot mode definitions
- syscon-reboot-mode -> reboot-mode

Chanho Park (2):
  dt-bindings: soc: add samsung,boot-mode definitions
  arm64: dts: exynoautov9: add syscon reboot/reboot_mode support

 arch/arm64/boot/dts/exynos/exynosautov9.dtsi | 17 +++++++++++++++++
 include/dt-bindings/soc/samsung,boot-mode.h  | 12 ++++++++++++
 2 files changed, 29 insertions(+)
 create mode 100644 include/dt-bindings/soc/samsung,boot-mode.h

-- 
2.36.1

