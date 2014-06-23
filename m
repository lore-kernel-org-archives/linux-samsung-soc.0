From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH V2 0/2] Sound support for Exynos4412 Odroid X2, U3 board
Date: Mon, 23 Jun 2014 18:32:46 +0200
Message-ID: <53A856AE.1030202@samsung.com>
References: <1403108551-25058-1-git-send-email-s.nawrocki@samsung.com>
 <CAD8Lp44h6zc2Rt2MGLjhmNG-YB0kYCWf5G7hX5JmdmBfc1PvKg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:41587 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755605AbaFWQcu (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 23 Jun 2014 12:32:50 -0400
In-reply-to: <CAD8Lp44h6zc2Rt2MGLjhmNG-YB0kYCWf5G7hX5JmdmBfc1PvKg@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Daniel Drake <drake@endlessm.com>
Cc: devicetree@vger.kernel.org, Mark Brown <broonie@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, pawel.moll@arm.com, zhen1.chen@samsung.com, Kyungmin Park <kyungmin.park@samsung.com>, galak@codeaurora.org, alsa-devel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Marek Szyprowski <m.szyprowski@samsung.com>

On 23/06/14 11:40, Daniel Drake wrote:
> I tested ODROID-U2's 3.5mm analog headphone jack output with:
> 
> # speaker-test -c 2 -t wav -l 2
> 
> On my x86 laptop this command takes ~6 seconds and produces audible output:
> "Front left, front right, front left, front right"
> 
> When those words are reproduced over the speakers, there is a
> corresponding message printed to stdout which synchronizes nicely.
> 
> On ODROID-U2 the same command doesn't work quite right - execution
> takes only 3.5 seconds and the audible output is truncated:
> "Front left, front right, front"
> and the stdout messages do not really coincide with the audio being
> reproduced at that time.
> 
> No pulseaudio or anything like that.
> 
> Can you reproduce this?

I could reproduce such behaviour on the U3 board, but only with u-boot
which sets the MPLL clock frequency (fout_mpll) to 880 MHz, rather
than 800 MHz, which was the case in my original environment.
All fout_mpll child clocks have then different frequency values
in both cases.
It's a bit strange though, because frequencies of all the audio
subsystem clocks seem to be same anyway:

# cat /sys/kernel/debug/clk/clk_summary
    ...
    fout_epll                   0           0            192000000
       mout_audss               0           0            192000000
          dout_rp               0           0            19200000
             dout_aud_bus       0           0            19200000
          mout_i2s0             0           0            192000000
             dout_i2s0          0           0            192000000
       sclk_epll                0           0            192000000
          audss                 0           0            192000000

So there might be some other difference I'm overlooking.
Will let you know as soon I find out anything else.

Regards,
Sylwester
