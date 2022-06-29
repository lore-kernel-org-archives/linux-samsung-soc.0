Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B5E5C43334
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 29 Jun 2022 01:59:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229903AbiF2B7S (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 28 Jun 2022 21:59:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229511AbiF2B7S (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 28 Jun 2022 21:59:18 -0400
Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC74D1E3E7
        for <linux-samsung-soc@vger.kernel.org>; Tue, 28 Jun 2022 18:59:16 -0700 (PDT)
Received: from epcas2p3.samsung.com (unknown [182.195.41.55])
        by mailout3.samsung.com (KnoxPortal) with ESMTP id 20220629015915epoutp036d0ba2a9d86b8a249c5ad4b60a631379~89NQrcY8G0655706557epoutp032
        for <linux-samsung-soc@vger.kernel.org>; Wed, 29 Jun 2022 01:59:15 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20220629015915epoutp036d0ba2a9d86b8a249c5ad4b60a631379~89NQrcY8G0655706557epoutp032
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1656467955;
        bh=KVhbm0vttu95++MMph6Q+Udh2opKQIoPwYk/7uEz2nE=;
        h=From:To:Cc:Subject:Date:References:From;
        b=OLXsncDw6Kf6HJuzCEN/kxl7XSkCecuzMEL6gD9J1zRLNWaR4/9iTp+WxMyNAM1Iw
         pu2U7EfHqMpzrMK6hy6MkaL3kJpQpPa9TKVhvDnmnh/2OZbGV1icDUglPrS7JT0w4N
         xmNzRL2ue78H/E2UtH543pwwmeYa1IwdSmMcGK5Y=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
        epcas2p4.samsung.com (KnoxPortal) with ESMTP id
        20220629015914epcas2p42fb19ba3a0a2c29195e2f49690c5410f~89NP6O9cF1518115181epcas2p4k;
        Wed, 29 Jun 2022 01:59:14 +0000 (GMT)
Received: from epsmges2p4.samsung.com (unknown [182.195.36.70]) by
        epsnrtp3.localdomain (Postfix) with ESMTP id 4LXl4x47cnz4x9QJ; Wed, 29 Jun
        2022 01:59:13 +0000 (GMT)
Received: from epcas2p4.samsung.com ( [182.195.41.56]) by
        epsmges2p4.samsung.com (Symantec Messaging Gateway) with SMTP id
        9C.35.09662.1F1BBB26; Wed, 29 Jun 2022 10:59:13 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
        epcas2p3.samsung.com (KnoxPortal) with ESMTPA id
        20220629015913epcas2p3e5cafc2ae9415ca0568afdf1b3ca842b~89NOwbzrs0748407484epcas2p3F;
        Wed, 29 Jun 2022 01:59:13 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
        epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20220629015912epsmtrp1f1a3c6c9f5fc146be2f8cf51e1df0c73~89NOvqCq72671226712epsmtrp1Z;
        Wed, 29 Jun 2022 01:59:12 +0000 (GMT)
X-AuditID: b6c32a48-9f7ff700000025be-87-62bbb1f1a99c
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
        epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
        46.C5.08802.0F1BBB26; Wed, 29 Jun 2022 10:59:12 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.9.51]) by
        epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20220629015912epsmtip1cd68e4a11e50fafbd0d362307a7a4c0d~89NOdBSLc1231912319epsmtip1T;
        Wed, 29 Jun 2022 01:59:12 +0000 (GMT)
From:   Chanho Park <chanho61.park@samsung.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Alim Akhtar <alim.akhtar@samsung.com>,
        Sam Protsenko <semen.protsenko@linaro.org>,
        Jaewon Kim <jaewon02.kim@samsung.com>,
        devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Chanho Park <chanho61.park@samsung.com>
Subject: [PATCH 0/3] support USI for Exynos Auto v9 SoC
Date:   Wed, 29 Jun 2022 10:56:47 +0900
Message-Id: <20220629015650.138527-1-chanho61.park@samsung.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupkk+LIzCtJLcpLzFFi42LZdljTQvfjxt1JBievKVg8mLeNzeLyfm2L
        +UfOsVrsaDjCatH34iGzxabH11gtZpzfx2TRuvcIu8Xzvn1MDpwem1Z1snncubaHzWPzknqP
        vi2rGD0+b5ILYI3KtslITUxJLVJIzUvOT8nMS7dV8g6Od443NTMw1DW0tDBXUshLzE21VXLx
        CdB1y8wBOkdJoSwxpxQoFJBYXKykb2dTlF9akqqQkV9cYquUWpCSU2BeoFecmFtcmpeul5da
        YmVoYGBkClSYkJ0x/clp1oLZHBVbtk5laWB8z9bFyMkhIWAiMbfrEUsXIxeHkMAORokr298x
        QTifGCU23ZzKBuF8ZpSY1HEbruXtxPOMEIldjBIbXt2H6v8IVLUZZBgnB5uArsSW568YQWwR
        gXiJ5xfegxUxC0xikjjf0cwMkhAWMJf4tXspWBGLgKrE9O737CA2r4C9xPvDvxkh1slLbJjf
        ywwRF5Q4OfMJ2AJmoHjz1tnMIEMlBG6xS9z5vBWqwUWiv2cFO4QtLPHq+BYoW0riZX8blF0s
        sXTWJyaI5gZGicvbfkE9Zywx61k70CAOoA2aEut36YOYEgLKEkduQe3lk+g4/JcdIswr0dEm
        BNGoLnFg+3QWCFtWonvOZ1YI20Pi37mDYLaQQKzEwafT2Ccwys9C8s0sJN/MQti7gJF5FaNY
        akFxbnpqsVGBCTxak/NzNzGC06SWxw7G2W8/6B1iZOJgPMQowcGsJMK78MzOJCHelMTKqtSi
        /Pii0pzU4kOMpsDwncgsJZqcD0zUeSXxhiaWBiZmZobmRqYG5krivF4pGxKFBNITS1KzU1ML
        Uotg+pg4OKUamLLfPL4b6KCRfGB+S+n+G+pf3jFmMYu+3Vmn6x53JHLiga2a8Sl597ZoLpur
        /n9joc60Dt8ibV1LP9P7i5/8WJS+arOI5WLRsLeadgpr5z9VaE5qETxq8mThYROevz8Zl246
        PeHD9JgXq2T1kov3nJ5/lrn/g9eai4/XFCd1yU5t6bggp9ft833mHbOWuTbLflya/2Ry68UX
        N5QtZKsb1yoJ3ZIQj0wJ9lb23bxJ6/2W+p7V/nEreucFspyd2bXqymuuSY/Dt5juOex1jHHb
        XOFit7vt08/fsp3aliVjKGrZsX9Kk5vZrORLF2JqNxiIl7HkRh9cdWlCRUVUZtSN9Xx33l1M
        WvSiubAtkpura5ISS3FGoqEWc1FxIgBHsV0sHAQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrBLMWRmVeSWpSXmKPExsWy7bCSnO6HjbuTDLa3GFs8mLeNzeLyfm2L
        +UfOsVrsaDjCatH34iGzxabH11gtZpzfx2TRuvcIu8Xzvn1MDpwem1Z1snncubaHzWPzknqP
        vi2rGD0+b5ILYI3isklJzcksSy3St0vgypj+5DRrwWyOii1bp7I0ML5n62Lk5JAQMJF4O/E8
        YxcjF4eQwA5GideLzjFBJGQlnr3bwQ5hC0vcbznCClH0nlHi/ZJHYEVsAroSW56/YgSxRQTi
        JTZ/WcgCUsQsMI1JouPxDLBuYQFziV+7l4IVsQioSkzvfg8W5xWwl3h/+DcjxAZ5iQ3ze5kh
        4oISJ2c+YQGxmYHizVtnM09g5JuFJDULSWoBI9MqRsnUguLc9NxiwwKjvNRyveLE3OLSvHS9
        5PzcTYzgwNXS2sG4Z9UHvUOMTByMhxglOJiVRHgXntmZJMSbklhZlVqUH19UmpNafIhRmoNF
        SZz3QtfJeCGB9MSS1OzU1ILUIpgsEwenVAOTdsO6PsfEj0FHKhYvO7/apbD0UIR3gb/+H1nt
        /xFq/bnRHIcb02tXCU2Ym+hz4fvn6945hst47d4EP3vc/s3LXl394iLp+37y/+qza7cyfMvn
        kGHRTnreVr1GYqVCPO++86qLTimknuB/2LwtdUNo1MH4tZXty73232P+unhq4Jo/xrmpVxW4
        qmc99zHcENnO9O7jDS4B/oTOWvkPRbVuhaeP5EyzfNt2wdmq3FiF125H3Btvyyl7Nx5UyRer
        ehta6snwdrv/g2NxmSddW/YX5l0JDuFd4mP26t8y9fmeDlv01a6Kq1/d/db41YYvWgWnBTbW
        bJuk7v+kJ9RcYqPS9M2X9zZ6+0S4SmhoTlJiKc5INNRiLipOBAAFKVT9ywIAAA==
X-CMS-MailID: 20220629015913epcas2p3e5cafc2ae9415ca0568afdf1b3ca842b
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20220629015913epcas2p3e5cafc2ae9415ca0568afdf1b3ca842b
References: <CGME20220629015913epcas2p3e5cafc2ae9415ca0568afdf1b3ca842b@epcas2p3.samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Add to support USI(Universal Serial Interface) for Exynos Auto v9 SoC.
This patchset is built on top of below patchset.
- spi patchset:
https://lore.kernel.org/linux-samsung-soc/20220628044222.152794-1-chanho61.park@samsung.com/
- serial patch to expand serial devices to 12:
https://lore.kernel.org/linux-samsung-soc/20220629005538.60132-1-chanho61.park@samsung.com/

The SoC supports up to 12 USIs so they can be configured as below
- 12 x UARTs(4pins)
- 12 x SPIs(4pins)
- 24 x I2C
- 12 x UARTS(2pin) and 12 x I2C

Chanho Park (3):
  arm64: dts: exynosautov9: add pdma0 device tree node
  arm64: dts: exynosautov9: add exynosautov9-usi.dtsi
  arm64: dts: exynosautov9: include exynosautov9-usi.dtsi

 .../boot/dts/exynos/exynosautov9-sadk.dts     |    2 +
 .../boot/dts/exynos/exynosautov9-usi.dtsi     | 1127 +++++++++++++++++
 arch/arm64/boot/dts/exynos/exynosautov9.dtsi  |   39 +-
 3 files changed, 1140 insertions(+), 28 deletions(-)
 create mode 100644 arch/arm64/boot/dts/exynos/exynosautov9-usi.dtsi

-- 
2.36.1

