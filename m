Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B29332AD20;
	Sat,  1 Feb 2025 10:08:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738404538; cv=none; b=OqAAE67SX1xXoJW3nAo3qaK9ze5+d3u2f2wbE4GirdXeQ2AQrVcNOlRIkhqi2VOeklYSvmy4YIs5/m1v1TvtTZcFm6R4E4ngGgTUeWTCo1YpueB833DUqx6zpvEEBlbdgr1uwo2Fjh2q4NMCo8xMVhWBSYJTXP7sc6xkubXvkMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738404538; c=relaxed/simple;
	bh=MWng4kz1R/7X2hutMtB5Aa5LMzsZusJUpzCbVnFDv6Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=c0rh3y2X+sAVByrKNvYYJlwRKOsCJbqmVzEfRSsWnCnEd9FI49SWw/RknjeZwOyiiLp8lQgrK0NySP/EkVJtGONkaV1pE3jRv+lG7Tji0Kw1jSDL1hqtlXsVhr2hf0HgGWVdGBrk93e0OBapyj5xQmZvKCzwzxP0iF1HtDevmVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: Dv6qrRyyRFWMdW8eeRf/XA==
X-CSE-MsgGUID: 3bIcAGRBRoGnfqOFSySPlQ==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 01 Feb 2025 19:08:48 +0900
Received: from localhost.localdomain (unknown [10.226.92.62])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 2C6AA40062C1;
	Sat,  1 Feb 2025 19:08:34 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH] media: platform: exynos4-is: Use of_get_available_child_by_name()
Date: Sat,  1 Feb 2025 10:08:29 +0000
Message-ID: <20250201100833.34642-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Simplify fimc_md_is_isp_available() by using
of_get_available_child_by_name().

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
This patch is only compile tested and depend upon[1]
[1] https://lore.kernel.org/all/20250201093126.7322-1-biju.das.jz@bp.renesas.com/
---
 drivers/media/platform/samsung/exynos4-is/media-dev.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/samsung/exynos4-is/media-dev.h b/drivers/media/platform/samsung/exynos4-is/media-dev.h
index a50e58ab7ef7..ce89465c22de 100644
--- a/drivers/media/platform/samsung/exynos4-is/media-dev.h
+++ b/drivers/media/platform/samsung/exynos4-is/media-dev.h
@@ -179,8 +179,8 @@ int fimc_md_set_camclk(struct v4l2_subdev *sd, bool on);
 static inline bool fimc_md_is_isp_available(struct device_node *node)
 {
 	struct device_node *child __free(device_node) =
-		of_get_child_by_name(node, FIMC_IS_OF_NODE_NAME);
-	return child ? of_device_is_available(child) : false;
+		of_get_available_child_by_name(node, FIMC_IS_OF_NODE_NAME);
+	return child != NULL;
 }
 #else
 #define fimc_md_is_isp_available(node) (false)
-- 
2.43.0

