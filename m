Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10E711369A8
	for <linux-samsung-soc@vger.kernel.org>; Wed, 11 Dec 2024 03:30:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733887831; cv=none; b=QNYpXF8/6pPGg1THkJYTxZvNo1R9wnM5QcyxUNCpYOg6TC3q65ZNUMlpHbcbI03qI8fl2R0/UPgOWV9H5aDUSSy6q8zpwUadBqg5LM/Rem5LLz+CBW3/bSk/4kaNTX4vYI0MtpOv5H9TWIhWS83iD1IwiqtLlojMCflGFHHz8rc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733887831; c=relaxed/simple;
	bh=KPVIZUaYLPhhu+NT5yPD4CmhA0oRk+MtYTE4fN805/4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=oA/KRRpwp9gfpf0Q3RPb4gFJy0CJgMnkb35aTjAQknxAr6i92jbpUkMabzEwmFxbyNGdQ2CFVTmLDTX2IxV4Bf3wM/Ig7umrXz6vJEWZrsgxY17KXhc57mtfKEvb0D+lsYFrFTE9LQO4zm6EibGF5iloqH9JzvPAiYKubOjhUiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vMATBJWx; arc=none smtp.client-ip=209.85.210.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vMATBJWx"
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-71decc7de4eso815384a34.2
        for <linux-samsung-soc@vger.kernel.org>; Tue, 10 Dec 2024 19:30:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733887829; x=1734492629; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=v+SqWvKMXn53ySqihikLvjixvoulHaOpfvaW+kjjCzk=;
        b=vMATBJWxEVpJYR3+JJayfGyyJYnULB8Bi28j+3caQDRLzYhIbPUDi3K5bqgcI7pc8Z
         EAzgqLqKPTH/Kp3awp57sb5Wy+IYW2hgHKyD3PvhoeA30mO4aERHVKOMmo3hRP+T7JUF
         Bz2fmwZPv5iF0yxKmcc47mX6/c7U9jLSGUDkli5adfVNztKsnlM1S8JRmJd6+9cVATxk
         ilnUrTGzpKtilB9JI2fq1qlCq60xX8Lns/hc2NKegVe8LL1NgqZEcMqXzMo31OyUOfYu
         NmemYMO4eQprDPG1VmWhAjMjQ1ztOdfhyz1C0shrL8fhCmitE0BgIVCl7dGQXml9sSgn
         F/1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733887829; x=1734492629;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v+SqWvKMXn53ySqihikLvjixvoulHaOpfvaW+kjjCzk=;
        b=fFzUp1/5WTV+m5cPhOoTd6tuUBz+c2OIMlLh8WBNyZlvLXQVOxTCLNCAAX0ggI2vtr
         oXxN4zmyuC759jZ7ObpwEZCzhZEgJGFfdbo/zLXSyX7gugaLUo1v9dWpivMgGoInoycx
         T13DZyQ1DTUWzZxE+XMACtu5Tp2YNQADZNf/VZJUzXsHrcRtEZ7f+pP4XCZH0dWrNmrA
         WMim1PjzNjwMEoThaK5B3QY0GAMGvIowEHpvohzst4b+wtgptv8kShReysc4ZhXZRzDH
         KQhAkTIFDBJMChA/5+WsI7OO4dA6aXgL97B1zvIsWNiG95l3uRMmqZsfoX64itHvbxFU
         du8w==
X-Forwarded-Encrypted: i=1; AJvYcCUasIccTdNgrEtQh553+1JFJgbjpKbtP8Lc6wVQJOCTnWu9QE01fRAkigoBMs2mNin1kmCQxg9jbASNSR6r1nwpwQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw30Sfi/BttsxlZRzJYcB6CLM5lMgHuwLfoQcVW84K1S0RFy7Sd
	Ux4CMPL6cnl5EAvqURGaZmMl7f7iZzbp8SPyJ9ISJR38EQ2LfuDp6TAWW6jr3NA=
X-Gm-Gg: ASbGncucWiTQcniG/LEEwN3yPM5N2BbpwJJrGtaj7kQa16/wb06jIwRwr5yBLgBWo58
	PN8S+7kgUuw5dR81KS68fvhu0xjJEnZ7nV5rpuB+OxLxR8TnqboN1JAu9fUFRk+GTIgd21k34ng
	06P0eAHqrPFBC68emFnjLQ5KveMGnmj5E6n9cHka4dMuDCpRpZZukN4RnjaKgRBS0KSSyWbfzXj
	QCoiC5umw2z1R6NGVZpRhanOYYhIbpTbu2viEe1HDAvc3mbNndSoEmiKqc=
X-Google-Smtp-Source: AGHT+IFxuwtOuX7RSi7QuMnWBVAHW2v93lQ0WBBx/aGpBUEB+zUeX9kV14JIgbiv2kahMG99yLppvg==
X-Received: by 2002:a05:6830:25d4:b0:717:f701:4842 with SMTP id 46e09a7af769-71e19b5ac55mr619830a34.28.1733887829115;
        Tue, 10 Dec 2024 19:30:29 -0800 (PST)
Received: from localhost ([136.62.192.75])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-5f2c472a028sm996004eaf.33.2024.12.10.19.30.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 19:30:28 -0800 (PST)
From: Sam Protsenko <semen.protsenko@linaro.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: exynos: Specify reserved secure memory explicitly
Date: Tue, 10 Dec 2024 21:30:27 -0600
Message-Id: <20241211033027.12985-1-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Instead of carving out the secure area in 'memory' node, let's describe
it in 'reserved-memory'. That makes it easier to understand both RAM
regions and particular secure world memory region. Originally the device
tree was created in a way to make sure it was well aligned with the way
LittleKernel bootloader modified it. But later it was found the
LittleKernel works fine with properly described reserved regions, so
it's possible now to define those in a cleaner way.

Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
---
 arch/arm64/boot/dts/exynos/exynos850-e850-96.dts | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/boot/dts/exynos/exynos850-e850-96.dts b/arch/arm64/boot/dts/exynos/exynos850-e850-96.dts
index f074df8982b3..7d70a32e75b2 100644
--- a/arch/arm64/boot/dts/exynos/exynos850-e850-96.dts
+++ b/arch/arm64/boot/dts/exynos/exynos850-e850-96.dts
@@ -45,17 +45,9 @@ usb_dr_connector: endpoint {
 		};
 	};
 
-	/*
-	 * RAM: 4 GiB (eMCP):
-	 *   - 2 GiB at 0x80000000
-	 *   - 2 GiB at 0x880000000
-	 *
-	 * 0xbab00000..0xbfffffff: secure memory (85 MiB).
-	 */
 	memory@80000000 {
 		device_type = "memory";
-		reg = <0x0 0x80000000 0x3ab00000>,
-		      <0x0 0xc0000000 0x40000000>,
+		reg = <0x0 0x80000000 0x80000000>,
 		      <0x8 0x80000000 0x80000000>;
 	};
 
@@ -146,6 +138,11 @@ reserved-memory {
 		#size-cells = <1>;
 		ranges;
 
+		secure_mem: memory@bab00000 {
+			reg = <0x0 0xbab00000 0x5500000>;
+			no-map;
+		};
+
 		ramoops@f0000000 {
 			compatible = "ramoops";
 			reg = <0x0 0xf0000000 0x200000>;
-- 
2.39.5

