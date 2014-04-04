From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH 13/17] ARM: exynos: cpuidle: Move clock setup to pm.c
Date: Fri, 4 Apr 2014 14:35:04 +0530
Message-ID: <CAKohpomAC5O+i=h+X-6UYjFOf3C91jjOYizG_DPR=GhmCh95cg@mail.gmail.com>
References: <1396597683-6969-1-git-send-email-daniel.lezcano@linaro.org>
	<1396597683-6969-14-git-send-email-daniel.lezcano@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-oa0-f43.google.com ([209.85.219.43]:49415 "EHLO
	mail-oa0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751996AbaDDJFF (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 4 Apr 2014 05:05:05 -0400
Received: by mail-oa0-f43.google.com with SMTP id eb12so3263659oac.16
        for <linux-samsung-soc@vger.kernel.org>; Fri, 04 Apr 2014 02:05:04 -0700 (PDT)
In-Reply-To: <1396597683-6969-14-git-send-email-daniel.lezcano@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Kukjin Kim <kgene.kim@samsung.com>, Tomasz Figa <t.figa@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Lists linaro-kernel <linaro-kernel@lists.linaro.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

On 4 April 2014 13:17, Daniel Lezcano <daniel.lezcano@linaro.org> wrote:
> One more step is moving the clock ratio setting at idle time in pm.c
>
> The macro names have been changed to be consistent with the other macros
> name in the file.
>
> Note, the clock divider was working only when cpuidle was enabled because it
> was in its init routine. With this change, the clock divider is set in the pm's
> init routine, so it will also operate when the cpuidle driver is not set, which
> is good.
>
> Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
> ---
>  arch/arm/mach-exynos/cpuidle.c |   54 ---------------------------------------
>  arch/arm/mach-exynos/pm.c      |   55 +++++++++++++++++++++++++++++++++++++++-
>  2 files changed, 54 insertions(+), 55 deletions(-)

Reviewed-by: Viresh Kumar <viresh.kumar@linaro.org>
