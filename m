From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [GIT PULL 1/5] ARM: defconfig: exynos for v5.4
Date: Wed, 4 Sep 2019 22:38:17 +0200
Message-ID: <CAK8P3a0N1C7+_vpAhhmqVv9A+jd4bOXNEgPj_=fdPZTqy-93ng@mail.gmail.com>
References: <20190904175002.10487-1-krzk@kernel.org> <20190904175002.10487-2-krzk@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190904175002.10487-2-krzk@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Olof Johansson <olof@lixom.net>, arm-soc <arm@kernel.org>, SoC Team <soc@kernel.org>, Kukjin Kim <kgene@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, "moderated list:ARM/SAMSUNG EXYNOS ARM ARCHITECTURES" <linux-samsung-soc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

On Wed, Sep 4, 2019 at 7:50 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
> Samsung defconfig changes for v5.4
>
> 1. Enable AHCI platform driver on exynos defconfig for Exynos5250-based
>    Arndale board,
> 2. Make Max77802 PMIC regulator driver a built-in on multi_v7 defconfig
>    as it is essential early during boot.

Pulled into arm/defconfig, thanks!

     Arnd
