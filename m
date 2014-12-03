From: Pankaj Dubey <pankaj.dubey@samsung.com>
Subject: Re: [PATCH 3/3] clk: samsung: remove unnecessary inclusion of header
 files from clk.h
Date: Wed, 03 Dec 2014 17:12:32 +0530
Message-ID: <547EF728.90505@samsung.com>
References: <1411796519-19417-1-git-send-email-pankaj.dubey@samsung.com>
 <1411796519-19417-4-git-send-email-pankaj.dubey@samsung.com>
 <547DD98D.3000101@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:64024 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752141AbaLCLml (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 3 Dec 2014 06:42:41 -0500
Received: from epcpsbgr5.samsung.com
 (u145.gpu120.samsung.co.kr [203.254.230.145])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0NG000JQU8J4JF60@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 03 Dec 2014 20:42:40 +0900 (KST)
In-reply-to: <547DD98D.3000101@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, tomasz.figa@gmail.com, mturquette@linaro.org, naushad@samsung.com

Hi Sylwester,

On Tuesday 02 December 2014 08:53 PM, Sylwester Nawrocki wrote:
> Hi Pankaj,
>
> On 27/09/14 07:41, Pankaj Dubey wrote:
>> Let's remove unnecessary include of header files from clk.h and add
>> required one in clk.c
>>
>> Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>
>> ---
>>   drivers/clk/samsung/clk.c |    3 ++-
>>   drivers/clk/samsung/clk.h |    4 ----
>>   2 files changed, 2 insertions(+), 5 deletions(-)
>>
> Please make sure there is no build breaks with various configs when
> sending patches.

I am sure that I compile tested this before submitting. Looks like 
following commit [1] needs "linux/syscore-ops.h" in clk.c, before that 
it was not needed.

1: clk: samsung: Factor out the common code to clk.c [SHA_ID: 
16a9013b83b5106c83cf]

Anyways, I can see patches are not getting cleanly applied so, just now 
I resend them [2] after rebasing please have a look.

2: http://comments.gmane.org/gmane.linux.kernel.samsung-soc/40639

Thanks,
Pankaj Dubey
>
> --
> Regards,
> Sylwester
>
