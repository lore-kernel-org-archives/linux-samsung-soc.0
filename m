Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE015257853
	for <linux-samsung-soc@vger.kernel.org>; Sun, 31 Aug 2025 13:28:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756646895; cv=none; b=ppGeOGq5zl980RcrDk0ta11YfEzDzu1dBUCNmUwxeBHES4i7leDUD1jD0OQdg+MDsevHGh2ntYZdOMx+SMHlVA1G9sBYVtnohx5IidHsOiZnK78MUaGfP/o3rEhEALbjzCUpOtLw5wIN1QpdQlTfHR2rXFz0U7t5IcRVUtxRrwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756646895; c=relaxed/simple;
	bh=MEVeAxVhndT/7Ap1qgmz1gUcPCdJBlzqawgLrzkMB+k=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=doS5eji96PvMS0tDGd5bVAM/gpJT3HCEzhM79Oia8lvIMt+KdZM66NACR6F57rnAsRiO5uao2+blTVbZ8QNGFXvc8auc4d70QCS5ceH9zbXYb5J6MWx0Vy1OIADbgd97DUBHnH+OAbUOyorAJ4H71utg+x9i3YXdp0pXWr0Ek1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=N3t+JERb; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="N3t+JERb"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3d12c5224abso281320f8f.0
        for <linux-samsung-soc@vger.kernel.org>; Sun, 31 Aug 2025 06:28:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756646891; x=1757251691; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C174R2YaizzIOWtPzR0PtYRjLpsIdj5ksrAYTRWCGTw=;
        b=N3t+JERbTGuRAAyVCqxfce6CgTvhdneUFodRUq2lDvdaQwJRwKYIFujw4LOuBqFgQk
         fVKtgr+WVqXsbv/47c9Q8HxfY8JLcJiKtT22VbLiKHqoaRjXpgLA/5umHaW0E0bO3GA9
         hQYnMtbvyFpv1AsF1akwcDcsBWTW9BL4P/9/sAxFYgGE2zed5LVTUIO6n9d6wCqlnUq5
         rfKBaZD1j3OzJtqFtdkDk0e1vkMKbjdT9R5oQSYALmvP8CQyaxyQkeeUqU8l0+nA+8H1
         y1X5nbVqU9dKQHWV4K7uVuZ5sM0bY8KXf0DK7vPq/uvfOPwNsvn+jtXxgD0Ls7a/E6wL
         +8MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756646891; x=1757251691;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C174R2YaizzIOWtPzR0PtYRjLpsIdj5ksrAYTRWCGTw=;
        b=Bx0LVPMHokSa2x1JWutBjo6JL3LXjyA6nUpu9skGZS6MVtxjVpm0OxRZsPxLPg6jfo
         1SLXiFJt3Trnrn6GHuiUL6MwJOv4goQSHzQ6/8NgbKKdFc+t+ollK6fzHXtCVjkjptri
         //2nKVMjK7NoNztrqHSgRsWWqvorpojDb5a/MqqZu7+fIH3bl5BrWWrvbTzHVSLUhDb3
         3bgqkfn6xEwkVpgqCufFMYDkuUmD3iM9USFk54scIqaOPLEFetKO1qVv8nh7MRbNhlh3
         QS5JIb9HedTLpIaDKeBdFG1RY2Q8sLtlSG6uuA2AuLrixwXYXmBNnXiK/E47pSJ7ZXZo
         XrSg==
X-Forwarded-Encrypted: i=1; AJvYcCXT/zUFLML5+XMFNTAD7woeKPS/4fbu7fok3xcAj8c6O8w2krv3uRajOvVSprPMrvI5IKVZP1oUFSZ+ezqy/T3yCQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxHJwp4E2ZBxASnEAerLFBhbdJ6Tz+iryn1YCjNUNXmC48/KDFQ
	ORk0Ipto6OtS8F1QG5g5nkRRq3938sPoD90X6VZT3U3uPWCydp97b2H31hplxUxFtWg=
X-Gm-Gg: ASbGncuM7MkHynNH99q5MJt76JAlhe1QdHm+3+7glCIEZCThvKZFJNox8+mENBSwUqa
	sEcb+zWN54NAsEksQdS229upPZ7nXL4G38XwWfTT+iF+zDqWlVdCze9kJkIkPUJzMusk8E+Hg2Q
	2a5XYJNFXYAz/jM40/68cs6BuHoErLa19luOR31RGl/yqd56zQBHX3J/ay8Je0+3s5hMpoTf5mZ
	92Et4hav5Bp94bCgU6ANpJ3CT9cIOOeFgANBZYtWHMIQEGuE3GBbPRyV0tREYbS63BxmA7kDI2R
	IrGnEyPCVJEIblNv/w+MP3n+t5J5AVv0Qi81Aij0ktjGxA7L0JFcdK75aLooHp5K4Ck24Sz5lYV
	qazHqES1F3VFIqN23LIyZR9Z8P+YXG/rN05oqGYI=
X-Google-Smtp-Source: AGHT+IHkPBdwt6L3VH7t04bp7Le2oXr0tHCapltVXb93QgdyVU4QJ8bZvFGna7E4/zYnUQGrTwhkug==
X-Received: by 2002:a05:600c:19c7:b0:456:1a00:c745 with SMTP id 5b1f17b1804b1-45b802c57dbmr32352025e9.3.1756646891177;
        Sun, 31 Aug 2025 06:28:11 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b87b3900dsm29956925e9.0.2025.08.31.06.28.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Aug 2025 06:28:10 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: jesper.nilsson@axis.com, mturquette@baylibre.com, sboyd@kernel.org, 
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, krzk@kernel.org, 
 s.nawrocki@samsung.com, cw00.choi@samsung.com, alim.akhtar@samsung.com, 
 linus.walleij@linaro.org, tomasz.figa@gmail.com, catalin.marinas@arm.com, 
 will@kernel.org, arnd@arndb.de, Ravi Patel <ravi.patel@samsung.com>
Cc: ksk4725@coasia.com, kenkim@coasia.com, pjsin865@coasia.com, 
 gwk1013@coasia.com, hgkim05@coasia.com, mingyoungbo@coasia.com, 
 smn1196@coasia.com, pankaj.dubey@samsung.com, shradha.t@samsung.com, 
 inbaraj.e@samsung.com, swathi.ks@samsung.com, hrishikesh.d@samsung.com, 
 dj76.yang@samsung.com, hypmean.kim@samsung.com, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-arm-kernel@axis.com, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-gpio@vger.kernel.org, soc@lists.linux.dev
In-Reply-To: <20250825114436.46882-2-ravi.patel@samsung.com>
References: <20250825114436.46882-1-ravi.patel@samsung.com>
 <CGME20250825120659epcas5p47ea3377840efb9ce3d5901a27c85e4ed@epcas5p4.samsung.com>
 <20250825114436.46882-2-ravi.patel@samsung.com>
Subject: Re: (subset) [PATCH v3 01/10] dt-bindings: clock: Add ARTPEC-8
 clock controller
Message-Id: <175664688891.195158.13270877080433356384.b4-ty@linaro.org>
Date: Sun, 31 Aug 2025 15:28:08 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Mon, 25 Aug 2025 17:14:27 +0530, Ravi Patel wrote:
> Add dt-schema for Axis ARTPEC-8 SoC clock controller.
> 
> The Clock Management Unit (CMU) has a top-level block CMU_CMU
> which generates clocks for other blocks.
> 
> Add device-tree binding definitions for following CMU blocks:
> - CMU_CMU
> - CMU_BUS
> - CMU_CORE
> - CMU_CPUCL
> - CMU_FSYS
> - CMU_IMEM
> - CMU_PERI
> 
> [...]

Applied, thanks!

[01/10] dt-bindings: clock: Add ARTPEC-8 clock controller
        https://git.kernel.org/krzk/linux/c/91f98de42310c70f9a23595b3b20aa305717d955

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

