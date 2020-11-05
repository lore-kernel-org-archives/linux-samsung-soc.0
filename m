Return-Path: <SRS0=idU0=EL=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DFCDC388F7
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  5 Nov 2020 11:26:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3E4C320759
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  5 Nov 2020 11:26:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729113AbgKEL0D (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 5 Nov 2020 06:26:03 -0500
Received: from foss.arm.com ([217.140.110.172]:57968 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726715AbgKEL0D (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 5 Nov 2020 06:26:03 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9A1C7142F;
        Thu,  5 Nov 2020 03:26:02 -0800 (PST)
Received: from [10.57.54.223] (unknown [10.57.54.223])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 221F63F719;
        Thu,  5 Nov 2020 03:26:00 -0800 (PST)
Subject: Re: [PATCH] ARM: dts: exynos: Assign a fixed index to mmc devices on
 exynos4412 based ODROID boards
To:     Markus Reichl <m.reichl@fivetechno.de>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Rob Herring <robh+dt@kernel.org>,
        Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <CGME20201104102634eucas1p2ec7b705dd5092afa25d9877d1014f46a@eucas1p2.samsung.com>
 <20201104102558.11070-1-m.reichl@fivetechno.de>
 <efe8a911-6072-59fb-8a8e-d5cdb4352cab@samsung.com>
 <5800260a-5332-f627-eb36-32df4fbf05e3@fivetechno.de>
 <c1040872-0ae1-3988-29d0-60c8a711cdb1@samsung.com>
 <71e4ecca-b980-e224-0fbe-b30330e490fb@samsung.com>
 <2ddf7343-799b-418b-bb00-a926f1030db7@fivetechno.de>
From:   Robin Murphy <robin.murphy@arm.com>
Message-ID: <be911d41-c707-f482-4966-476b9330bde7@arm.com>
Date:   Thu, 5 Nov 2020 11:26:00 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <2ddf7343-799b-418b-bb00-a926f1030db7@fivetechno.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 2020-11-05 08:31, Markus Reichl wrote:
> Hi Marek,
> 
> on rk3399 the proposed ordering [1] is according to base address in DT.

FWIW, note that in RK3399's case the SoC itself provides no logical 
numbering to follow - the pin groups are named "EMMC", "SDIO0" and 
"SDMMC0" in the datasheet, while the TRM uses "emmc", "sdio" and "sdmmc" 
in signal and register names.

If the SoC *does* have an inherent notion of numbered interfaces, I 
would agree that following that numbering is the most logical thing to do.

Robin.

> 
> [1]
> https://patchwork.kernel.org/patch/11881427
> 
> Am 04.11.20 um 14:44 schrieb Marek Szyprowski:
>> On 04.11.2020 14:13, Marek Szyprowski wrote:
>>> On 04.11.2020 14:06, Markus Reichl wrote:
>>>> Am 04.11.20 um 13:25 schrieb Marek Szyprowski:
>>>>> On 04.11.2020 11:25, Markus Reichl wrote:
>>>>>> Recently introduced async probe on mmc devices can shuffle block IDs.
>>>>>> Pin them to fixed values to ease booting in evironments where UUIDs
>>>>>> ar not practical.
>>>>>> Use newly introduced aliases for mmcblk devices from [1].
>>>>>>
>>>>>> [1]
>>>>>> https://patchwork.kernel.org/patch/11747669/
>>>>>>
>>>>>> Signed-off-by: Markus Reichl <m.reichl@fivetechno.de>
>>>>>> ---
>>>>>>    arch/arm/boot/dts/exynos4412-odroid-common.dtsi | 5 +++++
>>>>>>    1 file changed, 5 insertions(+)
>>>>>>
>>>>>> diff --git a/arch/arm/boot/dts/exynos4412-odroid-common.dtsi
>>>>>> b/arch/arm/boot/dts/exynos4412-odroid-common.dtsi
>>>>>> index a5c1ce1e396c..aa10d5bc7e1c 100644
>>>>>> --- a/arch/arm/boot/dts/exynos4412-odroid-common.dtsi
>>>>>> +++ b/arch/arm/boot/dts/exynos4412-odroid-common.dtsi
>>>>>> @@ -13,6 +13,11 @@
>>>>>>    #include "exynos-mfc-reserved-memory.dtsi"
>>>>>>      / {
>>>>>> +    aliases {
>>>>>> +        mmc0 = &sdhci_2;
>>>>>> +        mmc1 = &mshc_0;
>>>>> Like in the OdroidXU3-family patch, I would use 0 for the eMMC 
>>>>> (mshc_0)
>>>>> and 2 for the SD-card (sdhci_2).
>>>> How to deal then with sdhci_0 (from exynos4.dtsi) vc. mshc_0 (from
>>>> exynos4412.dts)?
>>> sdhci_0 and mshc_0 both operate on the same physical MMC0 bus, so this
>>> is not an issue. They cannot be used simultaneously. The latter is just
>>> faster, the first one has been left there mainly for the software
>>> compatibility.
>>
>> I've thought a bit more on this and I would simply prefer to add generic
>> MMC aliases to the top-level Exynos dtsi files (3250, 4210, 4412, 5250,
>> 5410, 5420) to keep Linux logical MMC bus numbers in sync with the HW
>> bus numbers on all boards.
>>
>> Best regards
>>
> 
> Gruß,
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
> 
