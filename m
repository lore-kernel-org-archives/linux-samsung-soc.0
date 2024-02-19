Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7A712E847
	for <linux-samsung-soc@vger.kernel.org>; Mon, 19 Feb 2024 12:54:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708347300; cv=none; b=tDYL3kUU4Yqmmybcyk5ChWjMyzQFufymkZyC8P4/8VsLulLsHjQ1vtj/lddsZrJTlXEmkztvZDplq8lzZvFPp43LV0J2fbkW418VwbGsXKI+8Fp7Oufsv2fe8fILJ+Ezi4lwGfuvN6ncDJgHDBSYcOL7Z6i6s4a+F3rYm/YB4dw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708347300; c=relaxed/simple;
	bh=hSBsjVnDq4V/SaD5QrTbaSrUiQ2o7wo0Gts4ho71hgw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=EtWKecbG2UMg9HH75h1ZtRIiEsTUssOP3D+WS07/Q+mIzUivcZYLQ1p8Nju2+GGbXqM4wR1PPjfKt9ZhjOIGmffqS3DlflddtPd4VubvBA5J0wQaqiMdh9W4PM/azFw0h4467k8apslbLGcCAaVirOhT2KWId0s+vOY1Al38VCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oma2XsIY; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oma2XsIY"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-41267d9d6faso4876965e9.3
        for <linux-samsung-soc@vger.kernel.org>; Mon, 19 Feb 2024 04:54:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708347297; x=1708952097; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=a6B2DruJerLZbkIuvRU8f0cBof8KbpMYUSV8dqn0q2g=;
        b=oma2XsIYTPEEH2cTCTebgFW0WNDwBs446XfKHcPOofp2PXTT4GXsLgpHNo98ZcwiPV
         VfSwNlpghors5DOpkoeNT77D4MboAFO4Y4vppu/aYN3dBTjxonC3+3N8d6zyqgiQ1zyI
         8v+iIu227pbSpeRYj9y5/MyLuSCW829spZKGc8kEvuekf44a0BfM5plO2XXPd0XH5rh2
         X6YqgLvBSFvNvvRBxyJlQDjW3ctTXpHqgJBExySUDPGlou5dxvN8To4abFVuHMlU57AH
         kZdBVWLRHB0LtKOtTjklATNnnfQHbY7Ftjino9knLysapgfsIrixrK3AbDKLuPKStepf
         qcsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708347297; x=1708952097;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a6B2DruJerLZbkIuvRU8f0cBof8KbpMYUSV8dqn0q2g=;
        b=DFCJYsg3zpG1a/zdKbOk0QzD0u/24CyTT9dCqRIAze6A7eeRa82Mupqs9RpaC+xGD5
         uy6TCEB6FDblOXrBCvWUM98FR2++BnVndrS9P+KUS4GZr1Laq7uJGYOhnnErpOOf1i74
         M+24p3gA8OR4UZ9seGXG7I+FRTESLeY4jaRrfVAqyjrfE9Gxnao/tiEINzCHP6SSQ3MD
         bkKI9mix8MIEqpUCesNVuT+Riflm99fXe9sPqsIMV3men434qLQrhILrr/H54MrgqMn0
         baCYrGsT6Uik1brg3yE1Vr5dxW/ngYEWpK/1w/IwwlEPZEB2B7/BIGXlkhcQzqaKF0sU
         GyIA==
X-Forwarded-Encrypted: i=1; AJvYcCU9ejgMuAVIVxWNF37hnJfeLYto48B28nJQgwXTLAzCW9ot5aDEx0yLLIHiwGJ0okUQnCHzmx04Ebp5JIugnZvDOxCsi3qNIOP54EM1oI/I2SM=
X-Gm-Message-State: AOJu0Ywn0MOmEm3FyhLp2vFT/YLFFrOUTuV7KRDoAEwcN3ri37RXJF1+
	qjr2OZ6ax0MB5aHhUvcOBjKoI83BrwYE9QaODOEdxwuawyA5E43koO19P+4bfY0=
X-Google-Smtp-Source: AGHT+IEIv5BtZVO+FqLBERhY0mbMiI6B12HVtWh8EH0ZzyLDVS+rqzvTu7JiEtbiqXaNJAReIfKO2w==
X-Received: by 2002:a05:600c:3549:b0:411:ff38:aa13 with SMTP id i9-20020a05600c354900b00411ff38aa13mr9228779wmq.27.1708347297209;
        Mon, 19 Feb 2024 04:54:57 -0800 (PST)
Received: from krzk-bin.. ([178.197.222.116])
        by smtp.gmail.com with ESMTPSA id h5-20020a05600c350500b004124219a8c9sm11006918wmq.32.2024.02.19.04.54.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Feb 2024 04:54:56 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Peter Griffin <peter.griffin@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] MAINTAINERS: samsung: gs101: match patches touching Google Tensor SoC
Date: Mon, 19 Feb 2024 13:54:53 +0100
Message-Id: <20240219125453.103692-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Maintainers of Google Tensor SoC should be aware of all driver patches
having that name.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

This allows to spot easier such weird drivers (weird because they claim they are
for hardware, but they omit entirely hardware part) like:
https://lore.kernel.org/all/20240219061008.1761102-3-pumahsu@google.com/
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 36fac6b3499a..69fb1ae94897 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9126,6 +9126,7 @@ F:	Documentation/devicetree/bindings/clock/google,gs101-clock.yaml
 F:	arch/arm64/boot/dts/exynos/google/
 F:	drivers/clk/samsung/clk-gs101.c
 F:	include/dt-bindings/clock/google,gs101.h
+K:	[gG]oogle.?[tT]ensor
 
 GPD POCKET FAN DRIVER
 M:	Hans de Goede <hdegoede@redhat.com>
-- 
2.34.1

