Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D45F3CCA47C
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  7 Jun 2022 07:03:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237437AbiFGHDg (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 7 Jun 2022 03:03:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237419AbiFGHDa (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 7 Jun 2022 03:03:30 -0400
Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 909CE13CE2
        for <linux-samsung-soc@vger.kernel.org>; Tue,  7 Jun 2022 00:03:28 -0700 (PDT)
Received: from epcas2p4.samsung.com (unknown [182.195.41.56])
        by mailout2.samsung.com (KnoxPortal) with ESMTP id 20220607070327epoutp02721ca159e61b57ec3b3fbac490980c30~2RKlNt8ia1913219132epoutp02I
        for <linux-samsung-soc@vger.kernel.org>; Tue,  7 Jun 2022 07:03:27 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20220607070327epoutp02721ca159e61b57ec3b3fbac490980c30~2RKlNt8ia1913219132epoutp02I
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1654585407;
        bh=5rpiUaQeAYCextOKHrTop9yX/vS9K2+DTyk3muheYEE=;
        h=From:To:Cc:Subject:Date:References:From;
        b=MilRdfMwi2CPU4N74QKCCXoFTqA/YQRhNZ9KbeFY81J4zXE5XcBO8t90xJZIiXTsd
         DdsdbMbvR0cPCpFT+iMKeA8YlpEWc0LrnwwJ8xlgH+DpVdiBrtvINS2YVG7VvyamYV
         gyGJgXKYFOKkfEftVXTl4lv/KowcMTV5Er8GfTag=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
        epcas2p4.samsung.com (KnoxPortal) with ESMTP id
        20220607070326epcas2p47d88ac1cdd6ccedda0720bd070caa868~2RKkr0Aof0526605266epcas2p4b;
        Tue,  7 Jun 2022 07:03:26 +0000 (GMT)
Received: from epsmges2p1.samsung.com (unknown [182.195.36.97]) by
        epsnrtp2.localdomain (Postfix) with ESMTP id 4LHLt51ykvz4x9QB; Tue,  7 Jun
        2022 07:03:25 +0000 (GMT)
Received: from epcas2p4.samsung.com ( [182.195.41.56]) by
        epsmges2p1.samsung.com (Symantec Messaging Gateway) with SMTP id
        A9.9E.10069.C38FE926; Tue,  7 Jun 2022 16:03:24 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
        epcas2p3.samsung.com (KnoxPortal) with ESMTPA id
        20220607070324epcas2p388a932021107d9fff9dc133df0e2b389~2RKigtdbp0924609246epcas2p34;
        Tue,  7 Jun 2022 07:03:24 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
        epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20220607070324epsmtrp241a540b4d343c87d0b6d80c53ed5af4a~2RKif-2p60739507395epsmtrp2d;
        Tue,  7 Jun 2022 07:03:24 +0000 (GMT)
X-AuditID: b6c32a45-a79ff70000002755-bf-629ef83c9154
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
        epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
        DA.70.08924.C38FE926; Tue,  7 Jun 2022 16:03:24 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.9.51]) by
        epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20220607070323epsmtip21ce2245096fedfe551ef6315f7affe4b~2RKiSyA2u1349313493epsmtip2I;
        Tue,  7 Jun 2022 07:03:23 +0000 (GMT)
From:   Chanho Park <chanho61.park@samsung.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Alim Akhtar <alim.akhtar@samsung.com>,
        linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Chanho Park <chanho61.park@samsung.com>
Subject: [PATCH RESEND v3 0/2] support secondary ufs for Exynos Auto v9 SoC
Date:   Tue,  7 Jun 2022 16:02:49 +0900
Message-Id: <20220607070251.15795-1-chanho61.park@samsung.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmpmk+LIzCtJLcpLzFFi42LZdljTQtfmx7wkg4cPJSwezNvGZnF5v7bF
        /CPnWC36Xjxkttj7eiu7xabH11gtZpzfx2TRuvcIuwOHx6ZVnWwed67tYfPYvKTeo2/LKkaP
        z5vkAlijsm0yUhNTUosUUvOS81My89JtlbyD453jTc0MDHUNLS3MlRTyEnNTbZVcfAJ03TJz
        gC5RUihLzCkFCgUkFhcr6dvZFOWXlqQqZOQXl9gqpRak5BSYF+gVJ+YWl+al6+WlllgZGhgY
        mQIVJmRnfL7xgrngC0vFmmWv2RsYO1m6GDk5JARMJJbO+MrWxcjFISSwg1GiYc0dZgjnE6PE
        0rsPoJzPjBKnFz9ihGnZfKGbHSKxi1Hi3qHzUM5HRokZLduZQKrYBHQltjx/xQiSEBGYzihx
        5uFXMIdZYC+jxNPWL2DrhQW8JV6cgTiFRUBVYuGc88wgNq+AncSTu+uh9slLbJjfCxUXlDg5
        8wlYPTNQvHnrbLADJQTOsUusvvAd6A8OIMdF4vUrb4heYYlXx7ewQ9hSEp/f7WWDsIslls76
        xATR28AocXnbL6iEscSsZ+2MIHOYBTQl1u/ShxipLHHkFtRaPomOw3/ZIcK8Eh1tQhCN6hIH
        tk+HBqqsRPecz6wQJR4SZ2dngISFBGIlttxuZZnAKD8LyS+zkPwyC2HtAkbmVYxiqQXFuemp
        xUYFhvBYTc7P3cQITo1arjsYJ7/9oHeIkYmD8RCjBAezkgiv/+S5SUK8KYmVValF+fFFpTmp
        xYcYTYGhO5FZSjQ5H5ic80riDU0sDUzMzAzNjUwNzJXEeb1SNiQKCaQnlqRmp6YWpBbB9DFx
        cEo1MEVJPEwzu7Cwvqir5vG7r8tFkh856J77cPDVS0GTr3r5G61e2a2fc6aNf4JwVukOWZVd
        7p994lOe89r912RPP3ul6kBnwjQm2asbvN7KX11eV+c0p0J/0ZQQRg/mw7OVXS3DGbUSzMIt
        zn75xbDictpdCbnsiHaxgqjojEMFO22arvDuYN6d8GSX7DfBG4tePOA+m2jwQOzZQY370gLR
        /zZnyqk764aocKmd9Xsze+7Nn2fWhqddML+S9bRk+QvP8oVyLO1x83wWt22scs87YfJ6VarA
        1+erzmjvujMn/WVj2d5YgUzRsqaX787PlLVYM3W1+RKN8J5Uo9trc623r7mzh+uC2cLpuw4X
        B4ro2iqxFGckGmoxFxUnAgC66PwyFgQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrELMWRmVeSWpSXmKPExsWy7bCSvK7Nj3lJBievMVs8mLeNzeLyfm2L
        +UfOsVr0vXjIbLH39VZ2i02Pr7FazDi/j8mide8RdgcOj02rOtk87lzbw+axeUm9R9+WVYwe
        nzfJBbBGcdmkpOZklqUW6dslcGV8vvGCueALS8WaZa/ZGxg7WboYOTkkBEwkNl/oZu9i5OIQ
        EtjBKDFn0wUmiISsxLN3O9ghbGGJ+y1HWCGK3jNK/Fh3gRUkwSagK7Hl+StGEFtEYDqjxNSl
        XiA2s8B+IPt+OIgtLOAt8eIMxDYWAVWJhXPOM4PYvAJ2Ek/urmeEWCAvsWF+L1RcUOLkzCcs
        EHPkJZq3zmaewMg3C0lqFpLUAkamVYySqQXFuem5xYYFRnmp5XrFibnFpXnpesn5uZsYwcGq
        pbWDcc+qD3qHGJk4GA8xSnAwK4nw+k+emyTEm5JYWZValB9fVJqTWnyIUZqDRUmc90LXyXgh
        gfTEktTs1NSC1CKYLBMHp1QDU8LfpL2Zs/fs25nM+2dLY62nQMCu/wUOS6K1WZdZ5zzxPlOa
        IHf9hxFzzi6DpRHuJXH6sydFc6q9MCq5xRK6o/LsxAn/vn74+pzng2DA/TyBAo0pTNurXsxq
        zs5WOLJlT9DfrV6fJftFJePfLQjq+1tzavuEUsU5+xyMHZhKpFNDM3Zd2XeQ6X+sWE+92DdL
        1hmXGLdpMdZ/fJy+pfyavffT5oTl551uLxQ+tKdiy+799bL1bzWX3p2nWKSQ+M5IXsZPt+9Z
        fHUym1xuvmCUoPnMllVFuU077n9lenx7+evJqYn3mJ3buFsFo1Wz+/uXmd6YflNmXQ+nz2+2
        lGz+F4uUc4o+O1k8OHRna/hRJZbijERDLeai4kQAt8MWocUCAAA=
X-CMS-MailID: 20220607070324epcas2p388a932021107d9fff9dc133df0e2b389
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20220607070324epcas2p388a932021107d9fff9dc133df0e2b389
References: <CGME20220607070324epcas2p388a932021107d9fff9dc133df0e2b389@epcas2p3.samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

This is for resending DTS patches of the v2 patchset[1] on top of
next/dt64 branch.

[1] https://lore.kernel.org/linux-samsung-soc/20220602053250.62593-1-chanho61.park@samsung.com/

Changes from v2:
- Rebase on top of next/dt64 branch after addressing conflicts due to
  watchdog patches.

Chanho Park (2):
  arm64: dts: exynosautov9: add secondary ufs devices
  arm64: dts: exynosautov9-sadk: enable secondary ufs devices

 .../boot/dts/exynos/exynosautov9-sadk.dts     | 18 +++++++++++
 arch/arm64/boot/dts/exynos/exynosautov9.dtsi  | 32 +++++++++++++++++++
 2 files changed, 50 insertions(+)

-- 
2.36.1

