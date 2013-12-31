From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: Re: [PATCH Resend 1/1] clk: exynos5250: Add CLK_SET_RATE_PARENT flag
 to mout_apll
Date: Tue, 31 Dec 2013 08:24:02 +0530
Message-ID: <CAK9yfHxu0f-ZSkM76HWYOpRRXvzYR2Gu2zc3-sgzMPp+_1JvWQ@mail.gmail.com>
References: <1387442019-2445-1-git-send-email-sachin.kamat@linaro.org>
	<20131219193708.18119.53403@quantum>
	<3616477.6ZBKa1KffA@amdc1227>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-oa0-f41.google.com ([209.85.219.41]:56410 "EHLO
	mail-oa0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752559Ab3LaCyC (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 30 Dec 2013 21:54:02 -0500
Received: by mail-oa0-f41.google.com with SMTP id j17so12771093oag.28
        for <linux-samsung-soc@vger.kernel.org>; Mon, 30 Dec 2013 18:54:02 -0800 (PST)
In-Reply-To: <3616477.6ZBKa1KffA@amdc1227>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <t.figa@samsung.com>
Cc: Mike Turquette <mturquette@linaro.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>

On 30 December 2013 23:21, Tomasz Figa <t.figa@samsung.com> wrote:
> On Thursday 19 of December 2013 11:37:08 Mike Turquette wrote:
>> Quoting Sachin Kamat (2013-12-19 00:33:39)
>> > Add CLK_SET_RATE_PARENT flag to mout_apll clock. This will let us set the
>> > clock rate in the cpufreq driver.
>> >
>> > Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
>>
>> Ack.
>
> Applied onto next branch.

Thanks Tomasz. But did not find this branch in your tree [1].
Also, please consider adding your tree to linux-next.

[1] git://git.kernel.org/pub/scm/linux/kernel/git/tfiga/samsung-clk.git

---
With warm regards,
Sachin
