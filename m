Return-Path: <SRS0=OVUx=EK=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEC4FC2D0A3
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  4 Nov 2020 13:50:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 884262236F
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  4 Nov 2020 13:50:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729787AbgKDNuw (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 4 Nov 2020 08:50:52 -0500
Received: from wp126.webpack.hosteurope.de ([80.237.132.133]:40526 "EHLO
        wp126.webpack.hosteurope.de" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726608AbgKDNuw (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 4 Nov 2020 08:50:52 -0500
Received: from [2003:a:659:3f00:1e6f:65ff:fe31:d1d5] (helo=hermes.fivetechno.de); authenticated
        by wp126.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        id 1kaJBY-0000QJ-Qg; Wed, 04 Nov 2020 14:50:48 +0100
X-Virus-Scanned: by amavisd-new 2.11.1 using newest ClamAV at
        linuxbbg.five-lan.de
Received: from [192.168.34.101] (p5098d998.dip0.t-ipconnect.de [80.152.217.152])
        (authenticated bits=0)
        by hermes.fivetechno.de (8.15.2/8.14.5/SuSE Linux 0.8) with ESMTPSA id 0A4DolqS015853
        (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
        Wed, 4 Nov 2020 14:50:47 +0100
Subject: Re: [PATCH] ARM: dts: exynos: Assign a fixed index to mmc devices on
 exynos4412 based ODROID boards
To:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Rob Herring <robh+dt@kernel.org>,
        Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <CGME20201104102634eucas1p2ec7b705dd5092afa25d9877d1014f46a@eucas1p2.samsung.com>
 <20201104102558.11070-1-m.reichl@fivetechno.de>
 <efe8a911-6072-59fb-8a8e-d5cdb4352cab@samsung.com>
 <5800260a-5332-f627-eb36-32df4fbf05e3@fivetechno.de>
 <c1040872-0ae1-3988-29d0-60c8a711cdb1@samsung.com>
 <71e4ecca-b980-e224-0fbe-b30330e490fb@samsung.com>
From:   Markus Reichl <m.reichl@fivetechno.de>
Organization: five technologies GmbH
Message-ID: <14ebf07b-54cb-64a5-fa34-9ad82da72bd2@fivetechno.de>
Date:   Wed, 4 Nov 2020 14:50:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <71e4ecca-b980-e224-0fbe-b30330e490fb@samsung.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: de-DE
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de;m.reichl@fivetechno.de;1604497852;bff4b310;
X-HE-SMSGID: 1kaJBY-0000QJ-Qg
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi Marek,

Am 04.11.20 um 14:44 schrieb Marek Szyprowski:
> On 04.11.2020 14:13, Marek Szyprowski wrote:
>> On 04.11.2020 14:06, Markus Reichl wrote:
>>> Am 04.11.20 um 13:25 schrieb Marek Szyprowski:
>>>> On 04.11.2020 11:25, Markus Reichl wrote:
>>>>> Recently introduced async probe on mmc devices can shuffle block IDs.
>>>>> Pin them to fixed values to ease booting in evironments where UUIDs
>>>>> ar not practical.
>>>>> Use newly introduced aliases for mmcblk devices from [1].
>>>>>
>>>>> [1]
>>>>> https://patchwork.kernel.org/patch/11747669/
>>>>>
>>>>> Signed-off-by: Markus Reichl <m.reichl@fivetechno.de>
>>>>> ---
>>>>>    arch/arm/boot/dts/exynos4412-odroid-common.dtsi | 5 +++++
>>>>>    1 file changed, 5 insertions(+)
>>>>>
>>>>> diff --git a/arch/arm/boot/dts/exynos4412-odroid-common.dtsi
>>>>> b/arch/arm/boot/dts/exynos4412-odroid-common.dtsi
>>>>> index a5c1ce1e396c..aa10d5bc7e1c 100644
>>>>> --- a/arch/arm/boot/dts/exynos4412-odroid-common.dtsi
>>>>> +++ b/arch/arm/boot/dts/exynos4412-odroid-common.dtsi
>>>>> @@ -13,6 +13,11 @@
>>>>>    #include "exynos-mfc-reserved-memory.dtsi"
>>>>>      / {
>>>>> +    aliases {
>>>>> +        mmc0 = &sdhci_2;
>>>>> +        mmc1 = &mshc_0;
>>>> Like in the OdroidXU3-family patch, I would use 0 for the eMMC (mshc_0)
>>>> and 2 for the SD-card (sdhci_2).
>>> How to deal then with sdhci_0 (from exynos4.dtsi) vc. mshc_0 (from
>>> exynos4412.dts)?
>> sdhci_0 and mshc_0 both operate on the same physical MMC0 bus, so this
>> is not an issue. They cannot be used simultaneously. The latter is just
>> faster, the first one has been left there mainly for the software
>> compatibility.
> 
> I've thought a bit more on this and I would simply prefer to add generic
> MMC aliases to the top-level Exynos dtsi files (3250, 4210, 4412, 5250,
> 5410, 5420) to keep Linux logical MMC bus numbers in sync with the HW
> bus numbers on all boards.

Ok, fine with me.
As this is beyond my knowledge I would like leave this task with you.

> 
> Best regards
> 

Gruß,
-- 
Markus Reichl
