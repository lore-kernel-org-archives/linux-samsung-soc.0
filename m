Received: from out-03.smtp.spacemail.com (out-03.smtp.spacemail.com [63.250.43.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EEB71FE119;
	Tue, 15 Oct 2024 21:02:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=63.250.43.88
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729026156; cv=none; b=rCkAhGsfV1oyFYwHmqQ3dZURKEVRqMnc8TVXAwOG1AGBmQ9kMJisdinDxtuHZRs2Lq7ZdxDisKJ4fO7v4JlJmRF1JC9pOW4wpofkiHhqI5RBHw46949p5l1/tB73lGNSbFIW0QN5Prw+9j6DTgQm7/5DuuDGINdw2IvO9dWu4/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729026156; c=relaxed/simple;
	bh=g9ygpDKyS8tAdx0p0uvQx/Yca2s4613LUY/AYHZ8um8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GmaV2/WtBfXei0RhTZimZZRi6bUlcKkGNdt43Nq77kn8V7Z//4P0xHHO5D/KYqsXkFjn8wPK6Cx/ZFAAwPuAmxYdo3agXIufAx0PE0wwYj4BMI+s0l84LxJrpNFi66cpDls60KLiKKlSoqk+K1N2myRhN1c4uNg3iPurVq11mAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org; spf=pass smtp.mailfrom=mentallysanemainliners.org; dkim=pass (2048-bit key) header.d=mentallysanemainliners.org header.i=@mentallysanemainliners.org header.b=E2y+BuZR; arc=none smtp.client-ip=63.250.43.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mentallysanemainliners.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mentallysanemainliners.org header.i=@mentallysanemainliners.org header.b="E2y+BuZR"
Received: from prod-lbout-phx.jellyfish.systems (unknown [198.177.122.3])
	by smtp.spacemail.com (Postfix) with ESMTPA id 4XSmkt2rqKzGpcg;
	Tue, 15 Oct 2024 21:02:30 +0000 (UTC)
Received: from igor-systemproductname.lan (83.8.240.202.ipv4.supernova.orange.pl [83.8.240.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.spacemail.com (Postfix) with ESMTPSA id 4XSmkk6drRz8sWQ;
	Tue, 15 Oct 2024 21:02:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=mentallysanemainliners.org; s=spacemail; t=1729026145;
	bh=g9ygpDKyS8tAdx0p0uvQx/Yca2s4613LUY/AYHZ8um8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=E2y+BuZRRTMRtoOCsbBWNanonx81Zl50j9Ip5nu4D/j8iJEGUNHLkiIbRaDVLU3aE
	 fGUGhJgdfkTxwkAJo1WeySuxGRgPvfTWy4996ts5Y9iD4rtVk8XWLMA4KIVL305aRC
	 Xg5hIIdjAFZTeCbkHsR/5cfneOdBft2gV9gI+sq+u1SuJsSttQnsqJ2Z/Zrkd4LhNR
	 LVhUdfP0So/RvZlC9pRfxZoMt244Yw8lUaUJPL1n1z3LizhJTurWhpRyQsZmR47sOx
	 CDWCW3An8Pb42T4Y0elB504L5NTdsQo5CENGXQG3RVcVByrGoZJxSjiXmYZlL9+YCO
	 DTvYjqF2W7AGg==
From: Igor Belwon <igor.belwon@mentallysanemainliners.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	David Wronek <davidwronek@gmail.com>,
	Sibi Sankar <quic_sibis@quicinc.com>,
	Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/6] soc: samsung: exynos-chipid: Add support for Exynos 990 chipid
Date: Tue, 15 Oct 2024 23:02:03 +0200
Message-ID: <20241015210205.963931-5-igor.belwon@mentallysanemainliners.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241015210205.963931-1-igor.belwon@mentallysanemainliners.org>
References: <20241015210205.963931-1-igor.belwon@mentallysanemainliners.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for reading the chipid of Exynos 990 SoCs. Its product ID is
0xE9830000.

Signed-off-by: Igor Belwon <igor.belwon@mentallysanemainliners.org>
---
 drivers/soc/samsung/exynos-chipid.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/samsung/exynos-chipid.c b/drivers/soc/samsung/exynos-chipid.c
index 9e00ac8de5a9..94c7cc0d11e4 100644
--- a/drivers/soc/samsung/exynos-chipid.c
+++ b/drivers/soc/samsung/exynos-chipid.c
@@ -59,6 +59,7 @@ static const struct exynos_soc_id {
 	{ "EXYNOS7885", 0xE7885000 },
 	{ "EXYNOS850", 0xE3830000 },
 	{ "EXYNOS8895", 0xE8895000 },
+	{ "EXYNOS990", 0xE9830000 },
 	{ "EXYNOSAUTOV9", 0xAAA80000 },
 	{ "EXYNOSAUTOV920", 0x0A920000 },
 };
-- 
2.45.2

