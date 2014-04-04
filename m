From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH 02/17] ARM: exynos: cpuidle: use cpuidle_register
Date: Fri, 4 Apr 2014 14:14:28 +0530
Message-ID: <CAKohpok84nOvudG3Grs=YVcAczX6wUYX6YcWDECagKP6tRdnoA@mail.gmail.com>
References: <1396597683-6969-1-git-send-email-daniel.lezcano@linaro.org>
	<1396597683-6969-3-git-send-email-daniel.lezcano@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ob0-f181.google.com ([209.85.214.181]:42938 "EHLO
	mail-ob0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751382AbaDDIo3 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 4 Apr 2014 04:44:29 -0400
Received: by mail-ob0-f181.google.com with SMTP id wp4so3208792obc.12
        for <linux-samsung-soc@vger.kernel.org>; Fri, 04 Apr 2014 01:44:28 -0700 (PDT)
In-Reply-To: <1396597683-6969-3-git-send-email-daniel.lezcano@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Kukjin Kim <kgene.kim@samsung.com>, Tomasz Figa <t.figa@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Lists linaro-kernel <linaro-kernel@lists.linaro.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

On 4 April 2014 13:17, Daniel Lezcano <daniel.lezcano@linaro.org> wrote:
> Use the cpuidle generic function 'cpuidle_register'. That saves us from some
> extra lines of code and unneeded variables.
>
> Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
> ---
>  arch/arm/mach-exynos/cpuidle.c |   18 ++----------------
>  1 file changed, 2 insertions(+), 16 deletions(-)

Reviewed-by: Viresh Kumar <viresh.kumar@linaro.org>
