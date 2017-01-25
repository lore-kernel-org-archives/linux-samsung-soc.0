From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 7/7] mfd: exynos-lpass: Add runtime PM support
Date: Wed, 25 Jan 2017 22:04:34 +0200
Message-ID: <20170125200434.zhyjhffyftp4cfth@kozik-lap>
References: <1485345031-2948-1-git-send-email-m.szyprowski@samsung.com>
 <CGME20170125115105eucas1p1e7191cf0be871c254dd09477ca7f9e1a@eucas1p1.samsung.com>
 <1485345031-2948-8-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wm0-f66.google.com ([74.125.82.66]:35949 "EHLO
        mail-wm0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751016AbdAYUEj (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 25 Jan 2017 15:04:39 -0500
Content-Disposition: inline
In-Reply-To: <1485345031-2948-8-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Sylwester Nawrocki <s.nawrocki@samsung.com>, Linus Walleij <linus.walleij@linaro.org>, Tomasz Figa <tomasz.figa@gmail.com>, Lee Jones <lee.jones@linaro.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

On Wed, Jan 25, 2017 at 12:50:31PM +0100, Marek Szyprowski wrote:
> Convert exisitng lpass-suspend/resume callbacks into runtime PM callbacks.
> This way Exynos LPASS driver will be ready for use with power domains
> enabled. LPASS will be runtime resumed/suspended as a result of its child
> devices runtime PM transitions.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  drivers/mfd/exynos-lpass.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
> 

Acked-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof
