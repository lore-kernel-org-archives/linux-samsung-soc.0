From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH v2] cpufreq: exynos: Fix driver compilation with ARCH_MULTIPLATFORM
Date: Mon, 26 May 2014 11:10:35 +0530
Message-ID: <CAKohpo=b=Jm4vZfgS2YPA740QfvktgVExXXzOdSUmQjGWhzrhg@mail.gmail.com>
References: <1400670752-673-1-git-send-email-t.figa@samsung.com>
	<1400858533-4327-1-git-send-email-t.figa@samsung.com>
	<53826377.8060709@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-oa0-f45.google.com ([209.85.219.45]:52553 "EHLO
	mail-oa0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751179AbaEZFkg (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 26 May 2014 01:40:36 -0400
Received: by mail-oa0-f45.google.com with SMTP id l6so7873424oag.4
        for <linux-samsung-soc@vger.kernel.org>; Sun, 25 May 2014 22:40:35 -0700 (PDT)
In-Reply-To: <53826377.8060709@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: Tomasz Figa <t.figa@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Sachin Kamat <sachin.kamat@linaro.org>, Arnd Bergmann <arnd@arndb.de>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Thomas Abraham <thomas.ab@samsung.com>

On 26 May 2014 03:11, Kukjin Kim <kgene.kim@samsung.com> wrote:
> I'm not sure Thomas' v5 cpufreq-cpu0 driver can be upstreamed for 3.16
> because of dependency with others, some of them got ack though...
>
> * "PM / OPP: move cpufreq specific helpers out of OPP layer"
> - https://www.mail-archive.com/linux-omap@vger.kernel.org/msg104610.html

This is already lying in Rafael's tree.

> * "cpufreq: opp: Add device tree based lookup of boost mode frequency"
> - http://www.spinics.net/lists/arm-kernel/msg334336.html
>
> So firstly, I've queued this instead with exynos-multiplatform series...
>
> How do you think?

Looks fine to me. Thanks.
