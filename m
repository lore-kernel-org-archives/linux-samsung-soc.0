Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DFAB223DD1
	for <linux-samsung-soc@vger.kernel.org>; Mon, 18 Aug 2025 08:47:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755506854; cv=none; b=J5adL1QpWVeMMbht7TD6s/PtnJpqH1yoXrPgPv27UffEkOOHIbSRUGl1Pb2hIo5SvWXpNMcsdtFnG/lx5IeLjM34W8QR3klY6V9OLEJSafasM7baA5INR7P1W8UI162DFXsboI8bMK78YYeYeVGCZG6WBBbryeI/f25c7bsTr/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755506854; c=relaxed/simple;
	bh=BFqb772XKvnkGz/X/GiHYC9tY0Kc1FlOx29S2g2BP6k=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Puxl9sSA2KETUHjvUzUrO1ynmhrQs3WQx6wt/nvQ/h1iSBV/tV8NCCDA8x1iRosKyrLmT4FdIDbBlgMad8uGDTkBf9iDHCdOcVxfZAgxxz2RAq+KVgn84SFCszSOdj0XYy0AOJ4t7EdJL1Joc6Pc/KEht5iH2OBHsL2svTpoWas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JwUdK/5n; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JwUdK/5n"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6188b761d74so687830a12.3
        for <linux-samsung-soc@vger.kernel.org>; Mon, 18 Aug 2025 01:47:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755506851; x=1756111651; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BeuayamteocopIdawkFz8GBgWsuO6jcTjJdO7tqQ9I0=;
        b=JwUdK/5nUdkGf0zbwUKOLs+S0/DASbi0UqaDUkEU3nwHR+Ki8Z8Jfsv7aJy0kJ0ABx
         5xaFtRBJpyIdqZthpPCUnb+I5wVK+kQR8UgrdDAt756aGl5ruv44ArgHOKGcjHyhZ74w
         IvkSP2pKgTk3a2OofaEF3+HKt0zyjgCZSKW9FIpQTXEVFTZv3bPE2VerVme+5wX5hEJ8
         3wjbr2HascFvi2Fau6qL+OZiOiSCRVegWe+cWc60BNs5CPSXA5vAwFDPYOyBiW2lRwHp
         NHxR5cvdwiKAgfn8rZ4SZ7CfEy8DC4NKuYDDEWRi2Ke/742SVuw696yP0Fbw40/M8jFq
         XH6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755506851; x=1756111651;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BeuayamteocopIdawkFz8GBgWsuO6jcTjJdO7tqQ9I0=;
        b=i4XtjzXD9BWhjeK+5qBESg39WVYdwOkvYeKhIzSbmNslOs38JT9TpWWeYYTktmO2gQ
         /XMuXE840Ez1mfuTOEFnt2GlTZ/ydWxrQE9vYXzthSIwNU3+BTI4c1ar+N82dfGZhdjy
         Z4J5ou3FuUmndrAzWZu3f0PSswO1LUpVRzNWc7QFgeY9J+Qh4m6/Z0SEPTpPGBlp9n1P
         G39GgjuyLy9UsfC8k1nogpMDD0bK6vARSyG+GYCoHNc+rSnlbuz2pTro61N5hGibzXJs
         PKM2ciyUCJ7Vohjpju3XhqTpXghsNgw6b/UrfgqtFSyFG8z6BAyAOqk8seFPSj+i/gR0
         +TnQ==
X-Forwarded-Encrypted: i=1; AJvYcCUHVfB8dpec5HzOKMs8eyW7mWE3Wtc7k8bYy4OQeoOWlzfYz7FiRl1pHpfOS5okfNeEl4tcl+dnUIbTIty4CObdFw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0EZ861Qic3JYVJv7ZvwcMfY5ObePAJvL8kKTX2WeGew0+yxtp
	0tkcjgMwK6krfMjL44LOxi1Yit5t9ZYMRx88am4TkCGrp3rkLPuSZX2eZjueC9K/Jl8=
X-Gm-Gg: ASbGncsPMoIDw5EMQ9x8gvQDrQDvcTracRGwSYmqXaCaZIThuyV2VNPrWcqkZsvHYZm
	nhRQC08t4DehIk3ZHGQPUAzj7wpiesnX75wpyAumbmDe/hS9SS3fHB2Ee2IHys6zuJYC8Gc5kbB
	8rfthAi+O+onh3lT53QMXtntzmatuwSgKAQRzS1RcPD9L7k+B/AWWv18+2iSVyHmYl5bPH1ihOg
	RnVBYosa/gBhW2TkxSKrqrKjlmO1Gm25Ix6WOSpHjPYSkJnDEMWAry02OcyzznTE5RhpOPvtClR
	zbavO3ZRh/nXmIRClX+PhcfeoHMliM/maJxS9dqa1JIEVnyTB8yJEy8dAgFbD2dPAOKbZRw4+vq
	/IMK62Pw54pAakgdg1hcAtyr+/kGbj6WFx5cwlt5d9EiUP4bVrg==
X-Google-Smtp-Source: AGHT+IHnFT/QiiX+/jyxr6JrjJHBnX2ZgiTGkz6V56Qs5+zyrhsCVsoAqUSeVCMOf8wng75ASWqViQ==
X-Received: by 2002:a05:6402:440a:b0:617:be23:1111 with SMTP id 4fb4d7f45d1cf-618b0865203mr4787283a12.7.1755506851453;
        Mon, 18 Aug 2025 01:47:31 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-618af9da68fsm6627647a12.22.2025.08.18.01.47.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Aug 2025 01:47:30 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org, 
 krzk+dt@kernel.org, conor+dt@kernel.org, krzk@kernel.org, 
 s.nawrocki@samsung.com, s.hauer@pengutronix.de, shawnguo@kernel.org, 
 cw00.choi@samsung.com, rmfrfs@gmail.com, laurent.pinchart@ideasonboard.com, 
 martink@posteo.de, mchehab@kernel.org, linux-fsd@tesla.com, will@kernel.org, 
 catalin.marinas@arm.com, pankaj.dubey@samsung.com, shradha.t@samsung.com, 
 ravi.patel@samsung.com, Inbaraj E <inbaraj.e@samsung.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, alim.akhtar@samsung.com, 
 linux-samsung-soc@vger.kernel.org, kernel@puri.sm, kernel@pengutronix.de, 
 festevam@gmail.com, linux-media@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org
In-Reply-To: <20250814140943.22531-2-inbaraj.e@samsung.com>
References: <20250814140943.22531-1-inbaraj.e@samsung.com>
 <CGME20250814141003epcas5p167e0a3d0ecc52fd8af17151cdddd031a@epcas5p1.samsung.com>
 <20250814140943.22531-2-inbaraj.e@samsung.com>
Subject: Re: (subset) [PATCH v2 01/12] dt-bindings: clock: Add CAM_CSI
 clock macro for FSD
Message-Id: <175550684881.11777.14718777449068060989.b4-ty@linaro.org>
Date: Mon, 18 Aug 2025 10:47:28 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Thu, 14 Aug 2025 19:39:32 +0530, Inbaraj E wrote:
> CAM_CSI block has ACLK, PCLK and PLL clocks. PCLK id is already
> assigned. To use PCLK and PLL clock in driver add id macro for CAM_CSI_PLL
> and CAM_CSI_PCLK.
> 
> 

Applied, thanks!

[01/12] dt-bindings: clock: Add CAM_CSI clock macro for FSD
        https://git.kernel.org/krzk/linux/c/5576d8098052952a6c95af86ad3dcb341554ac75

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

