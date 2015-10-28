From: Yakir Yang <ykk-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: [PATCH v8 04/17] drm: bridge: analogix/dp: remove duplicate
 configuration of link rate and link count
Date: Wed, 28 Oct 2015 16:24:19 +0800
Message-ID: <1446020659-21747-1-git-send-email-ykk@rock-chips.com>
References: <1446020143-32645-1-git-send-email-ykk@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1446020143-32645-1-git-send-email-ykk-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rockchip/>
List-Post: <mailto:linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-rockchip" <linux-rockchip-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Inki Dae <inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Andrzej Hajda <a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Joonyoung Shim <jy0922.shim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Seung-Woo Kim <sw0312.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Jingoo Han <jingoohan1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Mark Yao <mark.yao-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Cc: djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, Yakir Yang <ykk-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Gustavo Padovan <gustavo.padovan-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org, Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, ajaynumb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Andy Yan <andy.yan-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

link_rate and lane_count already configured in analogix_dp_set_link_train(),
so we don't need to config those repeatly after training finished, just
remove them out.

Beside Display Port 1.2 already support 5.4Gbps link rate, the maximum sets
would change from {1.62Gbps, 2.7Gbps} to {1.62Gbps, 2.7Gbps, 5.4Gbps}.

Tested-by: Javier Martinez Canillas <javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>
Signed-off-by: Yakir Yang <ykk-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
---
Changes in v8: None
Changes in v7: None
Changes in v6: None
Changes in v5: None
Changes in v4:
- Update commit message more readable. (Jingoo)
- Adjust the order from 05 to 04

Changes in v3:
- The link_rate and lane_count shouldn't config to the DT property value
  directly, but we can take those as hardware limite. For example, RK3288
  only support 4 physical lanes of 2.7/1.62 Gbps/lane, so DT property would
  like "link-rate = 0x0a" "lane-count = 4". (Thierry)

Changes in v2: None

 drivers/gpu/drm/bridge/analogix/analogix_dp_core.c | 8 ++++----
 drivers/gpu/drm/bridge/analogix/analogix_dp_core.h | 5 +++--
 2 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
index 334181c..96afb67 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
@@ -624,6 +624,8 @@ static void analogix_dp_get_max_rx_bandwidth(struct analogix_dp_device *dp,
 	/*
 	 * For DP rev.1.1, Maximum link rate of Main Link lanes
 	 * 0x06 = 1.62 Gbps, 0x0a = 2.7 Gbps
+	 * For DP rev.1.2, Maximum link rate of Main Link lanes
+	 * 0x06 = 1.62 Gbps, 0x0a = 2.7 Gbps, 0x14 = 5.4Gbps
 	 */
 	analogix_dp_read_byte_from_dpcd(dp, DP_MAX_LINK_RATE, &data);
 	*bandwidth = data;
@@ -657,7 +659,8 @@ static void analogix_dp_init_training(struct analogix_dp_device *dp,
 	analogix_dp_get_max_rx_lane_count(dp, &dp->link_train.lane_count);
 
 	if ((dp->link_train.link_rate != LINK_RATE_1_62GBPS) &&
-	    (dp->link_train.link_rate != LINK_RATE_2_70GBPS)) {
+	    (dp->link_train.link_rate != LINK_RATE_2_70GBPS) &&
+	    (dp->link_train.link_rate != LINK_RATE_5_40GBPS)) {
 		dev_err(dp->dev, "Rx Max Link Rate is abnormal :%x !\n",
 			dp->link_train.link_rate);
 		dp->link_train.link_rate = LINK_RATE_1_62GBPS;
@@ -898,9 +901,6 @@ static void analogix_dp_commit(struct analogix_dp_device *dp)
 	analogix_dp_enable_rx_to_enhanced_mode(dp, 1);
 	analogix_dp_enable_enhanced_mode(dp, 1);
 
-	analogix_dp_set_lane_count(dp, dp->video_info->lane_count);
-	analogix_dp_set_link_bandwidth(dp, dp->video_info->link_rate);
-
 	analogix_dp_init_video(dp);
 	ret = analogix_dp_config_video(dp);
 	if (ret)
diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.h b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.h
index 14d20be..9a90a18 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.h
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.h
@@ -21,8 +21,9 @@
 #define MAX_EQ_LOOP 5
 
 enum link_rate_type {
-	LINK_RATE_1_62GBPS = 0x06,
-	LINK_RATE_2_70GBPS = 0x0a
+	LINK_RATE_1_62GBPS = DP_LINK_BW_1_62,
+	LINK_RATE_2_70GBPS = DP_LINK_BW_2_7,
+	LINK_RATE_5_40GBPS = DP_LINK_BW_5_4,
 };
 
 enum link_lane_count_type {
-- 
1.9.1
