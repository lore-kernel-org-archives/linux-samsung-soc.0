From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH] ARM: dts: Enable RTC node for exynos5250
Date: Fri, 14 Jun 2013 08:01:09 -0700
Message-ID: <CAD=FV=WeY5r_=qLV6dh8HkaNGygZ33uQg5Q6dKhwd31e7MfFTg@mail.gmail.com>
References: <1371189378-22823-1-git-send-email-tushar.behera@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-la0-f48.google.com ([209.85.215.48]:63185 "EHLO
	mail-la0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751761Ab3FNPBK (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 14 Jun 2013 11:01:10 -0400
Received: by mail-la0-f48.google.com with SMTP id lx15so616072lab.21
        for <linux-samsung-soc@vger.kernel.org>; Fri, 14 Jun 2013 08:01:09 -0700 (PDT)
In-Reply-To: <1371189378-22823-1-git-send-email-tushar.behera@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tushar Behera <tushar.behera@linaro.org>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Kukjin Kim <kgene.kim@samsung.com>, Patch Tracking <patches@linaro.org>, Tomasz Figa <t.figa@samsung.com>

Tushar,

On Thu, Jun 13, 2013 at 10:56 PM, Tushar Behera
<tushar.behera@linaro.org> wrote:
> The kernel dump produced by s3c-rtc driver as reported by
> commit 522ccdb6fd0e ("ARM: dts: Disable the RTC by default on exynos5")
> are no longer reproducible in latest kernel.
>
> Hence it would be good to re-enable RTC support for EXYNOS5250.
>
> Signed-off-by: Tushar Behera <tushar.behera@linaro.org>
> ---
>  arch/arm/boot/dts/exynos5250.dtsi |    1 -
>  1 file changed, 1 deletion(-)

I would prefer we not commit this.

The original commit wasn't just about avoiding the bug (though that
was a nice side effect).  My understanding is that the SoC dtsi file
ought to have most peripherals disabled by default and individual
board dts files should enable the peripherals that they want.  I think
exynos5250 is particularly bad about this right now (it starts with
most peripherals enabled) but that should probably be fixed...

If my understanding is wrong, others on the list should definitely speak up!  :)

-Doug
