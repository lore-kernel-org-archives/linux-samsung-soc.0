Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC4AD21C16E
	for <linux-samsung-soc@vger.kernel.org>; Wed,  9 Apr 2025 20:37:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744231078; cv=none; b=IORnpE99KDEI79I97KooDsxmcWjBJccbSzvAJPJIoYyoyA3mrmMVb3miqQLBr9Ounzh4WndESW3ZI+6649cGmRArbgkJJu6j5dC1Cjqyhe6QSGIcahBp7IZM8lvNN5OkjTDAOCUuKZc9WUlGbl573C3qH9VDWIhke27AI8gPwhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744231078; c=relaxed/simple;
	bh=MOwN2YKQRpsoNetHBGgHFyjhqmCGn2sEj3wN4XKb40M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZxFomGrHFu7jh1e9MJbcLaKgLGzQloFzzGp0Ge/pis7zPaSzJRJdoolheJv1vFVUV9oIE6A/DiLgFkY6GWlscvP+tltzva6hSZzTamWy/MCfNTSkANZuId50r7RuifyJIx6XenVavXG7rRTOpcE/98FGxszVa8LIhvyYob/T9r8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Vm497A+j; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Vm497A+j"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-ac2bdea5a38so20408766b.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 09 Apr 2025 13:37:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744231064; x=1744835864; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mKIEGv3zVsS/tvIgE0OLlPL/FateDyHpIQVfqm7tXaQ=;
        b=Vm497A+jx1EVsnEcAwNyYtILjLg/h8AtRd4f8kz3krTaccpoQpSFgQFyjb5fRM3mnu
         0gREPRuSqIVeGcsgrcw5Xjc2QgboErF/SfDeNoHSve8QPuTEK8tF5hNodZGTTELP2QvZ
         7P2svcFnz9I3kFpga/CWKZxHjMGLSxbi6siT+q6BPTrchYpvUaRyJVXOyiQNwApfnUGP
         XEK9wBVfX1O8dugaFuFEbCzl01Dq61xTdCVfzW5kPLJ61905qEVZu2gYHdUBuF9jCa/x
         eeYJ0e3UzHObjvCJrc6gthnoulEtuZj10SZejvZtfJvhnTlFi44dVYXI/8vpD3AVY/ZG
         d7jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744231064; x=1744835864;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mKIEGv3zVsS/tvIgE0OLlPL/FateDyHpIQVfqm7tXaQ=;
        b=Q/riO/0jVoOR5bWp/KPhUrSnHWJN99+IASf3U41yGoeeA9LbfGDU8egbzM7DJ5lTL0
         DPseH594h9EYNU6sme6Tbs+qnEouWU3+XhOCcSidfSfk6+53+dnFlO2ZO+pRAmn1TNAT
         YtYuy0gmwh0DhXKA4B/Wcjkft1T9NWn668KUmS8dqtS09rQFuwtUv4hhIpVIu3QZg6f5
         3xAdAx8C6p28cpnmellZdg66aiuw10XeIArX+xAjxjRBYmSoYTC6U7PpFy7LVy9ycj08
         7SOMHROYSaWlykmYp7RL+40p/AoQhAbUYbF0Jrz9ovSu1OFcFDuOrPeArC1yGM8DJpl6
         q36w==
X-Forwarded-Encrypted: i=1; AJvYcCUOIGYS60ZPCuu+WvuIDHZoOVilgWj/yAqziL96KWogq6G/i/SnF4AkuNewgfzV6cN4tBP4n5FYVipVnHG4RaBpYA==@vger.kernel.org
X-Gm-Message-State: AOJu0YygCSX8f9PjkNnYbPgJGchc2gy7yI+9jJfzLeT0ZO1cZtkQyZ5E
	/NouvtrzKw3V8spDQvb9i/org/4fzerla/W8TpmVfy9GxvAFjv8LsJrtGqB2psM=
X-Gm-Gg: ASbGncunDui7+l06646XXy1TbDfjryn1diyNSwmwBg6iOnfHmySGg541/1bWyjEavc0
	G7Qg5gEJQKbSy3Xi7dKIsGDwDl8Mi7hwY33U5IFxINBVqgy0qp2FDPNbanxkW6gm2otdtJdshYU
	i6jUysAnphCJMBXAWjvuAcxm1BM4NgROGx1oqsAAOeXRs369PHMmClP0aRMPTw7tIVHefbPM2xX
	RdQ/DXpVsmMiuZSO0mnmvcXepKRpUuo+1oUWi+0pJ1OUuS4vS/n49qdvro8caKScQZYX+pm2TBR
	l40+y2Ii0pTjq5JTB05/cn9Fkfn7hG/dGQNxzyXo+JbtoX9/QpJF7TFjp/VdbyVMXk0o6uDMfX7
	/X9ZWaIc8M0gvKGytHC+juGKyMI1QwNLtsZ5hhQ==
X-Google-Smtp-Source: AGHT+IG1YTLblK2ZacnQ+muHHFTtW2fsPo4+YsM4khlJQ2EKJXJA7UZyAbkh8L9PKTjc8rDv/I4VCQ==
X-Received: by 2002:a17:907:7da3:b0:ac2:cae8:e153 with SMTP id a640c23a62f3a-acabd126d26mr9987066b.4.1744231063960;
        Wed, 09 Apr 2025 13:37:43 -0700 (PDT)
Received: from puffmais.c.googlers.com (40.162.204.35.bc.googleusercontent.com. [35.204.162.40])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1ccc001sm145850366b.126.2025.04.09.13.37.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 13:37:43 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Wed, 09 Apr 2025 21:37:49 +0100
Subject: [PATCH v4 28/32] rtc: s5m: fix a typo: peding -> pending
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250409-s2mpg10-v4-28-d66d5f39b6bf@linaro.org>
References: <20250409-s2mpg10-v4-0-d66d5f39b6bf@linaro.org>
In-Reply-To: <20250409-s2mpg10-v4-0-d66d5f39b6bf@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2

Fix this minor typo, and adjust the a related incorrect alignment to
avoid a checkpatch error.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/rtc/rtc-s5m.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/rtc/rtc-s5m.c b/drivers/rtc/rtc-s5m.c
index c6394faaee860427e8b84e9c6df2d8229cf06d93..095b090ec3949e0e8074cc344105daa00b795245 100644
--- a/drivers/rtc/rtc-s5m.c
+++ b/drivers/rtc/rtc-s5m.c
@@ -243,8 +243,8 @@ static int s5m8767_wait_for_udr_update(struct s5m_rtc_info *info)
 	return ret;
 }
 
-static int s5m_check_peding_alarm_interrupt(struct s5m_rtc_info *info,
-		struct rtc_wkalrm *alarm)
+static int s5m_check_pending_alarm_interrupt(struct s5m_rtc_info *info,
+					     struct rtc_wkalrm *alarm)
 {
 	int ret;
 	unsigned int val;
@@ -451,7 +451,7 @@ static int s5m_rtc_read_alarm(struct device *dev, struct rtc_wkalrm *alrm)
 
 	dev_dbg(dev, "%s: %ptR(%d)\n", __func__, &alrm->time, alrm->time.tm_wday);
 
-	return s5m_check_peding_alarm_interrupt(info, alrm);
+	return s5m_check_pending_alarm_interrupt(info, alrm);
 }
 
 static int s5m_rtc_stop_alarm(struct s5m_rtc_info *info)

-- 
2.49.0.604.gff1f9ca942-goog

