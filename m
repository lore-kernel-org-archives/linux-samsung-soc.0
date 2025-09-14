Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BE9F1D6194
	for <linux-samsung-soc@vger.kernel.org>; Sun, 14 Sep 2025 13:22:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757856129; cv=none; b=SAYF2F3Y5dHDaOY0li5Ez+0ng60whPc4HMQQ+PhYh0UofXFt7AXyyfSdrnwLSHPADkk4lu/fUvhTZckRXQsJGAWxWPfOJuMfwJm3OjqUWhYFzeRVaEQAbc/XKv14isW+ywcrjmls5H6RS4/ROE5wo3btQmhj87X+kaZNjfycBvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757856129; c=relaxed/simple;
	bh=D+jsMAX5sO7tM7JCwP4lIE5kV4IK9JY+U63ovtSevuw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bN5WtXzISa6Fr1ZfkGIUzB2d0DnwA5CPgyPCAaxY7ULSYooAAvwskfEd4PG/qqFJc3U/wugTDVxmdAO0fNobegyjYrdEQbbBXQgTCvdXatXZNzDv+I79xs1Yy14iRQTDzz6UEjD/EEuNaXy9V3QpGiEzk99AIZqAli2RK217zls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H6+UKgGD; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H6+UKgGD"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3e9ca387425so339273f8f.0
        for <linux-samsung-soc@vger.kernel.org>; Sun, 14 Sep 2025 06:22:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757856126; x=1758460926; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0gwU2jvcuEz7Zmi2rF3iYuLef34+LUaEBtsQc2TxOPc=;
        b=H6+UKgGDXpBjQelfL2yrkcSgIbnVCS+reMOREteoSOhB3VOXmfwkqpmxu6Ie1x2Jlt
         fig6llTKXCF8mTRU3fqhvxdLwgTkh1rhNwlHmAggvKNNZdI6MKIqh/9iA7ZPMIaNrvsu
         6X0nQAmqwhGAG/H+jFULf5xVHCzmjRnC5aeXCaY1R51sQp4ojphTqJKVOdqwWozY1mdb
         8J3kflnotSEtcUFJfqyFKOvh9AMj5mXB4tSsMPUzZE/OEmI+XrshBMF2B1lls6hZ0vvT
         9FZezbDrWkETuSQnUS4rghdibCXtvvSQj/0i7zSXgljhX/ZVIJHAv+CeWge7mhhScu5E
         fYUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757856126; x=1758460926;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0gwU2jvcuEz7Zmi2rF3iYuLef34+LUaEBtsQc2TxOPc=;
        b=mDlSPie02dDDvg/XaCHPb2L+hB11zttHvvHaSr3DgBcCgdqdhfW5rjcHVu83du2T6X
         eDUBkobaltSQn0st8c4nlA7liHyPmrA4uy/PqqpJXUFFCmP1A2h8dZHQloxm6DkdmkPx
         NvrB425l2qpdNTRTZc11J0TMvG7lTgzj5lAYB0grFpDAhOeKowoFriLHx2skgqcb3K8Z
         CBxKeiu9CanSvrCz+MqMtnr8veBYk+WBL10XvgtS3uKNa0GIuEqfqaDTlgvSoLmgYRUj
         sVIEnEq8BPnj7CpgabYHg7YgqrqBagldm9m7+nergD1npBQa/eLG/DbTitUSdK+DnZ36
         4QuQ==
X-Gm-Message-State: AOJu0YwTPYMb9+JoSjc6jlhmcHnAk6OhWJiuhTHU0CsK5uDRarzlsvTb
	l1uvZYxQWih13hJyUKrswkuGED91lc4h8B8CFqSfB1/NwmzxLfLGk+Ql
X-Gm-Gg: ASbGncv4QXJ3ihA9HAgNpx0koSt+aKr0qxe/g/muy2sPlNzs8fRNMmC476BTr1DmV0X
	KjmUlnblOspGj8L+HIz/rN47KeTWEicTKavfFUo0wWqnRJy3j4Iz7TrUTYUCv2EFbmzypuNAjWW
	sxkqlbrenq+wiXd23juno7X2+BBJo9f69ya9xiXJEU80/E7rwua1tJfb4B+w5k/gyhQ80mky+mB
	H40wyGqXa1dVaGsfKCWhEWlg5goHjp0VBCB71f+Q3IwY0nGGZfJrjNYjvZg7WXmIOitY0qfICYa
	EgQfbZ6Bkea/Q9d+M8j7DRTxlqWl2tJpWLwPP6scb7+HcqVt28T6vic9BZA+0nKQ1bGYap2vfYN
	PdYwrjqtMnVYeXgnlVl8iDEn9Y9DD1g67zk8yr2fzLX+Djlh/s4wmNb++IynUVthPEpM4Tlbkf5
	4pAul9KNh+
X-Google-Smtp-Source: AGHT+IE7WXHLfVH2u4+DSdlsFQ3ngfdBOj6lQTdYHkhX00KlElTNErFlDHZmemjLFy+aNAvICL1RWA==
X-Received: by 2002:a5d:5f42:0:b0:3e8:68:3a91 with SMTP id ffacd0b85a97d-3e800683aeemr6491401f8f.60.1757856126372;
        Sun, 14 Sep 2025 06:22:06 -0700 (PDT)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e80da7f335sm7274707f8f.8.2025.09.14.06.22.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Sep 2025 06:22:06 -0700 (PDT)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-serial@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1] dt-bindings: serial: samsung: add samsung,exynos8890-uart compatible
Date: Sun, 14 Sep 2025 16:22:01 +0300
Message-ID: <20250914132201.2622955-1-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add dedicated samsung,exynos8890-uart compatible to the dt-schema for
representing uart of the exynos8890.

Like exynos8895, it has a required DT property samsung,uart-fifosize,
so reuse support for it.

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
---
 Documentation/devicetree/bindings/serial/samsung_uart.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/serial/samsung_uart.yaml b/Documentation/devicetree/bindings/serial/samsung_uart.yaml
index 1a1f991d5..6ebe8a869 100644
--- a/Documentation/devicetree/bindings/serial/samsung_uart.yaml
+++ b/Documentation/devicetree/bindings/serial/samsung_uart.yaml
@@ -49,6 +49,7 @@ properties:
       - items:
           - enum:
               - samsung,exynos7870-uart
+              - samsung,exynos8890-uart
           - const: samsung,exynos8895-uart
 
   reg:
-- 
2.43.0

