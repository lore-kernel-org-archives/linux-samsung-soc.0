From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: [patch] PM / devfreq: exynos-ppmu: fix load_count calculation
Date: Mon, 17 Aug 2015 17:48:56 +0300
Message-ID: <20150817144856.GD23820@mwanda>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <kernel-janitors-owner@vger.kernel.org>
Content-Disposition: inline
Sender: kernel-janitors-owner@vger.kernel.org
To: MyungJoo Ham <myungjoo.ham@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>
Cc: Kyungmin Park <kyungmin.park@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, linux-samsung-soc@vger.kernel.org, kernel-janitors@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

"pmcnt_high & 0xff" is a u32 so we shifting it 32 spaces is zero.  GCC
catches this bug:

drivers/devfreq/event/exynos-ppmu.c: In function =E2=80=98exynos_ppmu_v=
2_get_event=E2=80=99:
drivers/devfreq/event/exynos-ppmu.c:322:3: warning: left shift count >=3D=
 width of type
   load_count =3D (u64)((pmcnt_high & 0xff) << 32) + (u64)pmcnt_low;

=46ixes: 3d87b02281a2 ('PM / devfreq: exynos-ppmu: Add the support of P=
PMUv2 for Exynos5433')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/devfreq/event/exynos-ppmu.c b/drivers/devfreq/even=
t/exynos-ppmu.c
index f9901f5..daf2cdb 100644
--- a/drivers/devfreq/event/exynos-ppmu.c
+++ b/drivers/devfreq/event/exynos-ppmu.c
@@ -319,7 +319,7 @@ static int exynos_ppmu_v2_get_event(struct devfreq_=
event_dev *edev,
 	case PPMU_PMNCNT3:
 		pmcnt_high =3D __raw_readl(info->ppmu.base + PPMU_V2_PMCNT3_HIGH);
 		pmcnt_low =3D __raw_readl(info->ppmu.base + PPMU_V2_PMCNT3_LOW);
-		load_count =3D (u64)((pmcnt_high & 0xff) << 32) + (u64)pmcnt_low;
+		load_count =3D (((u64)pmcnt_high & 0xff) << 32) + pmcnt_low;
 		break;
 	}
 	edata->load_count =3D load_count;
--
To unsubscribe from this list: send the line "unsubscribe kernel-janito=
rs" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
