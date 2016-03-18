From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: Re: [PATCH v3] rtc: s3c: Don't print an error on probe deferral
Date: Fri, 18 Mar 2016 10:44:12 -0300
Message-ID: <56EC062C.8060702@osg.samsung.com>
References: <1458005918-7893-1-git-send-email-javier@osg.samsung.com>
 <56E76A57.7070104@samsung.com> <56E76C6F.5020803@osg.samsung.com>
 <56E772F2.2030507@samsung.com> <56E77A6A.2090604@osg.samsung.com>
 <56EBED45.6070000@osg.samsung.com> <20160318120717.GD2531@piout.net>
 <20160318130312.GE2531@piout.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from lists.s-osg.org ([54.187.51.154]:54468 "EHLO lists.s-osg.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753267AbcCRNoV (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 18 Mar 2016 09:44:21 -0400
In-Reply-To: <20160318130312.GE2531@piout.net>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>, linux-kernel@vger.kernel.org, Joe Perches <joe@perches.com>, linux-samsung-soc@vger.kernel.org, rtc-linux@googlegroups.com

Hello Alexandre,

On 03/18/2016 10:03 AM, Alexandre Belloni wrote:
> On 18/03/2016 at 13:07:17 +0100, Alexandre Belloni wrote :
>> On 18/03/2016 at 08:57:57 -0300, Javier Martinez Canillas wrote :
>>>>>> But yes, we can at least get rid of the else statement. I don't have a
>>>>>> strong opinion about the debug information, I left it to avoid someone
>>>>>> to tell me that I was removing a useful log.
>>>>>
>>>>> Although dev_dbg doesn't harm... but isn't driver core printing debug
>>>>> message already?
>>>>>
>>>>
>>>> I don't think it does or at least I didn't find it when looking
>>>> at the devm_clk_get() call chain.
>>>>  
>>>>> BR,
>>>>> Krzysztof
>>>>>
>>>
>>> Just to make sure that I understood correctly, there's no action I
>>> should take in order for this patch to be picked right? IOW, the
>>> current version is OK?
>>>
>>
>> I was kind of waiting an answer on the question whether the core already
>> prints a message when probe dereferral happens because in that case,
>> there is no need for a debug message and we can indeed simplify the
>> whole block.
> 
> Ok, I've found the recent commit 13fcffbbdec4e4863a9a9c7792b821cd6d363a8f
> 
> I'll take the patch as is.
> 
> 

Great, thanks!

Best regards,
-- 
Javier Martinez Canillas
Open Source Group
Samsung Research America
