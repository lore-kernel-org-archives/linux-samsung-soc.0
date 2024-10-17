Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFC401D9329
	for <linux-samsung-soc@vger.kernel.org>; Thu, 17 Oct 2024 09:26:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729157193; cv=none; b=nL16h6cCnqczmLtgVc/A84DqXI3DeYf56LkHpHK+elwfU5JwHxJoklovnElpNY67aeWbyJfFPI8L5V8O2xlWwn8RFy85APQvq7ZqJ9kvS5WUHylJTAwtz9kqA3juXtTOIC5ETgUWlzjn8zEUiJAK4h3LUlXDM1v70Ma0QPNhqXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729157193; c=relaxed/simple;
	bh=YlBZ8ANeF6BBVWaTvCCXMU7vLWosqmEku101sALjfpk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=laADhPdMmzg1mxLkwD+EL3WTrFMBVSBY1IVKvIagtLdSXAAQVIALH+OtVQeMUFN09nHxRMQ9C78UCFqwY9A9ysk3yNOvJ3A6A+UWUQY5XB8TBH1TnEEUqSHUIqIlajyZKFQfg4nnmh7SGMpp2oG8uSRDhhV+CPtZ1KnbjLdVpek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pu/YrOH9; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pu/YrOH9"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-37d4fa7d3baso67840f8f.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 17 Oct 2024 02:26:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729157188; x=1729761988; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SfyIWnwV3lwGADuJG2fMylvg2BoP0K51z9HWPYMPYew=;
        b=pu/YrOH9JgpBiTYyOmEtGxwYYrBnwp1YhlJsju0Fcji2OQyZ9ggoFYogL2ErHqXmqi
         p4GLw2qhhMgkhLMd/Q3DrTe4JE7FTjMUdMw50pfixGYlLFyYt4ZAyaFq9qUf0gDAyLlX
         GP1WG0ICPGGtN/sCoLwB87p+Z0ggkue5hyZVly0QKm9QnWtPVR0zGDin3yPiogE41F61
         Qp9Jo5M613JKqNbJxaGbR3xdMiqKMrDBt2En7V8O7ymFZB+NUAk5FIGLDeXr5V81g/HT
         0KQwfLgMe0bcS/AkfjQX6Dpn/xAfxIz/n4xLTQWzi5bGaxSkLblg6Mn4oDH0U8w+Z9Mx
         DnHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729157188; x=1729761988;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SfyIWnwV3lwGADuJG2fMylvg2BoP0K51z9HWPYMPYew=;
        b=I78DjopcpL+Eqedvg0+3UjSu2WdeIg7dLG/1jnGmrq6zAHm4mKLP5NH/LW7TcAp3Z0
         v7AYg+oSXXK0cIqVrLft5SZn0twTtDiz0XULALLdmvwfaL3jnSrVdkIEYqwesTfVPSVD
         ELYXL7Cll0/0Y91vnx6dyw6JzsHDlYMmQnl5wz/xiOzBPEt9K159eMKjXNvgLOZ3Hhw1
         txOdN5BhIZ7/C5obA3Jmkq5T2Og4fVbo8GdjC86yYeqTiIQa9LZC0LgIuXCN3+vQFg+i
         sRF2z7+lUHKGRSkTpqdQJnuFi3HD+kGkj7ftu93ORRrzIJK8y5nLdpPo/sWfuZJBduEm
         P0PQ==
X-Forwarded-Encrypted: i=1; AJvYcCXMPaziiD+QnAwElntwt6pkMd1dWFvlntH2pDiiGCOvxs8ArKJCqDHXF5sHKL4RDmLyRx4VqF6u2mExfLU7rT7Pkg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzDYD9BFg6ONojJhPlr0WnK6uq6wf9JiB5g9wqkzn1/OJgl+g4O
	AuHzY6Ar5rON9sGVUZuHnFv4/f+pRAQcqhHwRj1AlNOaO2F+Ow/k8riOMRWl8L8=
X-Google-Smtp-Source: AGHT+IGOU6k2MtDmw6MdujNHCbudW8CfzZOST7qyTYi0VNT1WiG69IrJoMk6J1SI5CvMETooQ90WQw==
X-Received: by 2002:a5d:5889:0:b0:37c:df55:c1a5 with SMTP id ffacd0b85a97d-37d8af0e253mr1837172f8f.6.1729157188036;
        Thu, 17 Oct 2024 02:26:28 -0700 (PDT)
Received: from krzk-bin.. ([178.197.211.167])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d7fa7a2a8sm6647539f8f.3.2024.10.17.02.26.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Oct 2024 02:26:27 -0700 (PDT)
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
Subject: Re: (subset) [PATCH v3 1/3] dt-bindings: pinctrl: samsung: Add exynos990-pinctrl compatible
Date: Thu, 17 Oct 2024 11:26:24 +0200
Message-ID: <172915717449.42475.12515160143106576807.b4-ty@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241016154838.64515-2-igor.belwon@mentallysanemainliners.org>
References: <20241016154838.64515-1-igor.belwon@mentallysanemainliners.org> <20241016154838.64515-2-igor.belwon@mentallysanemainliners.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 16 Oct 2024 17:48:36 +0200, Igor Belwon wrote:
> Add a dedicated compatible for the exynos990-pinctrl node.
> 
> 

Applied, thanks!

[1/3] dt-bindings: pinctrl: samsung: Add exynos990-pinctrl compatible
      https://git.kernel.org/pinctrl/samsung/c/5b653cb60275e1ad1a85f0d056a3084c4635623c

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
