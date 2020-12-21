Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4718C433E9
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 21 Dec 2020 08:26:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 90A1822CAF
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 21 Dec 2020 08:26:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727280AbgLUI0T (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 21 Dec 2020 03:26:19 -0500
Received: from mailout1.w1.samsung.com ([210.118.77.11]:49893 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727093AbgLUI0T (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 21 Dec 2020 03:26:19 -0500
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20201221082527euoutp0117c6407cd73205ffe774e57abbdd1860~SrdByoPco0430204302euoutp01Q
        for <linux-samsung-soc@vger.kernel.org>; Mon, 21 Dec 2020 08:25:27 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20201221082527euoutp0117c6407cd73205ffe774e57abbdd1860~SrdByoPco0430204302euoutp01Q
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1608539127;
        bh=aXYOZaoJwEphzZdnF8VsSwt3JU/V9YyroOepbj1WWl4=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=CqH8ots+7j1g38YGknbBMtsFEioqIDl8+c4kOwnJqyFrT/OO9o/1dksImGM+WVsvh
         iYWEqlIKjCX3HPr1JB2rnr6LOHpPtr4yn/bxpMStu0y/H8PGvxJ4HME6u7nDjx0zbJ
         Wj9meJ51Gxe0Tel3g4jY5AD+ueBESB9IBuM0/cZU=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20201221082520eucas1p1ad2f5624bdf307d304398b52504429af~Src6zmK0n0284802848eucas1p1N;
        Mon, 21 Dec 2020 08:25:20 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges2new.samsung.com (EUCPMTA) with SMTP id F9.8D.44805.0FB50EF5; Mon, 21
        Dec 2020 08:25:20 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20201221082519eucas1p194b4112f452aad59054656bca7b7680d~Src6V8hOt2280822808eucas1p1B;
        Mon, 21 Dec 2020 08:25:19 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20201221082519eusmtrp25c7b09b5855be28f8dc327ca0839cc3b~Src6VPWuq0863008630eusmtrp2A;
        Mon, 21 Dec 2020 08:25:19 +0000 (GMT)
X-AuditID: cbfec7f4-b4fff7000000af05-55-5fe05bf0076e
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id 60.9B.16282.FEB50EF5; Mon, 21
        Dec 2020 08:25:19 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20201221082519eusmtip2983f22edeba8fe361a544a9160520007~Src5yFWzx0091300913eusmtip2N;
        Mon, 21 Dec 2020 08:25:19 +0000 (GMT)
Subject: Re: [PATCH 9/9] mfd: sec-irq: Do not enforce (incorrect) interrupt
 trigger type
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Lee Jones <lee.jones@linaro.org>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sylwester Nawrocki <snawrocki@kernel.org>
From:   Marek Szyprowski <m.szyprowski@samsung.com>
Message-ID: <04ff52f6-a3e7-10cd-5d19-e953d1e158d7@samsung.com>
Date:   Mon, 21 Dec 2020 09:25:18 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0)
        Gecko/20100101 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <20201221075500.GA3386@kozik-lap>
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrFKsWRmVeSWpSXmKPExsWy7djPc7ofoh/EG9z+w26xccZ6VovrX56z
        Wsw/co7V4vz5DewW978eZbTY9Pgaq8XlXXPYLGac38dk0br3CLtF+9OXzA5cHptWdbJ53Lm2
        h81j85J6j74tqxg9Pm+SC2CN4rJJSc3JLEst0rdL4Mo4dpuz4ABfxde9b9gaGL9ydzFyckgI
        mEj8+f+RpYuRi0NIYAWjxNmWE+wgCSGBL4wSy095QyQ+M0r8erCfDabjwKWnzBBFyxklXt6s
        gbA/Mkqs3AbWLCwQJfH19QKwGhEBTYnrf7+zggxiFrjBJLH05C9GkASbgKFE19susKG8AnYS
        azZ/ZwGxWQRUJe5PXgcWFxVIkljf9QOqRlDi5MwnYDWcAnoSz49cALOZBeQlmrfOZoawxSVu
        PZnPBLJMQuANh8S/pw+YIK52kbj4sosZwhaWeHV8CzuELSPxfydMQzOjxMNza9khnB5GictN
        Mxghqqwl7pz7BXQGB9AKTYn1u/Qhwo4Sh0/0MYGEJQT4JG68FYQ4gk9i0rbpzBBhXomONiGI
        ajWJWcfXwa09eOES8wRGpVlIXpuF5J1ZSN6ZhbB3ASPLKkbx1NLi3PTUYqO81HK94sTc4tK8
        dL3k/NxNjMDkdPrf8S87GJe/+qh3iJGJg/EQowQHs5IIr5nU/Xgh3pTEyqrUovz4otKc1OJD
        jNIcLErivElb1sQLCaQnlqRmp6YWpBbBZJk4OKUamHzMJTeIJkZJf0jaeOVh/uQ3hadu8X2x
        CWacHLDUXsJ55l+XIKeyDZPa5dacW/Wi+HlETPyMje9WTT/0aLrc5N5lhrJf7j6Yzu7kPk0/
        7XLoNalH4v36246FRX6/culefPZRNmUG19SJAduELCdM3pGuf+CB0TE5xQAbt++Fcn/KXRd1
        OLDsf//p56ucO+rH5+3nb/0+Q/Pm9iQTYU25pL9lLVf2/JZe6ftB9ofZy3R/6ZBvxku3rl3/
        9VSTZuiHefqmW3pMHCS+dZV/KI8MX250Xkrt3aPfvaqVp/iXS94z+LDxWHC1uVZe/VJTd8/l
        9qHPXyqu6pqlXHDyavdeKwMfgZ74xOqE99K9nz/Pk1ViKc5INNRiLipOBAC1fanCvQMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrLIsWRmVeSWpSXmKPExsVy+t/xe7rvox/EG0zuVrfYOGM9q8X1L89Z
        LeYfOcdqcf78BnaL+1+PMlpsenyN1eLyrjlsFjPO72OyaN17hN2i/elLZgcuj02rOtk87lzb
        w+axeUm9R9+WVYwenzfJBbBG6dkU5ZeWpCpk5BeX2CpFG1oY6RlaWugZmVjqGRqbx1oZmSrp
        29mkpOZklqUW6dsl6GUcu81ZcICv4uveN2wNjF+5uxg5OSQETCQOXHrK3MXIxSEksJRR4vnk
        3cwQCRmJk9MaWCFsYYk/17rYIIreM0r8+f4bLCEsECXx9fUCsAYRAU2J63+/g8WZBW4xSRw/
        JQLR8JxJomHSBLAEm4ChRNdbkEmcHLwCdhJrNn9nAbFZBFQl7k9eBxTn4BAVSJI4e1oQokRQ
        4uTMJ2AlnAJ6Es+PXGCBmG8mMW/zQ2YIW16ieetsKFtc4taT+UwTGIVmIWmfhaRlFpKWWUha
        FjCyrGIUSS0tzk3PLTbSK07MLS7NS9dLzs/dxAiMx23Hfm7Zwbjy1Ue9Q4xMHIyHGCU4mJVE
        eM2k7scL8aYkVlalFuXHF5XmpBYfYjQFemcis5Rocj4wIeSVxBuaGZgamphZGphamhkrifOa
        HFkTLySQnliSmp2aWpBaBNPHxMEp1cDEvnfn06UOab6WjvuSX98w6xaeysPq+mNP+KeMXacs
        Wde8yM1+l5LzZBLfMol93LPmPMkSV4+orM1gdHjp90fLdu+LGa3n1l16NUtx0Q2psx29ud/v
        av5p82vhb3y87mJ8i9HpeMMSyUS1h0kb+7qqlm1waHnomP8r79Jrt1uX74Rs/+ZY2LBeLXLR
        5ImrJp7QEp+7sSrznM2eW+ZLT5jzB2/+G3LG3FRtsUyqmPQ+iZMy17bkGG+y1ipqkPXeUbTI
        pct+uXfN+vTEiZZV+ZWP7m2b/lhQs+PC9lfT27IY/i8+O2Pjte8PZXTjN+9hj5VmmrnFXu/H
        vmcXStzXb5ff5dZq8XntWjlznqffzyxtV2Ipzkg01GIuKk4EAIBdJhpQAwAA
X-CMS-MailID: 20201221082519eucas1p194b4112f452aad59054656bca7b7680d
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20201210212938eucas1p1297b8503e9c059f2bc77c3a429a9114e
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20201210212938eucas1p1297b8503e9c059f2bc77c3a429a9114e
References: <20201210212903.216728-1-krzk@kernel.org>
        <CGME20201210212938eucas1p1297b8503e9c059f2bc77c3a429a9114e@eucas1p1.samsung.com>
        <20201210212903.216728-9-krzk@kernel.org>
        <0f1509ef-9ae7-7a77-84b7-360b8f0071c7@samsung.com>
        <20201218142247.GA2847@kozik-lap>
        <52a1b7c6-c7f1-f5eb-09f6-d84663912db8@samsung.com>
        <20201221075500.GA3386@kozik-lap>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 21.12.2020 08:55, Krzysztof Kozlowski wrote:
> On Mon, Dec 21, 2020 at 08:36:02AM +0100, Marek Szyprowski wrote:
>> On 18.12.2020 15:22, Krzysztof Kozlowski wrote:
>>> On Fri, Dec 18, 2020 at 02:25:39PM +0100, Marek Szyprowski wrote:
>>>> On 10.12.2020 22:29, Krzysztof Kozlowski wrote:
>>>>> Interrupt line can be configured on different hardware in different way,
>>>>> even inverted.  Therefore driver should not enforce specific trigger
>>>>> type - edge falling - but instead rely on Devicetree to configure it.
>>>>>
>>>>> The Samsung PMIC drivers are used only on Devicetree boards.
>>>>>
>>>>> Additionally, the PMIC datasheets describe the interrupt line as active
>>>>> low with a requirement of acknowledge from the CPU therefore the edge
>>>>> falling is not correct.
>>>>>
>>>>> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
>>>> Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
>>>>
>>>> It looks that this together with DTS change fixes RTC alarm failure that
>>>> I've observed from time to time on TM2e board!
>>> Great! I'll add this to the commit msg.
>>>
>>> Thanks for testing.
>> BTW, while playing with this, maybe it would make sense to fix the
>> reported interrupt type for the PMIC sub-interrupts:
>>
>> # grep s2mps /proc/interrupts
>> 120:          0      gpa0   7 Level     s2mps13
>> 121:          0   s2mps13  10 Edge      rtc-alarm0
> I also spotted this. It's a virtual interrupt and I am not sure whether
> we can actually configure it when the hardware does not allow to set the
> type (the regmap_irq_type requires register offsets).

I know that it is virtual, but maybe the regmap code could simply copy 
the interrupt type from its parent interrupt?

Best regards

-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

