From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH] regulator: core: Skip balancing of the enabled regulators
 in regulator_enable()
Date: Tue,  8 Oct 2019 12:17:09 +0200
Message-ID: <20191008101709.13827-1-m.szyprowski@samsung.com>
References: <CGME20191008101720eucas1p2e0d1bca6e696848bf689067e05620679@eucas1p2.samsung.com>
Content-Type: text/plain; charset="utf-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>, Dmitry Osipenko <digetx@gmail.com>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>, Lucas Stach <l.stach@pengutronix.de>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, linux-samsung-soc@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

Commit f8702f9e4aa7 ("regulator: core: Use ww_mutex for regulators
locking"), regardless of the subject, added additional call to
regulator_balance_voltage() during regulator_enable(). This is basically
a good idea, however it causes some issue for the regulators which are
already enabled at boot and are critical for system operation (for example
provides supply to the CPU).

CPUfreq or other drivers typically call regulator_enable() on such
regulators during their probe, although the regulators are already enabled
by bootloader. The mentioned patch however added a call to
regulator_balance_voltage(), what in case of system boot, where no
additional requirements are set yet, typically causes to limit the voltage
to the minimal value defined at regulator constraints. This causes a crash
of the system when voltage on the CPU regulator is set to the lowest
possible value without adjusting the operation frequency. Fix this by
adding a check if regulator is already enabled - if so, then skip the
balancing procedure. The voltage will be balanced later anyway once the
required voltage value is requested.

Fixes: f8702f9e4aa7 ("regulator: core: Use ww_mutex for regulators locking")
Reported-by: "kernelci.org bot" <bot@kernelci.org>
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
This patch fixes enabling coupled requlators on Exynos5800-based Peach-Pi
board done by the following patch:
https://patchwork.kernel.org/patch/11172427/
Once it has been applied, the following issue has been reported:
https://patchwork.kernel.org/patch/11176661/
---
 drivers/regulator/core.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/regulator/core.c b/drivers/regulator/core.c
index afe94470b67f..aca74b83f3bc 100644
--- a/drivers/regulator/core.c
+++ b/drivers/regulator/core.c
@@ -2481,7 +2481,8 @@ static int _regulator_enable(struct regulator *regulator)
 	}
 
 	/* balance only if there are regulators coupled */
-	if (rdev->coupling_desc.n_coupled > 1) {
+	if (rdev->coupling_desc.n_coupled > 1 &&
+	    !_regulator_is_enabled(rdev)) {
 		ret = regulator_balance_voltage(rdev, PM_SUSPEND_ON);
 		if (ret < 0)
 			goto err_disable_supply;
-- 
2.17.1
