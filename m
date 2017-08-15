From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [GIT PULL 4/5] ARM: defconfig: Exynos updates for v4.14
Date: Tue, 15 Aug 2017 17:53:15 +0200
Message-ID: <CAK8P3a3qZAWcd50OR2gGH4FEk2QjH4v2mRsHsdMA=o8MogXREQ@mail.gmail.com>
References: <20170724190856.19055-1-krzk@kernel.org> <20170724190856.19055-4-krzk@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-oi0-f65.google.com ([209.85.218.65]:33558 "EHLO
        mail-oi0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752154AbdHOPxQ (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 15 Aug 2017 11:53:16 -0400
In-Reply-To: <20170724190856.19055-4-krzk@kernel.org>
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
>   git://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-defconfig-4.14
>
> for you to fetch changes up to 57ee24144e57b762dc46f171e1f138ccfc464867:
>
>   ARM: exynos_defconfig: Enable locking test options (2017-07-18 17:58:46 +0200)
>
> ----------------------------------------------------------------
> Samsung defconfig changes for v4.14
>
> 1. Enable some drivers useful on our boards (communication: Bluetooth,
>    WiFi, NFC, USB; codepages and crypto algorithms).
> 2. Enable debugging and lock testing options. These might have impact on
>    performance but we use the exynos_defconfig a lot during development
>    so they should bring benefits of detecting early locking issues.
>

Pulled into next/defconfig, thanks!

        Arnd
