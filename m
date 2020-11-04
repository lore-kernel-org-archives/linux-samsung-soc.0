Return-Path: <SRS0=OVUx=EK=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4D92C2D0A3
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  4 Nov 2020 12:56:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4B1AD221F8
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  4 Nov 2020 12:56:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="eUsjMcQ1"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729584AbgKDM4j (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 4 Nov 2020 07:56:39 -0500
Received: from mailout1.w1.samsung.com ([210.118.77.11]:35004 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726350AbgKDM4i (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 4 Nov 2020 07:56:38 -0500
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20201104125626euoutp017d07d2b7a7e91666d42c24820e70f895~ET1NZYSp91884818848euoutp01w
        for <linux-samsung-soc@vger.kernel.org>; Wed,  4 Nov 2020 12:56:26 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20201104125626euoutp017d07d2b7a7e91666d42c24820e70f895~ET1NZYSp91884818848euoutp01w
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1604494586;
        bh=iqETSOZdDdI/U2x0pU5Jn/5vjNdQORa6en6gsJfdUok=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=eUsjMcQ1SXNYAc8+vKBqjK7IWbGOYlOCvihSzYT4kWLiP3wGSxFdw4O+In2I1FmRP
         Bg/FX+izpXLkavDfAEn2SBaf1JSwVDGbyNc1bbMA1DFnwf0YBo2X7joQ6gtmxPBUL5
         4zX0Huoc6Szmc1IWvrRRSCcl8WGvgJCDx/mwD7Uo=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20201104125621eucas1p2bf123ab5cbd0882c1f0242ebf272a8ed~ET1ITAfJ-2958829588eucas1p2R;
        Wed,  4 Nov 2020 12:56:21 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges3new.samsung.com (EUCPMTA) with SMTP id 80.91.06318.5F4A2AF5; Wed,  4
        Nov 2020 12:56:21 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20201104125620eucas1p2ec12bd2009bd35d7c587324c1ee4eb43~ET1HznL813123731237eucas1p2Z;
        Wed,  4 Nov 2020 12:56:20 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20201104125620eusmtrp106a1e6b03e2975bd5382e1618cfff3ec~ET1Ht6g2h3046530465eusmtrp19;
        Wed,  4 Nov 2020 12:56:20 +0000 (GMT)
X-AuditID: cbfec7f5-7c7939c0000018ae-87-5fa2a4f56265
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id 9A.CB.06017.4F4A2AF5; Wed,  4
        Nov 2020 12:56:20 +0000 (GMT)
Received: from [106.210.88.143] (unknown [106.210.88.143]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20201104125612eusmtip2cc085aa4bf3ba48289346f312611d602~ET1AZNxYw0178401784eusmtip2k;
        Wed,  4 Nov 2020 12:56:12 +0000 (GMT)
Subject: Re: [PATCH] ARM: dts: exynos: Assign a fixed index to mmc devices
 on ODROID XU3/4 boards
To:     Markus Reichl <m.reichl@fivetechno.de>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
From:   Marek Szyprowski <m.szyprowski@samsung.com>
Message-ID: <f78943ff-fb41-b2b8-5c50-0f46386a720c@samsung.com>
Date:   Wed, 4 Nov 2020 13:56:12 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0)
        Gecko/20100101 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <28660119-ffe3-cd01-0daa-8c0994e29571@fivetechno.de>
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrCKsWRmVeSWpSXmKPExsWy7djP87pflyyKN1j+ksVi/pFzrBbnz29g
        t9j0+BqrxeVdc9gsZpzfx2Tx8sgPRovWvUfYHdg9bt2p99i0qpPNY/OSeo/Pm+QCWKK4bFJS
        czLLUov07RK4MmY3PGcseMdf8aCpiamBsZW3i5GTQ0LARGL6o5PMXYxcHEICKxglFvV+YoRw
        vjBKTJrzggnC+QzkzFvHBNMy424/G0RiOaPE5gudUC3vGSUOrZ/HCFIlLJAssaN9MliHiECp
        RPusL2BLmAXaGSVOzbnBDpJgEzCU6HrbxQZi8wrYScx/vpa1i5GDg0VAReLyblmQsKhAksTf
        z3+YIUoEJU7OfMICUsIp4CjR0hgJEmYWkJdo3jqbGcIWl7j1ZD7Y1RIC69glJq/tZ4G42kVi
        94EvULawxKvjW9ghbBmJ05N7WCAamhklHp5byw7h9DBKXG6awQhRZS1x59wvNpDNzAKaEut3
        6UOEHSXWn3sHdpCEAJ/EjbeCEEfwSUzaNp0ZIswr0dEmBFGtJjHr+Dq4tQcvXGKewKg0C8ln
        s5C8MwvJO7MQ9i5gZFnFKJ5aWpybnlpsnJdarlecmFtcmpeul5yfu4kRmHZO/zv+dQfjvj9J
        hxgFOBiVeHgPbFsYL8SaWFZcmXuIUYKDWUmE1+ns6Tgh3pTEyqrUovz4otKc1OJDjNIcLEri
        vMaLXsYKCaQnlqRmp6YWpBbBZJk4OKUaGBt/ZSxyz/KP8HS6ubT6pAz31SXnTI31T375+Pzk
        69mHJV02Jx9fct8p1JyhdnOX89rNfMumKQU+51n2c7X3qaCYkl+/Nc9PMlJ9wnSRdyLTTgEP
        NsEdjLeifOMinRme75k55+PD/QfnJVTez92tbL1p4X2f7FpVsd8/TjVEiJ+d98RkeQvf1yNK
        LMUZiYZazEXFiQDgcbdfNwMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrKIsWRmVeSWpSXmKPExsVy+t/xe7pfliyKNzizV8Fi/pFzrBbnz29g
        t9j0+BqrxeVdc9gsZpzfx2Tx8sgPRovWvUfYHdg9bt2p99i0qpPNY/OSeo/Pm+QCWKL0bIry
        S0tSFTLyi0tslaINLYz0DC0t9IxMLPUMjc1jrYxMlfTtbFJSczLLUov07RL0MmY3PGcseMdf
        8aCpiamBsZW3i5GTQ0LARGLG3X62LkYuDiGBpYwSX9sesUAkZCROTmtghbCFJf5c64Iqesso
        8Xr9EkaQhLBAssT0TZfAikQESiV27VnDAlLELNDOKHHn7Ww2kISQwC9GibdbQ0FsNgFDia63
        XWBxXgE7ifnP1wI1c3CwCKhIXN4tCxIWFUiSeHlhKhNEiaDEyZlPWEBKOAUcJVoaI0HCzAJm
        EvM2P2SGsOUlmrfOhrLFJW49mc80gVFoFpLuWUhaZiFpmYWkZQEjyypGkdTS4tz03GIjveLE
        3OLSvHS95PzcTYzAKNt27OeWHYxd74IPMQpwMCrx8B7YtjBeiDWxrLgy9xCjBAezkgiv09nT
        cUK8KYmVValF+fFFpTmpxYcYTYFem8gsJZqcD0wAeSXxhqaG5haWhubG5sZmFkrivB0CB2OE
        BNITS1KzU1MLUotg+pg4OKUaGHeyvkpzmdjiUrDvzLuHVnV/Cy84nw6+u2fnMVmTkA1/GF9G
        p0nZztyTkr8qNm7u8cX6h3/yXF/1xVtO++VHUZ7znLr5+rluz4unVxr/qVfImdn8JkJC85dI
        6b17XdvYd9z7+7wy3ePshfVFRx4b7Whu3ZawMOvBhYWZbVqnmjoKlyrFu2UvDVBiKc5INNRi
        LipOBABHNBMByAIAAA==
X-CMS-MailID: 20201104125620eucas1p2ec12bd2009bd35d7c587324c1ee4eb43
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20201104105152eucas1p28eb6ca629a685f24a2463c72898fdbc5
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20201104105152eucas1p28eb6ca629a685f24a2463c72898fdbc5
References: <CGME20201104105152eucas1p28eb6ca629a685f24a2463c72898fdbc5@eucas1p2.samsung.com>
        <20201104100855.2337-1-m.reichl@fivetechno.de>
        <4ac01b71-e806-18c8-13ce-6acdcc1a3b41@samsung.com>
        <28660119-ffe3-cd01-0daa-8c0994e29571@fivetechno.de>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi Markus,

On 04.11.2020 13:42, Markus Reichl wrote:
> Am 04.11.20 um 13:24 schrieb Marek Szyprowski:
>> On 04.11.2020 11:08, Markus Reichl wrote:
>>> Recently introduced async probe on mmc devices can shuffle block IDs.
>>> Pin them to fixed values to ease booting in evironments where UUIDs
>>> are not practical. Use newly introduced aliases for mmcblk devices 
>>> from [1].
>>>
>>> [1]
>>> https://patchwork.kernel.org/patch/11747669/
>>
>> Wow, this is a long standing issue, called by others 'a feature'. Good
>> that this has been finally solved.
>>
>>> Signed-off-by: Markus Reichl <m.reichl@fivetechno.de>
>>> ---
>>>   arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi | 5 +++++
>>>   1 file changed, 5 insertions(+)
>>>
>>> diff --git a/arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi 
>>> b/arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi
>>> index e35af40a55cb..91d2840ac8ca 100644
>>> --- a/arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi
>>> +++ b/arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi
>>> @@ -13,6 +13,11 @@
>>>   #include "exynos5422-odroid-core.dtsi"
>>>     / {
>>> +    aliases {
>>> +        mmc0 = &mmc_2;
>>> +        mmc1 = &mmc_0;
>>
>> Frankly, I would keep the MMC numbers the same as in u-boot and
>> datasheets. 0 for the build-in eMMC and 2 for the SD-card. This would be
>> much more natural. On the other hand, I would agree to do it differently
>> only on Odroid HC1/HD2/MC1, which don't have build-in eMMC - just use 0
>> there for the SD-card.
>
> This would break present and long standing  boot ordering in mainline, 
> which is
> mmcblk0 = SD-card and
> mmcblk1 = eMMC
>
> Still desired?

Well, previously (before v4.0? I don't remember exactly when there was a 
first change), the order was exactly opposite. I think that going for 
the MMC bus numbers from the datasheet/schematic is the most appropriate 
approach.

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

