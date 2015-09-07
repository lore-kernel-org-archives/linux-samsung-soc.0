From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH 01/11] clk: samsung: exynos7: Change the CMU_TOPC block
 clock name
Date: Mon, 07 Sep 2015 16:39:46 +0900
Message-ID: <55ED3F42.6040703@samsung.com>
References: <1441366637-28001-1-git-send-email-alim.akhtar@samsung.com>
 <1441366637-28001-2-git-send-email-alim.akhtar@samsung.com>
 <55ED21B7.6080608@samsung.com> <55ED3C43.4000408@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:49375 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751224AbbIGHjz (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 7 Sep 2015 03:39:55 -0400
In-reply-to: <55ED3C43.4000408@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Alim Akhtar <alim.akhtar@samsung.com>, linux-samsung-soc@vger.kernel.org
Cc: s.nawrocki@samsung.com, tomasz.figa@gmail.com, kgene@kernel.org, mturquette@baylibre.com, amit.daniel@samsung.com, gautam.vivek@samsung.com, sboyd@codeaurora.org, linux-clk@vger.kernel.org

On 07.09.2015 16:26, Alim Akhtar wrote:
> Hi Krzysztof,
> 
> On 09/07/2015 11:03 AM, Krzysztof Kozlowski wrote:
>> On 04.09.2015 20:37, Alim Akhtar wrote:
>>> Corrects the CMU_TOPC block clock name as per user manual.
>>> This also adds few of the missing gate clocks of topc block.
>>> This does not change any functionalies.
>>
>> s/functionalies/functionalities/
>>
>> Yes, it does change. After adding new gates without users, kernel will
>> disable them. Previously these gates remained in default reset state
>> (probably "pass") or in state set by bootloader (also "pass").
>>
> My bad, was not enough clear of that, what I mean is these changes does
> not affect the working of the related IPs, yes it does change the status
> of gate clocks.
> Will update the commit log.
> 
>> Please update the changelog and of course test the patchset for any
>> issues in different components depending on these clocks. Depending
>> directly or indirectly.
>>
>> Split the patch into:
>> 1. clean up/rename,
>> 2. addition of new mux/gate clock.
>>
> This patch adds few of the gate clocks, the reason I added it here
> because subsequent patches in this series can use it.
> Or may I should move these new addition to the patch 02/11, as 02/11 is
> going to use them.
> Do you think that make sense to you?

>From the reviewer point of view I would prefer to separate renaming from
addition. You can rename the CMU_TOPC in patch #1, add new gates in #2
and continue with the work (more renames).

> 
>> Currently it is more difficult to review the patch.
>>
> Thanks for your time, do you have any comments of the other patches in
> this series?

Not yet. I'll look at them in few days. So it's up to you if you want to
send next version now or wait for my further comments.

Best regards,
Krzysztof
