From: Kukjin Kim <kgene@kernel.org>
Subject: Re: [PATCH] ARM: dts: Specify Odroid X2/U3 audio clock parents and
 rates
Date: Sat, 22 Nov 2014 23:40:51 +0900
Message-ID: <5470A073.7030203@kernel.org>
References: <1410360223-18363-1-git-send-email-s.nawrocki@samsung.com> <5432C5C5.7020206@samsung.com> <007701cfe1d1$3f4c1940$bde44bc0$@kernel.org> <546CBA09.8070308@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.19.201]:58305 "EHLO mail.kernel.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750781AbaKVOk4 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 22 Nov 2014 09:40:56 -0500
In-Reply-To: <546CBA09.8070308@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: Kukjin Kim <kgene@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, m.szyprowski@samsung.com

On 11/20/14 00:40, Sylwester Nawrocki wrote:
> On 07/10/14 03:51, Kukjin Kim wrote:
>>>> On 10/09/14 16:43, Sylwester Nawrocki wrote:
>>>>>> This ensures the core and the audio subsystem clocks are configured
>>>>>> properly, as expected by the sound machine driver. These bits are
>>>>>> missing to obtain proper audio sample rates in kernel v3.17, where
>>>>>> audio support for Odroid X2/U3 was first added.
>>>>>>
>>>>>> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
>>>>>> ---
>>>>>> It would be good to have it applied as a fix for v3.17.
>>>>
>>>> Anything happened to this patch ? I can't see it neither in Linus' nor
>>>> -next tree. And we are already at 3.18 merge window.
>>>>
>> Hi Sylwester,
>>
>> Sorry about that. I'll queue this one into fixes for -3.18 and stable maybe
>> +3.17 only if stable-3.17 is available...
> 
> Kukjin,
> 
> You didn't forget about this patch, did you ?
> It's been over 2 months since I've sent it and sound on Odroid X2/U3
> is still broken as it was then. Please send the patch upstream.
> 
Sylwester,

I've applied this just now and if required, we need to send out to
stable tree as well...sorry for that.

Thanks,
Kukjin
