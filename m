Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA0BEC433EF
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 21 Oct 2021 01:23:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D380A6113D
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 21 Oct 2021 01:23:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230103AbhJUBZi (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 20 Oct 2021 21:25:38 -0400
Received: from mailout3.samsung.com ([203.254.224.33]:15888 "EHLO
        mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230494AbhJUBZi (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 20 Oct 2021 21:25:38 -0400
Received: from epcas2p1.samsung.com (unknown [182.195.41.53])
        by mailout3.samsung.com (KnoxPortal) with ESMTP id 20211021012321epoutp03d3e883962b43fc8970f907d9b52b24b8~v5zQsoTWd0934009340epoutp03I
        for <linux-samsung-soc@vger.kernel.org>; Thu, 21 Oct 2021 01:23:21 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20211021012321epoutp03d3e883962b43fc8970f907d9b52b24b8~v5zQsoTWd0934009340epoutp03I
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1634779401;
        bh=IllF3tfNiMWIKQG53gmR7nZ5PTE4F2vVK7lcMy7UxOU=;
        h=From:To:Cc:Subject:Date:References:From;
        b=EYrpraUhcAfZn0yRdwe4EO76hJc6ddRaJ5XmvVYWnSMybRWO2QynRj/4GWlIS+Hmb
         HDPilK/q+rLdtWkPOQrgiiN7sFYTGGqj/SXg0pVMjV/334M7HE4Wv8Q1Nyx+kOinAG
         gcg/j5jstYO4XpCqEdmE0yavECESPGDfVCeDqowc=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
        epcas2p1.samsung.com (KnoxPortal) with ESMTP id
        20211021012320epcas2p199f73f57a3b6e99c7d4d13e9551e4b54~v5zQOKNih2352223522epcas2p1J;
        Thu, 21 Oct 2021 01:23:20 +0000 (GMT)
Received: from epsmges2p3.samsung.com (unknown [182.195.36.99]) by
        epsnrtp1.localdomain (Postfix) with ESMTP id 4HZV9C5fGwz4x9Qr; Thu, 21 Oct
        2021 01:23:11 +0000 (GMT)
Received: from epcas2p4.samsung.com ( [182.195.41.56]) by
        epsmges2p3.samsung.com (Symantec Messaging Gateway) with SMTP id
        10.88.10014.EF0C0716; Thu, 21 Oct 2021 10:23:10 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
        epcas2p2.samsung.com (KnoxPortal) with ESMTPA id
        20211021012310epcas2p2745335616ece50729db4a6368676b450~v5zG360Ir1161311613epcas2p2B;
        Thu, 21 Oct 2021 01:23:10 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
        epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20211021012310epsmtrp1dc91eda6e8e64fba766a0d7713a6415b~v5zGxZNdh1296912969epsmtrp1S;
        Thu, 21 Oct 2021 01:23:10 +0000 (GMT)
X-AuditID: b6c32a47-489ff7000000271e-7f-6170c0fedae8
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
        epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
        31.C9.08902.EF0C0716; Thu, 21 Oct 2021 10:23:10 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.9.51]) by
        epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20211021012310epsmtip278b45eaee3bd07a5b1685dd07820954a~v5zGmoSt12511325113epsmtip2e;
        Thu, 21 Oct 2021 01:23:10 +0000 (GMT)
From:   Chanho Park <chanho61.park@samsung.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     Sam Protsenko <semen.protsenko@linaro.org>,
        linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Chanho Park <chanho61.park@samsung.com>
Subject: [PATCH 0/2] Add exynosautov9 chipid support
Date:   Thu, 21 Oct 2021 10:20:15 +0900
Message-Id: <20211021012017.158919-1-chanho61.park@samsung.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrPKsWRmVeSWpSXmKPExsWy7bCmhe6/AwWJBk3zTS0u79e2mH/kHKvF
        xrc/mCxmnN/HZPG8bx+TA6vHrIZeNo871/awefRtWcXo8XmTXABLVLZNRmpiSmqRQmpecn5K
        Zl66rZJ3cLxzvKmZgaGuoaWFuZJCXmJuqq2Si0+ArltmDtBaJYWyxJxSoFBAYnGxkr6dTVF+
        aUmqQkZ+cYmtUmpBSk6BeYFecWJucWleul5eaomVoYGBkSlQYUJ2xpWpJ5gLPrFUzN35nqWB
        sZOli5GTQ0LAROJ2+2UmEFtIYAejxLH9KV2MXED2J0aJeQd3MEE43xgles+9Q+h4+JURIrGX
        UWLn2g42COcjo8TC55fAZrEJ6Epsef6KEcQWEbCWOLp1PjNIEbPALEaJPf3XwEYJA426tqid
        FcRmEVCVOPVjDVARBwevgL3E//VSENvkJY786mQGsXkFBCVOznwC1soMFG/eOhtspoTALnaJ
        xZ9nsEE0uEhMaD8OZQtLvDq+hR3ClpJ42d/GDtHQzSjR+ug/VGI1o0Rnow+EbS/xa/oWVpAj
        mAU0Jdbv0gcxJQSUJY7cgtrLJ9Fx+C87RJhXoqNNCKJRXeLA9unQAJKV6J7zmRXC9pB4MG8j
        OyR4YyUWtfexTWCUn4Xkm1lIvpmFsHcBI/MqRrHUguLc9NRiowJjeKQm5+duYgSnPC33HYwz
        3n7QO8TIxMF4iFGCg1lJhHd3RX6iEG9KYmVValF+fFFpTmrxIUZTYPBOZJYSTc4HJt28knhD
        E0sDEzMzQ3MjUwNzJXFeS9HsRCGB9MSS1OzU1ILUIpg+Jg5OqQamaRp5P5/rfGm8Ou3UnjCd
        6a51Il1Rl64lFJxWnHo8sWbx8839bOdZNmpPuJn6ZPfWhB33F/jaTbol4ZG3KT8gX3dL48wP
        Ekml7+/VyF5Yzdj8v1Wk643ZxICerOpVt5XkzHjtD550lIyY1jNfLezO1P0ttud8JJaprXmp
        96475UL08cetW95M2yPeK/dJlWmmt3Zt2vfQJ4YamxX+Ptf/mm8w976wyfbVUU+/cFwy3hzI
        /GDik2USf1QrTnyvmm8vzcxz9L6Z9T2Xdu7QNe5s+m1ffna8ctnvp7bA5OMeZ6aY9wzndpy3
        Fi/cV1JgtXneh9Tao7+/3drSqjz1o4DzpwP8S4/PvC3DJryfT91tiRJLcUaioRZzUXEiAMZU
        DHkCBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprPLMWRmVeSWpSXmKPExsWy7bCSvO6/AwWJBnd2SFpc3q9tMf/IOVaL
        jW9/MFnMOL+PyeJ53z4mB1aPWQ29bB53ru1h8+jbsorR4/MmuQCWKC6blNSczLLUIn27BK6M
        K1NPMBd8YqmYu/M9SwNjJ0sXIyeHhICJxO2HXxm7GLk4hAR2M0osur2ODSIhK/Hs3Q52CFtY
        4n7LEVaIoveMEl8aNoF1swnoSmx5/ooRxBYRsJY4unU+M0gRs8AcRolb1/6BJYSBVlxb1M4K
        YrMIqEqc+rEGqIiDg1fAXuL/eimIBfISR351MoPYvAKCEidnPgGbzwwUb946m3kCI98sJKlZ
        SFILGJlWMUqmFhTnpucWGxYY5qWW6xUn5haX5qXrJefnbmIEh6GW5g7G7as+6B1iZOJgPMQo
        wcGsJMK7uyI/UYg3JbGyKrUoP76oNCe1+BCjNAeLkjjvha6T8UIC6YklqdmpqQWpRTBZJg5O
        qQYm1vDk2p6zCzxibMOl8/Y++3ZC+JrybQ67GIsmmy8i+8/Pf7vqkNvHXXenvHyd0NCs8VFh
        c3dtTYTQnilPHAvXX5GPtdfJW+knu3D7p7kritdl+es8v3f2s8viDmHJuy9KD014dKDc9fmT
        7e+1Iot5tjiWyR2b2llkEG2UVHionpeH3zLNclvo1uc7bU7JpRwIfXXvbmxUxZvr948aOp16
        fcTQfbP1UjmmZcZP2a5/mJLE9fZzVMVS9zPlwg9q4s56P0+p1zaeeDg27E1vvM+Laibzxd8M
        9j978+u86UWLf2+e6E1icel4L5XPf+SytfTx7cZLJ18+7/nY8Eh5yPkoZqNvHb9fCRjtCI/f
        bPVMT4mlOCPRUIu5qDgRAASqrI2yAgAA
X-CMS-MailID: 20211021012310epcas2p2745335616ece50729db4a6368676b450
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20211021012310epcas2p2745335616ece50729db4a6368676b450
References: <CGME20211021012310epcas2p2745335616ece50729db4a6368676b450@epcas2p2.samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

This patchset is built on top of Sam's patchset[1]. Exynos Auto v9 SoC's
chipid is compatible with exynos850. So, this uses 850's compatible.

Exynos: CPU[EXYNOSAUTOV9] PRO_ID[0xaaa80000] REV[0x10] Detected

[1]: https://lore.kernel.org/linux-samsung-soc/163428419206.64320.1460944164027641564.b4-ty@canonical.com/

Chanho Park (2):
  soc: samsung: exynos-chipid: add exynosautov9 SoC support
  arm64: dts: exynos: add chipid node for exynosautov9 SoC

 arch/arm64/boot/dts/exynos/exynosautov9.dtsi | 5 +++++
 drivers/soc/samsung/exynos-chipid.c          | 1 +
 2 files changed, 6 insertions(+)

-- 
2.33.0

