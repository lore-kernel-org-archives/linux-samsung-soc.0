Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA9C5C433FE
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  4 May 2022 07:50:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345828AbiEDHyT (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 4 May 2022 03:54:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345790AbiEDHxz (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 4 May 2022 03:53:55 -0400
Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B370763FB
        for <linux-samsung-soc@vger.kernel.org>; Wed,  4 May 2022 00:50:18 -0700 (PDT)
Received: from epcas2p2.samsung.com (unknown [182.195.41.54])
        by mailout2.samsung.com (KnoxPortal) with ESMTP id 20220504075010epoutp027883c4f5a84b98afb95b9bf2f4403c80~r13qwb0Bv1784817848epoutp02w
        for <linux-samsung-soc@vger.kernel.org>; Wed,  4 May 2022 07:50:10 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20220504075010epoutp027883c4f5a84b98afb95b9bf2f4403c80~r13qwb0Bv1784817848epoutp02w
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1651650610;
        bh=YmZIlNEHv/3XMhqG0EK9T80nYSuihueHjbJN69zDw/4=;
        h=From:To:Cc:Subject:Date:References:From;
        b=Svl7xx5ytjDagNUf/q4nG/bM4u9PnebkVM484VkFtkU3WuNGX0HFqZ5eRlY5ue0E3
         vfUaxD3X5j3eKg6N4rnpRbvXBhjCxcckR8DRZaXt83Crm2I7r8dawwQ96V4vV5A2Ej
         vaJF43BH+yGPGkY0tPJdFwzc8J7zlIUPx3ZoYoJY=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
        epcas2p2.samsung.com (KnoxPortal) with ESMTP id
        20220504075009epcas2p217bf5d31071d053c13edf685bf0ad576~r13p9n16a2514825148epcas2p2B;
        Wed,  4 May 2022 07:50:09 +0000 (GMT)
Received: from epsmges2p3.samsung.com (unknown [182.195.36.92]) by
        epsnrtp3.localdomain (Postfix) with ESMTP id 4KtTWd4ZlCz4x9QS; Wed,  4 May
        2022 07:50:05 +0000 (GMT)
Received: from epcas2p1.samsung.com ( [182.195.41.53]) by
        epsmges2p3.samsung.com (Symantec Messaging Gateway) with SMTP id
        7D.72.10028.B2032726; Wed,  4 May 2022 16:50:03 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
        epcas2p3.samsung.com (KnoxPortal) with ESMTPA id
        20220504075003epcas2p3f6f002e444cab4e39c025b169cba1b80~r13kfNPmx2951229512epcas2p3l;
        Wed,  4 May 2022 07:50:03 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
        epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20220504075003epsmtrp1bb02df7406da2d58a2fc1f68a67d2761~r13keIWxE2992129921epsmtrp1S;
        Wed,  4 May 2022 07:50:03 +0000 (GMT)
X-AuditID: b6c32a47-573ff7000000272c-3d-6272302b7c13
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
        epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
        A0.3A.08853.B2032726; Wed,  4 May 2022 16:50:03 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.9.51]) by
        epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20220504075003epsmtip1928197d7cc8e8a5b8408c8246fc90a7d~r13kSCQUU2116421164epsmtip1k;
        Wed,  4 May 2022 07:50:03 +0000 (GMT)
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
Subject: [PATCH v3 00/12] initial clock support for exynosauto v9 SoC
Date:   Wed,  4 May 2022 16:51:42 +0900
Message-Id: <20220504075154.58819-1-chanho61.park@samsung.com>
X-Mailer: git-send-email 2.36.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrGJsWRmVeSWpSXmKPExsWy7bCmqa62QVGSwYVfFhYP5m1js7i8X9vi
        +pfnrBbzj5xjteh78ZDZYu/rrewWH3vusVrMOL+PyeLiKVeL1r1H2C0Ov2lntfh3bSOLxfM+
        oPiqXX8YHfg83t9oZffYOesuu8emVZ1sHneu7WHz6NuyitHj8ya5ALaobJuM1MSU1CKF1Lzk
        /JTMvHRbJe/geOd4UzMDQ11DSwtzJYW8xNxUWyUXnwBdt8wcoGOVFMoSc0qBQgGJxcVK+nY2
        RfmlJakKGfnFJbZKqQUpOQXmBXrFibnFpXnpenmpJVaGBgZGpkCFCdkZlw49Zi7YIVjx/phU
        A+MMvi5GTg4JAROJ2TfusnYxcnEICexglJi5djsbhPOJUeLd8v1MEM43Ron72zqYYVo6/09g
        hEjsZZR4fHAlC4TzkVHi46L3TCBVbAK6EluevwKrEhHoYpa42HcPrIpZYCujxPEbs8CqhAVc
        JS5ebWcBsVkEVCVuX/sDZvMK2Ekc37STvYuRA2ifvMS/xaEQYUGJkzOfgJUwA4Wbt85mBpkp
        IdDKIfH32HFGiPtcJH49eMgCYQtLvDq+hR3ClpJ42d8GZRdLLJ31iQmiuYFR4vK2X2wQCWOJ
        Wc/aGUEWMwtoSqzfpQ9xg7LEkVtQe/kkOg7/hTqNV6KjTQiiUV3iwPbpUFtlJbrnfGaFsD0k
        OlZdBYeckECsxPvLT1gnMMrPQvLNLCTfzELYu4CReRWjWGpBcW56arFRgTE8VpPzczcxghOs
        lvsOxhlvP+gdYmTiYDzEKMHBrCTC67y0IEmINyWxsiq1KD++qDQntfgQoykweCcyS4km5wNT
        fF5JvKGJpYGJmZmhuZGpgbmSOK9XyoZEIYH0xJLU7NTUgtQimD4mDk6pBiaza58V2dn9ZTYs
        e2PnOWX5yZs3luvuibxf1H4hpP29xYvZz9M815b+esTjt6bpTnfZv7bAuZOfPbkQvXCLV8JH
        zSle5RwXUvLbYv5c2MPnoRn0fUMNx48Yno0pM4+1cN36F371x7GT1x1vBm50+dRwpP8xm+V1
        G53YBqbGCx+/JQZ7GRlZvH/oU7s7tP/e8pUnf01Nuvrh+9fymJfuGrYGlVv4qx41ppfKldaa
        rFX8FJ+f2zHPbYnlOY8rV727896tOcMYb1trGvlZYLf10fSrrUulj6nPezwjr1KlX0OnbnZj
        gsKLuv1/lfayZLos/GRh933nXebFMW1fu97uzr/cKszw9Gi+xfy5V94cnWCoxFKckWioxVxU
        nAgAZPsDIDkEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrKLMWRmVeSWpSXmKPExsWy7bCSnK62QVGSwedtshYP5m1js7i8X9vi
        +pfnrBbzj5xjteh78ZDZYu/rrewWH3vusVrMOL+PyeLiKVeL1r1H2C0Ov2lntfh3bSOLxfM+
        oPiqXX8YHfg83t9oZffYOesuu8emVZ1sHneu7WHz6NuyitHj8ya5ALYoLpuU1JzMstQifbsE
        roxLhx4zF+wQrHh/TKqBcQZfFyMnh4SAiUTn/wmMXYxcHEICuxkl2i/vY4NIyEo8e7eDHcIW
        lrjfcoQVoug9o8S/SyfBitgEdCW2PH8F1i0iMIFZ4s2VD+wgDrPATkaJO69OgVUJC7hKXLza
        zgJiswioSty+9gfM5hWwkzi+aSdQAwfQCnmJf4tDIcKCEidnPgErYQYKN2+dzTyBkW8WktQs
        JKkFjEyrGCVTC4pz03OLDQsM81LL9YoTc4tL89L1kvNzNzGCQ15Lcwfj9lUf9A4xMnEwHmKU
        4GBWEuF1XlqQJMSbklhZlVqUH19UmpNafIhRmoNFSZz3QtfJeCGB9MSS1OzU1ILUIpgsEwen
        VANTafAUnaDTOzIfnjZet8Rj49v27XNb159vKnv14aSx+ONn2/fqby205izy/J+c8qt3s441
        l9096dU6dZpJa30PzC5quG3nWvI73OCjZI/h/R9+e3SzCro2/fS8/8/nhapJtn7qoZqZ6lvZ
        rZr7PdL9uaOflVz/H9y3aPmyG+33bu5k1eJifVX/sPIAz1b9Q3Me/F7s2dZ54+uaK+dlmboy
        A76G/MmbLPY7TXx/7J6FV8KXxgfd6Xv5Z48D9zOFQKNzf1mO2c44vmZjmpW4TpD5IW2+p5/L
        53KW7co+8OJAwHzv1pPpK1ledn6/H/+grGF+ZvXfc9tsDjBmSB6queWQHMf/YA3XyrmhPoKz
        pC3nKrEUZyQaajEXFScCAAbgelnoAgAA
X-CMS-MailID: 20220504075003epcas2p3f6f002e444cab4e39c025b169cba1b80
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20220504075003epcas2p3f6f002e444cab4e39c025b169cba1b80
References: <CGME20220504075003epcas2p3f6f002e444cab4e39c025b169cba1b80@epcas2p3.samsung.com>
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

Changes from v2:
- Correct include file path of dt-binding and use full-path
- Reorder clock nodes by unit address

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

