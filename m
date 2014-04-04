From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH 03/17] ARM: exynos: cpuidle: change function name prefix
Date: Fri, 4 Apr 2014 14:15:10 +0530
Message-ID: <CAKohpomM9rggGtZ+aw2nWpbBkoGzS82S2uLorNh1+a_CKnMZTQ@mail.gmail.com>
References: <1396597683-6969-1-git-send-email-daniel.lezcano@linaro.org>
	<1396597683-6969-4-git-send-email-daniel.lezcano@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-oa0-f45.google.com ([209.85.219.45]:44161 "EHLO
	mail-oa0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751713AbaDDIpL (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 4 Apr 2014 04:45:11 -0400
Received: by mail-oa0-f45.google.com with SMTP id eb12so3263660oac.32
        for <linux-samsung-soc@vger.kernel.org>; Fri, 04 Apr 2014 01:45:10 -0700 (PDT)
In-Reply-To: <1396597683-6969-4-git-send-email-daniel.lezcano@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Kukjin Kim <kgene.kim@samsung.com>, Tomasz Figa <t.figa@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Lists linaro-kernel <linaro-kernel@lists.linaro.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

On 4 April 2014 13:17, Daniel Lezcano <daniel.lezcano@linaro.org> wrote:
> The driver was initially written for exynos4 but the driver is used also for
> exynos5.
>
> Change the function prefix name exynos4 -> exynos
>
> Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
> ---
>  arch/arm/mach-exynos/cpuidle.c |   20 ++++++++++----------
>  1 file changed, 10 insertions(+), 10 deletions(-)

Reviewed-by: Viresh Kumar <viresh.kumar@linaro.org>
