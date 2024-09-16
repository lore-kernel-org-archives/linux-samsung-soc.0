Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D61315C122
	for <linux-samsung-soc@vger.kernel.org>; Mon, 16 Sep 2024 16:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726505913; cv=none; b=uy3xrT+Ekq9Z+gsoEqGUgPNoBSIJ7mISLYD+lYy5jvaINHEwD2tLN1Y8758M0xiDzRm35fFtr7avZA/nRHSpvx8HPC1iEQZ4AZLuLlNNFBWNDaQ731oCRr8YjKTbh0anJT2lHPGVuYEfmLgx+dzTsLZ+P/cCWfuskAKDTdpBuLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726505913; c=relaxed/simple;
	bh=K3lXrcROTvdy6rGll9oP1BBWq/QYqnRnIwHnaiLNNwQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=luNqjvYXkcA/AwJ768jXlM5j/t2fHoCfxua1v8wjPVEcOwKnLVylgtB+Bx3fqij7AJYwgIzeMgiHrJ6opP8nn4E54lgkj9sMINVPBgM4I+5dHUOSEyq1bc+CprGghQA2AfZ65ukPzKXUpShRj0Op3fbAfkQ2gEGflZKvO4Q0vkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XUgctqN5; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XUgctqN5"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-53653682246so5380294e87.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 16 Sep 2024 09:58:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726505909; x=1727110709; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yk/h5FBiZK67j4ccJbtxk7Fvu6fYbqtAXQZenT1Ni5Y=;
        b=XUgctqN5GYvPs/3K/Gyq0CMAgbcLGK/yz+l466y/NHAO0+aOSC5GtHDrcaTrljkY3F
         hLdmSfdlQXIOuqf4v/Xg+tvNRmLBZ29kfS2zXVXPKgbTMIVB8SBjTf/covrO6zZKdm3S
         3EZHkqPbZgge10Th0quLe0YD/sAJuVcCqNm3uiV0RTgec0CFi3Wa2X2sRT9dH81BJ0pG
         gCqRWj54eEVhwjmnrmXQmekeSsYjBaSdm7zQML55PGtHuo51Q78izmL9CKYBdCQwFC30
         TYURZ4jtyIYltINA7AKMJ5hkQgHaEJ8OQlnI3L7fMlodcIVeRwUpNiWCP8Qhmi08/Cka
         akqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726505909; x=1727110709;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yk/h5FBiZK67j4ccJbtxk7Fvu6fYbqtAXQZenT1Ni5Y=;
        b=fVJMLYMwrct9t34ieYu1tx022Z2/UMFwzeocyu7JmKDMBXBP209KVEYPY3rlvBsQSq
         RPT+dpgZ1lrxOS3ZcpGo+4JIR+njFGk2nH5QltxlZqjsYKYVzXwXw1dsxUZMLaMBp8lz
         uCFvkWIMQfFJBOvD0lWnc/zwsClzn7bBl57GjE+UvbYVj92J+4XqEX6Rwte9wXy4IC/1
         qQWn7TymBhei74stAoTnKeFzIATynrZcwGHVzmEYJJOqvpgKKvntqflICeC2w9e/aGwy
         ha/pl4AIQypkBMCCA+sYbgPH2ItsbteldNiGeErbZxg8EpLeizm4X1jZMnWn0yKh1uIB
         dQFg==
X-Forwarded-Encrypted: i=1; AJvYcCUMT/noN8RdHDEjnIBAQvaNGwgRzHJHTfb1n/3zxvKGnErscTm9lLxZELaFD4NAslrJUV5JmtEcbbL8019INJrH4A==@vger.kernel.org
X-Gm-Message-State: AOJu0YywnrXHhxjQ8jV9qf9dygwCujRBkZY+Pa7Ohwouw4L6PA1Uqbcm
	cqcnPjLtgrQs7Yu/xQ9oeaAcc8pQTe1+lR04aMhpkCioQIVeU3l0HFLJkNDUzBg=
X-Google-Smtp-Source: AGHT+IG1GyB4Uzmr1jsA2DlRryPeboo71WZg5vEXsdjAHjoidTLA1PP/1PSbdjCuFfXWUR7lA/E6iA==
X-Received: by 2002:a05:6512:15a1:b0:52e:999b:7c01 with SMTP id 2adb3069b0e04-53678feb0c0mr8003888e87.48.1726505908290;
        Mon, 16 Sep 2024 09:58:28 -0700 (PDT)
Received: from puffmais.c.googlers.com (30.171.91.34.bc.googleusercontent.com. [34.91.171.30])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a90979ceb67sm32992966b.219.2024.09.16.09.58.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Sep 2024 09:58:27 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Mon, 16 Sep 2024 17:58:26 +0100
Subject: [PATCH 1/3] arm64: defconfig: enable Maxim max20339
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240916-max20339-dts-v1-1-2f7ed7c24e83@linaro.org>
References: <20240916-max20339-dts-v1-0-2f7ed7c24e83@linaro.org>
In-Reply-To: <20240916-max20339-dts-v1-0-2f7ed7c24e83@linaro.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.13.0

Enable the Maxim max20339 as this is used by the gs101-oriole (Google
Pixel 6) board.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 5fdbfea7a5b2..c43df2164201 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -778,6 +778,7 @@ CONFIG_REGULATOR_HI655X=y
 CONFIG_REGULATOR_LP873X=m
 CONFIG_REGULATOR_MAX77620=y
 CONFIG_REGULATOR_MAX8973=y
+CONFIG_REGULATOR_MAX20339=m
 CONFIG_REGULATOR_MAX20411=m
 CONFIG_REGULATOR_MP8859=y
 CONFIG_REGULATOR_MT6315=m

-- 
2.46.0.662.g92d0881bb0-goog

