Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB936C63777
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 20 Nov 2020 08:57:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 769542225B
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 20 Nov 2020 08:57:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="Hh+05ypP"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727160AbgKTI5E (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 20 Nov 2020 03:57:04 -0500
Received: from mailout2.w1.samsung.com ([210.118.77.12]:44084 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727188AbgKTI5D (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 20 Nov 2020 03:57:03 -0500
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20201120085651euoutp0255d8ed8834958b5541f508c5737df774~JK4mJlYqY2707427074euoutp02j
        for <linux-samsung-soc@vger.kernel.org>; Fri, 20 Nov 2020 08:56:51 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20201120085651euoutp0255d8ed8834958b5541f508c5737df774~JK4mJlYqY2707427074euoutp02j
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1605862611;
        bh=h5UXQY4qdsdhi3mAVzUaa+m1BPhdLaUubrYWCg7tzFs=;
        h=From:To:Cc:Subject:Date:References:From;
        b=Hh+05ypP4xl5Y8JeDkuVzzsahzD3CE0QA4/hWngySJ52/IokRSq0Fk0szuRzprvd3
         VVeOAhEZ2c2sZ/VtvVZV+SRgkphGBl8ouC+vjFDn/gy7mPxAGQZyA+U8JJcr4ZNGHg
         0sxFyBmAcsdSR2OLFVSoBRyifSnhb9Os2he/xr6s=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20201120085651eucas1p2b614494d168369b50ef9afa5762683eb~JK4l8FE9z2574625746eucas1p2T;
        Fri, 20 Nov 2020 08:56:51 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges2new.samsung.com (EUCPMTA) with SMTP id 45.AA.44805.3D487BF5; Fri, 20
        Nov 2020 08:56:51 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20201120085651eucas1p1382e2677b29af0fc94a0b6c1f8d7da12~JK4lmbYRw3018230182eucas1p1Y;
        Fri, 20 Nov 2020 08:56:51 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20201120085651eusmtrp2da5e8c8b1df9445978a643527b7dcbef~JK4llIWln2124121241eusmtrp2T;
        Fri, 20 Nov 2020 08:56:51 +0000 (GMT)
X-AuditID: cbfec7f4-b37ff7000000af05-58-5fb784d3ce77
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id 8F.2E.21957.3D487BF5; Fri, 20
        Nov 2020 08:56:51 +0000 (GMT)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20201120085650eusmtip134c462302f077eebe685462a990bc467~JK4lEzLA60452604526eusmtip1C;
        Fri, 20 Nov 2020 08:56:50 +0000 (GMT)
From:   Marek Szyprowski <m.szyprowski@samsung.com>
To:     linux-samsung-soc@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Willy Wolff <willy.mh.wolff.ml@gmail.com>,
        Marian Mihailescu <mihailescu2m@gmail.com>
Subject: [PATCH 0/2] Fix USB2 PHY operation on Exynos542x
Date:   Fri, 20 Nov 2020 09:56:35 +0100
Message-Id: <20201120085637.7299-1-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrIIsWRmVeSWpSXmKPExsWy7djP87qXW7bHG5z7JmexccZ6VosLT3vY
        LM6f38BucXnXHDaLGef3MVmsPXKX3WL9tJ+sFofftLNa7Lxzgtni24lHjA5cHjtn3WX32LSq
        k82jb8sqRo/jN7YzeXzeJBfAGsVlk5Kak1mWWqRvl8CVcXxbD1tBE1fFzxOb2BsYv7F3MXJy
        SAiYSOz4vYuti5GLQ0hgBaPEnCObmSCcL4wS7cfaGCGcz4wSXxdPYe5i5ABr+fVNHCK+nFFi
        19ledriOk7s/sYLMZRMwlOh628UGYosIqEp8blsAto9Z4D+TxM0NnCC2sIClxNbOA0wgNgtQ
        zZlzG8BqeAVsJCbueM4EcZ+8xOoNB5hBFkgITOWQmPF/KgtEwkVi0t8vzBC2sMSr41ugHpKR
        +L9zPhNEQzOjxMNza9khnB5GictNMxghqqwl7pz7xQbyD7OApsT6XfoQYUeJg18fs0O8ySdx
        460gxNF8EpO2TYf6nleio00IolpNYtbxdXBrD164BHWOh8TvV5fB4SAkECvR33aGZQKj3CyE
        XQsYGVcxiqeWFuempxYb5aWW6xUn5haX5qXrJefnbmIEporT/45/2cG4/NVHvUOMTByMhxgl
        OJiVRHjXam6NF+JNSaysSi3Kjy8qzUktPsQozcGiJM6btGVNvJBAemJJanZqakFqEUyWiYNT
        qoFp25S2FHXJwBThRSxuT+ZPeGDslNt18Irg4bqIAoNba87EvVrSo5ksIPpYJvWjxvQ5SYpK
        Tm/93Y/zF50pVfHecLphjUTYGtYNaz5GWjjbHzQ4xL8/4HuPo+hnsZwm1h+2zGsLZjPoXZ7F
        U+HrNuvz7xzpl4eedFawNXC8XCHzPVShc1pkhef0qKSrTb8zt95T1RCx/i+R/eMenwbLaed/
        Nze0sOtedHmZZuF/L3iF5uKIr+7rLy53ae35KnZTaHb1tBXnpJdwzZ5m1dbp9yjLysT07S6z
        IzL1DLFO39T23U+TN2iP5Feqfyw0beUi+TXXN03kuhDLJ3r2q/yrOn2T+9f+XPjMyuDbM/f/
        rGAlluKMREMt5qLiRABHST0YhAMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrGLMWRmVeSWpSXmKPExsVy+t/xu7qXW7bHG3Qc4LLYOGM9q8WFpz1s
        FufPb2C3uLxrDpvFjPP7mCzWHrnLbrF+2k9Wi8Nv2lktdt45wWzx7cQjRgcuj52z7rJ7bFrV
        yebRt2UVo8fxG9uZPD5vkgtgjdKzKcovLUlVyMgvLrFVija0MNIztLTQMzKx1DM0No+1MjJV
        0rezSUnNySxLLdK3S9DLOL6th62giavi54lN7A2M39i7GDk4JARMJH59E+9i5OIQEljKKPFp
        cgNTFyMnUFxG4uS0BlYIW1jiz7UuNoiiT4wSV28fYAdJsAkYSnS9BUlwcogIqEp8blsAFmcW
        aGWW+NNlBWILC1hKbO08ADaUBajmzLkNYDW8AjYSE3c8h1omL7F6wwHmCYw8CxgZVjGKpJYW
        56bnFhvqFSfmFpfmpesl5+duYgQG6LZjPzfvYJz36qPeIUYmDsZDjBIczEoivGs1t8YL8aYk
        VlalFuXHF5XmpBYfYjQF2jeRWUo0OR8YI3kl8YZmBqaGJmaWBqaWZsZK4rxb566JFxJITyxJ
        zU5NLUgtgulj4uCUamDqODqzyqg2YccBiyezZYss8ubVmEV/nfapkpP55pspfokl6Y4f3Uss
        I4w55p34N7H79fuuf/KrDbae2qIk1DLtZnwa64GTBycsmpYhqXGJqXFry+5J9l16b9IM7oTU
        3a4udmxxF510YPeEpECfHzohSf2fD8/P+bjiT+/rn6zugr/OW+w9HFEjrhrVpdYl8751xYqW
        bH35Bbmvlj3dmXL+ktKPqyXJNs7hjUV7rm7f//Of4rnjBo5vZD+0KPCvCcy0NHogHftrgzbP
        LcmPq3bwTv37+cu7F0Uz72bu7V69vjZTfdf54g/r3b64fNr212ZjckzgJyYzVru8PUll5rNr
        zmR3nkt7E3Bhx/Ip26Y2KbEUZyQaajEXFScCACZQ+HzZAgAA
X-CMS-MailID: 20201120085651eucas1p1382e2677b29af0fc94a0b6c1f8d7da12
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20201120085651eucas1p1382e2677b29af0fc94a0b6c1f8d7da12
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20201120085651eucas1p1382e2677b29af0fc94a0b6c1f8d7da12
References: <CGME20201120085651eucas1p1382e2677b29af0fc94a0b6c1f8d7da12@eucas1p1.samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Dear All,

This patchset finally fixes the last remaining issue related to the
system suspend/resume on Odroid XU3/XU4/HC1 board family. It can be
observed that system suspend/resume fails on XU4/HC1 when kernel is
compiled from multi_v7_defconfig. Chaning the configuration a bit -
switching Exynos USB2 PHY driver to be built-in surprisingly fixed that
issue. An investigation revealed that the Exynos USB2 PHY driver poked
wrong registers in the PMU area on Exynos5420 SoCs breaking the USB3.0
DRD PHY operation, what caused the suspend failure. Fix this by learning
the Exynos USB2 PHY driver about the Exynos5420 variant.

Best regards,
Marek Szyprowski


Patch summary:

Marek Szyprowski (2):
  phy: samsung: add support for the Exynos5420 variant of the USB2 PHY
  ARM: dts: exynos: use Exynos5420 dedicated USB2 PHY compatible

 .../devicetree/bindings/phy/samsung-phy.txt   |  1 +
 arch/arm/boot/dts/exynos54xx.dtsi             |  6 +--
 drivers/phy/samsung/Kconfig                   |  7 ++-
 drivers/phy/samsung/phy-exynos5250-usb2.c     | 48 +++++++++++++------
 drivers/phy/samsung/phy-samsung-usb2.c        |  6 +++
 drivers/phy/samsung/phy-samsung-usb2.h        |  1 +
 6 files changed, 51 insertions(+), 18 deletions(-)

-- 
2.17.1

