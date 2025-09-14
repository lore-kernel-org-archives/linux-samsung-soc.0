Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C27BA26C3A5
	for <linux-samsung-soc@vger.kernel.org>; Sun, 14 Sep 2025 12:42:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757853766; cv=none; b=WS2b7G2/kyydeLG1IDlBx+P6u2k4E0vly5m3CiXpkXdMBQfrze6t59p+fSUsQEMjY3AhkYvitaqLfwlINYf+edUxs/wBxl+funhaeYpe2rRldjQd1EF1as4o7v/RRfxK30DPB7EdPP6ym8JxkiLSS5ZPVJZ6N3ALU7+rr/8GVE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757853766; c=relaxed/simple;
	bh=BohS/rc6qOfBI1KkyLNcfUimneuQ7sG3nV/JMTpWO3w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=g439PPhwx7rPKqHP+sI+8/uRdAJOqoX8qb5iHHrrYwsV1SYZa2UQV5uXhaJy7CbyPEs64bePCv1EwbsJITMcK7597G/bMxllL3U6Hcssc2GkxZPZLUVCel8J5tm3fiXDi2Tv7CCRgjJnSEfjW9r5FmD+jUl/7sXZpJxCr68CLCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=est7Cdnw; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="est7Cdnw"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3e9a9298764so394546f8f.2
        for <linux-samsung-soc@vger.kernel.org>; Sun, 14 Sep 2025 05:42:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757853761; x=1758458561; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gJlsN1Jaqy7XiIrMqRe29GOaxskmgZS6O5NApkSCPIc=;
        b=est7CdnwjfHJ8I8fx2plLYIVT8IyjZE2DFzVong6BRhvoA8lbrCXZFgcTdjDE0ooIr
         YZLx41m0N62rTzdEyAmn62YBdh0PRwYYu/2KAYTYwF202nTo6VB1nqctNgthAa7c/ikY
         oHbkd0hHAg1L31qsPzysIUkLz21GycWMbqbvo8rFidAkFP8TOTfIVWrvl41EokS53Gdp
         D4/H2zWhTZpHlnWlCHTjLcqbWTlWX1fzaqmr2r5INMtDgBJHi5dtnVSaBrowyAUss82E
         sZzjgjnfQnEFjMZAnYu+Q031Ld5x+endnHkbmXkIMkxPQisDTOmYZYPL0rvH1nZ35tmQ
         28fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757853761; x=1758458561;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gJlsN1Jaqy7XiIrMqRe29GOaxskmgZS6O5NApkSCPIc=;
        b=GUsQEieFuOA5MKZLhQUIBTsqdS8PHexLfvuflV7p+x5fYEILVO0qZhdr1sL7UOSXoJ
         ACzvmgV+6MVJ9Jg1JHS+ptSmTwla5DoUsmH246yOldpTOuU3OGLxCxRCspA80/Hjyo+H
         LAAgDEtKA/yb3wb5//UGEwEE8pyRdSalzjoTQAdciHob4m7QMvQXU/lawDCpAir4/D1m
         21iAxHEuCKNJRrrvAHuqbRIJEzb2PqJtlpGaa9TqD0WZn0wJRmHpV6PrqRnaHsv6Z/mw
         D1V/wB+WMCg2nfp+2b9ui1QebF7njqNwXAF2QpJcaiF1fmEWfvIfqk+Cj+SfsUxpm1fE
         8qrg==
X-Gm-Message-State: AOJu0YwrFs6ydZ1oPeCxcf11ou89lOrYn2ymbCB+BHn/3X/aNTcXKE/Y
	VtF50LuD/QJ5jAkhCRdLWgYZ3wJWcIVk5B80mWXVLSyR5ZcWddmZiVpM
X-Gm-Gg: ASbGncvRIG8nL0vm+WhR6+/JHBnfB7p+416rd57UFKA0FuNye46jNSXDGgAP15C4NcM
	j4YyqPPJLxIF+fI+crtNfd4UIR9YDf1BXFtwXSbqYGoEDLpgTqw8FxPjjuI91FyYKWEYkVTItY2
	vmVaLcNVrFpf2C/hb0RTowQLarohfe/KmU8SI4Ghka1HheoJcm4hgGIisN1PjoujP/Cxf5eolX1
	se5hIzAQ9lEm4oeJBLaCOCFqNOBd51EgXWHKmepFbmMhuMMsifj3MRE6yS96CubkSF2xMKDBJwo
	Rh5REE0iHXc31ZFNLCWwxORkmgj8B+JBgsGd2O/+BUzgoUs1ikLEbTCMLR8+4ITioy6uicgWD7k
	m8n0DyDfdzyDsh16hxn+GdSNZfFpQqArb8vERWLmPUH1oCQgI1ECBFu5J+R2v08VfdR3xTkZRNA
	==
X-Google-Smtp-Source: AGHT+IEXZd7reUDziErOplgPo67Tm47g/zLW7Hg9UIF0v+P6mjh3cSDXIBSb4wSjeIaZ8c6Ls42mhQ==
X-Received: by 2002:a05:6000:2504:b0:3d2:9cbf:5b73 with SMTP id ffacd0b85a97d-3e7658bc950mr7945343f8f.6.1757853760855;
        Sun, 14 Sep 2025 05:42:40 -0700 (PDT)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e9511abbccsm3727773f8f.9.2025.09.14.05.42.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Sep 2025 05:42:40 -0700 (PDT)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	=?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 3/7] dt-bindings: clock: samsung,s2mps11: document the S2MPS16 compatible
Date: Sun, 14 Sep 2025 15:42:23 +0300
Message-ID: <20250914124227.2619925-4-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250914124227.2619925-1-ivo.ivanov.ivanov1@gmail.com>
References: <20250914124227.2619925-1-ivo.ivanov.ivanov1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The S2MPS16 PMIC, alongside regulators and an rtc, provides 3 clock
outputs, just like most of the other S2MPS PMICs. Document the S2MPS16
clock compatible.

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
---
 Documentation/devicetree/bindings/clock/samsung,s2mps11.yaml | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/clock/samsung,s2mps11.yaml b/Documentation/devicetree/bindings/clock/samsung,s2mps11.yaml
index d5296e605..e1666fff0 100644
--- a/Documentation/devicetree/bindings/clock/samsung,s2mps11.yaml
+++ b/Documentation/devicetree/bindings/clock/samsung,s2mps11.yaml
@@ -13,7 +13,7 @@ description: |
   This is a part of device tree bindings for S2M and S5M family of Power
   Management IC (PMIC).
 
-  The S2MPS11/13/15 and S5M8767 provide three(AP/CP/BT) buffered 32.768 kHz
+  The S2MPS11/13/15/16 and S5M8767 provide three(AP/CP/BT) buffered 32.768 kHz
   outputs. The S2MPS14 provides two (AP/BT) buffered 32.768 KHz outputs.
 
   All available clocks are defined as preprocessor macros in
@@ -28,6 +28,7 @@ properties:
       - samsung,s2mps11-clk
       - samsung,s2mps13-clk # S2MPS13 and S2MPS15
       - samsung,s2mps14-clk
+      - samsung,s2mps16-clk
       - samsung,s5m8767-clk
 
   "#clock-cells":
-- 
2.43.0

