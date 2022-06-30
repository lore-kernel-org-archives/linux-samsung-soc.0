Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80E15C43334
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 30 Jun 2022 02:20:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231336AbiF3CUB (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 29 Jun 2022 22:20:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42300 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231360AbiF3CT7 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 29 Jun 2022 22:19:59 -0400
Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1DFA836332
        for <linux-samsung-soc@vger.kernel.org>; Wed, 29 Jun 2022 19:19:58 -0700 (PDT)
Received: from epcas2p2.samsung.com (unknown [182.195.41.54])
        by mailout4.samsung.com (KnoxPortal) with ESMTP id 20220630021953epoutp044fefb8ed6b6eee22f35d877c114af9e4~9RIj8GP0u1949319493epoutp04L
        for <linux-samsung-soc@vger.kernel.org>; Thu, 30 Jun 2022 02:19:53 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20220630021953epoutp044fefb8ed6b6eee22f35d877c114af9e4~9RIj8GP0u1949319493epoutp04L
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1656555593;
        bh=XDklniwh3QyfjPxOJhBkr0ZUQ5RAQCRt+ldHWtZVb8k=;
        h=From:To:Cc:Subject:Date:References:From;
        b=de8fQ4cfVWp8oxQebksozgTXEAT3p5U2JbqE607fLUXEkty/r2aphCeOe4jU+0oVB
         bVrtNQYmyXLjIJ5O7dJRsaNzYvfeQ8Q0pQ5/LAsHqDKynwgKf/rFLfEzkzGMf41BEw
         Pt1UicqtVqw/0y148vuC9PHnfJmnr+K0nHDBNyWM=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
        epcas2p3.samsung.com (KnoxPortal) with ESMTP id
        20220630021952epcas2p3f9d4f3ecead1ea5f4a15c8fb028653fb~9RIjXrQPo1312413124epcas2p3T;
        Thu, 30 Jun 2022 02:19:52 +0000 (GMT)
Received: from epsmges2p4.samsung.com (unknown [182.195.36.101]) by
        epsnrtp2.localdomain (Postfix) with ESMTP id 4LYMVH6M7Jz4x9QC; Thu, 30 Jun
        2022 02:19:51 +0000 (GMT)
Received: from epcas2p3.samsung.com ( [182.195.41.55]) by
        epsmges2p4.samsung.com (Symantec Messaging Gateway) with SMTP id
        A7.47.09662.7480DB26; Thu, 30 Jun 2022 11:19:51 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
        epcas2p3.samsung.com (KnoxPortal) with ESMTPA id
        20220630021951epcas2p3fb04daeddd98c74cbee3fed5044da6f9~9RIiT4NVz0138301383epcas2p34;
        Thu, 30 Jun 2022 02:19:51 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
        epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20220630021951epsmtrp1f61c9b28f917a5bf423029f18b7dfc70~9RIiTG_r21479214792epsmtrp1X;
        Thu, 30 Jun 2022 02:19:51 +0000 (GMT)
X-AuditID: b6c32a48-9e1ff700000025be-25-62bd08478215
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
        epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
        37.06.08802.7480DB26; Thu, 30 Jun 2022 11:19:51 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.9.51]) by
        epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20220630021951epsmtip264f187aa7b2da0e67e5854ca44cb262b~9RIiJAXyD3172731727epsmtip2l;
        Thu, 30 Jun 2022 02:19:51 +0000 (GMT)
From:   Chanho Park <chanho61.park@samsung.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Alim Akhtar <alim.akhtar@samsung.com>,
        Sam Protsenko <semen.protsenko@linaro.org>,
        Jaewon Kim <jaewon02.kim@samsung.com>,
        devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Chanho Park <chanho61.park@samsung.com>
Subject: [PATCH v2 0/4] support USI for Exynos Auto v9 SoC
Date:   Thu, 30 Jun 2022 11:16:52 +0900
Message-Id: <cover.1656554759.git.chanho61.park@samsung.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmpjk+LIzCtJLcpLzFFi42LZdljTXNedY2+SweunBhYP5m1js7i8X9ti
        /pFzrBY7Go6wWvS9eMhssenxNVaLGef3MVm07j3CbvG8bx+TA6fHplWdbB53ru1h89i8pN6j
        b8sqRo/Pm+QCWKOybTJSE1NSixRS85LzUzLz0m2VvIPjneNNzQwMdQ0tLcyVFPISc1NtlVx8
        AnTdMnOAzlFSKEvMKQUKBSQWFyvp29kU5ZeWpCpk5BeX2CqlFqTkFJgX6BUn5haX5qXr5aWW
        WBkaGBiZAhUmZGe077IuOMBVMXlTM2sD42mOLkYODgkBE4k/LyS7GLk4hAR2MEpsmPubBcL5
        xCjR8fkKO4TzmVFi55yHrF2MnGAdbx82sUEkdjFKNF5tgGr5yCjx+sx1NpAqNgFdiS3PXzGC
        2CIC8RLPL7wHK2IWmMQkcb6jmRkkISxgJfHn+2awBhYBVYm1T9+A2bwCNhKXLxxmh1gnL7Fh
        fi8zRFxQ4uTMJywgNjNQvHnrbGaImmvsEn/ve0PYLhKzf+2DigtLvDq+BWqOlMTL/jYou1hi
        6axPTCAHSQg0MEpc3vaLDSJhLDHrWTsjKGSYBTQl1u/ShwSSssSRW1Br+SQ6Dv9lhwjzSnS0
        CUE0qksc2D6dBcKWleie8xkaWB4Sey63g10jJBArca+/nWUCo/wsJM/MQvLMLIS9CxiZVzGK
        pRYU56anFhsVmMDjNDk/dxMjOEFqeexgnP32g94hRiYOxkOMEhzMSiK8C8/sTBLiTUmsrEot
        yo8vKs1JLT7EaAoM3onMUqLJ+cAUnVcSb2hiaWBiZmZobmRqYK4kzuuVsiFRSCA9sSQ1OzW1
        ILUIpo+Jg1OqgSnqu5RVp6FQ6tMXrCH+69zLnN/cqz7899RCpZMnfTscohxtfjn+f3N1671F
        +7adZTdOZ+01rP7yyGHjl43XVUU/Fnhn283O2CJ4ZG3E///R1zNt/n7oW/gpzGlPwcfGwt9N
        WTPEFzVoPv6mfv/VWZO0J8ozLz4PNHpjc6V239yFe58ydM5oPsTwNTmsZJout8JpM5YPx2zs
        1/I3qs35u9aKXzo9bIVQlc+ObzoPfA8FT5lzQJaHsUrNRsQph1HE3uD+zW8CM87wbZPu2NLA
        bShwIK31XOtNyevW7tI7tieeeVzW6fbC//e5mrD/yZ+6mi7etzr4ki04opXxYbH2lBpTrW87
        Eyc4zF0t4RbGy6TEUpyRaKjFXFScCACdT+E+GQQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrOLMWRmVeSWpSXmKPExsWy7bCSvK47x94kg32X+C0ezNvGZnF5v7bF
        /CPnWC12NBxhteh78ZDZYtPja6wWM87vY7Jo3XuE3eJ53z4mB06PTas62TzuXNvD5rF5Sb1H
        35ZVjB6fN8kFsEZx2aSk5mSWpRbp2yVwZbTvsi44wFUxeVMzawPjaY4uRk4OCQETibcPm9i6
        GLk4hAR2MEpc3X2ECSIhK/Hs3Q52CFtY4n7LEVaIoveMEleWLmIBSbAJ6Epsef6KEcQWEYiX
        2PxlIQtIEbPANCaJjsczwLqFBawk/nzfzAZiswioSqx9+gbM5hWwkbh84TDUBnmJDfN7mSHi
        ghInZz4BW8AMFG/eOpt5AiPfLCSpWUhSCxiZVjFKphYU56bnFhsWGOWllusVJ+YWl+al6yXn
        525iBIetltYOxj2rPugdYmTiYDzEKMHBrCTCu/DMziQh3pTEyqrUovz4otKc1OJDjNIcLEri
        vBe6TsYLCaQnlqRmp6YWpBbBZJk4OKUamKrcrernTrkjKqb84tpd/9iaL8WenfkTn63T+KF4
        OVfpfMWkJUVt4b62ldn20+P9hAt8DRzsZVecWBvyaOellq/z2sw3+C+JyVsToh8SGf228OFu
        4V9fVGNmXwq+9OrlwWKGC8xVfxNKd0rkXPzV11xnx92ScmZLWuTxrLzGlbvUJzhPN6qcOuVL
        fT6/8bWGaZdlZpw9ojxRjTW2U6ba8cvnjQt9jwT+ipgQz/6Y49lpqRKpH9pMn+OZ0ivOOR8s
        CN1wY+viEs07YafMZnW4SR89ss9ugdiSFRN4Q8TWM0RbMjAfuanHsvZL6KX/FaYf+jKzmbK/
        FwluMQjdxLPdfPPW9On9jzeYBpQYHLh7WImlOCPRUIu5qDgRAKoWTNfKAgAA
X-CMS-MailID: 20220630021951epcas2p3fb04daeddd98c74cbee3fed5044da6f9
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20220630021951epcas2p3fb04daeddd98c74cbee3fed5044da6f9
References: <CGME20220630021951epcas2p3fb04daeddd98c74cbee3fed5044da6f9@epcas2p3.samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Add to support USI(Universal Serial Interface) for Exynos Auto v9 SoC.
This patchset is built on top of below patchset.
- spi patchset:
https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next
- serial patch to expand serial devices to 12:
https://lore.kernel.org/linux-samsung-soc/20220629005538.60132-1-chanho61.park@samsung.com/

The SoC supports up to 12 USIs so they can be configured as below
- 12 x UARTs(4pins)
- 12 x SPIs(4pins)
- 24 x I2C
- 12 x UARTS(2pin) and 12 x I2C

Changes from v1:
- Move all usi nodes from exynosautov9-usi.dtsi to exynosautov9.dtsi as
  suggested by Krzysztof
- Add exynosautov9-usi and exynosautov9-uart compatibles
- Drop unnecessary /* USI: */ comments
- Separate phandles of dmas nodes

Chanho Park (4):
  dt-bindings: soc: samsung: usi: add exynosautov9-usi compatible
  dt-bindings: serial: samsung: add exynosautov9-uart compatible
  arm64: dts: exynosautov9: add pdma0 device tree node
  arm64: dts: exynosautov9: add usi device tree nodes

 .../bindings/serial/samsung_uart.yaml         |    5 +-
 .../bindings/soc/samsung/exynos-usi.yaml      |    8 +-
 .../boot/dts/exynos/exynosautov9-sadk.dts     |    2 +
 arch/arm64/boot/dts/exynos/exynosautov9.dtsi  | 1087 ++++++++++++++++-
 4 files changed, 1094 insertions(+), 8 deletions(-)

-- 
2.36.1

