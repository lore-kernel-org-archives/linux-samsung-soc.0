Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B10EBC4332F
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  8 Nov 2022 22:53:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229853AbiKHWxR (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 8 Nov 2022 17:53:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229611AbiKHWxQ (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 8 Nov 2022 17:53:16 -0500
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7AB36657E2
        for <linux-samsung-soc@vger.kernel.org>; Tue,  8 Nov 2022 14:53:14 -0800 (PST)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20221108225310euoutp0272a6968ba7498ae88b188d960291a448~lvdwjRxf72828028280euoutp02N
        for <linux-samsung-soc@vger.kernel.org>; Tue,  8 Nov 2022 22:53:10 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20221108225310euoutp0272a6968ba7498ae88b188d960291a448~lvdwjRxf72828028280euoutp02N
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1667947990;
        bh=pv+WSsho28rj65vPSdSAFOTEsUKSGPQfm72M5Vod9tg=;
        h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
        b=ObJi9di9sGCs3naVqeYvaT/X55i5LKGUq+ngIOK4PKHLLPu0X6bO/t2ek+A9SUE97
         bc1hJIJ+JhGLoXAXlvQok1tOMrxcgdlFwzjmI2n3pm4rD7eTUIGb/qhWWW5vehrzlo
         7L4SnOblRS0bVSFJVd17PzwzxwHNIr8lTZOAMdI0=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20221108225308eucas1p2b6b35db2713ef4cb2fdda59a0c5feb19~lvdvTGGG83072830728eucas1p2w;
        Tue,  8 Nov 2022 22:53:08 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges1new.samsung.com (EUCPMTA) with SMTP id 07.80.09561.4DDDA636; Tue,  8
        Nov 2022 22:53:08 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20221108225307eucas1p238e928a7fe3e26df8e510d21cd45c576~lvduWyNpv3072830728eucas1p2v;
        Tue,  8 Nov 2022 22:53:07 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20221108225307eusmtrp20979f774855ced0f58b2ae5ac0f80468~lvduRZJ_30819008190eusmtrp2M;
        Tue,  8 Nov 2022 22:53:07 +0000 (GMT)
X-AuditID: cbfec7f2-0b3ff70000002559-5b-636addd402bd
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id 46.9F.09026.3DDDA636; Tue,  8
        Nov 2022 22:53:07 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20221108225307eusmtip2a8a58328a70c73f36e201a21198f1609~lvdtqD2Vx0856008560eusmtip20;
        Tue,  8 Nov 2022 22:53:07 +0000 (GMT)
Message-ID: <d4b49cb6-f7c1-e859-98a8-e78a132b421b@samsung.com>
Date:   Tue, 8 Nov 2022 23:53:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0)
        Gecko/20100101 Thunderbird/102.4.1
Subject: Re: [PATCH] clk: samsung: Revert
 "clk: samsung: exynos-clkout: Use of_device_get_match_data()"
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-clk@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc:     Stephen Boyd <sboyd@kernel.org>,
        "Minghao Chi (CGEL ZTE)" <chi.minghao@zte.com.cn>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Vinod Koul <vkoul@kernel.org>, Nishanth Menon <nm@ti.com>,
        Mark Brown <broonie@kernel.org>
From:   Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <0da15378-ca0d-4f26-c21c-184de2a89350@linaro.org>
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrGKsWRmVeSWpSXmKPExsWy7djP87pX7mYlG7y4rmvxYN42NoupD5+w
        WWyd185ucf3Lc1aLva+3slt87LnHajHj/D4mizc/zjJZHH7Tzmrx79pGFoudd04wO3B7bFrV
        yeZx59oeNo++LasYPY7f2M7k8XmTnMeafT9YAtiiuGxSUnMyy1KL9O0SuDJ+tTxhK5jGWdH8
        /AZ7A+MB9i5GTg4JAROJO9sXsnQxcnEICaxglFi9rYkRJCEk8IVR4voscYjEZ0aJi9/nscB0
        zNr5igkisZxR4u/UvewQHR8ZJXbczgGxeQXsJDY/6WMFsVkEVCQuPDjPAhEXlDg58wmYLSqQ
        IrG7exuYLSyQKXFix1+wzcwC4hK3nsxnArFFBCokVk/YygQR38IkseofL4jNJmAo0fW2iw3E
        5gTatWvRATaIGnmJ7W/nMIMcJyHQzCmxcC/Mny4SZxcfZ4KwhSVeHd8CFZeR+L9zPhNEQzuj
        xILf96GcCYwSDc9vMUJUWUvcOfcLaAUH0ApNifW79CHCjhL/ji5nBQlLCPBJ3HgrCHEEn8Sk
        bdOZIcK8Eh1tQhDVahKzjq+DW3vwwiXmCYxKs5CCZRaS92cheWcWwt4FjCyrGMVTS4tz01OL
        DfNSy/WKE3OLS/PS9ZLzczcxApPW6X/HP+1gnPvqo94hRiYOxkOMEhzMSiK8a9ZlJQvxpiRW
        VqUW5ccXleakFh9ilOZgURLnZZuhlSwkkJ5YkpqdmlqQWgSTZeLglGpgUhXU+DD54r9jiQfO
        r6xI62VY9CLaWzg/X+pfNLelpNfB0O61IQI/T+av1GXqtP8TOHvfjdR3d6Wa3bcf2/787Vzz
        JFWb4If/Vfor5mn+bfFXDvULeaWjUT/zDNfD6p/Zc796lerwve8y8fvY8Dni1I6JInf+1H5s
        3C0YsfmNMtPvDZwsATV8pks9Ls/gtf577uIVH6N9XTcTlIxV/gruvRV1ZsdkCVkDCfNFra9k
        OqME/i2KevWsecvbgI/ePLUHzVlu331x9BdPdFX2yd1nIxat8Zq0R8gpq8Rnk+vShjvip8+/
        Dcvx63hXfW3jXC2+p0UPK4+FGzE9+nO7509ybOCLo347a9y/X9ygf/9ZjRJLcUaioRZzUXEi
        AK/yEonJAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrFIsWRmVeSWpSXmKPExsVy+t/xe7qX72YlG2w/rW7xYN42NoupD5+w
        WWyd185ucf3Lc1aLva+3slt87LnHajHj/D4mizc/zjJZHH7Tzmrx79pGFoudd04wO3B7bFrV
        yeZx59oeNo++LasYPY7f2M7k8XmTnMeafT9YAtii9GyK8ktLUhUy8otLbJWiDS2M9AwtLfSM
        TCz1DI3NY62MTJX07WxSUnMyy1KL9O0S9DJ+tTxhK5jGWdH8/AZ7A+MB9i5GTg4JAROJWTtf
        MXUxcnEICSxllPh1uYERIiEjcXJaAyuELSzx51oXG0TRe0aJlvUn2UASvAJ2Epuf9IEVsQio
        SFx4cJ4FIi4ocXLmEyCbg0NUIEXi27k6kLCwQKZE48wVYPOZBcQlbj2ZzwRiiwhUSPz4u4sV
        ZD6zwDYmia9vlrBALDvKKPFu6xqwKjYBQ4mut11gizmBFu9adIANYpKZRNfWLqip8hLb385h
        nsAoNAvJHbOQLJyFpGUWkpYFjCyrGEVSS4tz03OLjfSKE3OLS/PS9ZLzczcxAiN127GfW3Yw
        rnz1Ue8QIxMH4yFGCQ5mJRHeNeuykoV4UxIrq1KL8uOLSnNSiw8xmgIDYyKzlGhyPjBV5JXE
        G5oZmBqamFkamFqaGSuJ83oWdCQKCaQnlqRmp6YWpBbB9DFxcEo1MKXvvcu6//ocm7hvvPLy
        07x3Wq14/VyqbTFnjfT/ldxsdrekdy2/yXLEtMv9rxCHTqrx9JIotur9ZUukk+eFy8w5+jiu
        zfVX+i5Li+eebkVC/Bfey/L6JHJInSxNOPXs/s/77c8mVImsX7rqF4fovKhDuhXicisWLYxs
        OCBz4aT/2+erfkbZL/QxVZT1vhrvG6723W32tXdbWXh5fGO3nOLVe7P/WumXf6mZfhaMMzI6
        HB4+jX7xIP6zhuzHkJnVJyvcFNgU/uZmyhpMu7ubqcJbubhitl3revvW/QyhNx/YO13/+Tf2
        eCZnoGXawje/70ldVr7ed+lug+lflaDPZcn3+v5fbz+d/oRr5fPyUiWW4oxEQy3mouJEADx8
        MkRdAwAA
X-CMS-MailID: 20221108225307eucas1p238e928a7fe3e26df8e510d21cd45c576
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20221108213728eucas1p2aa97d7925e280b7347bb9e76d3c9a177
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20221108213728eucas1p2aa97d7925e280b7347bb9e76d3c9a177
References: <CGME20221108213728eucas1p2aa97d7925e280b7347bb9e76d3c9a177@eucas1p2.samsung.com>
        <20221108213718.32076-1-m.szyprowski@samsung.com>
        <0da15378-ca0d-4f26-c21c-184de2a89350@linaro.org>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 08.11.2022 22:44, Krzysztof Kozlowski wrote:
> On 08/11/2022 22:37, Marek Szyprowski wrote:
>> of_device_get_match_data() function should not be used on the device
>> other than the one matched to the given driver, because it always returns
>> the match_data of the matched driver. In case of exynos-clkout driver,
>> the code matched the OF IDs on the PARENT device, so replacing it with
>> of_device_get_match_data() broke the driver.
>>
>> This reverts commit 777aaf3d1daf793461269b49c063aca1cee06a44.
> This was untested, automated commit and there were several other like
> that from Minghao. Other driver owners should check if they have the
> same issue. I made a quick look and seems fine, but it all depends what
> was the of_device_get_match_data() argument.
>
>> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Please add Cc-stable tag. Do reverts need a Fixes tag? I guess as well...

Do we really need a CC-stable tag? v6.1-rc1 is the first release that 
contains that bug, so this revert imho should be simply applied as a fix 
for v6.1-rcX cycle.

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

