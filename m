Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81434C433FE
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 13 Sep 2021 16:12:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 60D9D60F9B
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 13 Sep 2021 16:12:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345685AbhIMQNY (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 13 Sep 2021 12:13:24 -0400
Received: from mailout1.w1.samsung.com ([210.118.77.11]:33748 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344708AbhIMQNY (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 13 Sep 2021 12:13:24 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20210913161207euoutp01fa72f62e7f34955f21e257e4854af64b~kbaaWuW970975809758euoutp01Q
        for <linux-samsung-soc@vger.kernel.org>; Mon, 13 Sep 2021 16:12:07 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20210913161207euoutp01fa72f62e7f34955f21e257e4854af64b~kbaaWuW970975809758euoutp01Q
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1631549527;
        bh=3q5cIzXlS7H9vos2ZaHlyyFfhPIx5wFlAPjNrYRMQ7U=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=e6MgHLkQVcYX+4TTSbLg49BlU9DmuzM9wAIwJKEZDtB4YQwZ+Kfg624Zdz88LEWn+
         Ujt2Oncy/0M7b2DZC9CFvbAElg6TzmPxZ4RPcDy0Ghm5OgQyvams1ljdljmXKAJCrZ
         FotEvapzyj8wyKy16ZCmeR/zZ8kBKzmupgfESwVM=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20210913161207eucas1p1227dff5e106648df83ddc3ecd57d84ac~kbaaNo20C2265622656eucas1p11;
        Mon, 13 Sep 2021 16:12:07 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges2new.samsung.com (EUCPMTA) with SMTP id 62.EE.42068.6587F316; Mon, 13
        Sep 2021 17:12:07 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20210913161206eucas1p140b9845a8879f234a810cc9b19364325~kbaZ1KijE2267522675eucas1p1D;
        Mon, 13 Sep 2021 16:12:06 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20210913161206eusmtrp16e4870bd5477571a86f838310bc11d47~kbaZ0UIwM0942909429eusmtrp1k;
        Mon, 13 Sep 2021 16:12:06 +0000 (GMT)
X-AuditID: cbfec7f4-c71ff7000002a454-7d-613f7856fa0c
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id D6.81.20981.6587F316; Mon, 13
        Sep 2021 17:12:06 +0100 (BST)
Received: from [106.210.134.141] (unknown [106.210.134.141]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20210913161206eusmtip17a8bcde086c323b33db16bcd52949ad1~kbaZNYgQG2839728397eusmtip1J;
        Mon, 13 Sep 2021 16:12:06 +0000 (GMT)
Subject: Re: [PATCH] clk: samsung: exynos4412-isp: Make use of the helper
 function devm_platform_ioremap_resource()
To:     Cai Huoqing <caihuoqing@baidu.com>
Cc:     Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
From:   Sylwester Nawrocki <s.nawrocki@samsung.com>
Message-ID: <55cd0f17-93b5-c05f-0995-0c7141113a6a@samsung.com>
Date:   Mon, 13 Sep 2021 18:12:05 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0)
        Gecko/20100101 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20210907085107.4203-1-caihuoqing@baidu.com>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrFKsWRmVeSWpSXmKPExsWy7djPc7rhFfaJBusOM1qsufeXzeL6l+es
        Fhvf/mCy2PT4GqvFx557rBaXd81hs5hxfh+TxcVTrhb/rm1ksVi16w+jA5fHl6XNzB7vb7Sy
        e8xq6GXz2DnrLrvHplWdbB6bl9R79G1ZxejxeZNcAEcUl01Kak5mWWqRvl0CV8a+Sb8YC7qY
        K56cn8PWwHiaqYuRk0NCwETiRX8XWxcjF4eQwApGiWMb/zFBOF8YJdav2MYC4XxmlDg9eyU7
        TMujaX+hWpYzSvxd9hksISTwkVFi99TMLkYODmGBUonVK0NBwiICahJTJk1nB6lnFnjAJHFr
        9ROw3WwChhK9R/sYQWxeATuJN1e3sIHYLAKqEgu3zAOrERVIlpj2t4kZokZQ4uTMJywgNqeA
        pcT8U6fB4swC4hK3nsxngrDlJba/ncMMskxCoJ1T4vKbEywQV7tIND/byghhC0u8Or4F6hsZ
        idOTe1ggGpoZJXp232aHcCYwStw/vgCqw1rizrlfbCCvMQtoSqzfpQ8RdpS4en4JC0hYQoBP
        4sZbQYgj+CQmbZvODBHmlehoE4KoVpH4vWo6NNylJLqf/GeZwKg0C8lrs5C8MwvJO7MQ9i5g
        ZFnFKJ5aWpybnlpslJdarlecmFtcmpeul5yfu4kRmLxO/zv+ZQfj8lcf9Q4xMnEwHmKU4GBW
        EuHd9sY2UYg3JbGyKrUoP76oNCe1+BCjNAeLkjhv0pY18UIC6YklqdmpqQWpRTBZJg5OqQam
        nnPSn1rtPdyOfHeyk5TiuXhjZYv31b4JgSXOux5dnP/dMHChgf1607szZu7arZn3MPCHs/+U
        tMS1T/dn6Hk6PXu1sDKXbxm7/6zVD6Quqim1RJY+idkpF65moPzd4InaowsXp50ykdP6pLRu
        W/6bIO3jHw8Hdii3nHt6682cQmWubEvVub9W6riw9q2acJp7Qlhy/4Tr4vv+TJCUvL5zxfWw
        vp/Vrr6/kz+c8TY59Px9W6nBBtPjH/cEdWp6yltGysWmJ5zjm2ls/ban+cpV8x+5Ktv+RTz0
        Wq/ivChV/h9j7rVtryP7H5iXRWu8uRwt+vhn4b2VIjei9LpK3vWsDJhf2uSwKU5VUfGF6542
        JZbijERDLeai4kQA91Bb1s0DAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrDIsWRmVeSWpSXmKPExsVy+t/xu7phFfaJBjPb1CzW3PvLZnH9y3NW
        i41vfzBZbHp8jdXiY889VovLu+awWcw4v4/J4uIpV4t/1zayWKza9YfRgcvjy9JmZo/3N1rZ
        PWY19LJ57Jx1l91j06pONo/NS+o9+rasYvT4vEkugCNKz6Yov7QkVSEjv7jEVina0MJIz9DS
        Qs/IxFLP0Ng81srIVEnfziYlNSezLLVI3y5BL2PfpF+MBV3MFU/Oz2FrYDzN1MXIySEhYCLx
        aNpfti5GLg4hgaWMEms721i7GDmAElIS81uUIGqEJf5c64Kqec8osW/GZbAaYYFSidUrQ0Fq
        RATUJKZMms4OUsMs8IBJYsqvM+wQDT2MEo9udYBtYxMwlOg92scIYvMK2Em8ubqFDcRmEVCV
        WLhlHliNqECyxNvX35kgagQlTs58wgJicwpYSsw/dZoZxGYWUJf4M+8SlC0ucevJfCYIW15i
        +9s5zBMYhWYhaZ+FpGUWkpZZSFoWMLKsYhRJLS3OTc8tNtIrTswtLs1L10vOz93ECIzWbcd+
        btnBuPLVR71DjEwcjIcYJTiYlUR4t72xTRTiTUmsrEotyo8vKs1JLT7EaAr0z0RmKdHkfGC6
        yCuJNzQzMDU0MbM0MLU0M1YS5zU5siZeSCA9sSQ1OzW1ILUIpo+Jg1OqgWl2BuuC6felRE3U
        d0/R6vNItf8vKmzj8Oscfwq3lmJCy/H+8kUbZW2Z75u+lL2xMmTDosANlp3/bLQvtpRa73v8
        eGZV3VSzl8e19VODElZLC8806b6bLjndbOuUtjNTY7cw+b3NExU78+PQnk6lPSVSF/JW9Zeu
        4qs/duHAn0eOgrIPc0//WRitFe3OX3LM/d/SS68f/3q2W+LoNmOVJbpy75aatDrlJy28W63A
        2X8iaC/TqoXvWO8FWG1dFdzy5Kd0H29SntQOy4vWsk/v/DAqN/noNvmJZUH6Bd0y9ZbPE0KZ
        ZuW7f1etL2+QsRI7qxeo9Uvj9oLXP7n38NrMZQ3dLt6gv62V85Xrcj/3UCWW4oxEQy3mouJE
        AFHOstNfAwAA
X-CMS-MailID: 20210913161206eucas1p140b9845a8879f234a810cc9b19364325
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20210907085116eucas1p2774a348493c0eed6762352afeaae5c45
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20210907085116eucas1p2774a348493c0eed6762352afeaae5c45
References: <CGME20210907085116eucas1p2774a348493c0eed6762352afeaae5c45@eucas1p2.samsung.com>
        <20210907085107.4203-1-caihuoqing@baidu.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 07.09.2021 10:51, Cai Huoqing wrote:
> Use the devm_platform_ioremap_resource() helper instead of
> calling platform_get_resource() and devm_ioremap_resource()
> separately

Thanks for the patch. I have applied it with summary line changed to 
"clk: samsung: exynos4412-isp: Make use of devm_platform_ioremap_resource()"
so it doesn't exceed 75 characters.
-- 
Regards,
Sylwester
