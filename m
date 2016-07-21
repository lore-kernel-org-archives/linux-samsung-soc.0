From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH] clk: samsung: Allow modular build of the Audio Subsystem
 CLKCON driver
Date: Thu, 21 Jul 2016 20:22:49 +0200
Message-ID: <579112F9.3030608@samsung.com>
References: <1467987300-31450-1-git-send-email-s.nawrocki@samsung.com>
 <146799700614.73491.6564650478987470074@resonance>
 <578616AE.7010805@samsung.com>
 <CAJKOXPc3NqsLjEdbs3o1vwaKWCsxK5HxH9G1pRKpMKLD0QXQGw@mail.gmail.com>
 <578DF91D.8050800@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:59734 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750884AbcGUSWz (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 21 Jul 2016 14:22:55 -0400
In-reply-to: <578DF91D.8050800@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?UTF-8?Q?Krzysztof_Koz=c5=82owski?= <k.kozlowski.k+lkml@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, =?UTF-8?Q?Bart=c5=82omiej_=c5=bbo=c5=82nierkiewicz?= <b.zolnierkie@samsung.com>

On 07/19/2016 11:55 AM, Sylwester Nawrocki wrote:
>> Unfortunately this breaks the audio on Odroid XU3 (simple-card). There
>> > is no sound from:
>> > $ aplay /usr/share/sounds/alsa/Front_Right.wav
>> > and the command does not exit.
>> > 
>> > Sylwester,
>> > Are you going to look at this?
>
> Thanks for the bug report, I will check what's the problem here.
> Odroid U3 also uses simple card and same codec and it all works there.

It turned out that the difference was using ADMA on XU3 vs. PDMA on U3.
AUDSS clock controller provides a clock for ADMA and converting the AUDSS
clk driver to a loadable module causes deferring ADMA's controller
initialization, which was not handled properly by the sound component
drivers.
I've sent a patch to fix the issue, added you at Cc.

-- 
Thanks,
Sylwester
