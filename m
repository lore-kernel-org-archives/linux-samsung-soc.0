From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 3/3] ARM: dts: exynos: Remove the display-timing and
 delay from rinato dts
Date: Fri, 9 Jun 2017 09:45:09 +0200
Message-ID: <20170609074509.GD4018@kozik-book>
References: <1496984354-5271-1-git-send-email-hoegeun.kwon@samsung.com>
 <CGME20170609045939epcas1p2e4b50c78978b8f14630ca29550c1cb34@epcas1p2.samsung.com>
 <1496984354-5271-4-git-send-email-hoegeun.kwon@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wm0-f66.google.com ([74.125.82.66]:34858 "EHLO
        mail-wm0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751638AbdFIHpN (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 9 Jun 2017 03:45:13 -0400
Content-Disposition: inline
In-Reply-To: <1496984354-5271-4-git-send-email-hoegeun.kwon@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Hoegeun Kwon <hoegeun.kwon@samsung.com>
Cc: thierry.reding@gmail.com, airlied@linux.ie, robh+dt@kernel.org, mark.rutland@arm.com, catalin.marinas@arm.com, will.deacon@arm.com, kgene@kernel.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, javier@osg.samsung.com, a.hajda@samsung.com, inki.dae@samsung.com

On Fri, Jun 09, 2017 at 01:59:14PM +0900, Hoegeun Kwon wrote:
> The display-timing and delay are included in the panel driver. So it
> should be removed in dts.
> 
> Signed-off-by: Hoegeun Kwon <hoegeun.kwon@samsung.com>
> ---
>  arch/arm/boot/dts/exynos3250-rinato.dts | 22 ----------------------
>  1 file changed, 22 deletions(-)

I understand this depends on merging in the panel driver so this will
have to wait till then. I'll take it when panel hits mainline (arm-soc
folks discourage recently cross-tree merges for DT).

Best regards,
Krzysztof
