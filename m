From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH Resend] pinctrl: exynos: Fix build breakage
Date: Mon, 17 Jun 2013 09:51:22 -0700
Message-ID: <CAD=FV=UQRcDj4zfhw5JqQM=V0qJJynVODkv6ecPiRtbaf8r94w@mail.gmail.com>
References: <1371461892-5298-1-git-send-email-sachin.kamat@linaro.org>
	<1992157.1uNu7hFias@amdc1227>
	<CACRpkdZe7U7G4dKZO+PyKxM6EO9xQSwxPGXwTZerj45t86+GPA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-la0-f48.google.com ([209.85.215.48]:46032 "EHLO
	mail-la0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752070Ab3FQQvY convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 17 Jun 2013 12:51:24 -0400
Received: by mail-la0-f48.google.com with SMTP id lx15so2612439lab.7
        for <linux-samsung-soc@vger.kernel.org>; Mon, 17 Jun 2013 09:51:23 -0700 (PDT)
In-Reply-To: <CACRpkdZe7U7G4dKZO+PyKxM6EO9xQSwxPGXwTZerj45t86+GPA@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Tomasz Figa <t.figa@samsung.com>, Sachin Kamat <sachin.kamat@linaro.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Patch Tracking <patches@linaro.org>

Linus,

On Mon, Jun 17, 2013 at 9:18 AM, Linus Walleij <linus.walleij@linaro.or=
g> wrote:
> On Mon, Jun 17, 2013 at 1:57 PM, Tomasz Figa <t.figa@samsung.com> wro=
te:
>> On Monday 17 of June 2013 15:08:12 Sachin Kamat wrote:
>>> 'exynos_wkup_irq_ack' should be defined ahead of its call.
>>>
>>> Fixes the following error:
>>> drivers/pinctrl/pinctrl-exynos.c: In function =91exynos_wkup_irq_ma=
sk=92:
>>> drivers/pinctrl/pinctrl-exynos.c:299:3: error: implicit declaration=
 of
>>> function =91exynos_wkup_irq_ack=92 [-Werror=3Dimplicit-function-dec=
laration]
>>>    exynos_wkup_irq_ack(irqd);
>>>
>>> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
>>> Cc: Doug Anderson <dianders@chromium.org>
>>> ---
>>> Fixed the commit message.
>>> ---
>>
>> This patch is incorrect.
>>
>> Compilation error is caused by merge error of Doug's patch:
>>
>> pinctrl: exynos: ack level-triggered interrupts before unmasking
>>
>> hunk of which went to wrong function - mask instead of unmask.
>
> OK probably I just had git am fail on me and used
> patch -p1 < ...
>
>> Linus, could you fix it?
>
> No I'm afraid I will cause more trouble.
>
> I took out Doug's commit and this fi from my tree.
>
> Doug, can you respin the patch
> "pinctrl: exynos: ack level-triggered interrupts before unmasking"
>
> On top of my "devel" branch?

OK, sent.  :)

-Doug
