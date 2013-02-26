From: Inderpal Singh <inderpal.singh@linaro.org>
Subject: Re: [PATCH v2] arm: plat-samsung: check processor type before cache
 restoration in resume
Date: Tue, 26 Feb 2013 16:57:43 +0530
Message-ID: <CAG17yqQ5rYsyNaP40P8Wd5h5zwDz6js2Gd-JYW3ht_nrxpNgZQ@mail.gmail.com>
References: <1361872613-12040-1-git-send-email-inderpal.singh@linaro.org>
	<20130226100222.GQ17833@n2100.arm.linux.org.uk>
	<CAG17yqRS2MxTxgVD0qx73BO0x8PWgCmqrQQ4+rDvP=MwMKj3qw@mail.gmail.com>
	<20130226112201.GR17833@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f177.google.com ([209.85.212.177]:35693 "EHLO
	mail-wi0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753754Ab3BZL1o (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 26 Feb 2013 06:27:44 -0500
Received: by mail-wi0-f177.google.com with SMTP id hm14so4483782wib.10
        for <linux-samsung-soc@vger.kernel.org>; Tue, 26 Feb 2013 03:27:43 -0800 (PST)
In-Reply-To: <20130226112201.GR17833@n2100.arm.linux.org.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kgene.kim@samsung.com, patches@linaro.org

On 26 February 2013 16:52, Russell King - ARM Linux
<linux@arm.linux.org.uk> wrote:
> On Tue, Feb 26, 2013 at 04:46:01PM +0530, Inderpal Singh wrote:
>> On 26 February 2013 15:32, Russell King - ARM Linux
>> <linux@arm.linux.org.uk> wrote:
>> > On Tue, Feb 26, 2013 at 03:26:53PM +0530, Inderpal Singh wrote:
>> >> Only cortex-a9 based samsung platforms have l2x0 cache controller. Hence check
>> >> the same before restoring the cache in resume.
>> >
>> > Why is this patch soo complicated?  Can't you read the CPUs MIDR register
>> > from assembly code?
>>
>> I wanted to read MIDR only once thats why didn't read in resume
>> function in assembly as the same resume function gets used in cpuidle
>> path.
>
> It's more expensive to load it from memory than to read it from CP15.

Ok, I will change it to read from CP15 in assembly and resubmit the patch.
Thanks for the review.

Regards,
Inder
