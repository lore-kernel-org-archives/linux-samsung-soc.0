From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH v3 00/10] ARM: exynos multiplatform series, part 1
Date: Fri, 19 Apr 2013 15:51:36 +0200
Message-ID: <51714BE8.8000401@samsung.com>
References: <1365716245-99231-1-git-send-email-arnd@arndb.de>
 <201304191536.17796.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:61222 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S968179Ab3DSNvj (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 19 Apr 2013 09:51:39 -0400
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout1.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MLI003V195V8Y30@mailout1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 19 Apr 2013 14:51:37 +0100 (BST)
In-reply-to: <201304191536.17796.arnd@arndb.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Kukjin Kim <kgene.kim@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Olof Johansson <olof@lixom.net>

On 04/19/2013 03:36 PM, Arnd Bergmann wrote:
> On Thursday 11 April 2013, Arnd Bergmann wrote:
>> These are the patches that I would like to apply directly to
>> the arm-soc next/multiplatform branch, unless you have any
>> objections. This would get all the simple stuff out of the
>> way, and I don't think there is a big risk of introducing
>> regressions with these.
>>
>> A lot of the other patches have already been merged into
>> subsystem trees. After this series in in arm-soc, what is
>> left comes down to
>>
>> * The ASoC conversion to dmaengine won't make it unless someone
>>   who knows that code better steps up to do it right away. This
>>   means that we won't have audio in a 3.10 multiplatform kernel
>>   on Exynos, but it will still work for users that don't enable
>>   multiplatform.
>>
>> * The irqchip (combiner), clk and clksource patches are all based
>>   on top   of other changesets we pulled in from your trees, so I
>>   would not make them part of the next/multiplatform branch. We can
>>   apply them on top of the next/drivers branch once they are
>>   tested successfully.
>>
>> * A trivial patch is needed in the end to actually make
>>   CONFIG_ARCH_EXYNOS visible in multiplatform configurations.
>>   We will do that as a separate patch once everything else is
>>   there.
>>
>> Please provide an ACK so I can put this into arm-soc, or let
>> me know if I screwed up somewhere.
> 
> No reply?
> 
> I'm putting them into the next/multiplatform branch now, with
> the exception of the i2c patch that is already in the i2c
> tree.
> 
> I've tested this on the Arndale board and am putting it into
> the next/multiplatform branch now as a stepping stone for
> part two, which will be a late branch at best, if we decide
> to merge it in 3.10.

I've reviewed this patch series and nothing concerning jumps.
Please feel free to add

Reviewed-by: Sylwester Nawrocki <s.nawrocki@samsung.com>

if still possible.

Thanks.

Sylwester
