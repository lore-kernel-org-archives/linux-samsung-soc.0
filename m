From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH] ARM: Add workaround for I-Cache line size mismatch
 between CPU cores
Date: Wed, 29 May 2019 10:41:59 +0200
Message-ID: <CAJKOXPcgbSHDAnRc+9dtiuLOQ2Ah9mVrYvEdd33M_AAuC5Z5xg@mail.gmail.com>
References: <CGME20190528082903eucas1p1ef54fa6aee420bffa11be61d5efb4c46@eucas1p1.samsung.com>
 <20190528082846.21625-1-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190528082846.21625-1-m.szyprowski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Russell King <rmk+kernel@armlinux.org.uk>, Arnd Bergmann <arnd@arndb.de>, Mark Rutland <mark.rutland@arm.com>, Andre Przywara <andre.przywara@arm.com>, Will Deacon <will.deacon@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On Tue, 28 May 2019 at 10:29, Marek Szyprowski <m.szyprowski@samsung.com> wrote:
>
> Some big.LITTLE systems have I-Cache line size mismatch between
> LITTLE and big cores. This patch adds a workaround for proper I-Cache
> support on such systems. Without it, some class of the userspace code
> (typically self-modifying) might suffer from random SIGILL failures.
>
> Similar workaround already exists for ARM64 architecture. I has been
> added by commit 116c81f427ff ("arm64: Work around systems with mismatched
> cache line sizes").
>
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
> This workaround is needed on all supported Exynos big.LITTLE SoCs: 5420,
> 5422 and 5800.
>
> Resend reason: removed RFC tag as there are no comments, I will upload
> this patch to the patch tracking system

Acked-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof
