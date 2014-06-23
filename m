From: Daniel Drake <drake@endlessm.com>
Subject: Re: [PATCH V2 0/2] Sound support for Exynos4412 Odroid X2, U3 board
Date: Mon, 23 Jun 2014 10:40:39 +0100
Message-ID: <CAD8Lp44h6zc2Rt2MGLjhmNG-YB0kYCWf5G7hX5JmdmBfc1PvKg@mail.gmail.com>
References: <1403108551-25058-1-git-send-email-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-we0-f180.google.com ([74.125.82.180]:36599 "EHLO
	mail-we0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752671AbaFWJkk (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 23 Jun 2014 05:40:40 -0400
Received: by mail-we0-f180.google.com with SMTP id x48so6563502wes.39
        for <linux-samsung-soc@vger.kernel.org>; Mon, 23 Jun 2014 02:40:39 -0700 (PDT)
In-Reply-To: <1403108551-25058-1-git-send-email-s.nawrocki@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: devicetree@vger.kernel.org, Mark Brown <broonie@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, pawel.moll@arm.com, zhen1.chen@samsung.com, Kyungmin Park <kyungmin.park@samsung.com>, galak@codeaurora.org, alsa-devel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Marek Szyprowski <m.szyprowski@samsung.com>

On Wed, Jun 18, 2014 at 5:22 PM, Sylwester Nawrocki
<s.nawrocki@samsung.com> wrote:
> This series adds basic sound support for the Odroid X2/U3 boards.
> It relies on specific Exynos Audio Subsystem clock parent and
> frequencies being pre-configured.
>
> My full testing git branch has been pushed to:
> git://linuxtv.org/snawrocki/samsung.git v3.16-rc1-odroid-sound-clk

Thanks for this! I tested these patches plus the ones in your branch
to integrate with the ODROID.
I tested ODROID-U2's 3.5mm analog headphone jack output with:

# speaker-test -c 2 -t wav -l 2

On my x86 laptop this command takes ~6 seconds and produces audible output:
"Front left, front right, front left, front right"

When those words are reproduced over the speakers, there is a
corresponding message printed to stdout which synchronizes nicely.

On ODROID-U2 the same command doesn't work quite right - execution
takes only 3.5 seconds and the audible output is truncated:
"Front left, front right, front"
and the stdout messages do not really coincide with the audio being
reproduced at that time.

No pulseaudio or anything like that.

Can you reproduce this?

Thanks
Daniel
