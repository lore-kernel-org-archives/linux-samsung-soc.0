From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH Resend 1/1] clk: exynos5250: Add CLK_SET_RATE_PARENT flag
 to mout_apll
Date: Thu, 02 Jan 2014 16:24:53 +0100
Message-ID: <3836526.9kWglB5ajS@amdc1227>
References: <1387442019-2445-1-git-send-email-sachin.kamat@linaro.org>
 <3616477.6ZBKa1KffA@amdc1227>
 <CAK9yfHxu0f-ZSkM76HWYOpRRXvzYR2Gu2zc3-sgzMPp+_1JvWQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:34027 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751380AbaABPY5 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 2 Jan 2014 10:24:57 -0500
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout3.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MYS00FWZ5HKNS60@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 02 Jan 2014 15:24:56 +0000 (GMT)
In-reply-to: <CAK9yfHxu0f-ZSkM76HWYOpRRXvzYR2Gu2zc3-sgzMPp+_1JvWQ@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sachin Kamat <sachin.kamat@linaro.org>
Cc: Mike Turquette <mturquette@linaro.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>

Hi Sachin,

On Tuesday 31 of December 2013 08:24:02 Sachin Kamat wrote:
> On 30 December 2013 23:21, Tomasz Figa <t.figa@samsung.com> wrote:
> > On Thursday 19 of December 2013 11:37:08 Mike Turquette wrote:
> >> Quoting Sachin Kamat (2013-12-19 00:33:39)
> >> > Add CLK_SET_RATE_PARENT flag to mout_apll clock. This will let us set the
> >> > clock rate in the cpufreq driver.
> >> >
> >> > Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
> >>
> >> Ack.
> >
> > Applied onto next branch.
> 
> Thanks Tomasz. But did not find this branch in your tree [1].

I haven't pushed the branches yet, as I'm yet to collect some patches
and acks

> Also, please consider adding your tree to linux-next.

Hmm, I would consider this tree only as a staging to send pull requests
for Mike, so patches should be hitting clk-next tree quickly after getting
there. I don't think this makes a need to add this tree to linux-next.

Best regards,
Tomasz
