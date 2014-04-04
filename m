From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH 17/17] ARM: exynos: config: Enable cpuidle
Date: Fri, 4 Apr 2014 14:40:27 +0530
Message-ID: <CAKohpo=Dbp1uSCpOMhAx5vk9ddYP=DK14Od6_aoAuyX3mrwzew@mail.gmail.com>
References: <1396597683-6969-1-git-send-email-daniel.lezcano@linaro.org>
	<1396597683-6969-18-git-send-email-daniel.lezcano@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-oa0-f47.google.com ([209.85.219.47]:54587 "EHLO
	mail-oa0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751999AbaDDJK2 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 4 Apr 2014 05:10:28 -0400
Received: by mail-oa0-f47.google.com with SMTP id i11so3272685oag.34
        for <linux-samsung-soc@vger.kernel.org>; Fri, 04 Apr 2014 02:10:27 -0700 (PDT)
In-Reply-To: <1396597683-6969-18-git-send-email-daniel.lezcano@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Kukjin Kim <kgene.kim@samsung.com>, Tomasz Figa <t.figa@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Lists linaro-kernel <linaro-kernel@lists.linaro.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

On 4 April 2014 13:18, Daniel Lezcano <daniel.lezcano@linaro.org> wrote:
> The cpuidle driver is broken since v3.11 and now we are at v3.14.
>
> Default the cpuidle driver to favorize a better detection next time.
>
> Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
> ---
>  arch/arm/configs/exynos_defconfig |    1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Viresh Kumar <viresh.kumar@linaro.org>
