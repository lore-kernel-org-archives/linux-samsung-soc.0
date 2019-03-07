From: "kernelci.org bot" <bot@kernelci.org>
Subject: mainline/master boot bisection: v5.0-5022-g542d0e583b7b on odroid-xu3
Date: Wed, 06 Mar 2019 23:17:01 -0800 (PST)
Message-ID: <5c80c56d.1c69fb81.e3d9f.d73a@mx.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: tomeu.vizoso@collabora.com, guillaume.tucker@collabora.com, broonie@kernel.org, matthew.hart@linaro.org, Herbert Xu <herbert@gondor.apana.org.au>, khilman@baylibre.com, enric.balletbo@collabora.com, Kamil Konieczny <k.konieczny@partner.samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-crypto@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Vladimir Zapolskiy <vz@mleia.com>, linux-kernel@vger.kernel.org, "David S. Miller" <davem@davemloft.net>
List-Id: linux-samsung-soc@vger.kernel.org

* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
* This automated bisection report was sent to you on the basis  *
* that you may be involved with the breaking commit it has      *
* found.  No manual investigation has been done to verify it,   *
* and the root cause of the problem may be somewhere else.      *
* Hope this helps!                                              *
* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *

mainline/master boot bisection: v5.0-5022-g542d0e583b7b on odroid-xu3

Summary:
  Start:      542d0e583b7b Merge tag 'devprop-5.1-rc1' of git://git.kernel.=
org/pub/scm/linux/kernel/git/rafael/linux-pm
  Details:    https://kernelci.org/boot/id/5c806c1d59b5148945fe6019
  Plain log:  https://storage.kernelci.org//mainline/master/v5.0-5022-g542d=
0e583b7b/arm/exynos_defconfig/gcc-7/lab-collabora/boot-exynos5422-odroidxu3=
.txt
  HTML log:   https://storage.kernelci.org//mainline/master/v5.0-5022-g542d=
0e583b7b/arm/exynos_defconfig/gcc-7/lab-collabora/boot-exynos5422-odroidxu3=
.html
  Result:     0918f18c7179 crypto: s5p - add AES support for Exynos5433

Checks:
  revert:     PASS
  verify:     PASS

Parameters:
  Tree:       mainline
  URL:        git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.=
git
  Branch:     master
  Target:     odroid-xu3
  CPU arch:   arm
  Lab:        lab-collabora
  Compiler:   gcc-7
  Config:     exynos_defconfig
  Test suite: boot

Breaking commit found:

---------------------------------------------------------------------------=
----
commit 0918f18c7179e8cdf718d01531a81b28130b4217
Author: Kamil Konieczny <k.konieczny@partner.samsung.com>
Date:   Fri Feb 22 13:21:44 2019 +0100

    crypto: s5p - add AES support for Exynos5433
    =

    Add AES crypto HW acceleration for Exynos5433, with the help of SlimSSS=
 IP.
    =

    Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
    Signed-off-by: Kamil Konieczny <k.konieczny@partner.samsung.com>
    Signed-off-by: Herbert Xu <herbert@gondor.apana.org.au>

diff --git a/drivers/crypto/s5p-sss.c b/drivers/crypto/s5p-sss.c
index 8d0afdc220ff..f4e625cf53ca 100644
--- a/drivers/crypto/s5p-sss.c
+++ b/drivers/crypto/s5p-sss.c
@@ -232,6 +232,7 @@
  * struct samsung_aes_variant - platform specific SSS driver data
  * @aes_offset: AES register offset from SSS module's base.
  * @hash_offset: HASH register offset from SSS module's base.
+ * @clk_names: names of clocks needed to run SSS IP
  *
  * Specifies platform specific configuration of SSS module.
  * Note: A structure for driver specific platform data is used for future
@@ -240,6 +241,7 @@
 struct samsung_aes_variant {
 	unsigned int			aes_offset;
 	unsigned int			hash_offset;
+	const char			*clk_names[];
 };
 =

 struct s5p_aes_reqctx {
@@ -296,6 +298,7 @@ struct s5p_aes_ctx {
 struct s5p_aes_dev {
 	struct device			*dev;
 	struct clk			*clk;
+	struct clk			*pclk;
 	void __iomem			*ioaddr;
 	void __iomem			*aes_ioaddr;
 	int				irq_fc;
@@ -384,11 +387,19 @@ struct s5p_hash_ctx {
 static const struct samsung_aes_variant s5p_aes_data =3D {
 	.aes_offset	=3D 0x4000,
 	.hash_offset	=3D 0x6000,
+	.clk_names	=3D { "secss", },
 };
 =

 static const struct samsung_aes_variant exynos_aes_data =3D {
 	.aes_offset	=3D 0x200,
 	.hash_offset	=3D 0x400,
+	.clk_names	=3D { "secss", },
+};
+
+static const struct samsung_aes_variant exynos5433_slim_aes_data =3D {
+	.aes_offset	=3D 0x400,
+	.hash_offset	=3D 0x800,
+	.clk_names	=3D { "pclk", "aclk", },
 };
 =

 static const struct of_device_id s5p_sss_dt_match[] =3D {
@@ -400,6 +411,10 @@ static const struct of_device_id s5p_sss_dt_match[] =
=3D {
 		.compatible =3D "samsung,exynos4210-secss",
 		.data =3D &exynos_aes_data,
 	},
+	{
+		.compatible =3D "samsung,exynos5433-slim-sss",
+		.data =3D &exynos5433_slim_aes_data,
+	},
 	{ },
 };
 MODULE_DEVICE_TABLE(of, s5p_sss_dt_match);
@@ -2218,18 +2233,39 @@ static int s5p_aes_probe(struct platform_device *pd=
ev)
 			return PTR_ERR(pdata->ioaddr);
 	}
 =

-	pdata->clk =3D devm_clk_get(dev, "secss");
+	pdata->clk =3D devm_clk_get(dev, variant->clk_names[0]);
 	if (IS_ERR(pdata->clk)) {
-		dev_err(dev, "failed to find secss clock source\n");
+		dev_err(dev, "failed to find secss clock %s\n",
+			variant->clk_names[0]);
 		return -ENOENT;
 	}
 =

 	err =3D clk_prepare_enable(pdata->clk);
 	if (err < 0) {
-		dev_err(dev, "Enabling SSS clk failed, err %d\n", err);
+		dev_err(dev, "Enabling clock %s failed, err %d\n",
+			variant->clk_names[0], err);
 		return err;
 	}
 =

+	if (variant->clk_names[1]) {
+		pdata->pclk =3D devm_clk_get(dev, variant->clk_names[1]);
+		if (IS_ERR(pdata->pclk)) {
+			dev_err(dev, "failed to find clock %s\n",
+				variant->clk_names[1]);
+			err =3D -ENOENT;
+			goto err_clk;
+		}
+
+		err =3D clk_prepare_enable(pdata->pclk);
+		if (err < 0) {
+			dev_err(dev, "Enabling clock %s failed, err %d\n",
+				variant->clk_names[0], err);
+			goto err_clk;
+		}
+	} else {
+		pdata->pclk =3D NULL;
+	}
+
 	spin_lock_init(&pdata->lock);
 	spin_lock_init(&pdata->hash_lock);
 =

@@ -2305,8 +2341,11 @@ static int s5p_aes_probe(struct platform_device *pde=
v)
 	tasklet_kill(&pdata->tasklet);
 =

 err_irq:
-	clk_disable_unprepare(pdata->clk);
+	if (pdata->pclk)
+		clk_disable_unprepare(pdata->pclk);
 =

+err_clk:
+	clk_disable_unprepare(pdata->clk);
 	s5p_dev =3D NULL;
 =

 	return err;
@@ -2333,6 +2372,9 @@ static int s5p_aes_remove(struct platform_device *pde=
v)
 		pdata->use_hash =3D false;
 	}
 =

+	if (pdata->pclk)
+		clk_disable_unprepare(pdata->pclk);
+
 	clk_disable_unprepare(pdata->clk);
 	s5p_dev =3D NULL;
---------------------------------------------------------------------------=
----


Git bisection log:

---------------------------------------------------------------------------=
----
git bisect start
# good: [a215ce8f0e00c2d707080236f1aafec337371043] Merge tag 'iommu-fix-v5.=
0-rc8' of git://git.kernel.org/pub/scm/linux/kernel/git/joro/iommu
git bisect good a215ce8f0e00c2d707080236f1aafec337371043
# bad: [542d0e583b7b366527175b2b5fc0aad262fa33b0] Merge tag 'devprop-5.1-rc=
1' of git://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm
git bisect bad 542d0e583b7b366527175b2b5fc0aad262fa33b0
# good: [18a4d8bf250a33c015955f0dec27259780ef6448] Merge git://git.kernel.o=
rg/pub/scm/linux/kernel/git/davem/net
git bisect good 18a4d8bf250a33c015955f0dec27259780ef6448
# bad: [203b6609e0ede49eb0b97008b1150c69e9d2ffd3] Merge branch 'perf-core-f=
or-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip
git bisect bad 203b6609e0ede49eb0b97008b1150c69e9d2ffd3
# bad: [63bdf4284c38a48af21745ceb148a087b190cd21] Merge branch 'linus' of g=
it://git.kernel.org/pub/scm/linux/kernel/git/herbert/crypto-2.6
git bisect bad 63bdf4284c38a48af21745ceb148a087b190cd21
# good: [32c0ac3af49d0cfa05c5d9d77db94e240502b5ef] Merge tag 'regulator-v5.=
1' of git://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator
git bisect good 32c0ac3af49d0cfa05c5d9d77db94e240502b5ef
# good: [7629bac64204ff256d3b2415767a7acb1401047b] Merge tag 'hwmon-for-v5.=
1' of git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging
git bisect good 7629bac64204ff256d3b2415767a7acb1401047b
# good: [48ef0908b81cc6b92ec8b157bb78ce2c4eddd7c7] crypto: axis - support v=
ariable AEAD tag length
git bisect good 48ef0908b81cc6b92ec8b157bb78ce2c4eddd7c7
# good: [cf64e495fe221479866c1ea7c6f5cd9698d8a3af] crypto: caam - weak key =
checking for cbc des, 3des
git bisect good cf64e495fe221479866c1ea7c6f5cd9698d8a3af
# good: [7df5218d66750ff5f84413ea307391bf9bbace1e] crypto: ccp - Update dri=
ver messages to remove some confusion
git bisect good 7df5218d66750ff5f84413ea307391bf9bbace1e
# good: [91e14842f8ea8dc35669bad3c3dcd72d4614e4d1] crypto: af_alg - use str=
uct_size() in sock_kfree_s()
git bisect good 91e14842f8ea8dc35669bad3c3dcd72d4614e4d1
# good: [5ddb0869bfc1bca6cfc592c74c64a026f936638c] leds: lp55xx: fix null d=
eref on firmware load failure
git bisect good 5ddb0869bfc1bca6cfc592c74c64a026f936638c
# good: [d3ff9f851b7ad892df8dc168f0d589308fb42ac3] dt-bindings: crypto: doc=
ument Exynos5433 SlimSSS
git bisect good d3ff9f851b7ad892df8dc168f0d589308fb42ac3
# good: [6456300356433873309a1cae6aa05e77d6b59153] Merge git://git.kernel.o=
rg/pub/scm/linux/kernel/git/davem/net-next
git bisect good 6456300356433873309a1cae6aa05e77d6b59153
# bad: [0918f18c7179e8cdf718d01531a81b28130b4217] crypto: s5p - add AES sup=
port for Exynos5433
git bisect bad 0918f18c7179e8cdf718d01531a81b28130b4217
# first bad commit: [0918f18c7179e8cdf718d01531a81b28130b4217] crypto: s5p =
- add AES support for Exynos5433
---------------------------------------------------------------------------=
----
