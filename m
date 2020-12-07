Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E6A2C4167B
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  7 Dec 2020 09:18:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1C11B23715
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  7 Dec 2020 09:18:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726744AbgLGJR5 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 7 Dec 2020 04:17:57 -0500
Received: from mailout1.w1.samsung.com ([210.118.77.11]:49062 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726530AbgLGJR4 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 7 Dec 2020 04:17:56 -0500
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20201207091701euoutp017c24195d516adc2780d0ffb4db72a204~OZIDaqASS1650716507euoutp01_
        for <linux-samsung-soc@vger.kernel.org>; Mon,  7 Dec 2020 09:17:01 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20201207091701euoutp017c24195d516adc2780d0ffb4db72a204~OZIDaqASS1650716507euoutp01_
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1607332621;
        bh=9kmoX8tPS9AS0lq/+S0giC1J49b9BJRaf7sGTQ+Ufac=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=AtptQq7XkEebS9PG7gzMOVu/yDuhhqP3NSjbz11LWude51j0O3OXdsJn/vBDPqAvz
         sCzZLmT8Z9cneHu7jfkgSbObh8F4Cb5NudIebgDxFvMaxHdFABkhLgj+uEUjD6kRUH
         GtUxOk+Ij15fCVzRFmwlZyu5sTIVL2FASzCcXjIQ=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20201207091653eucas1p24420a1494bebb2490f9523b6a52133e6~OZH7tPjTM2100021000eucas1p2y;
        Mon,  7 Dec 2020 09:16:53 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges2new.samsung.com (EUCPMTA) with SMTP id F1.06.44805.503FDCF5; Mon,  7
        Dec 2020 09:16:53 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20201207091652eucas1p254285cfb4348e99904aca0064a5f66ff~OZH7IaQvo3200532005eucas1p2_;
        Mon,  7 Dec 2020 09:16:52 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20201207091652eusmtrp10343a202734e07d5158fec4497112129~OZH7HyM5D1835718357eusmtrp1P;
        Mon,  7 Dec 2020 09:16:52 +0000 (GMT)
X-AuditID: cbfec7f4-b37ff7000000af05-70-5fcdf305e28c
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id 08.08.16282.403FDCF5; Mon,  7
        Dec 2020 09:16:52 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20201207091652eusmtip2d495a5c108aee55607d19b50cf8dd5e3~OZH6xl2gv1419814198eusmtip24;
        Mon,  7 Dec 2020 09:16:52 +0000 (GMT)
Subject: Re: [PATCH] soc: samsung: asv: don't defer early on not-supported
 SoCs
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     linux-samsung-soc@vger.kernel.org,
        Sylwester Nawrocki <snawrocki@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
From:   Marek Szyprowski <m.szyprowski@samsung.com>
Message-ID: <290de9a2-ec2c-5250-85c8-dcdb2f20f521@samsung.com>
Date:   Mon, 7 Dec 2020 10:16:52 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0)
        Gecko/20100101 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <20201207082559.GA7148@kozik-lap>
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmplleLIzCtJLcpLzFFi42LZduzneV3Wz2fjDbY947HYOGM9q8X58xvY
        LWac38dk0f70JbMDi8emVZ1sHn1bVjF6fN4kF8AcxWWTkpqTWZZapG+XwJUxeUcra8Fm7opF
        q3gbGKdxdjFyckgImEjcenSEtYuRi0NIYAWjxJSDm6CcL4wSHVM2sUE4nxklrux8wATTsv/M
        B2aIxHJGiZa/rxghnI+MEre+nmIHqRIWCJSYde05C4gtIqApcf3vd7C5zAIdjBINF16ygSTY
        BAwlut52AdkcHLwCdhK35vKChFkEVCQuLlkPViIqkCSxvusHmM0rIChxcuYTsJmcAnoSF7/+
        ZAWxmQXkJba/ncMMYYtL3Hoynwlkl4TADg6Jlovv2CDOdpHYubqHFcIWlnh1fAs7hC0jcXpy
        DwtEQzOjxMNza9khnB5GictNMxghqqwl7pz7BXYpM9A763fpQ4QdJRZ9m8MCEpYQ4JO48VYQ
        4gg+iUnbpjNDhHklOtqEIKrVJGYdXwe39uCFS8wTGJVmIXltFpJ3ZiF5ZxbC3gWMLKsYxVNL
        i3PTU4uN8lLL9YoTc4tL89L1kvNzNzECU8rpf8e/7GBc/uqj3iFGJg7GQ4wSHMxKIrxqUmfj
        hXhTEiurUovy44tKc1KLDzFKc7AoifMmbVkTLySQnliSmp2aWpBaBJNl4uCUamBasblR72p+
        mcnOxNQQ5Yuz++8uNo96rOq9Svd1ZFIgw+15rT4ber9ULmqLCAvkENyeqLjljfXVkhZzoZAu
        fuOfrSzb2fWvbwzukQyM/d5ax9NwTvho+s///XWRW44avnSK28NYnPlu77dOeSZRNX0/3SXa
        EQd3uGQ2a3jf9r5irHDWeIp2/rLpRSFMSYfc731OWLTr9Jo2gedCOw/Urzqy3EpVWfeNjPW7
        c4aHD8iK/9mqKiSla8t1LufQOa8V39aKuBxcEL64O/PTpOqoLe/VUlfN2//lafr2N7WHqjX6
        +BzyWWan8t15t9rq8+XfGxZOmXInSegxJ7/Y/4qHZ/ft2mkaaCFQGptV8iP7a5gSS3FGoqEW
        c1FxIgD994ZrmAMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprKIsWRmVeSWpSXmKPExsVy+t/xe7osn8/GG5x4pWKxccZ6Vovz5zew
        W8w4v4/Jov3pS2YHFo9NqzrZPPq2rGL0+LxJLoA5Ss+mKL+0JFUhI7+4xFYp2tDCSM/Q0kLP
        yMRSz9DYPNbKyFRJ384mJTUnsyy1SN8uQS9j8o5W1oLN3BWLVvE2ME7j7GLk5JAQMJHYf+YD
        M4gtJLCUUeL4by2IuIzEyWkNrBC2sMSfa11sXYxcQDXvGSXOT+hkAUkICwRKzLr2HMwWEdCU
        uP73OytIEbNAF6PEmb1TmCA6rjNKPF75jR2kik3AUKLrLcgoDg5eATuJW3N5QcIsAioSF5es
        BwuLCiRJnD0tCBLmFRCUODnzCdh8TgE9iYtff4IdxCxgJjFv80NmCFteYvvbOVC2uMStJ/OZ
        JjAKzULSPgtJyywkLbOQtCxgZFnFKJJaWpybnltspFecmFtcmpeul5yfu4kRGD/bjv3csoNx
        5auPeocYmTgYDzFKcDArifCqSZ2NF+JNSaysSi3Kjy8qzUktPsRoCvTORGYp0eR8YATnlcQb
        mhmYGpqYWRqYWpoZK4nzmhxZEy8kkJ5YkpqdmlqQWgTTx8TBKdXA5LuwULyuICs6av2Llcw3
        HJfKW7xzsek8c9XuaKH1X9Vb973atx7MtzC790VuScmlcLGaQzdnCXvI7+9ddHDPnIMHVns9
        vuUQ/MXIvO2ypnIW2+c7fwrD6ni7Fzjt1DL8JDrnYcm+PoNvB5ky8lJlPLY9O7NwqXO1gdKH
        u4IvVXI+b19XU7Q74uQW27V38j2uCt+cwhFmdVnsg8KMX0xnpxvbX4gSX74ljI2z2rhZ1Wvt
        gfUJqfdnX5N9FVkr7eR++jcLe32TtK1Gldtvhz2/ukuYGzWLmpy8D1WfjVr7Lees6p3W0ILz
        SuKZq07M19sm3+xbsqu0+4p9b7Jjzo4rTw+1rCl4sqw4/IDKQU17JZbijERDLeai4kQA5LKc
        gSgDAAA=
X-CMS-MailID: 20201207091652eucas1p254285cfb4348e99904aca0064a5f66ff
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20201207072939eucas1p1029a121730bbc0f3e120c607ec5e3002
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20201207072939eucas1p1029a121730bbc0f3e120c607ec5e3002
References: <CGME20201207072939eucas1p1029a121730bbc0f3e120c607ec5e3002@eucas1p1.samsung.com>
        <20201207072928.20010-1-m.szyprowski@samsung.com>
        <20201207081005.GA6278@kozik-lap> <20201207082559.GA7148@kozik-lap>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi Krzysztof,

On 07.12.2020 09:25, Krzysztof Kozlowski wrote:
> On Mon, Dec 07, 2020 at 09:10:05AM +0100, Krzysztof Kozlowski wrote:
>> On Mon, Dec 07, 2020 at 08:29:28AM +0100, Marek Szyprowski wrote:
>>> Check if the SoC is really supported before gathering the needed
>>> resources. This fixes endless deffered probe on some SoCs other than
>>> Exynos5422 (like Exynos5410).
>>>
>>> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
>> If it really causes endless deffer, then also Cc stable.
>> Fixes: 5ea428595cc5 ("soc: samsung: Add Exynos Adaptive Supply Voltage driver")
>>
>> There is one more problem here - on Exynos5410 or anything else with
>> such chipid node, this will cause -ENODEV probe failures. It should not.
>> Simply, it should not match for them.
>>
>> This could be achieved with another compatible, but it won't really
>> describe the real case here, because it is not Chip ID which is
>> different. The CPU and bus voltages are different, the SoC is different.
>> Maybe this should not match to chip ID at all?
> There is another solution which I was checking few days ago (for
> different reason) - merge Chip ID driver with ASV. We get rid of the
> arch_initcall() and always bind to Chip ID node. If SoC revision
> matches, we run the ASV-specific code.

Okay for me. Feel free to post it if have it already done.

Best regards

-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

