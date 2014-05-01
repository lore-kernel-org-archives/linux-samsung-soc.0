From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: Re: [PATCH 1/1] clk: exynos-5420: Fix VPLL lock offset
Date: Thu, 1 May 2014 16:40:54 +0530
Message-ID: <CAK9yfHxg4CbfrpwwqO=xzCDeeoSWVXu4CU4haZEhvj1YszRCTA@mail.gmail.com>
References: <1394681222-27882-1-git-send-email-sachin.kamat@linaro.org>
	<53219C1C.1030501@samsung.com>
	<CAK9yfHyVVjfip2p6gDM8ghJ301NH9kTtVK1La53WPFfxxLD9nQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-oa0-f50.google.com ([209.85.219.50]:40766 "EHLO
	mail-oa0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753679AbaEALKy (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 1 May 2014 07:10:54 -0400
Received: by mail-oa0-f50.google.com with SMTP id i11so3408929oag.23
        for <linux-samsung-soc@vger.kernel.org>; Thu, 01 May 2014 04:10:54 -0700 (PDT)
In-Reply-To: <CAK9yfHyVVjfip2p6gDM8ghJ301NH9kTtVK1La53WPFfxxLD9nQ@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <t.figa@samsung.com>
Cc: linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Mike Turquette <mturquette@linaro.org>

Hi Tomasz,

On 13 March 2014 20:27, Sachin Kamat <sachin.kamat@linaro.org> wrote:
> On 13 March 2014 17:23, Tomasz Figa <t.figa@samsung.com> wrote:
>> Hi Sachin,
>>
>>
>> On 13.03.2014 04:27, Sachin Kamat wrote:
>>>
>>> Set it as per the user manual.
>>>
>>> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
>>> ---
>
>>
>> Looks fine. Will queue for 3.15, since ATM there is no support for PLL rate
>> setting on Exynos 5420 (no rate tables registered).
>
> Yes, that is correct. Thanks Tomasz.

Looks like this patch hasn't made it to mainline yet.

-- 
With warm regards,
Sachin
