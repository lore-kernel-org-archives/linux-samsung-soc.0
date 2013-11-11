From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: Re: [PATCH 2/3] clk: exynos5250: fix sysmmu_mfc{l,r} gate clocks
Date: Mon, 11 Nov 2013 08:41:57 +0530
Message-ID: <CAK9yfHy+K66PZM2sjZqqxZjgkd9sZC=WyqGL8yiHL3tpQ_MO7Q@mail.gmail.com>
References: <1383905648-23733-1-git-send-email-sachin.kamat@linaro.org>
	<1383905648-23733-2-git-send-email-sachin.kamat@linaro.org>
	<2996623.YXg5JqReYS@flatron>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-oa0-f54.google.com ([209.85.219.54]:64643 "EHLO
	mail-oa0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751089Ab3KKDL6 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 10 Nov 2013 22:11:58 -0500
Received: by mail-oa0-f54.google.com with SMTP id o6so1227553oag.41
        for <linux-samsung-soc@vger.kernel.org>; Sun, 10 Nov 2013 19:11:57 -0800 (PST)
In-Reply-To: <2996623.YXg5JqReYS@flatron>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Andrew Bresticker <abrestic@chromium.org>, Tomasz Figa <t.figa@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Mike Turquette <mturquette@linaro.org>

Hi Tomasz,

On 10 November 2013 22:38, Tomasz Figa <tomasz.figa@gmail.com> wrote:
> Hi Sachin, Andrew,
>
> On Friday 08 of November 2013 15:44:07 Sachin Kamat wrote:
>> From: Andrew Bresticker <abrestic@chromium.org>
>>
>> The gate clocks for the MFC sysmmus appear to be flipped, i.e.
>> GATE_IP_MFC[2] gates sysmmu_mfcl and GATE_IP_MFC[1] gates sysmmu_mfcr.
>> Fix this so that the MFC will start up.
>
> Wow, this means that there is a mistake in the documentation. Not that
> I'm surprised, though.

Yes, there is a mistake in the TRM in this case.

>
> I guess you are sure about this, so:
>
> Reviewed-by: Tomasz Figa <t.figa@samsung.com>

Thanks.

-- 
With warm regards,
Sachin
