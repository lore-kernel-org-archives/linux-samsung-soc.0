From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v4 3/3] arm64: dts: exynos: enable HDMI/TV path
Date: Wed, 11 Jan 2017 18:21:50 +0200
Message-ID: <20170111162150.3rwilj5v7nkok4cv@kozik-lap>
References: <20170110190916.k3tek4zuvhggbuc6@kozik-lap>
 <1484123500-20488-1-git-send-email-a.hajda@samsung.com>
 <CGME20170111083155eucas1p28c9c49a619a31d33c2666f58bf22e7c0@eucas1p2.samsung.com>
 <1484123500-20488-3-git-send-email-a.hajda@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wj0-f195.google.com ([209.85.210.195]:35051 "EHLO
        mail-wj0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1764200AbdAKQVz (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 11 Jan 2017 11:21:55 -0500
Content-Disposition: inline
In-Reply-To: <1484123500-20488-3-git-send-email-a.hajda@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Andrzej Hajda <a.hajda@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Inki Dae <inki.dae@samsung.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Javier Martinez Canillas <javier@osg.samsung.com>, devicetree@vger.kernel.org, Andi Shyti <andi.shyti@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>

On Wed, Jan 11, 2017 at 09:31:40AM +0100, Andrzej Hajda wrote:
> TV path consist of following interconnected components:
> - DECON_TV - display controller,
> - HDMI - video signal converter RGB / HDMI,
> - MHL - video signal converter HDMI / MHL,
> - DDC - i2c slave device for EDID reading (on hsi2c_11 bus).
> 
> Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
> Reviewed-by: Javier Martinez Canillas <javier@osg.samsung.com>
> Reviewed-by: Chanwoo Choi <cw00.choi@samsung.com>
> Tested-by: Hoegeun Kwon <hoegeun.kwon@samsung.com>
> ---
>  .../boot/dts/exynos/exynos5433-tm2-common.dtsi     | 69 ++++++++++++++++++++++
>  1 file changed, 69 insertions(+)
> 

Thanks, applied.

Best regards,
Krzysztof
