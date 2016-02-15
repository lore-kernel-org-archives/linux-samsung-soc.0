From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: [GIT PULL 0/7] ARM: EXYNOS: Pull request for v4.6
Date: Mon, 15 Feb 2016 09:33:59 +0900
Message-ID: <1455496446-23779-1-git-send-email-k.kozlowski@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, Kevin Hilman <khilman@kernel.org>, arm@kernel.org
Cc: Kukjin Kim <kgene@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Pankaj Dubey <pankaj.dubey@samsung.com>, Pavel Fedin <p.fedin@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Javier Martinez Canillas <javier@osg.samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Hi Arnd, Kevin and Olof,

This time pull request directly from me (agreed with Kukjin).


Stuff for v4.6 with some dependencies, split into
separate tags. The need for dependency is explained both
in merge-commit and in description of a tag which is using
the dependency.

The order goes like (but of course dependencies
could be pulled all at once at beginning):
1. tags/samsung-fixes-non-critical-4.6
2. tags/samsung-dt-srom-4.6 (DT changs needed by soc)
3. tags/samsung-drivers-soc-srom-pmu-4.6
4. tags/samsung-soc-4.6
5. tags/samsung-drivers-4.6
6. tags/samsung-dt-4.6
7. tags/samsung-defconfig-4.6 (this will also pull tag from RTC tree)

Please share your comments or just pull.


Kind regards,
Krzysztof
