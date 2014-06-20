From: Kevin Hilman <khilman@linaro.org>
Subject: Re: [PATCH] i2c: exynos5: Properly use the "noirq" variants of suspend/resume
Date: Fri, 20 Jun 2014 14:48:01 -0700
Message-ID: <7hwqcbs166.fsf@paris.lan>
References: <1403155273-1057-1-git-send-email-dianders@chromium.org>
	<7h8uosyc3k.fsf@paris.lan>
	<CAD=FV=XxNVmF+N5HF4SnZoJRJvkSUkpEx6ct4v2gtmAQ9n28-Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f43.google.com ([209.85.160.43]:50187 "EHLO
	mail-pb0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754155AbaFTVsF (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 20 Jun 2014 17:48:05 -0400
Received: by mail-pb0-f43.google.com with SMTP id um1so3320111pbc.30
        for <linux-samsung-soc@vger.kernel.org>; Fri, 20 Jun 2014 14:48:04 -0700 (PDT)
In-Reply-To: <CAD=FV=XxNVmF+N5HF4SnZoJRJvkSUkpEx6ct4v2gtmAQ9n28-Q@mail.gmail.com>
	(Doug Anderson's message of "Thu, 19 Jun 2014 15:43:48 -0700")
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Doug Anderson <dianders@chromium.org>
Cc: Wolfram Sang <wsa@the-dreams.de>, Kukjin Kim <kgene.kim@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, naveen krishna <ch.naveen@samsung.com>, Jingoo Han <jg1.han@samsung.com>, Jean Delvare <jdelvare@suse.de>, Simon Glass <sjg@google.com>, Paul Gortmaker <paul.gortmaker@windriver.com>, standby24x7@gmail.com, Sachin Kamat <sachin.kamat@linaro.org>, "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

Hi Doug,

Doug Anderson <dianders@chromium.org> writes:

> On Thu, Jun 19, 2014 at 11:43 AM, Kevin Hilman <khilman@linaro.org> wrote:
>> Doug Anderson <dianders@chromium.org> writes:
>>
>>> The original code for the exynos i2c controller registered for the
>>> "noirq" variants.  However during review feedback it was moved to
>>> SIMPLE_DEV_PM_OPS without anyone noticing that it meant we were no
>>> longer actually "noirq" (despite functions named
>>> exynos5_i2c_suspend_noirq and exynos5_i2c_resume_noirq).
>>>
>>> i2c controllers that might have wakeup sources on them seem to need to
>>> resume at noirq time so that the individual drivers can actually read
>>> the i2c bus to handle their wakeup.
>>
>> I suspect usage of the noirq variants pre-dates the existence of the
>> late/early callbacks in the PM core, but based on the description above,
>> I suspect what you actually want is the late/early callbacks.
>
> I think it actually really needs noirq.  ;)

Yes, it appears it does.   Objection withdrawn.

I just wanted to be sure because since the introduction of late/early,
the need for noirq should be pretty rare, but there certainly are needs.

<tangent> 
In this case though, the need for it has more to do with the
lack of a way for us to describe non parent-child device dependencies
than whether or not IRQs are enabled or not.
</tangent>

Kevin
