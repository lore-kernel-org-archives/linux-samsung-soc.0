From: Andrew Bresticker <abrestic@chromium.org>
Subject: Re: [PATCH 2/4] clk: exynos-audss: allow input clocks to be specified
 in device tree
Date: Wed, 14 Aug 2013 13:11:18 -0700
Message-ID: <CAL1qeaFZH+3D26Vis4rUqCKK6Un-eHBv1wckYpPR-fac_gz6qA@mail.gmail.com>
References: <1373458313-18970-1-git-send-email-padma.v@samsung.com>
	<1373458313-18970-3-git-send-email-padma.v@samsung.com>
	<1610421.OFFn8rqlxt@amdc1227>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-bk0-f47.google.com ([209.85.214.47]:42643 "EHLO
	mail-bk0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933081Ab3HNULT (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 14 Aug 2013 16:11:19 -0400
Received: by mail-bk0-f47.google.com with SMTP id mx12so2896204bkb.6
        for <linux-samsung-soc@vger.kernel.org>; Wed, 14 Aug 2013 13:11:18 -0700 (PDT)
In-Reply-To: <1610421.OFFn8rqlxt@amdc1227>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <t.figa@samsung.com>
Cc: Padmavathi Venna <padma.v@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, alsa-devel@alsa-project.org, Padma Venkat <padma.kvr@gmail.com>, sbkim73@samsung.com, "broonie@kernel.org" <broonie@kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, Mike Turquette <mturquette@linaro.org>, Doug Anderson <dianders@chromium.org>

Hi Tomasz,

> Well, this is basically how it should be done, but in current state of
> clock core I can see a problem: can we really rely on the order of clock
> initialization? I mean, we can't defer initialization of particular clock
> controller until all external clocks it needs are available, because there
> is no probing involved here.

Right, we can't.  The reason I added the device-tree lookup of input
clocks was because Exynos5420 has different names for several of the
input clocks to the audio block.  We already need a separate
compatibility string because of the ADMA clock, so we could just use
that to determine the parent clock names.  It's not ideal, but it's a
workaround for the initialization order issue.  Thoughts?

Thanks,
Andrew
