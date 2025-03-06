Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEAB718FDAA;
	Thu,  6 Mar 2025 04:27:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741235276; cv=none; b=EuVmtoQla0nY34/fx5SNtnKO3qQIfzCWgDTUqiwpNfdgkLjdDzNbh14wlvWTAhCXAv27wMUTAmdVd0o84zy0/AJrno7Go1ZDowzxqgeHVrZsPFyis/28xCZs2psm3SF9DmKghnI1cqRCl1NL5rXu6LfVTfQS83fgGCh3kdo/Cow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741235276; c=relaxed/simple;
	bh=+FVxQn4sdkfmsJ5BFi35qzfI/Ggq/Z4b3+c3bvz3hUY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=d9H4HOjALZ+6WLzEH6q18gP/ZVvsQHn+IR9h5DHepXLTh8CPBxdB4W5rpKvCVH+qeSnJG86JO4fAu9vk8grwykB8leDOW/FjjMm5B7/fEHgPV9u42lbsiXjWN0mDK45UiVfsWIww4w6KoCfK8m/uceJs0NnxsnjCCyuWIS+86zs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost.localdomain (unknown [124.16.141.245])
	by APP-01 (Coremail) with SMTP id qwCowADn7286JMlno9vFEg--.61141S2;
	Thu, 06 Mar 2025 12:27:42 +0800 (CST)
From: Wentao Liang <vulab@iscas.ac.cn>
To: jani.nikula@linux.intel.com,
	inki.dae@samsung.com,
	sw0312.kim@samsung.com,
	kyungmin.park@samsung.com,
	airlied@gmail.com,
	simona@ffwll.ch,
	krzk@kernel.org,
	alim.akhtar@samsung.com
Cc: dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Wentao Liang <vulab@iscas.ac.cn>
Subject: [PATCH] drm/exynos/vidi: Remove redundant error handling in vidi_get_modes()
Date: Thu,  6 Mar 2025 12:27:20 +0800
Message-ID: <20250306042720.2296-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.42.0.windows.2
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qwCowADn7286JMlno9vFEg--.61141S2
X-Coremail-Antispam: 1UD129KBjvJXoW7urW5Ww1UGr1DurWkXr4fKrg_yoW8GryxpF
	W7Kr92yryDt3yrAa4jyF1FkFyYya9FkFWqgr4Duwnxur4UArn7ZF4ft3WUXa48Cr95Z34j
	v3WDtrs8JF1kCr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUBj14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r1I6r4UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Cr
	1j6rxdM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj
	6xIIjxv20xvE14v26r1Y6r17McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr
	0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E
	8cxan2IY04v7MxkF7I0En4kS14v26r1q6r43MxkIecxEwVAFwVW8XwCF04k20xvY0x0EwI
	xGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480
	Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7
	IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k2
	6cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxV
	AFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUhZ2-UUUUU=
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiCQ4MA2fIkRkNFQACs1

In the vidi_get_modes() function, if either drm_edid_dup() or 
drm_edid_alloc() fails, the function will immediately return 0,
indicating that no display modes can be retrieved. However, in
the event of failure in these two functions, it is still necessary
to call the subsequent drm_edid_connector_update() function with
a NULL drm_edid as an argument. This ensures that operations such
as connector settings are performed in its callee function, 
_drm_edid_connector_property_update. To maintain the integrity of
the operation, redundant error handling needs to be removed.

Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
---
 drivers/gpu/drm/exynos/exynos_drm_vidi.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_vidi.c b/drivers/gpu/drm/exynos/exynos_drm_vidi.c
index fd388b1dbe68..a956cdb2f33a 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_vidi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_vidi.c
@@ -312,9 +312,6 @@ static int vidi_get_modes(struct drm_connector *connector)
 	else
 		drm_edid = drm_edid_alloc(fake_edid_info, sizeof(fake_edid_info));
 
-	if (!drm_edid)
-		return 0;
-
 	drm_edid_connector_update(connector, drm_edid);
 
 	count = drm_edid_connector_add_modes(connector);
-- 
2.42.0.windows.2

