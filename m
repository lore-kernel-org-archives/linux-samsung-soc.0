Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C29D13A86C
	for <linux-samsung-soc@vger.kernel.org>; Thu,  4 Apr 2024 12:27:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712233673; cv=none; b=ZrLiNOFogGr22H6BnPF/wx0HxA1hJ7wRMsjvysU5VbbJWjOlnXJjrMR6J4ubR0VLcvO7fubkrf1F9a7YdwCDJ4Z+5ilW4Vy0hcX5RhTQSp29c0D6eKhjhIdBb/rCKnxwysrtDMnPczJFvl6d1Xzz271cm3TqCTLAd2Wn1WUCKkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712233673; c=relaxed/simple;
	bh=1usg8EVo8lpQx89y6EqbzjPZs8xvMoC2TNFiu1OGw0Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ghnuwNNwUHsyOuiq7Wf0JmVWOrcjG4q9EZCvn3EErqy3+dREFLGlOVQA5YqfkWOlSQsD3zxuF0YcGh55sljmXl/KFTdiTHqgdVYn/JAGl0FyzZjD2HgqHsYyvZfCFB/9f/ap3mVPwU+0QATtNaSvoEsO/lbwRaca/kS2Jky9GyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WZIzIfnH; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WZIzIfnH"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-34005b5927eso597753f8f.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 04 Apr 2024 05:27:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712233669; x=1712838469; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v2/Kxl6LpRi19aNU0GnPRsNjsIub/vSGQr1JFgUlFR8=;
        b=WZIzIfnH6HJ7sajXhnlneF1gm+bprHF1U58Ah9UEwE+H9i6X2vMO4oV6ihl31ghRwl
         MNRQYj8fjJZletlEGf74dOmfA+EuisSxrs2Tw7Z/52TAy0DCubRAWXXIpYo7hGREiO2f
         auejeMaB2Seshjovc5VYLUa55cRKk8YN/w4lHTlDzM++NOFLJXVBM6RzNRUDoOOXUoH0
         HA/wWgMobQp26f9xQq76gMQexyXcpc+6gjUIFUQCotuW4xA8isLyDkAaxVtvQNddGv23
         HXHsiTteEBllJNCkSNO2/vaTYr2OtkN409KlidGqsuVThurbaxN82/9q99XmQpBUdBzd
         cT4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712233669; x=1712838469;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v2/Kxl6LpRi19aNU0GnPRsNjsIub/vSGQr1JFgUlFR8=;
        b=H9DYsJDPkxuG4EDsBzoF8jhLGvqhpjTICAfI6bxy8TW0wy/z5on+F3ogSuGJWgQ3Md
         Kn/+fhykUV17nQHzB46pFfEt7Kzlk8ziguSMy8nl3jwATPS7RfScy0POpkK4i9WJcsE6
         Mi5hURTfeQ9LoSpdjoWnEd/9mLoA6/7np3lBdjHWB3oTddqrGGQcm7PFIbhTF2/H6qhC
         h0jEVkaBVhWi1in7wZm/XLWkhvGndU5I5CudRNYaN9QjtEbKFe2CCng0imn1n2h6HxdD
         guDO9Kfn25RD+eHRMYN2BwixByUvG+tJffCfoyPXLen4o9jORtyIXce+Y4N58TP5xjeB
         J/6w==
X-Forwarded-Encrypted: i=1; AJvYcCVbwS9erO+A9moiZzaje63RXRx7J3bIW023G6Zk3lasV3l+f07Zod2gvJPYCzC6Pdx6aFwkjL4lw1J9l6aaHqJXtgrFKhMAR971fP+HYS0ilmo=
X-Gm-Message-State: AOJu0YyjhnplhAOFYcczTTcFd4oHrsQArCSybFat/WpMor6XcbE0z66M
	n8AsIth8y5hCH5aAckGwA2jq+GUje/5QBQDuXUplqpp1iKoMpzZVlwPcMbyrWMo=
X-Google-Smtp-Source: AGHT+IE4lWG03NrsYGIMb38leE/EL6KNHhTvu/DlJtCiu5w5jF8R4KkplAWIhngCJVQJeXTuDbWSsA==
X-Received: by 2002:a5d:58e6:0:b0:343:419d:ba87 with SMTP id f6-20020a5d58e6000000b00343419dba87mr1780461wrd.13.1712233669746;
        Thu, 04 Apr 2024 05:27:49 -0700 (PDT)
Received: from gpeter-l.roam.corp.google.com ([148.252.128.204])
        by smtp.gmail.com with ESMTPSA id bu14-20020a056000078e00b003434b41c83fsm12106303wrb.81.2024.04.04.05.27.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Apr 2024 05:27:49 -0700 (PDT)
From: Peter Griffin <peter.griffin@linaro.org>
To: mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	vkoul@kernel.org,
	kishon@kernel.org,
	alim.akhtar@samsung.com,
	avri.altman@wdc.com,
	bvanassche@acm.org,
	s.nawrocki@samsung.com,
	cw00.choi@samsung.com,
	jejb@linux.ibm.com,
	martin.petersen@oracle.com,
	chanho61.park@samsung.com,
	ebiggers@kernel.org
Cc: linux-scsi@vger.kernel.org,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	tudor.ambarus@linaro.org,
	andre.draszik@linaro.org,
	saravanak@google.com,
	willmcvicker@google.com,
	Peter Griffin <peter.griffin@linaro.org>
Subject: [PATCH 17/17] MAINTAINERS: Add phy-gs101-ufs file to Tensor GS101.
Date: Thu,  4 Apr 2024 13:25:59 +0100
Message-ID: <20240404122559.898930-18-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.44.0.478.gd926399ef9-goog
In-Reply-To: <20240404122559.898930-1-peter.griffin@linaro.org>
References: <20240404122559.898930-1-peter.griffin@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the newly created ufs phy for GS101 to MAINTAINERS.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 491d48f7c2fa..48ac9bd64f22 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9256,6 +9256,7 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/clock/google,gs101-clock.yaml
 F:	arch/arm64/boot/dts/exynos/google/
 F:	drivers/clk/samsung/clk-gs101.c
+F:	drivers/phy/samsung/phy-gs101-ufs.c
 F:	include/dt-bindings/clock/google,gs101.h
 K:	[gG]oogle.?[tT]ensor
 
-- 
2.44.0.478.gd926399ef9-goog

