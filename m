From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [GIT PULL 1/2] ARM: dts: exynos: Second round for v4.21
Date: Thu, 20 Dec 2018 17:05:30 +0100
Message-ID: <CAK8P3a1DAGStWYN7_BS6t7ud9_at4nJLWjPtoyDphYXKAjnKXg@mail.gmail.com>
References: <20181218201003.12806-1-krzk@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181218201003.12806-1-krzk@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Olof Johansson <olof@lixom.net>, arm-soc <arm@kernel.org>, Kukjin Kim <kgene@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, "moderated list:ARM/SAMSUNG EXYNOS ARM ARCHITECTURES" <linux-samsung-soc@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

On Tue, Dec 18, 2018 at 9:10 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
> The following changes since commit 57b13b8b34002ce8f1d822ea05f0a84e5bc3a64a:
>
>   ARM: dts: exynos: remove display-port node from Arndale (2018-12-06 19:47:15 +0100)
>
> are available in the Git repository at:
>
>   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-dt-4.21-2
>
> for you to fetch changes up to 8ac686d7dfed721102860ff2571e6b9f529ae81a:
>
>   ARM: dts: exynos: Specify I2S assigned clocks in proper node (2018-12-13 21:56:07 +0100)
>
> ----------------------------------------------------------------
> Samsung DTS ARM changes for v4.21, part 2
>
> 1. Add missing CPUs in cooling maps for Odroid X2 (missed in previous
>    round of fixups).
> 2. Fix clock configuration in audio subsystem on Odroid XU3/XU4.

Pulled into next/dt, thanks!

       Arnd
