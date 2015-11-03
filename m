From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH v3 4/7] ARCH: EXYNOS: split up exynos4 SoC specific PMU data
Date: Tue, 03 Nov 2015 10:56:02 +0900
Message-ID: <56381432.1080908@samsung.com>
References: <1445864143-25695-1-git-send-email-pankaj.dubey@samsung.com>
 <1445864143-25695-5-git-send-email-pankaj.dubey@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1445864143-25695-5-git-send-email-pankaj.dubey@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Pankaj Dubey <pankaj.dubey@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: kgene.kim@samsung.com, thomas.ab@samsung.com, amitdanielk@gmail.com
List-Id: linux-samsung-soc@vger.kernel.org

On 26.10.2015 21:55, Pankaj Dubey wrote:
> This patch splits up mach-exynos/pmu.c file, and moves exynos4210,
> exynos4412 and exynos4212 PMU configuration data and functions handing
> data into a common exynos4 SoC specific PMU file mach-exynos/exynos4-pmu.c.
> 
> Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>
> ---
>  arch/arm/mach-exynos/Makefile      |   2 +-
>  arch/arm/mach-exynos/exynos-pmu.h  |   3 +
>  arch/arm/mach-exynos/exynos4-pmu.c | 223 +++++++++++++++++++++++++++++++++++++
>  arch/arm/mach-exynos/pmu.c         | 207 ----------------------------------
>  4 files changed, 227 insertions(+), 208 deletions(-)
>  create mode 100644 arch/arm/mach-exynos/exynos4-pmu.c
> 


Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

Best regards,
Krzysztof
