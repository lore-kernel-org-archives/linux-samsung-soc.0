Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5358B3570DF
	for <linux-samsung-soc@vger.kernel.org>; Thu,  2 Apr 2026 03:04:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775099093; cv=none; b=ZqpWlYUggnNwHHEUvUiFRlQ10JgyRzYS4+dIjCtbbDKmBGMKrNFLe+506cN5jS3oec4/WKAuedB1X7RfTU+bVA+akPxqtm52tQ8v4vBsYfeMfi7Ysqd/yetL3S+BnGRyV6+OTknLTTbEKmKfnboo9RB0s7yFUDJdDmVik4KtCcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775099093; c=relaxed/simple;
	bh=lOIwL05Tz/flXBhzxXOkVqAstofU9cbqGe1LI+AkESk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eAY/aaRrOf7zfMBcu/i85TN93d/NOhbOi3FNXh9iC6InVsWz1isnGKVQUaotfNkQMjvnCrlh9cdtc0juwxeKDrvBp26T7KA2m7+7V3O/c8PdqtUFxe0+agE2EWZEgATjmWCTlPGqO5dW9YWm1ROlYdPHaEOF0SoiNU/rR1RTP1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Cu9th0+2; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Cu9th0+2"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-35d9c7bf9a1so286207a91.3
        for <linux-samsung-soc@vger.kernel.org>; Wed, 01 Apr 2026 20:04:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775099090; x=1775703890; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kHHx3XxBCiRn9ZL9C1k6EVrQcl+iP3VVeW/3ubciWys=;
        b=Cu9th0+2uq5EoV8xq4AEIuNwgMuHouv4NdTJgh1z/yddMjEWh/K/dZwY25PZ5xrwFv
         2l+dnMWxcINZjlF4RlTGBCZNunM5FGNplOv3ygv6mcV6fGca/IAJQG7DcP2RP0I2xfm0
         jXP2rzgbKRzhNCfx8dt8757A9AWij7nxScSTOBy/bDLHwi8K8CF/kf2LNJxYMI3qEMcN
         twnB/1toOjCOtWv0nQrcYHHAHBNDuQJ5fFhlQEnhHXUKQiiJgMaLYFeOYo1B1sOZs8vt
         coIgnMxf7YeeP5p77xXFKu9FT6ZBSYiEwClI0Ji1LbFLi7Tu/dG+B3+jnoHG5ABA+fcp
         +oSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775099090; x=1775703890;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kHHx3XxBCiRn9ZL9C1k6EVrQcl+iP3VVeW/3ubciWys=;
        b=rI9fL6+s0NAPGrvgUM1hW4b/hvSy35L7ihMNXqCOXxnZAATj0l8U0McfmV5uNbX6tz
         q59658aoFUwVDYNbUEMSoKGA+4Fxqy4mvTlKWpkyrlaTemBQc6C1/TPEIWDy2HGgk2mH
         mrMhP4CC3C7iZwlH3OF0zMItgfz69g7YWbjMzBiAVEMkwAa6u5mlVUOjae4UdhgpUbFe
         SKpuE0PwmGJQ4qNhNxVBlNZrHiMcmGIe5VheYMyiCKW2Gagbxj/qfn4PRTuvTdvF0du3
         0BNQAY7cu76MMBuHnb1OTxNo1ZYUsYT9CMJxZ+AL31e1gydlMmBwfqBKwEha+MM03Tvz
         HXgg==
X-Forwarded-Encrypted: i=1; AJvYcCXVgiTTi0rASRbndEMyeUnA+lpLlC89i6sg++XWjFA/FuHkh2R69jpeyAu/Kex+LIQ7KmLWRWppIvQQtB/18CGtog==@vger.kernel.org
X-Gm-Message-State: AOJu0YzJEoWYYD4HtYgg4mr8eBNy4ZfrOWpN2GluEzpT8wNL5g2yeyeA
	xT1j7jP61zaDA3rIyNyUc4BjXgEpeK0OY4uiuWG89b9o7z2w9F3/smbN
X-Gm-Gg: ATEYQzxXgh9m7mBsW+w1RJ74l38DKj7i+UizEpQwTp3jSByBTx4WbtcW73CLj9/bpGG
	cf3Cf3YWBQwSkeqthGfdQLV9Sas90V1dBOIhnQpu7b7oJwBH2FuK6OmwY0ibbuI9a0nQnV3IDSa
	fCL/vjkyHuzqjZlw8tStso5LKXIoggSRs1TriT/fDn1MOVTDkjJVO/L6fwdLeymx+Kz2LTbzQN5
	ayU4RJfjUvstXCma7wlo9Qq4Me/F3/hRGQ7sPCE+14pgivkTHpeBvCsaAN8LUHkxfDFqPElSEFN
	GKJpH9zMyvMI4PPRRoM4MxL2b6puluGobF5dvUBEXxBzO9xMW5W3XNUOM+ENTCQGcSXDNOW6cXG
	fY88TxqO2xXtUdQPXk6x1N+dxh3aU76Oh0sLdRqtw9rKVyUA3iVsyvUS4m2ByCi1xAUW3ni3DAp
	iWTQXI6uV9uDnFbbDvw7QI31uPHw+mi81/58FJK4SmKRrpozxU5FW0BqY=
X-Received: by 2002:a17:90a:c110:b0:35d:a276:a880 with SMTP id 98e67ed59e1d1-35dc6eb03bamr5152954a91.10.1775099090124;
        Wed, 01 Apr 2026 20:04:50 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d::8bd])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35dbe9379f3sm6395873a91.9.2026.04.01.20.04.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 20:04:49 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-clk@vger.kernel.org
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-samsung-soc@vger.kernel.org (open list:SAMSUNG SOC CLOCK DRIVERS),
	linux-kernel@vger.kernel.org (open list),
	linux-hardening@vger.kernel.org (open list:KERNEL HARDENING (not covered by other areas):Keyword:\b__counted_by(_le|_be)?\b)
Subject: [PATCH 0/3] clk: samsung: use kzalloc_flex
Date: Wed,  1 Apr 2026 20:04:29 -0700
Message-ID: <20260402030432.101066-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Switch three structs to flexible array members to combine allocations.

Rosen Penev (3):
  clk: samsung: use kzalloc_flex
  clk: samsung: cpu: use kzalloc_flex
  clk: samsung: pll: use kzalloc_flex

 drivers/clk/samsung/clk-cpu.c | 30 +++++++------------
 drivers/clk/samsung/clk-pll.c | 56 ++++++++++++++++-------------------
 drivers/clk/samsung/clk.c     | 28 ++++--------------
 drivers/clk/samsung/clk.h     |  2 +-
 4 files changed, 44 insertions(+), 72 deletions(-)

--
2.53.0

