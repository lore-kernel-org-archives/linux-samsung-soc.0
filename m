Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68B7837FF7A
	for <linux-samsung-soc@vger.kernel.org>; Tue, 13 Jan 2026 10:59:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768301979; cv=none; b=OXaM4Wwg1kaz2+FIRZEJgubFLRUYdatCeTX2cuvgOqgzlqXwI4eDLMssuGFLQELTx9rfkiHQxByBj6KZghDbhlGrgtXx5tcxlQyVsdgqxRG0pNhr+SGMGtK4tqk6OPGCeBYDhhzd0+ponkNnS1hjnPYPw1R8j1K1zu5TmB+1Pqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768301979; c=relaxed/simple;
	bh=S+ZAPlt7l7qSiwZZJgJDTP5SkN/10VGq32rITKiKJcw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YWf33YAnQ5FS/PVVMUydkkm5ObWgkeMLqfx7+yoSN/hFpWmmiD8ypQLZkZnObR6nrXyh3eD9VU1KZlPuGUe0UHtYmmw0ASyX4IUJbNva0CvafMee0vExI4Vd1VBPm3mTQxv1m5SnNQ6gHhgzqFfUdACKN7btbH3MjdSMT1L4ui8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dyuvW0NN; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dyuvW0NN"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-432755545fcso4349741f8f.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 13 Jan 2026 02:59:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768301971; x=1768906771; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eBpbiT1UH/OA8X+hOXxnnO4w4MCR9v/fz6fRCvgTXsI=;
        b=dyuvW0NNlWeseETbH3z61x6fBubB8IxrWNvNSTFgSgZLhBhmMGFraO5/dOo+weJhWM
         YKmRu6n2dVxm0NEHoEw23eFp3snyClE3gbUANCTZWNw2N6FySq8oDvzpevGUtwBq9YXl
         EDe8wi5fPEkkXofwNkS8GwWmFGxlD7zskWTjKR+BXcQhgnuF08/5iITWBlM64ig/2p5V
         X69ryR2VvAnUZkwpqG8GT0o/fLTGgMByQ94PFwqqV9q+JwzofpYGOE99rHro9OGGWu2v
         tFA99Y/Qa3wSHi2iOf3/YVZGjYibMo4Xgad2zsEdVzyMKA+IdNctsQ28FnG1uP7BZqYx
         jXig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768301971; x=1768906771;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=eBpbiT1UH/OA8X+hOXxnnO4w4MCR9v/fz6fRCvgTXsI=;
        b=G8US4UeYjVMVgIsD6N7puDLJs5Gqre+8zfN7cbzG/J7efLsS7LZAF8Ib6Hpi7G1cZm
         4fHT3+Ayg+4SBiN+/Iy3LUNZsypLI4E6F+TrXCWoWnAFNJA321eWpaCzEy/qkFZKPIMS
         yXOwhvVttI4w+VJQ4dzXWKpj0ojC8HViQ4z+MYNY4G0XRHnnzd9oYGnl7mmrU+tYdt8B
         NU3XMNuq7Bg2M1PJV/sIM19JzIxngxKyxNfGgC4GQP4GdAyoiXWbdYzGFlQ5Yy1PCHSe
         mii+BgOCRv/Jscp1viM6g08ZtplsjvvIKkDqwmG/Yzqrx/8p26Q5/5qJW3fQbgEPwy8U
         iDXg==
X-Forwarded-Encrypted: i=1; AJvYcCUS0YkvIaVtXYNsfs8ds4by/XubILEaMmHEg2uLCghbQVkhpKBsiS/2Lm4NSgavECWJzuFelKeWN6Dz0W1T5smZCA==@vger.kernel.org
X-Gm-Message-State: AOJu0YybvH4k0yc9gieQK9B/YbgFtX8uoCJEzRrNViAszwyIX16Yh+d2
	h5Ofd5q5/Y0aY4jMWRy0BV44/Ddvu+hyBD1rEo28UPj5goH/qznVOvBmbldeoKGTHuA=
X-Gm-Gg: AY/fxX4ehhW1ac/NRWWolSNm6VEYzNa5noxIzLqSAvDDcZgacJa/6j7UBEwj5Em92z+
	M+r0u7PoT0GhaGfeN9TaPT5qMZrfgoU0p8xhdQmQK2pGCCBvuoYodeDJd8qkIOwpbZrvq7nUYri
	f/WvugLpmAfPf3IC2KSuW1h8IZa19uxsEsqR4RkJxo4pcVwITkeIWJkI4cWIMPyB5J5g/tD+0bv
	8VtFbqk/nSiBlu5zzZFdFphnocM8qJOb0hrvR0kuhsnTmhAhZuNxM/rXNewilw44yFXC6X3KUzY
	xAO3HVcWXdCPBZaJ2xbtw8Y3ciDvRk/qBf07U5Yr5CgcLzp84DNJreQllyzGWtr8Kh+wJF+549S
	6CbsxBtdqkc+Oh5p8pFJA8Ip6Vv1KRdDB9jJGFnd2NaZHcVjgloVxuycWBvw3XcMNWmKBvnNGSS
	SISAVHy+Sit45mEBqgtDf/+2Uw8cxCjSyAayrHZEUfO0Y=
X-Google-Smtp-Source: AGHT+IHSgDVUH9/dhiZYJxnIUorYOCelZMoqtmXYQkautt0XBMKPQj25UwiE3+iF4Z6lVVM+z/bN1g==
X-Received: by 2002:a05:6000:400c:b0:430:f6bc:2f82 with SMTP id ffacd0b85a97d-432c374f180mr24842546f8f.30.1768301970623;
        Tue, 13 Jan 2026 02:59:30 -0800 (PST)
Received: from gpeter-l.roam.corp.google.com ([2a00:23c7:3122:c601:3454:384:9eef:8e29])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5ee243sm43729881f8f.31.2026.01.13.02.59.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 02:59:29 -0800 (PST)
From: Peter Griffin <peter.griffin@linaro.org>
Date: Tue, 13 Jan 2026 10:58:58 +0000
Subject: [PATCH v3 1/5] dt-bindings: clock: google,gs101-clock: fix
 alphanumeric ordering
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260113-dpu-clocks-v3-1-cb85424f2c72@linaro.org>
References: <20260113-dpu-clocks-v3-0-cb85424f2c72@linaro.org>
In-Reply-To: <20260113-dpu-clocks-v3-0-cb85424f2c72@linaro.org>
To: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, 
 kernel-team@android.com, Will McVicker <willmcvicker@google.com>, 
 Juan Yescas <jyescas@google.com>, Doug Anderson <dianders@google.com>, 
 Peter Griffin <peter.griffin@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1218;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=S+ZAPlt7l7qSiwZZJgJDTP5SkN/10VGq32rITKiKJcw=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBpZiWNAam9qhTSzrSHSokiaMfkdqj20X6eKe1Mi
 PmqAX1HWVWJAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCaWYljQAKCRDO6LjWAjRy
 ujKLD/9z6NjG0NY1i7Yp0KdIYiIkkBLtIA97IGmloAyQ4SVzpinID21BoZZuLQ/fD+mvCkoyKM+
 idFWAL/vbyBcU3uJYVAWte8JmCtfCgwACJjnbU9alawn/BQ6BGBzSfSdcbYJe+yX8XD0cse9xIN
 UzWwVp8QS8hz1Hdl2H+9fRGNKklKeSfcEdd/osHQ3mN1pKfjnw16nVfRg+Z3lvFAY/ntDBihQIs
 RAcavLvBSz82pZ/VZ0cjOZ5hitRoJPldq8fKtjnk3v1hIJhIQ1rV1D7g7VqV6yz7O2Nekq/gqkq
 iJorEXEuSvsoVWZxFXjN7EKToBEkH5mrVG3q0k7PgKvQhqJMGlxB9FWR689muzvRyHXUXlnqj0a
 Cljrw2z7YGY35zpsEDjCeEdlJPFr1nV+Qv7Wnrm0PuWkeppIrJ2JinPeeJ4KPLMJZYacyyPwZQT
 Wy8FbArW4d9ZIYa0xM0XT55UhIj+5x+M3wKCM3nmRzRQrx8b50EVwsffJx1cfXKuyOcGFKGEf/y
 jIajZcNgfdS3uOveMknn02Mnnj2EoUFpmQOF7+2sxg5jr/9xPuLzkFtgiMAg0YZrx1qlluXaKR8
 glzbQP4MvEhATjxQ/BWi3uIF0XGl8nFIiwe2Y6wtuWPVlYIC86AxS0ITG6eTQ37Z3AnP8Gk6GX1
 8RlhcnHtRlwA3Mw==
X-Developer-Key: i=peter.griffin@linaro.org; a=openpgp;
 fpr=0EFC8E6F5578750D56B549FCCEE8B8D6023472BA

Ensure children of cmu_top have alphanumeric ordering. Top is special as it
feeds all the other children CMUs. This ordering then matches the
clk-gs101.c file.

Reviewed-by: André Draszik <andre.draszik@linaro.org>
Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
Changes in v3:
 - keep 'top' first and alphanumeric for cmu_top children (André)
---
 Documentation/devicetree/bindings/clock/google,gs101-clock.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/clock/google,gs101-clock.yaml b/Documentation/devicetree/bindings/clock/google,gs101-clock.yaml
index 09e679c1a9def03d53b8b493929911ea902a1763..c41043c7d25200fe947a2ca5b2780e4dd50ad433 100644
--- a/Documentation/devicetree/bindings/clock/google,gs101-clock.yaml
+++ b/Documentation/devicetree/bindings/clock/google,gs101-clock.yaml
@@ -29,9 +29,9 @@ properties:
     enum:
       - google,gs101-cmu-top
       - google,gs101-cmu-apm
-      - google,gs101-cmu-misc
       - google,gs101-cmu-hsi0
       - google,gs101-cmu-hsi2
+      - google,gs101-cmu-misc
       - google,gs101-cmu-peric0
       - google,gs101-cmu-peric1
 

-- 
2.52.0.457.g6b5491de43-goog

