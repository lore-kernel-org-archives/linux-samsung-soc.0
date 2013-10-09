From: Arun Kumar K <arunkk.samsung@gmail.com>
Subject: Re: [PATCH] clk: samsung: Fix PLL35XX lock time
Date: Wed, 9 Oct 2013 09:21:43 +0530
Message-ID: <CALt3h78Lt2epHFmKeQ90839-L4XSQL+rDUTHGj681S2sTG=Jeg@mail.gmail.com>
References: <1381215399-25394-1-git-send-email-arun.kk@samsung.com>
	<CAD=FV=WcKpO947DgF6xwWALpVMYPOaZ=G_1+iRmFjac2bQGAMw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vb0-f51.google.com ([209.85.212.51]:65453 "EHLO
	mail-vb0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752431Ab3JIDvn (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 8 Oct 2013 23:51:43 -0400
Received: by mail-vb0-f51.google.com with SMTP id x16so133674vbf.24
        for <linux-samsung-soc@vger.kernel.org>; Tue, 08 Oct 2013 20:51:43 -0700 (PDT)
In-Reply-To: <CAD=FV=WcKpO947DgF6xwWALpVMYPOaZ=G_1+iRmFjac2bQGAMw@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Doug Anderson <dianders@chromium.org>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Mike Turquette <mturquette@linaro.org>, Kukjin Kim <kgene.kim@samsung.com>, Yadwinder Singh Brar <yadi.brar@samsung.com>

Hi Doug,

On Tue, Oct 8, 2013 at 9:39 PM, Doug Anderson <dianders@chromium.org> wrote:
> Arun,
>
> On Mon, Oct 7, 2013 at 11:56 PM, Arun Kumar K <arun.kk@samsung.com> wrote:
>> PLL35XX lock factor is 250 as per the manual whereas its
>> wrongly set as 270 now.
>>
>> Signed-off-by: Arun Kumar K <arun.kk@samsung.com>
>> ---
>>  drivers/clk/samsung/clk-pll.c |    4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> I don't think this is right.  I believe that it needs to be passed in
> by the SoC.  On exynos5250 I see 250 in both the manual and in our
> code.  On exynos5420 manual I actually see 200 now.  I'm not actually
> sure where the 270 came from, now that I search for it.
>

The manual I referred gives 250 for both 5250 and 5420 and thats why I
concluded on this fix. I will check other versions of the manual to see if
the value is changing.

Regards
Arun
