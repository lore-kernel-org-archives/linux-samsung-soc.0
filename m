Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 546E11DC497
	for <linux-samsung-soc@vger.kernel.org>; Mon, 19 Aug 2024 19:55:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724097359; cv=none; b=nx7g+BJwbX+trnnl7ft8jeVCE5YxGlXpqh7JSPs7VVYEgB6ncFJZct+GsOCtWKHWwNyPisbGzQ7A8umILsWYcE/WK23T9jXJlTv4E+xJwy4vHJSw7ZZDzmm1eQblcfW4H2h/YZc3LLjCjOTJXu3r7Cra2njEpkqM7eCj+8IXRLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724097359; c=relaxed/simple;
	bh=KO3gE22CTD+rMtoWZs0SLkkpdLJelqSK2OIgPOZg2zc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=uCuLFnieFFbnswZudYyYDB3BOXAj48qJCRm29NnhURCIZzjlRNWPt4kBqu5itvcvZSsO4SRDDGp0us64bbbBrY8aUdRdGr3NEJwugof3XOQ6VPoURjnU5UVljMDbz74Bk0kUjcCIILRUzHX9LL30KCbt9A849k7LojFrYuFbCrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IajB+04L; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IajB+04L"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5becfd14353so3553720a12.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 19 Aug 2024 12:55:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724097355; x=1724702155; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G1r2DwvVtxbiJAWu6r1MI3vtnX2Nlsf9y/s3ljYjBYo=;
        b=IajB+04L87tEM/bNtx5p5Tia721aYMQ6ZinGCQzc77ktjC0JtOYKN76su8DXiT5cIo
         F/ViHL5KG4bMocK17FOpk2iya2//W5Zj3lTZOqcii6kGk0Fgom/irRpSOMERWK+/WVMF
         TPRn415By17nfQey9BbMUx9r4SUkRlxFxLDobXgXf5ZIXRFegw4frdPXDGyrXuyyVB46
         Mq+NwTeIbLZeDy1K3IbJSb3WBLazxG/+wp62L3lh0p7iTymEVwTz8yerb/38lCC0RmoH
         dA6NG4F6VeRiCoijNwCLoMfr+Z2TrQcuMl6DZH5MsB4lIAstUjyjs+RGOdKA056RSU2Y
         jfrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724097355; x=1724702155;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G1r2DwvVtxbiJAWu6r1MI3vtnX2Nlsf9y/s3ljYjBYo=;
        b=B97HO8z40EETPyaevAaihH5bevV2V3iclR8QmihB37qMmNUmUYz6XdrMtD00Y+cajV
         alE3RYvltDfMk7CBaM7mZ6PhMHbXRcNnO4zcmK16rOXOA57YDd3vqD4YVxV+ABNY3ApI
         44h8vnkNJ1ZxYB03x2625ktIwpIeqp51Ziz7+dn/2RgaecaO9N/lEJOzcFDV6/6m/yuf
         Ji9H7U0N+5BdMeSmbKV2ESsztFwNbpgioHN8Ze9LA7a0m14wg4LB/P+vRC3PCvjklnM+
         B3tPluuPB02rYTF44ZS77yz4mxvHM7iIWDgkuPIhX/xBQYjNd0XuYJPUOYV6h37H6F/L
         z73g==
X-Forwarded-Encrypted: i=1; AJvYcCVcJIMr35yAOJJijs5gkVqRK1QqlZXM78f103de+NDPbr0smY59J8MeMiG/aoYAAKbYvjDpS7G/3Cfk2nVkumDC2ZmOc5unwWu+ltjvVi3psrA=
X-Gm-Message-State: AOJu0YwCeNqtHxzj2Pn7R1ZxG9e+I3bFJ3tvuBrEzKcP4VlO4Crc3HBT
	lVZlt19gdIGge01+Hq377yNv0S8BFZknd4AANdXuyo9bsSh6PSREzTxR0DonRyk=
X-Google-Smtp-Source: AGHT+IHcrDew/tYMRdmLru4ZS+FP3kleaypnfQRlHEHZD/4/atR3zO1VjPZple14QNJpM6yex7OnhQ==
X-Received: by 2002:a05:6402:40cf:b0:5bb:8e10:176d with SMTP id 4fb4d7f45d1cf-5beca8f1759mr7550171a12.31.1724097355517;
        Mon, 19 Aug 2024 12:55:55 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.215.209])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5bf0b0cc99fsm172687a12.49.2024.08.19.12.55.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Aug 2024 12:55:55 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: linux@armlinux.org.uk, krzk@kernel.org, alim.akhtar@samsung.com, 
 Gaosheng Cui <cuigaosheng1@huawei.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
In-Reply-To: <20240813105037.1178393-1-cuigaosheng1@huawei.com>
References: <20240813105037.1178393-1-cuigaosheng1@huawei.com>
Subject: Re: [PATCH -next] ARM: SAMSUNG: Remove unused s3c_init_uart_irqs()
 declaration
Message-Id: <172409735425.112951.15942320128725755678.b4-ty@linaro.org>
Date: Mon, 19 Aug 2024 21:55:54 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.1


On Tue, 13 Aug 2024 18:50:37 +0800, Gaosheng Cui wrote:
> The s3c_init_uart_irqs() has not been used since
> commit 2a8d7bddf273 ("ARM: SAMSUNG: Remove uart irq handling from
> plaform code"), so remove it.
> 
> 

Applied, thanks!

[1/1] ARM: SAMSUNG: Remove unused s3c_init_uart_irqs() declaration
      https://git.kernel.org/krzk/linux/c/200b6c1a59975a60c7fab90c88533f3f3458d826

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

