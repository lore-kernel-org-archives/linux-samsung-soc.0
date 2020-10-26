Return-Path: <SRS0=YeST=EB=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CAFDC4363A
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 26 Oct 2020 20:55:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B32DB20874
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 26 Oct 2020 20:55:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="mgye2M8J"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728317AbgJZUzS (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 26 Oct 2020 16:55:18 -0400
Received: from mailout1.w1.samsung.com ([210.118.77.11]:47220 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728207AbgJZUzR (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 26 Oct 2020 16:55:17 -0400
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20201026205505euoutp01c829eeb7fe2d5a3162bd7893079100ff~BpjjtGf3V2266822668euoutp01V
        for <linux-samsung-soc@vger.kernel.org>; Mon, 26 Oct 2020 20:55:05 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20201026205505euoutp01c829eeb7fe2d5a3162bd7893079100ff~BpjjtGf3V2266822668euoutp01V
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1603745705;
        bh=CZ6Nx7IcVc28F3C1y73mSUptka+UP8eimttpY3uMiM4=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=mgye2M8J9gO5WVPdAWbTRLnpUObxbNBZzf6yw6Ez8UTZqC2UDXlAzLLUoZ8NL1+2I
         /ws3TPWYWtnfFr5sQXCpVp/jyeDU0BiCU2UHNP0Os6PpPaWy678FNxOkMMMBRMVMh3
         QZOxaW0Aucao5LWQjIcIzSAIzc+3+IP2rRMJJcKc=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20201026205500eucas1p292b791c6d93dc0899190969b5ef2d5e0~Bpjewf7f81496214962eucas1p2j;
        Mon, 26 Oct 2020 20:55:00 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges1new.samsung.com (EUCPMTA) with SMTP id F2.F9.06456.4A7379F5; Mon, 26
        Oct 2020 20:55:00 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20201026205500eucas1p27d78f5f6993e3c28d1484320db3f2334~BpjeYLt-W1485814858eucas1p2H;
        Mon, 26 Oct 2020 20:55:00 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20201026205500eusmtrp2aefae4035d7face141d2978ab8f4ded8~BpjeXjXOH0219302193eusmtrp2R;
        Mon, 26 Oct 2020 20:55:00 +0000 (GMT)
X-AuditID: cbfec7f2-809ff70000001938-af-5f9737a4b709
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id B2.CC.06314.3A7379F5; Mon, 26
        Oct 2020 20:54:59 +0000 (GMT)
Received: from [106.210.88.143] (unknown [106.210.88.143]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20201026205459eusmtip1203bb84a7c81346441fc5610582cd0ba~BpjeFBd1t2835928359eusmtip1P;
        Mon, 26 Oct 2020 20:54:59 +0000 (GMT)
Subject: Re: [PATCH] ARM: dts: exynos: Remove 'opp-shared' from Exynos3 bus
 OPP-tables
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     linux-samsung-soc@vger.kernel.org,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>
From:   Marek Szyprowski <m.szyprowski@samsung.com>
Message-ID: <d6f8b59e-e014-0f65-e2da-3c61493fa57b@samsung.com>
Date:   Mon, 26 Oct 2020 21:54:59 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0)
        Gecko/20100101 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201026183526.GA165326@kozik-lap>
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprCKsWRmVeSWpSXmKPExsWy7djPc7pLzKfHG5w/JWyxccZ6VovrX56z
        Wpw/v4HdYsb5fUwWh9+0szqwemxa1cnm0bdlFaPH501yAcxRXDYpqTmZZalF+nYJXBkvFl1l
        K9jJWTHp4geWBsar7F2MHBwSAiYSfRcSuhi5OIQEVjBKrDx0lwXC+cIo8fTIEVYI5zOjxItp
        h5m7GDnBOhoXHWUFsYUEljNKTNmsAlH0nlGice1pZpCxwgIREvcnB4PUiAhoSlz/+x1sELPA
        JkaJffsnsoEk2AQMJbredoHZvAJ2Epfmb2UCsVkEVCVurdgNtkBUIEni7+c/zBA1ghInZz5h
        AbE5BQwk2o+9ArOZBeQltr+dwwxhi0vcejKfCeLQyewSHW/5IN50kfh2PAoiLCzx6vgWdghb
        RuL/TpByLiC7mVHi4bm17BBOD6PE5aYZjBBV1hJ3zv1iAxnEDPTN+l36EGFHiY6+e6wQ8/kk
        brwVhDiBT2LStunMEGFeiY42IYhqNYlZx9fBrT144RLzBEalWUgem4XkmVlInpmFsHcBI8sq
        RvHU0uLc9NRiw7zUcr3ixNzi0rx0veT83E2MwLRy+t/xTzsYv15KOsQowMGoxMN74e20eCHW
        xLLiytxDjBIczEoivE5nT8cJ8aYkVlalFuXHF5XmpBYfYpTmYFES5zVe9DJWSCA9sSQ1OzW1
        ILUIJsvEwSnVwFhWa/x67ZW3NVGPQp48+7iJ5anxuiczn+9N+Jfe1Da/TFe3K5Fbk6OnIDE3
        ZpZzVlt0fbbYTZUnVaFCjrOfbZ8v9NVKZ6XgMY+tijZicxcddpzOMWtzaMCjpeLJ/f9bnCJ3
        1Nz7lK165KSy8dc9iyTO/IxaPWH9lhkSvK8/psccvDM1Q0nwUrcSS3FGoqEWc1FxIgAxFtV1
        JwMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrFIsWRmVeSWpSXmKPExsVy+t/xu7qLzafHG8w6YGOxccZ6VovrX56z
        Wpw/v4HdYsb5fUwWh9+0szqwemxa1cnm0bdlFaPH501yAcxRejZF+aUlqQoZ+cUltkrRhhZG
        eoaWFnpGJpZ6hsbmsVZGpkr6djYpqTmZZalF+nYJehkvFl1lK9jJWTHp4geWBsar7F2MnBwS
        AiYSjYuOsnYxcnEICSxllDj6YhdUQkbi5LQGVghbWOLPtS42iKK3jBJbvjwESnBwCAtESNyf
        HAxSIyKgKXH973ewQcwCW4AGHZzLCNGwnVHi/IPrbCBVbAKGEl1vu8BsXgE7iUvztzKB2CwC
        qhK3VuwG2yYqkCTx8sJUJogaQYmTM5+wgNicAgYS7cdegdnMAmYS8zY/ZIaw5SW2v50DZYtL
        3Hoyn2kCo9AsJO2zkLTMQtIyC0nLAkaWVYwiqaXFuem5xYZ6xYm5xaV56XrJ+bmbGIHxtO3Y
        z807GC9tDD7EKMDBqMTDe+HttHgh1sSy4srcQ4wSHMxKIrxOZ0/HCfGmJFZWpRblxxeV5qQW
        H2I0BXpuIrOUaHI+MNbzSuINTQ3NLSwNzY3Njc0slMR5OwQOxggJpCeWpGanphakFsH0MXFw
        SjUw6uud7zhSe+0q2w3ZR6/mzchwL2R43nFK6MdkrWBu3qXF2a4Hd7bZqrf+MVjdtz3y0uP1
        y4rKsq8FxNxQN9YKst6+487C5GviVrULXcT2fC2/e84zTiAi64/a24yZJs//rmUrZ8o2O58Z
        8LD10sJpLVWe3Gzd6dLd/3NeXPfpeLFx9tPtO468VmIpzkg01GIuKk4EAO2lZGG9AgAA
X-CMS-MailID: 20201026205500eucas1p27d78f5f6993e3c28d1484320db3f2334
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20200911122231eucas1p2c0964f2dc4326522a87fc0571ae58c37
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200911122231eucas1p2c0964f2dc4326522a87fc0571ae58c37
References: <CGME20200911122231eucas1p2c0964f2dc4326522a87fc0571ae58c37@eucas1p2.samsung.com>
        <20200911122220.13698-1-m.szyprowski@samsung.com>
        <20201026183526.GA165326@kozik-lap>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi Krzysztof,

On 26.10.2020 19:35, Krzysztof Kozlowski wrote:
> On Fri, Sep 11, 2020 at 02:22:20PM +0200, Marek Szyprowski wrote:
>> Commits 1019fe2c7280 ("ARM: dts: exynos: Adjust bus related OPPs to the
>> values correct for Exynos5422 Odroids") and 9ff416cf45a0 ("ARM: dts:
>> exynos: Disable frequency scaling for FSYS bus on Odroid XU3 family")
>> revealed that 'opp-shared' property for the Exynos bus OPPs was used
>> incorrectly, what had the side-effect of disabling frequency scaling for
>> the second and latter buses sharing given OPP-table.
>>
>> Fix this by removing bogus 'opp-shared' properties from Exynos3 bus
>> OPP-tables. This restores frequency scaling for the following busses:
>> RightBus, LCD0, FSYS and MFC.
>>
>> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
>> ---
>>   arch/arm/boot/dts/exynos3250.dtsi | 5 -----
>>   1 file changed, 5 deletions(-)
> Hi Marek,
>
> Any news on these two patches? Shall I still wait?

I would apply it to give the testing in -next. I got the information 
that the crash was not reproduced, thus probably not related to this patch.

Best regards

-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

