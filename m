Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1561FC433EF
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 19 May 2022 20:29:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236921AbiESU3g (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 19 May 2022 16:29:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43210 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233015AbiESU3f (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 19 May 2022 16:29:35 -0400
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F33494185
        for <linux-samsung-soc@vger.kernel.org>; Thu, 19 May 2022 13:29:32 -0700 (PDT)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20220519202926euoutp02c0b1ecff030ea1b28755056e539cc3e2~wm54qxg1e2727527275euoutp02W
        for <linux-samsung-soc@vger.kernel.org>; Thu, 19 May 2022 20:29:26 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20220519202926euoutp02c0b1ecff030ea1b28755056e539cc3e2~wm54qxg1e2727527275euoutp02W
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1652992166;
        bh=XLdPVraJZN/C3FIXuCBnjKrg2IGMs+dSxgZUxNcMEmM=;
        h=Date:From:Subject:To:Cc:In-Reply-To:References:From;
        b=k13ks/9jSl9hQM7toMEFd7xg522wXsBe/NxFpA9DueX24cHvjsWeQ9ep2buyhE/jV
         Evkqd2DuoWK62mPB7umyIL/rEWjSmWX/5bDQJKsvAL4fXO/Mf5+nZUv6W9fxzKpXCC
         8sB8nXORUduxqdB/CLKcGBHCL66xMyCk5EHr/zDk=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20220519202926eucas1p16d088301a5c5e48371192a7a896153bd~wm54Zp1JF2464924649eucas1p1k;
        Thu, 19 May 2022 20:29:26 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges2new.samsung.com (EUCPMTA) with SMTP id F0.12.09887.6A8A6826; Thu, 19
        May 2022 21:29:26 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20220519202926eucas1p1ab3648bd21ece18d694850ae19266a23~wm54G33U11313513135eucas1p1W;
        Thu, 19 May 2022 20:29:26 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20220519202926eusmtrp2a59a04bca4150004e748bd50dd559d96~wm54GOXmk2746327463eusmtrp2b;
        Thu, 19 May 2022 20:29:26 +0000 (GMT)
X-AuditID: cbfec7f4-471ff7000000269f-d5-6286a8a66d32
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id 4A.E8.09522.6A8A6826; Thu, 19
        May 2022 21:29:26 +0100 (BST)
Received: from [106.210.134.141] (unknown [106.210.134.141]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20220519202925eusmtip28e10a02d3e5894d85cb28dd533001f1b~wm53qu7nW0459104591eusmtip2F;
        Thu, 19 May 2022 20:29:25 +0000 (GMT)
Message-ID: <e8548156-e9cb-c0b7-8c23-fc3e08a31dfc@samsung.com>
Date:   Thu, 19 May 2022 22:29:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0)
        Gecko/20100101 Thunderbird/91.9.0
From:   Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [GIT PULL] clk: samsung: Updates for v5.19
To:     Stephen Boyd <sboyd@kernel.org>,
        Mike Turquette <mturquette@baylibre.com>
Cc:     Chanwoo Choi <cw00.choi@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        "linux-samsung-soc@vger.kernel.org" 
        <linux-samsung-soc@vger.kernel.org>
Content-Language: en-US
In-Reply-To: <CGME20211224203309eucas1p20936b7b0f180707781eacc5fe90a64f8@eucas1p2.samsung.com>
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprIKsWRmVeSWpSXmKPExsWy7djP87rLVrQlGWx5I2dx/ctzVovz5zew
        W3zsucdqMeP8PiaLi6dcLf5d28jiwObx/kYru8emVZ1sHn1bVjF6fN4kF8ASxWWTkpqTWZZa
        pG+XwJXxvecdS8F8voonf3uYGhiPcHcxcnJICJhIvO1sYOli5OIQEljBKLGlZwKU84VR4sTN
        N0wQzmdGiVNvu4EcDrCWpk5GiPhyRolX7Yuhij4ySkx70MoGMpdXwE7i1J/3bCANLAKqEkdW
        uUOEBSVOznzCAmKLCiRJvHlzlRnEZhMwlOg92scIYgsLGEtMbVjPBGKLCPhLLDu1ng1kPrPA
        YUaJDRsfsYMkmAXEJW49mQ9WxCkQJzFnywSouLzE9rdzmEEaJATOcEjsn7eHFeJRF4k/n05C
        2cISr45vYYewZST+74QYJCFQLzF5yhU2CLuDUeLrXjMI21piwqYTYM8wC2hKrN+lDxF2lLh6
        eT80UPgkbrwVhDiBT2LStunMEGFeiY42IYhqFYnfq6ZDLZKS6H7yn2UCo9IspFCZheSxWUie
        mYWwdwEjyypG8dTS4tz01GKjvNRyveLE3OLSvHS95PzcTYzAVHP63/EvOxiXv/qod4iRiYPx
        EKMEB7OSCC9jbkuSEG9KYmVValF+fFFpTmrxIUZpDhYlcd7kzA2JQgLpiSWp2ampBalFMFkm
        Dk6pBiZ+VS5Zx65nDx6wJAtv7Hac8ErtwVKtv69+6xRXLznKvqRczf5o5FYeC7W2xWd5req/
        i32/ZntLbrVk+GumTw9kbCwFUnSTLWP0Z83i3WIW4PZY/FEaz/rdsYtOfumyffjf7/EF4dtv
        T2Ssq2uOffxlyr8ks8lKrJsnXZJ7c3duxn8n89dfz1UZ/v7EH6/6f//cax+5lrGVuZws3Ly0
        cvLp556nYq/GhrclrTlcd0n8AFvM0ZTXgckqJa05+RYGRTtXfXq+6l3Y7dpDBvdn+P9enTaj
        2uWc/IIJdw/krVa7eN60uKHA9oPP0mVXU/+t/ynS3huQ1HBnjteJEu6MXa+7fRKu8Ktyuz66
        N/cGW5epEktxRqKhFnNRcSIABMtcR6QDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrAIsWRmVeSWpSXmKPExsVy+t/xe7rLVrQlGbTf5ra4/uU5q8X58xvY
        LT723GO1mHF+H5PFxVOuFv+ubWRxYPN4f6OV3WPTqk42j74tqxg9Pm+SC2CJ0rMpyi8tSVXI
        yC8usVWKNrQw0jO0tNAzMrHUMzQ2j7UyMlXSt7NJSc3JLEst0rdL0Mv43vOOpWA+X8WTvz1M
        DYxHuLsYOTgkBEwkmjoZuxi5OIQEljJKHH/+kQ0iLiUxv0Wpi5ETyBSW+HOtiw2i5j2jxN4J
        FxhBErwCdhKn/rwHq2cRUJU4ssodIiwocXLmExaQsKhAksSRw/wgYTYBQ4neo31gncICxhJT
        G9YzgdgiAr4SXQdfgo1nFjjKKHFzykGwhJBArMTat49ZQGxmAXGJW0/mg8U5BeIk5myZwA4y
        n1lAXWL9PCGIEnmJ7W/nME9gFJqF5IpZSLpnIXTMQtKxgJFlFaNIamlxbnpusaFecWJucWle
        ul5yfu4mRmBUbTv2c/MOxnmvPuodYmTiYDzEKMHBrCTCy5jbkiTEm5JYWZValB9fVJqTWnyI
        0RQYEBOZpUST84FxnVcSb2hmYGpoYmZpYGppZqwkzutZ0JEoJJCeWJKanZpakFoE08fEwSnV
        wJQffz1lyqGZsxxDSmusuXQ/OfIq13BMdkriXOldG1cd3DyFdeMa4bIUIaUJqmHV+35qOvc9
        mbngUewX1vSAsicfuJYfnFXi8WvNPMY9ka+v/1D0fqf+OnfvteL82W88X2gwTw6zuXE/6ark
        /3jFVc6qNx6kid+SyeIWE9yu+6SLPdZ/64Gy13vWyR1eFvrM+vD0Xu3oFfksu/MimZWSS46b
        KdkuMgmoEbiRbSA89WC3weFHvxy63Y2Luw3VeGUOO8loumtUrk3Z+jfz0+NHE+Yt59ad4Gg0
        42Hnp6DuVY19Pya/bphxaubxPZz//fxtX0yfOuEDZ3FI75I4fxav5lbFpDWm8+45PLu+1iv2
        lBJLcUaioRZzUXEiAOq+spozAwAA
X-CMS-MailID: 20220519202926eucas1p1ab3648bd21ece18d694850ae19266a23
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20211224203309eucas1p20936b7b0f180707781eacc5fe90a64f8
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20211224203309eucas1p20936b7b0f180707781eacc5fe90a64f8
References: <CGME20211224203309eucas1p20936b7b0f180707781eacc5fe90a64f8@eucas1p2.samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org


Hi Stephen, Mike,

The following changes since commit 3123109284176b1532874591f7c81f3837bbdc17:

   Linux 5.18-rc1 (2022-04-03 14:08:21 -0700)

are available in the Git repository at:

   https://git.kernel.org/pub/scm/linux/kernel/git/snawrocki/clk.git tags/clk-v5.19-samsung

for you to fetch changes up to b35f27fe73d8c86fe40125e063b28007e961b862:

   clk: samsung: exynosautov9: add cmu_peric1 clock support (2022-05-10 19:19:34 +0200)

----------------------------------------------------------------
clk/samsung updates for v5.19

  - clock driver for exynosautov9 SoC

----------------------------------------------------------------
Chanho Park (9):
       dt-bindings: clock: add clock binding definitions for Exynos Auto v9
       dt-bindings: clock: add Exynos Auto v9 SoC CMU bindings
       clk: samsung: add top clock support for Exynos Auto v9 SoC
       clk: samsung: exynosautov9: add cmu_core clock support
       clk: samsung: exynosautov9: add cmu_peris clock support
       clk: samsung: exynosautov9: add cmu_busmc clock support
       clk: samsung: exynosautov9: add cmu_fsys2 clock support
       clk: samsung: exynosautov9: add cmu_peric0 clock support
       clk: samsung: exynosautov9: add cmu_peric1 clock support

  .../clock/samsung,exynosautov9-clock.yaml      |  219 +++
  drivers/clk/samsung/Makefile                   |    1 +
  drivers/clk/samsung/clk-exynosautov9.c         | 1733 +++++++++++++++++
  .../dt-bindings/clock/samsung,exynosautov9.h   |  299 +++
  4 files changed, 2252 insertions(+)
  create mode 100644 Documentation/devicetree/bindings/clock/samsung,exynosautov9-clock.yaml
  create mode 100644 drivers/clk/samsung/clk-exynosautov9.c
  create mode 100644 include/dt-bindings/clock/samsung,exynosautov9.h

-- 
Regards,
Sylwester
