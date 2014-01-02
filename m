From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH 3/3] clk: exynos5250: register APLL rate table
Date: Thu, 02 Jan 2014 16:22:37 +0100
Message-ID: <1418540.7aJQgHWZYx@amdc1227>
References: <1383905648-23733-1-git-send-email-sachin.kamat@linaro.org>
 <CAK9yfHwTgKW55-ChHNToLGZZ-frd4OJF5Zi5Djt5NzxhOZvcrg@mail.gmail.com>
 <CAK9yfHxRmiUmWjxZx2Uoy37uuYjw03Z2Y=SxaB17Uc-3j1CH_A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:33956 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751769AbaABPWl (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 2 Jan 2014 10:22:41 -0500
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout3.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MYS00EZ15DRMB60@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 02 Jan 2014 15:22:39 +0000 (GMT)
In-reply-to: <CAK9yfHxRmiUmWjxZx2Uoy37uuYjw03Z2Y=SxaB17Uc-3j1CH_A@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sachin Kamat <sachin.kamat@linaro.org>
Cc: Tomasz Figa <tomasz.figa@gmail.com>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Andrew Bresticker <abrestic@chromium.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Mike Turquette <mturquette@linaro.org>

On Tuesday 31 of December 2013 08:46:14 Sachin Kamat wrote:
> On 19 December 2013 09:14, Sachin Kamat <sachin.kamat@linaro.org> wrote:
> > Hi Tomasz,
> >
> > On 10 November 2013 22:44, Tomasz Figa <tomasz.figa@gmail.com> wrote:
> >> Hi Sachin, Andrew,
> >>
> >> On Friday 08 of November 2013 15:44:08 Sachin Kamat wrote:
> >>> From: Andrew Bresticker <abrestic@chromium.org>
> >>>
> >>> Register the APLL rate table so that we can set the APLL rate from
> >>> the cpufreq driver.
> >>>
> >>> Signed-off-by: Andrew Bresticker <abrestic@chromium.org>
> >>> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
> >>> ---
> >>>  drivers/clk/samsung/clk-exynos5250.c |   25 ++++++++++++++++++++++++-
> >>>  1 file changed, 24 insertions(+), 1 deletion(-)
> >>
> >> You know that you still need to fix the cpufreq driver to use these,
> >> don't you? Anyway:
> >>
> >> Reviewed-by: Tomasz Figa <t.figa@samsung.com>
> >
> > This one too needs to be applied to your tree.
> 
> Ping Tomasz.

Applied.

Best regards,
Tomasz
