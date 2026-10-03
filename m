Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4F75376BD7;
	Sat,  3 Oct 2026 08:32:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791016364; cv=none; b=h175DZKjmu8vNnHGkX4q9ZzQgVWdH/nlgtV8gaMeBekRY9u3LtUfVpl5/CaB8tVsm8dGbUE24HduwUh+CM5lBjdE2R5CaE1cXgJb6N3i3J1uryrxBb64x2/uASVFAAZMb66OHRtHkWRObGsEQdW42roZqoV5NaYvCn0DFRdzTzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791016364; c=relaxed/simple;
	bh=gJ+GFtq0JoC+0RTUYDC53MlPTRfkewr246fshdHSNgA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Rfvc/Nz5y7RaNmZIpK9Lu7WgVxgRaO5azCeftneapxTjrVkbS79YLAwRXNynSYQOvQx7ybVInEAiY3gY3XJiiEHtIsMrTMr7W/MZ2DTYbtq/lw/i4+b/YNedyWlyL9G5rU/PhAPGKGczQWhv5B7mRnC939yiSXqxaIkzpY8daiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=kwPa6m3D; arc=none smtp.client-ip=220.197.31.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="kwPa6m3D"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=Ci
	x4msqcfYVv2/RRfXCskI530PrFprT29dvCwItO168=; b=kwPa6m3DwPYSmXluy2
	0/PqfQsbYJeRXaxzRXqmG5OieA+gu5Ox7ll8xUqgwrsfqG9qAZysMef3x5fbbw1n
	9H+tUnPiq/mZ7XjCcUdGtGYw7xwA6hOIhywalJ0s6qN2Y8Pv+4U3LfiihVMwJBWq
	xUGSqSlicY4jWIUt8+ry1vQ1M=
Received: from pc.localdomain (unknown [])
	by gzga-smtp-mtada-g0-0 (Coremail) with SMTP id _____wD3dzGDvcBqKMk7CA--.47308S6;
	Sat, 03 Oct 2026 16:32:13 +0800 (CST)
From: Jiale Yao <yaojiale02@163.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Linus Walleij <linusw@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Jiale Yao <yaojiale02@163.com>
Subject: [PATCH v2 4/4] pinctrl: samsung: free maps on DT map failure
Date: Sat,  3 Oct 2026 16:31:57 +0800
Message-Id: <20261003083200.459705-5-yaojiale02@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261003083200.459705-1-yaojiale02@163.com>
References: <20261003083200.459705-1-yaojiale02@163.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3dzGDvcBqKMk7CA--.47308S6
X-Coremail-Antispam: 1Uf129KBjvJXoW7Kw1rurWrXF1rZF18tryUGFg_yoW8ArWxpr
	s3WFsxJF4rJ3Z3GFWft345Zry3Aan3JryUWayjg348ZFs8AFsru34UKFyUZF1DKrZ5Wr4S
	9rZxCFyYkayYq3JanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pRy5l8UUUUU=
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbCzg1dl2rAvY0SVwAA3W

samsung_dt_subnode_to_map() can reserve map storage before adding
configuration entries.  The no-child path returns its error directly, and
the child path frees mappings on failure.

Use one error path that frees the accumulated map in both cases.  The
caller ignores the output parameters when the mapping callback returns an
error, so they do not need to be reset after freeing the map.

Signed-off-by: Jiale Yao <yaojiale02@163.com>
---
 drivers/pinctrl/samsung/pinctrl-samsung.c | 24 ++++++++++++++---------
 1 file changed, 15 insertions(+), 9 deletions(-)

diff --git a/drivers/pinctrl/samsung/pinctrl-samsung.c b/drivers/pinctrl/samsung/pinctrl-samsung.c
index 5ecc9ed4c44d..0a1e6063fb5f 100644
--- a/drivers/pinctrl/samsung/pinctrl-samsung.c
+++ b/drivers/pinctrl/samsung/pinctrl-samsung.c
@@ -259,22 +259,28 @@ static int samsung_dt_node_to_map(struct pinctrl_dev *pctldev,
 	*map = NULL;
 	*num_maps = 0;
 
-	if (!of_get_child_count(np_config))
-		return samsung_dt_subnode_to_map(drvdata, pctldev->dev,
-							np_config, map,
-							&reserved_maps,
-							num_maps);
+	if (!of_get_child_count(np_config)) {
+		ret = samsung_dt_subnode_to_map(drvdata, pctldev->dev,
+						np_config, map, &reserved_maps,
+						num_maps);
+		if (ret < 0)
+			goto err_free_map;
+
+		return 0;
+	}
 
 	for_each_child_of_node_scoped(np_config, np) {
 		ret = samsung_dt_subnode_to_map(drvdata, pctldev->dev, np, map,
 						&reserved_maps, num_maps);
-		if (ret < 0) {
-			samsung_dt_free_map(pctldev, *map, *num_maps);
-			return ret;
-		}
+		if (ret < 0)
+			goto err_free_map;
 	}
 
 	return 0;
+
+err_free_map:
+	samsung_dt_free_map(pctldev, *map, *num_maps);
+	return ret;
 }
 
 #ifdef CONFIG_DEBUG_FS
-- 
2.34.1

