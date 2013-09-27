From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: Re: [PATCH] clockevent: exynos_mct: fix lockdep warning
Date: Fri, 27 Sep 2013 15:17:02 +0200
Message-ID: <5245854E.5030600@linaro.org>
References: <1380120578-17458-1-git-send-email-tom.leiming@gmail.com>	<5243823D.4040208@linaro.org>	<17472486.7GQJa9ux9F@amdc1227> <CACVXFVO=k-wJ2SrjVQ_k1JhtAOo0-rZ_M780rqGWCbKA8_1qBQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wg0-f54.google.com ([74.125.82.54]:43303 "EHLO
	mail-wg0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752728Ab3I0NRH (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 27 Sep 2013 09:17:07 -0400
Received: by mail-wg0-f54.google.com with SMTP id m15so2668010wgh.33
        for <linux-samsung-soc@vger.kernel.org>; Fri, 27 Sep 2013 06:17:06 -0700 (PDT)
In-Reply-To: <CACVXFVO=k-wJ2SrjVQ_k1JhtAOo0-rZ_M780rqGWCbKA8_1qBQ@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Ming Lei <tom.leiming@gmail.com>, Tomasz Figa <t.figa@samsung.com>
Cc: linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Thomas Gleixner <tglx@linutronix.de>, Kukjin Kim <kgene.kim@samsung.com>, linux-samsung-soc@vger.kernel.org, Tomasz Figa <tomasz.figa@gmail.com>

On 09/27/2013 03:09 PM, Ming Lei wrote:
> On Thu, Sep 26, 2013 at 6:32 PM, Tomasz Figa <t.figa@samsung.com> wro=
te:
>>
>> This is a fix that we may want to have, but it must be modified to t=
ake
>> my regression fix[1] into account.
>>
>> [1] clocksource: exynos_mct: Set IRQ affinity when the CPU goes onli=
ne
>> http://thread.gmane.org/gmane.linux.kernel.samsung-soc/22511/focus=3D=
23418
>
> OK, I will write and submit v1 against your patch.

Better you stick to

https://git.kernel.org/cgit/linux/kernel/git/tip/tip.git/

or you rebase it against the v3.12-rc3 when it goes out.

Thanks
   -- Daniel


--=20
  <http://www.linaro.org/> Linaro.org =E2=94=82 Open source software fo=
r ARM SoCs

=46ollow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
