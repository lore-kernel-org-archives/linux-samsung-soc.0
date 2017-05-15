From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH] arm64: dts: exynos: Remove the te-gpios property in the
 TM2 boards
Date: Mon, 15 May 2017 18:55:53 +0200
Message-ID: <20170515165553.dytsj4w6hlevkluu@kozik-lap>
References: <CGME20170425015437epcas5p43549d47e69519f43d89ba2de496ba451@epcas5p4.samsung.com>
 <1493085261-3488-1-git-send-email-hoegeun.kwon@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ua0-f195.google.com ([209.85.217.195]:36618 "EHLO
        mail-ua0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932514AbdEOQz4 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 15 May 2017 12:55:56 -0400
Content-Disposition: inline
In-Reply-To: <1493085261-3488-1-git-send-email-hoegeun.kwon@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Hoegeun Kwon <hoegeun.kwon@samsung.com>
Cc: robh+dt@kernel.org, mark.rutland@arm.com, catalin.marinas@arm.com, will.deacon@arm.com, kgene@kernel.org, javier@osg.samsung.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, a.hajda@samsung.com

On Tue, Apr 25, 2017 at 10:54:21AM +0900, Hoegeun Kwon wrote:
> The decon uses HW-TRIGGER, so TE interrupt is not necessary.
> Therefore, remove the te-gpios property in the TM2 dts.
> 
> Signed-off-by: Hoegeun Kwon <hoegeun.kwon@samsung.com>
> ---
>  arch/arm64/boot/dts/exynos/exynos5433-tm2.dts | 1 -
>  1 file changed, 1 deletion(-)
> 

Thanks, applied.

Best regards,
Krzysztof
