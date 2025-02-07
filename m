Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 569F323C8D0
	for <linux-samsung-soc@vger.kernel.org>; Fri,  7 Feb 2025 15:56:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738943812; cv=none; b=Zt+cmu3pOzZW3/uANfZdDSyzDc+oeCIfysccIoWWlyhfkk3Amm9o5C2nnjZsCin8pISEJoPE8ddMwRg4WoPsmXo0xAqVTA6MKAu9XO8/2BUzDvlPMLp75bRsdPNt/CMY9BMN4jV3kAtN8ZwsTJ9P4e1aypMSqd7wDvtzrlF2tsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738943812; c=relaxed/simple;
	bh=zqmyyeN/kAHahNeROhtKWHf1vZ7bvcbTcmNPC79a1h0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dsLIOCMgFyZH9Kk1V0/Vq33knyrxIHfFpoj7uTOIzgvHzCsAHxxCSXRj3iipUzmGFX8NWXvj2uOG6/Fe6RWIUcOI7E6LDQw07hdOal04RewkirZ42IgHpuI/1qsUd3lRzZf5mqHaHryeJmrz4LhfH8JCIRLmzLT8bU+GP2XWHyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aJeQsdqC; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aJeQsdqC"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-38dc33931d3so866595f8f.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 07 Feb 2025 07:56:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738943808; x=1739548608; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YHHEMHsU+0a4+oqKZwIsh83OdLTXo1gU/En19+RQunI=;
        b=aJeQsdqCsC8cCTmrXarhIirgG2L8sSq5FMTXjy20YrVVfG3rYBqBHXL9abYtizUOF+
         8gRUxk95dX8QpoW9kcSQH04FGzAJQAQHQHQgEHWJvcISgPWPNIGMZZ66xhH3V8IPkXSl
         nXXcbCNisRy5d/DJ75ywKN+toEJnJtc0jvKNZaq9Gu5lC7O5ISGQskvgX9B3Qid2XOKD
         MB6lg8iBF4r/IK/H4QxNv/PbPIpsvfrvjUGnH/f1KGfChWZMX0GOP7tVZcMttpcOHsqk
         fHZF4ckl2xM66wcifjp2UTAkS/ewywfSV+aHq66GgZUK+6Z3PNjtzubitrRedeUO/+m6
         pSCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738943808; x=1739548608;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YHHEMHsU+0a4+oqKZwIsh83OdLTXo1gU/En19+RQunI=;
        b=OUhDSraoc+nDkcQedcARL4JiHLqZ1WJPZMhrTPs5Qrm/1g950MVetK/fybb09NzulZ
         1mTVUKY4rhlIdk0eZOWV102fKH0sGzoY6EbQJBhLp+OtI7amDSwCWMyYvyevvRA1n+FN
         ltuSqRpgpiMZfE7lfyVwnkrEcLEZfh8vfKf+MQTiYiSl/2OY/fZXof4UwDzZ6I6zOmin
         LBhHKk1NnB/mSbGke8Kq7gQFBhRx59/M85PRzjLheSOXGNd0bCdR346mjNGFsRNajymr
         A6Snuy07NDhmUaibpp98ANtXzefjJRNK4V17xV5WanieXonqZBwzs7S3dhS8cSQcFb7S
         r8HQ==
X-Forwarded-Encrypted: i=1; AJvYcCWlrciVkDEl+ws2jvloM+tlJmGXExNc57IHEkUGlHRCyAIeqlGyeoEMlag+cXPntkNCZbJDzo94EEoSOawVSHJXjw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3tCehiyiphOE8MJkferxiDZeoU3m2BhQ/d89sJoMycr2cQZAe
	KNC+HVMzgUKL1irKzJLNBlpDqjTzxaxoKjAh3q5LbIjRFXC8k6cKYHFbkdGNijI=
X-Gm-Gg: ASbGncvItWi3s6QURB3oyVFZGJasMzBwzA/dtd4+wwexpE+gWqfgAtbZYbk1R52eph/
	McU4ozWFdm37SQJOcXJreCsnDuCmdSfIG1ZhWX5Jfs+K7hlICpCr4dITNEvehf631fKCFr+G/rW
	cJzho6XZHpyxA7Ped+HMy7cX40nBYdb1RfwqQIzaYBvAhHJymk22hydEQnEEMda3hj2KOE3jj68
	VqW8N03SJbEI2QhAFpGT/vmrMVkwSTsG0oo47lvnLRuckEnDTwaWEyB5OGbJxIMA+284R96Q4S1
	xqm431MK8ILxUb0dzmFTw5N0OhdScsGT7pxyrGaGF/I7LcT1CgObFLNJYBopHvHfr1lSOag=
X-Google-Smtp-Source: AGHT+IEDZvEs9s4rKpAVm7wDLvW/bLNvak1Ptn/SkxGZOdPZ2WxEoPVQJKAp9WJcIeZNJtkpg4J6hg==
X-Received: by 2002:a05:6000:1448:b0:385:ee40:2d75 with SMTP id ffacd0b85a97d-38dc8dd9511mr2508329f8f.20.1738943808512;
        Fri, 07 Feb 2025 07:56:48 -0800 (PST)
Received: from ta2.c.googlers.com (169.178.77.34.bc.googleusercontent.com. [34.77.178.169])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dc09fc2d9sm4197507f8f.6.2025.02.07.07.56.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 07:56:48 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Fri, 07 Feb 2025 15:56:46 +0000
Subject: [PATCH v4 4/4] arm64: defconfig: enable ACPM protocol and Exynos
 mailbox
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250207-gs101-acpm-dt-v4-4-230ba8663a2d@linaro.org>
References: <20250207-gs101-acpm-dt-v4-0-230ba8663a2d@linaro.org>
In-Reply-To: <20250207-gs101-acpm-dt-v4-0-230ba8663a2d@linaro.org>
To: Peter Griffin <peter.griffin@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 andre.draszik@linaro.org, kernel-team@android.com, willmcvicker@google.com, 
 peter.griffin@linaro.org, daniel.lezcano@linaro.org, 
 vincent.guittot@linaro.org, ulf.hansson@linaro.org, arnd@arndb.de, 
 Jassi Brar <jassisinghbrar@gmail.com>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738943805; l=1030;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=zqmyyeN/kAHahNeROhtKWHf1vZ7bvcbTcmNPC79a1h0=;
 b=d7DWG9cTHp3/0OLPztRrajPmsnKM3gPa+i7ZpieVei1gzfDXy+CtBAQnvfIs9uoSuXu6EqLbZ
 Zu1Scp59poYCz1QFb87V7AZEXSwyx+B8/yOAT5CxQ9bh0+TpNKXyXx1
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=

Enable the Samsung Exynos ACPM protocol and its transport layer, the
Exynos mailbox driver. Samsung Exynos platforms implement ACPM to
provide support for PMIC, clock frequency scaling, clock configuration
and temperature sensors.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 arch/arm64/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index cb7da4415599..18f96796298c 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -264,6 +264,7 @@ CONFIG_IMX_SCU=y
 CONFIG_QCOM_TZMEM_MODE_SHMBRIDGE=y
 CONFIG_QCOM_QSEECOM=y
 CONFIG_QCOM_QSEECOM_UEFISECAPP=y
+CONFIG_EXYNOS_ACPM_PROTOCOL=m
 CONFIG_GNSS=m
 CONFIG_GNSS_MTK_SERIAL=m
 CONFIG_MTD=y
@@ -1403,6 +1404,7 @@ CONFIG_HWSPINLOCK_QCOM=y
 CONFIG_TEGRA186_TIMER=y
 CONFIG_RENESAS_OSTM=y
 CONFIG_ARM_MHU=y
+CONFIG_EXYNOS_MBOX=m
 CONFIG_IMX_MBOX=y
 CONFIG_OMAP2PLUS_MBOX=m
 CONFIG_PLATFORM_MHU=y

-- 
2.48.1.502.g6dc24dfdaf-goog

