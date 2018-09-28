From: Joe Perches <joe@perches.com>
Subject: Bad MAINTAINERS pattern in section 'SAMSUNG EXYNOS TRUE RANDOM NUMBER GENERATOR (TRNG) DRIVER'
Date: Fri, 28 Sep 2018 15:03:29 -0700
Message-ID: <20180928220330.31325-1-joe@perches.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?=C5=81ukasz=20Stelmach?= <l.stelmach@samsung.com>, linux-samsung-soc@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

Please fix this defect appropriately.

linux-next MAINTAINERS section:

	12851	SAMSUNG EXYNOS TRUE RANDOM NUMBER GENERATOR (TRNG) DRIVER
	12852	M:	Łukasz Stelmach <l.stelmach@samsung.com>
	12853	L:	linux-samsung-soc@vger.kernel.org
	12854	S:	Maintained
	12855	F:	drivers/char/hw_random/exynos-trng.c
-->	12856	F:	Documentation/devicetree/bindings/rng/samsung,exynos5250-trng.txt

Commit that introduced this:

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

No commit with Documentation/devicetree/bindings/rng/samsung,exynos5250-trng.txt found
