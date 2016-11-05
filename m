From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 2/4] ARM: dts: exynos: Add SCU device node to exynos4.dtsi
Date: Sat, 5 Nov 2016 17:41:37 +0200
Message-ID: <20161105154137.GB8183@kozik-lap>
References: <1478230764-13748-1-git-send-email-pankaj.dubey@samsung.com>
 <1478230764-13748-3-git-send-email-pankaj.dubey@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wm0-f67.google.com ([74.125.82.67]:36841 "EHLO
        mail-wm0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755511AbcKEPln (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 5 Nov 2016 11:41:43 -0400
Received: by mail-wm0-f67.google.com with SMTP id c17so8532482wmc.3
        for <linux-samsung-soc@vger.kernel.org>; Sat, 05 Nov 2016 08:41:42 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <1478230764-13748-3-git-send-email-pankaj.dubey@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Pankaj Dubey <pankaj.dubey@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, krzk@kernel.org, kgene@kernel.org, thomas.ab@samsung.com

On Fri, Nov 04, 2016 at 09:09:22AM +0530, Pankaj Dubey wrote:
> Exynos4 like other Cortex-A9 SoC's has a Snoop Control Unit(SCU)
> and its SFR are used during SMP boot and S2R. Add SCU node to the device tree.
> 
> Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>
> ---
>  arch/arm/boot/dts/exynos4.dtsi | 5 +++++
>  1 file changed, 5 insertions(+)
> 

Thanks, applied.

Best regards,
Krzysztof
