Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B532A1E7674
	for <linux-samsung-soc@vger.kernel.org>; Tue,  3 Dec 2024 12:40:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733229630; cv=none; b=HAbjMVtZMeZMa1RFRCzlnVnd5EVHD0sl3Wh//LkTXNgCFKK6S3rWST0tDn0A5eCeNmySOeOA2edj02gf5IXT2pSYuHwqqla5j8/pbL8MY1nzcLZm8S0I1aMCvHNdMtagC9e6xCeTQ5EsARBoR5aiOpMEtAbqTPvCWvHjdDmpYdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733229630; c=relaxed/simple;
	bh=M9v4cnhexcFGnFb67v5mL0hn+ZbZK0KVsMGyMVUjDr8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=idjR1kd+lvEvwjK6pyPTkqEZaC0GpgGJ1kwgDHoHEoJwurL4IbAvqb50W5ODVVGHsYNbAzXdBlIh9fZm9sqs36u23Eg6oZTBZgEfVdGNJ4UtboKhfdH/lZaF8vSyVNMSUuvkT2o4gZnoS7cV/bEcxfL317b8ydxdCmrNYlK/LnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vwGas5DL; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vwGas5DL"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a9e8522445dso775857866b.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 03 Dec 2024 04:40:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733229626; x=1733834426; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JKz/6LOX+Qb687N6TewJgIJoPVXxUJjOmnFbpocgz8Q=;
        b=vwGas5DLhzlG2FqYYuZ00vYVx0teMEr647Z75tVdId2R1YJA1SjMhaIwew5Ir38xZA
         zHn2eaHFeMvt/34gaBPn2TjzJnkIhXEvGgBIsIxa8QLJ841xP81apTy5Dyxkj4Iy6MmU
         befqAg+nMXAlJARkvfqLydSsxFWtn2h4EpNeRPg8oBe+AfTiddI8+sHr7Ef1pS03jdi6
         YNMWyNf48rak9pngrdAIgppLpZgfFOl4VuzmIiou+8eVcXc1XUdr4dm9pbP8C7ZHK05X
         aqKs3DG+mzHpy6aqCwK2jJMPhr0w7IfE+oTnsESfe8FSko10WZgSh3COk1rixbRJ7agv
         pTQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733229626; x=1733834426;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JKz/6LOX+Qb687N6TewJgIJoPVXxUJjOmnFbpocgz8Q=;
        b=SY+rmmXFhczKe8Y1wxG0+wP6eNmhevzAftbsjOsbTCyeUS7+xB0g/1KiyJVCz8Kzm2
         CQgTBfkm1UPsdLq8QtLA/mxHF2iXSVutzlB8IPt2M4+F0MdmApuYHv61dCoFX+hFD+/F
         i175xQtpOoRF3gE8RI7m0zccZAVa1oYDulRy2c/pr79qCs+z3um7kpk5VanyiIvCSzSA
         PDxquiErIszTcm1/OBrRM1cg2z823hGjdhsCHbz0hHZMhv4qopOWgUTsDiLeioOc4ceS
         UGmtrisC1uRg9P91cPCtY6eCiVbm1Nj7N4LoDjkPI67n5iaJx6U7ejVL/C5mDgDJU9K3
         Gh9g==
X-Forwarded-Encrypted: i=1; AJvYcCV1xzngZWanomYJVLQeANjAJuDzbxgEr2hN1yJnwkpNjjtvTj2QpA9MsudwR9HAdOjyd2CKur3yKC37bVHXuKYIJQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyo7wHoFZoGM6Bs+gK/p15lVNEQirazlm31BcO+aXgJj+PxMPCw
	7AxBK3yaBeXJBzMKISD825MOOfsS4KlQLWyeKXb/bZSmdfhqM40X62WSAG5ryLg=
X-Gm-Gg: ASbGncvI2QI6m0flvHg4b9ucVqAYmp2+dcfum6tMpbzdbtIr2JlkMqMlMrhYQJdCZaz
	eRgV5GAbfeRARs7uH6Ps86DuIdzlijEphYvf01wwFOeetU5MzEDUQdzj1HBQvlUSIzS1Oy+/muP
	qtShDJLgZzPh/KLuKRDLmlj07ZPX9kGk0C4huyGny/1sJx0ezndgJlbjyyO331uTo8yX0YH++gV
	plEabpgI5L+7SQhh50b/O9toc9jdudJCUbrI3TmIk7cJ4AcDPj2c1HL7ppN+h0S9rMQn8MKZkSD
	ERD5fS/jCtKtghh2NeQBvj6J9CONZXad1A==
X-Google-Smtp-Source: AGHT+IHQO6w8q/8y2vmYj3AwKDx8/AcSW1egkdyxl/hQEjDRsUnB02G5MYsyfeveHXAuRhqJX5unqQ==
X-Received: by 2002:a17:906:6a18:b0:a9e:c267:78c5 with SMTP id a640c23a62f3a-aa5f7f19e62mr225441066b.55.1733229626045;
        Tue, 03 Dec 2024 04:40:26 -0800 (PST)
Received: from puffmais.c.googlers.com (64.227.90.34.bc.googleusercontent.com. [34.90.227.64])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa5998e6a4csm616809466b.106.2024.12.03.04.40.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2024 04:40:25 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Tue, 03 Dec 2024 12:40:24 +0000
Subject: [PATCH v2 1/5] arm64: defconfig: enable Maxim TCPCI driver
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241203-gs101-phy-lanes-orientation-dts-v2-1-1412783a6b01@linaro.org>
References: <20241203-gs101-phy-lanes-orientation-dts-v2-0-1412783a6b01@linaro.org>
In-Reply-To: <20241203-gs101-phy-lanes-orientation-dts-v2-0-1412783a6b01@linaro.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Sam Protsenko <semen.protsenko@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, Roy Luo <royluo@google.com>, 
 kernel-team@android.com, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.13.0

Enable the Maxim max33359 as this is used by the gs101-oriole (Google
Pixel 6) board.

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
Signed-off-by: André Draszik <andre.draszik@linaro.org>

---
v2:
* collect tags
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index d13218d0c30f..5080fe2ce776 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1121,6 +1121,7 @@ CONFIG_USB_MASS_STORAGE=m
 CONFIG_TYPEC=m
 CONFIG_TYPEC_TCPM=m
 CONFIG_TYPEC_TCPCI=m
+CONFIG_TYPEC_TCPCI_MAXIM=m
 CONFIG_TYPEC_FUSB302=m
 CONFIG_TYPEC_QCOM_PMIC=m
 CONFIG_TYPEC_UCSI=m

-- 
2.47.0.338.g60cca15819-goog

