Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E891BC43217
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 23 May 2022 11:39:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235001AbiEWLj5 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 23 May 2022 07:39:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51150 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234990AbiEWLjK (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 23 May 2022 07:39:10 -0400
Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A57065045F
        for <linux-samsung-soc@vger.kernel.org>; Mon, 23 May 2022 04:39:06 -0700 (PDT)
Received: from epcas2p3.samsung.com (unknown [182.195.41.55])
        by mailout3.samsung.com (KnoxPortal) with ESMTP id 20220523113904epoutp0311d7c8374de32a64468091005e4dbe1b~xuP9CuC4i2706927069epoutp03S
        for <linux-samsung-soc@vger.kernel.org>; Mon, 23 May 2022 11:39:04 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20220523113904epoutp0311d7c8374de32a64468091005e4dbe1b~xuP9CuC4i2706927069epoutp03S
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1653305944;
        bh=eQ47bUorVseyx5i7N/Wh2bBVkNPEPJ6ZdjxWU7QFSgI=;
        h=From:To:Cc:Subject:Date:References:From;
        b=vVzW/pXUuLms2zSyRAdcraWSSji4vsJly9VKPVXCQEiA69SApy6Dog0zYQ2FmKF3t
         2epe2EkEYtN9ehiuVJrmb1jCAT00QudhR4t9ukju+a0tBqU7HLD8zP/mXeN6YV/Dwt
         FHbayuLvsWhl/gBR1wCiCi36Tqzhp4CpUOZ6ZbMo=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
        epcas2p4.samsung.com (KnoxPortal) with ESMTP id
        20220523113904epcas2p4d251e5c31babc5a48f9eb1608346cab6~xuP8cJz5M1573315733epcas2p4t;
        Mon, 23 May 2022 11:39:04 +0000 (GMT)
Received: from epsmges2p4.samsung.com (unknown [182.195.36.90]) by
        epsnrtp4.localdomain (Postfix) with ESMTP id 4L6Fj12KTsz4x9Pq; Mon, 23 May
        2022 11:39:01 +0000 (GMT)
Received: from epcas2p3.samsung.com ( [182.195.41.55]) by
        epsmges2p4.samsung.com (Symantec Messaging Gateway) with SMTP id
        0A.CD.09694.5527B826; Mon, 23 May 2022 20:39:01 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
        epcas2p1.samsung.com (KnoxPortal) with ESMTPA id
        20220523113900epcas2p1479e12a846dc27cfc7c0835e5dc0179a~xuP5js_XE3009230092epcas2p1F;
        Mon, 23 May 2022 11:39:00 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
        epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20220523113900epsmtrp2dd614c961fa10af25d308beeb0f6157b~xuP5i8nU50448504485epsmtrp2B;
        Mon, 23 May 2022 11:39:00 +0000 (GMT)
X-AuditID: b6c32a48-495ff700000025de-01-628b725511bc
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
        epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
        1D.F8.08924.4527B826; Mon, 23 May 2022 20:39:00 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.9.51]) by
        epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20220523113900epsmtip133b0c7f270e22f337f58253231fcdd9e~xuP5WnSoe1792717927epsmtip1j;
        Mon, 23 May 2022 11:39:00 +0000 (GMT)
From:   Chanho Park <chanho61.park@samsung.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Alim Akhtar <alim.akhtar@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Sam Protsenko <semen.protsenko@linaro.org>,
        linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Chanho Park <chanho61.park@samsung.com>
Subject: [PATCH v2 0/3] support watchdog for exynosautov9
Date:   Mon, 23 May 2022 20:39:16 +0900
Message-Id: <20220523113919.59571-1-chanho61.park@samsung.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrNKsWRmVeSWpSXmKPExsWy7bCmuW5oUXeSwbJ+XosH87axWVzer21x
        /ctzVov5R86xWvS9eMhsMeP8PiaL1r1H2C2e9+1jcuDw2LSqk83jzrU9bB59W1YxenzeJBfA
        EpVtk5GamJJapJCal5yfkpmXbqvkHRzvHG9qZmCoa2hpYa6kkJeYm2qr5OIToOuWmQN0hZJC
        WWJOKVAoILG4WEnfzqYov7QkVSEjv7jEVim1ICWnwLxArzgxt7g0L10vL7XEytDAwMgUqDAh
        O+Nt13PmgvNsFT++ijYwLmXtYuTkkBAwkdjfNJe5i5GLQ0hgB6PEhIbPLCAJIYFPjBKfbiVC
        JD4zSnR+2ABUxQHWsXWOE0TNLkaJI+cMIGo+Mkp8O9jPCJJgE9CV2PL8FZgtIhAvcf5NIwtI
        EbPAS0aJE5cegG0QFrCU6Pt3F6yIRUBVYsf+/cwgNq+AncSrzx+gzpOX2DC/FyouKHFy5hOw
        XmagePPW2WBnSwicY5do6b7FCnGdi8SXzliIXmGJV8e3sEPYUhKf3+1lg7CLJZbO+sQE0dvA
        KHF52y+ohLHErGftjCBzmAU0Jdbv0ocYqSxx5BbUWj6JjsN/2SHCvBIdbUIQjeoSB7ZPZ4Gw
        ZSW653yGut5DYvebG9DwjJV4cWg92wRG+VlInpmF5JlZCHsXMDKvYhRLLSjOTU8tNiowgcdo
        cn7uJkZwKtTy2ME4++0HvUOMTByMhxglOJiVRHi3J3YkCfGmJFZWpRblxxeV5qQWH2I0BQbv
        RGYp0eR8YDLOK4k3NLE0MDEzMzQ3MjUwVxLn9UrZkCgkkJ5YkpqdmlqQWgTTx8TBKdXAVFkq
        5PUk+bRq2+fSq7dvVStWnpRo+bsjpbDuXZH53vTWOrVT/ie8lytUHWFVC428xydre+SK0/wH
        L6Za1h79OO+6ukT49L8FNp9O1Fm9bHqnapwbImSyftHxB8t23lr5djXPDydJx5XLKzPv7X27
        x2zC91vWFv/uvKms1G6Y/1NHZOKbVyuy+49/vftA8u2te/JOgW8fvU/9J/5GWzFW/P5nF9ln
        LrfcxC5XscUtm1Cm+/9Tx697x4wOzgr+uL3Igtdv0cZXsyfwdG+JNYmMslWUS2RMOzuBddvJ
        oz+iAlQnpu+4G/Rrec1zxSl7DbMZv/8Sklfk/lj/OcLw3krRIplJMyadsi4TuJXJqv3y31Ml
        luKMREMt5qLiRACx1YOJDgQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrLLMWRmVeSWpSXmKPExsWy7bCSnG5IUXeSwe3LphYP5m1js7i8X9vi
        +pfnrBbzj5xjteh78ZDZYsb5fUwWrXuPsFs879vH5MDhsWlVJ5vHnWt72Dz6tqxi9Pi8SS6A
        JYrLJiU1J7MstUjfLoEr423Xc+aC82wVP76KNjAuZe1i5OCQEDCR2DrHqYuRi0NIYAejxIy/
        v5i6GDmB4rISz97tYIewhSXutxxhhSh6zyhxb2UnG0iCTUBXYsvzV4wgtohAvMTScz9YQIqY
        Bd4ySvx7MBMsISxgKdH37y6YzSKgKrFj/35mEJtXwE7i1ecPrBAb5CU2zO+FigtKnJz5hAXE
        ZgaKN2+dzTyBkW8WktQsJKkFjEyrGCVTC4pz03OLDQuM8lLL9YoTc4tL89L1kvNzNzGCQ1RL
        awfjnlUf9A4xMnEwHmKU4GBWEuHdntiRJMSbklhZlVqUH19UmpNafIhRmoNFSZz3QtfJeCGB
        9MSS1OzU1ILUIpgsEwenVAMT33k59jglk46XnNJba8UmF8+1MNu4YnaBk5rJ3h/Rx9Y/4DfR
        swrdGJOa+IWzRjkp9qZu7InjPII58U6zZ57NL1kT3/zv07nNf17GV4ikRk6qKXg503eJ6YZd
        71bKLlXvSktwfLCyQfn/mWD/iAO3gltmGlv2r3grEnxri8hcoyk+1jE/9bfmK8cvcZ/4J6lH
        /k0e8/I8ga6XD8773m83LzqytUtK0zvojcGRDfnvb9w5Iu5/atb8TO48j1yJZas/Hvzw6lDY
        5F1Rvx3tHgTazN27IN/coGKu21uLUIskcX2ZsNCKHxOOJKV670sVWHzmXX5zFXfhpBkMWZNv
        Pnu9TJqTpfGqydEHnn0a/D+UWIozEg21mIuKEwH4hYZ8wAIAAA==
X-CMS-MailID: 20220523113900epcas2p1479e12a846dc27cfc7c0835e5dc0179a
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20220523113900epcas2p1479e12a846dc27cfc7c0835e5dc0179a
References: <CGME20220523113900epcas2p1479e12a846dc27cfc7c0835e5dc0179a@epcas2p1.samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

This adds to support watchdog and its device tree nodes for Exynos Auto
v9 SoC. Like exynos850, the SoC has two cpu watchdog devices but they
have different CPU configurations compared with exynos850. So, we need
to add separate configurations for Exynos Auto v9 SoC.

Changes from v1:
- Add Krzysztof's RB tags for #1, #2 patch.
- Drop "status" property of exynosautov9.dtsi and drop #4 patch.

Chanho Park (3):
  dt-bindings: watchdog: add exynosautov9 compatible
  watchdog: s3c2410_wdt: support exynosautov9 watchdog
  arm64: dts: exynosautov9: add watchdog DT nodes

 .../bindings/watchdog/samsung-wdt.yaml        |  3 ++
 arch/arm64/boot/dts/exynos/exynosautov9.dtsi  | 20 +++++++++
 drivers/watchdog/s3c2410_wdt.c                | 41 +++++++++++++++++--
 3 files changed, 60 insertions(+), 4 deletions(-)

-- 
2.36.1

