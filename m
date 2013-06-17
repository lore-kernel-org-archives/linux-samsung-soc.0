From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH Resend] pinctrl: exynos: Fix build breakage
Date: Mon, 17 Jun 2013 18:18:39 +0200
Message-ID: <CACRpkdZe7U7G4dKZO+PyKxM6EO9xQSwxPGXwTZerj45t86+GPA@mail.gmail.com>
References: <1371461892-5298-1-git-send-email-sachin.kamat@linaro.org>
	<1992157.1uNu7hFias@amdc1227>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ob0-f182.google.com ([209.85.214.182]:35127 "EHLO
	mail-ob0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751278Ab3FQQSj convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 17 Jun 2013 12:18:39 -0400
Received: by mail-ob0-f182.google.com with SMTP id va7so3339618obc.41
        for <linux-samsung-soc@vger.kernel.org>; Mon, 17 Jun 2013 09:18:39 -0700 (PDT)
In-Reply-To: <1992157.1uNu7hFias@amdc1227>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <t.figa@samsung.com>
Cc: Sachin Kamat <sachin.kamat@linaro.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Patch Tracking <patches@linaro.org>, Doug Anderson <dianders@chromium.org>

On Mon, Jun 17, 2013 at 1:57 PM, Tomasz Figa <t.figa@samsung.com> wrote=
:
> On Monday 17 of June 2013 15:08:12 Sachin Kamat wrote:
>> 'exynos_wkup_irq_ack' should be defined ahead of its call.
>>
>> Fixes the following error:
>> drivers/pinctrl/pinctrl-exynos.c: In function =91exynos_wkup_irq_mas=
k=92:
>> drivers/pinctrl/pinctrl-exynos.c:299:3: error: implicit declaration =
of
>> function =91exynos_wkup_irq_ack=92 [-Werror=3Dimplicit-function-decl=
aration]
>>    exynos_wkup_irq_ack(irqd);
>>
>> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
>> Cc: Doug Anderson <dianders@chromium.org>
>> ---
>> Fixed the commit message.
>> ---
>
> This patch is incorrect.
>
> Compilation error is caused by merge error of Doug's patch:
>
> pinctrl: exynos: ack level-triggered interrupts before unmasking
>
> hunk of which went to wrong function - mask instead of unmask.

OK probably I just had git am fail on me and used
patch -p1 < ...

> Linus, could you fix it?

No I'm afraid I will cause more trouble.

I took out Doug's commit and this fi from my tree.

Doug, can you respin the patch
"pinctrl: exynos: ack level-triggered interrupts before unmasking"

On top of my "devel" branch?

Yours,
Linus Walleij
