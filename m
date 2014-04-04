From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH 12/17] ARM: exynos: cpuidle: Move S5P_CHECK_AFTR in a header
Date: Fri, 4 Apr 2014 14:33:20 +0530
Message-ID: <CAKohpom35cbzoJL7VZf-mMRaG2GhCcC8N1Oc2RzbWWH19Fn+Zg@mail.gmail.com>
References: <1396597683-6969-1-git-send-email-daniel.lezcano@linaro.org>
	<1396597683-6969-13-git-send-email-daniel.lezcano@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ob0-f178.google.com ([209.85.214.178]:43567 "EHLO
	mail-ob0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752233AbaDDJDV (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 4 Apr 2014 05:03:21 -0400
Received: by mail-ob0-f178.google.com with SMTP id wp18so3244886obc.9
        for <linux-samsung-soc@vger.kernel.org>; Fri, 04 Apr 2014 02:03:20 -0700 (PDT)
In-Reply-To: <1396597683-6969-13-git-send-email-daniel.lezcano@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Kukjin Kim <kgene.kim@samsung.com>, Tomasz Figa <t.figa@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Lists linaro-kernel <linaro-kernel@lists.linaro.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

On 4 April 2014 13:17, Daniel Lezcano <daniel.lezcano@linaro.org> wrote:
> Move the S5P_CHECK_AFTR definition to the header it belongs to.
>
> Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
> ---
>  arch/arm/mach-exynos/cpuidle.c  |    2 --
>  arch/arm/mach-exynos/regs-pmu.h |    1 +
>  2 files changed, 1 insertion(+), 2 deletions(-)

Reviewed-by: Viresh Kumar <viresh.kumar@linaro.org>
