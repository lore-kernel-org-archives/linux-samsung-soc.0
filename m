From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH] clk: Correct handling of NULL clk in __clk_{get, put}
Date: Fri, 10 Jan 2014 11:04:57 +0100
Message-ID: <52CFC5C9.4000006@samsung.com>
References: <1389096223-23934-1-git-send-email-s.nawrocki@samsung.com>
 <CAK9yfHx+=X+DiLe_WsiDkYonKCssPTOGqR76=+7N6eyAHXyQGQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:24505 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751592AbaAJKFV (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 10 Jan 2014 05:05:21 -0500
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout2.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MZ60059MK0T5U00@mailout2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 10 Jan 2014 10:05:17 +0000 (GMT)
In-reply-to: <CAK9yfHx+=X+DiLe_WsiDkYonKCssPTOGqR76=+7N6eyAHXyQGQ@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sachin Kamat <sachin.kamat@linaro.org>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Mike Turquette <mturquette@linaro.org>, Tomasz Figa <tomasz.figa@gmail.com>

On 08/01/14 05:44, Sachin Kamat wrote:
> Hi Sylwester,
> 
> On 7 January 2014 17:33, Sylwester Nawrocki <s.nawrocki@samsung.com> wrote:
>> Ensure clk->kref is dereferenced only when clk is not NULL.
>>
>> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
>> ---
>> Hi Sachin,
>>
>> please try if this patch fixes the exyno5420 boot crash.
> 
> Confirmed that this patch works fine on 5420 as well as already
> working 4210 and 5250 boards.
> Thanks for the quick fix.
> 
> Tested-by: Sachin Kamat <sachin.kamat@linaro.org>

Thanks Sachin. Mike, it seems we need this patch on top of
my clk-unregister branch. Sorry for overlooking this issue.
Could you add the $subject patch to your clk-next tree ?

Regards,
Sylwester
