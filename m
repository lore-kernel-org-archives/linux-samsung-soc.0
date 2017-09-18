From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [RESEND PATCH v4 3/3] ARM: dts: exynos: Remove the
 display-timing and delay from rinato dts
Date: Mon, 18 Sep 2017 19:06:20 +0200
Message-ID: <20170918170620.zwxjxqnvnudw6m47@kozik-lap>
References: <CGME20170918025448epcas2p22a44b6c8efeac613e7e90c3c49b3eb8a@epcas2p2.samsung.com>
 <1505703264-6704-1-git-send-email-hoegeun.kwon@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wm0-f65.google.com ([74.125.82.65]:35085 "EHLO
        mail-wm0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932941AbdIRRGZ (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 18 Sep 2017 13:06:25 -0400
Content-Disposition: inline
In-Reply-To: <1505703264-6704-1-git-send-email-hoegeun.kwon@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Hoegeun Kwon <hoegeun.kwon@samsung.com>
Cc: thierry.reding@gmail.com, airlied@linux.ie, robh+dt@kernel.org, mark.rutland@arm.com, catalin.marinas@arm.com, will.deacon@arm.com, kgene@kernel.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, a.hajda@samsung.com, inki.dae@samsung.com

On Mon, Sep 18, 2017 at 11:54:24AM +0900, Hoegeun Kwon wrote:
>  The display-timing and delay are included in the panel driver. So it
>  should be removed in dts.
> 
> Signed-off-by: Hoegeun Kwon <hoegeun.kwon@samsung.com>
> ---
> 
> Hi Krzysztof,
> 
> This patch was rebased to the mainline (v4.14-rc1).
> 
> Best regards,
> Hoegeun
> 
>  arch/arm/boot/dts/exynos3250-rinato.dts | 22 ----------------------
>  1 file changed, 22 deletions(-)
> 

Thanks, applied.

Best regards,
Krzysztof
