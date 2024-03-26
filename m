Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C39818EB1
	for <linux-samsung-soc@vger.kernel.org>; Tue, 26 Mar 2024 09:00:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711443624; cv=none; b=YZ2fkLiu3pl/Slktrl9VY+oInQ2TAHNTHcAb+ZobWRjsW7SUFaoNA+l4vEpVB+viMf4shO6tO1sFHaBlQ+xotoVt07gp4cah0ak75LvN37fmOx7ruu40BAr1zMNpTcBxfAqnYN3yvMI0rNKNN5bBjBJr88TK6YX3o+od4phmhjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711443624; c=relaxed/simple;
	bh=pNzfa0tdg/eWAuQZW6ONxAInY6gp1HmiXSutOixrMY4=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=AW/gIFrbayboXuxHxD95aoP2w/iHptH95wmOzfjHVMRp5BMzGdLFCAmVPB/IWQoVNHbqeAINyummQubrDCGUiQvNWv/YjO1X307foL+P+BLjq8po0Hxq1Tz38pGVPKggA96EX3q3bhNbOrn2pMpaneEvp1VaROL+ZZXAodhhtOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=b4+gF7y6; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="b4+gF7y6"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a466a27d30aso645964366b.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 26 Mar 2024 02:00:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711443621; x=1712048421; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N4iPDWY1+f0T1Q2vEEbvMtradJ/i1iR854HyXNPduhM=;
        b=b4+gF7y6P3rpW28puep8VGUIolak4Z4zZ/lajVUvG8+HVxMUFYJSJU5IcHwtVxuLKN
         uYZf+7iCb6nBBdysbt630Lcr03c7E5ukk7yd0aUgd6srAgToWkgmxty5xZfnHAQhKJql
         pSg05LEbFG5rDfJMhLj6L3ZTJ+bu/Fu4Q5IaxPMQ4DjLMc8K/bJlR6GSIGfs0CSqexdl
         YVbXIgOxAUzqzRUMq0NqYWs4PVWHEsFo+Druye6k6aeGQ/p/4kO0wM8PEpF/DonNMRv9
         vuiC7QVL4C305hngY/ab1JHVR0eE/DRq1pp4lvKzVFqKUJhC/SK9Iel81HHNkaqOu9AA
         cWZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711443621; x=1712048421;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N4iPDWY1+f0T1Q2vEEbvMtradJ/i1iR854HyXNPduhM=;
        b=k+WjwPn+umOxFtfH1xWWvXd3V3kMMqzMJGtpO8buiETX8DWVqcINMqkW7woR7tdxUS
         Vh4kE1z4+mw9UYl8cywtzT2V4nSCRY2ywhQR0Gnpvv1WC/9MBl0DyJuYkHTj8qR0VFSq
         HgTnfzEzPir0Pz7DGDngHKF8dnsJfg1SAxQ18RUnuGb8hfkKsAZ3EKlr/4j6BCMLrUZF
         tL9OwhCScNR8hBcNB/CsuvAs6/6nLcurd6C1H3MPzhLYMpRTYt/AEVF+OhjNK7TMsF/H
         KOIPSP8oJMWWfcvwm9OScAWTuWeetwzuvquBG+Id4jJnuX9bEGoXUhts6ssh713hrKvi
         vWtg==
X-Forwarded-Encrypted: i=1; AJvYcCWShw4EUGPd07OPh2kvidpV7nOemuS/MYHow61w6j4DhtIrTJE5HWWGLHv4agoEdJu3rKORcuXprTtKuN+ZdP639LeaIV+4jYF2/gW3bNHHdlc=
X-Gm-Message-State: AOJu0YxeYNG1YvoGiDHg42AJWF0Aj1SiJMZHT03W+vdkX53djyCUjCpe
	FJLUje+UVkgNAh4oSQ0Y3a+twW09eaDdtFKwMyVhiiuEk9+UE4WdgwqM97/5RjDvkm9be3Ov33L
	A
X-Google-Smtp-Source: AGHT+IEyA1ZISAYO+CTSMcYnd+8P39nO4D6VhkYb5rVIQFSdgNbddobawaW1CRoklpLfMEqGbBHpSw==
X-Received: by 2002:a17:906:260a:b0:a46:de64:c479 with SMTP id h10-20020a170906260a00b00a46de64c479mr5987710ejc.69.1711443620676;
        Tue, 26 Mar 2024 02:00:20 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.222.44])
        by smtp.gmail.com with ESMTPSA id a8-20020a170906670800b00a4710e7817esm4000973ejp.135.2024.03.26.02.00.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Mar 2024 02:00:20 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20240312190348.724361-1-krzysztof.kozlowski@linaro.org>
References: <20240312190348.724361-1-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] dt-bindings: memory-controllers: add Samsung S5Pv210
 SoC DMC
Message-Id: <171144361934.95197.9760843620606063956.b4-ty@linaro.org>
Date: Tue, 26 Mar 2024 10:00:19 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Tue, 12 Mar 2024 20:03:48 +0100, Krzysztof Kozlowski wrote:
> Document bindings for the S5Pv210 SoC DMC memory controller, already
> used in DTS and Linux CPU frequency scaling driver.  The binding looks
> quite empty and is most likely incomplete, but the platform is so old
> that no one expects any effort on this, except documenting what is in
> DTS.
> 
> 
> [...]

Applied, thanks!

[1/1] dt-bindings: memory-controllers: add Samsung S5Pv210 SoC DMC
      https://git.kernel.org/krzk/linux-mem-ctrl/c/e23359d88a81679e7c55d221e7cb4c39abf5d760

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

