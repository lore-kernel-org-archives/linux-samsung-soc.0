From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [PATCH 1/2] soc: samsung: pmu: Remove unused and duplicated defines
Date: Thu, 26 Jan 2017 08:15:42 +0100
Message-ID: <20251f7e-310a-223e-3a35-7df5bc30352a@samsung.com>
References: <CGME20170125193513epcas4p3630dd48974bedbe07a74a21d11500fe1@epcas4p3.samsung.com>
 <20170125193452.31768-1-krzk@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <20170125193452.31768-1-krzk@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>, Kukjin Kim <kgene@kernel.org>, Javier Martinez Canillas <javier@osg.samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Hi Krzysztof,


On 2017-01-25 20:34, Krzysztof Kozlowski wrote:
> The exynos-regs-pmu.h was never a complete list of PMU registers.  It
> contained a lot of holes for registers which are not used.  However, a
> lot of unused defines came with porting the code from vendor kernel.
>
> Few of defines were also duplicated.
>
> Remove them so the file will be slightly smaller.
>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

Thanks for the cleanup!

If you are touching this, you may also want to unify multiple headers for
the Exynos PMU regs:
include/linux/soc/samsung/exynos-regs-pmu.h
linux/mfd/syscon/exynos4-pmu.h
linux/mfd/syscon/exynos5-pmu.h

 > [...]

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland
