Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65EB82080C1
	for <linux-samsung-soc@vger.kernel.org>; Mon, 13 Oct 2025 01:01:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760317313; cv=none; b=fxz1gIRfjagIik92bv24Hmr4ySrnJZQgIAjbwvAV/FD/fxp1fOBDWkxwj6F/Mo/sUPQSfvXCi4qBh5m7iO6QWQRGudBi5KpHEsEBz3E02BtGctBBtm3ps1A2F9LNnPRUjmHDMosWtHZTk4fQyNnzoPTpLZ6ljUM2LohP+419G+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760317313; c=relaxed/simple;
	bh=uegJ+8RLoxxTRW6gNc5D5RPMM2auhwSLgi+Duc0LorQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=JMUVcMBojhFuzZzVuIkGG5YLA9//A6q0FZo7vAWFjCHgY/76jjcBn5SGNkWRtWJ2VPiKq5zpsnA3rRvf5U3Cb+ZOcGLVEZv7wrXwlGF7a47IwWrbFixRf2DxYncKUEy1lZbiGOYOdsUq3ZRFRZRjm4CLHSX1w9wz96jUal2q5Kk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=srI11DOG; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="srI11DOG"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-32eb8144fecso517832a91.2
        for <linux-samsung-soc@vger.kernel.org>; Sun, 12 Oct 2025 18:01:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760317310; x=1760922110; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+xGmBxaIsrwhsJmTSFTSbNR3poI1XoEoSNvgqP8h3X4=;
        b=srI11DOGPmE/QUuEvkAzLf6p7bkc9aRz3JhFc3CNRFapxPd0PuYkC7YADBpTf32h2v
         1ohAggbFACpMfll7ii4z3213a4nLeClpMSvCZ/lKIn3ltXI6J+NJjddaZKBVeX9F594L
         foTJKIkX48x4Q7aUzD3UVxR7dWkmTesRnnmNtI+3kH9I8tgB31XDMvH1Axc1QWxqL2Nf
         K/n8IqRIfSpEcDU/NhS1+QuaR+VJQ4RZchW6Lp8RGx4Rg3BJrdaxCtm9/yIhEFKDO2cO
         UDFpRmGvUq7O+x2C7t9KyLKXcCv4243FeTAPmjboiU+UUDOzJWcYDHbel4tmgDAvKU4i
         tc8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760317310; x=1760922110;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+xGmBxaIsrwhsJmTSFTSbNR3poI1XoEoSNvgqP8h3X4=;
        b=Gg4lVrrdZFGmYoByyaxTi93RLBeo3V5GUsnsOh1MbcHxbmB0lpNyD8lb/+59Jozlp0
         Pz9rW3I95ujzwv1GpOw83yPXo/oz6sBot9u6CuJyL2tVy+NxTSmHdx8wI2Q9+o3gMsaE
         fAHHDHOazeqqr63ZWNXeJQ8OwTlq7nD0kMIAz8qUB8OOxNQr6BjL1Bz1HCxOq6nbcUdE
         8Q9Sgse11MTAQmzzQkRT0Q6z39AJnQx7ULT2BRlA1cmYBmM9+p2Pk+o6xGVkjCgUvaWM
         dNYA15sjpmc2JMXk/MixqXv0bn71caf+VEkdvFVSyFRM6tsXDIxWpWficS+kOyarkaD4
         //Tg==
X-Gm-Message-State: AOJu0Yw9bk5X/GB27wlikDf8bQGT+FcsqRM/Qqot886NPQAwJtF9tU2Z
	SeZLTRfrdXZk+tFzf5mTjg5CWnbfMvhYjc/AiBEhteVi/N+yZ1DYEH4vWS4WlWGSrMI=
X-Gm-Gg: ASbGncuu3DtZdkybt0NJkv2NB+XU9vkXGV79OHu3rx/gHR09Y5v6lw9pgJ+cBxl4ubK
	0UAhQ/oki/Qi93jQBpGs3amiWcVHZCG0XpjX5jC8UNCuc6sB85BO62xTUDYIhZNOz8WIfYtRFEB
	I5v8XEPUQ4FHnw7BThrSbpQUpJjOGvFTP1kgRYNk6v8MjBqDyhN+myYK2dpQfLgPwrS7FspzKGx
	I6izzEXAyljzj5UJX4d3o+ERQ5nVVkqZ3ENFsxuJJlNw0I8igKPcZOzS00biHRcaFV7qydj+wgt
	uIqLRSJxTsEhaBixLnbm6BL4OEI8sg8+vhPglqBLecrBV7OJCiXhR2c/IC07aBiKZQEUdRLVYIl
	cVoInY5naJqjDj/okZj+RAT6vPHRE81DyBiedQqLnNuHNLETzeVrNhHe5Zn4VPzqIllnA0k0msn
	/Ki8NZBw==
X-Google-Smtp-Source: AGHT+IEdNeiQ4wkmg3jWNQmCnD1QT61xdTtWd43pEBCPOTtLFYBI/MtFdeLT6J/Z75wGvx4fFSNIgw==
X-Received: by 2002:a17:90b:33d1:b0:330:6ce2:18d5 with SMTP id 98e67ed59e1d1-33b51395750mr14768734a91.6.1760317310483;
        Sun, 12 Oct 2025 18:01:50 -0700 (PDT)
Received: from [127.0.1.1] ([121.134.152.93])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992d0e2ab3sm9512805b3a.64.2025.10.12.18.01.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Oct 2025 18:01:50 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: krzk@kernel.org, s.nawrocki@samsung.com, cw00.choi@samsung.com, 
 alim.akhtar@samsung.com, mturquette@baylibre.com, sboyd@kernel.org, 
 robh@kernel.org, conor+dt@kernel.org, sunyeal.hong@samsung.com, 
 shin.son@samsung.com, Raghav Sharma <raghav.s@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, chandan.vn@samsung.com, 
 dev.tailor@samsung.com, karthik.sun@samsung.com
In-Reply-To: <20250925130457.3476803-3-raghav.s@samsung.com>
References: <20250925130457.3476803-1-raghav.s@samsung.com>
 <CGME20250925125620epcas5p359a6c18a13f2a2f895433e4dd241020e@epcas5p3.samsung.com>
 <20250925130457.3476803-3-raghav.s@samsung.com>
Subject: Re: (subset) [PATCH 2/3] clk: samsung: exynosautov920: add block
 mfc clock support
Message-Id: <176031730436.32330.1825346216693912031.b4-ty@linaro.org>
Date: Mon, 13 Oct 2025 03:01:44 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3


On Thu, 25 Sep 2025 18:34:56 +0530, Raghav Sharma wrote:
> Add support for CMU_MFC which provides clocks to MFC block, and
> register the required compatible and cmu_info for the same.
> 
> 

Applied, thanks!

[2/3] clk: samsung: exynosautov920: add block mfc clock support
      https://git.kernel.org/krzk/linux/c/25e476632cf7135aba11b27e3807a2692a3e5e13

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

