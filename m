From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [PATCH v2 2/3] arm64: defconfig: Enable ARCH_GH7 by default
Date: Wed, 12 Mar 2014 07:45:18 +0900
Message-ID: <531F91FE.4010609@samsung.com>
References: <1394491879-5320-1-git-send-email-kgene.kim@samsung.com> <1394491879-5320-3-git-send-email-kgene.kim@samsung.com> <20140311120145.GE31104@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f48.google.com ([209.85.160.48]:46461 "EHLO
	mail-pb0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755583AbaCKWpZ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 11 Mar 2014 18:45:25 -0400
Received: by mail-pb0-f48.google.com with SMTP id md12so194843pbc.35
        for <linux-samsung-soc@vger.kernel.org>; Tue, 11 Mar 2014 15:45:24 -0700 (PDT)
In-Reply-To: <20140311120145.GE31104@arm.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Kukjin Kim <kgene.kim@samsung.com>, Ilho Lee <ilho215.lee@samsung.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Thomas Abraham <thomas.ab@samsung.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

On 03/11/14 21:01, Catalin Marinas wrote:
> On Mon, Mar 10, 2014 at 10:51:18PM +0000, Kukjin Kim wrote:
>> This patch adds support for Samsung GH7 SoC in arm64/Kconfig and
>> enable Samsung GH7 based SSDK_GH7 in single defconfig for arm64.
>>
>> Signed-off-by: Kukjin Kim<kgene.kim@samsung.com>
>> Cc: Catalin Marinas<catalin.marinas@arm.com>
>> ---
>>   arch/arm64/Kconfig           | 3 +++
>>   arch/arm64/boot/dts/Makefile | 1 +
>>   arch/arm64/configs/defconfig | 1 +
>>   3 files changed, 5 insertions(+)
>>
>> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
>> index dd4327f..f0f2bf2 100644
>> --- a/arch/arm64/Kconfig
>> +++ b/arch/arm64/Kconfig
>> @@ -111,6 +111,9 @@ source "kernel/Kconfig.freezer"
>>
>>   menu "Platform selection"
>>
>> +config ARCH_GH7
>> +	bool
>
> You should add some text here so that people can disable it. The aim is
> single Image by default but I think we should let people disable certain
> platforms for more targeted deployments.
>
OK, I'll add and re-submit with Cc'ing dt mailing list.

Thanks,
Kukjin
