From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [GIT PULL 2/2] ARM: dts: samsung: exynos and s5pv210 for v5.1
Date: Fri, 15 Feb 2019 14:49:16 +0100
Message-ID: <CAK8P3a0CXTc0tAPXcA31EtdFWEANj5c1RbzfkQJMp3RmKg0nWQ@mail.gmail.com>
References: <20190201191720.20464-1-krzk@kernel.org> <20190201191720.20464-2-krzk@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190201191720.20464-2-krzk@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Olof Johansson <olof@lixom.net>, arm-soc <arm@kernel.org>, Kukjin Kim <kgene@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, "moderated list:ARM/SAMSUNG EXYNOS ARM ARCHITECTURES" <linux-samsung-soc@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

On Fri, Feb 1, 2019 at 8:17 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
> Samsung DTS ARM changes for v5.1
>
> 1. Extend support for Aries family of mobile devices (e.g. Samsung
>    Galaxy S) based on S5Pv210 SoC: DRM Rotator, FIMD, PWM vibrator,
>    power off, touchscreen, Broadcom BCM4329 Bluetooth and cpufreq.
> 2. Remove hardcoded bootargs on Galaxy S family (proper support in
>    U-Boot).
> 3. Fix minor DTC warnings.
> 4. Fix Exynos4412 Odroid X2/U3 conflicting eMMC GPIO settings and regulator
>    properties.
> 5. Fix the eMMC RTSN pin breaking proper reboot on X2.


Pulled into arm/dt, thanks!

     Arnd
