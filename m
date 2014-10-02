From: Sylwester Nawrocki <sylvester.nawrocki@gmail.com>
Subject: Re: [PATCH] ASoC: samsung: fix CDCLK handling
Date: Fri, 03 Oct 2014 00:33:04 +0200
Message-ID: <542DD2A0.9040105@gmail.com>
References: <1412095211-4012-1-git-send-email-drake@endlessm.com> <542D7A6B.7010000@samsung.com> <20141002175409.GX4273@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f174.google.com ([209.85.212.174]:40739 "EHLO
	mail-wi0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752202AbaJBWdL (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 2 Oct 2014 18:33:11 -0400
Received: by mail-wi0-f174.google.com with SMTP id cc10so5554908wib.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 02 Oct 2014 15:33:09 -0700 (PDT)
In-Reply-To: <20141002175409.GX4273@sirena.org.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>, Daniel Drake <drake@endlessm.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, alsa-devel@alsa-project.org

On 2014-10-02 19:54, Mark Brown wrote:
> On Thu, Oct 02, 2014 at 06:16:43PM +0200, Sylwester Nawrocki wrote:
>> [dropping unrelated addresses from Cc]
>
> You've dropped Liam who's the other ASoC maintainer.

Whoops, pardon me, somewhat I thought about Liam more as the
regulator API author, rather than ASoC maintainer. Will remember
now.

>> Sorry for getting back late to this. Indeed we have a mess here.
>> I mostly tested interaction between two CPU DAIs - the main and the
>> overlay one (which is not supported in mainline yet).
>
> The dual DAIs were supported in mainline when the code was merged...

I meant to say that the the overlay DAI, using the I2S internal DMA,
was not defined in odroidx2_max98090.c.

>>> Simplify the situation and solve the bug with the following approach:
>>>   - as before, samsung_i2s_dai_probe() gates CDCLK by default
>>>     (no need for smartq_wm8987 to do this as well)
>>>   - platform drivers can gate/ungate CDCLK as necessary
>>>     (currently only odroidx2 needs to do this)
>>>   - i2s code has no other interaction with CDCLK
>
>> I'm not an ASoC expert, but I'd say it would be better to modify
>> the I2S module so there is no additional callbacks needed in
>> the machine driver. This way all machine drivers using the CDCLK
>> output could be simplified, not mentioning using simple-card.
>> I'm not sure how to do it yet, I'm going to take a look at this
>> over the weekend.
>
> Yes, keeping this in the SoC side drivers seems all round better.
> Perhaps the I2S driver should be exposing CDCLK as a clock via the clock
> API?  Dunno if that'd help or not.  Or refcount.

Exposing CDCLK as clock via the clock API might be worth to try.
I'll see how it could be done. If that doesn't work for some reason
we could do just refcounting.
