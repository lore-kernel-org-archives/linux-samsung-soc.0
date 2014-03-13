From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: Re: [PATCH 1/1] clk: exynos-5420: Fix VPLL lock offset
Date: Thu, 13 Mar 2014 20:27:04 +0530
Message-ID: <CAK9yfHyVVjfip2p6gDM8ghJ301NH9kTtVK1La53WPFfxxLD9nQ@mail.gmail.com>
References: <1394681222-27882-1-git-send-email-sachin.kamat@linaro.org>
	<53219C1C.1030501@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-oa0-f45.google.com ([209.85.219.45]:33667 "EHLO
	mail-oa0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751335AbaCMO5F (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 13 Mar 2014 10:57:05 -0400
Received: by mail-oa0-f45.google.com with SMTP id o6so1164187oag.4
        for <linux-samsung-soc@vger.kernel.org>; Thu, 13 Mar 2014 07:57:04 -0700 (PDT)
In-Reply-To: <53219C1C.1030501@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <t.figa@samsung.com>
Cc: linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Mike Turquette <mturquette@linaro.org>

On 13 March 2014 17:23, Tomasz Figa <t.figa@samsung.com> wrote:
> Hi Sachin,
>
>
> On 13.03.2014 04:27, Sachin Kamat wrote:
>>
>> Set it as per the user manual.
>>
>> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
>> ---

>
> Looks fine. Will queue for 3.15, since ATM there is no support for PLL rate
> setting on Exynos 5420 (no rate tables registered).

Yes, that is correct. Thanks Tomasz.

-- 
With warm regards,
Sachin
