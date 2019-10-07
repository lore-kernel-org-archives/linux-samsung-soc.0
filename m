Return-Path: <SRS0=jzbt=YA=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38A81C4740A
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  7 Oct 2019 06:25:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0AFC02133F
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  7 Oct 2019 06:25:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="lXzF6Ms1"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726984AbfJGGZ1 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 7 Oct 2019 02:25:27 -0400
Received: from mailout2.w1.samsung.com ([210.118.77.12]:45444 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726202AbfJGGZ1 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 7 Oct 2019 02:25:27 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20191007062525euoutp02af0d068f01e7729b3b08ff23678a4c74~LSVU7iBGI2004620046euoutp02j
        for <linux-samsung-soc@vger.kernel.org>; Mon,  7 Oct 2019 06:25:25 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20191007062525euoutp02af0d068f01e7729b3b08ff23678a4c74~LSVU7iBGI2004620046euoutp02j
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1570429525;
        bh=T4ejd7aSPwD6CHGFeJZx+Y3WExEZUQrMUCEzpTyg4LU=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=lXzF6Ms1u+zjPv0/qmEveuKAAraDoasujhKrqKr1TuJqfYv9Hk6lDlZK5m6IXD9Da
         4MMv48Sx3M1X2LMi4KtYQrwDypAJpFnJqxaSr3IhltZn6xVE39ixkunMzaxVpJeKqz
         FGgi+J5GKU6eZoNDY/c7ITiVKLWAiWe1nI/xlPRI=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20191007062525eucas1p1a33b55f1080a9c4af9ea1dde770303d6~LSVUuBb2A0660306603eucas1p1q;
        Mon,  7 Oct 2019 06:25:25 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges3new.samsung.com (EUCPMTA) with SMTP id A3.C0.04374.55ADA9D5; Mon,  7
        Oct 2019 07:25:25 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20191007062524eucas1p2bfd37d582228164410e59840bb9c2196~LSVUeTd0r0187101871eucas1p22;
        Mon,  7 Oct 2019 06:25:24 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20191007062524eusmtrp16684557eb689ec9dd68407c7ac9cf8c3~LSVUds6eZ1507915079eusmtrp1h;
        Mon,  7 Oct 2019 06:25:24 +0000 (GMT)
X-AuditID: cbfec7f5-4f7ff70000001116-5d-5d9ada55a510
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id C5.FA.04117.45ADA9D5; Mon,  7
        Oct 2019 07:25:24 +0100 (BST)
Received: from [106.120.51.15] (unknown [106.120.51.15]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20191007062524eusmtip2de5a811673ad4c55fc3b194ac66723d1~LSVUGNRzv0185201852eusmtip2T;
        Mon,  7 Oct 2019 06:25:24 +0000 (GMT)
Subject: Re: [PATCH] clk: samsung: exynos5433: Fix error paths
To:     Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org
Cc:     Sylwester Nawrocki <snawrocki@kernel.org>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
From:   Marek Szyprowski <m.szyprowski@samsung.com>
Message-ID: <53da9243-4ef9-0594-4942-e65d812d5f97@samsung.com>
Date:   Mon, 7 Oct 2019 08:25:23 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
        Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191004214510.AFDCB2133F@mail.kernel.org>
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA01SbUhTYRj13b13u1vedZ2Kr+ZXSwKDtJE/LhSioLDqT/3oTzFq6mWOtim7
        fqSCaNLXslIXuIaRGWkN82MN56wU53SV2SypRNTyI01hgdOoRKVdr5b/zvucczjnwIsjkgYs
        Alfr8mi9TqmR8kVox8Afz8HTY2bFoVWHmGo3tWLU55V5jPJ42gTUUuUkRpk83Txq41M7Sl39
        toCkCORWy3W+/JbNAuTL1uiTyBnR0Sxaoy6g9YnJ50XZjhsPeLlzyMVuaztWBoyIAQhxSCbB
        m/YazABEuIR8DGC/45eAJSTkCoCN04EcsQzgyPxbdNvhGl3gc0QTgAvLrxDu4QVwqbMHsKpg
        MhnOrg9v4hAyEzqbZwArQkgbgANjFowl+KQMGrwGPosJv6HfUb9ZCiXjYPNLF4/FoaQCTv52
        I5wmCL6+O7tZQ0hScMjFVULIGGj31iEcDoNjs/d5bBgkGwSwt9q3tTQNGh8+ARwOhotum4DD
        kXDQWIlyhgoAp949FXCPSv/qS6YtxxHY537vr437I+Jha1cid06F9u8+lD1DUgxHvUFcCTGs
        6ahFuDMBr12RcOr90Oxu+RfbO/wBqQJS845p5h1zzDvmmP/n1gPUAsLofEaropnDOrowgVFq
        mXydKiEzR2sF/p8zuOH+2Qm61zKcgMSBNJCQx5sVEkxZwBRpnQDiiDSEiH5kUkiILGVRMa3P
        OafP19CME+zBUWkYURLw9ayEVCnz6As0nUvrt1keLowoA+l1jvTydY1sSqQ40XNsNYOIBSkf
        7RWLpW7V4pq62F5RnXTKKhOOp40oknhKjLTvU+8V/Wi7XMgraWwal4iqomI6d5fd0xa2tqQe
        z4idts2pI0eMoS23S7W1d8LjvqhcDBH+wtu1Kypqg/JZh2b6lp77TBNvJsQ9Aatp5c+kKJOt
        lB1A9IzyL3GpB6Y1AwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrMIsWRmVeSWpSXmKPExsVy+t/xe7oht2bFGrw7Ym2xccZ6VovrX56z
        Wpw/v4Hd4mPPPVaLGef3MVn8u7aRxaL96UtmB3aPTas62Tz6tqxi9Pi8SS6AOUrPpii/tCRV
        ISO/uMRWKdrQwkjP0NJCz8jEUs/Q2DzWyshUSd/OJiU1J7MstUjfLkEvY2f3QqaCZ8wV+zZt
        ZG1gnMzcxcjJISFgInHkxks2EFtIYCmjxNk2Noi4jMTJaQ2sELawxJ9rXUBxLqCa14wSs2a8
        BUsIC9hJPPl7gRHEFhFIlthzfRNYEbPAFkaJiW/aWCE69jFKrHy+HqyDTcBQouttF9gKXqDu
        ozsXgJ3BIqAisWbvEaYuRg4OUYFYiU17zSBKBCVOznzCAmJzClhInD1yBsxmFjCTmLf5ITOE
        LS+x/e0cKFtc4taT+UwTGIVmIWmfhaRlFpKWWUhaFjCyrGIUSS0tzk3PLTbSK07MLS7NS9dL
        zs/dxAiMsG3Hfm7Zwdj1LvgQowAHoxIPr4fmrFgh1sSy4srcQ4wSHMxKIrxyS2fECvGmJFZW
        pRblxxeV5qQWH2I0BfptIrOUaHI+MPrzSuINTQ3NLSwNzY3Njc0slMR5OwQOxggJpCeWpGan
        phakFsH0MXFwSjUwXjnx2vqkQkLrxyyfm0lT53W6RkZu8ejaVVYhYaL+LOLx3E+9oucsXjCY
        iM14+/pC9tvGfyeyJ9Q/Whpdckxeri7k9y/97FNfvRmX6HK/+Ny3WHztsblTIyQ13L4tlVy2
        3OhphjQXX6rx5Y/BETHa+rNWvLO4seZ/gz5vfnzk460Mt2revuWbqMRSnJFoqMVcVJwIALNc
        Vw3GAgAA
X-CMS-MailID: 20191007062524eucas1p2bfd37d582228164410e59840bb9c2196
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20191002085320eucas1p2e4c35fe7783deb38fbd2e9f87f4f1234
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20191002085320eucas1p2e4c35fe7783deb38fbd2e9f87f4f1234
References: <CGME20191002085320eucas1p2e4c35fe7783deb38fbd2e9f87f4f1234@eucas1p2.samsung.com>
        <20191002085309.9473-1-m.szyprowski@samsung.com>
        <20191004214510.AFDCB2133F@mail.kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 04.10.2019 23:45, Stephen Boyd wrote:
> Quoting Marek Szyprowski (2019-10-02 01:53:09)
>> Add checking the value returned by samsung_clk_alloc_reg_dump() and
>> devm_kcalloc(). While fixing this, also release all gathered clocks.
>>
>> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
>> ---
> Any fixes tag?

Fixes: 523d3de41f02 ("clk: samsung: exynos5433: Add support for runtime PM")

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

