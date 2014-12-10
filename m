From: Kevin Hilman <khilman@kernel.org>
Subject: Re: [PATCH v4 0/3] Fix Arndale Octa/Peach Pi boot on Audio subsystem clocks
Date: Wed, 10 Dec 2014 08:17:26 -0800
Message-ID: <7h4mt3pjhl.fsf@deeprootsystems.com>
References: <1417777254-26579-1-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1417777254-26579-1-git-send-email-k.kozlowski@samsung.com>
	(Krzysztof Kozlowski's message of "Fri, 05 Dec 2014 12:00:51 +0100")
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Mike Turquette <mturquette@linaro.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Kukjin Kim <kgene@kernel.org>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, Vivek Gautam <gautam.vivek@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Hi Krzysztof,

Krzysztof Kozlowski <k.kozlowski@samsung.com> writes:

> Changes since v3
> ================
> 1. Patch 1/3: Fix issues pointed by Sylwester.
> 2. Add Javier's tested-by [1]

I tested this series on top of next-20141210 (exynos_defconfig and
multi_v7_defconfig) on exynos5800-peach-pi and exynos5420-arndale-octa
it fixes the boot hangs I was seeing with linux-next on those platforms.

Feel free to add:

Tested-by: Kevin Hilman <khilman@linaro.org>

Kevin
