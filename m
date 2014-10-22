From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Subject: Re: [PATCH] clocksource: =?UTF-8?Q?exynos=5Fmct=3A=20fix=20exynos?=
 =?UTF-8?Q?=34=5Fmct=5Fwrite?=
Date: Wed, 22 Oct 2014 18:12:42 +0200
Message-ID: <85edb2def0c46ba060b432e773492b51@math.uni-bielefeld.de>
References: <1413941828-5547-1-git-send-email-tjakobi@math.uni-bielefeld.de>
 <CAD=FV=WET_mdjaYP330bm2gmEiBY9BsnxMHLO9LMMTtgeHhNCw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtp.math.uni-bielefeld.de ([129.70.45.10]:53634 "EHLO
	smtp.math.uni-bielefeld.de" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752950AbaJVQMq (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 22 Oct 2014 12:12:46 -0400
In-Reply-To: <CAD=FV=WET_mdjaYP330bm2gmEiBY9BsnxMHLO9LMMTtgeHhNCw@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Doug Anderson <dianders@chromium.org>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Thomas P Abraham <thomas.ab@samsung.com>, Chirantan Ekbote <chirantan@chromium.org>, Kukjin Kim <kgene.kim@samsung.com>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, GP Orcullo <kinsamanka@gmail.com>, dianders@google.com

Hello Doug,

I didn't encounter any obvious problems with the MCT. I was made aware 
of the issue by kinsamanka on the Hardkernel forums, but didn't tell me 
through which means he/she found it.

Concerning testing, I have this running since some weeks on my ODROID-X2 
(Exynos4412), again, haven't encountered anything 'strange' yet.

With best wishes,
Tobias

On 2014-10-22 17:57, Doug Anderson wrote:
> Tobias,
> 
> On Tue, Oct 21, 2014 at 6:37 PM, Tobias Jakobi
> <tjakobi@math.uni-bielefeld.de> wrote:
>> EXYNOS4_MCT_L_MASK is defined as 0xffffff00, so applying this bitmask
>> produces a number outside the range 0x00 to 0xff, which always results
>> in execution of the default switch statement.
>> 
>> Obviously this is wrong and git history shows that the bitmask 
>> inversion
>> was incorrectly set during a refactoring of the MCT code.
>> 
>> Fix this by putting the inversion at the correct position again.
>> 
>> Reported-by: GP Orcullo <kinsamanka@gmail.com>
>> Signed-off-by: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
>> ---
>>  drivers/clocksource/exynos_mct.c | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> Wow, the old code was pretty broken.  Nice find!  Was this found by
> code inspection / analysis or were you seeing some actual bug?  I
> think it was broken back in March 2013 in (a1ba7a7 ARM: EXYNOS: add a
> register base address variable in mct controller driver), so 1.5
> years.  The broken code has been running for a long time, but that
> doesn't mean that there isn't a subtle issue...
> 
> In any case, it seems like we should take this fix, assuming someone
> has tested it well.
> 
> Reviewed-by: Doug Anderson <dianders@chromium.org>
