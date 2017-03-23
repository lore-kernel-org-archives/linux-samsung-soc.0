From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [GIT PULL] Immutable branch between MFD and PHY due for the v4.12
 merge window
Date: Thu, 23 Mar 2017 13:58:30 +0200
Message-ID: <CAJKOXPdd5H-oBnz74ay-oEtUqrQ-GZwgNoaf_cD9nOUHHRHWrg@mail.gmail.com>
References: <20170314164653.15771-1-krzk@kernel.org> <20170314164653.15771-5-krzk@kernel.org>
 <20170323105110.26w3g6jxrlgdtka7@dell>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.136]:34058 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751448AbdCWL6f (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 23 Mar 2017 07:58:35 -0400
In-Reply-To: <20170323105110.26w3g6jxrlgdtka7@dell>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>, Kishon Vijay Abraham I <kishon@ti.com>
Cc: Kukjin Kim <kgene@kernel.org>, Javier Martinez Canillas <javier@osg.samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

On Thu, Mar 23, 2017 at 12:51 PM, Lee Jones <lee.jones@linaro.org> wrote:
> Enjoy!
>
> The following changes since commit c1ae3cfa0e89fa1a7ecc4c99031f5e9ae99d9201:
>
>   Linux 4.11-rc1 (2017-03-05 12:59:56 -0800)
>
> are available in the git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git ib-mfd-phy-v4.12
>
> for you to fetch changes up to f7f6c060547c51691f9b943e6c33f63675c1a0a9:
>
>   mfd: exynos-lpass: Use common soc/exynos-regs-pmu.h header (2017-03-23 10:47:27 +0000)
>
> ----------------------------------------------------------------
> Immutable branch between MFD and PHY due for the v4.12 merge window
>
> ----------------------------------------------------------------
> Krzysztof Kozlowski (1):
>       mfd: exynos-lpass: Use common soc/exynos-regs-pmu.h header
>
>  drivers/mfd/exynos-lpass.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Thanks.

Kishon,
This is the dependency for last patch in v4 of:
https://www.spinics.net/lists/arm-kernel/msg568609.html

Everything else is acked and ready for you to apply.

Any comments?

Best regards,
Krzysztof
