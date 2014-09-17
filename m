From: Daniel Drake <drake@endlessm.com>
Subject: pwm-samsung: incorrect register values for 100% duty cycle
Date: Wed, 17 Sep 2014 17:42:09 -0600
Message-ID: <CAD8Lp46rh80KD=jXoGTLt2SzH+zfnuyd=QHrKZncx+YYCp-8dA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wg0-f49.google.com ([74.125.82.49]:55615 "EHLO
	mail-wg0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754511AbaIQXmK (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 17 Sep 2014 19:42:10 -0400
Received: by mail-wg0-f49.google.com with SMTP id m15so71488wgh.20
        for <linux-samsung-soc@vger.kernel.org>; Wed, 17 Sep 2014 16:42:09 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-pwm@vger.kernel.org, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Tomasz Figa <tomasz.figa@gmail.com>

Hi,

I'm using pwm-samsung on Exynos4412 for a variable-brightness LED.

When the LED is set to maximum brightness via the pwm-leds driver, we
arrive at pwm_samsung_config with duty_ns = period_ns, i.e. 100% duty
cycle.

This function does:

    /* -1UL will give 100% duty. */
    --tcmp;
    writel(tcmp, our_chip->base + REG_TCMPB(pwm->hwpwm));

I think that comment is incorrect. If tcmp is written as -1UL then the
LED totally turns off. And there is nothing in the Exynos4412 manual
to suggest that -1UL should be set in the TCMP register for 100% duty.

If I remove that --tcmp line, so that 100% duty cycle is handled as
tcmp=0, the problem is solved: the LED turns on at max brightness when
the leds subsystem requests so.

Any ideas? Is this -1UL thing a quirk from older chip versions not
applicable to Exynos4?

Thanks
Daniel
