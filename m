Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED6281E0DE8;
	Fri, 21 Nov 2025 12:19:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763727556; cv=none; b=C1KzBxoKKfZnOsrSpcyc+dESFWpIXELup3P9FpB8xRDsHCPPm4dy+uWChB10ugyqxWphV5+LiQGnxIX0L2/p57bnb/dLSNX+d2oL3L6fHcsAjRaRhZhHaU63BgiwBcDZrL5rw7CuI1p4BTVO7K2ZAZMSlg1aF6+rYGmcXVsocHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763727556; c=relaxed/simple;
	bh=gZgekMJVxgHv2DLRpfqBA4+uHXMQdX0s4bdv1kmejkg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mt9kFahNqYprM1xKHi3gv4qYCwtmzpyJOLPxxUgTOk6jgEkfGq5KREDBjsR0KZEAt1eXMjkx3R18mRcotCS0kI/7+v+sLnBFGh0f8tDltNYsHTUszZYiphpSbz+e+D4UFgf+Ree/Z6Na0N10uzZwXHEJ7p8iaSZ3jq4CguaaRjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dGJ6WKfg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dGJ6WKfg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0260C113D0;
	Fri, 21 Nov 2025 12:19:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763727555;
	bh=gZgekMJVxgHv2DLRpfqBA4+uHXMQdX0s4bdv1kmejkg=;
	h=From:To:Cc:Subject:Date:From;
	b=dGJ6WKfgglje1vmOekWqRFO/77sEa1X1ERqiyVFsAjDnEBQUcrxYmcYKhC4OUo31o
	 dAI+wp3d9YHiKVvu7AukDMqUfaHxl3N+8At3YmSr5UdePzUckF1h4nsfK5DM/D9U22
	 IoCTBO3TvfS5DW09tsn/1RMZTKMChGR37VJWcRvLTDkEP1xIk2zz4UZBRl5BZwWazp
	 vSceIkGYHRIb9dQGD81sXaNBsxEx+Yimg1XBVFgS8k5Coy83YiOYLerNc1ySBXotoH
	 8Vfz3Zd8W1pFt37205ouogvuNSn1hAOUt/Iud4gj6D/dbhrzd2CS4HZPlAoKxbQyIh
	 iAx15CmEtzk7A==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1vMQ6d-000000004Nv-24sX;
	Fri, 21 Nov 2025 13:19:16 +0100
From: Johan Hovold <johan@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>
Cc: Peter Griffin <peter.griffin@linaro.org>,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan@kernel.org>,
	stable@vger.kernel.org
Subject: [PATCH] soc: samsung: exynos-pmu: fix device leak on regmap lookup
Date: Fri, 21 Nov 2025 13:18:52 +0100
Message-ID: <20251121121852.16825-1-johan@kernel.org>
X-Mailer: git-send-email 2.51.2
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Make sure to drop the reference taken when looking up the PMU device and
its regmap.

Note that holding a reference to a device does not prevent its regmap
from going away so there is no point in keeping the reference.

Fixes: 0b7c6075022c ("soc: samsung: exynos-pmu: Add regmap support for SoCs that protect PMU regs")
Cc: stable@vger.kernel.org	# 6.9
Cc: Peter Griffin <peter.griffin@linaro.org>
Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/soc/samsung/exynos-pmu.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/soc/samsung/exynos-pmu.c b/drivers/soc/samsung/exynos-pmu.c
index 22c50ca2aa79..ba4de8194a0e 100644
--- a/drivers/soc/samsung/exynos-pmu.c
+++ b/drivers/soc/samsung/exynos-pmu.c
@@ -346,6 +346,8 @@ struct regmap *exynos_get_pmu_regmap_by_phandle(struct device_node *np,
 	if (!dev)
 		return ERR_PTR(-EPROBE_DEFER);
 
+	put_device(dev);
+
 	return syscon_node_to_regmap(pmu_np);
 }
 EXPORT_SYMBOL_GPL(exynos_get_pmu_regmap_by_phandle);
-- 
2.51.2

