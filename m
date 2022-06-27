Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 982BBCCA482
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 27 Jun 2022 00:54:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229463AbiF0AyZ (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sun, 26 Jun 2022 20:54:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229468AbiF0AyY (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 26 Jun 2022 20:54:24 -0400
Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 680642DF1
        for <linux-samsung-soc@vger.kernel.org>; Sun, 26 Jun 2022 17:54:18 -0700 (PDT)
Received: from epcas2p3.samsung.com (unknown [182.195.41.55])
        by mailout4.samsung.com (KnoxPortal) with ESMTP id 20220627005415epoutp04d1c9ecf42f13a8cf6f734eb97d0713f4~8VB77hd-G1280212802epoutp04M
        for <linux-samsung-soc@vger.kernel.org>; Mon, 27 Jun 2022 00:54:15 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20220627005415epoutp04d1c9ecf42f13a8cf6f734eb97d0713f4~8VB77hd-G1280212802epoutp04M
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1656291255;
        bh=VyGKq5/V7sBKRWikplOQYWFBGryszyHFEP4fSH4V+xg=;
        h=From:To:Cc:Subject:Date:References:From;
        b=Eg2Wa6pjikD6tORIreh5SJgaaxG054A8j86OUToM6lglOMD3RW8Ilt5wjgO1eAvKA
         OW46H8iYd6rbta3m0Q2/O/IF0379m77cQommgEjyW/7yWQKihima3og5E3OwQZZU5d
         rho8b4Iyv5p+k9/EA7dMOcUr7CujGDv/yE4wuqjM=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
        epcas2p1.samsung.com (KnoxPortal) with ESMTP id
        20220627005413epcas2p1474c27ba236c90f2ea25bc32bd81e6ed~8VB69FT623199031990epcas2p1v;
        Mon, 27 Jun 2022 00:54:13 +0000 (GMT)
Received: from epsmges2p2.samsung.com (unknown [182.195.36.68]) by
        epsnrtp1.localdomain (Postfix) with ESMTP id 4LWTks4c3zz4x9Q5; Mon, 27 Jun
        2022 00:54:13 +0000 (GMT)
Received: from epcas2p2.samsung.com ( [182.195.41.54]) by
        epsmges2p2.samsung.com (Symantec Messaging Gateway) with SMTP id
        90.9C.09650.5BFF8B26; Mon, 27 Jun 2022 09:54:13 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
        epcas2p3.samsung.com (KnoxPortal) with ESMTPA id
        20220627005413epcas2p3b3a22da2bf40b77b942cb2c6427135d5~8VB6LG_ve1545015450epcas2p3R;
        Mon, 27 Jun 2022 00:54:13 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
        epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20220627005413epsmtrp1d09a5c595ac5dfbd525fae81071f6c26~8VB6KOWWv0629806298epsmtrp1t;
        Mon, 27 Jun 2022 00:54:13 +0000 (GMT)
X-AuditID: b6c32a46-0a3ff700000025b2-83-62b8ffb5af63
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
        epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
        88.1A.08802.4BFF8B26; Mon, 27 Jun 2022 09:54:13 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.9.51]) by
        epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20220627005412epsmtip239c15c288929643923b2f7a37348fb93~8VB58Zr131353713537epsmtip2W;
        Mon, 27 Jun 2022 00:54:12 +0000 (GMT)
From:   Chanho Park <chanho61.park@samsung.com>
To:     Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Alim Akhtar <alim.akhtar@samsung.com>,
        linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Chanho Park <chanho61.park@samsung.com>
Subject: [PATCH 0/3] fixes for exynosautov9 clock
Date:   Mon, 27 Jun 2022 09:52:07 +0900
Message-Id: <20220627005210.6473-1-chanho61.park@samsung.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrJJsWRmVeSWpSXmKPExsWy7bCmme7W/zuSDBrfK1k8mLeNzeLyfm2L
        61+es1rMP3KO1aLvxUNmi72vt7JbbHp8jdXiY889VosZ5/cxWVw85WrRuvcIu8XhN+2sFv+u
        bWSxWLXrD6MDn8f7G63sHjtn3WX32LSqk83jzrU9bB6bl9R79G1ZxejxeZNcAHtUtk1GamJK
        apFCal5yfkpmXrqtkndwvHO8qZmBoa6hpYW5kkJeYm6qrZKLT4CuW2YO0MFKCmWJOaVAoYDE
        4mIlfTubovzSklSFjPziElul1IKUnALzAr3ixNzi0rx0vbzUEitDAwMjU6DChOyMSQt2MBUs
        YKlYeeo4awPjPuYuRk4OCQETiX1v9rN1MXJxCAnsYJSY3XmaBcL5xCjR138AKvOZUWJ6ZzMj
        TMvZDasYIRK7GCWOzVnFBpIQEvjIKDH/PQeIzSagK7Hl+SuwIhGBx0wSh4+0gRUxC9xglDi8
        FWy5sIChxOLjzUBxDg4WAVWJ9a/9QMK8ArYSK7bNYYJYJi+xYX4vM0RcUOLkzCcsEGPkJZq3
        zmYGmS8hMJFDYm37H6jrXCR2/m5ghbCFJV4d38IOYUtJvOxvg7KLJZbO+sQE0dzAKHF52y82
        iISxxKxn7YwgBzELaEqs36UPYkoIKEscuQW1l0+i4/Bfdogwr0RHmxBEo7rEge3TWSBsWYnu
        OZ+hLvCQWPjiEzMkeGIl7ky6xjiBUX4Wkm9mIflmFsLeBYzMqxjFUguKc9NTi40KjOCRmpyf
        u4kRnGa13HYwTnn7Qe8QIxMH4yFGCQ5mJRHe19e3JgnxpiRWVqUW5ccXleakFh9iNAUG70Rm
        KdHkfGCizyuJNzSxNDAxMzM0NzI1MFcS5/VK2ZAoJJCeWJKanZpakFoE08fEwSnVwHT4nPB9
        /sOSzotEJ1vO/VX/TefMa717dQcazj02i51Q8XRTxpbTdqETfmjHKFev0quMmL21+I3x/Nxi
        1R1TJwhOkPshNK1QJyjju6yT/rMd3rPCewO3x8ZPr/D/u+V5umX4H3ux9fLW+jKHZju59jwp
        nzRllt/hOQ8rprJkK/1aX1Inteh+ZFikf/6B5MibInVLNG+nMJXe1f992fnixN/vYxI1yk9c
        lExu5w4Vi01J93aRsVKtbXo75SXTdF/DSZH5ywrvrU7dcshL1S72qJGLKlsHI0dPfvHjxvZr
        c1dtZsj1EGDucinMuz5BLH2f4rtvrkZMbUbmWk9tftktn63I/m1m/8w2tf0ebxzblFiKMxIN
        tZiLihMB9gKphjwEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrFLMWRmVeSWpSXmKPExsWy7bCSvO7W/zuSDO63M1s8mLeNzeLyfm2L
        61+es1rMP3KO1aLvxUNmi72vt7JbbHp8jdXiY889VosZ5/cxWVw85WrRuvcIu8XhN+2sFv+u
        bWSxWLXrD6MDn8f7G63sHjtn3WX32LSqk83jzrU9bB6bl9R79G1ZxejxeZNcAHsUl01Kak5m
        WWqRvl0CV8akBTuYChawVKw8dZy1gXEfcxcjJ4eEgInE2Q2rGLsYuTiEBHYwSszu+MIIkZCV
        ePZuBzuELSxxv+UIK0TRe0aJhav/MYEk2AR0JbY8fwXWLSLwnEliyoqDYA6zwB1GiSmzZ4NV
        CQsYSiw+3szWxcjBwSKgKrH+tR9ImFfAVmLFtjlMEBvkJTbM72WGiAtKnJz5hAXEZgaKN2+d
        zTyBkW8WktQsJKkFjEyrGCVTC4pz03OLDQuM8lLL9YoTc4tL89L1kvNzNzGCg19LawfjnlUf
        9A4xMnEwHmKU4GBWEuF9fX1rkhBvSmJlVWpRfnxRaU5q8SFGaQ4WJXHeC10n44UE0hNLUrNT
        UwtSi2CyTBycUg1MNhala2WXL7bp9dy0vrDuimTZu7z10l6TnO5P+WL5Yp+yLf++OW6W+VP9
        pcsyY3wzq5Rn2Elu8Os4Zfx/O8fS6x1T5W3+R0w3WFjl5aXNneGzZPuMqsaPq+oDT1hvceIP
        3ufxvfUrw8rqgln3tP/9LZZ9dzH5+4ytH7zfv7I7qp737+ui/uvdj/Zsraxcl7izMJfD2EnP
        iS+yjyn+u2yK2YmjJ2f3tIcfVF6aHaCw+It4+6k5m+Na1q1UO3jy3c5b/2fyTmWT/vHkX8nr
        d994BeQ22NxTWhhz68cEkVwFM3kB1ifyDLfKbDw+Xr7rskm+9M//FjeTVoMzz1/k6aRJPzN7
        cOeMutE9rUfSLzKfKLEUZyQaajEXFScCACNUEljtAgAA
X-CMS-MailID: 20220627005413epcas2p3b3a22da2bf40b77b942cb2c6427135d5
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20220627005413epcas2p3b3a22da2bf40b77b942cb2c6427135d5
References: <CGME20220627005413epcas2p3b3a22da2bf40b77b942cb2c6427135d5@epcas2p3.samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

There are some fixes for exynosautov9 such as clock id numbering,
missing clocks and register offsets.

Chanho Park (3):
  dt-bindings: clock: exynosautov9: correct clock numbering of peric0/c1
  clk: samsung: exynosautov9: add missing gate clks for peric0/c1
  clk: samsung: exynosautov9: correct register offsets of peric0/c1

 drivers/clk/samsung/clk-exynosautov9.c        | 28 ++++++----
 .../dt-bindings/clock/samsung,exynosautov9.h  | 56 +++++++++----------
 2 files changed, 46 insertions(+), 38 deletions(-)

-- 
2.36.1

