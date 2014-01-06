From: Tushar Behera <tushar.behera@linaro.org>
Subject: Re: [PATCH 1/9] ARM: SAMSUNG: Remove platform dependency from samsung.S
Date: Mon, 6 Jan 2014 08:37:16 +0530
Message-ID: <CAHbNUh2jW7asxsEagD-k8p120-8-OR0ZADimdOikyDLM94+aEA@mail.gmail.com>
References: <1388397640-720-1-git-send-email-tushar.behera@linaro.org>
	<1388397640-720-2-git-send-email-tushar.behera@linaro.org>
	<20131231153826.GD31886@sirena.org.uk>
	<CAHbNUh2srTmYU+04xt_goUw1E4QkWtdzSOT3wfgbQTtCtBjb_w@mail.gmail.com>
	<22ff01cf08f5$96be3010$c43a9030$@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ob0-f176.google.com ([209.85.214.176]:45235 "EHLO
	mail-ob0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751460AbaAFDHR (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 5 Jan 2014 22:07:17 -0500
Received: by mail-ob0-f176.google.com with SMTP id vb8so17776734obc.35
        for <linux-samsung-soc@vger.kernel.org>; Sun, 05 Jan 2014 19:07:17 -0800 (PST)
In-Reply-To: <22ff01cf08f5$96be3010$c43a9030$@kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Sachin Kamat <sachin.kamat@linaro.org>

On 4 January 2014 08:05,  <kgene@kernel.org> wrote:
> Tushar Behera wrote:
>>
>> On 31 December 2013 21:08, Mark Brown <broonie@kernel.org> wrote:
>> > On Mon, Dec 30, 2013 at 03:30:32PM +0530, Tushar Behera wrote:
>> >> From: Sachin Kamat <sachin.kamat@linaro.org>
>> >>
>> >> regs-serial.h only includes linux/serial_s3c.h. Include this
>> >> header directly in samsung.S to remove unnecessary platform
>> >> dependency.
>> >>
>> >> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
>> >> ---
>> >
>> > If you're forwarding on a patch from someone else you need to add your
>> > Signed-off-by to it - that's important for the whole goal of tracking
>> > licensing.
>>
>> Yeah, true. I forgot about that.
>>
>> Signed-off-by: Tushar Behera <tushar.behera@linaro.org>
>>
>> Kukjin,
>>
>> While applying this series, can you please add my Signed-off-by?
>>
> Tushar, The 'Signed-off-by' is different with others ack, review or whatever. In my understanding it's a legal issue so you need to repost.
>
> BTW, I think this series looks good to me but we don't need separated #1 to #8 patches because it's samething, so please squash them.
>
> Thanks,
> Kukjin
>

Kukjin,

I will repost the series after updating the sob and squashing the
patches #2 to #9. I prefer to keep patch #1 separate as I would like
to retain Sachin's authorship for that patch.

-- 
Tushar Behera
