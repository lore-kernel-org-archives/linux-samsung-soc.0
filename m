From: Ming Lei <tom.leiming@gmail.com>
Subject: Re: [PATCH] clockevent: exynos_mct: fix lockdep warning
Date: Fri, 27 Sep 2013 21:09:14 +0800
Message-ID: <CACVXFVO=k-wJ2SrjVQ_k1JhtAOo0-rZ_M780rqGWCbKA8_1qBQ@mail.gmail.com>
References: <1380120578-17458-1-git-send-email-tom.leiming@gmail.com>
	<5243823D.4040208@linaro.org>
	<17472486.7GQJa9ux9F@amdc1227>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vb0-f41.google.com ([209.85.212.41]:49564 "EHLO
	mail-vb0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751321Ab3I0NJQ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 27 Sep 2013 09:09:16 -0400
Received: by mail-vb0-f41.google.com with SMTP id g17so1883854vbg.28
        for <linux-samsung-soc@vger.kernel.org>; Fri, 27 Sep 2013 06:09:15 -0700 (PDT)
In-Reply-To: <17472486.7GQJa9ux9F@amdc1227>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <t.figa@samsung.com>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Thomas Gleixner <tglx@linutronix.de>, Kukjin Kim <kgene.kim@samsung.com>, linux-samsung-soc@vger.kernel.org, Tomasz Figa <tomasz.figa@gmail.com>

On Thu, Sep 26, 2013 at 6:32 PM, Tomasz Figa <t.figa@samsung.com> wrote:
>
> This is a fix that we may want to have, but it must be modified to take
> my regression fix[1] into account.
>
> [1] clocksource: exynos_mct: Set IRQ affinity when the CPU goes online
> http://thread.gmane.org/gmane.linux.kernel.samsung-soc/22511/focus=23418

OK, I will write and submit v1 against your patch.

Thanks,
-- 
Ming Lei
