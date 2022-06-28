Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66C9FC433EF
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 28 Jun 2022 10:44:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345025AbiF1KoC (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 28 Jun 2022 06:44:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343517AbiF1Kn7 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 28 Jun 2022 06:43:59 -0400
Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74ADA31384
        for <linux-samsung-soc@vger.kernel.org>; Tue, 28 Jun 2022 03:43:54 -0700 (PDT)
Received: from epcas2p2.samsung.com (unknown [182.195.41.54])
        by mailout4.samsung.com (KnoxPortal) with ESMTP id 20220628104348epoutp04d741d8b22f5db360f07ddf6cd13460cf~8wt_fn1B62527425274epoutp04A
        for <linux-samsung-soc@vger.kernel.org>; Tue, 28 Jun 2022 10:43:48 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20220628104348epoutp04d741d8b22f5db360f07ddf6cd13460cf~8wt_fn1B62527425274epoutp04A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1656413028;
        bh=8siWDXvXbIxEDOLi9RbF0Oau9kIZ9qcJ/y4+IQQOilQ=;
        h=From:To:Cc:Subject:Date:References:From;
        b=E7xNZgIQUu4AUxofCo3M6dOOXO14Hxf/k3kUfAFtj3DVU71aYiEMqJ8na7u/XANpe
         QU2wILlsQAFEyBuKLUN64yzP45fOt3Pud4kEpQT7CU+DghY1TY2yhxxM1wk3JAu9VS
         8rY+bK9mCSAKeen9D7GivjvWVfbBx17fqSutw/x4=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
        epcas2p2.samsung.com (KnoxPortal) with ESMTP id
        20220628104347epcas2p2ddc54f0d5455a832cf93ffdaab9f406f~8wt90-9HR1795617956epcas2p2_;
        Tue, 28 Jun 2022 10:43:47 +0000 (GMT)
Received: from epsmges2p3.samsung.com (unknown [182.195.36.92]) by
        epsnrtp1.localdomain (Postfix) with ESMTP id 4LXLmg4Zjcz4x9Pv; Tue, 28 Jun
        2022 10:43:47 +0000 (GMT)
Received: from epcas2p4.samsung.com ( [182.195.41.56]) by
        epsmges2p3.samsung.com (Symantec Messaging Gateway) with SMTP id
        4A.07.09642.36BDAB26; Tue, 28 Jun 2022 19:43:47 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
        epcas2p4.samsung.com (KnoxPortal) with ESMTPA id
        20220628104347epcas2p40f5b491f6c31b07300b5b17fe108bef7~8wt9EvTLZ1212012120epcas2p4g;
        Tue, 28 Jun 2022 10:43:47 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
        epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20220628104347epsmtrp18976b6bff250444cf63f700a37a9888c~8wt9DuI7M0764207642epsmtrp1H;
        Tue, 28 Jun 2022 10:43:47 +0000 (GMT)
X-AuditID: b6c32a47-5f7ff700000025aa-26-62badb63e3eb
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
        epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
        4B.FC.08905.26BDAB26; Tue, 28 Jun 2022 19:43:47 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.9.51]) by
        epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20220628104346epsmtip1db59ff898a2dd72592007d61a364672f~8wt80FQzv1975519755epsmtip1E;
        Tue, 28 Jun 2022 10:43:46 +0000 (GMT)
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
Subject: [PATCH v2 0/3] fixes for exynosautov9 clock
Date:   Tue, 28 Jun 2022 19:41:35 +0900
Message-Id: <20220628104138.152118-1-chanho61.park@samsung.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrBJsWRmVeSWpSXmKPExsWy7bCmhW7y7V1JBkceylk8mLeNzeLyfm2L
        61+es1rMP3KO1aLvxUNmi72vt7JbbHp8jdXiY889VosZ5/cxWVw85WrRuvcIu8XhN+2sFv+u
        bWSxWLXrD6MDn8f7G63sHjtn3WX32LSqk83jzrU9bB6bl9R79G1ZxejxeZNcAHtUtk1GamJK
        apFCal5yfkpmXrqtkndwvHO8qZmBoa6hpYW5kkJeYm6qrZKLT4CuW2YO0MFKCmWJOaVAoYDE
        4mIlfTubovzSklSFjPziElul1IKUnALzAr3ixNzi0rx0vbzUEitDAwMjU6DChOyM5stP2Qpa
        WCtu/uhla2DsZOli5OSQEDCRaHt4hq2LkYtDSGAHo8SRhqOsIAkhgU+MEo+WZkEkvjFKTPh8
        lbGLkQOsY9N8G4j4XkaJe0cbmCCcj4wSP/acYATpZhPQldjy/BUjSEJE4DGTxOEjbWwgCWaB
        G4wSh7cyg9jCQJOe/5oEZrMIqEps67gEVsMrYC/xYsFRNoj75CU2zO9lhogLSpyc+YQFYo68
        RPPW2cwQNRM5JLbsKIGwXSRWT14O1Sss8er4FnYIW0riZX8blF0ssXTWJ7CrJQQaGCUub/sF
        1WAsMetZO9ibzAKaEut36UN8rCxx5BbUWj6JjsN/2SHCvBIdbUIQjeoSB7ZPh4aorET3nM+s
        ELaHxON7jxghARor0XvrGPsERvlZSJ6ZheSZWQh7FzAyr2IUSy0ozk1PLTYqMIbHaXJ+7iZG
        cJLVct/BOOPtB71DjEwcjIcYJTiYlUR4F57ZmSTEm5JYWZValB9fVJqTWnyI0RQYvBOZpUST
        84FpPq8k3tDE0sDEzMzQ3MjUwFxJnNcrZUOikEB6YklqdmpqQWoRTB8TB6dUA5Px59NHZ2W6
        RDPuZL4Xuqddevuu6aoS7CKSFWf3BM+8evfpMknvRW8TdGZkffh9d236/6XLWNc/tO1xaNfZ
        vee1Eg+nq3rI122f5f8vmf7gkvbxI63+hqkuf5pOPV935YNlrusFk+bVEzd/+ta+al/TryNz
        JB7kV/PLPtNZ8yurvkpz6tOLtopnmUuT+vh1klZfaj1+LudBzUalx+FVsyuSGRQ+Hzjxn8v0
        vIT/9ERvFx5vl0nmb+YVcCRN1ZvonH+ibu/ivAkqji0zj66JeJH0LOPZMjlLr3pXXb8L0smd
        TLqFymUKU9uZY7PUAiL5nVawiIsY8mjP7s6XTnp+8M9h5RPxVlJfY6c26biqtCmxFGckGmox
        FxUnAgB3nqJ8OwQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrJLMWRmVeSWpSXmKPExsWy7bCSnG7y7V1JBjPuMFk8mLeNzeLyfm2L
        61+es1rMP3KO1aLvxUNmi72vt7JbbHp8jdXiY889VosZ5/cxWVw85WrRuvcIu8XhN+2sFv+u
        bWSxWLXrD6MDn8f7G63sHjtn3WX32LSqk83jzrU9bB6bl9R79G1ZxejxeZNcAHsUl01Kak5m
        WWqRvl0CV0bz5adsBS2sFTd/9LI1MHaydDFycEgImEhsmm/TxcjJISSwm1Fi7dYwEFtCQFbi
        2bsd7BC2sMT9liOsXYxcQDXvGSUud/QxgyTYBHQltjx/xQiSEBF4ziQxZcVBMIdZ4A6jxJTZ
        s5lAqoSBNjz/NQmsg0VAVWJbxyU2EJtXwF7ixYKjbBAr5CU2zO9lhogLSpyc+YQFxGYGijdv
        nc08gZFvFpLULCSpBYxMqxglUwuKc9Nziw0LDPNSy/WKE3OLS/PS9ZLzczcxgkNfS3MH4/ZV
        H/QOMTJxMB5ilOBgVhLhXXhmZ5IQb0piZVVqUX58UWlOavEhRmkOFiVx3gtdJ+OFBNITS1Kz
        U1MLUotgskwcnFINTP0e7BN8P9T9OWklXq/UFSW1taW3qPPAfp2SP5k72f0E9opdVJ6/ODDU
        /8W7jwcKNh3SsHp9YYZo7TSXp2kpe36FuPvd1xNUnBfYXX/9/k+2yRFLFglPMjNWNGeYohEg
        KpD/bPcKqTNF5s1VJ9+1MjzbtrRZ66Ka7DnOtr7HiQ/vtQTtN/XILn8V8PNin9dax0fsj20s
        LSovLFRizX/ksC/VWfFrmX5Z8cHULpPvz18VbYqO+a0w0/Cnja/k8byZX2btfnXrfMfXRJ4z
        DQc2Zt/2NX00/9BljjUSpdvTeJ/1Vn7pKbu49eu+e/Kfhd4EFCpzfapwXZinHvH1wiTTHCVO
        5RUbZ31ctnvJGq1nfEosxRmJhlrMRcWJAPyP0D7sAgAA
X-CMS-MailID: 20220628104347epcas2p40f5b491f6c31b07300b5b17fe108bef7
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20220628104347epcas2p40f5b491f6c31b07300b5b17fe108bef7
References: <CGME20220628104347epcas2p40f5b491f6c31b07300b5b17fe108bef7@epcas2p4.samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

There are some fixes for exynosautov9 such as clock id numbering,
missing clocks and register offsets.

Changes from v1:
- Add Krzysztof's R-B tags for #1 and #3 patches
- Drop fixes tag of #2 patch

Chanho Park (3):
  dt-bindings: clock: exynosautov9: correct clock numbering of peric0/c1
  clk: samsung: exynosautov9: add missing gate clks for peric0/c1
  clk: samsung: exynosautov9: correct register offsets of peric0/c1

 drivers/clk/samsung/clk-exynosautov9.c        | 28 ++++++----
 .../dt-bindings/clock/samsung,exynosautov9.h  | 56 +++++++++----------
 2 files changed, 46 insertions(+), 38 deletions(-)

-- 
2.36.1

