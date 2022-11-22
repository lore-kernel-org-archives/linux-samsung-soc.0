Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFBB8C4332F
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 22 Nov 2022 16:52:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231475AbiKVQwP (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 22 Nov 2022 11:52:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232355AbiKVQwN (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 22 Nov 2022 11:52:13 -0500
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id D592870A23;
        Tue, 22 Nov 2022 08:52:11 -0800 (PST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 20B591FB;
        Tue, 22 Nov 2022 08:52:18 -0800 (PST)
Received: from [10.34.100.128] (pierre123.nice.arm.com [10.34.100.128])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 585093F73D;
        Tue, 22 Nov 2022 08:52:10 -0800 (PST)
Message-ID: <7681ba8e-1036-7540-5eda-417ed204d35f@arm.com>
Date:   Tue, 22 Nov 2022 17:52:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: (subset) [PATCH 06/20] arm64: dts: Update cache properties for
 exynos
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-kernel@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob.Herring@arm.com, linux-samsung-soc@vger.kernel.org
References: <20221031091945.531874-1-pierre.gondois@arm.com>
 <166742051292.139492.12539582422109367063.b4-ty@linaro.org>
Content-Language: en-US
From:   Pierre Gondois <pierre.gondois@arm.com>
In-Reply-To: <166742051292.139492.12539582422109367063.b4-ty@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hello Krzysztof,

This patch and [1] were dropped after a bad patch management from my part.
v1 and v2 are identical, but [2] lead to the 2 patches to be removed.
Not willing to worsen the situation, I wanted to wait a bit before getting
back to these 2 patches and let them be removed.
Would it be possible to take back these 2 patches ?

Regards,
Pierre

[1] https://lore.kernel.org/all/2d8b2d85-7bc6-026a-baf9-11a47171ddc5@linaro.org/
[2] https://lore.kernel.org/all/bb36df3f-5aee-256a-4d64-eaeb9bff998e@arm.com/

On 11/2/22 21:21, Krzysztof Kozlowski wrote:
> On Mon, 31 Oct 2022 10:19:45 +0100, Pierre Gondois wrote:
>> The DeviceTree Specification v0.3 specifies that the cache node
>> 'compatible' and 'cache-level' properties are 'required'. Cf.
>> s3.8 Multi-level and Shared Cache Nodes
>>
>> The recently added init_of_cache_level() function checks
>> these properties. Add them if missing.
>>
>> [...]
> 
> Applied, thanks!
> 
> [06/20] arm64: dts: Update cache properties for exynos
>          https://git.kernel.org/krzk/linux/c/58710ae94589a2b2baaab6b6986064b691124b0d
> 
> Best regards,
