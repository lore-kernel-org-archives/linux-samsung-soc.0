From: Kamil Konieczny <k.konieczny@partner.samsung.com>
Subject: [PATCH v1 0/3] add AES support for Exynos5433
Date: Tue, 22 Jan 2019 16:25:50 +0100
Message-ID: <20190122152553.1537-1-k.konieczny@partner.samsung.com>
References: <CGME20190122152607eucas1p2c58a7814bb9ab72cc46d5a84eb1962a4@eucas1p2.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: k.konieczny@partner.samsung.com
Cc: "David S. Miller" <davem@davemloft.net>, devicetree@vger.kernel.org, Herbert Xu <herbert@gondor.apana.org.au>, Krzysztof Kozlowski <krzk@kernel.org>, Kukjin Kim <kgene@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Vladimir Zapolskiy <vz@mleia.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Add slimSSS node to DT and crypto AES support for Exynos5433. Tested on
Exynos5433 board with crypto run-time self tests and with tcrypt with
command insmod tcrypt.ko mode=500 sec=1

Kamil Konieczny (3):
  arm64: dts: exynos: add SlimSSS for Exynos5433
  dt-bindings: crypto: document Exynos5433 SlimSSS
  crypto: s5p: add AES support for Exynos5433

 .../bindings/crypto/samsung-sss.txt           | 13 +++--
 arch/arm64/boot/dts/exynos/exynos5433.dtsi    |  9 ++++
 drivers/crypto/s5p-sss.c                      | 50 +++++++++++++++++--
 3 files changed, 65 insertions(+), 7 deletions(-)

-- 
2.20.0
