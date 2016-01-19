From: Yadwinder Singh Brar <yadi.brar01@gmail.com>
Subject: Re: [PATCH 2/2] clk: s2mps11: allocate only one structure for clock init
Date: Tue, 19 Jan 2016 00:00:52 -0800
Message-ID: <CAKew6eWRev=U_4LeptMGjhz1-zNG1djiZJx4NLf0LoLQMNHQTg@mail.gmail.com>
References: <1453105525-31506-1-git-send-email-andi.shyti@samsung.com>
	<1453105525-31506-3-git-send-email-andi.shyti@samsung.com>
	<CAKew6eX4WZa4595ZUhiX+Ndc_WCzBNJBh5ejzxaJVkCnAskCYw@mail.gmail.com>
	<20160119024316.GA3793@samsunx.samsung>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-io0-f194.google.com ([209.85.223.194]:34881 "EHLO
	mail-io0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757321AbcASIAx (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 19 Jan 2016 03:00:53 -0500
In-Reply-To: <20160119024316.GA3793@samsunx.samsung>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Andi Shyti <andi.shyti@samsung.com>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Sangbeom Kim <sbkim73@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, linux-kernel <linux-kernel@vger.kernel.org>, linux-clk@vger.kernel.org, Andi Shyti <andi@etezian.org>

On Mon, Jan 18, 2016 at 6:43 PM, Andi Shyti <andi.shyti@samsung.com> wrote:
> Hi Yadwinder,
>
>>     The driver allocates three structures for three different clock
>>     types. They are quite similar and in the clock init data they
>>     differ only by the name. Only one of these structure is used,
>>     while the others lie unused in the memory.
>>
>>
>> If you are worried about memory, they can be made __initdata by
>> creating a copy during probe.
>
> mmmhhh... allocating in boot time as much as we want and then copy
> what we need? It doesn't look that pretty to me.
>

I think its not a new practice and I don't see any issue with it.

>>     The clock's name, though, is not such a meaningful information
>>
>>
>> I think it can be meaningful in debugging.
>
> Can you explain what's the use of the naming other than
> debugging?
>

Isn't debugging important enough ?  :)

I had misunderstood your below statement.
Looking at code, it seems its still using different names for different clocks.

>>     and by assigning the same name to the initial data we can avoid
>>     over allocation. The common name chosen will be s2mps11,
>>     coherently with the device driver name, instead of the clock
>>     device.
>>
>>     Therefore, remove the structures associated to s2mps13 and
>>     s2mps14 and use only the one referred to s2mps11 for all kind of
>>     clocks.
>>
>>
>> IMHO, with all these modifications, it will leave driver with some extra
>> checks and reduced readability, perhaps will make it complex to add
>> support for similar clocks but with different clk_ops, if next version or
>>  any similar mfd chip comes up in future.
>
> In that case, when the new chip will come, we would need to
> figure out something,

Different structures were introduced to handle such cases and keep
driver simple and clean by keeping keep no. of if() checks as limited
as possible.

> but for sure I don't see it as a good idea
> to leave allocated unused structures.
>

Even a single unused structure isn't a good idea, in case where this driver
doesn't get probed. :)

Regards,
Yadwinder

> Thanks,
> Andi
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
