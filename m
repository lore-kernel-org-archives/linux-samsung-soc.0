From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH] cpufreq: exynos5440: Fix to skip when new frequency same
 as current
Date: Thu, 8 Aug 2013 08:03:33 +0530
Message-ID: <CAKohpokdvJxcWjbOgDLAzjcW_vN6hdZz_OWjFSBSLrFTccCmJg@mail.gmail.com>
References: <1375874171-16951-1-git-send-email-amit.daniel@samsung.com>
	<52022FC2.2010109@arm.com>
	<CAKohpom0gPk9BXRP2eEuX_HBXDut=wynrZfvOH1tcEQY6CMLNQ@mail.gmail.com>
	<2331427.ybQdfvflPh@vostro.rjw.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qa0-f50.google.com ([209.85.216.50]:41806 "EHLO
	mail-qa0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933534Ab3HHCde (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 7 Aug 2013 22:33:34 -0400
Received: by mail-qa0-f50.google.com with SMTP id f14so54523qak.2
        for <linux-samsung-soc@vger.kernel.org>; Wed, 07 Aug 2013 19:33:33 -0700 (PDT)
In-Reply-To: <2331427.ybQdfvflPh@vostro.rjw.lan>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: "Rafael J. Wysocki" <rjw@sisk.pl>
Cc: Sudeep KarkadaNagesha <Sudeep.KarkadaNagesha@arm.com>, Amit Daniel Kachhap <amit.daniel@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Lists linaro-kernel <linaro-kernel@lists.linaro.org>

On 8 August 2013 04:55, Rafael J. Wysocki <rjw@sisk.pl> wrote:
> It looks like it would require us to redefine .target() to take next_state
> instead of target_freq (at least in the acpi-cpufreq case), wouldn't it?

If we don't do it, then atleast for few drivers, like acpi-cpufreq, which
use index more than just for frequency, we may end up calling
cpufreq_frequency_table_target() twice. Once in the core and then
in driver.

I believe this is doable and will post a patch soon.
