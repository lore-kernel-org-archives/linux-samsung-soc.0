Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 032063C140D
	for <linux-samsung-soc@vger.kernel.org>; Sat, 13 Jun 2026 05:20:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781328031; cv=none; b=gDHqIFIo9g9aF3XVqtdG6cgsGxyQVp1XDtb4eogpqqGxAViOOnL4TaWKqhC+D/klmzjEs+FRUXvobExR9gdWEDVuvcPIm1Wu8j0M6oyid1RGUcUf/utm/fpg3VxRqst89kZuUYU5E/xNmT2k1PckhypBYK7BP9PayVTrSsdQAHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781328031; c=relaxed/simple;
	bh=9C+9acoU6g7lVamTfAReYE056+Mo4L19daujFjjLyxE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=u7JID2OPQpDZyE57sumNqQkb+fPFt9txQdC6aKptzsxhSf/JkWagCxUErWYTI5L9o8SVgeEAgvgqbevbZiKDKteFKl2lSH2p0Lqjz737DH2RQtPYcNJe2ONb7KBC2+HsnEeQmPL5oAUDPNx9DX2ajb+KtoCwaR7vTtvBpdBcClg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YqkEf2af; arc=none smtp.client-ip=209.85.221.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YqkEf2af"
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-59d6e44e5c8so1194428e0c.2
        for <linux-samsung-soc@vger.kernel.org>; Fri, 12 Jun 2026 22:20:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781328028; x=1781932828; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=U/CLZ+5qQK6nv7unT8PtYK68qrCmHhJFocTHGDo1YqU=;
        b=YqkEf2afuLBjIUD5wNsFTd28l/lznIL2zn4hL5yR7Bwv7KutC7JbiX1AeUjpQtS4Cp
         85G1fE34/Fw9oaoslAIV5u/AtlUVGmsKj2tDuOztf5DP3EAPcBQsAjOwgcd7kAc9MK76
         GQqS+dixjNWGw8TB6R7yuZS50SacBNxwpcFJjT68Hv4DXzwgh/RDjbIipPdR3vVoi6K7
         dqRylJDdUDCEVf6QAIEmjQzrz+8LxHdtsorCofLx53BO9ZOAzv25WZRFrP3gvGayfBkC
         amwcb4NOSBvpFYyzuD/qSewI3KBWg6DThFD6lXPuCMJgaabd6Z8IRqO73I51jwRxZuFz
         /GEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781328028; x=1781932828;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U/CLZ+5qQK6nv7unT8PtYK68qrCmHhJFocTHGDo1YqU=;
        b=VsstbJ5Lyw5p+Lqi2AD3xEVT6WJz3pbj1Bmr6TxPOqbAPuz2+cvBQjXBKaUisCYJgr
         GbQRiAB0AompnFWy2oYUSPfpAeuTL2XvE5JhH0cfTYdYPcpTcsReS4iicXY+VEaJTKKF
         wsZYgB8KJxlSKDTD35Le3pNyTA6GWmsBXlnZFV7LFuYWhwvo1P5rkByqJFreiGnRvhSB
         xtm0R7Yb7I6BUCiM8Hp5r5SBI8DjCjOSMm0fHQjkUMt0Jxi8sqPexDBQ30t94hUPPWr0
         ELw8eHCIDZrwlRivk9PVTUrzLUCIxbTLJ2AkyLy4l/rECwPrOFUv6mZVj7rpTgMsU9Ru
         r9ag==
X-Gm-Message-State: AOJu0YylbKFsfU4lKTb94glzJPZd8F1VlCnXIghreik8Gz4TOfHJ6kJE
	R3W4Q6VNdLQIf0qfAFzTdtZ+rVwhCui6edfbzAXyEQPSPcaKqcFXbVsS
X-Gm-Gg: Acq92OEtSaYlzBADMksOCi9ewafye8mpHV8NaE8b1oCgH0dAODApcsT3PyZ3I70Hf4I
	IP2UetiLX+a9Jx+7x9CZJ0Ho+pilIrmmvzuIhseU35HeTPbbxxrAom2qgehLvpavXAiSxfqOqjw
	UtK8nSE12pJ+ALxHVhnjHJgAAh/n6j9znAOubvuDupp8/VR0iYjyOQdFMwPUiNtADPBpGKQbcYM
	6R29mRPCbg6JIeP5UryCYoQtvcyxXbncNtLTi75sKd7dzkoNqmdNPhzQ3ZDbu3TkW24HuYCF5IH
	hVSCfiqG0q04uBESo4stdyJV9sG00A+b7W64kCiFoSRQ71FxImf2vchniQ2zO7+uDBaFTKpbwwC
	CQCTOV+F/V3rsRZ1vNRb6i0afHE4G7CUBa6I6kL2TXu3hPxYGVgx9BQYdOSwj/1Ms8U/k6Gq6hX
	McgpvayIBCKb73VxRvbZjdR/wUTAvQ
X-Received: by 2002:a05:6122:4204:b0:56c:3a57:aee2 with SMTP id 71dfb90a1353d-5bb6c001fddmr3552398e0c.6.1781328027844;
        Fri, 12 Jun 2026 22:20:27 -0700 (PDT)
Received: from [127.0.0.1] ([38.252.222.136])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5bb69014308sm4848692e0c.7.2026.06.12.22.20.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 22:20:27 -0700 (PDT)
From: Denzeel Oliva <wachiturroxd150@gmail.com>
Subject: [PATCH v2 0/2] clk: samsung: exynos990: Fix PERIS gate clock
 parents and add TMU_SUB
Date: Sat, 13 Jun 2026 00:19:50 -0500
Message-Id: <20260613-exynos990-peris-fix-v2-v2-0-3dff7ade75b3@gmail.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHboLGoC/yWMywqDMBAAf0X23IU8IBB/pfSg6dquhxiyKhbx3
 13tcRhmdhCqTAJts0OllYWnrOAeDaRvlz+E/FYGZ1wwwXqk7ZcnidFg0VJw4A1Xh8HG5Dtveh8
 SaFwqqbnHz9efZelHSvN1g+M4AQ8UKgN6AAAA
X-Change-ID: 20260613-exynos990-peris-fix-v2-619c3a30b36c
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Denzeel Oliva <wachiturroxd150@gmail.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781328021; l=954;
 i=wachiturroxd150@gmail.com; s=20250819; h=from:subject:message-id;
 bh=9C+9acoU6g7lVamTfAReYE056+Mo4L19daujFjjLyxE=;
 b=fqNIjsE723ylk8j0/JzkxKuIjpTKFRODde0FklYKkmT158zHx150PVaaryeNmpJCGmx+6lS99
 9PAJFBwCkZ4Bwe267t1dckNnAYv4pOVr4zr1DpoTDCKAEQiCY6X2cEC
X-Developer-Key: i=wachiturroxd150@gmail.com; a=ed25519;
 pk=qNvcL0Ehm3chrW9jFA2JaPVgubN5mHH//uriMxR/DlI=

Fix PERIS CMU gate clock parent mismatches and add the missing
TMU_SUB_PCLK clock.

Split into dt-bindings (clock ID) and driver (parent fixes) as
required by checkpatch.

Changes in v2:
  - Split dt-bindings header change into separate patch (1/2)
  - Driver fix now only touches clk-exynos990.c (2/2)
  - Add proper cover letter

v1: TODO-add-lore-link

Signed-off-by: Denzeel Oliva <wachiturroxd150@gmail.com>
---
Denzeel Oliva (2):
      dt-bindings: clock: exynos990: Add CLK_GOUT_PERIS_TMU_SUB_PCLK
      clk: samsung: exynos990: Fix PERIS gate clock parents

 drivers/clk/samsung/clk-exynos990.c           | 24 ++++++++++++++----------
 include/dt-bindings/clock/samsung,exynos990.h |  1 +
 2 files changed, 15 insertions(+), 10 deletions(-)
---
base-commit: c425609d6ac4012c8bbf01ec2e10e801b1923a7b
change-id: 20260613-exynos990-peris-fix-v2-619c3a30b36c

Best regards,
--  
Denzeel Oliva <wachiturroxd150@gmail.com>

