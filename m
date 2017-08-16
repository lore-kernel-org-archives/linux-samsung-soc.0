From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [GIT PULL 3/5] arm64: dts: exynos: Updates for v4.14
Date: Wed, 16 Aug 2017 23:37:09 +0200
Message-ID: <CAK8P3a0hd_ogstUZ6U0e7pqp_04OcgLZk4O8nA3kiucj44h4Ag@mail.gmail.com>
References: <20170724190856.19055-1-krzk@kernel.org> <20170724190856.19055-3-krzk@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-oi0-f68.google.com ([209.85.218.68]:38111 "EHLO
        mail-oi0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752266AbdHPVhK (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 16 Aug 2017 17:37:10 -0400
In-Reply-To: <20170724190856.19055-3-krzk@kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Olof Johansson <olof@lixom.net>, arm-soc <arm@kernel.org>, Kukjin Kim <kgene@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, "moderated list:ARM/SAMSUNG EXYNOS ARM ARCHITECTURES" <linux-samsung-soc@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Mon, Jul 24, 2017 at 9:08 PM, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> The following changes since commit 5771a8c08880cdca3bfb4a3fc6d309d6bba20877:
>
>   Linux v4.13-rc1 (2017-07-15 15:22:10 -0700)
>
> are available in the git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-dt64-4.14
>
> for you to fetch changes up to 10acba1293db5c28d1b81d673e75c2415cb96f62:
>
>   arm64: dts: exynos: Remove num-slots from exynos platforms (2017-07-18 07:16:14 +0200)
>
> ----------------------------------------------------------------
> Samsung DTS ARM64 changes for v4.14
>
> 1. Remove deprecated and unneeded properties from Exynos boards.
> 2. Implement proper (working) support for USB On-The-Go on Exynos5433
>    TM2/TM2E boards.

Pulled into next/dt64, thanks!

       Arnd
