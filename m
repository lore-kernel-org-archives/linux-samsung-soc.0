From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH v6 4/4] ARM: EXYNOS: Move PMU specific definitions from
 common.h
Date: Tue, 08 Jul 2014 16:31:55 +0200
Message-ID: <53BC00DB.7020308@samsung.com>
References: <1404710376-16448-1-git-send-email-pankaj.dubey@samsung.com>
 <1404710376-16448-5-git-send-email-pankaj.dubey@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1404710376-16448-5-git-send-email-pankaj.dubey@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Pankaj Dubey <pankaj.dubey@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: kgene.kim@samsung.com, linux@arm.linux.org.uk, vikas.sajjan@samsung.com, joshi@samsung.com, naushad@samsung.com, thomas.ab@samsung.com, chow.kim@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

On 07.07.2014 07:19, Pankaj Dubey wrote:
> This patch moves PMU specific definitions into a new file
> as exynos-pmu.h.
> This will help in reducing dependency of common.h in pmu.c.
> 
> Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>
> ---
>  arch/arm/mach-exynos/common.h     |   17 -----------------
>  arch/arm/mach-exynos/exynos-pmu.h |   24 ++++++++++++++++++++++++
>  arch/arm/mach-exynos/pm.c         |    1 +
>  arch/arm/mach-exynos/pmu.c        |   10 +++++++++-
>  4 files changed, 34 insertions(+), 18 deletions(-)
>  create mode 100644 arch/arm/mach-exynos/exynos-pmu.h
> 

Reviewed-by: Tomasz Figa <t.figa@samsung.com>

--
Best regards,
Tomasz
