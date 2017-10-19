From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [GIT PULL 3/4] ARM: dts: exynos: Pull for v4.15
Date: Fri, 20 Oct 2017 00:25:39 +0200
Message-ID: <CAK8P3a12VouMLOJywYKec2m+9uW0sDr+VLQQ4Xz0dCTcK1=XKg@mail.gmail.com>
References: <20171015074825.11338-1-krzk@kernel.org> <20171015074825.11338-4-krzk@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171015074825.11338-4-krzk@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Olof Johansson <olof@lixom.net>, arm-soc <arm@kernel.org>, Kukjin Kim <kgene@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, "moderated list:ARM/SAMSUNG EXYNOS ARM ARCHITECTURES" <linux-samsung-soc@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

On Sun, Oct 15, 2017 at 9:48 AM, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> ----------------------------------------------------------------
> Samsung DTS ARM changes for 4.15
>
> 1. Add new board: Hardkernel Odroid HC1.
> 2. Fix incomplete Odroid-XU3/4 thermal-zones definition leading to
>    possible overheat if first pair of A7+A15 cores is idle but rest of
>    CPUs are busy.
> 3. Add capacity-dmips-mhz properties for CPUs of octa-core SoCs.
> 4. Add power button to Odroid XU3/4.
> 5. Improvements in Gscaler, HDMI and Mixer blocks on Exynos5.
> 6. Add suspend quirk to DWC3 USB controller to fix enumeration of
>    SuperSpeed devices on Odroid XU4.
> 7. Add HDMI and MHL to Trats2.
> 8. Cleanups (redundant properties and nodes).

Pulled into next/dt, thanks!
