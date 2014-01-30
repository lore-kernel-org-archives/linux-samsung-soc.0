From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: Re: [PATCH] clk: Correct handling of NULL clk in __clk_{get, put}
Date: Thu, 30 Jan 2014 10:20:48 +0530
Message-ID: <CAK9yfHxnrM--A_SZSBWzQ2B7zrtU+=n77H61bzq4ddtLrpHMBg@mail.gmail.com>
References: <1389096223-23934-1-git-send-email-s.nawrocki@samsung.com>
	<CAK9yfHx+=X+DiLe_WsiDkYonKCssPTOGqR76=+7N6eyAHXyQGQ@mail.gmail.com>
	<52CFC5C9.4000006@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ob0-f177.google.com ([209.85.214.177]:52115 "EHLO
	mail-ob0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752983AbaA3Eut (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 29 Jan 2014 23:50:49 -0500
Received: by mail-ob0-f177.google.com with SMTP id wp18so2975294obc.22
        for <linux-samsung-soc@vger.kernel.org>; Wed, 29 Jan 2014 20:50:48 -0800 (PST)
In-Reply-To: <52CFC5C9.4000006@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Mike Turquette <mturquette@linaro.org>, Tomasz Figa <tomasz.figa@gmail.com>

On 10 January 2014 15:34, Sylwester Nawrocki <s.nawrocki@samsung.com> wrote:
> On 08/01/14 05:44, Sachin Kamat wrote:
>> Hi Sylwester,
>>
>> On 7 January 2014 17:33, Sylwester Nawrocki <s.nawrocki@samsung.com> wrote:
>>> Ensure clk->kref is dereferenced only when clk is not NULL.
>>>
>>> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
>>> ---
>>> Hi Sachin,
>>>
>>> please try if this patch fixes the exyno5420 boot crash.
>>
>> Confirmed that this patch works fine on 5420 as well as already
>> working 4210 and 5250 boards.
>> Thanks for the quick fix.
>>
>> Tested-by: Sachin Kamat <sachin.kamat@linaro.org>
>
> Thanks Sachin. Mike, it seems we need this patch on top of
> my clk-unregister branch. Sorry for overlooking this issue.
> Could you add the $subject patch to your clk-next tree ?

Gentle ping Mike. Hope we can have this patch in rc-2.

-- 
With warm regards,
Sachin
