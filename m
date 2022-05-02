Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FFE7C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  2 May 2022 09:01:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1384000AbiEBJEn (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 2 May 2022 05:04:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1383998AbiEBJEl (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 2 May 2022 05:04:41 -0400
Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB2622C109
        for <linux-samsung-soc@vger.kernel.org>; Mon,  2 May 2022 02:01:07 -0700 (PDT)
Received: from epcas2p4.samsung.com (unknown [182.195.41.56])
        by mailout4.samsung.com (KnoxPortal) with ESMTP id 20220502090105epoutp049cf613feeed87a0830378a9eebe9394f~rPjBit4pf0363303633epoutp04g
        for <linux-samsung-soc@vger.kernel.org>; Mon,  2 May 2022 09:01:05 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20220502090105epoutp049cf613feeed87a0830378a9eebe9394f~rPjBit4pf0363303633epoutp04g
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1651482065;
        bh=FHFRw8iVEn6KWkd+IiUZkgKqT1XB2r/t3GZz91zc85o=;
        h=From:To:Cc:Subject:Date:References:From;
        b=vT3PKercQSYHaTGor9iMTnPX/hg53KjpQXFj8ZdACGvEX+fm2dkjWOB8+IonCd16I
         J1itRP4Bal5zoD19+8Ux34cM5sP/gXSzeludhiRT+j2vEsj5OjnBbbPKf7opKaXz94
         WHmLKuPANJ7XBFEfzNT8LI2wbaUqsAKnZJCVVsrM=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
        epcas2p3.samsung.com (KnoxPortal) with ESMTP id
        20220502090105epcas2p3c397c0232bc5e93bc8f02b2c3c4a3ccc~rPjA432792741227412epcas2p3B;
        Mon,  2 May 2022 09:01:05 +0000 (GMT)
Received: from epsmges2p3.samsung.com (unknown [182.195.36.68]) by
        epsnrtp4.localdomain (Postfix) with ESMTP id 4KsHBQ2VT9z4x9Pw; Mon,  2 May
        2022 09:01:02 +0000 (GMT)
Received: from epcas2p4.samsung.com ( [182.195.41.56]) by
        epsmges2p3.samsung.com (Symantec Messaging Gateway) with SMTP id
        CD.55.10028.CCD9F626; Mon,  2 May 2022 18:01:00 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
        epcas2p1.samsung.com (KnoxPortal) with ESMTPA id
        20220502090100epcas2p16b7838ebe7831adbe9daa05822b45b82~rPi8fvphK2147721477epcas2p18;
        Mon,  2 May 2022 09:01:00 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
        epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20220502090100epsmtrp1945c8630bfd6137b3dba60cdabf7766d~rPi8e41if2529725297epsmtrp1Y;
        Mon,  2 May 2022 09:01:00 +0000 (GMT)
X-AuditID: b6c32a47-573ff7000000272c-7d-626f9dcc5dd1
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
        epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
        4F.EB.08924.CCD9F626; Mon,  2 May 2022 18:01:00 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.9.51]) by
        epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20220502090100epsmtip22abd70be5f4b082cedc877c4d0db2294~rPi8TGbgL1980019800epsmtip2O;
        Mon,  2 May 2022 09:01:00 +0000 (GMT)
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
Subject: [PATCH 00/12] initial clock support for exynosauto v9 SoC
Date:   Mon,  2 May 2022 18:02:18 +0900
Message-Id: <20220502090230.12853-1-chanho61.park@samsung.com>
X-Mailer: git-send-email 2.36.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrGJsWRmVeSWpSXmKPExsWy7bCmhe6ZuflJBo2tJhYP5m1js7i8X9vi
        +pfnrBbzj5xjteh78ZDZYu/rrewWH3vusVrMOL+PyeLiKVeL1r1H2C0Ov2lntfh3bSOLxfM+
        oPiqXX8YHfg83t9oZffYOesuu8emVZ1sHneu7WHz6NuyitHj8ya5ALaobJuM1MSU1CKF1Lzk
        /JTMvHRbJe/geOd4UzMDQ11DSwtzJYW8xNxUWyUXnwBdt8wcoGOVFMoSc0qBQgGJxcVK+nY2
        RfmlJakKGfnFJbZKqQUpOQXmBXrFibnFpXnpenmpJVaGBgZGpkCFCdkZ3zf8YCv4x1sxd8sL
        tgbGddxdjJwcEgImEnt+7mDqYuTiEBLYwSjRM+UlI4TziVHi2MFFLBDOZ0aJiXtussK07F19
        hx0isYtRYtH1lWwQzkdGiftHDjCBVLEJ6Epsef4KbJaIQBezxMW+e2CzmAW2MkocvzELrEpY
        wEni/8+T7CA2i4CqxMT768HivAJ2EpN33AcaywG0T17i3+JQiLCgxMmZT1hAbGagcPPW2cwg
        MyUEejkkzp4/B1XvIvFrtR7EqcISr45vYYewpSRe9rdB2cUSS2d9YoLobWCUuLztFxtEwlhi
        1rN2RpA5zAKaEut36UOMVJY4cgtqLZ9Ex+G/7BBhXomONiGIRnWJA9uns0DYshLdcz5DA8tD
        YvWKW2DDhQRiJZpOT2OdwCg/C8kzs5A8Mwth7wJG5lWMYqkFxbnpqcVGBcbwWE3Oz93ECE6w
        Wu47GGe8/aB3iJGJg/EQowQHs5IIb9uGnCQh3pTEyqrUovz4otKc1OJDjKbA0J3ILCWanA9M
        8Xkl8YYmlgYmZmaG5kamBuZK4rxeKRsShQTSE0tSs1NTC1KLYPqYODilGpimGd+fwXYmy0/h
        l02suk9QxaeqS4V8bStf3Jwj+Ue33793Vfq39e2fX7wtTDqbKOxg3Mz2RurHqd0+28RMpXYw
        MBrIP1t15cGtlTFF7Om8E2x8lfNni087GmwjxVy11fVUjZO9e8HWvQoS6xZkN2w7bKXElr84
        VY7x8/yXN5d98NFn99zy85CiuM9qk5ftC9OP3AvXn84suv2pwR+dNf61siembV2ydbZyivse
        kTUKu37/CXv59afjK9N5maXpa5YFPlm5fbe+7ZN5Mitudv71WH5wRnbUzB0qqRvmXCxJfqq8
        MfddywPVbpbXD+zk6899jTVdPlfm+tPNojOPtp2xv1BxzZ+1wPzV+uRFb7SYlViKMxINtZiL
        ihMB52hUzTkEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrKLMWRmVeSWpSXmKPExsWy7bCSvO6ZuflJBue/iFs8mLeNzeLyfm2L
        61+es1rMP3KO1aLvxUNmi72vt7JbfOy5x2ox4/w+JouLp1wtWvceYbc4/Kad1eLftY0sFs/7
        gOKrdv1hdODzeH+jld1j56y77B6bVnWyedy5tofNo2/LKkaPz5vkAtiiuGxSUnMyy1KL9O0S
        uDK+b/jBVvCPt2LulhdsDYzruLsYOTkkBEwk9q6+w97FyMUhJLCDUaL30St2iISsxLN3O6Bs
        YYn7LUdYQWwhgfeMEsdfBYLYbAK6Eluev2IEaRYRmMAs8ebKB7BJzAI7GSXuvDrFBlIlLOAk
        8f/nSbBJLAKqEhPvr2cCsXkF7CQm77gPVMMBtEFe4t/iUIiwoMTJmU9YQGxmoHDz1tnMExj5
        ZiFJzUKSWsDItIpRMrWgODc9t9iwwCgvtVyvODG3uDQvXS85P3cTIzjktbR2MO5Z9UHvECMT
        B+MhRgkOZiUR3rYNOUlCvCmJlVWpRfnxRaU5qcWHGKU5WJTEeS90nYwXEkhPLEnNTk0tSC2C
        yTJxcEo1MNkrMoUrJRxacscg/O3LF077V7ZMzjh2Ubqgm+X2/eYTvwy6kw+uWllcYnK1/+t5
        81nna2ZPvJns8WVJ8r3jE1eYGu7+Z8utdW5fwIVnDtq3+Jt1bhu9UPrvt0l5wXt3n4UlQu/c
        fSqarl/jmDd19aeNHuwRNlPvRjDZZ6hubl8k43xnf0aH/JuDGgrLr+r8e+qhHDXTqS74SNxH
        i0klAe8lK+rzWJfpRU2Y6TPJ+VnP3AXyub9XbA3tkxCVrs+9t0bv9QPbNxGt7ydM42z4fpz9
        8wnzdcK1cz8VzWN51NRXccRvtv/E+4JBC6tMn1rYnU2W2sloedKr84bxHWPLkLSOH/rCGl5y
        jLbznsoGblZiKc5INNRiLipOBACGnwxv6AIAAA==
X-CMS-MailID: 20220502090100epcas2p16b7838ebe7831adbe9daa05822b45b82
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20220502090100epcas2p16b7838ebe7831adbe9daa05822b45b82
References: <CGME20220502090100epcas2p16b7838ebe7831adbe9daa05822b45b82@epcas2p1.samsung.com>
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

Chanho Park (12):
  dt-bindings: clock: add Exynos Auto v9 SoC CMU bindings
  dt-bindings: clock: add clock binding definitions for Exynos Auto v9
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

 .../clock/samsung,exynosautov9-clock.yaml     |  217 +++
 arch/arm64/boot/dts/exynos/exynosautov9.dtsi  |  103 +-
 drivers/clk/samsung/Makefile                  |    1 +
 drivers/clk/samsung/clk-exynosautov9.c        | 1736 +++++++++++++++++
 include/dt-bindings/clock/exynosautov9.h      |  299 +++
 5 files changed, 2331 insertions(+), 25 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/samsung,exynosautov9-clock.yaml
 create mode 100644 drivers/clk/samsung/clk-exynosautov9.c
 create mode 100644 include/dt-bindings/clock/exynosautov9.h

-- 
2.36.0

