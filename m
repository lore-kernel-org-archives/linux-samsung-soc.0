From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v4 1/3] arm64: dts: exynos: add DECON_TV node
Date: Wed, 11 Jan 2017 18:21:12 +0200
Message-ID: <20170111162112.nkvmdwscq6zsxclq@kozik-lap>
References: <20170110190916.k3tek4zuvhggbuc6@kozik-lap>
 <CGME20170111083153eucas1p2b11e7b64f976a21f59c141bf7b06fd84@eucas1p2.samsung.com>
 <1484123500-20488-1-git-send-email-a.hajda@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wj0-f193.google.com ([209.85.210.193]:34832 "EHLO
        mail-wj0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752180AbdAKQVS (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 11 Jan 2017 11:21:18 -0500
Content-Disposition: inline
In-Reply-To: <1484123500-20488-1-git-send-email-a.hajda@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Andrzej Hajda <a.hajda@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Inki Dae <inki.dae@samsung.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Javier Martinez Canillas <javier@osg.samsung.com>, devicetree@vger.kernel.org, Andi Shyti <andi.shyti@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>

On Wed, Jan 11, 2017 at 09:31:38AM +0100, Andrzej Hajda wrote:
> DECON_TV is 2nd display controller on Exynos5433, used in HDMI path
> or 2nd DSI path.
> 
> Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
> Reviewed-by: Javier Martinez Canillas <javier@osg.samsung.com>
> Reviewed-by: Chanwoo Choi <cw00.choi@samsung.com>
> Tested-by: Hoegeun Kwon <hoegeun.kwon@samsung.com>
> ---
> v4:
>   - changed prefix
>   - rebased on '68cb4b3 Merge branch 'next/dt64' into for-next'
> ---
>  arch/arm64/boot/dts/exynos/exynos5433.dtsi | 43 ++++++++++++++++++++++++++++++
>  1 file changed, 43 insertions(+)

Thanks, applied.

Best regards,
Krzysztof
