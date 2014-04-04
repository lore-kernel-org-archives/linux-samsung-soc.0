From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH 15/17] ARM: exynos: cpuidle: Pass the AFTR callback to the platform_data
Date: Fri, 4 Apr 2014 14:39:56 +0530
Message-ID: <CAKohpon0ti43Rt8wTp4xi2zR_9ryK9oSq5KKHc-8gkEkZc0pQA@mail.gmail.com>
References: <1396597683-6969-1-git-send-email-daniel.lezcano@linaro.org>
	<1396597683-6969-16-git-send-email-daniel.lezcano@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-oa0-f45.google.com ([209.85.219.45]:51200 "EHLO
	mail-oa0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752207AbaDDJJ4 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 4 Apr 2014 05:09:56 -0400
Received: by mail-oa0-f45.google.com with SMTP id eb12so3287091oac.32
        for <linux-samsung-soc@vger.kernel.org>; Fri, 04 Apr 2014 02:09:56 -0700 (PDT)
In-Reply-To: <1396597683-6969-16-git-send-email-daniel.lezcano@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Kukjin Kim <kgene.kim@samsung.com>, Tomasz Figa <t.figa@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Lists linaro-kernel <linaro-kernel@lists.linaro.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

On 4 April 2014 13:18, Daniel Lezcano <daniel.lezcano@linaro.org> wrote:
> No more dependency on the arch code. The platform_data field is used to set the
> PM callback as the other cpuidle driver.
>
> Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
> ---
>  arch/arm/mach-exynos/common.c  |    5 +++--
>  arch/arm/mach-exynos/common.h  |    1 +
>  arch/arm/mach-exynos/cpuidle.c |    8 ++++----
>  arch/arm/mach-exynos/pmu.c     |    6 ++++++
>  4 files changed, 14 insertions(+), 6 deletions(-)

Reviewed-by: Viresh Kumar <viresh.kumar@linaro.org>
