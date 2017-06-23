From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [GIT PULL 2/2] ARM: defconfig: Topic branch with defconfig
 cleanup for v4.13
Date: Fri, 23 Jun 2017 10:01:20 +0200
Message-ID: <CAK8P3a27eUnTBYiBUVcouj49Hxhv2scdFg2R2K9eAHwOYdnCXg@mail.gmail.com>
References: <20170619160509.5065-1-krzk@kernel.org> <20170619160509.5065-2-krzk@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-oi0-f66.google.com ([209.85.218.66]:34528 "EHLO
        mail-oi0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752878AbdFWIBV (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 23 Jun 2017 04:01:21 -0400
In-Reply-To: <20170619160509.5065-2-krzk@kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Olof Johansson <olof@lixom.net>, arm-soc <arm@kernel.org>, Kukjin Kim <kgene@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, "moderated list:ARM/SAMSUNG EXYNOS ARM ARCHITECTURES" <linux-samsung-soc@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Mon, Jun 19, 2017 at 6:05 PM, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> ----------------------------------------------------------------
> ARM defconfig cleanup:
> 1. Remove old Kconfig options from all ARM configs,
> 2. Update Samsung defconfigs to bring back options over time got disabled
>    for some reason (configs were not updated along with the code),
> 3. Save defconfigs for Samsung.

Pulled into next/defconfig.

Thanks a lot for the cleanup work!

        Arnd
