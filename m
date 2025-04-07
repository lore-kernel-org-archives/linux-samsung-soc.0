Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F54B226861;
	Mon,  7 Apr 2025 11:05:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744023926; cv=none; b=sqHmgBjd8l4ScW1BsW6zAmOLhuAs00WQM5DLIm+d0I2FCRxuLDpsbtihE74CaVkFEkCoJs/I2vHWp2b0/f8Mp7CHDktyz3U1syIbgOPS0VzcdmPPsRZ3pXXjps7n6PBytxijcffjVe3oU4rdFaLWDz5qnW4der05fYJYQEBv5ks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744023926; c=relaxed/simple;
	bh=gJoNppZv0dRdmNUn6oFDbnK5qoMxNF39zVIFopD9Gnw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=J1AWsjvlah0fnE7ESq/E1sye01VkKT6aM5Eq5LfbcTGjLR+HRZDlAMrjrOMwJJiJ+Oxq3YQfdzwZ4MWvHegBtB+sH86HG4nE9wheb6GpPo8LbKl6BStEBxsVxA/ZBrOkbW0REETHC/sWIJL/U2RbylJ6ZsOxbF6ptM5vcHYyJWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: r/vz6KOiSdWPScPuRYOYbw==
X-CSE-MsgGUID: WeSd6SwyR/amjgABX9Mdng==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 07 Apr 2025 20:05:21 +0900
Received: from localhost.localdomain (unknown [10.226.92.133])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 038554005473;
	Mon,  7 Apr 2025 20:05:18 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v3] media: platform: exynos4-is: Use of_get_available_child_by_name()
Date: Mon,  7 Apr 2025 12:05:13 +0100
Message-ID: <20250407110516.41124-1-biju.das.jz@bp.renesas.com>
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
v2->v3:
 * Fixed CHECK: Comparison to NULL could be written "child" reoported by
   [1] https://linux-media.pages.freedesktop.org/-/users/patchwork/-/jobs/74116132/artifacts/report.htm
 * Dropped Rb tag from Krzysztof.
v1->v2:
 * Rebased to next as the dependency patch hits on 6.15-rc1.
---
 drivers/media/platform/samsung/exynos4-is/media-dev.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/samsung/exynos4-is/media-dev.h b/drivers/media/platform/samsung/exynos4-is/media-dev.h
index a50e58ab7ef7..ea496670d4b5 100644
--- a/drivers/media/platform/samsung/exynos4-is/media-dev.h
+++ b/drivers/media/platform/samsung/exynos4-is/media-dev.h
@@ -179,8 +179,8 @@ int fimc_md_set_camclk(struct v4l2_subdev *sd, bool on);
 static inline bool fimc_md_is_isp_available(struct device_node *node)
 {
 	struct device_node *child __free(device_node) =
-		of_get_child_by_name(node, FIMC_IS_OF_NODE_NAME);
-	return child ? of_device_is_available(child) : false;
+		of_get_available_child_by_name(node, FIMC_IS_OF_NODE_NAME);
+	return child;
 }
 #else
 #define fimc_md_is_isp_available(node) (false)
-- 
2.43.0

