From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH 1/2] ARM: s3c64xx: cpuidle: convert to platform driver
Date: Wed, 30 Oct 2013 23:40:24 +0100
Message-ID: <1807659.lxGmRkUGnf@flatron>
References: <1382685074-16502-1-git-send-email-daniel.lezcano@linaro.org> <526AEF6B.2000404@linaro.org> <52717D97.8090905@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ee0-f50.google.com ([74.125.83.50]:39115 "EHLO
	mail-ee0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754617Ab3J3WkY (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 30 Oct 2013 18:40:24 -0400
Received: by mail-ee0-f50.google.com with SMTP id l10so982342eei.9
        for <linux-samsung-soc@vger.kernel.org>; Wed, 30 Oct 2013 15:40:23 -0700 (PDT)
In-Reply-To: <52717D97.8090905@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: ben-linux@fluff.org, kgene.kim@samsung.com, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

Hi Daniel,

On Wednesday 30 of October 2013 14:43:51 Daniel Lezcano wrote:
> On 10/25/2013 03:23 PM, Daniel Lezcano wrote:
> 
> [ ... ]
> 
> >>> Won't it be worth to add a new WFI_SLEEP state to the cpuidle driver
> >>> ?
> >> 
> >> I don't think so. How a suspend-to-RAM specific thing like WFI_SLEEP
> >> could
> >> be relevant to a cpuidle driver? (Unless there are some plans to
> >> consolidate STR with cpuidle that I haven't heard about...)
> > 
> > I finally found a documentation for the s3c6410x and the description
> > of
> > the different modes. Indeed, the sleep mode is not adequate for a
> > cpuidle state. What about the 'stop' and 'deep stop' state ?
> 
> Hi Thomas,
> 
> just a reminder about the question above, so I can go ahead: fix what
> you pointed out or remove the driver directly.
> 
> You mentionned in the previous email the STOP is not usful because it
> can be controlled by manually outside of the cpuidle driver. But I see
> in the documentation, the stop states power gates the cpu and deep-stop
> stops the regulator.

STOP clock-gates the CPU and DEEP-STOP power-gates it by stopping the 
regulator.

There are some interesting aspects of those modes, like memory self-
refresh, PLL power-off and system-wide down clocking, but I believe they 
are too tricky to handle (coupling with device PM, stopped timers) and 
with too little possible power saving to justify the effort of adding 
support for them.

In the end, I haven't seen support for them implemented even in strange 
vendor kernels used even on production devices, like Android phones.

> 
> If these states have to been added later, still it worth to remove the
> driver ?

I don't think that anybody is even going to add support for them and by 
anybody I should probably mean myself, since I'm currently the only person 
actively adding new code for this platform, as a part of my hobby.

Best regards,
Tomasz
