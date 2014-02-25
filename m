From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [PATCH 2/3] arm64: Add Kconfig option for Samsung GH7 SoC family
Date: Tue, 25 Feb 2014 09:20:59 +0900
Message-ID: <530BE1EB.8070602@samsung.com>
References: <1392100183-30930-1-git-send-email-kgene.kim@samsung.com> <5302B306.8090503@samsung.com> <CAOesGMhnUDcUL7hREV=EYEGr5YG-ZLL6v9NiGcrBr6477WfdyQ@mail.gmail.com> <6032891.ndY8FikAMY@wuerfel> <CALAqxLX6STNqUeVO2G18bm_HKabpoRxZTa3uK6i-JP97zEYVZg@mail.gmail.com> <CAOesGMjLR3PGXeyJPAvGwam4yK97+vnDfq5MVutJz75aKPX8gw@mail.gmail.com> <CALAqxLU7ehHfvQa58HpdzojRU-2zhNpEgkr9KEJ3cf550WcnWw@mail.gmail.com> <CAOesGMjSjzZ4iX3NVA6eS4LHJF2MQQ=KJpNgKWikJb6YkQxNpQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f46.google.com ([209.85.160.46]:33471 "EHLO
	mail-pb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751472AbaBYAVK (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 24 Feb 2014 19:21:10 -0500
Received: by mail-pb0-f46.google.com with SMTP id um1so7253239pbc.19
        for <linux-samsung-soc@vger.kernel.org>; Mon, 24 Feb 2014 16:21:09 -0800 (PST)
In-Reply-To: <CAOesGMjSjzZ4iX3NVA6eS4LHJF2MQQ=KJpNgKWikJb6YkQxNpQ@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Olof Johansson <olof@lixom.net>
Cc: John Stultz <john.stultz@linaro.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, Catalin Marinas <catalin.marinas@arm.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, Ilho Lee <ilho215.lee@samsung.com>, Thomas Abraham <thomas.ab@samsung.com>, Kumar Gala <galak@codeaurora.org>, Kukjin Kim <kgene.kim@samsung.com>, Thomas Gleixner <tglx@linutronix.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

On 02/20/14 18:03, Olof Johansson wrote:

[...]
>
> I.e. I'd be OK with an
> ARCH_EXYNOS/ARCH_TEGRA/ARCH_IMX/ARCH_<whatever>, but I don't think we
> should add more finegrained options than that globally on ARM64, at
> least not until truly proven to be needed. We're trying to push back
> against new per-SoC Kconfig entries on 32-bit as well right now.
>
OK, agreed.

- Kukjin
