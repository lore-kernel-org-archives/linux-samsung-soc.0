Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17B9F28541A
	for <linux-samsung-soc@vger.kernel.org>; Wed, 18 Jun 2025 10:25:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750242336; cv=none; b=WfR0enBipPPOkDevsYsPEeTzYQ09UiHHqplkIwknVXNOoHQyWijwLle+8pjFoc4gGSz2gW8R0Ykw7iX2A+GAfWzjSxaIgxRwt7It5gXYKYB5RhNYyIfy9x4jzepnOLnC8Vwu5ITyuw3JQffv2HGwR7ptY103O1zWZEiJ1bsnWsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750242336; c=relaxed/simple;
	bh=uo1jmmJSy0Tm6Ew7GTrNegQ39fiELjbLn8M0YyzkaJw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=LGP6w+VGLgc2ZnIU85634Yw35w6R0Astkez7Us/4/1J0Iedqw7nwHvzQpbMR+x1cg53VFz5X8iy2nDoZ18qoq9jt/1xCL1hCK6rkJ8mNZdi2pcExLyada1dPESPgFX4keMaDun2aBupQW4EH0qVS48+UARzdWwCE+T7pfzWIyts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Hr6b8wA4; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Hr6b8wA4"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3a4eb4dfd8eso635493f8f.2
        for <linux-samsung-soc@vger.kernel.org>; Wed, 18 Jun 2025 03:25:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750242332; x=1750847132; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kScCCH5B6HIlYQ8SpyD5iNsGwgWDsSmheszSBGTWPdk=;
        b=Hr6b8wA4ZVknv3s4tX8asKYW/bbgPEfyGaUsmU3FRIUEw4xDT7C1uP8XSciWW+IPqW
         /lRl3HtLsDKNj9pWLJvvYM2smcCDzseN2F/T2Az4P9AMZh/p9qIlsKi/RNFa6v2twa7z
         RuTbmHP2/CIsBm8MsgvrBMtyfOEbLEQKgdwuySv/xzCElXfEJp0A5zlbKsYTy3whdDhV
         TZUA6KgYxbHoMZsHFfSAqiPn2fwd3cY1u0z1oGjRi1WWyeiakJez8ovuI7YQ8HIbGLx3
         9jFwMZFBVDJxdbY6rWD/aKAO0eNnDg/LxPtfNmTIC4sgY9VZrhsPBQmTtKHHG1fuIeos
         4lVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750242332; x=1750847132;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kScCCH5B6HIlYQ8SpyD5iNsGwgWDsSmheszSBGTWPdk=;
        b=GbFeqG1QIokNpUKbHKvKMQYqAAQ5TKdfYaCHY8mDn3i1K81ARRth04vnHsUG8B0blP
         FBU30XvpTKO/hKDoMescdjGD8PdlH4KhFDhqt0/2xArDVnMUh8JsYyOScgdENGdGlnqz
         GK2u37hyvzsQGLSP8n/tlS0D3Hfbfyx5id9IpL3o5Tr7BVAF7/7pJtRdpqtHhLYARNGI
         ZISJL97OswAWLQm/DznMb80eMWp0h7a5sSTFK5djkH6+kcL2KLnXNtd0ODpva/X2o8aC
         LJqUITvW9Xh702rR369ftlWFRTl4nJTfxHkIfm816lsIQjDHDPzEPKQydIVHL7WhNWSs
         k4Nw==
X-Forwarded-Encrypted: i=1; AJvYcCXGyBO9Agh18k5gor+F3W6Fi0SYjCy34BwqDTGb9ZLjRUT30JyzSDloHdW+KllvpSHYi72Eknh3Q/nvKHyrcHRjPA==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywnxw7x7CPrLJ43o7H8IhuoGCGjKmwkzt+bZb/o/I0ucShaNym/
	qv04ul6u7LVJg29lgLeQK5dIhTlPrdsw7VtxzoQluJXQML/behvbPihhi41JBR88+Tg=
X-Gm-Gg: ASbGncsGGvblN57W+/C+S51CIvbrlUe5Q/SbPbF+prSM1kt9Rqlx3HVkABQNN/X+WDV
	0pe30ahCjAqcM7UGevUpPPUlC7RIS0wJlP8Nb59j3HyH1iQ2wE8yl7IVP6OBSBCYq6zl/Qfdfav
	g3xt4ehFUAwIeuPzFkMPc1WRmI780yMAosjnLS3+7rccEEXnGuTrMwlFDPCdCMnmeUCksOx9fHa
	/CM8MfhAFrb3eK2nx3cOtUMLP8O5BZBp/0B5rNEChd+yG7r+votxyQRhcu68RCs4PZ70L/PwVUs
	5mwLlp4BmKShfD3RSyVdV64Wkybtj+8yQWbEtIDLthfnYS38EbFzNLRzWFk31GbvmwKdAVmbyEb
	/tMjv0WA=
X-Google-Smtp-Source: AGHT+IHBRUMdMxTk0qQ52qgdxfLoQ44QoZ7cH9BJYyT5RbkqGF33Qob2tRNXh5Ck86JRubBU174MNQ==
X-Received: by 2002:a05:600c:3545:b0:43e:94fa:4aef with SMTP id 5b1f17b1804b1-4533cae6918mr59442205e9.8.1750242332303;
        Wed, 18 Jun 2025 03:25:32 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532e256630sm208260265e9.29.2025.06.18.03.25.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 03:25:31 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>
Cc: William Mcvicker <willmcvicker@google.com>, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 kernel-team@android.com, Will Deacon <willdeacon@google.com>, 
 Youngmin Nam <youngmin.nam@samsung.com>
In-Reply-To: <20250611-gs101-cpuidle-v2-1-4fa811ec404d@linaro.org>
References: <20250611-gs101-cpuidle-v2-0-4fa811ec404d@linaro.org>
 <20250611-gs101-cpuidle-v2-1-4fa811ec404d@linaro.org>
Subject: Re: (subset) [PATCH v2 1/2] arm64: dts: exynos: gs101: Add
 'local-timer-stop' to cpuidle nodes
Message-Id: <175024233092.57697.11258654075985089157.b4-ty@linaro.org>
Date: Wed, 18 Jun 2025 12:25:30 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Wed, 11 Jun 2025 10:34:25 +0100, Peter Griffin wrote:
> In preparation for switching to the architected timer as the primary
> clockevents device, mark the cpuidle nodes with the 'local-timer-stop'
> property to indicate that an alternative clockevents device must be
> used for waking up from the "c2" idle state.
> 
> 

Applied, thanks!

[1/2] arm64: dts: exynos: gs101: Add 'local-timer-stop' to cpuidle nodes
      https://git.kernel.org/krzk/linux/c/b649082312dd1a4c3989bbdb7c25eb711e9b1d94

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

