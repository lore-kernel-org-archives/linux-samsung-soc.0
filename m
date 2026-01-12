Received: from mail.mleia.com (mleia.com [178.79.152.223])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 162E972617
	for <linux-samsung-soc@vger.kernel.org>; Mon, 12 Jan 2026 21:15:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.79.152.223
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768252559; cv=none; b=UQlTYxuKYo1pyaLf3JayPo7vTkUcaP90yqcOx4sKf4qqFYv2mllJUqRK8vGQdr4kkdky1c8FQiGr8EB88AMl8BCkEZk/vF2hKQcgm5nXNkDHsW8g+v2l2cQGphwODXeZkWoIypDW0TTwWsCWMJxN+kBvrO1Eb09F0lebzTJ8nZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768252559; c=relaxed/simple;
	bh=rWb3SpOfrjZZ6el4MNTV0Ke40BroBOS7IsFzl8PiMe0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AlSMxBoqEtXlxiPgyQMJLGALe3/EtSZC64XbpL0M+iyLNYriuFkborzkZVpow9GLYsc4U7BaI4hj6gaOfg0KHioaNTokgs5ZWrDxzKY5lnefzx82UZKUx6UT6jnsVEZbqJo6HWCKBupjF1TVGUZcpNP6GTfUDHILCav7WxdObiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mleia.com; spf=none smtp.mailfrom=mleia.com; dkim=pass (2048-bit key) header.d=mleia.com header.i=@mleia.com header.b=B3aIr83g; dkim=pass (2048-bit key) header.d=mleia.com header.i=@mleia.com header.b=B3aIr83g; arc=none smtp.client-ip=178.79.152.223
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mleia.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=mleia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mleia.com header.i=@mleia.com header.b="B3aIr83g";
	dkim=pass (2048-bit key) header.d=mleia.com header.i=@mleia.com header.b="B3aIr83g"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1768252556; bh=rWb3SpOfrjZZ6el4MNTV0Ke40BroBOS7IsFzl8PiMe0=;
	h=From:To:Cc:Subject:Date:From;
	b=B3aIr83gKqLA7r3LFwP7luBLV2j0twHPV/RnkY3hD5GLhOm5uqE6FuKPvsOvXDmg7
	 ZbaaJxaRkBRNxR3TNjLKSicnVeqJnu9NYiAKyLY/by45Tme/AahNwc+/MeR/5kvz1r
	 YX9Irn6y7PeZSGo5LiKvwODW/5cJvtFDKCtcToKze5eOvY0Epj5WAU4tCkq/vnU3BW
	 a6WRIzpjEMVK9koHzG/ajV9BPlYQyByozG+PJ4yellznlr238SkkD8ZQ+JEy8xMozM
	 M90qRfY5k467nnzYFVohHD2/NEidMrg4yoT4f0WJN+HNkpLT2rdVMgaPeKtpHdd5Tg
	 vBNa4cNIFDWQg==
Received: from mail.mleia.com (localhost [127.0.0.1])
	by mail.mleia.com (Postfix) with ESMTP id 717163EC06A;
	Mon, 12 Jan 2026 21:15:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1768252556; bh=rWb3SpOfrjZZ6el4MNTV0Ke40BroBOS7IsFzl8PiMe0=;
	h=From:To:Cc:Subject:Date:From;
	b=B3aIr83gKqLA7r3LFwP7luBLV2j0twHPV/RnkY3hD5GLhOm5uqE6FuKPvsOvXDmg7
	 ZbaaJxaRkBRNxR3TNjLKSicnVeqJnu9NYiAKyLY/by45Tme/AahNwc+/MeR/5kvz1r
	 YX9Irn6y7PeZSGo5LiKvwODW/5cJvtFDKCtcToKze5eOvY0Epj5WAU4tCkq/vnU3BW
	 a6WRIzpjEMVK9koHzG/ajV9BPlYQyByozG+PJ4yellznlr238SkkD8ZQ+JEy8xMozM
	 M90qRfY5k467nnzYFVohHD2/NEidMrg4yoT4f0WJN+HNkpLT2rdVMgaPeKtpHdd5Tg
	 vBNa4cNIFDWQg==
Received: from mail.mleia.com (91-159-24-186.elisa-laajakaista.fi [91.159.24.186])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.mleia.com (Postfix) with ESMTPSA id 0CAE13EBBA0;
	Mon, 12 Jan 2026 21:15:55 +0000 (UTC)
From: Vladimir Zapolskiy <vz@mleia.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] ARM: s3c: remove a leftover hwmon-s3c.h header file
Date: Mon, 12 Jan 2026 23:15:54 +0200
Message-ID: <20260112211554.3755188-1-vz@mleia.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-49551924 
X-CRM114-CacheID: sfid-20260112_211556_491810_99F387F1 
X-CRM114-Status: GOOD (  11.66  )

The last user of defined structures s3c_hwmon_pdata and s3c_hwmon_chcfg
was removed in commit 0d297df03890 ("ARM: s3c: simplify platform code"),
thus the platform data header file itself can be removed also.

Signed-off-by: Vladimir Zapolskiy <vz@mleia.com>
---
 include/linux/platform_data/hwmon-s3c.h | 36 -------------------------
 1 file changed, 36 deletions(-)
 delete mode 100644 include/linux/platform_data/hwmon-s3c.h

diff --git a/include/linux/platform_data/hwmon-s3c.h b/include/linux/platform_data/hwmon-s3c.h
deleted file mode 100644
index 7d21e0c41037..000000000000
--- a/include/linux/platform_data/hwmon-s3c.h
+++ /dev/null
@@ -1,36 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-/*
- * Copyright 2005 Simtec Electronics
- *	Ben Dooks <ben@simtec.co.uk>
- *	http://armlinux.simtec.co.uk/
- *
- * S3C - HWMon interface for ADC
-*/
-
-#ifndef __HWMON_S3C_H__
-#define __HWMON_S3C_H__
-
-/**
- * s3c_hwmon_chcfg - channel configuration
- * @name: The name to give this channel.
- * @mult: Multiply the ADC value read by this.
- * @div: Divide the value from the ADC by this.
- *
- * The value read from the ADC is converted to a value that
- * hwmon expects (mV) by result = (value_read * @mult) / @div.
- */
-struct s3c_hwmon_chcfg {
-	const char	*name;
-	unsigned int	mult;
-	unsigned int	div;
-};
-
-/**
- * s3c_hwmon_pdata - HWMON platform data
- * @in: One configuration for each possible channel used.
- */
-struct s3c_hwmon_pdata {
-	struct s3c_hwmon_chcfg	*in[8];
-};
-
-#endif /* __HWMON_S3C_H__ */
-- 
2.51.0

