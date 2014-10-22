From: Chirantan Ekbote <chirantan@chromium.org>
Subject: Re: [PATCH] clocksource: exynos_mct: fix exynos4_mct_write
Date: Wed, 22 Oct 2014 11:00:46 -0700
Message-ID: <CAJFHJrofJmmMhZDjJL69Rycu6wR_X9+=kkvDAkKg80Tgv1crBA@mail.gmail.com>
References: <1413941828-5547-1-git-send-email-tjakobi@math.uni-bielefeld.de>
	<CAD=FV=WET_mdjaYP330bm2gmEiBY9BsnxMHLO9LMMTtgeHhNCw@mail.gmail.com>
	<85edb2def0c46ba060b432e773492b51@math.uni-bielefeld.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-oi0-f41.google.com ([209.85.218.41]:60992 "EHLO
	mail-oi0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754585AbaJVSAr (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 22 Oct 2014 14:00:47 -0400
Received: by mail-oi0-f41.google.com with SMTP id u20so3164732oif.28
        for <linux-samsung-soc@vger.kernel.org>; Wed, 22 Oct 2014 11:00:47 -0700 (PDT)
In-Reply-To: <85edb2def0c46ba060b432e773492b51@math.uni-bielefeld.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Cc: Doug Anderson <dianders@chromium.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Thomas P Abraham <thomas.ab@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, GP Orcullo <kinsamanka@gmail.com>, Doug Anderson <dianders@google.com>

Hi Tobias,

On Wed, Oct 22, 2014 at 9:12 AM, Tobias Jakobi
<tjakobi@math.uni-bielefeld.de> wrote:
> Hello Doug,
>
> I didn't encounter any obvious problems with the MCT. I was made aware of
> the issue by kinsamanka on the Hardkernel forums, but didn't tell me through
> which means he/she found it.
>

Looks like this came up back in February
(https://lkml.org/lkml/2014/2/4/782) and the reason the code currently
works is that these values are used for checking the success of the
write operation.  So in the current code we never check the success of
the write but it hasn't been a problem because presumably the write is
almost always successful.

Regardless, I agree with Doug.  We should take this for correctness.

> Concerning testing, I have this running since some weeks on my ODROID-X2
> (Exynos4412), again, haven't encountered anything 'strange' yet.
>
> With best wishes,
> Tobias
>
>

Chirantan
