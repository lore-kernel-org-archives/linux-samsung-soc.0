From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [GIT PULL 1/4] soc: samsung: Driver changes for v4.17
Date: Wed, 7 Mar 2018 16:53:06 +0100
Message-ID: <CAK8P3a3_izoJZi87y0hk+MD_6HL1EyR=acJtDGh3LDEYvDHaHg@mail.gmail.com>
References: <20180306180124.8987-1-krzk@kernel.org> <20180306180124.8987-2-krzk@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180306180124.8987-2-krzk@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Olof Johansson <olof@lixom.net>, arm-soc <arm@kernel.org>, Kukjin Kim <kgene@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, "moderated list:ARM/SAMSUNG EXYNOS ARM ARCHITECTURES" <linux-samsung-soc@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

On Tue, Mar 6, 2018 at 7:01 PM, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> The following changes since commit 7928b2cbe55b2a410a0f5c1f154610059c57b1b2:
>
>   Linux 4.16-rc1 (2018-02-11 15:04:29 -0800)
>
> are available in the git repository at:
>
>   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-drivers-4.17
>
> for you to fetch changes up to 7353c54620732797dcc3b4b1fc6f3cc0c0d9b6ef:
>
>   soc: samsung: pmu: Populate children syscon nodes (2018-02-13 18:47:25 +0100)
>
> ----------------------------------------------------------------
> Samsung soc drivers changes for v4.17
>
> 1. Add SPDX license identifiers.
> 2. Populate children syscon nodes in PMU driver to properly model HW in
>    DeviceTree.

Pulled into next/drivers, thanks!

          Arnd
