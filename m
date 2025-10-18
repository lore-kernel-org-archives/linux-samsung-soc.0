Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CAC825A357
	for <linux-samsung-soc@vger.kernel.org>; Sat, 18 Oct 2025 17:20:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760808015; cv=none; b=RKfhh4fsIs896441fksiM4l922nUMrikleSaOFXXM85waOudIBPDbc14Yv7WzmD7NcWrwJ9BlFDM6n364QkI4JlXGtOGE3IL2L2r9sSphcW7w588UAa4SKlJG/lbjvNSNBUqRN1u3cbD1N1kJ6HEi3hRbU+AqOyDZhQJOQNlJU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760808015; c=relaxed/simple;
	bh=WG0By6HJSOk4DUWwz+cmUY1Z4lLqsP5xeqQxmADZdLA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=aYXnTFA3psDk8iEUpSXsfGBIIUHsBVM8oJvF/+Wvfg55Wo4QSCiskiP0abeMRNyHxhTuTxLzjT+gnPy5VekBclEyj0/H+CVK7ZIWcNatjjvC8ylOPcQDYuG9atdU9qizrRkr1yDfdGqVYbtrPaPA8qj0sxPYccGMmDujemhJsMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=j1a8QmpS; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="j1a8QmpS"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b40884aeaf4so56806566b.0
        for <linux-samsung-soc@vger.kernel.org>; Sat, 18 Oct 2025 10:20:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760808011; x=1761412811; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7VxnEHAFTLBwJjm9p2k/uUVQ9xHF6FgWwcXARdXtVLE=;
        b=j1a8QmpS4A92eB8PE3a0obIwjm0btpNArS3q70+VeG36hLXV94pj4a9TGZz81lqrod
         ZftgY7xEt6pO2ouC/TkIiPMzNtzoVZ0gLPFUD+PM2Yumm9IRoEEIX4EaaQfT95RDpkNp
         UKU/JdcbyjdQYtAc+SbIz9TkAyilgoUVk7XLIptkFfpb1uen5KNK0rxttTePK9YKP9Ml
         5Bj+h5TKLLbhu3PV6uyOmmF/X0UpaqYiz9vfURuaPdSMdsBnPMyvVmlWhx7NfAvz+Hee
         jZRsqZLFR68OA02MofhrxPbB7KitFr8CFv7xhjLcR0M3Zg5F1fFCPi63ZJC5UGpc8MUe
         FFmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760808011; x=1761412811;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7VxnEHAFTLBwJjm9p2k/uUVQ9xHF6FgWwcXARdXtVLE=;
        b=e4lCWt7mYwunBCCnq6arvdLrGywRdI7OUTgeBDMtQItTlUVDaCrJ7KZNeJqGR86lom
         j+kAmeZgNf3ToYSwtAWg850Ca4wTF39sYG9023+LqPJMiJjPP/ruJvFdPwGleUDjZSWq
         DMgGW4CTFVynz5FinGvykGH3i6oy+1ntQOOVAg17/p6j1b97egaM/wIBw7l1O/k8ZBmD
         42DIr0D5mIKl2WlyIkzKgZaOqWGQyu/ZgL6PB7ebHSvD04PcPf0D4YcjxOeGcEazC1jv
         jKzBkU+VM00hnXIF4EaIQ4CkS2gRW0ge2AoSvRb133tx8XV1XtVCsNV7pzT38lj/AqYc
         JapA==
X-Forwarded-Encrypted: i=1; AJvYcCVhx+YRUyeHB3FoqFb73ofl9saZ/bU/pS1dfRN6zQqfWyN8JMfroFYVVmILVUSbvbXzOuqxXSK6vK4xHPqOIONXcQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxeE6I12bbZ/5RPW1P9d0Q+qS6ox3g8Y6WprmyBhybRqGZsEJWd
	6hk1usB2AtjN0U8qqr5C3lA28illF6LIkhKMrAHCWliU4uN6POPOBLB90hCULQioviQ=
X-Gm-Gg: ASbGncs2Qp4ir3y6PP67rYLD43v9se69PQyDPghKAazIfJux1iFe+QMWoATHGeC/5Ky
	U0mP7kBhAgJeD22GVXhzpgRVZ64Eixt/LbaQutYsTxsMGOhTUpEVoXg1g5gfB8MZO+MFpsL+IrT
	2jB1NXQVDHXXg8xenNc42nUWzFU5y1OM+RPpEQG7sfEkPkzJrd8bCEBteehb2bB5tiVNo4HdZpb
	z+3cSw0RLilomzL6CufbgqGLieeQAJmjRsTQEo+5HYm8pzydjsubqR0c7Sp//E+3peqi76NjmX1
	msgsaCzZugY2L3p2wVthYmqCGldj6RXQO8f8uF/IqeWpMGj3o+g8uQSJNh/zAOjKwpx2szwU6G0
	CvUYKCl97SbQmwiekwJrfK/fVBdz4P8i45AiXx5rYzx9rpI/ljxphf0wdzrwbUhtaep5ZpF1xIB
	EutsWh9gbWhWVAxVwOhXyvU35dS9w=
X-Google-Smtp-Source: AGHT+IGzjn00W+axM7EzxH6402VlIDI5GyxjkBOsZamKlExZQPJ2gmUxiR9RMhBcQN+CgJFX6XHGnQ==
X-Received: by 2002:a17:907:9407:b0:b63:561c:aa28 with SMTP id a640c23a62f3a-b6474b36a30mr495141766b.4.1760808011555;
        Sat, 18 Oct 2025 10:20:11 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b65e7da2bc7sm280666466b.16.2025.10.18.10.20.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Oct 2025 10:20:11 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Sam Protsenko <semen.protsenko@linaro.org>
In-Reply-To: <20251009-gs101-pmu-regmap-tables-v2-0-2d64f5261952@linaro.org>
References: <20251009-gs101-pmu-regmap-tables-v2-0-2d64f5261952@linaro.org>
Subject: Re: [PATCH v2 0/3] soc: samsung: exynos-pmu: gs101: avoid SError
 for inaccessible registers
Message-Id: <176080801030.47136.7288147057248506381.b4-ty@linaro.org>
Date: Sat, 18 Oct 2025 19:20:10 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.14.3


On Thu, 09 Oct 2025 10:31:24 +0100, André Draszik wrote:
> Accessing non-existent PMU registers causes an SError, halting the
> system and rendering it unuseable.
> 
> For gs101, we can avoid that by creating the underlying PMU regmap with
> the read- and writable register ranges in place, because on gs101 this
> driver controls creation of the regmap.
> 
> [...]

Applied, thanks!

[1/3] soc: samsung: exynos-pmu: allow specifying read & write access tables for secure regmap
      https://git.kernel.org/krzk/linux/c/1fce7e4d6c42c8164e6e36d8600e16663066c1b2
[2/3] soc: samsung: exynos-pmu: move some gs101 related code into new file
      https://git.kernel.org/krzk/linux/c/b320711e4c377b0e2ce0b296ba9485cf3f9eb10d
[3/3] soc: samsung: gs101-pmu: implement access tables for read and write
      https://git.kernel.org/krzk/linux/c/8b9cd112f1ac8d72244b189654e693012ea8dfe0

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

