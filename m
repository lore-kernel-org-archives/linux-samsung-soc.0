From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: Re: [RFC][PATCH] serial: samsung: Use single interrupt handler for
 s3c64xx and higher SoC's
Date: Fri, 12 Aug 2011 15:41:38 +0530
Message-ID: <CAJuYYwQnCXyia8W77oLUONWX0sTr2FydMajcErsxMt1NhcyQ6w@mail.gmail.com>
References: <1312734133-27727-1-git-send-email-thomas.abraham@linaro.org>
	<008801cc58d7$36575dd0$a3061970$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-yx0-f174.google.com ([209.85.213.174]:43951 "EHLO
	mail-yx0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752155Ab1HLKLj (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 12 Aug 2011 06:11:39 -0400
Received: by yxj19 with SMTP id 19so1834636yxj.19
        for <linux-samsung-soc@vger.kernel.org>; Fri, 12 Aug 2011 03:11:38 -0700 (PDT)
In-Reply-To: <008801cc58d7$36575dd0$a3061970$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, grant.likely@secretlab.ca, ben-linux@fluff.org

Hi Mr. Kim,

On 12 August 2011 15:34, Kukjin Kim <kgene.kim@samsung.com> wrote:
> Thomas Abraham wrote:
>>
>> s3c64xx and higher SoC's include the interrupt mask and pending registers
>> in the uart controller, unlike the s3c24xx SoC's which have these
> registers
>> in the interrupt controller. When the mask and pending registers are part
>> of the uart controller, it is easier to manage interrupts with a single
>> interrupt rather than having to create 3 seperate tx/rx/err interrupts.
>>
>> This patch modifies the tx/rx/err uart interrupt handling for s3c64xx
>> SoC's and higher by registering a single interrupt handler. This makes
>> it easier to add device tree support as well.
>>
>> Suggested-by: Grant Likely <grant.likely@secretlab.ca>
>> CC: Ben Dooks <ben-linux@fluff.org>
>> Signed-off-by: Thomas Abraham <thomas.abraham@linaro.org>
>> ---
>> Tested on Exynos4 smdkv310 only. If this approach is acceptable, it will
> be
>> tested it on s3c64xx and all s5p SoC's (should work on all as the changes
>> are generic). This is a bulky patch but it will split into smaller patches
>> if the approach is acceptable.
>>
> Hi Thomas,
>
> Hmm, could you please test this on other boards before split?
> And I need to check whether this is available on s3c24xx SoCs or not...

This patchset has been tested on most if the smdk boards. It has been tested for

SMDK2440, SMDK2416, SMDK6410, SMDK6440, SMDK6450, SMDKC100, SMDKV210, SMDKV310.

Thanks,
Thomas.

>
> Thanks.
>
> Best regards,
> Kgene.
> --
> Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
> SW Solution Development Team, Samsung Electronics Co., Ltd.
>
>
