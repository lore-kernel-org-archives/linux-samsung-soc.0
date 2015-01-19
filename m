From: =?UTF-8?Q?Krzysztof_Koz=C5=82owski?= <k.kozlowski.k@gmail.com>
Subject: Re: Exynos4 CONFIG_HZ
Date: Mon, 19 Jan 2015 11:23:04 +0100
Message-ID: <CAJKOXPfHBEKFKo=eYgDK_8zsPk4+23yDQQj7e07GhHFhS80ZDw@mail.gmail.com>
References: <alpine.DEB.0.99999.1501181744400.30567@zem.blinkenlights.nl>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vc0-f173.google.com ([209.85.220.173]:51279 "EHLO
	mail-vc0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751426AbbASKXG (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 19 Jan 2015 05:23:06 -0500
Received: by mail-vc0-f173.google.com with SMTP id kv19so9854689vcb.4
        for <linux-samsung-soc@vger.kernel.org>; Mon, 19 Jan 2015 02:23:04 -0800 (PST)
In-Reply-To: <alpine.DEB.0.99999.1501181744400.30567@zem.blinkenlights.nl>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sten Spans <sten@blinkenlights.nl>
Cc: linux-samsung-soc@vger.kernel.org, 774896@bugs.debian.org, Kukjin Kim <kgene.kim@samsung.com>

2015-01-18 17:57 GMT+01:00 Sten Spans <sten@blinkenlights.nl>:
>
> With the  improvements in upstream support for exynos4 devices
> I've been looking into adding support odroid devices to Debian's
> armmp kernel. The kernel config changes needed are quite minimal
> as can be seen here:
>
> https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=774896
>
> Mostly enabling support and various modules.
>
> However as Ian Campbell notes, enabling ARCH_EXYNOS4 triggers
> the following from arch/arm/Kconfig:
>         config HZ_FIXED
>                 int
>                 default 200 if ARCH_EBSA110 || ARCH_S3C24XX || \
>                         ARCH_S5PV210 || ARCH_EXYNOS4
>                 default AT91_TIMER_HZ if ARCH_AT91
>                 default SHMOBILE_TIMER_HZ if ARCH_SHMOBILE_LEGACY
>                 default 0
>
> This forces CONFIG_HZ=200 for the entire armmp kernel, which is
> undesirable. The reason for this setting isn't very clear to either
> me or Ian. I personally have verified that HZ=250 (the default for debian
> armmp kernels) boots fine.
>
> Is there a particular reason for this setting?
> Would a patch removing this requirement for ARCH_EXYNOS4 be accepted?

+Cc Kukjin Kim

I cannot find a valid reason for fixed 200 Hz, especially that other
values (<100, 1000>) are working. Maybe Kukjin will share some light
on this?

Best regards,
Krzysztof
