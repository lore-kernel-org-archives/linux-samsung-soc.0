From: Daniel Drake <drake@endlessm.com>
Subject: Re: [PATCH V2 0/2] Sound support for Exynos4412 Odroid X2, U3 board
Date: Tue, 24 Jun 2014 09:35:51 +0100
Message-ID: <CAD8Lp46gqbV9gDfrH2hbVnF7s6wK6ASBdsX7vn0L0CFAHXSemg@mail.gmail.com>
References: <1403108551-25058-1-git-send-email-s.nawrocki@samsung.com>
	<CAD8Lp44h6zc2Rt2MGLjhmNG-YB0kYCWf5G7hX5JmdmBfc1PvKg@mail.gmail.com>
	<53A856AE.1030202@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-we0-f174.google.com ([74.125.82.174]:50086 "EHLO
	mail-we0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751699AbaFXIfx (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 24 Jun 2014 04:35:53 -0400
Received: by mail-we0-f174.google.com with SMTP id u57so8236358wes.5
        for <linux-samsung-soc@vger.kernel.org>; Tue, 24 Jun 2014 01:35:52 -0700 (PDT)
In-Reply-To: <53A856AE.1030202@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: devicetree@vger.kernel.org, Mark Brown <broonie@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, pawel.moll@arm.com, zhen1.chen@samsung.com, Kyungmin Park <kyungmin.park@samsung.com>, Kumar Gala <galak@codeaurora.org>, alsa-devel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Marek Szyprowski <m.szyprowski@samsung.com>

On Mon, Jun 23, 2014 at 5:32 PM, Sylwester Nawrocki
<s.nawrocki@samsung.com> wrote:
> I could reproduce such behaviour on the U3 board, but only with u-boot
> which sets the MPLL clock frequency (fout_mpll) to 880 MHz, rather
> than 800 MHz, which was the case in my original environment.
> All fout_mpll child clocks have then different frequency values
> in both cases.
> It's a bit strange though, because frequencies of all the audio
> subsystem clocks seem to be same anyway:

I'm using the standard uboot from hardkernel.

> # cat /sys/kernel/debug/clk/clk_summary

This command makes the kernel totally hang, weird.

# speaker-test -c 2 -t wav -l 2 -p 1024

This plays back fine.

Could it be a problem with the samsung-i2s driver, not correctly
flushing at the right times?
Or do you think the problem is more likely to be clock-related?

Thanks
Daniel
