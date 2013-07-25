From: Sylwester Nawrocki <sylvester.nawrocki@gmail.com>
Subject: Re: [PATCH] clk: exynos4: Add CLK_GET_RATE_NOCACHE flag for the Exynos4x12
 ISP clocks
Date: Thu, 25 Jul 2013 23:13:25 +0200
Message-ID: <51F194F5.8040303@gmail.com>
References: <1372099374-21008-1-git-send-email-s.nawrocki@samsung.com> <51ED2230.8080100@samsung.com> <20130725202337.7598.20912@quantum>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-bk0-f44.google.com ([209.85.214.44]:44304 "EHLO
	mail-bk0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755252Ab3GYVNa (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 25 Jul 2013 17:13:30 -0400
In-Reply-To: <20130725202337.7598.20912@quantum>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mike Turquette <mturquette@linaro.org>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>, kyungmin.park@samsung.com, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org

On 07/25/2013 10:23 PM, Mike Turquette wrote:
> Quoting Sylwester Nawrocki (2013-07-22 05:14:40)
>> On 06/24/2013 08:42 PM, Sylwester Nawrocki wrote:
>>> The ISP clock registers belong to the ISP power domain and may change
>>> their values if this power domain is switched off/on. Add
>>> CLK_GET_RATE_NOCACHE flags to ensure we do not rely on invalid cached
>>> data when setting or getting frequency of those clocks.
>>>
>>> Signed-off-by: Sylwester Nawrocki<s.nawrocki@samsung.com>
>>> Signed-off-by: Kyungmin Park<kyungmin.park@samsung.com>
>>
>> Mike,
>>
>> would you consider queueing that patch for current -rc cycle ?
>
> Sylwester,
>
> Can you rebase this onto -rc2? It does not apply cleanly onto my -fixes
> branch.

Sure, I've just posted an updated version.

Thanks,
Sylwester
