From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v4 2/3] arm64: dts: exynos: add HDMI node
Date: Wed, 11 Jan 2017 18:21:32 +0200
Message-ID: <20170111162132.ipdszruoyr5pffgs@kozik-lap>
References: <20170110190916.k3tek4zuvhggbuc6@kozik-lap>
 <1484123500-20488-1-git-send-email-a.hajda@samsung.com>
 <CGME20170111083155eucas1p21c30b8fb055ebe9415683df5f7e119e1@eucas1p2.samsung.com>
 <1484123500-20488-2-git-send-email-a.hajda@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wm0-f66.google.com ([74.125.82.66]:35038 "EHLO
        mail-wm0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1764686AbdAKQVh (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 11 Jan 2017 11:21:37 -0500
Content-Disposition: inline
In-Reply-To: <1484123500-20488-2-git-send-email-a.hajda@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Andrzej Hajda <a.hajda@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Inki Dae <inki.dae@samsung.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Javier Martinez Canillas <javier@osg.samsung.com>, devicetree@vger.kernel.org, Andi Shyti <andi.shyti@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>

On Wed, Jan 11, 2017 at 09:31:39AM +0100, Andrzej Hajda wrote:
> HDMI converts RGB/I80 signal from DECON_TV to HDMI/TMDS video stream.
> 
> Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
> Reviewed-by: Javier Martinez Canillas <javier@osg.samsung.com>
> Reviewed-by: Chanwoo Choi <cw00.choi@samsung.com>
> Tested-by: Hoegeun Kwon <hoegeun.kwon@samsung.com>
> ---
>  arch/arm64/boot/dts/exynos/exynos5433.dtsi | 29 +++++++++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
> 

Thanks, applied.

Best regards,
Krzysztof
