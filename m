From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v5] ARM: dts: exynos: add bcm4334 device node to trats2
Date: Tue, 14 Nov 2017 18:53:33 +0100
Message-ID: <20171114175333.kosfvgrsspkrv3p6@kozik-lap>
References: <20171113005203.GA15175@lineageos.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wm0-f67.google.com ([74.125.82.67]:56991 "EHLO
        mail-wm0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756203AbdKNRxi (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 14 Nov 2017 12:53:38 -0500
Received: by mail-wm0-f67.google.com with SMTP id z3so23820285wme.5
        for <linux-samsung-soc@vger.kernel.org>; Tue, 14 Nov 2017 09:53:37 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <20171113005203.GA15175@lineageos.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Simon Shields <simon@lineageos.org>
Cc: linux-samsung-soc@vger.kernel.org, Kukjin Kim <kgene@kernel.org>, linux-arm-kernel@lists.infradead.org, Marek Szyprowski <m.szyprowski@samsung.com>, Javier Martinez Canillas <javier@dowhile0.org>

On Mon, Nov 13, 2017 at 11:52:03AM +1100, Simon Shields wrote:
> This patch allows the bcm4334 to power on and enables
> wifi functionality on trats2.
> 
> Signed-off-by: Simon Shields <simon@lineageos.org>
> ---
>  arch/arm/boot/dts/exynos4412-trats2.dts | 27 +++++++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
>

Looks good, I'll take it after merge window. For my own reference:
Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof
