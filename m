From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH] ARM: multi_v7_defconfig: Enable USB3503 driver
Date: Thu, 28 Sep 2017 08:21:26 +0200
Message-ID: <CAJKOXPfQ3nXHVYXUn0iDfzVQc+ML1sSCz3NG_bwUw=WDK0id_w@mail.gmail.com>
References: <20170928024022.2071-1-linus.luessing@c0d3.blue>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:40280 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751236AbdI1GV3 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 28 Sep 2017 02:21:29 -0400
In-Reply-To: <20170928024022.2071-1-linus.luessing@c0d3.blue>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?UTF-8?Q?Linus_L=C3=BCssing?= <linus.luessing@c0d3.blue>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Kukjin Kim <kgene@kernel.org>, Russell King <linux@armlinux.org.uk>, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>

On Thu, Sep 28, 2017 at 4:40 AM, Linus Lüssing <linus.luessing@c0d3.blue> wrote:
> The Odroid U3 (Exynos 4412 based) for instance needs this driver,
> otherwise its USB hub will not come up.
>
> exynos_defconfig already has this enabled as built-in, too. So
> just doing the same here in multi_v7_defconfig.
>
> Signed-off-by: Linus Lüssing <linus.luessing@c0d3.blue>
>
> ---
> Thanks to Tobias Jakobi, who indirectly made me aware of why USB
> did not work for me.
>
>  arch/arm/configs/multi_v7_defconfig | 1 +
>  1 file changed, 1 insertion(+)

Partially this was part of my patchset fixing powersequence for
usb3503 and lan9730:
https://patchwork.kernel.org/patch/9502939/
but that patch waits still for power sequence.

Anyway please define this as a module (unless it can't... but it
worked in my case).

Best regards,
Krzysztof
