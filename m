From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [GIT PULL 1/5] ARM: s3c24xx: Early stuff for v4.14
Date: Wed, 16 Aug 2017 21:51:20 +0200
Message-ID: <CAK8P3a1JEfJ95bmAnR6bLUtw9Eyt++4+SxPoNi_Pj5wVk2crCQ@mail.gmail.com>
References: <20170724190856.19055-1-krzk@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-oi0-f47.google.com ([209.85.218.47]:33633 "EHLO
        mail-oi0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752382AbdHPTvV (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 16 Aug 2017 15:51:21 -0400
In-Reply-To: <20170724190856.19055-1-krzk@kernel.org>
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
>   git://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-soc-4.14
>
> for you to fetch changes up to f991ce429a420dbb42b3e4b5a47490c84390d7e1:
>
>   ARM: s3c24xx: make H1940BT depend on RFKILL (2017-07-20 20:26:24 +0200)
>
> ----------------------------------------------------------------
> Samsung mach/soc changes for v4.14
>
> Only for S3C24xx platform:
> 1. Cleanup from non-existent CONFIG entries.
> 2. Fix unmet NET dependency when H1940 bluetooth chip is selected..

Pulled into next/soc, thanks!

        Arnd
