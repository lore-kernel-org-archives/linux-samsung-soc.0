Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 385EFC433EF
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  7 Oct 2021 12:11:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1E3B461251
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  7 Oct 2021 12:11:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241121AbhJGMM7 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 7 Oct 2021 08:12:59 -0400
Received: from mailout1.samsung.com ([203.254.224.24]:33241 "EHLO
        mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241133AbhJGMM4 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 7 Oct 2021 08:12:56 -0400
Received: from epcas2p3.samsung.com (unknown [182.195.41.55])
        by mailout1.samsung.com (KnoxPortal) with ESMTP id 20211007121101epoutp0112233128b12843c669f4d78e3d796e41~rvmw-Du5w0490504905epoutp01V
        for <linux-samsung-soc@vger.kernel.org>; Thu,  7 Oct 2021 12:11:01 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20211007121101epoutp0112233128b12843c669f4d78e3d796e41~rvmw-Du5w0490504905epoutp01V
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1633608662;
        bh=xInT9k/I6m2WAKOg3iTEQJzcDohoWLIYCBN+bjopeIs=;
        h=From:To:Cc:Subject:Date:References:From;
        b=fZ1NCZTN7enoiU/H3nkx3jBWL8QWnDuYwYs+ohDEvDv7kecP6aE4YNRPzR9G1dwsf
         qDTL90LVSMe3/E6XdMOxQyHwK+8qXphtgBYZTH9xMK4ogUZjyGvD/SWH7YTBaSKmEE
         c1VaRssa1+PDoauJHhN+9/3SsXF8aXk4aL3zhzkU=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
        epcas2p2.samsung.com (KnoxPortal) with ESMTP id
        20211007121101epcas2p21bad39b9ec53961060ec6978921448e5~rvmwiE9xb3249832498epcas2p2h;
        Thu,  7 Oct 2021 12:11:01 +0000 (GMT)
Received: from epsmges2p3.samsung.com (unknown [182.195.36.98]) by
        epsnrtp3.localdomain (Postfix) with ESMTP id 4HQ9C46VFsz4x9Pr; Thu,  7 Oct
        2021 12:10:56 +0000 (GMT)
Received: from epcas2p4.samsung.com ( [182.195.41.56]) by
        epsmges2p3.samsung.com (Symantec Messaging Gateway) with SMTP id
        6E.8A.09749.0D3EE516; Thu,  7 Oct 2021 21:10:57 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
        epcas2p3.samsung.com (KnoxPortal) with ESMTPA id
        20211007121055epcas2p3b2900d4bc3b874af699d658160d5acfc~rvmrLvuFf0038000380epcas2p3y;
        Thu,  7 Oct 2021 12:10:55 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
        epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20211007121055epsmtrp1f679d12bfb8fec53c3c6a2ed7f6b75e3~rvmrIRFTq0870408704epsmtrp1T;
        Thu,  7 Oct 2021 12:10:55 +0000 (GMT)
X-AuditID: b6c32a47-d29ff70000002615-03-615ee3d02da1
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
        epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
        62.58.09091.FC3EE516; Thu,  7 Oct 2021 21:10:55 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.9.51]) by
        epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20211007121055epsmtip15db278a3a1282561121da28a13bbd9a7~rvmq4Djk51237912379epsmtip1d;
        Thu,  7 Oct 2021 12:10:55 +0000 (GMT)
From:   Chanho Park <chanho61.park@samsung.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Tomasz Figa <tomasz.figa@gmail.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Chanho Park <chanho61.park@samsung.com>
Subject: [PATCH 0/3] add initial support for exynosautov9
Date:   Thu,  7 Oct 2021 21:08:52 +0900
Message-Id: <20211007120855.56555-1-chanho61.park@samsung.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmpnk+LIzCtJLcpLzFFi42LZdljTQvfi47hEg6NLmCwu79e2mH/kHKvF
        xrc/mCym/FnOZDHj/D4mi9a9R9gtDr9pZ7VYtesPowOHx6yGXjaPnbPusntsWtXJ5nHn2h42
        j74tqxg9Pm+SC2CLyrbJSE1MSS1SSM1Lzk/JzEu3VfIOjneONzUzMNQ1tLQwV1LIS8xNtVVy
        8QnQdcvMAbpHSaEsMacUKBSQWFyspG9nU5RfWpKqkJFfXGKrlFqQklNgXqBXnJhbXJqXrpeX
        WmJlaGBgZApUmJCd0XxhKVvBA86KBUvnsDcwzuDoYuTgkBAwkdi7w7+LkYtDSGAHo8Tbdz+Z
        IZxPjBJrr/1nh3C+MUo8mXoCyOEE63i0ajlU1V5Gide3fkJVfWSUOPX0OxNIFZuArsSW568Y
        QRIiAp2MEiu/bQNLMAscYJTYcsEOxBYWsJQ4vP85O8ghLAKqEk2rWEDCvAJ2El9vNzFCbJOX
        OPKrkxkiLihxcuYTFogx8hLNW2eDXSEhcI9d4ujl06wQDS4SL9auY4awhSVeHd8CdbaUxMv+
        NnaIhm5GidZH/6ESqxklOht9IGx7iV/Tt7CCHMQsoCmxfpc+JJCUJY7cgtrLJ9Fx+C87RJhX
        oqNNCKJRXeLA9uksELasRPecz6wQJR4SX7q0QcJCArESUzq/ME1glJ+F5JlZSJ6ZhbB2ASPz
        Kkax1ILi3PTUYqMCY3icJufnbmIEp0gt9x2MM95+0DvEyMTBeIhRgoNZSYQ33z42UYg3JbGy
        KrUoP76oNCe1+BCjKTB0JzJLiSbnA5N0Xkm8oYmlgYmZmaG5kamBuZI479x/TolCAumJJanZ
        qakFqUUwfUwcnFINTGyFM6eyXxMOdTBJu/ekSKJPNOLMFikeJsd97U/Zt/ryt2103fytNPjg
        Zy+VKza2Lw70qAsJPDn9wSLPqG2uhaNHzPto/8IYi7Vv8gsvWRzt+7VjfkJijtPtNyu7/Stm
        xcxTzt2/uM0kxdpyJkval5XGFtxiLD/jm0wSuSfMPzXv065Gidwrd353XEz/wJFi63jwSd2D
        gvnTM68039q81LHzQ+yuQ4HZz3dZB2ipzeQ2WJQQwXLetWtn1Zoe1gcuy3JNC78bH/M+cDJw
        27uFL8+H3vh9e9077Wea+7k3W/yT//RzyenKDIWPuY7/QndvPifIsPqJjN9rXrdNIh3vK8q1
        2K45esQvlb6QJfdBQYmlOCPRUIu5qDgRAMrHl0AaBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrJLMWRmVeSWpSXmKPExsWy7bCSnO75x3GJBl8eSltc3q9tMf/IOVaL
        jW9/MFlM+bOcyWLG+X1MFq17j7BbHH7TzmqxatcfRgcOj1kNvWweO2fdZffYtKqTzePOtT1s
        Hn1bVjF6fN4kF8AWxWWTkpqTWZZapG+XwJXRfGEpW8EDzooFS+ewNzDO4Ohi5OSQEDCReLRq
        OXMXIxeHkMBuRonV1/rZIBKyEs/e7WCHsIUl7rccYYUoes8o8frhfUaQBJuArsSW568YQRIi
        At2MEv2NvUwgDrPAEUaJ/99/sYBUCQtYShze/xxoFAcHi4CqRNMqsDCvgJ3E19tNjBAb5CWO
        /OpkhogLSpyc+QSshhko3rx1NvMERr5ZSFKzkKQWMDKtYpRMLSjOTc8tNiwwzEst1ytOzC0u
        zUvXS87P3cQIDl0tzR2M21d90DvEyMTBeIhRgoNZSYQ33z42UYg3JbGyKrUoP76oNCe1+BCj
        NAeLkjjvha6T8UIC6YklqdmpqQWpRTBZJg5OqQYm9XRPicqal9E6898e2bnL0GPyp8fCixke
        xMpxSzenS0aHTn6jePeZx4HYMzcTP8u/+bRwOcvS45dYVT5t5r29yePtthN8N+u3n3at3F51
        8v+z3wt+P3u+4FRTKS/7U9nql3YRS9aeOPzy2+XAzhmxeS5nRa/pZl2xO9duO3mqnMeJib/C
        91cpzWe2fljrZnjh9a20wxcDl0TX6ERbZZmHCgWvOXpB7t/XqOVNWw2V2/2Zu9a6qQkFRcZE
        +hkJTFrLsvBgyedf3AxpO2rvOcuEqnH9izL68FVX0+XnoePFapt0al/xmE3pVxaLNRa5l2lw
        PpAjOfDX9/yzzzZc1pF10zh9ImvPuV9/uouFpxe8VWIpzkg01GIuKk4EALmtZZTMAgAA
X-CMS-MailID: 20211007121055epcas2p3b2900d4bc3b874af699d658160d5acfc
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20211007121055epcas2p3b2900d4bc3b874af699d658160d5acfc
References: <CGME20211007121055epcas2p3b2900d4bc3b874af699d658160d5acfc@epcas2p3.samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

This patchset supports minimal set for ExynosAuto v9 SoC and SADK board.
This contains serial_0 as uart console and ufs_0 for rootfs storage.
Regarding UFS, it depends on UFS patchset[1].

[1]: https://lore.kernel.org/linux-samsung-soc/20211007080934.108804-1-chanho61.park@samsung.com/T/#t

Chanho Park (3):
  pinctrl: samsung: support ExynosAutov9 SoC pinctrl
  arm64: dts: exynos: add initial support for exynosautov9 SoC
  arm64: dts: exynos: add minimal support for exynosautov9 sadk board

 .../bindings/arm/samsung/samsung-boards.yaml  |    6 +
 .../bindings/pinctrl/samsung-pinctrl.txt      |    1 +
 .../boot/dts/exynos/exynosautov9-pinctrl.dtsi | 1206 +++++++++++++++++
 .../boot/dts/exynos/exynosautov9-sadk.dts     |   52 +
 arch/arm64/boot/dts/exynos/exynosautov9.dtsi  |  290 ++++
 .../pinctrl/samsung/pinctrl-exynos-arm64.c    |  108 ++
 drivers/pinctrl/samsung/pinctrl-samsung.c     |    2 +
 drivers/pinctrl/samsung/pinctrl-samsung.h     |    1 +
 8 files changed, 1666 insertions(+)
 create mode 100644 arch/arm64/boot/dts/exynos/exynosautov9-pinctrl.dtsi
 create mode 100644 arch/arm64/boot/dts/exynos/exynosautov9-sadk.dts
 create mode 100644 arch/arm64/boot/dts/exynos/exynosautov9.dtsi

-- 
2.33.0

