From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: [GIT PULL 6/9] ARM: EXYNOS: clk: Another clock dependency, ARMv7,
 for v4.5
Date: Wed, 02 Dec 2015 10:39:43 +0900
Message-ID: <1449020386-20250-7-git-send-email-k.kozlowski@samsung.com>
References: <1449020386-20250-1-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-reply-to: <1449020386-20250-1-git-send-email-k.kozlowski@samsung.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-samsung-soc@vger.kernel.org, arm@kernel.org, Kukjin Kim <kgene@kernel.org>
Cc: devicetree@vger.kernel.org, k.kozlowski@samsung.com, Kevin Hilman <khilman@linaro.org>, Arnd Bergmann <arnd@arndb.de>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, linux-kernel@vger.kernel.org, Olof Johansson <olof@lixom.net>, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

Hi Kukjin,

This is also clock dependency. I put it in separate tag in case clock
folks want to pull it also.

Best regards,
Krzysztof


The following changes since commit 8005c49d9aea74d382f474ce11afbbc7d7130bec:

  Linux 4.4-rc1 (2015-11-15 17:00:27 -0800)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-clk-exynos4-4.5

for you to fetch changes up to 94af7a3c310f5877dc6f756179b92f24f89a9b08:

  clk: samsung: exynos4: Add SSS gate clock (2015-11-18 22:02:02 +0900)

----------------------------------------------------------------
Add a Security SubSystem (SSS) clock for Exynos4, needed by exynos-rng
driver (Pseudo Random Number Generator).

----------------------------------------------------------------
Krzysztof Kozlowski (1):
      clk: samsung: exynos4: Add SSS gate clock

 drivers/clk/samsung/clk-exynos4.c   | 1 +
 include/dt-bindings/clock/exynos4.h | 1 +
 2 files changed, 2 insertions(+)
