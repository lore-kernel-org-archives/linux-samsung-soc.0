From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 3/3] arm64: dts: exynos: Add support for S6E3HA2 edge
 panel device on TM2e board
Date: Fri, 14 Apr 2017 11:03:11 +0200
Message-ID: <20170414090311.ysmewlnlk2rtsslp@kozik-lap>
References: <1492147179-7824-1-git-send-email-hoegeun.kwon@samsung.com>
 <CGME20170414051959epcas1p3a246070b065129c4ffbf94736cde321a@epcas1p3.samsung.com>
 <1492147179-7824-4-git-send-email-hoegeun.kwon@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wm0-f68.google.com ([74.125.82.68]:33682 "EHLO
        mail-wm0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753349AbdDNJDQ (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 14 Apr 2017 05:03:16 -0400
Content-Disposition: inline
In-Reply-To: <1492147179-7824-4-git-send-email-hoegeun.kwon@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Hoegeun Kwon <hoegeun.kwon@samsung.com>
Cc: thierry.reding@gmail.com, airlied@linux.ie, robh+dt@kernel.org, mark.rutland@arm.com, catalin.marinas@arm.com, will.deacon@arm.com, kgene@kernel.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, javier@osg.samsung.com, a.hajda@samsung.com, andi.shyti@samsung.com

On Fri, Apr 14, 2017 at 02:19:39PM +0900, Hoegeun Kwon wrote:
> This patch add the panel device tree node for S6E3HA2 edge display
> controller to TM2e dts.
> 
> Signed-off-by: Hoegeun Kwon <hoegeun.kwon@samsung.com>
> ---
>  arch/arm64/boot/dts/exynos/exynos5433-tm2e.dts | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 

Looks good to me but I see that bindings are discussed still. I'll take
this when they settle.

Best regards,
Krzysztof
