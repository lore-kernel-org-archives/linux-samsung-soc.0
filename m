Return-Path: <SRS0=OVUx=EK=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3636AC2D0A3
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  4 Nov 2020 12:42:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C4905221F8
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  4 Nov 2020 12:42:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729089AbgKDMmZ (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 4 Nov 2020 07:42:25 -0500
Received: from wp126.webpack.hosteurope.de ([80.237.132.133]:56112 "EHLO
        wp126.webpack.hosteurope.de" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726527AbgKDMmZ (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 4 Nov 2020 07:42:25 -0500
Received: from [2003:a:659:3f00:1e6f:65ff:fe31:d1d5] (helo=hermes.fivetechno.de); authenticated
        by wp126.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        id 1kaI7G-0007Zz-II; Wed, 04 Nov 2020 13:42:18 +0100
X-Virus-Scanned: by amavisd-new 2.11.1 using newest ClamAV at
        linuxbbg.five-lan.de
Received: from [192.168.34.101] (p5098d998.dip0.t-ipconnect.de [80.152.217.152])
        (authenticated bits=0)
        by hermes.fivetechno.de (8.15.2/8.14.5/SuSE Linux 0.8) with ESMTPSA id 0A4CgHFC013236
        (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
        Wed, 4 Nov 2020 13:42:17 +0100
Subject: Re: [PATCH] ARM: dts: exynos: Assign a fixed index to mmc devices on
 ODROID XU3/4 boards
To:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <CGME20201104105152eucas1p28eb6ca629a685f24a2463c72898fdbc5@eucas1p2.samsung.com>
 <20201104100855.2337-1-m.reichl@fivetechno.de>
 <4ac01b71-e806-18c8-13ce-6acdcc1a3b41@samsung.com>
From:   Markus Reichl <m.reichl@fivetechno.de>
Organization: five technologies GmbH
Message-ID: <28660119-ffe3-cd01-0daa-8c0994e29571@fivetechno.de>
Date:   Wed, 4 Nov 2020 13:42:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <4ac01b71-e806-18c8-13ce-6acdcc1a3b41@samsung.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: de-DE
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de;m.reichl@fivetechno.de;1604493744;183e66c4;
X-HE-SMSGID: 1kaI7G-0007Zz-II
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi Marek,

Am 04.11.20 um 13:24 schrieb Marek Szyprowski:
> Hi Markus,
> 
> On 04.11.2020 11:08, Markus Reichl wrote:
>> Recently introduced async probe on mmc devices can shuffle block IDs.
>> Pin them to fixed values to ease booting in evironments where UUIDs
>> are not practical. Use newly introduced aliases for mmcblk devices from [1].
>>
>> [1]
>> https://patchwork.kernel.org/patch/11747669/
> 
> Wow, this is a long standing issue, called by others 'a feature'. Good
> that this has been finally solved.
> 
>> Signed-off-by: Markus Reichl <m.reichl@fivetechno.de>
>> ---
>>   arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi | 5 +++++
>>   1 file changed, 5 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi b/arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi
>> index e35af40a55cb..91d2840ac8ca 100644
>> --- a/arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi
>> +++ b/arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi
>> @@ -13,6 +13,11 @@
>>   #include "exynos5422-odroid-core.dtsi"
>>   
>>   / {
>> +	aliases {
>> +		mmc0 = &mmc_2;
>> +		mmc1 = &mmc_0;
> 
> Frankly, I would keep the MMC numbers the same as in u-boot and
> datasheets. 0 for the build-in eMMC and 2 for the SD-card. This would be
> much more natural. On the other hand, I would agree to do it differently
> only on Odroid HC1/HD2/MC1, which don't have build-in eMMC - just use 0
> there for the SD-card.

This would break present and long standing  boot ordering in mainline, which is
mmcblk0 = SD-card and
mmcblk1 = eMMC

Still desired?
> 
>> +	};
>> +
>>   	gpio-keys {
>>   		compatible = "gpio-keys";
>>   		pinctrl-names = "default";
> 
> Best regards
> 

Gruß,
-- 
Markus Reichl
