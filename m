Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 833DDC00144
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 27 Jul 2022 02:18:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240082AbiG0CSe (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 26 Jul 2022 22:18:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240096AbiG0CSa (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 26 Jul 2022 22:18:30 -0400
Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 738743C8D0
        for <linux-samsung-soc@vger.kernel.org>; Tue, 26 Jul 2022 19:18:27 -0700 (PDT)
Received: from epcas2p4.samsung.com (unknown [182.195.41.56])
        by mailout4.samsung.com (KnoxPortal) with ESMTP id 20220727021825epoutp046fca7e9af700a6712e6450a2ebcf5de9~FjiAGu2Et1145811458epoutp04g
        for <linux-samsung-soc@vger.kernel.org>; Wed, 27 Jul 2022 02:18:25 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20220727021825epoutp046fca7e9af700a6712e6450a2ebcf5de9~FjiAGu2Et1145811458epoutp04g
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1658888305;
        bh=IUnM+lvh62qAUhosHw83qajWTKFSqswgd/BBAGoO21A=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=aHpryTZkXSgr2fILWotDxHcilZBEKFxEFSRLVhCxFdPnmToFvPoWmTSAMIudK+j69
         mD1JTCtqIqxOjm214CsBsL3mjTWMck6+ZTHVzXWV8kVARaCmz6urydXw4jHi9qMXVH
         sOWEhTJlJj6JY1/l9hBtFY8qkc9vRPsl9J10lcbI=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
        epcas2p3.samsung.com (KnoxPortal) with ESMTP id
        20220727021825epcas2p30d10b8870a63f34a649596e2f65de192~Fjh-d8fX92503125031epcas2p3Z;
        Wed, 27 Jul 2022 02:18:25 +0000 (GMT)
Received: from epsmges2p4.samsung.com (unknown [182.195.36.98]) by
        epsnrtp2.localdomain (Postfix) with ESMTP id 4LsyB86mSdz4x9Q1; Wed, 27 Jul
        2022 02:18:24 +0000 (GMT)
Received: from epcas2p1.samsung.com ( [182.195.41.53]) by
        epsmges2p4.samsung.com (Symantec Messaging Gateway) with SMTP id
        DE.9B.09662.070A0E26; Wed, 27 Jul 2022 11:18:24 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
        epcas2p1.samsung.com (KnoxPortal) with ESMTPA id
        20220727021824epcas2p1f306c36ce58c9c33d4243aa667639398~Fjh_aHmym0147501475epcas2p1N;
        Wed, 27 Jul 2022 02:18:24 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
        epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20220727021824epsmtrp1fd4acf3ebe0455d6198f768225f732a1~Fjh_Zanul3129031290epsmtrp1L;
        Wed, 27 Jul 2022 02:18:24 +0000 (GMT)
X-AuditID: b6c32a48-9e1ff700000025be-ed-62e0a0702d4c
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
        epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
        AE.E7.08802.F60A0E26; Wed, 27 Jul 2022 11:18:24 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.9.51]) by
        epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20220727021823epsmtip1c54b07302886c07f18cadaf0dfcfe67f~Fjh_NuaAL2108621086epsmtip1n;
        Wed, 27 Jul 2022 02:18:23 +0000 (GMT)
From:   Chanho Park <chanho61.park@samsung.com>
To:     Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     Alim Akhtar <alim.akhtar@samsung.com>,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Chanho Park <chanho61.park@samsung.com>
Subject: [RESEND PATCH v2 2/3] clk: samsung: exynosautov9: add missing gate
 clks for peric0/c1
Date:   Wed, 27 Jul 2022 11:13:56 +0900
Message-Id: <20220727021357.152421-3-chanho61.park@samsung.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220727021357.152421-1-chanho61.park@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrFJsWRmVeSWpSXmKPExsWy7bCmqW7BggdJBjcPG1s8mLeNzeLyfm2L
        61+es1rsfb2V3WLT42usFh977rFazDi/j8ni4ilXi8Nv2lkt/l3byGKxatcfRgduj/c3Wtk9
        ds66y+6xaVUnm8eda3vYPDYvqffo27KK0ePzJrkA9qhsm4zUxJTUIoXUvOT8lMy8dFsl7+B4
        53hTMwNDXUNLC3MlhbzE3FRbJRefAF23zBygC5UUyhJzSoFCAYnFxUr6djZF+aUlqQoZ+cUl
        tkqpBSk5BeYFesWJucWleel6eaklVoYGBkamQIUJ2RmzZy9jKljLW3H1+jL2BsZV3F2MnBwS
        AiYSG5YsZuli5OIQEtjBKHFl7hp2COcTo8SOqdvZIJzPjBIfXx9ig2nZdmYlM0RiF6PEi18f
        oao+MkrM/3aSBaSKTUBXYsvzV4wgCRGBFiaJ1oMbWEEcZoE9jBL/lqxlB6kSFkiQOHpsPiOI
        zSKgKvFu80tWEJtXwF7iWfsmFoh98hLXb7Yxg9icAg4S+3omM0HUCEqcnPkErIYZqKZ562yw
        myQEJnJIzHg8D6rZRWLb+aVQtrDEq+Nb2CFsKYmX/W1QdrHE0lmfmCCaGxglLm/7BfWpscSs
        Z+1A13EAbdCUWL9LH8SUEFCWOHILai+fRMfhv+wQYV6JjjYhiEZ1iQPbp0NtlZXonvOZFcL2
        kPjdtB0a2pMZJZ7d+sw0gVFhFpJ3ZiF5ZxbC4gWMzKsYxVILinPTU4uNCkzgkZycn7uJEZxo
        tTx2MM5++0HvECMTB+MhRgkOZiUR3oTo+0lCvCmJlVWpRfnxRaU5qcWHGE2BgT2RWUo0OR+Y
        6vNK4g1NLA1MzMwMzY1MDcyVxHm9UjYkCgmkJ5akZqemFqQWwfQxcXBKNTBFxcV4Sqocuvjs
        nNjnmMdv3DTzDSvKNvRKsq9cqH94V0z16w/vORY5vrD2YCxYu60xN1bkygy9M18nuvF9XerD
        v0t86z7hRPWi2ExNn2kKEw4d154+47Rfnf05//Xr8oNrnl9ZXrtjD3dSVWvY/5k/PyWVlDPz
        XHig+9aee36D4Zsz04VsHunmpn4rFeQ6/y3QfrHJGXGGxNL8Y6+nbSt6IvqFN6/k05eV0S5u
        klIZDAc2n7zgHxLsuZtT+OiDqIwS6UZxv73163nWV9c/1jzBZR1R2nD969trOstv9Xy6svXZ
        pMj/xsnJ1vc/nPY609vGOmHB3blH54scOlD8Qu6obv7vfSxTnx28v/Sd/0EpJZbijERDLeai
        4kQAcB/SCD0EAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrCLMWRmVeSWpSXmKPExsWy7bCSnG7BggdJBusPMFo8mLeNzeLyfm2L
        61+es1rsfb2V3WLT42usFh977rFazDi/j8ni4ilXi8Nv2lkt/l3byGKxatcfRgduj/c3Wtk9
        ds66y+6xaVUnm8eda3vYPDYvqffo27KK0ePzJrkA9igum5TUnMyy1CJ9uwSujNmzlzEVrOWt
        uHp9GXsD4yruLkZODgkBE4ltZ1YydzFycQgJ7GCUOH5mEiNEQlbi2bsd7BC2sMT9liOsEEXv
        GSVmt/SxgiTYBHQltjx/xQiSEBHoYJKYteIiWBWzwD5GibnHNzGDVAkLxEnMON0LNopFQFXi
        3eaXYN28AvYSz9o3sUCskJe4frMNrJ5TwEFiX89kJhBbCKhm7Y/j7BD1ghInZz4Bq2cGqm/e
        Opt5AqPALCSpWUhSCxiZVjFKphYU56bnFhsWGOWllusVJ+YWl+al6yXn525iBEeEltYOxj2r
        PugdYmTiYDzEKMHBrCTCmxB9P0mINyWxsiq1KD++qDQntfgQozQHi5I474Wuk/FCAumJJanZ
        qakFqUUwWSYOTqkGJsFjNw8VGR+c9S/MoZ2Dt1b+7NZNAjGvHpw6fKZSQoRthdXnD+ttWFT2
        HuD/MfdUcbzt+QI1n6q/ZUHNmX/2bP8189FKZwUT+R+MvLPEbBjtD1furVr6xPVuvFJMRF/n
        TJ8fL/3Wdtzzrv7xcXL3GrOnV9u2qBveUWpUsOaYxxugJc079aIY413J5cskjsnsNOF33pDM
        FSDL9aft1/nEYtZbGUHTT99/JMbcu8eUzy1F0pQrI7hUYf8lpSv/k74e+zNh8tXzk1mWa06e
        KufmuuPw6go7r9xQAZmrgm7yq7U3zZ/ImJoU9OHOplUZxeaL0+0seN4mbjyc//3N7fsmrL/+
        Kf/mOu/ipptlkL6lVYmlOCPRUIu5qDgRAOUolp/3AgAA
X-CMS-MailID: 20220727021824epcas2p1f306c36ce58c9c33d4243aa667639398
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20220727021824epcas2p1f306c36ce58c9c33d4243aa667639398
References: <20220727021357.152421-1-chanho61.park@samsung.com>
        <CGME20220727021824epcas2p1f306c36ce58c9c33d4243aa667639398@epcas2p1.samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

"gout_peric0_pclk_1" and "gout_peric1_pclk_1" should be added to peric0
and peric1 respectively.

Signed-off-by: Chanho Park <chanho61.park@samsung.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Acked-by: Chanwoo Choi <cw00.choi@samsung.com>
---
 drivers/clk/samsung/clk-exynosautov9.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/clk/samsung/clk-exynosautov9.c b/drivers/clk/samsung/clk-exynosautov9.c
index d9e1f8e4a7b4..c5a4e1bee711 100644
--- a/drivers/clk/samsung/clk-exynosautov9.c
+++ b/drivers/clk/samsung/clk-exynosautov9.c
@@ -1330,6 +1330,10 @@ static const struct samsung_gate_clock peric0_gate_clks[] __initconst = {
 	     "mout_peric0_bus_user",
 	     CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_PCLK_0,
 	     21, 0, 0),
+	GATE(CLK_GOUT_PERIC0_PCLK_1, "gout_peric0_pclk_1",
+	     "mout_peric0_bus_user",
+	     CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_PCLK_1,
+	     21, 0, 0),
 	GATE(CLK_GOUT_PERIC0_PCLK_2, "gout_peric0_pclk_2",
 	     "mout_peric0_bus_user",
 	     CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_PCLK_2,
@@ -1581,6 +1585,10 @@ static const struct samsung_gate_clock peric1_gate_clks[] __initconst = {
 	     "mout_peric1_bus_user",
 	     CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP0_IPCLKPORT_PCLK_0,
 	     21, 0, 0),
+	GATE(CLK_GOUT_PERIC1_PCLK_1, "gout_peric1_pclk_1",
+	     "mout_peric1_bus_user",
+	     CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP0_IPCLKPORT_PCLK_1,
+	     21, 0, 0),
 	GATE(CLK_GOUT_PERIC1_PCLK_2, "gout_peric1_pclk_2",
 	     "mout_peric1_bus_user",
 	     CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP0_IPCLKPORT_PCLK_2,
-- 
2.37.1

