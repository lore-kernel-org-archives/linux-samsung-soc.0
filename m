Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0F2B1DEFF3;
	Fri, 21 Mar 2025 14:56:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742568971; cv=none; b=fKzG3tjdBAlm4GmILnrVkVvp6YVHnE9SXcpSjgZ/Cdsw4QUDSBoMF7hVB1KDT3qrkcvXGXad6cTyEAwDhIlEdXtxokpPr98xcoMtGGdBRiAGmbnnKKDlqUSYr3WMgg5feqQw2XB6Zqt9Ye8A+1sQoh3Aaj+gsim5P6UE4fPLMes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742568971; c=relaxed/simple;
	bh=C7fbBFc93J6SbCnqmFoRCxSI2+LhANmijsjoqSXn7js=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fx8ggh0eYHioFSIYYZgkR0i75/5bhaDm3Y8KuBsv43PQMHwcD1z8SF7BHEttlHVDdHF7g6I9tK/OlhJg54Qct2gbafYx6vc/EOmbg3sxtOtDxmBhW2KWNMBJHbkyr92LqzvLJPDC8DcvuQFnrZWSKwCtMSecC9abzMH5gECWiC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aliz6sLI; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aliz6sLI"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43cfebc343dso15387235e9.2;
        Fri, 21 Mar 2025 07:56:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742568968; x=1743173768; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HUZ6WT9xaTB6U8uX2ZQ4bJClS2cOzeuW4hOfPq1GbHQ=;
        b=aliz6sLIhfciDdpvq46feFOAczgRcsWWEI+G5ZkmcMpGres41JgPOe/Cf18iFcXsvq
         5IxLZztm16U6+8TSldYyX7y5qpUaegai8RRtCtGO9irs8mfNuNYZwQI9Q9GnIzvf5JcI
         +ffrWgbrvILb/+0wwI77IAbIwp49ORLsXwK/exMPL/h9Snm9WMxBcR8AduYZVzmGBxzY
         lcB6v4kgYenY0mUw0UDwW4pbRdDIefR4UQxmldPgVHdUO0NRjlONZRJ0Nj1XaadkCnfh
         YmoR2ProO56hOtKqyc9+fhuH9MrXX2EzoPoVwRcpi88Ns6g6Dxk3NLhZ6Cpzc301pWfh
         paEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742568968; x=1743173768;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HUZ6WT9xaTB6U8uX2ZQ4bJClS2cOzeuW4hOfPq1GbHQ=;
        b=bevv960gGGf4xdoGhLwLnruoPmcK1ewwtnFpqBqGCxL1Qk0j6L9wmfDPnxExkTUaDZ
         wbvb6UKvbPbj8u6TG2z6o58ZZ2YevcS8sFVaT7B2+tqchiXkeo3AMEIF1pdHw1800rJF
         e66OTsX+1jcu8DNgNKpOY456umgFWNPxWuP+Mn7IGBa0o86m980BugWWCzW62qtMiSpx
         oPC3ydwJbx/hCqiNLfRfbYTxX8Kw+F6VkT+9eHwoWfwz7S+Qe36vqxqAF8f7MSWwXI5d
         bYXNAl1JvemgU06DNYGhc6RpblSpSsFMs/8BrYYqIZIQ1E5IE3vJbG8SAEyN+n+CRlzX
         zTKw==
X-Forwarded-Encrypted: i=1; AJvYcCUJktsI9lzNGeeX4C5Rnj35KLf7YNmkVY+KCG2fZvNoTJgARoTksfnIMOcN3o2l4oxpQ/+RMC/UhgISZoqA@vger.kernel.org, AJvYcCWXpoVngQ2fq+WOuAw9SMV4gZtdG/C8CEbLi+nnbTPHdLTKA8VeTEv+QlCjk0rUkv6ZiLkoZxAT5G5N@vger.kernel.org
X-Gm-Message-State: AOJu0YymbNArltBveWczx6CEcDhwEmbK5HDF+yS+dT7Tu3SC6Aka/8EQ
	6+LTshutQhLbVsqylOa2d0+57uhzovtE75ItTMRqvlytihdvKkuV
X-Gm-Gg: ASbGncvaUqjwysXBXSMeKLF3Y6dgjTTrN/h1OBRqjp3FQhkcfsCS7CQOAmFl2XNIVJL
	b9/mn07rW8iwwjNkC9WH9Ggpy+ROKRof6WqAVSxc3XY3WxPh+sf69bPLpAy/4ybLDRK/aVdy9BU
	Jy//vJw9kKm6Qh2Jm4ZSEl/bkvu3pVRFqfg+Meh5fQzEdAHB88/e3YduHvrxCwmlKn07FOaLiq1
	QSO98yRAnp+Q6EaK57VcwQ3LsAuj/VwiO7do+1bdDMzebvwGAz9WQu0CQKkbWIHlSnYcFLLUsva
	BnqYMlVpBLyjhr/dCFGKQvwWwLyGBPPsHTyFBWVa/jHhBiVLNEMBs8oqp8E2YXgP3z9C/jf8Cbx
	kJEl8EbIFb1JoptPdt63t
X-Google-Smtp-Source: AGHT+IE3QMyFT0D9MvVR4njoTTNE4SagQmeQKwO7Dkym3v+KnikA8kDn6rCGTzWMbtXD4HGpHjc9pQ==
X-Received: by 2002:a05:600c:3b9f:b0:43c:ec4c:25b4 with SMTP id 5b1f17b1804b1-43d509ea8e7mr33219225e9.10.1742568967875;
        Fri, 21 Mar 2025 07:56:07 -0700 (PDT)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d4fd28a46sm29217095e9.24.2025.03.21.07.56.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 07:56:07 -0700 (PDT)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 4/4] MAINTAINERS: add entry for Samsung Exynos2200 SoC
Date: Fri, 21 Mar 2025 16:55:56 +0200
Message-ID: <20250321145556.1436201-5-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250321145556.1436201-1-ivo.ivanov.ivanov1@gmail.com>
References: <20250321145556.1436201-1-ivo.ivanov.ivanov1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add maintainers entry for the Samsung Exynos2200 SoC based platforms.

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
---
 MAINTAINERS | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index e4f5d8f68..f3ef6f862 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20937,6 +20937,16 @@ B:	mailto:linux-samsung-soc@vger.kernel.org
 F:	Documentation/devicetree/bindings/sound/samsung*
 F:	sound/soc/samsung/
 
+SAMSUNG EXYNOS2200 SoC SUPPORT
+M:	Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
+L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
+L:	linux-samsung-soc@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/clock/samsung,exynos2200-cmu.yaml
+F:	arch/arm64/boot/dts/exynos/exynos2200*
+F:	drivers/clk/samsung/clk-exynos2200.c
+F:	include/dt-bindings/clock/samsung,exynos2200-cmu.h
+
 SAMSUNG EXYNOS850 SoC SUPPORT
 M:	Sam Protsenko <semen.protsenko@linaro.org>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
-- 
2.43.0

