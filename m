From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH 04/17] ARM: exynos: cpuidle: encapsulate register access
 inside a function
Date: Fri, 4 Apr 2014 14:16:12 +0530
Message-ID: <CAKohpomCX1qg-E5XD5X5Cr0vBH8zPrDQDwd2yFnuta-D6JT_uA@mail.gmail.com>
References: <1396597683-6969-1-git-send-email-daniel.lezcano@linaro.org>
	<1396597683-6969-5-git-send-email-daniel.lezcano@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-oa0-f51.google.com ([209.85.219.51]:41223 "EHLO
	mail-oa0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751382AbaDDIqN (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 4 Apr 2014 04:46:13 -0400
Received: by mail-oa0-f51.google.com with SMTP id i4so3209826oah.38
        for <linux-samsung-soc@vger.kernel.org>; Fri, 04 Apr 2014 01:46:13 -0700 (PDT)
In-Reply-To: <1396597683-6969-5-git-send-email-daniel.lezcano@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Kukjin Kim <kgene.kim@samsung.com>, Tomasz Figa <t.figa@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Lists linaro-kernel <linaro-kernel@lists.linaro.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

On 4 April 2014 13:17, Daniel Lezcano <daniel.lezcano@linaro.org> wrote:
> That makes the code cleaner and encapsulted. The function will be reused in the
> next patch.
>
> Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
> ---
>  arch/arm/mach-exynos/pm.c |   65 ++++++++++++++++++++++++++++-----------------
>  1 file changed, 41 insertions(+), 24 deletions(-)

Reviewed-by: Viresh Kumar <viresh.kumar@linaro.org>
