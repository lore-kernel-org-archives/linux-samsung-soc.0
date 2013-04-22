From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [PATCH] clocksource: add samsung pwm timer driver
Date: Tue, 23 Apr 2013 02:02:26 +0900
Message-ID: <51756D22.20103@samsung.com>
References: <201304210002.00125.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f49.google.com ([209.85.160.49]:43094 "EHLO
	mail-pb0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752812Ab3DVRCc (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 22 Apr 2013 13:02:32 -0400
Received: by mail-pb0-f49.google.com with SMTP id rp2so408752pbb.8
        for <linux-samsung-soc@vger.kernel.org>; Mon, 22 Apr 2013 10:02:31 -0700 (PDT)
In-Reply-To: <201304210002.00125.arnd@arndb.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Tomasz Figa <t.figa@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, Ben Dooks <ben-linux@fluff.org>, John Stultz <john.stultz@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Olof Johansson <olof@lixom.net>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

On 04/21/13 07:01, Arnd Bergmann wrote:
> From: Tomasz Figa<t.figa@samsung.com>
>
> This adds a new clocksource driver for the PWM timer that is
> present in most Samsung SoCs, based on the existing driver in
> arch/arm/plat-samsung/samsung-time.c and many changes implemented by
> Tomasz Figa.
>
> Originally, the conversion of all Samsung machines to the new driver was
> planned for 3.10, but that work ended up being too late and too invasive
> just before the merge window.
>
> Unfortunately, other changes in the Exynos platform resulted in some
> Exynos4 setups, particularly the Universal C210 board to be broken. In
> order to fix that with minimum risk, so we now leave the existing pwm
> clocksource driver in place for all older platforms and use the new
> driver only for device tree enabled boards. This way, we can get the
> broken machines running again using DT descriptions.
>
> All clocksource changes were implemented by Tomasz, while the DT
> registration was rewritten by Arnd.
>
> Signed-off-by: Arnd Bergmann<arnd@arndb.de>
> Cc: Tomasz Figa<t.figa@samsung.com>
> Cc: Kyungmin Park<kyungmin.park@samsung.com>
> Cc: Kukjin Kim<kgene.kim@samsung.com>

Acked-by: Kukjin Kim <kgene.kim@samsung.com>

Thanks.

- Kukjin

> Cc: Ben Dooks<ben-linux@fluff.org>
> Cc: John Stultz<john.stultz@linaro.org>
> Cc: Thomas Gleixner<tglx@linutronix.de>
> ---
> This is my final attempt to fix the Exynos4 regressions we have, since
> Tomasz put a lot of work into getting this running, and I gave him a
> hard time about some of the earlier patches.
>
> Tomasz, can you have a look at this to see if it would actually help?
> I have removed all the non-DT registration from your code, as well
> as the interface to the pwm subsystem, since I assume the existing
> code will work for all users we care about.
