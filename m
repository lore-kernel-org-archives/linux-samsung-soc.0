Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E3207BB17
	for <linux-samsung-soc@vger.kernel.org>; Fri, 19 Apr 2024 10:09:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713521365; cv=none; b=jEmK6ZeXf+xFVRqn9s5rJYo5MviNipwZpSekW/dh5VGrcdX17En9rtntVBIeF+2eZEv12avYaViogGhkVEWpmrhj570NWBLc9c3wYeqU72M2iiKHlYFW2vtAQ9EdStoifUDrXBVbo3LDoLt8Y4EvxTL9whpYBl7PgatsyKBC1k8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713521365; c=relaxed/simple;
	bh=oo0dGqbZTiSgdkttMffHRviYzeWZlgJGSQoIGvcpLp0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ovDitPUMQkABhr5Lm4+x86AFAdiqUJiDqh8OY5ZRT0dRYtJlRiVRet3ThZ9sqqNtjhdBUCVWCTW0QJmx3+2xmFOs24HWbqklp1KxC2jvR+P7rCqiq+3ECTPWjXlNyNT+PJCkXzvwLmRRBCyzfMTE6bigKmTb+/ld8FRvFwKg8AQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iUQoBSRM; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iUQoBSRM"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-418dcaa77d5so12852415e9.2
        for <linux-samsung-soc@vger.kernel.org>; Fri, 19 Apr 2024 03:09:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713521362; x=1714126162; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3XsfVisx7vvQLrO4aI9sNPKlohq0De0eJkgncDmesfI=;
        b=iUQoBSRMZPSwLn20QrEWlBF0LdRueDoCf89kp54WHuUPa5Ei4YHgEnDHC3jW02546c
         MuCIWT7aMZNKNVCbjXo5krBRwRDaY8JtsgGTUuZw9W1Kq9U3Qqe3fvEVQumyASopZaiT
         xkz8od+EAlEvIritcX1QEYSgEgFNRtPHOaCd/6Q3IIXKLYPqSwZUmaL5Cy30cT7F9ihy
         Nsmc9oa1psXm5021evrSUqzgsGgDBC2SPf0NTNFeNt0rWuNzivCbQtis9fai27KXWbvl
         +GwPsxVJW9SqEGhJY2UxR5hUm3sqrOwo7DxU96B1uZ4SHD9cmb4VebfzsgWotHyTuWOp
         fS+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713521362; x=1714126162;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3XsfVisx7vvQLrO4aI9sNPKlohq0De0eJkgncDmesfI=;
        b=tL0XSoXwUbk0qJ/DPPQEqMiCsT68/FUOnm+EjDUz40/DBYxK9+QHaWnGDu1sOTbRb3
         /9vFEZVsRLtkS/zjSB20lDXpsxAuAMhyhkWr0jc5iDLB7KhT9aHcDA2VfDaGuvZT1quG
         QCVqIK3XfsaNXU5xu1w8ykWiHi0c0EyXtdqhDKzpBwrZYbiz0aRmTzZZBktOTik6qUoC
         8bs0PRvEuMFokqhshDrrXnKENFqOXCH7Lk+6xZp5UT0lpinoghFB0Miw9lsp4u85cu3p
         TKlcrEn0fJtz7H9K1WSBde9iwHq4LZ76pyhduYHLl63eTsfe2uf5GPW8LcuQM6Z521uU
         EGSA==
X-Forwarded-Encrypted: i=1; AJvYcCUlHN2ilh0952xpQfK44rtjjC6+9VvQFVkkccc8otKt+1JHJONu4DwLF9Puci2gQrSI0LLll4dF58LpYbn13uXHjTiePavuz2d3XhKiUc//Apk=
X-Gm-Message-State: AOJu0YxftCGxeDLQiDC8+kkO96ydh8yOzngHYC5P+LP+g3kXtkkg5Ato
	r7d5JqHjyjYdXW+h7RsEawACpd2+LgXb+wE05q0HMv5ZWBPTpmGVDZeFLXn2KxM=
X-Google-Smtp-Source: AGHT+IF5r2AfR9N1McmRxV5AGkdHrqHz9qxcGz7y9EMh39vMYowFt2/VkhtWhbgWeXKir0ptJdzDsg==
X-Received: by 2002:a05:600c:3b11:b0:418:17e9:c23f with SMTP id m17-20020a05600c3b1100b0041817e9c23fmr935432wms.31.1713521361584;
        Fri, 19 Apr 2024 03:09:21 -0700 (PDT)
Received: from ta2.c.googlers.com.com (158.100.79.34.bc.googleusercontent.com. [34.79.100.158])
        by smtp.gmail.com with ESMTPSA id p13-20020adfe60d000000b00349b73143e7sm4061773wrm.75.2024.04.19.03.09.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Apr 2024 03:09:20 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: peter.griffin@linaro.org,
	krzysztof.kozlowski@linaro.org
Cc: s.nawrocki@samsung.com,
	cw00.choi@samsung.com,
	alim.akhtar@samsung.com,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	semen.protsenko@linaro.org,
	andre.draszik@linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	willmcvicker@google.com,
	kernel-team@android.com,
	Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH v4 0/2] clk: samsung: introduce nMUX to reparent MUX clocks
Date: Fri, 19 Apr 2024 10:09:13 +0000
Message-ID: <20240419100915.2168573-1-tudor.ambarus@linaro.org>
X-Mailer: git-send-email 2.44.0.769.g3c40516874-goog
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

v4:
- squash nMUX patch with the PERIC0 patch so that it becomes a single
  entity fixing the introduction of the PERIC0 clocks. PERIC1 fix comes
  after, as the PERIC1 clocks were introduced after PERIC0.
- fix the fixes tag of the PERIC1 patch.

v3:
- update first patch:
  - remove __nMUX() as it duplicated __MUX() with an exception on flags.
  - update commit message
  - update comment and say that nMUX() shall be used where MUX reparenting
    on clock rate chage is allowed
- collect R-b, A-b tags

v2:
- reword commit messages
- drop exynos850 patch on Sam's request

v1: https://lore.kernel.org/linux-samsung-soc/20240229122021.1901785-1-tudor.ambarus@linaro.org/


All samsung MUX clocks that are defined with MUX() set the
CLK_SET_RATE_NO_REPARENT flag in __MUX(), which prevents MUXes to be
reparented during clk_set_rate().
    
Introduce nMUX() for MUX clocks that can be reparented. nMUX is used
in GS101 to reparent the USI MUX to OSCCLK on low SPI clock rates.

Each instance of the USI IP in GS101 has its own MUX_USI clock, thus
the reparenting of a MUX_USI clock corresponds to a single instance
of the USI IP. We allow the reparenting of the MUX_USIx clocks to
OSCCLK. The datasheet mentions OSCCLK just in the low-power mode
context, but the downstream driver reparents too the MUX_USI clocks
to OSCCLK. Follow the downstream driver and do the same.

Tested with USI6 and USI13 SPI.

Find discussion on MUX reparenting to OSCCLK at:
https://lore.kernel.org/linux-samsung-soc/d508dfc1-bc28-4470-92aa-cf71915966f4@linaro.org/

Tudor Ambarus (2):
  clk: samsung: gs101: propagate PERIC0 USI SPI clock rate
  clk: samsung: gs101: propagate PERIC1 USI SPI clock rate

 drivers/clk/samsung/clk-gs101.c | 225 +++++++++++++++++---------------
 drivers/clk/samsung/clk.h       |  11 +-
 2 files changed, 129 insertions(+), 107 deletions(-)

-- 
2.44.0.769.g3c40516874-goog

