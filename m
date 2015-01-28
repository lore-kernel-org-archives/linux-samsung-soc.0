From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [GIT PULL] clk/samsung updates for v3.20
Date: Wed, 28 Jan 2015 19:06:26 +0100
Message-ID: <54C92522.7050207@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Mike Turquette <mturquette@linaro.org>
Cc: Tomasz Figa <tomasz.figa@gmail.com>, Stephen Boyd <sboyd@codeaurora.org>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org


Hi Mike,

The following changes since commit 97bf6af1f928216fd6c5a66e8a57bfa95a659672:

  Linux 3.19-rc1 (2014-12-20 17:08:50 -0800)

are available in the git repository at:

  git://linuxtv.org/snawrocki/samsung.git tags/v3.20-exynos-clk

for you to fetch changes up to e64fb42da4c6c713cfc7cad607e97e0773fa41ff:

  clk: samsung: exynos4: Add divider clock id for memory bus frequency
(2015-01-28 15:51:17 +0100)

----------------------------------------------------------------
Exynos 3250, 4415 drivers cleanup by using common code
and addition of clock definitions for DVFS on Exynos4.

----------------------------------------------------------------

It's just couple mostly cleanup patches this time, we have a clk driver
for exynos5433 pending yet but I'll likely send it after the coming merge
window.

Chanwoo Choi (4):
      clk: samsung: Change the return value of samsung_cmu_register_one()
      clk: samsung: exynos3250: Use samsung_cmu_register_one() to simplify code
      clk: samsung: exynos4415: Use samsung_cmu_register_one() to simplify code
      clk: samsung: exynos4: Add divider clock id for memory bus frequency

 drivers/clk/samsung/clk-exynos3250.c |  217 ++++++++--------------------------
 drivers/clk/samsung/clk-exynos4.c    |   10 +-
 drivers/clk/samsung/clk-exynos4415.c |  216 ++++++++-------------------------
 drivers/clk/samsung/clk.c            |   13 +-
 drivers/clk/samsung/clk.h            |    3 +-
 include/dt-bindings/clock/exynos4.h  |    7 +-
 6 files changed, 118 insertions(+), 348 deletions(-)

--
Thanks
Sylwester
