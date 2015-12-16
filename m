From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH 12/19] ARM: dts: exynos: replace legacy *,wakeup property
 with wakeup-source
Date: Thu, 17 Dec 2015 08:38:03 +0900
Message-ID: <5671F5DB.305@samsung.com>
References: <1445422216-29375-1-git-send-email-sudeep.holla@arm.com>
 <1445422216-29375-13-git-send-email-sudeep.holla@arm.com>
 <56704141.8070308@arm.com> <5670A2F2.5060009@samsung.com>
 <56713DD8.1050001@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:36865 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751424AbbLPXiF (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 16 Dec 2015 18:38:05 -0500
In-reply-to: <56713DD8.1050001@arm.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sudeep Holla <sudeep.holla@arm.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Kukjin Kim <kgene@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org

On 16.12.2015 19:32, Sudeep Holla wrote:
> 
> 
> On 15/12/15 23:32, Krzysztof Kozlowski wrote:
>> On 16.12.2015 01:35, Sudeep Holla wrote:
>>>
>>>
>>> On 21/10/15 11:10, Sudeep Holla wrote:
>>>> Though the keyboard and other driver will continue to support the
>>>> legacy
>>>> "gpio-key,wakeup", "linux-keypad,wakeup" boolean property to enable the
>>>> wakeup source, "wakeup-source" is the new standard binding.
>>>>
>>>> This patch replaces all the legacy wakeup properties with the unified
>>>> "wakeup-source" property in order to avoid any futher copy-paste
>>>> duplication.
>>>>
>>>> Cc: Kukjin Kim <kgene@kernel.org>
>>>> Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>
>>>
>>> Ping, do you prefer taking via your tree or should I send to armsoc
>>> directly ?
>>
>> Usually it depends on the dependencies... but:
>> 1. I just received this patch - 12/19.
> 
> Sorry for that. The initial idea was to show all the changes but merge
> the binding and dependencies first, so didn't cc all.
> 
>> 2. No cover letter, no other patches, no explanation about any
>> dependencies or other related changes. Nothing. Just one patch.
> 
> Yes this was initially posted as part of the series, but only
> dependencies were merged for v4.4
> 
>> 3. The patch mentions new standard binding. Was the new binding already
>> merged? Or is it part of these series? What about backward compatibility?
> 
> Not a brand new binding, but made existing one a standard so that we
> don't continue to be creative and generate more bindings for the same
> thing. Yes binding and dependent patches are already in mainline. And
> yes backward compatibility is maintained as mentioned in the commit
> message.

That explains everything, thanks. We'll take it through samsung-soc,
just give me some time for review.

As for other patch - the s5pv210 - I did not get it directly but I think
I can find it on list subscription archives.

Best regards,
Krzysztof
