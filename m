From: Kamil Konieczny <k.konieczny@partner.samsung.com>
Subject: [PATCH v3 0/3] add AES support for Exynos5433
Date: Thu, 24 Jan 2019 16:45:18 +0100
Message-ID: <20190124154521.13589-1-k.konieczny@partner.samsung.com>
References: <CGME20190124154538eucas1p17664bc2380e0d458b9ab33f79e55e810@eucas1p1.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: k.konieczny@partner.samsung.com
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Herbert Xu <herbert@gondor.apana.org.au>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, Vladimir Zapolskiy <vz@mleia.com>, Rob Herring <robh+dt@kernel.org>, Kukjin Kim <kgene@kernel.org>, linux-crypto@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Add slimSSS node to DT and crypto AES support for Exynos5433. Tested on
Exynos5433 board with crypto run-time self tests and with tcrypt with
command insmod tcrypt.ko mode=500 sec=1

Changes since v2:
- address Corentine Labbe note: add "const" to char* in declaration of
  struct samsung_aes_variant

Changes since v1:
- address Krzysztof Kozlowski review: add missing comma in struct
  definition, add goto for error code path, correct indentation,
  in documentation add that Exynos5433 has both slimSSS and SSS IPs.

Kamil Konieczny (3):
  arm64: dts: exynos: add SlimSSS for Exynos5433
  dt-bindings: crypto: document Exynos5433 SlimSSS
  crypto: s5p: add AES support for Exynos5433

 .../bindings/crypto/samsung-sss.txt           | 14 ++++--
 arch/arm64/boot/dts/exynos/exynos5433.dtsi    |  9 ++++
 drivers/crypto/s5p-sss.c                      | 50 +++++++++++++++++--
 3 files changed, 66 insertions(+), 7 deletions(-)

-- 
2.20.0
