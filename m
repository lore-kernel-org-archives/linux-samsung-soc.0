Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C127E2D5C83
	for <linux-samsung-soc@vger.kernel.org>; Wed,  5 Nov 2025 07:25:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762327531; cv=none; b=Av/ulxomZhVT6/gQ5upmY7i34JhdsTWzjvi9lWBrr8BT7laPLcjC03Lk+7IfMZj4vWLA+QMEo76Cvs8q7Q7ctyt9FSNozianXauwkpthXHtevydcPzcQujlDI4vOJ2kcPUr7V1r4LNdAuQN5BQmhA6MXVbWkW1sDodpZTzN0G34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762327531; c=relaxed/simple;
	bh=MtDMcwiPMAuijfhsyZaI92s4cW9X8rbO7d13jBc597M=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=q443W3/Ep/farSKafg97e7A/QR6crnp+l9qOHTd1kOVm5m4dEhagChDlTBeWWFjRBisu83IaTE26ikPDgBh7tVErIB54erUUrbm2tjcqfaVUHMzjF3tPJUBHWYo++gEQcjCDXWkofFsjNnNA5AsZ9SlYb0GT2dn+gDgx4Vt070U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KkF6f+vx; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KkF6f+vx"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-b7128683174so36467066b.2
        for <linux-samsung-soc@vger.kernel.org>; Tue, 04 Nov 2025 23:25:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762327528; x=1762932328; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rY8qDK38lNCOQgDsv3kjC81fEngfx/ZqaQmDfuHd82E=;
        b=KkF6f+vx2HTVZ7f3a0kWOyRh9PxaETXu+TZA327encs4ih6xXpbfqxMHoYcXUxZnMu
         n/R7CV98PmpzkMMzTk9WWPM1PJ31rkuWcoVw+LVBRTIodmIaZP3xJUApxGkMOpMHMKCx
         1stdfqFXrvGhVSIKeKF6JIla6hWSsi+Oy7i/hZ2MdH9D+eZ6Y3eJqIo5/uyK/JBrqQt4
         N44aAsM1PTCL8MBIIqFoMwMiDuMFOvoOiGNtUykzeSRO8Jc6d5OmWcZEnCDk1aYjyNll
         UCU7mrDoxYJBeAUSEXeltzOxYmkkcmxfK9qt57QapaswdQqqhvthb5Ww6euUDGfPjjC8
         bYvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762327528; x=1762932328;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rY8qDK38lNCOQgDsv3kjC81fEngfx/ZqaQmDfuHd82E=;
        b=HsIebXrEsHrLEzx2WK+GoLmG0yfPM2+kYT/7LLisij3yZ+sv1yoGK1GnMQYnaqUI8O
         G28Qcsb2HK+0cvBCU/TmlaCC2Ju/nsz1ZuzzvThTfHODKbvNjzAh7ko12giL02VX8u0h
         H8fgbrV+TVdpbvmkxEMNrUvJuFpT4Mk0Yl6CocrTLliO1rmpximh7Ehc5yszcQu795Xb
         5SuADbdaFer3RcUmfVE/Lkd5umitQABfy8yG7JqOODi3i3973Um4qfbwVK9hNqJyxRbu
         H0fZnnbdfzFZuYSDdK4s0bLHk+XNTd9hD6M5Hm+Yyys0Ahybp7AZK0PAnbov784g8TGD
         iRxw==
X-Forwarded-Encrypted: i=1; AJvYcCVDKe+XnEBgDyPsGvhforus0yVIqJR+UNrvhjg93Hfg2GDMCgCYrdXRttE5KmTujd/gzq+L0kn6uwTPcz3dKao9Fg==@vger.kernel.org
X-Gm-Message-State: AOJu0YycmbDPDZpGxAR1JIH1+wtupEZB2nquzp2hfpaS1yONe887WUei
	zFdkfyB9u5V8r7FUHSYGObWWrMiwGwtYIIcKAamAZEKpy0QqDnFqVws0oTalvYB0kvM=
X-Gm-Gg: ASbGncsInEaCcVTaWkPokQelbEmtYQe8L+GxEGpYPWfyP0l59YJvlCF9BQ8bu9yIMrf
	alr+2ESF8d1W+KTiREQRs4wdKXxJeFbWc466OWIjCoPNgRyOZDHPnYOmludxnGEqukF5IsnA1SH
	gaJaIw61QDHjn+hNtEgjjRBF+l0xd8ohmM4pfUXB5PR+doloZWxbj91OZv//DjZsrlNqzv5INAl
	bosZYnNnnc23tdSZJG1tc7eBh+lFB1tHGFQrsEUltIm7SMuC73FJU5kwp5ByLvUooDESbAu8uz/
	RJmkSlziBGjLOIy6gtRpGWDVvOMcF1ovnbp21Baf3JPMaGcvCU1u8n8sQN9U9zcDQE4VrDZaV73
	wAqaZDPeM0QYX9TPvgsK7OEBHQJt2Uvn2VUxa8PiO8JPgmLz+dS9BlSmmSTUs/fZzNdjXPBZ4ag
	QisTPpXWpJAKFbzSOy
X-Google-Smtp-Source: AGHT+IFDmGcn05NWaAreeMUhIBohR2NC9khjvwR0aTsIxLFrJ5oJ/5mfubvbfEmAQ7WyS1CMvUR+Bw==
X-Received: by 2002:a17:907:9628:b0:b72:7761:1049 with SMTP id a640c23a62f3a-b72776157b0mr13498866b.8.1762327527943;
        Tue, 04 Nov 2025 23:25:27 -0800 (PST)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b723d6f8c5bsm411534866b.20.2025.11.04.23.25.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 23:25:27 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Kaustabh Chakraborty <kauschluss@disroot.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20251031-exynos7870-drm-dts-v4-5-c1f77fb16b87@disroot.org>
References: <20251031-exynos7870-drm-dts-v4-0-c1f77fb16b87@disroot.org>
 <20251031-exynos7870-drm-dts-v4-5-c1f77fb16b87@disroot.org>
Subject: Re: (subset) [PATCH v4 5/5] arm64: dts: exynos7870-j6lte: enable
 display panel support
Message-Id: <176232752674.13426.8964418397433880549.b4-ty@linaro.org>
Date: Wed, 05 Nov 2025 08:25:26 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3


On Fri, 31 Oct 2025 00:50:19 +0530, Kaustabh Chakraborty wrote:
> Enable DECON and DSI nodes, and add the compatible display panel and
> appropriate panel timings for this device. Also, remove the
> simple-framebuffer node in favor of the panel.
> 
> This device has a 720x1480 AMOLED Samsung AMS561RA01 panel with
> S6E8AA5X01 controller.
> 
> [...]

Applied, thanks!

[5/5] arm64: dts: exynos7870-j6lte: enable display panel support
      https://git.kernel.org/krzk/linux/c/cad767a9af055c921e29b7b268f99e83c82baab3

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

