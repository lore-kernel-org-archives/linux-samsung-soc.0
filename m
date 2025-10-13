Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75123213237
	for <linux-samsung-soc@vger.kernel.org>; Mon, 13 Oct 2025 01:02:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760317325; cv=none; b=BWOuvIaQnjoxy24d+gD/bx0rlg1nwKb4cU6DrBA8L9wuAzEOVt+lQuEoMYqLe6BUJaKRQnI7cqjpSxzG533lacCCxnsb142BOtWGwIkrMOsA1yOAPSfN/w83DI5iDX8o4t0TG6o7PrWnu18diAsEJ//xot+2NjF95ibs5smo4YA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760317325; c=relaxed/simple;
	bh=5QsolDiiIg8i4wa9pi0bcArvGbChTBgEPx+xwIk7v7s=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Rc1WJ3s/I6GekNw4D6qI+YKBAwC9Fr+Fs0JC1CXqlvL00WXcpITXhHuHE2Reaj5qUz+sXIW/s+iLwvtamP1AYQR8bT0BlOxstfpmyh7iE31INozgcntV3zrZWickOcyj8Z3J4x0t22Kkx0eNfcTxDgTIRPYEZqYP/8ZAgFXFeNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lgf29vI7; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lgf29vI7"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-789b93e9971so286595b3a.1
        for <linux-samsung-soc@vger.kernel.org>; Sun, 12 Oct 2025 18:02:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760317323; x=1760922123; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E2VZD0X6ZKBVyHcu44cQwkRlDd6EuJvxZbXDHRQf7Yk=;
        b=lgf29vI7dDN5ihH75+KrCjSgi/mRIsILTZjpQgEysVUllzni6IGPt1a4I/EkTxvLBw
         pkdLb0E93Ebe/GTOUAjXfXpp/zFcWDDPt1u3qiMteKyK5fQZfXRTVPfBMMM2V5eD6b6D
         DXl2Xj7CgHoPZVv1JLC+KLiNyB79J/O/wMbJaGynyEBUwVxT9fXFG+vfirdusdsNEK5n
         91MzZpD/kA+kFEL/nBax17EL8JlJuJ0IVskrz/7t2yw6HAe3YkSznT8/KA/dkWZVDYQB
         2lu4q/oQeNGMF6a8kuIPsDSLmm6FCcj8KKwQNA1EcHwoXvgt/366HB5XEguVEJhVj2B0
         vkyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760317323; x=1760922123;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E2VZD0X6ZKBVyHcu44cQwkRlDd6EuJvxZbXDHRQf7Yk=;
        b=q29ZeN5lfqe4n5DeB14ATOqrBnhzGqFFcNskFw6S9l1mK0zlltwfx2Kgq3rutzgnSN
         +FYdsC1EyXjYmElTx8EOWv324mlpp9jMyuuzahtmQOO0aw3lGI3QthiqDHG87bVJoAy+
         0cHkjuiEWo1o1x2trO45nOAXuV6fM3QE4N09QaWa/qpBRg0s3xBG+tT/v9g4VzlQ5cAQ
         LVK0DdYC0CNPcif7NV31APj0HrRBmH7kOPd9B14GqogzigjXf1aZtQK5xFuZmV/SCnTR
         KHkH22emL8cCaI8g3o1xbB7nobz7f1g5D0o45K4Bml4DQVH51MDuGOyFZ7M1F4C+qlL4
         blTw==
X-Gm-Message-State: AOJu0YxjPQI2HsG4xUuWbiM3JPlnUzbDgZO+S2UXOonlFhRMuJTsAb1q
	GuguQ0FwQfbXr8c28/rICp6aynK29rygqpg3khVu1R9fFLhyL/qOxfl2f3Jrr2xWOqI=
X-Gm-Gg: ASbGncu2E606HcDoVIsp/KbOFKHQweg0kFQ9GknKlbb3Vl9O4C4MzYoVe7JgDUQfdIT
	Zn53zV2ORIpbY3wI1vtqNdajj94EMyFbbadwCwRlOSaxFmvKpPNZDoT7uvECABTgAvNAwJUqFOY
	8WIB02hMFmSEowmRqCv5F4Ir5RErm3ffoT3E2fTq/Sf8KoQzLQGOPjtQLDqmA6SZjagAb/4upTw
	dCtCLUJW0viXmusUoaiuuh5NJcFaUQIwKcSkZo2O7ebi7aTrq/M6K5HJF3SCMHmmuLkK6NyakNm
	CFtHSTZhshIuxYFX6rQMDeOWdlMVYeqxYiSBfig2X6cJDDR+yYQoKsqFV1AT2nM01fPrQxvzNvt
	mYkJ9hy+/HBUOlpdMOLyCvcQl1JzwajGi3ptT9mRn6KxkmCB0/w60mjUQtj47
X-Google-Smtp-Source: AGHT+IHkhsD8Q/l6W8s4BND2jDztyLoKb3Ag770eBYI8rhYQWaZ8cr9fIADYoln3Ut5t+SFwMBNglg==
X-Received: by 2002:a05:6a20:cf84:b0:244:aefe:71ef with SMTP id adf61e73a8af0-32da8439bfemr12149595637.6.1760317322630;
        Sun, 12 Oct 2025 18:02:02 -0700 (PDT)
Received: from [127.0.1.1] ([121.134.152.93])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992d0e2ab3sm9512805b3a.64.2025.10.12.18.01.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Oct 2025 18:02:02 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: krzk@kernel.org, s.nawrocki@samsung.com, cw00.choi@samsung.com, 
 alim.akhtar@samsung.com, mturquette@baylibre.com, sboyd@kernel.org, 
 robh@kernel.org, conor+dt@kernel.org, sunyeal.hong@samsung.com, 
 shin.son@samsung.com, Raghav Sharma <raghav.s@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, chandan.vn@samsung.com, 
 dev.tailor@samsung.com, karthik.sun@samsung.com
In-Reply-To: <20250925130457.3476803-4-raghav.s@samsung.com>
References: <20250925130457.3476803-1-raghav.s@samsung.com>
 <CGME20250925125624epcas5p1b8da5d2cca89128d286f740b9896c609@epcas5p1.samsung.com>
 <20250925130457.3476803-4-raghav.s@samsung.com>
Subject: Re: (subset) [PATCH 3/3] arm64: dts: exynosautov920: add CMU_MFC
 clock DT nodes
Message-Id: <176031731657.32330.2231798506683118457.b4-ty@linaro.org>
Date: Mon, 13 Oct 2025 03:01:56 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3


On Thu, 25 Sep 2025 18:34:57 +0530, Raghav Sharma wrote:
> Add required dt node for CMU_MFC block, which provides
> clocks for MFC IP
> 
> 

Applied, thanks!

[3/3] arm64: dts: exynosautov920: add CMU_MFC clock DT nodes
      https://git.kernel.org/krzk/linux/c/e3be50e829aa1aee713bf0c6907acf13d48be310

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

