From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [GIT PULL 1/3] ARM: dts: exynos: DTS for v4.16
Date: Thu, 21 Dec 2017 22:29:00 +0100
Message-ID: <CAK8P3a2wSt5WjT26MT1QhYVxCcYJ8YV0cdsx19zvYZPqUgF+7Q@mail.gmail.com>
References: <20171220173643.5840-1-krzk@kernel.org> <20171220173643.5840-3-krzk@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ot0-f196.google.com ([74.125.82.196]:44238 "EHLO
        mail-ot0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752884AbdLUV3B (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 21 Dec 2017 16:29:01 -0500
In-Reply-To: <20171220173643.5840-3-krzk@kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Olof Johansson <olof@lixom.net>, arm-soc <arm@kernel.org>, Kukjin Kim <kgene@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, "moderated list:ARM/SAMSUNG EXYNOS ARM ARCHITECTURES" <linux-samsung-soc@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Javier Martinez Canillas <javier@osg.samsung.com>

On Wed, Dec 20, 2017 at 6:36 PM, Krzysztof Kozlowski <krzk@kernel.org> wrote:

> Krzysztof Kozlowski (2):
>       ARM: dts: exynos: Add missing interrupt-controller properties to Exynos5410 PMU

I just looked through the remaining warnings in 4.15 and noticed that
you had sent this
only for 4.16, not as a bug fix.

Looking closer, it seems incorrect:

According to the comment added to exynos_dt_pmu_match[] in commit
8b283c025443 ("ARM: exynos4/5: convert pmu wakeup to stacked domains"),
the RTC is not able to wake up the system through the PMU on Exynos5410,
unlike Exynos5420. However, when the RTC DT node got added in commit
e1e146b1b062 ("ARM: dts: exynos: Add RTC and I2C to Exynos5410"), it was
a straight copy of the Exynos5420 node, which now causes the warning from dtc,
and now you add the "interrupt-controller" property to the device node, but
the code still doesn't handle it at all.

Can you have another look here?

        Arnd
