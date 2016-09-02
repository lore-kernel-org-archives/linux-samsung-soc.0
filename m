From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [GIT PULL 1/4] ARM: exynos: SoC/Mach for v4.9
Date: Fri, 02 Sep 2016 18:26:42 +0200
Message-ID: <5635206.ooNAZCeQOe@wuerfel>
References: <1472548739-20050-1-git-send-email-k.kozlowski@samsung.com> <1472548739-20050-5-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1472548739-20050-5-git-send-email-k.kozlowski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Olof Johansson <olof@lixom.net>, Kevin Hilman <khilman@kernel.org>, arm@kernel.org, Kukjin Kim <kgene@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

On Tuesday, August 30, 2016 11:18:59 AM CEST Krzysztof Kozlowski wrote:
> Samsung mach/soc update for v4.9:
> 1. Fix for DMA on S3C24xx. This was probably broken for long time, nobody runs
>    this code... till now.

Good to know. This reminds me that the s3c24xx DMA code is one of those
that need to be converted to dma_slave_map at some point. Maybe if someone
is now running that code, they could give that a try as well?

It shouldn't be hard to convert, let me know if you need more information.

> 2. After fixes from Matthew Leach and Ben Dooks, most of our mach code
>    and drivers is now endian-safe. Mark the platform as supporting big endian.
> 3. Cleanups.
> 
> 

Pulled into next/soc, thanks!

	Arnd
