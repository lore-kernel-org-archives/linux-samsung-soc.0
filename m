From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 1/9] ARM: EXYNOS: remove secondary startup initialization
 from smp_prepare_cpus
Date: Sun, 18 Nov 2018 15:13:30 +0100
Message-ID: <20181118141330.GA28873@kozik-lap>
References: <1542294698-17470-1-git-send-email-b.zolnierkie@samsung.com>
 <CGME20181115151211epcas2p4fdc719d354f2a732f70667ccbd8f1bae@epcas2p4.samsung.com>
 <1542294698-17470-2-git-send-email-b.zolnierkie@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1542294698-17470-2-git-send-email-b.zolnierkie@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Marek Szyprowski <m.szyprowski@samsung.com>, Kukjin Kim <kgene@kernel.org>, Markus Reichl <m.reichl@fivetechno.de>, Andrzej Hajda <a.hajda@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Javier Martinez Canillas <javierm@redhat.com>, Pankaj Dubey <pankaj.dubey@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On Thu, Nov 15, 2018 at 04:11:30PM +0100, Bartlomiej Zolnierkiewicz wrote:
> From: Pankaj Dubey <pankaj.dubey@samsung.com>
> 
> We are taking care of setting secondary cpu boot address in
> exynos_boot_secondary just before sending ipi to secondary CPUs,
> so we can safely remove this setting from smp_prepare_cpus.
> 
> Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>
> Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
> Signed-off-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
> ---
>  arch/arm/mach-exynos/platsmp.c | 26 --------------------------

Thanks, applied.

Best regards,
Krzysztof
