Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B2241D90AC
	for <linux-samsung-soc@vger.kernel.org>; Thu, 17 Oct 2024 09:26:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729157207; cv=none; b=BK2CRFJXuoBFWzMFj4wyJFfXUkFPoZnak9/pBWe67nNXCaAp/S8MQ+fWj+yKhVUQBlW/OXobxualr54CaSx6j7zQwBFHksSOjG8gSMzokTQtXTfCl/FX8yhG1BQ3+UZtje86B4KifTMeJZqU/74Zi4fbilzyV34oP/cDnBw7V/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729157207; c=relaxed/simple;
	bh=eZBm3Bmz++hihfRtzii17zgBOodk66D4801Oz6yo8z4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=D+ItuOeemICTKtXVuNOvx39xR9f0DQVcjNnwTMMkNX/GlcTyjdY+WS0sxT3P8zxWE6eBEtZ0rkg9PIWJTG4kFVSYC26+ACdSdy4ikJfPt0vq7QLq5NNUeUEmBb5NRa1DzJ7QpY2sUnPln1I4E0NOm4I70VDL0hhr5RT+RC0bwJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OXo+6YsN; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OXo+6YsN"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43159555f29so771405e9.3
        for <linux-samsung-soc@vger.kernel.org>; Thu, 17 Oct 2024 02:26:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729157202; x=1729762002; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/oSOyG8g8KayNyF7yKwR1IFSwarhWkC0f5N43ovDss8=;
        b=OXo+6YsNzm5VMYgCFvIND7Yt+OeUKDO8xJ3dQLWqtkfBSkcSVjlH7It1JkdJOllAh9
         ZuiPG1B+qUA+GtCUaRWqowAJxoJLHp9/Mc5N7FftgoGfACPdusO/Qvfi7iTQcFUNQg4g
         JMWy5+hLnxgiF0zV66yPpQz3lHnJgebgyqHAhYjNXzS6fvOo/7AEWBMQwGTCyStcs7W7
         AUu3/anK+3mYSNNhHZgun3ztLZ3fVipmjJerNwcLn5jHjSmyLRFXj/YRccU+Xvsv8zCC
         mC7XONPlBaVuNNt4HrqPr7FBfGP8PsYFQw874LdkMt2fdZxvhYTF2QwaVo0gZbpYa75m
         1yOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729157202; x=1729762002;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/oSOyG8g8KayNyF7yKwR1IFSwarhWkC0f5N43ovDss8=;
        b=fyxZf1tTm1dFhnfEQ/+79sbzq60HnUKDrIawHY+ngeuUL47tjuNtH8v3m/gAUe1p5W
         qjJ9BZstLfW4J316Rj3QMVu9nO7A1WUdSGFuuQ2s/8MtgGPCj5jN0GvZvJCS4Qp/FtY+
         Q0fZqbshCfsIopVl/N8lyKe0dML6dSWgbztyIKrW6K9SiMIorvHpUn9mTHTY/QWsN5nG
         yZ+9BvrWk/83MHjKrUKBBGNEbG/hgaU1EMYru6ahg543o2a2m81QSx7c1vSpe8ExZGgI
         36qg67x/pHZFlaL5fIDBmeyqAaAMRxjdZBT1XaBp0N48I0BaLJus4kvPyi78JAOVK5OZ
         wjlw==
X-Forwarded-Encrypted: i=1; AJvYcCU+dvyDomZrzSZ7LqCn45puMKKELr75+LDq5iY/++DqRH4AGICSk/9AJ4t4b6h7aMmdxp882OBtXPkvw64qL88tdA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxW3+IhEtyUd+87SueSUkMas1QSHqjiNA61+FoatekH1LMGzsn7
	/E5XljuoxoMtzD39Agi+xp42PqbckMIR4dy0WRUPLSLUCgNhQPhKjpUpuFS32FQ=
X-Google-Smtp-Source: AGHT+IFXs/h7xW57eOUZ/W1Yg/aH+/KUT7TvMC5vfnv02CZTX7VM1dT/0OuOkE9HtNp8A2hz/c5wEw==
X-Received: by 2002:a05:600c:4508:b0:42c:b55f:f4f with SMTP id 5b1f17b1804b1-431507e9753mr20178565e9.6.1729157202411;
        Thu, 17 Oct 2024 02:26:42 -0700 (PDT)
Received: from krzk-bin.. ([178.197.211.167])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43158c620c5sm19769465e9.48.2024.10.17.02.26.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Oct 2024 02:26:41 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Igor Belwon <igor.belwon@mentallysanemainliners.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org
Subject: Re: (subset) [PATCH v3 3/6] dt-bindings: arm: samsung: samsung-boards: Add bindings for Exynos 990 boards
Date: Thu, 17 Oct 2024 11:26:39 +0200
Message-ID: <172915711503.42287.18322892549440683443.b4-ty@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241016154747.64343-4-igor.belwon@mentallysanemainliners.org>
References: <20241016154747.64343-1-igor.belwon@mentallysanemainliners.org> <20241016154747.64343-4-igor.belwon@mentallysanemainliners.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 16 Oct 2024 17:47:44 +0200, Igor Belwon wrote:
> Add devicetree bindings for Exynos 990 boards. Currently the Galaxy
> Note20 5G (c1s).
> 
> 

Applied, thanks!

[3/6] dt-bindings: arm: samsung: samsung-boards: Add bindings for Exynos 990 boards
      https://git.kernel.org/krzk/linux/c/f7aeff28f2768443a49600625b6f3d0aad1fdd52

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
