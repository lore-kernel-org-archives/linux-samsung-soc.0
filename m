From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH 3/3] clk: samsung: remove unnecessary inclusion of header
 files from clk.h
Date: Wed, 03 Dec 2014 13:04:20 +0100
Message-ID: <547EFC44.2030105@samsung.com>
References: <1411796519-19417-1-git-send-email-pankaj.dubey@samsung.com>
 <1411796519-19417-4-git-send-email-pankaj.dubey@samsung.com>
 <547DD98D.3000101@samsung.com> <547EF728.90505@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:42357 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752513AbaLCMEf (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 3 Dec 2014 07:04:35 -0500
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout3.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0NG000JGI9ODN220@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 03 Dec 2014 12:07:26 +0000 (GMT)
In-reply-to: <547EF728.90505@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Pankaj Dubey <pankaj.dubey@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, tomasz.figa@gmail.com, mturquette@linaro.org, naushad@samsung.com

On 03/12/14 12:42, Pankaj Dubey wrote:
> Hi Sylwester,
> 
> On Tuesday 02 December 2014 08:53 PM, Sylwester Nawrocki wrote:
>> Hi Pankaj,
>>
>> On 27/09/14 07:41, Pankaj Dubey wrote:
>>> Let's remove unnecessary include of header files from clk.h and add
>>> required one in clk.c
>>>
>>> Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>
>>> ---
>>>   drivers/clk/samsung/clk.c |    3 ++-
>>>   drivers/clk/samsung/clk.h |    4 ----
>>>   2 files changed, 2 insertions(+), 5 deletions(-)
>>>
>> Please make sure there is no build breaks with various configs when
>> sending patches.
> 
> I am sure that I compile tested this before submitting. Looks like 
> following commit [1] needs "linux/syscore-ops.h" in clk.c, before that 
> it was not needed.
> 
> 1: clk: samsung: Factor out the common code to clk.c [SHA_ID: 
> 16a9013b83b5106c83cf]

OK, my apologies then for not investigating it further.

> Anyways, I can see patches are not getting cleanly applied so, just now 
> I resend them [2] after rebasing please have a look.

There is no need to resend, the patches are already applied into
my tree

git://linuxtv.org/snawrocki/samsung.git for-v3.19/clk-next

I will probably send a second pull request for Mike today.
Just need to figure out what to do with the patches addressing
the dependency of the audio clock controller control registers
on the APLL clock.

--
Regards,
Sylwester
