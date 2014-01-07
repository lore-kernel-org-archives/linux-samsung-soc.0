From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH] clk: Correct handling of NULL clk in __clk_{get, put}
Date: Tue, 07 Jan 2014 14:14:54 +0100
Message-ID: <52CBFDCE.7060206@samsung.com>
References: <1389096223-23934-1-git-send-email-s.nawrocki@samsung.com>
 <20140107140019.7220eed6@ipc1.ka-ro>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:36800 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750834AbaAGNPQ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 7 Jan 2014 08:15:16 -0500
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout4.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MZ100MY48TELC60@mailout4.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 07 Jan 2014 13:15:14 +0000 (GMT)
In-reply-to: <20140107140019.7220eed6@ipc1.ka-ro>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?UTF-8?B?TG90aGFyIFdhw59tYW5u?= <LW@KARO-electronics.de>
Cc: sachin.kamat@linaro.org, linux-samsung-soc@vger.kernel.org, mturquette@linaro.org, tomasz.figa@gmail.com, linux-arm-kernel@lists.infradead.org

Hi,

On 07/01/14 14:00, Lothar Wa=C3=9Fmann wrote:
> Sylwester Nawrocki wrote:
>> Ensure clk->kref is dereferenced only when clk is not NULL.
>>
>> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
>> ---
>> Hi Sachin,
>>
>> please try if this patch fixes the exyno5420 boot crash.
>>
>> Thanks,
>> Sylwester
>>
>>  drivers/clk/clk.c |   13 +++++++------
>>  1 file changed, 7 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
>> index e3e0327..a1fe86f 100644
>> --- a/drivers/clk/clk.c
>> +++ b/drivers/clk/clk.c
>> @@ -2179,24 +2179,25 @@ EXPORT_SYMBOL_GPL(devm_clk_unregister);
>>   */
>>  int __clk_get(struct clk *clk)
>>  {
>> -	if (clk && !try_module_get(clk->owner))
>> -		return 0;
>> +	if (clk) {
>> +		if (!try_module_get(clk->owner))
>> +			return 0;
>>
> This change is unnecessary! The part after the && is only evaluated
> when clk is not NULL.

It is, but to ensure there is no NULL clk passed at the kref_get(&clk->=
ref)
line everything got moved under a common "if (clk) { }".

The code will look like this:

-----------
	if (clk) {
		if (!try_module_get(clk->owner))
			return 0;

		kref_get(&clk->ref);
	}
------------

If preferred I could make it:

------------
if (clk && !try_module_get(clk->owner))
	return 0;

if (clk)
	kref_get(&clk->ref);
------------

--
Regards,
Sylwester
