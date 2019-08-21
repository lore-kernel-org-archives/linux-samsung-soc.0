From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [GIT PULL 2/3] ARM: samsung: mach for v5.4
Date: Wed, 21 Aug 2019 09:52:27 +0200
Message-ID: <CAJKOXPfdvzvomUfmxhGf0qjEQH3K8TADCneo9SM6m50k4b=Gyw@mail.gmail.com>
References: <20190816163042.6604-1-krzk@kernel.org> <20190816163042.6604-3-krzk@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190816163042.6604-3-krzk@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, arm@kernel.org, soc@kernel.org
Cc: Kukjin Kim <kgene@kernel.org>, linux-arm-kernel@lists.infradead.org, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

On Fri, 16 Aug 2019 at 18:30, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> The following changes since commit 5f9e832c137075045d15cd6899ab0505cfb2ca4b:
>
>   Linus 5.3-rc1 (2019-07-21 14:05:38 -0700)
>
> are available in the Git repository at:
>
>   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-soc-5.4
>
> for you to fetch changes up to 1fa70c7f49132513fb0da4afa7643395eedc7d35:
>
>   ARM: exynos: Enable exynos-chipid driver (2019-08-15 20:29:58 +0200)
>
> ----------------------------------------------------------------
> Samsung mach/soc changes for v5.4
>
> 1. Minor fixup in plat code (S3C platforms),
> 2. Enable exynos-chipid driver to provide SoC related information.
>
> ----------------------------------------------------------------
> Linus Walleij (1):
>       ARM: samsung: Include GPIO driver header
>
> Pankaj Dubey (1):
>       ARM: exynos: Enable exynos-chipid driver

This last patch should be dropped so I will rework the pull request
and send later v2. Please ignore it for now.

Best regards,
Krzysztof
