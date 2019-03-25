From: Joe Perches <joe@perches.com>
Subject: Bad file pattern in MAINTAINERS section 'SAMSUNG EXYNOS TRUE RANDOM NUMBER GENERATOR (TRNG) DRIVER'
Date: Mon, 25 Mar 2019 14:27:51 -0700
Message-ID: <20190325212751.27532-1-joe@perches.com>
References: <7cd8d12f59bcacd18a78f599b46dac555f7f16c0.camel@perches.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <7cd8d12f59bcacd18a78f599b46dac555f7f16c0.camel@perches.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?=C5=81ukasz=20Stelmach?= <l.stelmach@samsung.com>, linux-samsung-soc@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, Philippe Ombredanne <pombredanne@nexb.com>, Herbert Xu <herbert@gondor.apana.org.au>
List-Id: linux-samsung-soc@vger.kernel.org

A file pattern line in this section of the MAINTAINERS file in linux-next
does not have a match in the linux source files.

This could occur because a matching filename was never added, was deleted
or renamed in some other commit.

The commits that added and if found renamed or removed the file pattern
are shown below.

Please fix this defect appropriately.

1: ---------------------------------------------------------------------------

linux-next MAINTAINERS section:

	13589	SAMSUNG EXYNOS TRUE RANDOM NUMBER GENERATOR (TRNG) DRIVER
	13590	M:	Łukasz Stelmach <l.stelmach@samsung.com>
	13591	L:	linux-samsung-soc@vger.kernel.org
	13592	S:	Maintained
	13593	F:	drivers/char/hw_random/exynos-trng.c
-->	13594	F:	Documentation/devicetree/bindings/rng/samsung,exynos5250-trng.txt

2: ---------------------------------------------------------------------------

The most recent commit that added or modified file pattern 'Documentation/devicetree/bindings/rng/samsung,exynos5250-trng.txt':

commit 6cd225cc5d8a6526b2bea41955882be55d4f109e
Author: Łukasz Stelmach <l.stelmach@samsung.com>
Date:   Fri Dec 22 17:48:35 2017 +0100

    hwrng: exynos - add Samsung Exynos True RNG driver
    
    Add support for True Random Number Generator found in Samsung Exynos
    5250+ SoCs.
    
    Signed-off-by: Łukasz Stelmach <l.stelmach@samsung.com>
    Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
    Acked-by: Philippe Ombredanne <pombredanne@nexb.com>
    Signed-off-by: Herbert Xu <herbert@gondor.apana.org.au>

 MAINTAINERS                          |   7 ++
 drivers/char/hw_random/Kconfig       |  12 ++
 drivers/char/hw_random/Makefile      |   1 +
 drivers/char/hw_random/exynos-trng.c | 237 +++++++++++++++++++++++++++++++++++
 4 files changed, 257 insertions(+)

3: ---------------------------------------------------------------------------

No commit with file pattern 'Documentation/devicetree/bindings/rng/samsung,exynos5250-trng.txt' was found
