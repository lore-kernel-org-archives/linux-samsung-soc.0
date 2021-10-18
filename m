Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD888C433FE
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 18 Oct 2021 08:26:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A5DC9603E7
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 18 Oct 2021 08:26:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230324AbhJRI2x (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 18 Oct 2021 04:28:53 -0400
Received: from mailout1.w1.samsung.com ([210.118.77.11]:50376 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230526AbhJRI2t (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 18 Oct 2021 04:28:49 -0400
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20211018082636euoutp01fa5c6b62103f504e36b08a21bd9fe081~vEo9k9uUF2798327983euoutp01R
        for <linux-samsung-soc@vger.kernel.org>; Mon, 18 Oct 2021 08:26:36 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20211018082636euoutp01fa5c6b62103f504e36b08a21bd9fe081~vEo9k9uUF2798327983euoutp01R
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1634545596;
        bh=KkaKX1e1Dd7h4BZnYesJfdk1PFf+z9be2kqdgsNommY=;
        h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
        b=rmbgoKkZDyBnoqXc2mmgHhI4M9DzKVoVaRcLsNWx6tHRtUQKW4fhamDY5zRn5UIQS
         ffiXknxS1FusxWGKhYAN4OfFtFQgwdYx/lBRmooMFZi3YpGJl9JNUxCkR/Jpq57ABr
         vqkSNHBZaHY5M5IwVtWHwsN9qKX4VGUgw/xhU4dg=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20211018082636eucas1p16bab41b13f40446e6cb43aefa56c7bb2~vEo9Nq8oF1318013180eucas1p18;
        Mon, 18 Oct 2021 08:26:36 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges2new.samsung.com (EUCPMTA) with SMTP id 38.C7.42068.CBF2D616; Mon, 18
        Oct 2021 09:26:36 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20211018082635eucas1p1f65471364499ea8e370024892655703c~vEo8yPJV22797127971eucas1p1F;
        Mon, 18 Oct 2021 08:26:35 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20211018082635eusmtrp12fc0234431dfcd8cbc843883e76712dc~vEo8xiBBO1790017900eusmtrp1I;
        Mon, 18 Oct 2021 08:26:35 +0000 (GMT)
X-AuditID: cbfec7f4-c89ff7000002a454-e7-616d2fbc5cad
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id 6A.B1.31287.BBF2D616; Mon, 18
        Oct 2021 09:26:35 +0100 (BST)
Received: from [106.210.134.141] (unknown [106.210.134.141]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20211018082635eusmtip18ac6d84561f998c722baa75b5c78a75b~vEo8KR8eA2094420944eusmtip1o;
        Mon, 18 Oct 2021 08:26:35 +0000 (GMT)
Message-ID: <7a72a9a6-b250-7072-bfb3-a8dd90643c65@samsung.com>
Date:   Mon, 18 Oct 2021 10:26:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0)
        Gecko/20100101 Thunderbird/91.2.0
Subject: Re: [PATCH] clk: samsung: describe drivers in KConfig
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org
From:   Sylwester Nawrocki <s.nawrocki@samsung.com>
In-Reply-To: <20210924133624.112593-1-krzysztof.kozlowski@canonical.com>
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrAKsWRmVeSWpSXmKPExsWy7djPc7p79HMTDQ5uk7C4/uU5q8XGtz+Y
        LDY9vsZq8bHnHqvF5V1z2CxmnN/HZHHxlKvFv2sbWSxW7frD6MDp8f5GK7vHrIZeNo+ds+6y
        e2xa1cnmsXlJvUffllWMHp83yQWwR3HZpKTmZJalFunbJXBlvL96na3gP2PFrFlrWRsYrzF2
        MXJySAiYSPza/IMFxBYSWMEosWCfQBcjF5D9hVHi29NbTBDOZ6DEsf/sMB1HT1xng0gsZ5T4
        erCBFaL9I6PE9M4gEJtXwE7i5tO/TCA2i4CqxNbXsxgh4oISJ2c+AVsnKpAkMX/2A6ChHBzC
        QPXH5guDhJkFxCVuPZkPtlhEYBmjxOlv38CWMQvsYpT4fXwi2BVsAoYSvUf7wIZyCnhIzPm4
        kBGiW15i+9s5zCANEgLNnBI/r+1mhjjbReLKhmNMELawxKvjW6DekZE4PbmHBaqBUaJn9212
        CGcCo8T94wugwWQtcefcLzaQW5kFNCXW79KHCDtKfG2bwAoSlhDgk7jxVhDiCD6JSdumM0OE
        eSU62oQgqlUkfq+aDnWClET3k/8sExiVZiGFyyykAJiF5J1ZCHsXMLKsYhRPLS3OTU8tNspL
        LdcrTswtLs1L10vOz93ECExUp/8d/7KDcfmrj3qHGJk4GA8xSnAwK4nw8n3MSRTiTUmsrEot
        yo8vKs1JLT7EKM3BoiTOm7RlTbyQQHpiSWp2ampBahFMlomDU6qBqeKV6cEZttzsOyqVNKQ5
        0+50+6y51/sw98YE5qYs+fUzLM+zqGpVvhFguMI0aeO8GIVDDRd8RKc8u7jzxe6pTj/dO2QE
        +ityU9Xmf5vhxF3tJ6VuLGMjfKxV4ljc/+/tq78vuss8K2LLKTshzxVSH+wfHmFe/O7gmz3H
        uO8esS0Q9rrVNcfGU35pzYo7Tydq+kyR2NIY+eWqw9Jvojx8IWc9jor9C+loXegbKawgbjM5
        d0bOy+XftrVO4LJw0TvVsT6dW2PzZ8Fa0WkvYkv2uS3JeqO5/N7VjOtKujctX/KF7nk1T6jU
        7/rfjtZQzSVh2ybqzpH7ZH5Fx83o2xypjM0re+73Gk0Oejr5o+bhY0osxRmJhlrMRcWJADaT
        MbzDAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrIIsWRmVeSWpSXmKPExsVy+t/xu7q79XMTDRa2Wlpc//Kc1WLj2x9M
        FpseX2O1+Nhzj9Xi8q45bBYzzu9jsrh4ytXi37WNLBardv1hdOD0eH+jld1jVkMvm8fOWXfZ
        PTat6mTz2Lyk3qNvyypGj8+b5ALYo/RsivJLS1IVMvKLS2yVog0tjPQMLS30jEws9QyNzWOt
        jEyV9O1sUlJzMstSi/TtEvQy3l+9zlbwn7Fi1qy1rA2M1xi7GDk5JARMJI6euM7WxcjFISSw
        lFFi1b/9LF2MHEAJKYn5LUoQNcISf651QdW8Z5Q4fbSPGSTBK2AncfPpXyYQm0VAVWLr61mM
        EHFBiZMzn7CA2KICSRIfN8xgBpkpDFR/bL4wSJhZQFzi1pP5TCAzRQSWMUrsW/kPbAGzwC5G
        iT/rDzNCbJvNKHHi60k2kBY2AUOJ3qN9YBs4BTwk5nxcyAgylVlAXWL9PCGIqfIS29/OYZ7A
        KDQLyR2zkCychdAxC0nHAkaWVYwiqaXFuem5xYZ6xYm5xaV56XrJ+bmbGIFxue3Yz807GOe9
        +qh3iJGJg/EQowQHs5IIL9/HnEQh3pTEyqrUovz4otKc1OJDjKbAsJjILCWanA9MDHkl8YZm
        BqaGJmaWBqaWZsZK4rxb566JFxJITyxJzU5NLUgtgulj4uCUamDq83q9atLclI17Nb/na0s/
        3Te9y+1VYd3zbzMjOmdd+Schdef1Fc0zyeuTI7UuHt3y1SeyoEDh73qDlWtvPbn2cPPeSxlP
        3n7MrmtLacmMb/8YWml5Z/KGN8er/3D7Nq5RuxPgsJxb8ZnDug0zlY0bd/Ml3yzY/Jblqnh3
        vlpIvJcvqw772ceVf2Vutb6qL75ntfxYmfA+seRHu8oqWYxSvpw1X6f3g2/Wyuz1/oeNJm/R
        z5FZkOei2BbQo56bZLpRIPTXrvLcm123V6v/uPzzXtrTfe13u5njs81/MhmI8LBwTb+yf2rX
        1SUuSyYu/GIizMu5kiFjkfVucxbFqzOX72I8++0Juwv/Wea+GpZ7SizFGYmGWsxFxYkAVstm
        MFQDAAA=
X-CMS-MailID: 20211018082635eucas1p1f65471364499ea8e370024892655703c
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20210924133716eucas1p192fed7e3e993c0759d2bb7a8f8af7367
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20210924133716eucas1p192fed7e3e993c0759d2bb7a8f8af7367
References: <CGME20210924133716eucas1p192fed7e3e993c0759d2bb7a8f8af7367@eucas1p1.samsung.com>
        <20210924133624.112593-1-krzysztof.kozlowski@canonical.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 24.09.2021 15:36, Krzysztof Kozlowski wrote:
> Describe better which driver applies to which SoC, to make configuring
> kernel for Samsung SoC easier.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>

Applied, thanks.
