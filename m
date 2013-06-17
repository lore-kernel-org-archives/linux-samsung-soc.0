From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: Re: [PATCH Resend] pinctrl: exynos: Fix build breakage
Date: Mon, 17 Jun 2013 17:16:01 +0530
Message-ID: <CAK9yfHzxC-2cZuOJJyaN8tY0_PDsW7kf3JB=GOhAm9+CA0RSXw@mail.gmail.com>
References: <1371461892-5298-1-git-send-email-sachin.kamat@linaro.org>
	<CACRpkdaxpr_7minVkbwsMK+tpbEy7LChz5C+Gt7zYNYhee2ibw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACRpkdaxpr_7minVkbwsMK+tpbEy7LChz5C+Gt7zYNYhee2ibw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Patch Tracking <patches@linaro.org>, Doug Anderson <dianders@chromium.org>
List-Id: linux-samsung-soc@vger.kernel.org

On 17 June 2013 16:55, Linus Walleij <linus.walleij@linaro.org> wrote:
> On Mon, Jun 17, 2013 at 11:38 AM, Sachin Kamat <sachin.kamat@linaro.o=
rg> wrote:
>
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
> Applied.

Thanks.

>
> Usually you should state which commit caused
> the problem in the commit message.

Usually I do. But in this case it was not caused by a single commit
per se but a combination.
Hence I wasn't sure if I should mention both as the ones causing it.


--=20
With warm regards,
Sachin
