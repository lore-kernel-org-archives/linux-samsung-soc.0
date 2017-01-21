From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v2 1/3] arm64: dts: exynos: Fix drive strength of sd0_xxx
 pin definitions
Date: Sat, 21 Jan 2017 18:26:49 +0200
Message-ID: <20170121162649.y4dntatnz7pcto2k@kozik-lap>
References: <1484885997-21004-1-git-send-email-pankaj.dubey@samsung.com>
 <CGME20170120041718epcas5p18cfaaaf19279744af1522fee5b739c3f@epcas5p1.samsung.com>
 <1484885997-21004-2-git-send-email-pankaj.dubey@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wm0-f67.google.com ([74.125.82.67]:35278 "EHLO
        mail-wm0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750826AbdAUQ1b (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 21 Jan 2017 11:27:31 -0500
Content-Disposition: inline
In-Reply-To: <1484885997-21004-2-git-send-email-pankaj.dubey@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Pankaj Dubey <pankaj.dubey@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, kgene@kernel.org, robh+dt@kernel.org, sanath@samsung.com, javier@osg.samsung.com, s.nawrocki@samsung.com

On Fri, Jan 20, 2017 at 09:49:55AM +0530, Pankaj Dubey wrote:
> As per Exynos7 datasheet FSYS1 pinctrl block does not support drive
> strength value of 0x3. This patch fixes this and update the correct
> drive strength for sd0_xxx pin definitions.
> 
> Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>
> Reviewed-by: Alim Akhtar <alim.akhtar@samsung.com>
> ---
>  arch/arm64/boot/dts/exynos/exynos7-pinctrl.dtsi | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
> 

Thanks, applied.

Best regards,
Krzysztof
