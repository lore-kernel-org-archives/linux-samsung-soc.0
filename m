From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH 3/4] watchdog: s3c2410_wdt: parse watchdog dt node to read
 PMU registers adresses
Date: Fri, 27 Sep 2013 11:48:53 -0700
Message-ID: <CAD=FV=Wa0BpmE7mQoAk-RC_g9QCCz2T_7=Pd46CDSN8Z9KQ8jg@mail.gmail.com>
References: <1379414623-26329-1-git-send-email-l.krishna@samsung.com>
	<2333262.vSzLePxk45@amdc1227>
	<CAD=FV=WZBrJ5Qhky6VQqfu59LVQcKMTdLa+gJwnnFM85bEzzNQ@mail.gmail.com>
	<2201944.6vg4a9ttux@flatron>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qa0-f46.google.com ([209.85.216.46]:33008 "EHLO
	mail-qa0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754084Ab3I0Ssy (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 27 Sep 2013 14:48:54 -0400
Received: by mail-qa0-f46.google.com with SMTP id j7so742467qaq.12
        for <linux-samsung-soc@vger.kernel.org>; Fri, 27 Sep 2013 11:48:53 -0700 (PDT)
In-Reply-To: <2201944.6vg4a9ttux@flatron>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: Tomasz Figa <t.figa@samsung.com>, Leela Krishna Amudala <l.krishna@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Wim Van Sebroeck <wim@iguana.be>, Kukjin Kim <kgene.kim@samsung.com>, devicetree@vger.kernel.org, linux-watchdog@vger.kernel.org, Sylwester Nawrocki <s.nawrocki@samsung.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ian.campbell@citrix.com>, mark.rutland@arm.com, galak <galak@codeaurora.org>, pawel.moll@arm.com, Rob Herring <rob.herring@calxeda.com>

Tomasz,

On Fri, Sep 27, 2013 at 11:14 AM, Tomasz Figa <tomasz.figa@gmail.com> wrote:
>> So isn't the register in the PMU there to save power in the case that
>> the watchdog timer isn't being used?  How is the PMU "driver" to know
>> whether the watchdog is being used?  Better IMHO that the watchdog
>> driver knows to enable and disable itself as needed, right?
>
> How much power can you save on one low frequency counter? Anyway, those
> bits look more like reset signal masks to me, unrelated to any power
> saving and even if, this driver switches them on at probe regardless of
> whether the watchdog is actually used or not.

I don't know for sure how much power it saves if any.  The description
I have of those fields is also definitely a little on the confusing
side.  The fact that they are in the PMU leads me to believe that they
save power, but perhaps that's not the case here.

It still does seem nice to keep watchdog related code in the watchdog
driver, though...  I guess I could also imagine ordering problems if
we tweaked this bit in the PMU driver, though I don't have actual
evidence of this.  Maybe cases where enabling at the wrong time could
cause spurious watchdog resets depending on how the BIOS left the
state of things.  It would be unfortunate if we found we needed to
reach into the watchdog register bank from the PMU driver to "pet" the
watchdog before enabling it.

-Doug
