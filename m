From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [GIT PULL 2/3] arm64: dts: exynos: DTS for v4.16
Date: Thu, 21 Dec 2017 17:50:52 +0100
Message-ID: <CAK8P3a2obLRFK8cZ3B1M1qCzDQq=-7ux4_Tu4kG+ksW6NCieYg@mail.gmail.com>
References: <20171220173643.5840-1-krzk@kernel.org> <20171220173643.5840-4-krzk@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171220173643.5840-4-krzk@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Olof Johansson <olof@lixom.net>, arm-soc <arm@kernel.org>, Kukjin Kim <kgene@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, "moderated list:ARM/SAMSUNG EXYNOS ARM ARCHITECTURES" <linux-samsung-soc@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

On Wed, Dec 20, 2017 at 6:36 PM, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> Samsung DTS ARM64 changes for v4.16
>
> 1. Add CPU perf counters to Exynos5433.
> 2. Add missing power domains to Exynos5433.
> 3. Add NFC chip to Exynos5433 TM2/TM2E.
> 4. Fix obscure bugs on I2C transfers to MHL chip on TM2/TM2E.

Pulled into next/dt, thanks!

One question: do you know if anyone is working on support for the newer
Exynos chips, or the Nexell S5P6818 series? It seems odd that none of
the chips from the past three years are supported yet.

     Arnd
