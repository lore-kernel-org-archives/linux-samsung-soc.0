From: =?UTF-8?q?Artur=20=C5=9Awigo=C5=84?= <a.swigon@partner.samsung.com>
Subject: [RFC PATCH 07/11] icc: Relax condition in apply_constraints()
Date: Tue, 23 Jul 2019 14:20:12 +0200
Message-ID: <20190723122016.30279-8-a.swigon@partner.samsung.com>
References: <20190723122016.30279-1-a.swigon@partner.samsung.com>
        <CGME20190723122027eucas1p124f44370a63b16dcb765585761d661a3@eucas1p1.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190723122016.30279-1-a.swigon@partner.samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc: krzk@kernel.org, cw00.choi@samsung.com, myungjoo.ham@samsung.com, inki.dae@samsung.com, sw0312.kim@samsung.com, georgi.djakov@linaro.org, m.szyprowski@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

The exynos-bus devfreq driver is extended with interconnect functionality
by a subsequent patch. This patch removes a check from the interconnect
framework that prevents interconnect from working on exynos-bus, in which
every bus is a separate interconnect provider.

Signed-off-by: Artur Świgoń <a.swigon@partner.samsung.com>
---
 drivers/interconnect/core.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/interconnect/core.c b/drivers/interconnect/core.c
index 2556fd6d1863..bb55565d190c 100644
--- a/drivers/interconnect/core.c
+++ b/drivers/interconnect/core.c
@@ -219,11 +219,8 @@ static int apply_constraints(struct icc_path *path)
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
