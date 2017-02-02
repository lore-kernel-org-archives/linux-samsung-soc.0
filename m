From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v3 2/2] arm64: dts: exynos: Add regulators for Vbus and
 Vbus-Boost
Date: Thu, 2 Feb 2017 19:54:46 +0200
Message-ID: <20170202175446.tn665r5u75pj2uin@kozik-lap>
References: <1484721173-30474-1-git-send-email-pankaj.dubey@samsung.com>
 <CGME20170118063009epcas5p27f555398c9f3f44d733e04a585e74139@epcas5p2.samsung.com>
 <1484721173-30474-3-git-send-email-pankaj.dubey@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wm0-f68.google.com ([74.125.82.68]:35093 "EHLO
        mail-wm0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752214AbdBBRzC (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 2 Feb 2017 12:55:02 -0500
Content-Disposition: inline
In-Reply-To: <1484721173-30474-3-git-send-email-pankaj.dubey@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Pankaj Dubey <pankaj.dubey@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, kgene@kernel.org, robh+dt@kernel.org, sanath@samsung.com, javier@osg.samsung.com, Vivek Gautam <gautamvivek1987@gmail.com>

On Wed, Jan 18, 2017 at 12:02:53PM +0530, Pankaj Dubey wrote:
> From: Vivek Gautam <gautamvivek1987@gmail.com>
> 
> Adding fixed voltage regulators for Vbus and Vbus-boost required
> by USB 3.0 DRD controller on Exynos7-espresso board.
> 
> Signed-off-by: Vivek Gautam <gautamvivek1987@gmail.com>
> Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>
> Reviewed-by: Javier Martinez Canillas <javier@osg.samsung.com>
> ---
>  arch/arm64/boot/dts/exynos/exynos7-espresso.dts | 45 +++++++++++++++++++++++++
>  1 file changed, 45 insertions(+)
> 

Thanks, applied with re-ordered nodes.

Best regards,
Krzysztof
