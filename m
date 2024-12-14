Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C1B2EBE
	for <linux-samsung-soc@vger.kernel.org>; Sat, 14 Dec 2024 10:40:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734172814; cv=none; b=KUCmJGX0sXXM65Ba1jQE6RwHNymvn1QAzbkyf4LGm7StNlh5mZcmApWxHI2GINUNFFWVEeFs3Y6ya71tdr5SaQRJXwqreLp+TLfn22yaijiZL+3dJfLZmqEI6XhYntRSNZAkrZ6AeY5WGLYIFQdswBoqNDlm6yB6Lx2B4D8rLz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734172814; c=relaxed/simple;
	bh=vLgZnBGevkb+s5SDd9vhGESHydnh2nVi8ggdWP6Lt3g=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Ag+VPvqFlIRmCSHH+qqPMsaRAg7h38V7D7EqFYIj8n6gqtG3ln0EhCyyo3iWiLqGndUYF0a1dOt629H5E7cGJOvF2W2KbFKqkSML3R+ymITtOQNsLJAmxv15ncHHg//fZlSmpv28HsygQIbHOJBlN8DedloR5fuU1qzDT+nIGlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tm5xx/Xs; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tm5xx/Xs"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-38625aa01b3so256120f8f.3
        for <linux-samsung-soc@vger.kernel.org>; Sat, 14 Dec 2024 02:40:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734172811; x=1734777611; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8NDdZ7criVQVdKqHwJ2Kal6Xww02rI16R8MBCBHunDE=;
        b=tm5xx/XsP9hRqdmUUExfR1RcORjh7kOXroscjmjbaHSs/GmCyANWf6aO2c7WiTg4U8
         KjfARbD9r59jMrK9W5BrhrTX2FZpyo66LO+I3PhKa4rUDP+eRp6VEp2kP/XMjWp8T5q0
         MUKnKf7uxfGOYjtoQjw0ZtxZTtZHR3sMCnvs/SULz/9jqCFh7fG7Nu96t9zAF44gGRnR
         Nl+vMHybbAcDIyszxFUhY6FlwxNhujiOomLTntwheU33Uay+dl2WANhzkHqgaM8pBeQc
         hQNlp0MAOZ7OOJrP+5dq3SdLqBPQKaxlBPpx1PyFrMLODYz7EyZnj44TS+tqVAbSdFUC
         Ddjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734172811; x=1734777611;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8NDdZ7criVQVdKqHwJ2Kal6Xww02rI16R8MBCBHunDE=;
        b=TBH51gkjHbGdan29Dm+rPhl7x3aQfyPbR5Oc+qlJpZMn5w0j61aT2c0l4skTTz8iim
         Pgem/JwQswd47TEEogsfUzM3o4dNpnrBSWk+prbFRXEv4ITU1CXRqj0g3lX71er0Hmt8
         jFRAqJHUUUJxDbs3Gag/Ap+TKIY7enWOEjglemVnCV8lOf55IqPryUX+FWPjRqYIzE2c
         4NtsNgUWyG4ZFuSAkMYlrO32MqlA2JzitmxkYtzpeW4TdxKouq50EPEOUDQygvLvf6QW
         kbnyw7uIfj17qFnq8HozOmNLtAzzgJXGCk8Wz8WIJXKoFY2c2gm0A+kk9BGesL50qjw4
         3a6g==
X-Gm-Message-State: AOJu0YwSs2yF61swguGHiG0oEs7V37rRh6fB2LHju+uDfnvwCbDI/0Xl
	wxANJoqnT5xwbEbAqg0LkKCUCC3ibjFBpUxELfPBpMfeRlEJoF7GwVJWeH7gBt9TosdcwFMJAaH
	y
X-Gm-Gg: ASbGncv7wSzE3+L1lVB0jYgzgnwIK3tqFk+kmdaezBohHKxT/nfWC/2z7qKqNRzT/cr
	prVcWaVADI4B6thJe+lacCHaNzmnzRIoJ1mnsKmDL8sSlzQ5wZ/G2SuZe0DWMHrkjsOXb5RnhV8
	RLSEGIJ4wqUDFk/Fe0w51xo4MrhWFbC+NFnq1vnoaAO6691BpAueq3lMHSk31mz3JdnFgPJVn6C
	4cG/y745TTC8zRDYPPKaysRePN3GNFWRw0/Eu5s+pwz8TxveyhZdaylbdaE4CyOegwyl+Ca
X-Google-Smtp-Source: AGHT+IGr1iG8RISOHOiTTg35lGNZDL66gDIhEtHLO3gjjE3O+P7pn6cBHt0y4vmKD6qwOfGi/YuUXg==
X-Received: by 2002:a05:600c:5493:b0:435:192:63eb with SMTP id 5b1f17b1804b1-4362aa3a034mr19610635e9.3.1734172811452;
        Sat, 14 Dec 2024 02:40:11 -0800 (PST)
Received: from [127.0.1.1] ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4362557c357sm75366345e9.10.2024.12.14.02.40.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Dec 2024 02:40:09 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Igor Belwon <igor.belwon@mentallysanemainliners.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20241209-exynos990-cmu-v4-0-57f07080f9e4@mentallysanemainliners.org>
References: <20241209-exynos990-cmu-v4-0-57f07080f9e4@mentallysanemainliners.org>
Subject: Re: [PATCH v4 0/3] clk: samsung: Introduce Exynos990 clock support
Message-Id: <173417280888.20557.1392916695437038027.b4-ty@linaro.org>
Date: Sat, 14 Dec 2024 11:40:08 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Mon, 09 Dec 2024 15:45:20 +0100, Igor Belwon wrote:
> This patchset adds support for the Clock Management Unit found in the
> Exynos990 SoC. This CMU allows for clocking peripherals such as USB, UFS,
> MCT, et cetera.
> 
> Currently there are two blocks implemented, CMU_TOP which
> generates clocks for other blocks, and CMU_HSI0, which generates clocks
> for USB. More blocks will be added (hopefully soon), like HSI1 for UFS.
> 
> [...]

Applied, thanks!

[1/3] dt-bindings: clock: Add Exynos990 SoC CMU bindings
      https://git.kernel.org/krzk/linux/c/5feae3e79dbe2d357b223fc48ae907ba0aedb271
[2/3] clk: samsung: clk-pll: Add support for pll_{0717x, 0718x, 0732x}
      https://git.kernel.org/krzk/linux/c/4a450ed26c580316d720154e7ffb5e9b4763a11a
[3/3] clk: samsung: Introduce Exynos990 clock controller driver
      https://git.kernel.org/krzk/linux/c/bdd03ebf721f70df1458a720b25998a489f63297

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

