From: =?UTF-8?q?Artur=20=C5=9Awigo=C5=84?= <a.swigon@samsung.com>
Subject: [RFC PATCH v2 07/11] interconnect: Relax condition in
 apply_constraints()
Date: Thu, 19 Sep 2019 16:22:32 +0200
Message-ID: <20190919142236.4071-8-a.swigon@samsung.com>
References: <20190919142236.4071-1-a.swigon@samsung.com>
        <CGME20190919142327eucas1p183470eede07b50c1e3acda58f2af1eba@eucas1p1.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190919142236.4071-1-a.swigon@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc: =?UTF-8?q?Artur=20=C5=9Awigo=C5=84?= <a.swigon@partner.samsung.com>, cw00.choi@samsung.com, myungjoo.ham@samsung.com, inki.dae@samsung.com, sw0312.kim@samsung.com, georgi.djakov@linaro.org, leonard.crestez@nxp.com, m.szyprowski@samsung.com, b.zolnierkie@samsung.com, krzk@kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

From: Artur Świgoń <a.swigon@partner.samsung.com>

The exynos-bus devfreq driver is extended with interconnect functionality
by a subsequent patch. This patch removes a check from the interconnect
framework that prevents interconnect from working on exynos-bus, in which
every bus is a separate interconnect provider.

Signed-off-by: Artur Świgoń <a.swigon@partner.samsung.com>
---
 drivers/interconnect/core.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/interconnect/core.c b/drivers/interconnect/core.c
index f357c3a78858..e8243665d5ba 100644
--- a/drivers/interconnect/core.c
+++ b/drivers/interconnect/core.c
@@ -224,11 +224,8 @@ static int apply_constraints(struct icc_path *path)
 	for (i = 0; i < path->num_nodes; i++) {
 		next = path->reqs[i].node;
 
-		/*
-		 * Both endpoints should be valid master-slave pairs of the
-		 * same interconnect provider that will be configured.
-		 */
-		if (!prev || next->provider != prev->provider) {
+		/* both endpoints should be valid master-slave pairs */
+		if (!prev) {
 			prev = next;
 			continue;
 		}
-- 
2.17.1
