From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v2] ARM: multi_v7_defconfig: Enable USB3503 driver
Date: Sat, 30 Sep 2017 18:40:37 +0200
Message-ID: <20170930164037.ccwzqzagymy3g37c@kozik-lap>
References: <20170928202703.21364-1-linus.luessing@c0d3.blue>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wm0-f68.google.com ([74.125.82.68]:34327 "EHLO
        mail-wm0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751069AbdI3Qkk (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 30 Sep 2017 12:40:40 -0400
Content-Disposition: inline
In-Reply-To: <20170928202703.21364-1-linus.luessing@c0d3.blue>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Linus =?utf-8?Q?L=C3=BCssing?= <linus.luessing@c0d3.blue>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Kukjin Kim <kgene@kernel.org>, Russell King <linux@armlinux.org.uk>, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>

On Thu, Sep 28, 2017 at 10:27:03PM +0200, Linus Lüssing wrote:
> The Odroid U3 (Exynos 4412 based) for instance needs this driver,
> otherwise its USB hub will not come up.
> 
> Also selecting it as built-in to allow booting from USB without
> an initrd/initramfs. exynos_defconfig does the same already, too.
> 
> Signed-off-by: Linus Lüssing <linus.luessing@c0d3.blue>
> ---
>  arch/arm/configs/multi_v7_defconfig | 1 +
>  1 file changed, 1 insertion(+)
> 

Thanks, applied.

Best regards,
Krzysztof
