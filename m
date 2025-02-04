Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A06D8207A32
	for <linux-samsung-soc@vger.kernel.org>; Tue,  4 Feb 2025 08:50:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738659061; cv=none; b=Vonc/cO9QzcZw3JmCzTX88i1k4sZJGjWpII9TcnFzNfbBkVD4qo+iQjN9XJsJ460TWIg7/Ll1iFyBl5gfyvBB2xfab2Nt/BVgt7+lKz2dco7A8WXPksYFx+Vuyt7hKUXvD/+6625hXgDM9n0ypTFBreIuDHaUSbA5wZ6vUyeSPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738659061; c=relaxed/simple;
	bh=YPt7gKipaMwkPE8abX4wqOxhxvYT2FdS5FceQVgzPek=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=bYiO0x2Rd1nVDfFozN7Umo8g4QfGcKYnsGNTWyR5s4uWknfQxmPWPBTJwdCV2E+j/UhGpHVXIiBKwOUTKuX9rLTJPBvvSiNw9Py+KpXJCgd2ADgdbDH95yVbNBN2Lme50gZ8Ldv1uJ1DnWEScGaFxL+TjNnuaETFIfKy98FBR6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FIFosrYo; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FIFosrYo"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-38da6a1a20bso41708f8f.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 04 Feb 2025 00:50:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738659058; x=1739263858; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zHI4ANQ0svBkpULL9bY+LYyIFtREYaSz2osAbuLLKME=;
        b=FIFosrYoqaZw9A8jE3nW7g1JYOdhLSC6NHKF0mksHZ1h1PWUuI9pIhCMJ8pb/WEtZR
         DakFB1M/QOPcpwhVfCi2ukcqrBHUNDHlbMLR1s0/4bkToPFgqTmVkJj1Doz7DndoiKC+
         hskeiS3dgLm1vh+FRPwoLyZ9XRW+dXYgjB//Rbuw7d4zrNgYkc8iDXCJEJ3F8ssJbUhu
         W5sbSbI7C5+qC+xvgWgs3/f1Z//EbOikA51rqjtm1MYZacBKDbQaVK/lIL0gpNfjv7r5
         81f0+4AXmkYzkkzbvgIj1gvE+G/oU/3fWTjcJQhiXIbUcxpO9Y+ozSGj4NnT9wj7kdAl
         LqNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738659058; x=1739263858;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zHI4ANQ0svBkpULL9bY+LYyIFtREYaSz2osAbuLLKME=;
        b=vncmeolQd7PPFyfl8yHdZdRlpW9YE34WQsCXjxwX9ng4S55/q0fqQA30ZWLASSnZXw
         t81Az26ZtqHTFjvGaILietl/dOJet7NPb2xa/9F51oXmlpCZXqsCJGmgf8AgU++eGZnC
         p/4OLhjttP1wV8k8eRO65kJdnoxBrXckOL1f6sopXz4xZNUTLei4B4ynl2UxBIYLenCB
         C1BlE1BJiTLQBwdz7DFllpGW29hGbeUPbR367KjZusqISEUn9cRruopKaXdGBSAZ5e3W
         7K0lUd7MDvpdvlAwDo5SgQxYZV+foJb0/AGUvaTvwaqfavOhkPf1YyX2wfDAHGhhd3b3
         3beA==
X-Forwarded-Encrypted: i=1; AJvYcCXC6wAvepTwCeq1//wrsPMUAy+9/0pD4L1N+VI8crcro9meo9E9q0IZLjmcok6/DlU0jPwjEoI0zSFLaEPRIoo4WA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyaGoDYu18p54TkNszieUdzuGud1960qYzvhoLZWi+M2/IG0S5/
	mq1Gf6IeBXf4msTr77Emdk8ABRoaWAYPhZuFw5zH4APwiANmhKM+3aTm+ElHX/A=
X-Gm-Gg: ASbGncvHhELUAMF0KiKSLnZNTs1oDp2ajBmTqdu8xjcDzil65zLv0W7nm+bxrbHfWix
	s1sdu7a8tMx2fBloQkEKmnYjEnSB0FE7iKrMFqBkTD1n/IFnSBnnvyB/OxE7ra70lxH/YeXkWp3
	e9pmHrdnPhadfochVluqaHTS7h2a7BhctOOtF43Ra2gQbv58hsYvIdLh+oPkF+vNKu6C4p9GwIi
	PBaSDftoeVbnf925VG3dvjjouw1R6nCg7JiIbqWiRwh+Ht7HduQP3JoWvoA6Y1+Rd4UKt+vJkZY
	faWSVvAtcKB09PNS+yK8PSfPCkD3uXU=
X-Google-Smtp-Source: AGHT+IGO43N3gDtliqfjaHSeEORXODUkak0lfjeeQYTFjCKfZJOWJrPYG7CBCu9P6KNQnJ4ls7UBSw==
X-Received: by 2002:a05:6000:1f88:b0:385:e374:bee with SMTP id ffacd0b85a97d-38da4e0276emr723050f8f.4.1738659057514;
        Tue, 04 Feb 2025 00:50:57 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.144])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38daf27bbf5sm503066f8f.48.2025.02.04.00.50.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 00:50:57 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, linux-samsung-soc@vger.kernel.org, 
 linux-clk@vger.kernel.org, Colin Ian King <colin.i.king@gmail.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250202220425.199146-1-colin.i.king@gmail.com>
References: <20250202220425.199146-1-colin.i.king@gmail.com>
Subject: Re: [PATCH][next] clk: samsung: Fix spelling mistake
 "stablization" -> "stabilization"
Message-Id: <173865905644.26600.17565544065003058616.b4-ty@linaro.org>
Date: Tue, 04 Feb 2025 09:50:56 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Sun, 02 Feb 2025 22:04:25 +0000, Colin Ian King wrote:
> There is a spelling mistake in a pr_err message. Fix it.
> 
> 

Applied, thanks!

[1/1] clk: samsung: Fix spelling mistake "stablization" -> "stabilization"
      https://git.kernel.org/krzk/linux/c/480b1825d3806d744c589064df4af2bdbe2c7c2a

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

