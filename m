Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23A77C433F5
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  1 Nov 2021 23:45:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EE8AE60F3A
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  1 Nov 2021 23:45:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231495AbhKAXrm (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 1 Nov 2021 19:47:42 -0400
Received: from mailout2.samsung.com ([203.254.224.25]:53237 "EHLO
        mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230396AbhKAXrl (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 1 Nov 2021 19:47:41 -0400
Received: from epcas2p1.samsung.com (unknown [182.195.41.53])
        by mailout2.samsung.com (KnoxPortal) with ESMTP id 20211101234503epoutp022d264eaa522d09bc40f56c4c983996bc~zkM3zdEfl1657516575epoutp02x
        for <linux-samsung-soc@vger.kernel.org>; Mon,  1 Nov 2021 23:45:03 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20211101234503epoutp022d264eaa522d09bc40f56c4c983996bc~zkM3zdEfl1657516575epoutp02x
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1635810303;
        bh=9Gmk3MsADtiTk0KbBQioQLGVbzrN8jvqxdb6of5f9dk=;
        h=From:To:Cc:Subject:Date:References:From;
        b=lCrkmDotdfFyp0HtG62P1vdcQjFqJytfS51Et7A+Cww4z5fN+l5jsBftBglcYtWG+
         j7nCs5DPqnJQXKL3FzmwVMZ94czPynZJwIz6XLNlN4mQKCwRZtX0tjbLPCT6Xi1n4O
         VEQNC7ZbrTLFX2dY8/YDWcyLVsKcCVNFjnT5drLA=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
        epcas2p1.samsung.com (KnoxPortal) with ESMTP id
        20211101234503epcas2p18d7823f71f6ddb3e98cc4f51b4e3076f~zkM3DQnYb0999109991epcas2p1J;
        Mon,  1 Nov 2021 23:45:03 +0000 (GMT)
Received: from epsmges2p4.samsung.com (unknown [182.195.36.88]) by
        epsnrtp4.localdomain (Postfix) with ESMTP id 4HjqQF6gGKz4x9Q2; Mon,  1 Nov
        2021 23:44:53 +0000 (GMT)
Received: from epcas2p3.samsung.com ( [182.195.41.55]) by
        epsmges2p4.samsung.com (Symantec Messaging Gateway) with SMTP id
        F8.21.12141.2FB70816; Tue,  2 Nov 2021 08:44:50 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
        epcas2p3.samsung.com (KnoxPortal) with ESMTPA id
        20211101234449epcas2p385cd5133ff8ed3a248649b4134bc0113~zkMqx4ckQ1057810578epcas2p3A;
        Mon,  1 Nov 2021 23:44:49 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
        epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20211101234449epsmtrp1f1a570af88b37ba63052aad3603419a2~zkMqxEDFz0970709707epsmtrp1D;
        Mon,  1 Nov 2021 23:44:49 +0000 (GMT)
X-AuditID: b6c32a48-d73ff70000002f6d-d8-61807bf22ac1
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
        epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
        B2.9C.08738.1FB70816; Tue,  2 Nov 2021 08:44:49 +0900 (KST)
Received: from localhost.localdomain (unknown [12.36.155.123]) by
        epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20211101234449epsmtip19475c1bd3d668d9f662a2e245ee06786~zkMqhkGD92411524115epsmtip1q;
        Mon,  1 Nov 2021 23:44:49 +0000 (GMT)
From:   Youngmin Nam <youngmin.nam@samsung.com>
To:     krzysztof.kozlowski@canonical.com, will@kernel.org,
        mark.rutland@arm.com, daniel.lezcano@linaro.org
Cc:     tglx@linutronix.de, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, pullip.cho@samsung.com,
        hoony.yu@samsung.com, hajun.sung@samsung.com,
        myung-su.cha@samsung.com, kgene@kernel.org,
        Youngmin Nam <youngmin.nam@samsung.com>
Subject: [PATCH v2 0/2] Indroduce Exynos Multi Core Timer version 2
Date:   Tue,  2 Nov 2021 09:11:20 +0900
Message-Id: <20211102001122.27516-1-youngmin.nam@samsung.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrHJsWRmVeSWpSXmKPExsWy7bCmue6n6oZEgwlX5S3mfZa1aNp/idni
        +NrXrBb9j18zW2x8+4PJYtPja6wWl3fNYbOYcX4fk8XS6xeZLBY/XsFk8a/3IKPF5k1TmS1a
        7phaLD7wid2Bz2PNvDWMHrMaetk8Nq3qZPO4c20Pm8e7c+fYPTYvqffo27KK0ePzJrkAjqhs
        m4zUxJTUIoXUvOT8lMy8dFsl7+B453hTMwNDXUNLC3MlhbzE3FRbJRefAF23zBygq5UUyhJz
        SoFCAYnFxUr6djZF+aUlqQoZ+cUltkqpBSk5BeYFesWJucWleel6eaklVoYGBkamQIUJ2RnP
        H/5hLDjPXTFzZj9jA+Nkzi5GTg4JAROJtRNvMXUxcnEICexglJhwfCsjhPOJUWLypyssIFVC
        Ap8ZJb4udofpuPj7IjtE0S5GiaWPO6A6gIr2L1zCDlLFJqArse3EP0YQW0QgU+LDl0+sIEXM
        AguYJC4cfgpWJCzgLPFw1xMmEJtFQFXi5Io+sHW8ArYSf2b8ZINYJy9x5FcnM0RcUOLkzCdg
        NcxA8eats5khaiZySHydpglhu0g0X//KDmELS7w6vgXKlpJ42d8GZddLLN62lBnkIAmBCYwS
        8zd9gEoYS8x61g50NQfQAk2J9bv0QUwJAWWJI7eg1vJJdBz+yw4R5pXoaBOCaFST+DVlAyOE
        LSOxe/EKqMs8JG70vGOEBGKsxMpn09kmMMrPQvLMLCTPzELYu4CReRWjWGpBcW56arFRgQk8
        UpPzczcxghOulscOxtlvP+gdYmTiYDzEKMHBrCTCG3GhJlGINyWxsiq1KD++qDQntfgQoykw
        eCcyS4km5wNTfl5JvKGJpYGJmZmhuZGpgbmSOK+laHaikEB6YklqdmpqQWoRTB8TB6dUA9OJ
        gnM17MHrxcw57+zne/hgAptB0qyS5ye62UJi4rTvLDwVu8/h4pN3uVfKO1qnlzBxODn4Wxll
        OiRWK8864FjwM/xJe/7Unp8GmRu3Fd20aP/8SsKp+v2eM4EOwqKeEtOT0+9bvr+x2KJpVtWT
        ac/VZp+p+1Z9Y/mpGftX2ohP6zZxl/t7SfcE39pv3Hu7TXMu7L/+cs3OtA+bZzf7lH3ZmXN4
        +v8Zd79tCXM75nR+wjJt67+sRxma7RmXrdzs/D7Ap2jmEq5zmnPENq9/mLHsU3zhzBCe3BdX
        +Awqz+8QqFH+esPb7Iy29SEtkeerFDxVRJzEyv+L3ft353RgVR3ruVfvHecLBLlclvNg2N+o
        xFKckWioxVxUnAgA1lz7MkEEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrPLMWRmVeSWpSXmKPExsWy7bCSnO7H6oZEgx3zdSzmfZa1aNp/idni
        +NrXrBb9j18zW2x8+4PJYtPja6wWl3fNYbOYcX4fk8XS6xeZLBY/XsFk8a/3IKPF5k1TmS1a
        7phaLD7wid2Bz2PNvDWMHrMaetk8Nq3qZPO4c20Pm8e7c+fYPTYvqffo27KK0ePzJrkAjigu
        m5TUnMyy1CJ9uwSujOcP/zAWnOeumDmzn7GBcTJnFyMnh4SAicTF3xfZuxi5OIQEdjBK7Lx/
        kw0iISNxe+VlVghbWOJ+yxFWiKKPjBJLT/1lBEmwCehKbDvxD8wWEciV6DgwhxGkiFlgFZPE
        k45TLCAJYQFniYe7njCB2CwCqhInV/SBxXkFbCX+zPgJtU1e4sivTmaIuKDEyZlPwGqYgeLN
        W2czT2Dkm4UkNQtJagEj0ypGydSC4tz03GLDAqO81HK94sTc4tK8dL3k/NxNjOA40NLawbhn
        1Qe9Q4xMHIyHGCU4mJVEeCMu1CQK8aYkVlalFuXHF5XmpBYfYpTmYFES573QdTJeSCA9sSQ1
        OzW1ILUIJsvEwSnVwKT1Ypbdr5lTw0RPviiMtFldrvSzy+2J87kPNQu1bi0wYJNm0PboaQi8
        fPNgJqt2ybLApHWmPFbc+zf/uybpXfWBOcphbvL+FuOilyea5gi+W7fRhGEjY+uKtxxCTVmJ
        3Gq7Lz2McJqilLkxiElagNt1zduuGMvmf87SKbmP9/nn1qQ1Cj24qqPz5ldOiptPukbHFk9f
        5sCFrp75pYzNtzYlHmnqsa98P71hC0tv44YGgUyD3jf6dpP7DKae4+R/x7T+hFrMYmndlBUb
        k56vmXJjs8KSJIN5v9OfWeqc3SY0w5vr0nzWC12Nycwv1TSVre4WaJ5IbF/4baOM/66rX8uX
        ple4O50uKIuJSK9XYinOSDTUYi4qTgQADX305vICAAA=
X-CMS-MailID: 20211101234449epcas2p385cd5133ff8ed3a248649b4134bc0113
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20211101234449epcas2p385cd5133ff8ed3a248649b4134bc0113
References: <CGME20211101234449epcas2p385cd5133ff8ed3a248649b4134bc0113@epcas2p3.samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Exynos Multi Core Timer version 2 is a new main system timer of next Exynos SoC.
Exynos MCT v2 consists of 1 64bit FRC(Free Running Counter) and 12 comparators.
Each comaprator produces interrupt when the value of current FRC + periods value matches with the
increasinig value of FRC.
So, 12 comaprators can be used as per-cpu event timer.
And RTC can be used as a backup clock source.

Changes in v2:
  - Add config dependency with ARCH_EXYNOS.
  - Remove 32bit of "mct-frc" which was used as a clock source in legacy SoC.
    (Currently, clock source was replaced with ARM arch timer)
  - Fix non-linux style comments and debug messege.
  - Fix license comments.
  - Update commit messege a bit to make it clear.

Youngmin Nam (2):
  clocksource/drivers/exynos_mct_v2: introduce Exynos MCT version 2
    driver for next Exynos SoC
  dt-bindings: timer: samsung,s5e99xx-mct: Document s5e99xx-mct bindings

 .../bindings/timer/samsung,s5e99xx-mct.yaml   |  91 ++++++
 drivers/clocksource/Kconfig                   |   7 +
 drivers/clocksource/Makefile                  |   1 +
 drivers/clocksource/exynos_mct_v2.c           | 298 ++++++++++++++++++
 drivers/clocksource/exynos_mct_v2.h           |  71 +++++
 5 files changed, 468 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/timer/samsung,s5e99xx-mct.yaml
 create mode 100644 drivers/clocksource/exynos_mct_v2.c
 create mode 100644 drivers/clocksource/exynos_mct_v2.h

-- 
2.33.0

