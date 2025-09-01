Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C065F338F2F
	for <linux-samsung-soc@vger.kernel.org>; Mon,  1 Sep 2025 13:26:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756733204; cv=none; b=OmGJU14iSINdpFL9YGf3ZVgloarEDBDJYCr2Yk0HCj/6qiUmCgkKfMQiK5TII+uR7hGxEChJyfcRlAJ4X4AGuSzEL6aTeCiButWTxYp+BEMrwbLehrv6LuPpfmHUugCTMeAL1Crj4CtMzYAxi9rIQ4m+CkcC+H1sPE5dinb4D30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756733204; c=relaxed/simple;
	bh=9zJLdqtOKjBpkNMI06ViEGQW2gjiowt6JmR/C4Vpi6s=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Uho8LZYbhxGmTZwmjxKakTgg60VCBe0bMKe+MLehPPjzDLwc9APiBxA/Ya/ix16i8pJ4HZFYsNSjw7Xd5m5FoT5rp20RuXcwk7pnd+73D6+YP5SkAvrOwnUqQXsgxb9cw1IGTBFYqQ6Etq/xOnHjUbM1JTGEFMHaXOs1S7p3nLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DUQmjJWW; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DUQmjJWW"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-b0413cda0dbso30480966b.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 01 Sep 2025 06:26:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756733201; x=1757338001; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ICiwcLIU71Izuhu8fP8tVO8odVf8d1Nj7kJu4RHQNHg=;
        b=DUQmjJWWhlAgiKNReCDRFHM3BetprA9OPQvbYuNF9TtKpOMoCF7DFpJQhOo+RR2aNj
         ErIvAoB5sPzHHJvjMdYdCWMgfrPAKY4ccw5f/y/uiwnuJruxfIOzy3XsAS8/fRzxX0Mq
         2my0fE0uvKgsWMAyr2UIozPa0x5xzvOB/3ZkDd5COAspgM1VvBpKnUlK++0WHRuRsPK0
         z7u/UiBIhBeNhSOVT2Ok2EcpxpFRN9qnNXioEO6rGmOHvGdMP3DG0WtPPXYyD7L93C3C
         IyPeKkxA40Xsf+yJcA2lU4VoWxsree4YBoUJq9U+EatiAvDzW5Tir4KUysgpuAKbMuvN
         RmlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756733201; x=1757338001;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ICiwcLIU71Izuhu8fP8tVO8odVf8d1Nj7kJu4RHQNHg=;
        b=B690nX/yz44+3hVOVQPvG+NLcjJzn3U3FB6BmO67yl7hPPtGkhEprEfIAMafB5n+6b
         8FOxeDfS8UKWRbof2x8HD9Yz/01wj5Q5/ooQvE2iZPDmgRvpNUU+EQrIDgWqYgDRK5or
         Z+c73XZK4FRv6Q1Wid5b4Pzs0clkBoTGjwIuXAV9J/hq9wNXA/a3YBKBw7mNNESH9CKm
         FjF6kBC+FbIi1Px2v7t+2Q0c3jqXBFCOmtHeD+2X5fUghjy+rvIBU1Ps2RdjrySOuwBy
         RheNy6+BDCAqgvB4rNpZ493qHGwD/CBM3vBbfjqlxhB87lZl5pgJFEcxrpBb0FBLHWZt
         +qKw==
X-Forwarded-Encrypted: i=1; AJvYcCXHAm39U+0OUqTxkWMwK10wNLsUVwGcH+nrvDr3uGpnMAvkCcOaegqGzWDbhMSzv1QorY+XuLwLPIBJqcRPweoCnw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwP21wi0uWHW+yp8inKDQMa8ytGn/Bgj6lmAQuCIp1xmZ+ON5bN
	vJ/nhi3FxAFKg1w2CZ9ZmculHfUtiW2upb9g0quaOssIRx4h9O8pjNQrB3KyBPb3NMs=
X-Gm-Gg: ASbGnctucEg2qvacpO87udhVWiddRUVMzD6zjI1Ae/zuHV+RebnlYqEe9BCYSwa9PXX
	B1dor5rN3uzTjF3oAbaEJaMqd8uHSvTy8/d/5nBxGbiWatPQsFSQNb/yS5zeq9sMciv34DqO3Hg
	ug1EpyS5tVQseOsaUREXWSgnCNK0J04IoWDGa7nm6FFDd5ZUDakXEnXwJEup5SiNGuTPcgU5RKX
	XC6fyWgS75ZSUsD0H9ookJaTr42LMx0vvyPtEp1rco8zOZlgWBwQFlAATwvdD96XciqhwOYVRg+
	1VC5YYDlJ5bI8IrlMi3ml70Y68QLauRPBFbHe4UsjrP7mzMlf6LDWgi3lGJk/0AxxcyDTg4n1Y2
	pXJrpFrineZgLHGnyVeyaOfkzQoozq8UQVw+tYZA=
X-Google-Smtp-Source: AGHT+IHQTmAvbsKv0D4j4Hvyh4K0kyRVksjF4qrxn2f9tAR+H9KrYnWzvnDmgth3oDHi6jyc4O8txA==
X-Received: by 2002:a17:906:16da:b0:b04:1fc6:1347 with SMTP id a640c23a62f3a-b041fc67c80mr223542566b.0.1756733201076;
        Mon, 01 Sep 2025 06:26:41 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b04241b2e7esm305997566b.43.2025.09.01.06.26.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Sep 2025 06:26:39 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Russell King <linux@armlinux.org.uk>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org
In-Reply-To: <20250830-s3c-cleanup-nand-v1-4-05b99ef990fe@linaro.org>
References: <20250830-s3c-cleanup-nand-v1-0-05b99ef990fe@linaro.org>
 <20250830-s3c-cleanup-nand-v1-4-05b99ef990fe@linaro.org>
Subject: Re: (subset) [PATCH 4/4] ARM: s3c6400_defconfig: Drop
 MTD_NAND_S3C2410
Message-Id: <175673319874.45844.111501190462962489.b4-ty@linaro.org>
Date: Mon, 01 Sep 2025 15:26:38 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Sat, 30 Aug 2025 19:01:12 +0200, Krzysztof Kozlowski wrote:
> MTD_NAND_S3C2410 driver was removed from the kernel, so cleanup
> defconfig as well.
> 
> 

Applied, thanks!

[4/4] ARM: s3c6400_defconfig: Drop MTD_NAND_S3C2410
      https://git.kernel.org/krzk/linux/c/ae6f637a456c1de75a582afa9cb6169813e89b83

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

