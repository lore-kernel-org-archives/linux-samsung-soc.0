Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AED57155A3C
	for <linux-samsung-soc@vger.kernel.org>; Mon, 16 Sep 2024 16:58:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726505913; cv=none; b=Q454FYDmZ61CUgKg7JHVpuEM/XFGET59j3wESxlqyu+oRxtYvte7NvfTti0NRUiAoh9svq3Ue5RRR+gqN/+IwVJeGM25PnpeuPaKYmQ3pOnfUDCPtf4Xr6p6THTBbXRe9JnMOHkAZlKzX5YyqkMqbwJecsJt1/b51cz7qIUnCQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726505913; c=relaxed/simple;
	bh=s6i/fzSPozPo95wcaQqCNYjDpPyZpQB4dqJyJ9WhGrI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=LCwbg5Xr5D4eP+auBqizZfOGuMbjbqlsgjFmlmZIZ6VMtw4ihU2EAKJKy2yr04T/6lFW0UMcWG9PfHW9xWDXAtMS6vlfxINjs2u/0nDw5CCi4ce4I0QdPJM1YEaPhQbYPMhXNrmCv9gLbP5StVi7jhaNTQdwcWX5j7JZOV/L8X8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=n6XYr9Pl; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="n6XYr9Pl"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a8d0d82e76aso777665866b.3
        for <linux-samsung-soc@vger.kernel.org>; Mon, 16 Sep 2024 09:58:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726505908; x=1727110708; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=80BvolWRqd+vCna2rvdnH0ppBYcL8z4URj2M0qkUhYY=;
        b=n6XYr9Pl0ECrNc2Upp/dfkDWAdMmj9WUOxGs+5YnNhFARRvTVrzvf1DGj9cAicv43g
         lWCdITfHdM4/CqxULBHlpUTCdIcyp3yYGhGUK1kAk6XxyDxo4D2FtsbAGQkwvd2PNWoL
         dd75Rtz/NS3+jW/KQWuRIJ23utscl5EwGOiumRlQN+snOK1FjLFZmWe/VnwwXq0csYc6
         5V9zenJWYKcdK6C106A2jsV6hxOTf42rmyHvQtonuHCBgwlZTCIFwzxy3X0dcSEPj1uR
         43svYl66t08jerwvB4za7i/ZYHXuf6KnlGHwKPXrLPyo/IWFF8VlHfapnTDDZaiApNIr
         HQTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726505908; x=1727110708;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=80BvolWRqd+vCna2rvdnH0ppBYcL8z4URj2M0qkUhYY=;
        b=mV57fBwnn9A6jrO3bNlVY0Bq9Ix71CHoN1P7SlB5FIJuv+RFK1kyKYuCPQMyGwiK+J
         V0phrK6mRH7KczXR9go331DleVrgwFJAP/bPc/paKeRNHKSCVziAns//E/8OZASyQx6w
         /pZkOL92qFGWluRoDatl5MBV88bUtDR65eMMpRTvUjd698A8Qrhh0HOs6lUWd6o5jAbX
         xVuB+R01nKORj0US6ZPB6hZkltTeDCiSMVnjPOLm/gvS8pPVlnqYuI0AzWhpDF4h6OTh
         WY8kWwIeYN5I+4DvHcb/1ovCeojim6kruYs8uuUd3zmhKjhR5faWHtINzj2ktMZBgXNn
         tzcw==
X-Forwarded-Encrypted: i=1; AJvYcCXJJW+THtDge9lt5h6SwAUvFwrjhnLubBumnPkTXARDNFzJWfK/WQ/HwWoYlXhW9kTwB4EHuYst3BHzNQG+SllfaQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyZrlFPR+C8Dv1YTtJP6lHF9ZLOnSJEfzCPFSmwz572Qkl/Zg6c
	+2uRdc6z9jBU9A85akq97bduACiGMx/8oiP2v/VEBsp9xWhminngK5stOE/Aj/0=
X-Google-Smtp-Source: AGHT+IF4ndpzFvHoUkc20adekDMu808u/yL3lssD9NKD3r/HJwjqBzQjqBvlnzv0kYnwmnQBQIJpgQ==
X-Received: by 2002:a17:907:2ce6:b0:a86:b46b:860a with SMTP id a640c23a62f3a-a90296775ddmr1482776066b.54.1726505907790;
        Mon, 16 Sep 2024 09:58:27 -0700 (PDT)
Received: from puffmais.c.googlers.com (30.171.91.34.bc.googleusercontent.com. [34.91.171.30])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a90979ceb67sm32992966b.219.2024.09.16.09.58.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Sep 2024 09:58:27 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Subject: [PATCH 0/3] Google Pixel 6 (oriole): max20339 enabling
Date: Mon, 16 Sep 2024 17:58:25 +0100
Message-Id: <20240916-max20339-dts-v1-0-2f7ed7c24e83@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIALFj6GYC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDS0Mz3dzECiMDY2NL3ZSSYt1kA1NDi2QLw6QkY0sloJaCotS0zAqwcdG
 xtbUA0r3MVl4AAAA=
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

Hi,

These patches enable the Maxim MAX20339 overvoltage protector with load
switches for Google Pixel 6 (Oriole).

The driver and binding have been proposed as part of
https://lore.kernel.org/all/20240916-max20339-v1-0-b04ce8e8c471@linaro.org/

This is the first device behind the USB plug and can gate all incoming
power as well as protecting the input path from overvoltages.

Its load switches are used for wireless charging and for OTG.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
André Draszik (3):
      arm64: defconfig: enable Maxim max20339
      arm64: dts: exynos: gs101-oriole: enable max20339 OVP
      MAINTAINERS: add myself for Google Tensor SoC

 MAINTAINERS                                        |  1 +
 arch/arm64/boot/dts/exynos/google/gs101-oriole.dts | 51 ++++++++++++++++++++++
 arch/arm64/configs/defconfig                       |  1 +
 3 files changed, 53 insertions(+)
---
base-commit: 7083504315d64199a329de322fce989e1e10f4f7
change-id: 20240916-max20339-dts-c0518c81bb39

Best regards,
-- 
André Draszik <andre.draszik@linaro.org>

