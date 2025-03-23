Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15A781EE7CB
	for <linux-samsung-soc@vger.kernel.org>; Sun, 23 Mar 2025 22:39:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742769593; cv=none; b=Ze3DCC8bIovvxSixRHFqggWvQmpy+8w/yVSwRpAaiVNAQQIzIMyNikpxE4BPGHWV00CioGJN04CMvm5keReadYJGSG0zUCz+oz4pSDJQNA0iiLFFKpjFNfaV6JmAHwizJu3JXDVewhMrME5GWhFI11l4UoU1JsdkqhdN/KC349s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742769593; c=relaxed/simple;
	bh=XTbYOFxDpYMNG8kdQks6GusInksI0MrF0HPSPauW9G0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kYsm7fKeA+/lY2bKhrZGU2L7ov+JF6DO8jwaecq68TVnyO2EbAsriyvjPg6tVKsPxwKdRQfuMasU+BEWkyQBS2bFMW1B33bbSqV3wJSj98xmi7oEDsT5siH3LE2urmqUc55pERDYOzmZ/fsPFCNXuSH7ZAnNIdHyYV4RZU2b+VY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kzuUTZ3y; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kzuUTZ3y"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-ac2902f7c2aso650971066b.1
        for <linux-samsung-soc@vger.kernel.org>; Sun, 23 Mar 2025 15:39:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742769581; x=1743374381; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+WWXWLpvDyb8usGlL8yRG72QzGDtYxB508Wc6qQDfhs=;
        b=kzuUTZ3yS73U19jU458nl4lpuBO+pGkSbFABOeVGkrN/8tYQpXfBQzl0846vbtBIy2
         zEPd2TgwH5Rfswn1yHu9Q6sv8fq9JW/UO+OHxwUChNyDghBi87YKZSjr8Bv1J5Vdsyt+
         ii9B2bT6zydNG71B8paDRSfox2UjOaJk8ykufibzIHfrkKvOqayQVTx/rr8R0DJeHvIN
         TlKk2rjhdfebUsMdhdiAkJSgIgSsnj4QmlU1jn8IB+X4OxHQlV19/Wu8kbvoIXl5Xv7h
         Lrv8UBKbL/E34VKwkyDvSjtUVveplHcvAXTkzxXE+QZqZDauZ68Qu/xQDifqWTIr6M5a
         NCVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742769581; x=1743374381;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+WWXWLpvDyb8usGlL8yRG72QzGDtYxB508Wc6qQDfhs=;
        b=Z3HfGvKfVxT1hLWUSSxJxpGjHfh1+cCF36O/uxjnwbZxl+vF2V+F6Q2Dj93O+HeDY7
         TTmS4ISeIQ7DgP4k4/E23STYeQ3OfHSm9VFOcrx3/4FQF9jFQOQBozGdRU6x3tmzyGqo
         mFgRTYxcTPS10815ViKk8wW8aJK7a5VXUivMcO70bRtHh14OeIdsxBwenhHYZDg5nRJQ
         swoqOnN5gjBOD6HnhyM/C+dqvko4ejneD5QVl1QN9OvoVkxvcAXSuTnDYVuaUbxsTHHS
         OQ9/jQyrOOuR8BtlAJZfGmrM8u23QWdmMeAXpgfEkgY6JyQofKBtqAUTzLisCLqdhncL
         gFqQ==
X-Forwarded-Encrypted: i=1; AJvYcCXvGsXXLzXxpSPtyQEdQOi+6rj0sIazYRHKmEMLckyxPY1tHJGhQsjHoXS2xq4G6O25+xuNiBmy7m3tfYecRvPWhA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzg0hZABjCln60lpcM8KGNcPkqhWtwBaXzV2aLZ+LVKAbP8Ywz6
	kDyUBhkDNENcCYg09KZM6XE5ZMnx2yftJZWYHIg12yESRTXj60P5W0fuJXXeMKQ=
X-Gm-Gg: ASbGncs14AlU01Kw6q3UUSe5qYmLpdbDqDK3Ccfo9jLdgSeK9MOHl9L0KCGN9gh3TGu
	GCNyvujr3OnMowfM94Nq0bIs9iOgkKtjf48k52qZzQ8kcRNOACDnXv+YybJFtH9PaAPEzl5gmBR
	msJvjgShZTVWv4zbzt9mMM/RbMg9xIafu55jfH75qBeRZb2fTPBTP0vbgF8+FlUDONzWP21i/jI
	9D4fJ7B8xqid3mNKhdqydYW3Jz3X4nQ2QikR2zlixfT/jwCG0au8bVMUzp9CCIufBaHiF1UUvxP
	jQGQaTSH20FDHTMFuGrz/N3WTfuggOq6C0vOwWhU4gkxRn5icLaNzNUaHZXIDj2i9Am2TOvrfCf
	eTH/KM4rePiVQmaSjEpP9NJIlkWm1
X-Google-Smtp-Source: AGHT+IHUwVqfRBATiENga8y2WvKZVKOrHZpSBd488/sJ0QhrasF7WRCnvzn1JwM0TwTxkLrFTUS5Nw==
X-Received: by 2002:a17:907:1c21:b0:abf:6389:6d19 with SMTP id a640c23a62f3a-ac3f226757amr805060366b.15.1742769581299;
        Sun, 23 Mar 2025 15:39:41 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3ef86e44dsm559686666b.31.2025.03.23.15.39.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Mar 2025 15:39:40 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Sun, 23 Mar 2025 22:39:46 +0000
Subject: [PATCH 30/34] rtc: s5m: fix a typo: peding -> pending
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250323-s2mpg10-v1-30-d08943702707@linaro.org>
References: <20250323-s2mpg10-v1-0-d08943702707@linaro.org>
In-Reply-To: <20250323-s2mpg10-v1-0-d08943702707@linaro.org>
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
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2

Fix this minor typo, and adjust the a related incorrect alignment to
avoid a checkpatch error.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/rtc/rtc-s5m.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/rtc/rtc-s5m.c b/drivers/rtc/rtc-s5m.c
index 0d8783577bab4f4ebe61050dbd68387d970773bd..7b00e65bdd9c25b3426f92355f8ea36e66c3939f 100644
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
2.49.0.395.g12beb8f557-goog

