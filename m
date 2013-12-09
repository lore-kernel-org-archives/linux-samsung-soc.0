From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: Re: [PATCH 1/1] clk: exynos5250: Add CLK_SET_RATE_PARENT flag to mout_apll
Date: Mon, 9 Dec 2013 21:50:16 +0530
Message-ID: <CAK9yfHwwsf7GqZ-7Fc_CwmnHf=A9GN7Dtqve7Woh+khJKr8oDA@mail.gmail.com>
References: <1385007454-5234-1-git-send-email-sachin.kamat@linaro.org>
	<1466487.IbnMiN0f0X@amdc1227>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-oa0-f51.google.com ([209.85.219.51]:50293 "EHLO
	mail-oa0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932796Ab3LIQUR (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 9 Dec 2013 11:20:17 -0500
Received: by mail-oa0-f51.google.com with SMTP id i7so4127241oag.10
        for <linux-samsung-soc@vger.kernel.org>; Mon, 09 Dec 2013 08:20:16 -0800 (PST)
In-Reply-To: <1466487.IbnMiN0f0X@amdc1227>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <t.figa@samsung.com>
Cc: linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Mike Turquette <mturquette@linaro.org>

Hi Tomasz,

On 9 December 2013 19:01, Tomasz Figa <t.figa@samsung.com> wrote:
> Hi Sachin,
>
> On Thursday 21 of November 2013 09:47:34 Sachin Kamat wrote:
>> Add CLK_SET_RATE_PARENT flag to be able to change the frequency
>> to desired value.
>>
>> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
>> ---
>>  drivers/clk/samsung/clk-exynos5250.c |    3 ++-
>>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> Your patch description is a bit off. It doesn't say frequency of what
> clock will be able to be changed to "desired value" and what is the reason
> for this change.

Yes, I realize that now. Will update and resend. Thanks for review.

-- 
With warm regards,
Sachin
