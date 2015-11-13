From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH v5 7/9] ARM: EXYNOS: split up exynos5420 SoC specific PMU
 data
Date: Fri, 13 Nov 2015 19:08:04 +0900
Message-ID: <5645B684.5000102@samsung.com>
References: <1447406983-27835-1-git-send-email-pankaj.dubey@samsung.com>
 <1447406983-27835-8-git-send-email-pankaj.dubey@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-pm-owner@vger.kernel.org>
In-reply-to: <1447406983-27835-8-git-send-email-pankaj.dubey@samsung.com>
Sender: linux-pm-owner@vger.kernel.org
To: Pankaj Dubey <pankaj.dubey@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org
Cc: kgene.kim@samsung.com, thomas.ab@samsung.com, amitdanielk@gmail.com, olof@lixom.net, khilman@linaro.org, arnd@arndb.de
List-Id: linux-samsung-soc@vger.kernel.org

On 13.11.2015 18:29, Pankaj Dubey wrote:
> This patch splits up mach-exynos/pmu.c file, and moves exynos5420,
> PMU configuration data and functions handing data into exynos5420
> SoC specific PMU file mach-exynos/exynos5420-pmu.c.
> 
> Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>
> ---
>  arch/arm/mach-exynos/Makefile         |   2 +-
>  arch/arm/mach-exynos/exynos-pmu.h     |   1 +
>  arch/arm/mach-exynos/exynos5420-pmu.c | 280 ++++++++++++++++++++++++++++++++++
>  arch/arm/mach-exynos/pmu.c            | 263 -------------------------------
>  4 files changed, 282 insertions(+), 264 deletions(-)
>  create mode 100644 arch/arm/mach-exynos/exynos5420-pmu.c
> 

Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

Best regards,
Krzysztof

