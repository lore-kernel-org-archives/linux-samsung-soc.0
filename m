From: zain wang <wzz-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: [PATCH v1 4/4] drm: bridge/analogix: switch Main-link and eDP PHY
 when enable/disable psr
Date: Thu, 29 Sep 2016 22:46:40 +0800
Message-ID: <1475160400-30782-5-git-send-email-wzz@rock-chips.com>
References: <1475160400-30782-1-git-send-email-wzz@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1475160400-30782-1-git-send-email-wzz-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rockchip/>
List-Post: <mailto:linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-rockchip" <linux-rockchip-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Daniel Vetter <daniel.vetter-/w4YWyX8dFk@public.gmane.org>, Inki Dae <inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>
Cc: Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Tomeu Vizoso <tomeu.vizoso-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Jingoo Han <jingoohan1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Tomasz Figa <tfiga-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Javier Martinez Canillas <javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>, zain wang <wzz-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Mika Kahola <mika.kahola-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Yakir Yang <ykk-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, =?UTF-8?q?St=C3=A9phane=20Marchesin?= <marcheu-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

turn off Main-link and power down eDP PHY when enable psr,
turn on Main-link and power up eDP PHY when disable psr.

Signed-off-by: zain wang <wzz-TNX95d0MmH7DzftRWevZcw@public.gmane.org>

---

 drivers/gpu/drm/bridge/analogix/analogix_dp_core.c | 105 ++++++++++-----------
 1 file changed, 52 insertions(+), 53 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
index 7177f5f..1bc98ab 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
@@ -98,56 +98,6 @@ static int analogix_dp_detect_hpd(struct analogix_dp_device *dp)
 	return 0;
 }
 
-int analogix_dp_enable_psr(struct device *dev)
-{
-	struct analogix_dp_device *dp = dev_get_drvdata(dev);
-	struct edp_vsc_psr psr_vsc;
-
-	if (!dp->psr_support)
-		return -EINVAL;
-
-	if (dp->dpms_mode != DRM_MODE_DPMS_ON)
-		return -EBUSY;
-
-	/* Prepare VSC packet as per EDP 1.4 spec, Table 6.9 */
-	memset(&psr_vsc, 0, sizeof(psr_vsc));
-	psr_vsc.sdp_header.HB0 = 0;
-	psr_vsc.sdp_header.HB1 = 0x7;
-	psr_vsc.sdp_header.HB2 = 0x2;
-	psr_vsc.sdp_header.HB3 = 0x8;
-
-	psr_vsc.DB0 = 0;
-	psr_vsc.DB1 = EDP_VSC_PSR_STATE_ACTIVE | EDP_VSC_PSR_CRC_VALUES_VALID;
-
-	return analogix_dp_send_psr_spd(dp, &psr_vsc);
-}
-EXPORT_SYMBOL_GPL(analogix_dp_enable_psr);
-
-int analogix_dp_disable_psr(struct device *dev)
-{
-	struct analogix_dp_device *dp = dev_get_drvdata(dev);
-	struct edp_vsc_psr psr_vsc;
-
-	if (!dp->psr_support)
-		return -EINVAL;
-
-	if (dp->dpms_mode != DRM_MODE_DPMS_ON)
-		return -EBUSY;
-
-	/* Prepare VSC packet as per EDP 1.4 spec, Table 6.9 */
-	memset(&psr_vsc, 0, sizeof(psr_vsc));
-	psr_vsc.sdp_header.HB0 = 0;
-	psr_vsc.sdp_header.HB1 = 0x7;
-	psr_vsc.sdp_header.HB2 = 0x2;
-	psr_vsc.sdp_header.HB3 = 0x8;
-
-	psr_vsc.DB0 = 0;
-	psr_vsc.DB1 = 0;
-
-	return analogix_dp_send_psr_spd(dp, &psr_vsc);
-}
-EXPORT_SYMBOL_GPL(analogix_dp_disable_psr);
-
 static bool analogix_dp_detect_sink_psr(struct analogix_dp_device *dp)
 {
 	unsigned char psr_version;
@@ -168,12 +118,11 @@ static void analogix_dp_enable_sink_psr(struct analogix_dp_device *dp)
 	drm_dp_dpcd_writeb(&dp->aux, DP_PSR_EN_CFG, psr_en);
 
 	/* Main-Link transmitter remains active during PSR active states */
-	psr_en = DP_PSR_MAIN_LINK_ACTIVE | DP_PSR_CRC_VERIFICATION;
+	psr_en = DP_PSR_CRC_VERIFICATION;
 	drm_dp_dpcd_writeb(&dp->aux, DP_PSR_EN_CFG, psr_en);
 
 	/* Enable psr function */
-	psr_en = DP_PSR_ENABLE | DP_PSR_MAIN_LINK_ACTIVE |
-		 DP_PSR_CRC_VERIFICATION;
+	psr_en = DP_PSR_ENABLE | DP_PSR_CRC_VERIFICATION;
 	drm_dp_dpcd_writeb(&dp->aux, DP_PSR_EN_CFG, psr_en);
 
 	analogix_dp_enable_psr_crc(dp);
@@ -876,6 +825,56 @@ static void analogix_dp_commit(struct analogix_dp_device *dp)
 		analogix_dp_enable_sink_psr(dp);
 }
 
+int analogix_dp_enable_psr(struct device *dev)
+{
+	struct analogix_dp_device *dp = dev_get_drvdata(dev);
+	struct edp_vsc_psr psr_vsc;
+
+	if (!dp->psr_support)
+		return -EINVAL;
+
+	if (dp->dpms_mode != DRM_MODE_DPMS_ON)
+		return -EBUSY;
+
+	/* Prepare VSC packet as per EDP 1.4 spec, Table 6.9 */
+	memset(&psr_vsc, 0, sizeof(psr_vsc));
+	psr_vsc.sdp_header.HB0 = 0;
+	psr_vsc.sdp_header.HB1 = 0x7;
+	psr_vsc.sdp_header.HB2 = 0x2;
+	psr_vsc.sdp_header.HB3 = 0x8;
+
+	psr_vsc.DB0 = 0;
+	psr_vsc.DB1 = EDP_VSC_PSR_STATE_ACTIVE | EDP_VSC_PSR_CRC_VALUES_VALID;
+
+	return analogix_dp_send_psr_spd(dp, &psr_vsc);
+}
+EXPORT_SYMBOL_GPL(analogix_dp_enable_psr);
+
+int analogix_dp_disable_psr(struct device *dev)
+{
+	struct analogix_dp_device *dp = dev_get_drvdata(dev);
+	struct edp_vsc_psr psr_vsc;
+
+	if (!dp->psr_support)
+		return -EINVAL;
+
+	if (dp->dpms_mode != DRM_MODE_DPMS_ON)
+		return -EBUSY;
+
+	/* Prepare VSC packet as per EDP 1.4 spec, Table 6.9 */
+	memset(&psr_vsc, 0, sizeof(psr_vsc));
+	psr_vsc.sdp_header.HB0 = 0;
+	psr_vsc.sdp_header.HB1 = 0x7;
+	psr_vsc.sdp_header.HB2 = 0x2;
+	psr_vsc.sdp_header.HB3 = 0x8;
+
+	psr_vsc.DB0 = 0;
+	psr_vsc.DB1 = 0;
+
+	return analogix_dp_send_psr_spd(dp, &psr_vsc);
+}
+EXPORT_SYMBOL_GPL(analogix_dp_disable_psr);
+
 /*
  * This function is a bit of a catch-all for panel preparation, hopefully
  * simplifying the logic of functions that need to prepare/unprepare the panel
-- 
1.9.1
