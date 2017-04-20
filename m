From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v3 3/3] arm64: dts: exynos: Add support for s6e3hf2 panel
 device on TM2e board
Date: Thu, 20 Apr 2017 18:01:59 +0200
Message-ID: <20170420160159.lkdy3oqntbvxd46w@kozik-lap>
References: <1492504836-19225-1-git-send-email-hoegeun.kwon@samsung.com>
 <CGME20170418084047epcas5p42535837ac327ec48730ca766176bf86d@epcas5p4.samsung.com>
 <1492504836-19225-4-git-send-email-hoegeun.kwon@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wr0-f196.google.com ([209.85.128.196]:32873 "EHLO
        mail-wr0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S946588AbdDTQCE (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 20 Apr 2017 12:02:04 -0400
Content-Disposition: inline
In-Reply-To: <1492504836-19225-4-git-send-email-hoegeun.kwon@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Hoegeun Kwon <hoegeun.kwon@samsung.com>
Cc: thierry.reding@gmail.com, airlied@linux.ie, robh+dt@kernel.org, mark.rutland@arm.com, catalin.marinas@arm.com, will.deacon@arm.com, kgene@kernel.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, javier@osg.samsung.com, a.hajda@samsung.com, inki.dae@samsung.com, andi.shyti@samsung.com

On Tue, Apr 18, 2017 at 05:40:36PM +0900, Hoegeun Kwon wrote:
> This patch add the panel device tree node for s6e3hf2 display
> controller to TM2e dts.
> 
> Signed-off-by: Hoegeun Kwon <hoegeun.kwon@samsung.com>
> Reviewed-by: Andrzej Hajda <a.hajda@samsung.com>
> ---
>  arch/arm64/boot/dts/exynos/exynos5433-tm2e.dts | 11 +++++++++++
>  1 file changed, 11 insertions(+)

Thanks, applied.

Best regards,
Krzysztof
