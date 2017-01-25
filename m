From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 2/7] pinctrl: samsung: Ensure that pad retention is
 disabled on driver init
Date: Wed, 25 Jan 2017 19:38:43 +0200
Message-ID: <20170125173843.veihl4hcm5iagmno@kozik-lap>
References: <1485345031-2948-1-git-send-email-m.szyprowski@samsung.com>
 <CGME20170125115102eucas1p180bbbdbcc09381051ab86bed6cfad5d0@eucas1p1.samsung.com>
 <1485345031-2948-3-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wm0-f65.google.com ([74.125.82.65]:34564 "EHLO
        mail-wm0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751696AbdAYRit (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 25 Jan 2017 12:38:49 -0500
Content-Disposition: inline
In-Reply-To: <1485345031-2948-3-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Sylwester Nawrocki <s.nawrocki@samsung.com>, Linus Walleij <linus.walleij@linaro.org>, Tomasz Figa <tomasz.figa@gmail.com>, Lee Jones <lee.jones@linaro.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

On Wed, Jan 25, 2017 at 12:50:26PM +0100, Marek Szyprowski wrote:
> When pin controller device is a part of power domain, there is no guarantee
> that the power domain was not turned off and then on during boot process
> before probing of the pin control driver. If it happened, then pin control
> driver should ensure that pad retention is turned off during its probe call.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  drivers/pinctrl/samsung/pinctrl-exynos.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 

Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof
