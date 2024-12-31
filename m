Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96155199E8B
	for <linux-samsung-soc@vger.kernel.org>; Tue, 31 Dec 2024 13:17:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735651074; cv=none; b=HIdaWDaSReGDYOatTHP1FRLJ0kdhoqDvtzViZf7VQEIyRSs9LE9FeepvS/AfLI2gOxfJk22GfjIkO38LwSnq/kpJ4Jgy8fC9wDxL6eUAVKxg6/OgGAAijivz2aH6h7h2kvYkFpIi9nH0eH3731hhLWKq0S2xT/JAKiQhwptLIgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735651074; c=relaxed/simple;
	bh=DHVPGDu+BXXysZPKFLxRh3GfdxMr4zOKE2jbt3Ddz1I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=KATM7HwiQpxrV6p3MyFVAsG291L1PDYWithlSo1cQtLvrJPBHM/KCPSJWymA55lQOCKWSr9YD6dDSwGgcqJwwG7ZdwN7LQwirQtk9HxFBVDvv2Aej4/oYlhHaBiWWN38vaDIBm+cxZH3iK78YsejR3OKwGnE1j4nUbsru5NIJvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gl8v6QGz; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gl8v6QGz"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-436381876e2so14901445e9.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 31 Dec 2024 05:17:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735651071; x=1736255871; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kiYnqctI4B7olrZ8fmWCW3agy6+BOp1wZW4vqYuDgWc=;
        b=gl8v6QGzBsvQyj8/nkHHQtEoXyfHJOTHLUr3ld0m55ZHzxhGmBm9prwXbpHGcDk7pm
         pxP2DGLvfdru94LpR+ajdU8UwO8iRdSpLHhLVwwWM37+pmUDiPxzIE5d4+01irR+iQAC
         naWFGuALojGZNlNTeWoHQWih2IeNoX1NLrT1GrEwugKZCEgcQKDXtvMKXL58RKKEa5+r
         Ya3U1UDy3Bwe2/yYVMqiOouwtL63nh68TrhLWyUQAYmoM0UwH0pkb62q1bXFAhm5t4mW
         qScV+DjFiMxg3zmqGD8g9nlIhKAEJfnWE/DcgIascIaJmSkGexoHEQOnG1e2C2GnFIkW
         369w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735651071; x=1736255871;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kiYnqctI4B7olrZ8fmWCW3agy6+BOp1wZW4vqYuDgWc=;
        b=PwKCqYQgI0qdAw/IRqAZWZ+qI0ZZK+PYS+T+7vBPMYORxg4BbGAp+gnGWiQzsiBysj
         1XbeZB2UN2t7a0zzknRYq31XxjQxaILxfLE5w0cEE5u8b8AYBRJwHXIKWzVbUOKqtbHI
         g91jWnxOjPzoO/Vw/Xh9Mt+dqWXp8iyQHuFI3A/SKXIi038cjAolkaNCP0kHvk1ypo1F
         6l05RsusQXUMZJpYpAqtWg4tgdv2oJl3uV46yEbGLmbaDU37s6dHr8PNI6QPPnLTTOy7
         KEcm5WMs7jaN46eRo/7K0szyHCzWfwAu/bs0M1wcPFP2oSpd5PMC3iy2ir8/n7KD/O8m
         Y+dA==
X-Forwarded-Encrypted: i=1; AJvYcCX7ksIVJVzN8Fp8vR6ftzKWUq152fBe2pcqBfbYLyFimSWxjm/1KK9GZMozmI4H3q5Lxr5iufqUjdgPOyK/L58OjA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxJQoahmf1YSwFWlrS2nP2GBhOmV8es5CveVOjhhGdIwT0FX6kK
	+5sfoKGcXdzjLKYok7hYVJJ0rB34xx74y8bV7wTrL6i0S5kSlSNH5u69R3W1PVI=
X-Gm-Gg: ASbGnct4Wd86eUONNmx/zWJQp565uRqka6BPeoKZ6EDOcBMQ+aCL1LImLZMTRMOM3fF
	drX69tDUDYTLw745JJLWU4FRtID4RVmSM/3vBIAljH0e4rZ43ff93+nFXeB60MTf9k6H1qOBVU0
	OK9zQqWjLrtgCvF63Cw2qcMKZF3stkRPIXzVFNKoJZXAWF3Xxf1oSzPX7CfCsU1etbGyK6Rl2WG
	535OMF2Vq/GmPoUILVD8nsXEqMt27hKTSuoga1SLtesGdLQvBoyIcj1oEuGP1ol3awiBPU=
X-Google-Smtp-Source: AGHT+IGnj1OFU+azmVRh2S542hn5DclJ/XA6d8meuminmJqqKBQ20AJacibZOKkBSbgCiUYj9yDP9g==
X-Received: by 2002:adf:9dd1:0:b0:385:e16b:72be with SMTP id ffacd0b85a97d-38a224057f2mr11310081f8f.14.1735651070890;
        Tue, 31 Dec 2024 05:17:50 -0800 (PST)
Received: from krzk-bin.. ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43656b441bbsm420068305e9.40.2024.12.31.05.17.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Dec 2024 05:17:50 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Olof Johansson <olof@lixom.net>,
	Arnd Bergmann <arnd@arndb.de>,
	soc@lists.linux.dev
Cc: =?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [GIT PULL 1/4 defconfig][PATCH] arm64: defconfig: enable Maxim TCPCI driver
Date: Tue, 31 Dec 2024 14:17:38 +0100
Message-ID: <20241231131742.134329-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: André Draszik <andre.draszik@linaro.org>

Enable the Maxim max33359 as this is used by the gs101-oriole (Google
Pixel 6) board.

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
Signed-off-by: André Draszik <andre.draszik@linaro.org>
Link: https://lore.kernel.org/r/20241203-gs101-phy-lanes-orientation-dts-v2-1-1412783a6b01@linaro.org
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index c62831e61586..dea35b7648f7 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1120,6 +1120,7 @@ CONFIG_USB_MASS_STORAGE=m
 CONFIG_TYPEC=m
 CONFIG_TYPEC_TCPM=m
 CONFIG_TYPEC_TCPCI=m
+CONFIG_TYPEC_TCPCI_MAXIM=m
 CONFIG_TYPEC_FUSB302=m
 CONFIG_TYPEC_QCOM_PMIC=m
 CONFIG_TYPEC_UCSI=m
-- 
2.43.0

