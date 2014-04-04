From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: Re: [PATCH 00/17] ARM: exynos: cpuidle: Move the driver to drivers/cpuidle
Date: Fri, 4 Apr 2014 14:30:49 +0530
Message-ID: <CAK9yfHyqysyXMWURUAScXWgVoXUYJqtYH2Z7_jkqYO4W0z+siw@mail.gmail.com>
References: <1396597683-6969-1-git-send-email-daniel.lezcano@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-oa0-f46.google.com ([209.85.219.46]:56818 "EHLO
	mail-oa0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752193AbaDDJAu (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 4 Apr 2014 05:00:50 -0400
Received: by mail-oa0-f46.google.com with SMTP id i7so3274225oag.33
        for <linux-samsung-soc@vger.kernel.org>; Fri, 04 Apr 2014 02:00:49 -0700 (PDT)
In-Reply-To: <1396597683-6969-1-git-send-email-daniel.lezcano@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Kukjin Kim <kgene.kim@samsung.com>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Tomasz Figa <t.figa@samsung.com>, Lists linaro-kernel <linaro-kernel@lists.linaro.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>

Hi Daniel,

On 4 April 2014 13:17, Daniel Lezcano <daniel.lezcano@linaro.org> wrote:
> This patchset relies on the cpm_pm notifier to initiate the powerdown sequence
> operations from pm.c instead cpuidle.c. Thus the cpuidle driver is no longer
> dependent from arch specific code as everything is called from the pm.c file.
>
> The patchset applies on top of v3.14.

It would be good to have this patch series based on Kukjin's for-next
which has several
changes like code refactoring and consolidation including Tomasz
Figa's PM consolidation
patches applied and would be merged in 3.15-rc1 release.

-- 
With warm regards,
Sachin
