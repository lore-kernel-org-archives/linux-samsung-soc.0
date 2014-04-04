From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH 14/17] ARM: exynos: cpuidle: Move the boot vector in pm.c
Date: Fri, 4 Apr 2014 14:35:47 +0530
Message-ID: <CAKohpoktFrLgvnPSYNhkJf23KFxbVSr-gH1Zp+SMod8Uo1ntdw@mail.gmail.com>
References: <1396597683-6969-1-git-send-email-daniel.lezcano@linaro.org>
	<1396597683-6969-15-git-send-email-daniel.lezcano@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ob0-f174.google.com ([209.85.214.174]:38495 "EHLO
	mail-ob0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751996AbaDDJFs (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 4 Apr 2014 05:05:48 -0400
Received: by mail-ob0-f174.google.com with SMTP id wo20so3238406obc.33
        for <linux-samsung-soc@vger.kernel.org>; Fri, 04 Apr 2014 02:05:48 -0700 (PDT)
In-Reply-To: <1396597683-6969-15-git-send-email-daniel.lezcano@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Kukjin Kim <kgene.kim@samsung.com>, Tomasz Figa <t.figa@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Lists linaro-kernel <linaro-kernel@lists.linaro.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

On 4 April 2014 13:18, Daniel Lezcano <daniel.lezcano@linaro.org> wrote:
> As usual, move the boot vector setting in the pm.c file and use the cpu_pm
> notifier to set it up.
>
> Remove the unused headers.
>
> Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
> ---
>  arch/arm/mach-exynos/cpuidle.c |   22 ----------------------
>  arch/arm/mach-exynos/pm.c      |   15 +++++++++++++++
>  2 files changed, 15 insertions(+), 22 deletions(-)

Reviewed-by: Viresh Kumar <viresh.kumar@linaro.org>
