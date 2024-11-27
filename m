Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A0051EBFF5
	for <linux-samsung-soc@vger.kernel.org>; Wed, 27 Nov 2024 11:01:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732705304; cv=none; b=ZLZyt3QV9w94dcZ7AHKWdoI8Lmzx4k41BkbTVlyZe8Bb3sfl2wfvpm5c7RtwglZr1N/tq8/PNaueSWf46zfR6XUN2hAErBZ+uuG9cgfJq/3TY/hcabYTKUzRAOCVlELLZ+IZvL9fbnHuDWdJmN5cLw7+RH6Q9DF7WYLyV4R2ksY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732705304; c=relaxed/simple;
	bh=lozZ7p/MhDuRt6nX+BtkrwBuJHf1C84dqV892qIj6RI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PH0bXIBudb5BoSJljUf8FWQJMbjm9O6IeniEsYFxp6iFHeOfLv8btVs7/qoy6kW8IHqTVh6ccZ5d4NjfJikYl8XibD8/aYZ6f5Td7L8ZOSXi47IlN3BXZTRXNVRCHtzIJT0uDE7U4S6Imev6TTG3mjRQ4xNv6jYVwU000b6d3SQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jlVqIjaI; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jlVqIjaI"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-aa532dcb470so266317266b.2
        for <linux-samsung-soc@vger.kernel.org>; Wed, 27 Nov 2024 03:01:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732705301; x=1733310101; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VB/ikfiNeJLME2Jkz2PKwShANoRD6KN3KhS7opfVViA=;
        b=jlVqIjaIdGwz+w9ViTUCIOrQYfZcRdmM+eCcGyQsn/32+a4NfONrvtQvuxtm0b0RR1
         pK2ezWO53I2ZBg1v31KUlH3PunVEFYyk9uqIjT6+mZ0mJRlKiGlsQ5G6AUJ267uU4N+f
         6lrsEI+QEWEPpFLhPlkEiSA6R/vzVzqhSbSgl7iSlFkEYEmkwT6u9pguqVk9/LIN+yjj
         jVrAd7XAppBxCBY1z2Ctfod9gX7bAXy9H+gYRhhc+YqZh4fRPx4ego6sYGwQRgRoAv6E
         LH9Wwx5BeXti8rhJTdFYKAOO3MBU04ryyOtil320/PXelKyB2W4fdXb6oeWZscrsEJ1a
         mQnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732705301; x=1733310101;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VB/ikfiNeJLME2Jkz2PKwShANoRD6KN3KhS7opfVViA=;
        b=sGmRwIxeGuoCqUFRHzqcKdsbgdgtFJRgTaFjCTNaYFcG7UhJQedwh79DoLZpPLDNX4
         j1R70/nuqCS6+C3GforI/Yni3f/a7c46ZM/RdAJLfKEoVhbD4nMTZRAL4ZG7CpwYkCwd
         ZZBjh/E27XvnbnF15zDZETQZ5PSnnEr3GLYkbCMfAmQPNW6ykK+5dR3v9nGZwzef+zgs
         L6EjeOlyroF7eQxNR4f/by2dKZsmf7Kq1Qfc9DT1Zl6Kmvals7UbH4kFLK5QZYXDnZMO
         6PLgldAl+ceSkzntU/S3x0+pw6z9K4WrFQ8C+1Qkl3brS2mpERWTD0r/4z46NnHfS4c+
         ieHw==
X-Forwarded-Encrypted: i=1; AJvYcCWzAPIF35OlLR/6tIBIaDeMBGpG7FDz6/pIGYFPqei5z+Lt+9P7qW93LY9zQtp+5pHPQCjDh2q7RdhwAQ7i+jAzaw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzPnT2dsves2MFTu9fAQ3A2Thwr/ys+eAB3FQZ4Y1s6BU0kvlV+
	24J3HNICfZiW0AM9uVkYTCxZg9fcKOrgnknPUzr4rd4sdZgaUvAho3CdxEumZ/o=
X-Gm-Gg: ASbGncunrwsxFozXoRHRLNQ3NChGishqw3cz2awHwoBnbG1N/cE8x831D32YNra0pea
	tmpUDm8didhyRa5wDeX3BWtKIooA1VUaGwPqvY1Mr4eprx6vN4R75c1b72hZKN9xGyOCLTwEnXL
	U6e23FxF4KGZ/u//BqAuZYwJ/s0HobYMbdrXdraXjCr+IuZRUbyrLGWFyzc4RWCIlKf63DFu8hz
	bMhDVg/xu1zRrgIn9OlAAZm7/1KXO9bYxZ8RJ9OQMnmwEndz8uiNzKhuLMZA7Ey0pWG4RZPml4O
	cHvtCucsYS6Mw+Rza+MQQ6XPt3DblKH6Bw==
X-Google-Smtp-Source: AGHT+IFomp5IYrPwtodVx4NfkTQ1BU4IT3aD00OknD9fip4RuVHiqXSHZTCSxH7nkJmeEnB3wrFv4A==
X-Received: by 2002:a05:6402:1d55:b0:5d0:88ea:6560 with SMTP id 4fb4d7f45d1cf-5d088ea65a4mr876701a12.31.1732705300646;
        Wed, 27 Nov 2024 03:01:40 -0800 (PST)
Received: from puffmais.c.googlers.com (64.227.90.34.bc.googleusercontent.com. [34.90.227.64])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa50b339612sm693762966b.84.2024.11.27.03.01.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Nov 2024 03:01:40 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Wed, 27 Nov 2024 11:01:39 +0000
Subject: [PATCH 1/6] arm64: defconfig: enable Maxim TCPCI driver
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241127-gs101-phy-lanes-orientation-dts-v1-1-5222d8508b71@linaro.org>
References: <20241127-gs101-phy-lanes-orientation-dts-v1-0-5222d8508b71@linaro.org>
In-Reply-To: <20241127-gs101-phy-lanes-orientation-dts-v1-0-5222d8508b71@linaro.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jagan Sridharan <badhri@google.com>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Sam Protsenko <semen.protsenko@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, Roy Luo <royluo@google.com>, 
 kernel-team@android.com, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.13.0

Enable the Maxim max33359 as this is used by the gs101-oriole (Google
Pixel 6) board.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
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

