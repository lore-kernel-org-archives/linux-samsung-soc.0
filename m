Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 505CD1D7E2F
	for <linux-samsung-soc@vger.kernel.org>; Thu, 17 Oct 2024 09:26:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729157176; cv=none; b=o6qWDpwetmUagHf/dkL0w1V4JgkfXZdBp7rhcjOhwB1Rd8w0cm3iuFZcO9yGFe32B/E62cJGtKuxoAuiTHUo+5GvgCG9A9nqreQltFApve6L1t2ER2kS4bLE7dXQfCWuyXq0ZS+W777uDpU4cXIWKNf2HjURxAgXtWiz9FONlRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729157176; c=relaxed/simple;
	bh=3LziUkpGNIhFW55U6jvI4l+L7hcBt5ps7U1v7+ZnWE8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=j36KvQPXP5lIlSWhiVk+U5Dc9hH1JHQhyKyaTWbq/uDpeuVtRkPJY30c6Hleug37cZiyIUUP6OIDQLFobTQJqmxTpUmJAhbTu212XoJmBsfYdqO7rbqV6dqRza3nmYTA9g+t8FWULQRk0dxlVphAvWVwQ3j+GInMtxRXHo56Dts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lFbfvjzu; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lFbfvjzu"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-37d5045987dso88808f8f.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 17 Oct 2024 02:26:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729157171; x=1729761971; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WKRTLaQgO/TM93Yyvkgu4VGnv97Xsi7IUB1bI/d1ppA=;
        b=lFbfvjzud7AeNEtMf07QbfItFsdr2hictm+jwqLUD/roLUfLzqsKH54d35ZcZFW7jm
         SugSo2+I7PpSc/6YAR/CojrFHGyc9uARbvFH1h7HzYXPZX4jAGhKvYgfPqdkrSxIDNDi
         UItMhZYmGrBsZo0N7oBa1WpB8SrEC5guZjHcCG2d2DXHH0yB/OJBnlrQ1M+XE28yc5/r
         7t4gp6Fpy7r55KeZmxP9joHQk8hUTT/hDwmh3tFYSZWOqt7YeYYyRXBGvIicrY0/dAAz
         mtQEO/F8X7AVGTIk4Tu8OEbQ7wwjkeoOr8PQilwtDCV0TeAsjllHuPd1xKHC6Iz8QAhc
         a7FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729157171; x=1729761971;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WKRTLaQgO/TM93Yyvkgu4VGnv97Xsi7IUB1bI/d1ppA=;
        b=QmPW1ZwR7OqI8kAEVe80y3bqg6AVf5NlzbVPjyAqtVdEX0fXy1BgudYNGA+PFtFKz1
         MmLcaKwUbi/VXBY6hBraKyOvb+JwyFhpnHjJfLnno/I6g32qHR1EuX3aVawxCn8X3suP
         EZVtcSNh0MkW3ZgvMf76NEv4jsz/1hkF2DMygNyf/VF6CSk0eHfaSh5JVaHj16Xu6+zs
         RvHPV13K2Q3VGTw3QUD44rR5vXscGB0wTnbvsc1IHE64VYtjp8EU27bTlymRr2KpEsCr
         Jns/2HkjnHeiJ7LDetc5leQqo/Sl/PSeUe51VZYPx7kXOtgPFPe/o6BBN02oIkzSCP/Y
         XvWw==
X-Forwarded-Encrypted: i=1; AJvYcCWxaGOF8nnLn4oNotlCej0FBr4PlN3pRXWQ6hyQvpQBJQznyuPq8fyfyQn/fqiz75WG5HTm2E160IdvJIDChjO6FA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1O9kANo80qlD+gUhk1senHn7F/9Ed6xLlUS8o7IPG4Qa/+aFQ
	ViMX30sObHHtvaaN0a+RxuvEkcdbDHmMdi36AAcvp6qjRTBAR//0j2+KIPMw88g=
X-Google-Smtp-Source: AGHT+IH+1FFMQXSkaxdSxuGBb7V+JV0JImK9YzOxutCNXeTuZ9qFf9RlGrNqx2QrK3J03IFumUdDeg==
X-Received: by 2002:a05:6000:4024:b0:37d:50a3:f34d with SMTP id ffacd0b85a97d-37d9322e239mr801272f8f.0.1729157171549;
        Thu, 17 Oct 2024 02:26:11 -0700 (PDT)
Received: from krzk-bin.. ([178.197.211.167])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d7fa7a173sm6612920f8f.15.2024.10.17.02.26.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Oct 2024 02:26:11 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Igor Belwon <igor.belwon@mentallysanemainliners.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org
Subject: Re: (subset) [PATCH v3 2/3] dt-bindings: pinctrl: samsung: add exynos990-wakeup-eint compatible
Date: Thu, 17 Oct 2024 11:26:08 +0200
Message-ID: <172915712848.42336.1934974031781144072.b4-ty@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241016154838.64515-3-igor.belwon@mentallysanemainliners.org>
References: <20241016154838.64515-1-igor.belwon@mentallysanemainliners.org> <20241016154838.64515-3-igor.belwon@mentallysanemainliners.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 16 Oct 2024 17:48:37 +0200, Igor Belwon wrote:
> Add a dedicated compatible for the exynos990-wakeup-eint node.
> This SoC pin controller does not mux interrupts. It's compatible with
> Exynos 850's node, while also being compatible with the Exynos7
> fallback.
> 
> 

Applied, thanks!

[2/3] dt-bindings: pinctrl: samsung: add exynos990-wakeup-eint compatible
      https://git.kernel.org/pinctrl/samsung/c/e690012f4f924f4ef4e105427b04ea3d496c6a38

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
