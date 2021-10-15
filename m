Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE03DC433F5
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 15 Oct 2021 17:04:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C6D1060F25
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 15 Oct 2021 17:04:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241973AbhJORHB (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 15 Oct 2021 13:07:01 -0400
Received: from mailout1.w1.samsung.com ([210.118.77.11]:21513 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241955AbhJORG5 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 15 Oct 2021 13:06:57 -0400
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20211015170449euoutp013c4ed705dedb513c3bbef91cd638195c~uQxkBnT9f2319923199euoutp01T
        for <linux-samsung-soc@vger.kernel.org>; Fri, 15 Oct 2021 17:04:49 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20211015170449euoutp013c4ed705dedb513c3bbef91cd638195c~uQxkBnT9f2319923199euoutp01T
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1634317489;
        bh=slTJFWRJwYOrUFJxCTvFeYiRQRxdOtdTo7gu/Wmlgpg=;
        h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
        b=J+W91IuJuNJzVfO/POnvOTmfokQ7HKv2hwn5iD0xC/vGKZ/OI5kycrWf5YT7Y3kos
         RnQT9bn83OZrFcxIQRMVh6GxDX683Ac41nkShN9r1oG43KmiPrs/jbhSp4ZtQ8rb2b
         +sLdyE/6HLOiGWXHRUZnFE/B9S5MQmRYzpYIy0Dw=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20211015170448eucas1p1d116781ec98fff3c41d03630d81f1779~uQxjh-8Sz2569525695eucas1p1Q;
        Fri, 15 Oct 2021 17:04:48 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges2new.samsung.com (EUCPMTA) with SMTP id 6F.7C.42068.0B4B9616; Fri, 15
        Oct 2021 18:04:48 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20211015170448eucas1p14291f88df5bbf0c868598bbf19c4dd90~uQxjCsUPY3272332723eucas1p15;
        Fri, 15 Oct 2021 17:04:48 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20211015170448eusmtrp17b5989d554344fd6a537e79e99e752be~uQxjB5oXH0060900609eusmtrp1B;
        Fri, 15 Oct 2021 17:04:48 +0000 (GMT)
X-AuditID: cbfec7f4-c89ff7000002a454-19-6169b4b0aa79
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id 5B.B0.20981.0B4B9616; Fri, 15
        Oct 2021 18:04:48 +0100 (BST)
Received: from [106.210.134.141] (unknown [106.210.134.141]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20211015170447eusmtip135220c4be4b38a19e3707528d046c8ae~uQxig7Ehw2964029640eusmtip1b;
        Fri, 15 Oct 2021 17:04:47 +0000 (GMT)
Message-ID: <ad2346d9-16b8-9d09-05e6-be4f62363e04@samsung.com>
Date:   Fri, 15 Oct 2021 19:04:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0)
        Gecko/20100101 Thunderbird/91.2.0
Subject: Re: [PATCH] clk: samsung: Remove meaningless __init and extern from
 header files
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        linux-clk@vger.kernel.org
Cc:     mturquette@baylibre.com, sboyd@kernel.org, cw00.choi@samsung.com,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, m.szyprowski@samsung.com
From:   Sylwester Nawrocki <s.nawrocki@samsung.com>
In-Reply-To: <531f5bd4-efa2-1583-4bbf-38f57e0b641c@canonical.com>
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA02Se0hTYRjG+845246D6XGme5lhsC6YkJuzYFF0z0YXjC6gqeSqwzabF7bs
        IoRD7aLZiCLNZV6yWqw0XaLhtEQr0ZUaeVnaFRfKaplmNLMst1Pkf8/7fr/ne9/n4yNx/nWW
        kFSnHKa1KQqNiM0l6p5Mdi2trlUrJL/Hlsn6J4ZZshqXG5NZhvpYsrH8NyzZ5a4HmKzy0WuO
        7HnHJtl0Xw2xlpSP2k9y5Eb9ObbcYs5ly+9dz5Qbas1I/tUSsoO9l7vqIK1RH6G14tWJXFV2
        VjkrrZ48Zv8Vr0cGTh7yIYFaBm5zK5aHuCSfuoXA2DOMmGICgeNSJe6h+NRXBO2WgH8Ou3OS
        YCATgrKCT4iBxhB0Ty/3aB61GmoMJV4zQS2Ciu8OnOn7Q3uRg/DoQGo/lF55510jgIqDT2/q
        WB6NUwIYcJRiHj2XioHxXCvuGYZTtxEM/czxQmwqAs49NngH+1Dr4GP5KIcxz4d6V7HXANQX
        Ej62umYM5EyxEeosMUyCAHC21f7NPw9sF/MJhs9GkG8d5DDFeQRv28oQQ62EV50/2J6LcGoJ
        3G0QM+11YM7qZTP3+4Ld5c/s4AsX6gpxps2DM6f4DL0QpsyFGKOFcNbxmziPRMZZz2KcFd84
        K43x/9wyRJiRgE7XJStpnTSFPhquUyTr0lOU4QdSky1o5iPZptsm7iOTcyy8BWEkakFA4qK5
        vM/NSgWfd1BxPIPWpu7TpmtoXQsKJgmRgLe/9s4+PqVUHKYP0XQarf13ipE+Qj2WeWLB9PjJ
        NOmxNShBvCv6he9T/XD1FsP63vZYlr61qL7ClpOfFXiguUyfLRzoTcV/VRVIuh8KvjeNK53D
        qpicqkeDppHGQ8I9o3MKr4p7gs/w/PKiQq8lDEzdd0eFmjImXEEZ652TalVwe1O/n1pCCvmm
        7ZXSUk6luqLX90uYKuTlrtfSjilnPynpCUIajRhvXqgpGh9JGOrxS7vzLAqeR4b1dSQmZX6I
        lhQHR76Pq4BwpyopN2ybrYSwY8U7pbb43PStNxs6v52uT7yy8VbI4AMitJE7ipTRIwVKf2s8
        dWN369auDUGNm/kCq7U7xz3Z7MYEkati/VewFosInUoREYZrdYo/+Iggy7cDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrGIsWRmVeSWpSXmKPExsVy+t/xu7obtmQmGryZyWtx/ctzVouNb38w
        WWx6fI3V4mPPPVaLGef3MVmsPXKX3eLiKVeLf9c2sjhweLy/0cruMauhl81j06pONo/NS+o9
        +rasYvT4vEkugC1Kz6Yov7QkVSEjv7jEVina0MJIz9DSQs/IxFLP0Ng81srIVEnfziYlNSez
        LLVI3y5BL6O5aSFrwXaOiht/YxoY+9i7GDk5JARMJG68+snSxcjFISSwlFHi2q9NrF2MHEAJ
        KYn5LUoQNcISf651sUHUvGeUuH1lHitIglfATmJj3zxmEJtFQFVi8fcnzBBxQYmTM5+wgNii
        AkkSHzfMAIsLC0RLvLm3DayXWUBc4taT+UwgtohAhMTHeQfYQRYwC6xmlOhfc4oZYtsxRokJ
        27vZQKrYBAwleo/2MYLYnAKOEq8XvmcHuZRZQF1i/TwhiKHyEtvfzmGewCg0C8kds5Dsm4XQ
        MQtJxwJGllWMIqmlxbnpucVGesWJucWleel6yfm5mxiBEbjt2M8tOxhXvvqod4iRiYPxEKME
        B7OSCO+7A+mJQrwpiZVVqUX58UWlOanFhxhNgWExkVlKNDkfmALySuINzQxMDU3MLA1MLc2M
        lcR5TY6siRcSSE8sSc1OTS1ILYLpY+LglGpgmnEoqCJd8L85n+5eKYM37/x3XK468cQgkn/1
        7is36pf/yrhsVeftztmbxb49N9bS4dDrOTv1Nk9Z4heYOHXL1AczfmmrqPoX66o8XXo5VKNS
        Y8aeV695twS+f3ai7vIkS86FNSZyacKarEFHF4k+1VqyR0i1/d+GDzcrQ2YIb/t42+DD0luC
        VgprJhpJPnO+VJN21ebG/CfzxSfxrFm3pjcpaUK1wK+3M/3W7oxq3tnyRlDfh2mft7fF9Mb+
        q0aZBwMDr3gJ8HzqSsl4YF7wZenN+u6426KzRCPUSn927jJ9pvp0zte9C9Rn1J6wc5Nm9yx2
        fBV34TTH/f0uvGHnOhKZfeTlG5dImGWonMnxVGIpzkg01GIuKk4EANrtH9lJAwAA
X-CMS-MailID: 20211015170448eucas1p14291f88df5bbf0c868598bbf19c4dd90
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20211015151438eucas1p1a784b8fb6bc20b01d4b1ec3634359df5
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20211015151438eucas1p1a784b8fb6bc20b01d4b1ec3634359df5
References: <CGME20211015151438eucas1p1a784b8fb6bc20b01d4b1ec3634359df5@eucas1p1.samsung.com>
        <20211015151425.29743-1-s.nawrocki@samsung.com>
        <531f5bd4-efa2-1583-4bbf-38f57e0b641c@canonical.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 15.10.2021 17:16, Krzysztof Kozlowski wrote:
> On 15/10/2021 17:14, Sylwester Nawrocki wrote:
>> Remove useless __init atrribute and unneeded extern qualifier in function
>> declarations in header files.
>>
>> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
>> ---
>>  drivers/clk/samsung/clk-cpu.h |  2 +-
>>  drivers/clk/samsung/clk.h     | 34 +++++++++++++++++-----------------
[..]
>> -extern void __init samsung_clk_register_pll(struct samsung_clk_provider *ctx,
>> +void samsung_clk_register_pll(struct samsung_clk_provider *ctx,
>>  			const struct samsung_pll_clock *pll_list,
>>  			unsigned int nr_clk, void __iomem *base);
>> -extern void samsung_clk_register_cpu(struct samsung_clk_provider *ctx,
>> +void samsung_clk_register_cpu(struct samsung_clk_provider *ctx,
>>  		const struct samsung_cpu_clock *list, unsigned int nr_clk);
[...]
> In such case, let's also drop the extern from Will's patch?

Yeah, I have already applied Will's patches and that patch also removes
the one newly introduced extern.
-- 
Regards,
Sylwester
