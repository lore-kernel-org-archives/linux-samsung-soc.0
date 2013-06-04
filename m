From: Padma Venkat <padma.kvr@gmail.com>
Subject: Re: [PATCH V4 4/4] ARM: dts: add clock provider information for i2s
 controllers in Exynos5250
Date: Tue, 4 Jun 2013 09:58:30 +0530
Message-ID: <CAAgF-Bd01JU_aess33d10ah7me=DR-tGF4vy20D6CPFiDYUg6g@mail.gmail.com>
References: <1370236744-16802-1-git-send-email-padma.v@samsung.com>
	<1370236744-16802-5-git-send-email-padma.v@samsung.com>
	<CAD=FV=X_XVmQ-jyorxATqBad5hhdFe5dodg_AzjsRQ-S+1=NeA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-oa0-f54.google.com ([209.85.219.54]:52206 "EHLO
	mail-oa0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750828Ab3FDE2b (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 4 Jun 2013 00:28:31 -0400
Received: by mail-oa0-f54.google.com with SMTP id o17so1522518oag.27
        for <linux-samsung-soc@vger.kernel.org>; Mon, 03 Jun 2013 21:28:31 -0700 (PDT)
In-Reply-To: <CAD=FV=X_XVmQ-jyorxATqBad5hhdFe5dodg_AzjsRQ-S+1=NeA@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Doug Anderson <dianders@chromium.org>
Cc: Padmavathi Venna <padma.v@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, alsa-devel@alsa-project.org, sbkim73@samsung.com, Kukjin Kim <kgene.kim@samsung.com>, broonie@kernel.org, Mike Turquette <mturquette@linaro.org>

Hi Doug,

On Tue, Jun 4, 2013 at 1:48 AM, Doug Anderson <dianders@chromium.org> wrote:
> Padmavathi,
>
> On Sun, Jun 2, 2013 at 10:19 PM, Padmavathi Venna <padma.v@samsung.com> wrote:
>> +               clocks = <&clock_audss EXYNOS_I2S_BUS>,
>> +                       <&clock_audss EXYNOS_I2S_BUS>,
>> +                       <&clock_audss EXYNOS_SCLK_I2S>,
>> +                       <&clock_audss EXYNOS_MOUT_AUDSS>,
>> +                       <&clock_audss EXYNOS_MOUT_I2S>;
>> +               clock-names = "iis", "i2s_opclk0", "i2s_opclk1",
>> +                               "mout_audss", "mout_i2s";
>
> Are there bindings for these clocks? Would be nice to see a
> description for what they are supposed to be.

Yes. They have bindings. I will add the description.

>
> I looked up i2s_opclk0 / i2s_opclk1 and they look reasonable at a
> quick glance. ...and it does seem right that iis and i2s_opclk0 are
> the same. ...but I don't see any place that uses the last two. Is
> there an in-flight patch?

I don't have any patch for these right now. These are used internally.
But as these are i2s0 base clocks I added here.

>
> -Doug

Thanks
Padma
