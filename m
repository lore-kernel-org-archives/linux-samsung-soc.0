Received: from out-03.smtp.spacemail.com (out-03.smtp.spacemail.com [63.250.43.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E332A20823B;
	Wed, 16 Oct 2024 15:48:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=63.250.43.88
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729093703; cv=none; b=eWsnJ2pOkoj+O/VqgUIEQ2cvoeBwWf5oinhj7eQGAVjEVoulhKmiSztrnvToIa8cdaXgzxnGetMJcz04LodoPV+uJTgRCz1E2BmLLJ/V5Rn1OT2ZOyCAuADQUcW70x56XR34HHwHehCuTdbYXh/bwPbwcCEHhDx84KAxVMY8fYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729093703; c=relaxed/simple;
	bh=g9ygpDKyS8tAdx0p0uvQx/Yca2s4613LUY/AYHZ8um8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Z3SlfSDQwPy/fCJai0B2/kRbxuS4JkS9MMMl8ParchfmjvMFwTqd7yBjCM5sR0cjn+5Cm1RwZri+1pRkGWK944DqTlmtpaYFhwFN+V/C/lDN1ejd9+bcUtio+ylsWx9LQ+tw7WU7EvyZd95/6a7LogSZ6+e2u3lN34iT2+fIrLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org; spf=pass smtp.mailfrom=mentallysanemainliners.org; dkim=pass (2048-bit key) header.d=mentallysanemainliners.org header.i=@mentallysanemainliners.org header.b=V/AvDbfU; arc=none smtp.client-ip=63.250.43.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mentallysanemainliners.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mentallysanemainliners.org header.i=@mentallysanemainliners.org header.b="V/AvDbfU"
Received: from prod-lbout-phx.jellyfish.systems (unknown [198.177.122.3])
	by smtp.spacemail.com (Postfix) with ESMTPA id 4XTFjw5ZRwzGpTw;
	Wed, 16 Oct 2024 15:48:20 +0000 (UTC)
Received: from igor-systemproductname.lan (83.8.245.91.ipv4.supernova.orange.pl [83.8.245.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.spacemail.com (Postfix) with ESMTPSA id 4XTFjn47Rqz8sWN;
	Wed, 16 Oct 2024 15:48:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=mentallysanemainliners.org; s=spacemail; t=1729093695;
	bh=g9ygpDKyS8tAdx0p0uvQx/Yca2s4613LUY/AYHZ8um8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=V/AvDbfUD9e8gfk0NF16ethaP0KRBX92TqmvTneF/41yjvAwz8WES1azxpHrU7Lvr
	 KS1cRWnBLsf++LuzmTx3R6nnz6cQzsOU1qmqZjtTRovZm+HN7HRO4MRG79kuPMfjZE
	 dvYtTryu/ncFil+LSrN3NKjR4tfVpdMbzpyVWV0LldItQB8Vjs+tnmtXEEfoKGUrFS
	 Xez4yFvl6DMKGLrQSeFdjpEiuQCwzc9i6i8EJ3Ob+H29QWBqxtmuWstXVAp0HXuNYH
	 aEswqmYcMGqV2NX2qxsVLDXn687hubaHvF7imLeFYLr1sFfAlZ4/yWNyKuX2gX5Vv0
	 v7AP04KTG056A==
From: Igor Belwon <igor.belwon@mentallysanemainliners.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	Igor Belwon <igor.belwon@mentallysanemainliners.org>
Subject: [PATCH v3 4/6] soc: samsung: exynos-chipid: Add support for Exynos 990 chipid
Date: Wed, 16 Oct 2024 17:47:45 +0200
Message-ID: <20241016154747.64343-5-igor.belwon@mentallysanemainliners.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241016154747.64343-1-igor.belwon@mentallysanemainliners.org>
References: <20241016154747.64343-1-igor.belwon@mentallysanemainliners.org>
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

