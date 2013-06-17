From: Tushar Behera <tushar.behera@linaro.org>
Subject: Re: [PATCH] ARM: dts: Enable RTC node for exynos5250
Date: Mon, 17 Jun 2013 08:41:14 +0530
Message-ID: <CAHbNUh2byimQ_ep0j9XkUjRFaU3K6YZE_ANcch5UhP4QsuZxPw@mail.gmail.com>
References: <1371189378-22823-1-git-send-email-tushar.behera@linaro.org>
	<CAD=FV=WeY5r_=qLV6dh8HkaNGygZ33uQg5Q6dKhwd31e7MfFTg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-oa0-f49.google.com ([209.85.219.49]:48967 "EHLO
	mail-oa0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755546Ab3FQDLO (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 16 Jun 2013 23:11:14 -0400
Received: by mail-oa0-f49.google.com with SMTP id n9so2871768oag.36
        for <linux-samsung-soc@vger.kernel.org>; Sun, 16 Jun 2013 20:11:14 -0700 (PDT)
In-Reply-To: <CAD=FV=WeY5r_=qLV6dh8HkaNGygZ33uQg5Q6dKhwd31e7MfFTg@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Doug Anderson <dianders@chromium.org>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Kukjin Kim <kgene.kim@samsung.com>, Patch Tracking <patches@linaro.org>, Tomasz Figa <t.figa@samsung.com>

On 14 June 2013 20:31, Doug Anderson <dianders@chromium.org> wrote:
> Tushar,
>
> On Thu, Jun 13, 2013 at 10:56 PM, Tushar Behera
> <tushar.behera@linaro.org> wrote:
>> The kernel dump produced by s3c-rtc driver as reported by
>> commit 522ccdb6fd0e ("ARM: dts: Disable the RTC by default on exynos5")
>> are no longer reproducible in latest kernel.
>>
>> Hence it would be good to re-enable RTC support for EXYNOS5250.
>>
>> Signed-off-by: Tushar Behera <tushar.behera@linaro.org>
>> ---
>>  arch/arm/boot/dts/exynos5250.dtsi |    1 -
>>  1 file changed, 1 deletion(-)
>
> I would prefer we not commit this.
>
> The original commit wasn't just about avoiding the bug (though that

I thought the intention of the original commit was just that. :-)

> was a nice side effect).  My understanding is that the SoC dtsi file
> ought to have most peripherals disabled by default and individual
> board dts files should enable the peripherals that they want.  I think
> exynos5250 is particularly bad about this right now (it starts with
> most peripherals enabled) but that should probably be fixed...
>

I agree, all the peripherals should be fixed for this, not just RTC.

> If my understanding is wrong, others on the list should definitely speak up!  :)
>

Let me know if you still prefer to keep RTC node disabled on exynos5250.dtsi.
In that case, I would enable it only for Arndale.

> -Doug


Thanks.
--
Tushar Behera
