From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: Re: [PATCH Resend 1/1] clk: exynos5250: Add CLK_SET_RATE_PARENT flag
 to mout_apll
Date: Fri, 3 Jan 2014 08:55:28 +0530
Message-ID: <CAK9yfHzaMyrvvhxfV9KH-gEdcaQNAHPJ3KnUx9wcUi5BqUYpAw@mail.gmail.com>
References: <1387442019-2445-1-git-send-email-sachin.kamat@linaro.org>
	<3616477.6ZBKa1KffA@amdc1227>
	<CAK9yfHxu0f-ZSkM76HWYOpRRXvzYR2Gu2zc3-sgzMPp+_1JvWQ@mail.gmail.com>
	<3836526.9kWglB5ajS@amdc1227>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ob0-f179.google.com ([209.85.214.179]:34827 "EHLO
	mail-ob0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751521AbaACDZ3 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 2 Jan 2014 22:25:29 -0500
Received: by mail-ob0-f179.google.com with SMTP id wm4so15255934obc.10
        for <linux-samsung-soc@vger.kernel.org>; Thu, 02 Jan 2014 19:25:29 -0800 (PST)
In-Reply-To: <3836526.9kWglB5ajS@amdc1227>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <t.figa@samsung.com>
Cc: Mike Turquette <mturquette@linaro.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>

Hi Tomasz,

On 2 January 2014 20:54, Tomasz Figa <t.figa@samsung.com> wrote:
> Hi Sachin,
>
> On Tuesday 31 of December 2013 08:24:02 Sachin Kamat wrote:
>> On 30 December 2013 23:21, Tomasz Figa <t.figa@samsung.com> wrote:
>> > On Thursday 19 of December 2013 11:37:08 Mike Turquette wrote:
>> >> Quoting Sachin Kamat (2013-12-19 00:33:39)
>> >> > Add CLK_SET_RATE_PARENT flag to mout_apll clock. This will let us set the
>> >> > clock rate in the cpufreq driver.
>> >> >
>> >> > Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
>> >>
>> >> Ack.
>> >
>> > Applied onto next branch.
>>
>> Thanks Tomasz. But did not find this branch in your tree [1].
>
> I haven't pushed the branches yet, as I'm yet to collect some patches
> and acks
>
>> Also, please consider adding your tree to linux-next.
>
> Hmm, I would consider this tree only as a staging to send pull requests
> for Mike, so patches should be hitting clk-next tree quickly after getting
> there. I don't think this makes a need to add this tree to linux-next.

Yes, if the window period between the patches landing into your tree
and Mike's tree
is relatively small, then there is no need. Else it would be good to
avoid merge conflicts
and ease further development and testing.


-- 
With warm regards,
Sachin
