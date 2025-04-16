Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82E5D22D7A6
	for <linux-samsung-soc@vger.kernel.org>; Wed, 16 Apr 2025 07:38:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744789085; cv=none; b=Ui5ox4BJAJXKllR6qQHVjBebgKjeaIOQEWAnrxcT5viAalx9u0GOWNRP5sSPcXjRRMYIGG9fw1V7ge950PC9qAJTGwTRbwdW+LoAbH4eCzE2GbR12qj172zyd+MH8dCybDSK7GCljqrSHQxNGPsK/x3llMh3SsPsA7hBxT2K9LE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744789085; c=relaxed/simple;
	bh=amwpGB6oc0xTwWvNaOzEUQb14IdSrSFjaAUq2KqYyhM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=LngOnPHhSLrneEiMKveeZRb34Mgq8wNjG/6wG7yQLTwtRyCvWDyWJD39RFSK5Bb+8zizAThArtZZ3ZzAiOk8k/N0o2mROMkzppXBBzZNuiwFJBz9VEhI4RmDTBf+uiQ1aQLUJJiSxsWRCTT4ZTHkU9p4Iz8mC/J++mVbveIJMUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=V5p4Mu4N; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="V5p4Mu4N"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5f4b7f551a9so43867a12.2
        for <linux-samsung-soc@vger.kernel.org>; Wed, 16 Apr 2025 00:38:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744789082; x=1745393882; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Eg4oqpJxNbQphE8w3P09Er5v6v1HmNB/fe4vd0yZ3wY=;
        b=V5p4Mu4NllIYn9ecmJ/1HsSdhJZeKRD0xBEcFkuGPKDmiDjEHu59u4tLMAwfW1GA+w
         sZ2DzXnCTibO5o8fa9FsiRvT7JbC6QKcIhQ7pe1PlCszz4et6rXm+a9TfG5lBZ4ELq1O
         +P8XpJo5UT9rBRyi/4K0bhv+IE7cPMOfDlitgSUvaqyKPfphmgT/ZwwIMPZ+l0ntjb27
         riZlhaEYk4YM0gbp7oE4AbT+REyi+TUu8ruxeDTpXE7eUmvAdivVnqE5YV5tMOmlCyqQ
         QEvRUeNuV4/lVk5Fza75s14Cl5zQXaZVNzNXTC21XYeHT85lPuDL+sXYeD7m/7fOHKqq
         ufDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744789082; x=1745393882;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Eg4oqpJxNbQphE8w3P09Er5v6v1HmNB/fe4vd0yZ3wY=;
        b=ODsQJFIX3BG4PYuogdoBb7EgQb0yLg39leazvDquwoozNadmSgQgpAmfMdJQOr4xrF
         jSQQnmJOBvhyqrRUt0IOhobtjW63ZU+432oP6pRmzQOKT+rg2BGMmxfuMnMilxMYp7mV
         fHh0GjD+wr1OJtvvkrhpY0MeBgyqs45uuzeOpvxVZ3U3RwW63VxKQl/c217OjgCsUnpx
         Rt0lYYHqoipV6Cj8r0uOVHp8E/GI8bBpValfAmdUFcsEGhe8r3NyvTYoQxKYA1rYsXuE
         G50QKXfbvAnbXxNL+/Jw6uljh/VfjPryKJNw3Ff9BPSptjAcaC5pklp2/DiWjFuaPgan
         JWRg==
X-Forwarded-Encrypted: i=1; AJvYcCVbBjHe989RSyXqgxA/75bDk+pY/jlg4EJLsRJ4v8LD8xk9ClcyOaULYlbNu176VGc7Wfd5Hijek/IyBpIEzF3tBw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxY11biL+uvFzrHdAcSEpcvU+57PRZXHLeNhh0qiGYkrBTk/ynd
	B+wKcLWxnRx+8haUiP2BfSTntzhNIOqOzZimKxUwg4tfimwaiaSFYTFaqB5Pccc=
X-Gm-Gg: ASbGncuHARxHacZ61A2N+omuxnNKCxF7mZhVmUbLoox8BIVrevcUd5u7t+1fg3IrFdI
	x0yh8U3wIdnQKoLWaWDKaUJ73zqlexqNT7quf9inlqT3Oj7+TM4r64tjsflRdRYi5oiuC2bk0XP
	KgnWhOU3JWF0u0C8MzK1ddL9iwy3SSPJ2wOy2X8lEWZsagNs1IG0VsTkXAMa6+Qxthwbg092cIh
	XuE/ijlCYpAuC5T08XvjBrpdOlu8rhHDW9J9pIeQWVU/bXO1V6mnVLnDEPjK6f1loaDnfNhOZ7m
	qT5arxNmexIp5Dwg4PMadc8vFFikroJgYdNx2xJiH/QAdi7ny1pR6UtDll9G5tgvvla8f2IEdwe
	T4gD9ouqFM3Nc9nw=
X-Google-Smtp-Source: AGHT+IFCwzD1uLGHlpgBLDXgOr28Wi28CRrVeE8s5ucDmzLKsmEThGiTFjedg4pD9VW4nX/azD+msA==
X-Received: by 2002:a17:907:2da5:b0:ac3:f6c9:4856 with SMTP id a640c23a62f3a-acb42573791mr22447266b.0.1744789081517;
        Wed, 16 Apr 2025 00:38:01 -0700 (PDT)
Received: from [192.168.1.26] (46.150.74.144.lvv.nat.volia.net. [46.150.74.144])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb3cd63f12sm75397066b.32.2025.04.16.00.37.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 00:38:00 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: krzk@kernel.org, aswani.reddy@samsung.com, pankaj.dubey@samsung.com, 
 s.nawrocki@samsung.com, cw00.choi@samsung.com, alim.akhtar@samsung.com, 
 mturquette@baylibre.com, sboyd@kernel.org, 
 linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Varada Pavani <v.pavani@samsung.com>
Cc: gost.dev@samsung.com
In-Reply-To: <20250307092403.19742-1-v.pavani@samsung.com>
References: <CGME20250307093024epcas5p1e0be921d3f3445c67daf399e451bb203@epcas5p1.samsung.com>
 <20250307092403.19742-1-v.pavani@samsung.com>
Subject: Re: [PATCH v3] clk: samsung: Use samsung CCF common function
Message-Id: <174478907989.19245.4738835908469009809.b4-ty@linaro.org>
Date: Wed, 16 Apr 2025 09:37:59 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Fri, 07 Mar 2025 14:54:03 +0530, Varada Pavani wrote:
> Use samsung CCF function which registers multiple clock providers using
> single function call samsung_cmu_register_clocks().
> 
> 

Applied, thanks!

[1/1] clk: samsung: Use samsung CCF common function
      https://git.kernel.org/krzk/linux/c/62120d819f5b5818fa07d3121f7693f6bf18d18b

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

