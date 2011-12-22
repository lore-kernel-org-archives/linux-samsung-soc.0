From: Denis Kuzmenko <linux@solonet.org.ua>
Subject: Re: [PATCHv2 resend] Fix compilation error when CONFIG_CPU_FREQ_S3C24XX_DEBUGFS
 selected.
Date: Thu, 22 Dec 2011 02:40:22 +0200
Message-ID: <4EF27C76.3020805@solonet.org.ua>
References: <4EE7BE5F.8020108@solonet.org.ua> <064501ccbfae$cf1e5cb0$6d5b1610$%kim@samsung.com> <4EF23852.1050304@solonet.org.ua> <06fa01ccc02c$828b6810$87a23830$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-we0-f174.google.com ([74.125.82.174]:63997 "EHLO
	mail-we0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752562Ab1LVAo1 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 21 Dec 2011 19:44:27 -0500
In-Reply-To: <06fa01ccc02c$828b6810$87a23830$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 'Russell King' <linux@arm.linux.org.uk>, 'Ben Dooks' <ben-linux@fluff.org>

On 12/22/2011 12:04 AM, Kukjin Kim wrote:
> Denis Kuzmenko wrote:
>>
>> On 12/21/2011 09:04 AM, Kukjin Kim wrote:
>>> Denis Kuzmenko wrote:
>>>>
>>>> Fix compilation error when CONFIG_CPU_FREQ_S3C24XX_DEBUGFS selected.
>>>>
>>>> Signed-off-by: Denis Kuzmenko <linux@solonet.org.ua>
>>>> ---
>>>>
>>>> Patch is against 3.2-rc4.
>>>> CONFIG_S3C2410_IOTIMING is not selected for MACH_MINI2440. Because of
>> this
>>>> the
>>>> file s3c2410-iotiming.c is not ever compiled and enabling
>>>> CONFIG_CPU_FREQ_S3C24XX_DEBUGFS option caused undefined reference to
>>>> function
>>>> s3c2410_iotiming_debugfs defined in that file. s3c2410_iotiming_debugfs
>>>> defined
>>>> as NULL for this case.
>>>>
>>> Hi Denis,
>>>
>>> Well, there is no error when CONFIG_CPU_FREQ_S3C24XX_DEBUGFS selected in
>> my
>>> case and s3c2410-iotiming.c is built...when is it happened? I just
>> selected
>>> every regarding configuration in kernel menuconfig...
>>
>> Please, try attached config (it's still failing in v3.2-rc6).
>>
> Hi Denis,
> 
> Yes, when s3c2410 stuff is not selected, it happened.
> Look at me soon and thanks.
Hi, Kukjin,

Sorry, can you please explain as I can't understand. Especially second
sentence.

-- 
Best regards, Denis Kuzmenko.
