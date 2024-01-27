Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF57815AE
	for <linux-samsung-soc@vger.kernel.org>; Sat, 27 Jan 2024 00:19:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706314789; cv=none; b=JknC7aGssjL2AfA6uAP90HiId55bkVhheJZDWimbkMbnaYcQgg7J35ywh9GUhAyQUb3HszHIJ3EM7/elmRJzYkRykj3ZfXaQSlnzLWUpXlp95V8trDLOIQvIHKMBsZxKre/UWvBWqDsyDOyXp4SQq1OpPOg5dZfg/2jm/nl2/FA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706314789; c=relaxed/simple;
	bh=SRaoY6Wy5mREGBPRLeiPUUSrZarGUQsXs633eSkifMk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ksxLvYYjvE5HMr5eqqjIIdbv3Zg/A67nVxr+NSfSDYkDDat7oesBs4a59xgP63B2noB6B1NtRmOFAngFCWhBHmvYcA7osgKSifQaBiDfYjlzaMFZCtGUMyGiDfySf7a8zb5kCRHKLYiqZ2xp2blP9KcJTVnclDwedfCJm9FkxfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Z5vteu3N; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Z5vteu3N"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a26fa294e56so98715666b.0
        for <linux-samsung-soc@vger.kernel.org>; Fri, 26 Jan 2024 16:19:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706314782; x=1706919582; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=72FI1Gr7K77cw7b0NtV82bnbC4R0Os+Pre+olDdbzEQ=;
        b=Z5vteu3NWLMbaFTrA44z1MUI7x28cDl1ABzweSWx/0bafdEgM7KGP/VP5g6eUilx5E
         5ch6064w7k4SezG0qyhikZt0mecw3cZBwZz5mo7O5dqQdu3UpfFz2Gba0znEfzvJcslt
         7nMIyiyJXa6E1iwGwOB8Q5DFt9dgriyqRCE7BfQrpYM2F5sRqG2xndygaaQEldfP5GbH
         pqjeQxDNeuyFLZ9Rc/wMVBtWNqz0FqXy1TN63BJrFXiEy19pBBTC1w/a64OhtRhZVFyo
         AL0zATsHoTg0xNw5LxfXnTlQtYg1NmlhSLC7/8/rtzraKVmsD5u4UzNuRIW5/qdcQuF9
         Kt9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706314782; x=1706919582;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=72FI1Gr7K77cw7b0NtV82bnbC4R0Os+Pre+olDdbzEQ=;
        b=dKS5a7ok0bnIfG7kzKyDtPjPkTcWY04ybhbz3H1yiVQLIOpxvJiuG9/h1YR7HtEDiu
         WzoeXxoOn9qUfy8p4c08pA7R6NNtuMaHpjio6GR8cTKjJjnzKNGBr0aeXb8TU0+6GT3N
         AKnVrR2yaup0oPsKZg5A2jLlZ1zIpgGFMbE7szVoqSv25EdzetEHFFsOymxprbE8nPwt
         hbedtwli4qN6RLzIJyk26TF3Dt4O5KoCn0WSz4XkJO3R4tItHzc8HPMm0M7fS7yEkJsD
         5szlatJH4btKWgZgiS7v3I+RELbjUU3EdeRX5xl9HE7qOVI5P2h4U1a7GO0TnLvafd4Z
         7XZA==
X-Gm-Message-State: AOJu0YxIbFbETRU1rN23N76AvIqnvMM8TgRpnSYykYWP64k3BsYjnna4
	zXm3rv5sI/FYjox1rBPKFaMayfz2MMLMijJvtA73Xw48xULoWLaMycNFN9tEA9A=
X-Google-Smtp-Source: AGHT+IENxC5NzltrZvHqg5cPuaM1cJlF4edDxysfXqaJmLH/0P2mdMA5f7sFpZvo3B8zspiigKme0Q==
X-Received: by 2002:a17:906:a001:b0:a30:70fd:7749 with SMTP id p1-20020a170906a00100b00a3070fd7749mr307520ejy.47.1706314782668;
        Fri, 26 Jan 2024 16:19:42 -0800 (PST)
Received: from puffmais.c.googlers.com.com (229.112.91.34.bc.googleusercontent.com. [34.91.112.229])
        by smtp.gmail.com with ESMTPSA id x16-20020a170906135000b00a339d705a10sm1141359ejb.80.2024.01.26.16.19.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jan 2024 16:19:42 -0800 (PST)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>
To: peter.griffin@linaro.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org
Cc: linux-kernel@vger.kernel.org,
	kernel-team@android.com,
	tudor.ambarus@linaro.org,
	willmcvicker@google.com,
	semen.protsenko@linaro.org,
	alim.akhtar@samsung.com,
	s.nawrocki@samsung.com,
	tomasz.figa@gmail.com,
	cw00.choi@samsung.com,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 6/9] arm64: dts: exynos: gs101: enable i2c bus 12 on gs101-oriole
Date: Sat, 27 Jan 2024 00:19:10 +0000
Message-ID: <20240127001926.495769-7-andre.draszik@linaro.org>
X-Mailer: git-send-email 2.43.0.429.g432eaa2c6b-goog
In-Reply-To: <20240127001926.495769-1-andre.draszik@linaro.org>
References: <20240127001926.495769-1-andre.draszik@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This bus has various USB-related devices attached to it.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 arch/arm64/boot/dts/exynos/google/gs101-oriole.dts | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/google/gs101-oriole.dts b/arch/arm64/boot/dts/exynos/google/gs101-oriole.dts
index cb4d17339b6b..c8f6b955cd4e 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101-oriole.dts
+++ b/arch/arm64/boot/dts/exynos/google/gs101-oriole.dts
@@ -72,6 +72,10 @@ eeprom: eeprom@50 {
 	};
 };
 
+&hsi2c_12 {
+	status = "okay";
+};
+
 &pinctrl_far_alive {
 	key_voldown: key-voldown-pins {
 		samsung,pins = "gpa7-3";
@@ -113,6 +117,11 @@ &usi8 {
 	status = "okay";
 };
 
+&usi12 {
+	samsung,mode = <USI_V2_I2C>;
+	status = "okay";
+};
+
 &watchdog_cl0 {
 	timeout-sec = <30>;
 	status = "okay";
-- 
2.43.0.429.g432eaa2c6b-goog

