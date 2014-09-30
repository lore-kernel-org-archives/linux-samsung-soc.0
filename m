From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v8 2/2] ARM: EXYNOS: Move PMU specific definitions from common.h
Date: Tue, 30 Sep 2014 12:38:58 +0200
Message-ID: <11948982.c37J1JPj8N@wuerfel>
References: <1412072481-22370-1-git-send-email-pankaj.dubey@samsung.com> <1412072481-22370-3-git-send-email-pankaj.dubey@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1412072481-22370-3-git-send-email-pankaj.dubey@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: Pankaj Dubey <pankaj.dubey@samsung.com>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, linux@arm.linux.org.uk, naushad@samsung.com, tomasz.figa@gmail.com, thomas.ab@samsung.com, vikas.sajjan@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

On Tuesday 30 September 2014 15:51:21 Pankaj Dubey wrote:
> 
> +static inline void pmu_raw_writel(u32 val, u32 offset)
> +{
> +       __raw_writel(val, pmu_base_addr + offset);
> +}
> +
> +static inline u32 pmu_raw_readl(u32 offset)
> +{
> +       return __raw_readl(pmu_base_addr + offset);
> +}
> +
> 

While you're at it, please convert these to use readl_relaxed() instead,
which is safe to use in drivers and works independent of CPU endianess.

	Arnd
