From: Padma Venkat <padma.kvr@gmail.com>
Subject: Re: [alsa-devel] [PATCH 2/2] ASoC: samsung: Use ASoC dmaengine code
 where possible
Date: Tue, 10 Dec 2013 22:09:05 +0530
Message-ID: <CAAgF-BdWpQ2wn8GCpXLLWBZFxrrTYmX-e4bWRLYdwfpwhObnfg@mail.gmail.com>
References: <1386253559-18262-1-git-send-email-broonie@kernel.org>
	<1386253559-18262-2-git-send-email-broonie@kernel.org>
	<CAAgF-Bfk8byZwVBd_5PopM3ji-wdTMR5i-J7w1W4zq4gFk4i+Q@mail.gmail.com>
	<20131209173021.GC29268@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qa0-f53.google.com ([209.85.216.53]:48427 "EHLO
	mail-qa0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755090Ab3LJQjG (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 10 Dec 2013 11:39:06 -0500
Received: by mail-qa0-f53.google.com with SMTP id j5so3844501qaq.19
        for <linux-samsung-soc@vger.kernel.org>; Tue, 10 Dec 2013 08:39:05 -0800 (PST)
In-Reply-To: <20131209173021.GC29268@sirena.org.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Padmavathi Venna <padma.v@samsung.com>, alsa-devel@alsa-project.org, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, linaro-kernel@lists.linaro.org

Hi Mark,

On Mon, Dec 9, 2013 at 11:00 PM, Mark Brown <broonie@kernel.org> wrote:
> On Fri, Dec 06, 2013 at 10:44:19AM +0530, Padma Venkat wrote:
>
>> I couldn't test this patch set due to some crash in recent kernel in
>> dmaengine_unmap_put. I think this unmap support is not yet implemented
>> for pl330 driver. It is mentioned in the commit "dmaengine: prepare
>> for generic 'unmap' data", [bzolnier: prepare pl330 driver for adding
>> missing unmap while at it].
>
> This is unfortunate...  I'd suggest trying mainline but I see it's
> broken in Linus' tree too and no fixes in -next. :(
>
> I'm tempted to push up with your Tested-by a note saying you did your
> testing on an earlier version but weren't able to test due to other bugs.

I managed to test your latest version of these patches(posted on
Dec6th) on earlier version of linux-samsung tree. May be you can push
up these patches with my Tested-by.

Thanks
Padma
