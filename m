Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9457DC4332F
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  3 May 2022 10:57:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234586AbiECLB1 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 3 May 2022 07:01:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234617AbiECLBT (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 3 May 2022 07:01:19 -0400
Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA0312CE1E
        for <linux-samsung-soc@vger.kernel.org>; Tue,  3 May 2022 03:57:37 -0700 (PDT)
Received: from epcas2p2.samsung.com (unknown [182.195.41.54])
        by mailout4.samsung.com (KnoxPortal) with ESMTP id 20220503105733epoutp0413e2e8f7206a04171b6ecef5daec72bd~rkx-JmyZD1405314053epoutp04V
        for <linux-samsung-soc@vger.kernel.org>; Tue,  3 May 2022 10:57:33 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20220503105733epoutp0413e2e8f7206a04171b6ecef5daec72bd~rkx-JmyZD1405314053epoutp04V
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1651575453;
        bh=Vk0KefwtdtzzIiK4MnIQhvHmNSpT1Kw8VsjyJmDbLqA=;
        h=From:To:Cc:Subject:Date:References:From;
        b=ny5PnG+VoNxWW+CutG8LuNo0di3IJeS2oslUmUUi3/tgg8fhVnOv8/ypqAWK+26r+
         rSCvFcDpbv3jKFmnJ6kCVzzvl2F/OEEvVJ5WCGhFZXV4ppDYON/rqeaSWcsDrQ/tMv
         uzRfQrrGIwYz6/FOm70KRta+ZzQduBoHe7oseIms=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
        epcas2p2.samsung.com (KnoxPortal) with ESMTP id
        20220503105732epcas2p2357d79da2a03653895cd385f868e5edc~rkx_cl7ZW1964119641epcas2p2A;
        Tue,  3 May 2022 10:57:32 +0000 (GMT)
Received: from epsmges2p4.samsung.com (unknown [182.195.36.97]) by
        epsnrtp3.localdomain (Postfix) with ESMTP id 4KsxkK4Tkvz4x9Q2; Tue,  3 May
        2022 10:57:29 +0000 (GMT)
Received: from epcas2p3.samsung.com ( [182.195.41.55]) by
        epsmges2p4.samsung.com (Symantec Messaging Gateway) with SMTP id
        B0.DA.09694.99A01726; Tue,  3 May 2022 19:57:29 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
        epcas2p4.samsung.com (KnoxPortal) with ESMTPA id
        20220503105729epcas2p4aef9a721ca48657edd4b61deb163bb04~rkx7jXPcL1759317593epcas2p4P;
        Tue,  3 May 2022 10:57:29 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
        epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20220503105729epsmtrp2d86d0f6d343500d1b589d4a0621f1851~rkx7iSPB41021210212epsmtrp2P;
        Tue,  3 May 2022 10:57:29 +0000 (GMT)
X-AuditID: b6c32a48-495ff700000025de-93-62710a998613
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
        epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
        A0.42.08853.99A01726; Tue,  3 May 2022 19:57:29 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.9.51]) by
        epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20220503105728epsmtip2beb3a15ff08acb3d287c8344c385de53~rkx7SvtBw0549505495epsmtip26;
        Tue,  3 May 2022 10:57:28 +0000 (GMT)
From:   Chanho Park <chanho61.park@samsung.com>
To:     Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Sam Protsenko <semen.protsenko@linaro.org>,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org,
        Chanho Park <chanho61.park@samsung.com>
Subject: [PATCH v2 00/12] initial clock support for exynosauto v9 SoC
Date:   Tue,  3 May 2022 19:59:02 +0900
Message-Id: <20220503105914.117625-1-chanho61.park@samsung.com>
X-Mailer: git-send-email 2.36.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrCJsWRmVeSWpSXmKPExsWy7bCmue5MrsIkg5+/FC0ezNvGZnF5v7bF
        9S/PWS3mHznHatH34iGzxd7XW9ktPvbcY7WYcX4fk8XFU64WrXuPsFscftPOavHv2kYWi+d9
        QPFVu/4wOvB5vL/Ryu6xc9Zddo9NqzrZPO5c28Pm0bdlFaPH501yAWxR2TYZqYkpqUUKqXnJ
        +SmZeem2St7B8c7xpmYGhrqGlhbmSgp5ibmptkouPgG6bpk5QMcqKZQl5pQChQISi4uV9O1s
        ivJLS1IVMvKLS2yVUgtScgrMC/SKE3OLS/PS9fJSS6wMDQyMTIEKE7Iz+me/YCs4IFBxpWsO
        YwPjTt4uRk4OCQETiQvXdrF1MXJxCAnsYJSY8uU0I0hCSOATo8SNSUkQiW+MEnvXNrPCdJxf
        dQWqYy+jxK6Dt5ghOj4ySizaGQ1iswnoSmx5/ooRpEhEoItZ4mLfPRYQh1lgK6PE8RuzmLoY
        OTiEBVwl3jTlgzSwCKhKnHvzAmw1r4C9xOdN59hASiQE5CX+LQ6FCAtKnJz5hAXEZgYKN2+d
        zQwyUkKgl0Ni1o/LjBDXuUi87L3JBmELS7w6voUdwpaS+PxuL1S8WGLprE9MEM0NjBKXt/2C
        ShhLzHrWzgiymFlAU2L9Ln2IG5QljtyC2ssn0XH4LztEmFeio00IolFd4sD26SwQtqxE95zP
        0LDykDi7aTs0eGIlrtx/yzSBUX4Wkm9mIflmFsLeBYzMqxjFUguKc9NTi40KTOBxmpyfu4kR
        nFy1PHYwzn77Qe8QIxMH4yFGCQ5mJRFe56UFSUK8KYmVValF+fFFpTmpxYcYTYHBO5FZSjQ5
        H5je80riDU0sDUzMzAzNjUwNzJXEeb1SNiQKCaQnlqRmp6YWpBbB9DFxcEo1MFnqFPs1hn8+
        7nXjSd3EaSmOFc0+bZeWlfLYzj6z41tgjcqVz1s7Gl53yR2+0H35WOLbMluLbe3NEbeyvpy7
        KXwu4Osqj0PcJSvSEyRZvfsymflSRAqMJz/+0cm++eTXWT06vkmOxruvf37JvH/3dSELS+Z+
        1oDeC1K/b/yosZG5GVySd6tr0drU1JU7Dh+TfP2abWmL3LujlxXtS3pKvBTvemxrbXA7luX8
        4FWsV4UE36yA1Sy7b2WdO7llzrNrJod1z+y4M8N5p3WN/JfmlX/Xyaqxvt1o2Pm4159vu5/C
        2jXVzzvFLFbcPJNl3Fed873QdV2A9bvuyYnL5x+wvvbNXqf6OkvW+TdPxLa48SixFGckGmox
        FxUnAgBzFdBLNwQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrKLMWRmVeSWpSXmKPExsWy7bCSvO5MrsIkg03PWSwezNvGZnF5v7bF
        9S/PWS3mHznHatH34iGzxd7XW9ktPvbcY7WYcX4fk8XFU64WrXuPsFscftPOavHv2kYWi+d9
        QPFVu/4wOvB5vL/Ryu6xc9Zddo9NqzrZPO5c28Pm0bdlFaPH501yAWxRXDYpqTmZZalF+nYJ
        XBn9s1+wFRwQqLjSNYexgXEnbxcjJ4eEgInE+VVX2LoYuTiEBHYzSixZ0MUKkZCVePZuBzuE
        LSxxv+UIK0TRe0aJZS+fMIMk2AR0JbY8f8UIkhARmMAs8ebKB3YQh1lgJ6PEnVengOZycAgL
        uEq8acoHaWARUJU49+YFI4jNK2Av8XnTObASCQF5iX+LQyHCghInZz5hAbGZgcLNW2czT2Dk
        m4UkNQtJagEj0ypGydSC4tz03GLDAsO81HK94sTc4tK8dL3k/NxNjOCQ19Lcwbh91Qe9Q4xM
        HIyHGCU4mJVEeJ2XFiQJ8aYkVlalFuXHF5XmpBYfYpTmYFES573QdTJeSCA9sSQ1OzW1ILUI
        JsvEwSnVwNQu8ixWs6R0nvTJC5sX3zAImcpgzb6uP6bnpcyqWv4jG9utu+d2Wzzsm7lRfqNO
        wtEwB6EvNn+OrPh79cumg6uCT29vNpAVuyRdsfB97rvny1tEnOX63VZm7O/9sPuL/48JaUrX
        vNn6F1u5JfzZaiq4e5aczrwwc+EctgtZKlzfEvi/n964j0OrQog7+/kh+1dfXn9yqzm+0ub7
        5/yyqzrLZvnvSF0RunO/6YVIthMxtWoz06Zte1M3c4dh4sMNk6Vvx1SuXFW9ysart+y7kd+i
        ybM4y98x1b/0vGDgmLJW6OEWgXkXpt1Tf62QHr5fdu92t6pdfx+rVITs3mZz5+BDz1NCgel8
        Chbr7Ny+v1utxFKckWioxVxUnAgAYXi5CegCAAA=
X-CMS-MailID: 20220503105729epcas2p4aef9a721ca48657edd4b61deb163bb04
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20220503105729epcas2p4aef9a721ca48657edd4b61deb163bb04
References: <CGME20220503105729epcas2p4aef9a721ca48657edd4b61deb163bb04@epcas2p4.samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

This patchset adds initial clock driver support for Exynos Auto v9 SoC.
This driver is highly inspired from exynos850 clock driver. Like
exynos850, this does not use Q-channel control & Hardware automatic
clock gating. So, all the gate clocks will be controlled by CCF & CMU
driver.

Below CMU blocks are supported in this patchset and remains will be
implemented later.

- CMU_TOP
- CMU_BUSMC
- CMU_CORE
- CMU_FSYS2
- CMU_PERIC0
- CMU_PERIC1
- CMU_PERIS

Changes from v1:
- Adjust patch order to avoid dt-binding check bot's build warning
- Rename exynosautov9.h to samsung,exynosautov9.h (Suggested by
  Krzystof)
- clock nodes of exynosautov9.dtsi are aligned by unit address order.
- Each clock items are listed to every own line.
- Added Krzystof RB tags.

Chanho Park (12):
  dt-bindings: clock: add clock binding definitions for Exynos Auto v9
  dt-bindings: clock: add Exynos Auto v9 SoC CMU bindings
  clk: samsung: add top clock support for Exynos Auto v9 SoC
  clk: samsung: exynosautov9: add cmu_core clock support
  clk: samsung: exynosautov9: add cmu_peris clock support
  clk: samsung: exynosautov9: add cmu_busmc clock support
  clk: samsung: exynosautov9: add cmu_fsys2 clock support
  clk: samsung: exynosautov9: add cmu_peric0 clock support
  clk: samsung: exynosautov9: add cmu_peric1 clock support
  arm64: dts: exynosautov9: add initial cmu clock nodes
  arm64: dts: exynosautov9: switch usi clocks
  arm64: dts: exynosautov9: switch ufs clock node

 .../clock/samsung,exynosautov9-clock.yaml     |  219 +++
 arch/arm64/boot/dts/exynos/exynosautov9.dtsi  |  115 +-
 drivers/clk/samsung/Makefile                  |    1 +
 drivers/clk/samsung/clk-exynosautov9.c        | 1733 +++++++++++++++++
 .../dt-bindings/clock/samsung,exynosautov9.h  |  299 +++
 5 files changed, 2342 insertions(+), 25 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/samsung,exynosautov9-clock.yaml
 create mode 100644 drivers/clk/samsung/clk-exynosautov9.c
 create mode 100644 include/dt-bindings/clock/samsung,exynosautov9.h

-- 
2.36.0

