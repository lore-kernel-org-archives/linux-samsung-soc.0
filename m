Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA42A22330F
	for <linux-samsung-soc@vger.kernel.org>; Mon, 10 Feb 2025 12:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739191928; cv=none; b=CKtNCicE685Hug0dCXEhOHfNrkbIogx7ojjyxOchQej9ZZo271ZzEIm/8dtLDljADSPQMgFuO2MuAUKdY08fOKjiz+rxrSXSj+3yKVjaX/JJy7eLOf6AeVvLm6myJK76m9ICR8MLtoZDaez1jrw3jFRthQonMDvTfBFPr3RMOeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739191928; c=relaxed/simple;
	bh=vV55kam7n89g+tJ4rn0KN8LW0wJxU903cCYlBxbrzus=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=V0/zPpBYApYuvLMtj8szE8U5LGaPASpLz0dA6jJwIorhKv4mX/XW4EImzhk6qLPsJS019D07Uag1ny2GPJx+nyPOL+7Oj/+r6VQ0legZO2SynPqe9+JSY5Rrz+0ZxEyRobtlsySGLXPgyxLvwqPTkLxRFgf/5l2xmeAx0hWYVYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cKdY4cam; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cKdY4cam"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-ab7b7250256so195843266b.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 10 Feb 2025 04:52:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739191924; x=1739796724; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zqD1g4YKIN7d8Jic4AmC6WlJ69pwzDTn8w0IL9Ra7Bs=;
        b=cKdY4camDS2OqMDEMCO/C/SYIfgfGgISDn16nz32JNJjbUDmYT1fd43kteB7hjr5Sn
         TrK3vSj519TU1G6n/UqFRj0EOtzJujDPv4O4SM3mbkssE8tTbRuComl9QWM9udMAvLyG
         9arzXHQjZED7DlTkHDt2oCKZ5WDWazv0GmWc02/xQyhfNLypWq4ZOjin1OgpdrIxM5wU
         9qm9//KrbtLp2DpTC7Sqq7Zli0GAPV2rSRyk8eJBKpjFrcWrCC13DbRuJZnTmTJN7+I7
         Vr4ajG5QjaZW5mvK5Qn0E1jxmp5xAiRXjzxaDa4wZvugj0PzJqYqxg4CkD42tj7UpTox
         iJfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739191924; x=1739796724;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zqD1g4YKIN7d8Jic4AmC6WlJ69pwzDTn8w0IL9Ra7Bs=;
        b=fUXLWebgz3rlTIXflWj07pF10ScExMBazduHqKdXBXYk1BMfSAAgV8hxRpaIfXLdgS
         JZSWczX7/5UQwM8Xkn77pnRYsfB6LLA/ZKOzoLyWeWSggErDXXlx0QhoV+QAiHjs6Nhi
         X6vxFizRr/05YIzaB/Y+FL9jfOE0CIzjVbxJbB83gEr55b55fThwBXhbZqtA7KUBFNeJ
         Y9LZTR0Pfx9hjTn+Zz1Pdxj+a0uHu86t5fzW4qh8LJQ2GkXTTQcK1jTwLLf17vwztZuu
         QfZd2o2x18guSGVNKjVnKlZMS6Gg6vE0KIPUQe32NpABiOf30aYkUDRv+0ujREZF05jI
         wtKw==
X-Forwarded-Encrypted: i=1; AJvYcCWVA75C//fMlBCDig+k+I5kFViy9iWmVwtrL4mmK0PbO/1yukD3Alueb1JzBFQCUZQ149m/WDi8M4WkiCAMo6dx7A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yykw0Oc/GKpXfhs7Is34VcLaos8a/gzInJaFczaKGecdguhjaQk
	h056Om5LkdifcILpyjop9OYD1MwH1xsQv6ZhSFApBHbk6JR5Yle8IMN9Wbg6vzM=
X-Gm-Gg: ASbGncuX5M+8tWBqjtFrYhm/XLLpoHJrqquAglI2HKGqhqe3SehzYeIdrNNjdDPVKWV
	+udJpfBURdU2kwMLbiWig6kdZZUcBUuXszogQcDRUcB+XB1qyxhR1X9Ctj0Nj3AkFOEqdggkHEu
	hOYx76wkFFrhygEntgiSaLactAtZm8DrIgypHj2zKUW3cGeJTQfoh3XgqwC9aSKAMVKYOeKz9Aa
	dU9+sBZc61MRflbo//b9fuhgVkmTpWon6KrUjS8XVHl1Twvl50M4SsrnIxUnntcpET2pQgk7w6p
	sd3sGy+QS1u+37h6RZOW+3deHRh+P3vyyhQOfqS7pEnRR+zlu+RWwK7Y+fvXM1d4sQ73J7UMwTw
	=
X-Google-Smtp-Source: AGHT+IEcs4lV823LwIXgoykf1sI1un5zsoFBvpa5yONNWVKm+6SAtdOLZFSfcwD/mDii+zqT48mO9A==
X-Received: by 2002:a17:907:2cc6:b0:ab7:cf4d:9b2d with SMTP id a640c23a62f3a-ab7cf4d9d89mr171928666b.30.1739191923919;
        Mon, 10 Feb 2025 04:52:03 -0800 (PST)
Received: from puffmais.c.googlers.com (30.171.91.34.bc.googleusercontent.com. [34.91.171.30])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab7ceae3a3bsm85819266b.129.2025.02.10.04.52.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 04:52:03 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Mon, 10 Feb 2025 12:52:03 +0000
Subject: [PATCH v2 2/3] arm64: dts: exynos: gs101: align poweroff writes
 with downstream
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250210-gs101-renppt-dts-v2-2-fb33fda6fc4b@linaro.org>
References: <20250210-gs101-renppt-dts-v2-0-fb33fda6fc4b@linaro.org>
In-Reply-To: <20250210-gs101-renppt-dts-v2-0-fb33fda6fc4b@linaro.org>
To: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.13.0

For power off, downstream only clears bit 8 and leaves all other bits
untouched, whereas this here ends up setting bit 8 and clearing all
others, due to how sysconf-poweroff parses the DT.

I noticed this discrepancy while debugging some reboot related
differences between up- and downstream and it's useful to align the
behaviour here.

Note: for reboot downstream seems to be incorrectly writing 0x00000002
and not just setting bit 1 (which is the only R/W bit in this
register), so we keep that one as-is here.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 arch/arm64/boot/dts/exynos/google/gs101.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
index e78dcd506a5c..86741994bb7c 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101.dtsi
+++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
@@ -1401,7 +1401,8 @@ pmu_system_controller: system-controller@17460000 {
 			poweroff: syscon-poweroff {
 				compatible = "syscon-poweroff";
 				offset = <0x3e9c>; /* PAD_CTRL_PWR_HOLD */
-				mask = <0x100>; /* reset value */
+				mask = <0x00000100>;
+				value = <0x0>;
 			};
 
 			reboot: syscon-reboot {

-- 
2.48.1.502.g6dc24dfdaf-goog

