Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2374CC433FE
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 13 Sep 2021 16:15:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 07ADF60F9B
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 13 Sep 2021 16:15:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239161AbhIMQQc (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 13 Sep 2021 12:16:32 -0400
Received: from mailout2.w1.samsung.com ([210.118.77.12]:53963 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345948AbhIMQQV (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 13 Sep 2021 12:16:21 -0400
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20210913161504euoutp02bc5269eee5aaee681161e77d84d71766~kbc-SShyH2139121391euoutp02I
        for <linux-samsung-soc@vger.kernel.org>; Mon, 13 Sep 2021 16:15:04 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20210913161504euoutp02bc5269eee5aaee681161e77d84d71766~kbc-SShyH2139121391euoutp02I
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1631549704;
        bh=DPUui0cw24+wtr9YGuON7HIayRcOqnwG7XV+SGOnE6U=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=nYgE/EpcRilKBOgqmpHTnVbWNo5bE6pUbmZmG0f0JPSfTUvb4uFx/t3j7k4gjvLJ3
         l048L8wLHsOTnlET16nTfkQsLfIR6wZpymZjTlZq5D8D/03H3MVMdnuDTYiB5pyWl5
         ai8tzwxrZ5rtkuK926zJFNZsnapY21JVLj8/JVcE=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20210913161503eucas1p126a25a1dd47d8f06f29364b04166cc8e~kbc_3Pr0U1077510775eucas1p1v;
        Mon, 13 Sep 2021 16:15:03 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges1new.samsung.com (EUCPMTA) with SMTP id 14.F7.45756.7097F316; Mon, 13
        Sep 2021 17:15:03 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20210913161503eucas1p2e285ddaddd93d45cf40a2df7045b163e~kbc_Uplc82983229832eucas1p2Q;
        Mon, 13 Sep 2021 16:15:03 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20210913161503eusmtrp2a91ddad727cf0107bbe87ac449f9912d~kbc_T5adA1192511925eusmtrp2E;
        Mon, 13 Sep 2021 16:15:03 +0000 (GMT)
X-AuditID: cbfec7f2-7bdff7000002b2bc-9c-613f7907c83f
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id FC.C1.20981.7097F316; Mon, 13
        Sep 2021 17:15:03 +0100 (BST)
Received: from [106.210.134.141] (unknown [106.210.134.141]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20210913161502eusmtip12062f872dbb1751cd33fdca276613fee~kbc9vnPJC2726027260eusmtip1G;
        Mon, 13 Sep 2021 16:15:02 +0000 (GMT)
Subject: Re: [PATCH] clk: samsung: s5pv210-audss: Make use of the helper
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
Message-ID: <ec73d979-e3dc-8fd9-9af1-d7c0fee9c108@samsung.com>
Date:   Mon, 13 Sep 2021 18:15:02 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0)
        Gecko/20100101 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20210907085122.4305-1-caihuoqing@baidu.com>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrFKsWRmVeSWpSXmKPExsWy7djPc7rslfaJBsdX6FusufeXzeL6l+es
        Fhvf/mCy2PT4GqvFx557rBaXd81hs5hxfh+TxcVTrhb/rm1ksVi16w+jA5fHl6XNzB7vb7Sy
        e8xq6GXz2DnrLrvHplWdbB6bl9R79G1ZxejxeZNcAEcUl01Kak5mWWqRvl0CV8aVhQ+YCl4w
        Vcy+85qlgXE9UxcjJ4eEgInEv2erGLsYuTiEBFYwSsxZdYgVwvnCKLH+2S82COczo8SFr1MY
        YVpuND+CSixnlOg4PgOq/yOjRNeFqWBVwgIlEmdPz2MFsUUE1CSmTJrODlLELPCASeLW6idg
        29kEDCV6j/YBNXBw8ArYSXyYnQcSZhFQldjyfQnYHFGBZIlpf5uYQWxeAUGJkzOfsIDYnAKW
        Em8nXQYbwywgLnHryXwoW15i+9s5zCC7JAS6OSU2PHjKBDJfQsBF4udbbYgPhCVeHd/CDmHL
        SPzfCdILUt/MKNGz+zY7hDOBUeL+8QVQP1tL3DkHCgwOoA2aEut36UOEHSU6d79ghZjPJ3Hj
        rSDEDXwSk7ZNZ4YI80p0tAlBVKtI/F41HRruUhLdT/6zTGBUmoXks1lIvpmF5JtZCHsXMLKs
        YhRPLS3OTU8tNsxLLdcrTswtLs1L10vOz93ECExep/8d/7SDce6rj3qHGJk4GA8xSnAwK4nw
        bntjmyjEm5JYWZValB9fVJqTWnyIUZqDRUmcd9XsNfFCAumJJanZqakFqUUwWSYOTqkGpoBa
        mZa5V/0EvToSNQ/VSFZF3E+5vPTP9qzPyzUefUp5+nWuxwrbp0tSl1nO8tVcxRdgvjhaomzy
        ze5P/58En1n3VXeTtF9cWO2Mhmc1Kyue+O+Z9iHd4uXq4zz2t/YL+2xNXn/ZXyC0zjhF7vyq
        d1LHEwTPfhD9EWPJ+urQusOHFtdtmW16V2Xb8SdKe1543i12KCtLv3y2VJHdK/bviuR908J1
        p9lcNXx7VfjSV6nc8u8pSzy7rJ/fWW1x4bwNV/z3s1Mm74lhUTrtbbfqp8KlvPW5EXrbFj5n
        /DaH23v/LMFNP9+n/LDRmK/zeGHAd3nR+xxn80sX1my32qN+Ma/qnJO9x6GPnzmZ5aLO8r9W
        YinOSDTUYi4qTgQAiFIdec0DAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrDIsWRmVeSWpSXmKPExsVy+t/xu7rslfaJBvM381msufeXzeL6l+es
        Fhvf/mCy2PT4GqvFx557rBaXd81hs5hxfh+TxcVTrhb/rm1ksVi16w+jA5fHl6XNzB7vb7Sy
        e8xq6GXz2DnrLrvHplWdbB6bl9R79G1ZxejxeZNcAEeUnk1RfmlJqkJGfnGJrVK0oYWRnqGl
        hZ6RiaWeobF5rJWRqZK+nU1Kak5mWWqRvl2CXsaVhQ+YCl4wVcy+85qlgXE9UxcjJ4eEgInE
        jeZHbF2MXBxCAksZJU7372XsYuQASkhJzG9RgqgRlvhzrQuq5j2jxO25r1hAEsICJRJnT89j
        BbFFBNQkpkyazg5SxCzwgEliyq8z7BAdPYwSB86eA6tiEzCU6D3aB7aBV8BO4sPsPJAwi4Cq
        xJbvSxhBbFGBZIm3r7+DXccrIChxcuYTsGWcApYSbyddBoszC6hL/Jl3iRnCFpe49WQ+VFxe
        YvvbOcwTGIVmIWmfhaRlFpKWWUhaFjCyrGIUSS0tzk3PLTbSK07MLS7NS9dLzs/dxAiM1m3H
        fm7Zwbjy1Ue9Q4xMHIyHGCU4mJVEeLe9sU0U4k1JrKxKLcqPLyrNSS0+xGgK9M9EZinR5Hxg
        usgriTc0MzA1NDGzNDC1NDNWEuc1ObImXkggPbEkNTs1tSC1CKaPiYNTqoFJIEjr+7XPj9uN
        hQz8nzQGlmffto0WnZciqRW91PXb2bJvFT8FcxUY2091JC7SrP79eWvu/5xX2k4XN/3an9Xi
        /PeF53lFg2c12at2/a096MMnGmkY9n2r1q2KBRwRi69u70q67nDve+uG9zfTdluyT9RourHC
        f7bfi5cvRHmZTAVWZB4Q0Xq+Z1PR2Y07r3zLc3ZhMFuaf95dYq/ajMf9nIYa05739H9feSX6
        Sk2Y0waurcmzTuj4JLFGuL4wkJgfu6hzXfi5sjkPmL74njB9UFEiJfVRep7i/n37Z9+adPXM
        CXnJh4KlTVHsnSxms58/jow9fuUo4/INuW+/TyxfJ7CWQ5Vnf5Jufvh1f4kqJZbijERDLeai
        4kQA7uIroV8DAAA=
X-CMS-MailID: 20210913161503eucas1p2e285ddaddd93d45cf40a2df7045b163e
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20210907085132eucas1p27810ad1f87867d1944b1c1b2c4b4abef
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20210907085132eucas1p27810ad1f87867d1944b1c1b2c4b4abef
References: <CGME20210907085132eucas1p27810ad1f87867d1944b1c1b2c4b4abef@eucas1p2.samsung.com>
        <20210907085122.4305-1-caihuoqing@baidu.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 07.09.2021 10:51, Cai Huoqing wrote:
> Use the devm_platform_ioremap_resource() helper instead of
> calling platform_get_resource() and devm_ioremap_resource()
> separately

Thanks for the patch, I have applied it with summary line shortened to
"clk: samsung: s5pv210-audss: Make use of devm_platform_ioremap_resource()".

-- 
Regards,
Sylwester
