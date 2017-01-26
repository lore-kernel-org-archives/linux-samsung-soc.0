From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 1/2] soc: samsung: pmu: Remove unused and duplicated
 defines
Date: Thu, 26 Jan 2017 21:38:46 +0200
Message-ID: <20170126193846.hbo6a5yvbp3opfs4@kozik-lap>
References: <CGME20170125193513epcas4p3630dd48974bedbe07a74a21d11500fe1@epcas4p3.samsung.com>
 <20170125193452.31768-1-krzk@kernel.org>
 <20251f7e-310a-223e-3a35-7df5bc30352a@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wm0-f65.google.com ([74.125.82.65]:33618 "EHLO
        mail-wm0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753324AbdAZTjM (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 26 Jan 2017 14:39:12 -0500
Content-Disposition: inline
In-Reply-To: <20251f7e-310a-223e-3a35-7df5bc30352a@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Kukjin Kim <kgene@kernel.org>, Javier Martinez Canillas <javier@osg.samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Sylwester Nawrocki <s.nawrocki@samsung.com>

On Thu, Jan 26, 2017 at 08:15:42AM +0100, Marek Szyprowski wrote:
> Hi Krzysztof,
> 
> 
> On 2017-01-25 20:34, Krzysztof Kozlowski wrote:
> > The exynos-regs-pmu.h was never a complete list of PMU registers.  It
> > contained a lot of holes for registers which are not used.  However, a
> > lot of unused defines came with porting the code from vendor kernel.
> > 
> > Few of defines were also duplicated.
> > 
> > Remove them so the file will be slightly smaller.
> > 
> > Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> 
> Thanks for the cleanup!
> 
> If you are touching this, you may also want to unify multiple headers for
> the Exynos PMU regs:
> include/linux/soc/samsung/exynos-regs-pmu.h
> linux/mfd/syscon/exynos4-pmu.h
> linux/mfd/syscon/exynos5-pmu.h
>
Sure, I'll take a look at these as well. Thanks for a hint.

Best regards,
Krzysztof
