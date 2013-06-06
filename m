From: Padma Venkat <padma.kvr@gmail.com>
Subject: Re: [PATCH V5 4/5] ARM: dts: add clock provider information for i2s
 controllers in Exynos5250
Date: Thu, 6 Jun 2013 09:24:30 +0530
Message-ID: <CAAgF-Bcg3RQ-xJL0EGfwhRsBK477bCUcMu5Zr5x884HyzVbkcA@mail.gmail.com>
References: <1370348890-6645-1-git-send-email-padma.v@samsung.com>
	<1370348890-6645-5-git-send-email-padma.v@samsung.com>
	<CAD=FV=VHwTNQy5oNZ0cCaydJDDTst+yxFw4onKSDJR4DQV0gSw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ob0-f170.google.com ([209.85.214.170]:64734 "EHLO
	mail-ob0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756409Ab3FFDya (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 5 Jun 2013 23:54:30 -0400
Received: by mail-ob0-f170.google.com with SMTP id ef5so3975398obb.29
        for <linux-samsung-soc@vger.kernel.org>; Wed, 05 Jun 2013 20:54:30 -0700 (PDT)
In-Reply-To: <CAD=FV=VHwTNQy5oNZ0cCaydJDDTst+yxFw4onKSDJR4DQV0gSw@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Doug Anderson <dianders@chromium.org>
Cc: Padmavathi Venna <padma.v@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, alsa-devel@alsa-project.org, sbkim73@samsung.com, Kukjin Kim <kgene.kim@samsung.com>, "broonie@kernel.org" <broonie@kernel.org>, Mike Turquette <mturquette@linaro.org>

Hi Doug,

On Tue, Jun 4, 2013 at 10:49 PM, Doug Anderson <dianders@chromium.org> wrote:
> Padmavathi,
>
> On Tue, Jun 4, 2013 at 5:28 AM, Padmavathi Venna <padma.v@samsung.com> wrote:
>> @@ -471,6 +477,8 @@
>>                 dmas = <&pdma1 12
>>                         &pdma1 11>;
>>                 dma-names = "tx", "rx";
>> +               clocks = <&clock 307>;
>> +               clock-names = "iis";
>
> ...actually, glancing at the driver I'm a little surprised that you
> don't need to list "i2s_opclk0".  Did you test i2s1?

I didn't test i2s1 but i2s_opclk0 is also required. I will resubmit the patch.

>
>>                 pinctrl-names = "default";
>>                 pinctrl-0 = <&i2s1_bus>;
>>         };
>> @@ -481,6 +489,8 @@
>>                 dmas = <&pdma0 12
>>                         &pdma0 11>;
>>                 dma-names = "tx", "rx";
>> +               clocks = <&clock 308>;
>> +               clock-names = "iis";
>
> ...and here.
>
>
> -Doug

Thanks
Padma
