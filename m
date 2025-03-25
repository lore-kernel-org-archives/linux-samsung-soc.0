Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67E7D1DE4C2
	for <linux-samsung-soc@vger.kernel.org>; Tue, 25 Mar 2025 09:46:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742895974; cv=none; b=NxGKKgnBPFe+sQeblrTfbQN8wCgx/TzgnEzkISws7FKoDVkiBwEg+ucJdJG+EbzV/b9xjXpf+C9kZ4HSJTHP3qTbVEg9dZmV6cOKPUc2pwQU551rWbh5RtiZ/X2qO0IitFeXtVZWzb6is+RXrhNTF5/gv1Ce8A2PGxjob9dZ0dg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742895974; c=relaxed/simple;
	bh=lJwd9RuzohyybOZuJcJO85WskvXGtLy1H+iADky9H0c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=e2Q0XS7WAj95nwayRv4waFFYZfjMRPcF8kdQ1S1TDktGqta1dVf+ty4aKxS5aHIMdhltUztjGXMkKLMqZxGEDD7jX3wI1bPunn1vIG0m4/SDkdP/M2mlr+lpv5JllC0huYbDIcbdKZPvDsENYgSGuUOpl29qDw62ZEfFv+Cf9m0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cM8AJS6S; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cM8AJS6S"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-abbd96bef64so904731066b.3
        for <linux-samsung-soc@vger.kernel.org>; Tue, 25 Mar 2025 02:46:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742895971; x=1743500771; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u6Fu6WaKV6UwFUaV1JRbU4BYRYqi9fvopRa8oATbj0Q=;
        b=cM8AJS6SIcApbWUlfjRAvQBOndqq8xy6NPu4i4FiOiFPAZrntpMTYYzROQsXt1/yMw
         OSTpsjr0qlg0raV6TDEnZiYLW+v9HG0H0X+CiSFFZLM4MnuVx+KL0hOG8VrwZgu32ay9
         zdW/X5ZqR0J92zhglj3Er1Dqezulz9Uwdu2cxw7lDtQ9xZXrHLfBpMbT8MVdnJbxi56t
         /fs4HGAyGCCgw3I6mbgZxiSiBU1aB2LFaBolzsklbt55Z2CL5n4P904FsY8LFLNlszyw
         nH3+Ow3y1zZbb45CclDDjoYUsYuCncwulhy1d890ivDXUlBvfIJag/FPVuQR149Fqwf1
         a7Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742895971; x=1743500771;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u6Fu6WaKV6UwFUaV1JRbU4BYRYqi9fvopRa8oATbj0Q=;
        b=uGHZQB97nsvuRnsyTroWqt6EmFBJR2PuYe+xuXJKgO8BmBDqJMSnBcZtv3TKtqRw7C
         apKbDK28jcwg1zYY2C71bSkjAmkZwhAMTtSvhIG4HMY0HFnDqrPwjK0FcCl03uPF+eRd
         bHxdjF/6zggYmQ8Vf5Fsjz13HNhf2g4h5mXgB+H8GwjR6Jd/p9YhINpy+gKZ69VkbJwf
         0hI2bQf0PTphY9gySQknBOi3M/QgK2yO1e73OG7LfUJ59YjIturBt/BF6pF+tBSbqdrD
         2AsqgIfsr5h433Xal/1Gsd/lUM3XVCrJR54wlxvg1J6+1601/CO5AU8hvEoCD1o33bU9
         vOww==
X-Forwarded-Encrypted: i=1; AJvYcCVJM3jqEFqdm8rDXaxPxHpdtHd29UP5Ym+h36A7pj83LJN4M++nlEpE29wz2wlV4Yw365TsDdlO4xGdDdP+/Mahwg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyddPWgCl3MUIszTR1xsfQPJWuakpAtpGiRbMcr+Jp8hERXsllE
	JS6G6zVp4kCWEUpUX74sCBhI2jegccwT2n9eDftbnxi9LVSyKfU3OsrlR4PxDz0=
X-Gm-Gg: ASbGncs2lSIiFa6JB3cP+yIPehp4ZYVOtCdZvIs1cF1xJ1d0vu0sZwWXhhBYKbeC0ck
	hwCe7+HnlxHies5p64GYz092Liba/5DsmPmX/Cp3tqrXhaEkh46+kmIptUlNnqmIz6Kgxt76lWl
	CdIeWHLsqP2hKhw7nGrKR7FvgCBx0Z0uG/9zNugnU/InGVqJdz5ymEaOthr17wWW44xxE0wt5Ku
	eg433lg1bBP/pq+KhrWz2dSOLVcz9OWvylEomHGBE8r3UTtDxeM7BqRtNO9BudzEVsNATrqMRYM
	F0bi5zztvKeSjYLJHld6Gl1jii6ulKwOJqMXc1d6/zfCIFsJ5gdPSISqamJeqz8nCUVOfENGr7p
	T3JnZQQ42uDeUAv0umXUBxqpKvdlS
X-Google-Smtp-Source: AGHT+IHJAkOOtBg6Ow48+caX8OWgjB0vQLeBKP45DnYtGc5Gk49AKHqQCTiXRKEbwQxhd5ygBBxnoQ==
X-Received: by 2002:a17:906:4795:b0:ac3:b372:6d10 with SMTP id a640c23a62f3a-ac3f2081eaamr1405346066b.4.1742895970561;
        Tue, 25 Mar 2025 02:46:10 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3ef8e509dsm832834566b.68.2025.03.25.02.46.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Mar 2025 02:46:10 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Tue, 25 Mar 2025 09:46:08 +0000
Subject: [PATCH v3 2/2] firmware: exynos-acpm: allow use during system
 shutdown
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250325-acpm-atomic-v3-2-c66aae7df925@linaro.org>
References: <20250325-acpm-atomic-v3-0-c66aae7df925@linaro.org>
In-Reply-To: <20250325-acpm-atomic-v3-0-c66aae7df925@linaro.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2

We need to access the PMIC during late system shutdown and at that time
we are not allowed to sleep anymore.

To make this case work, and since we can't detect this case in a
non-racy way, switch to using udelay() unconditionally, instead of
usleep_range().

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
v3:
* use udelay() unconditionally (Krzysztof)
* drop previous Rb tag

udelay(20) causes a checkpatch --strict warning (it suggests to use
usleep_range() instead for usec >= 10), but that's exactly what we can
not do.
Reducing the udelay to be smaller than 10 will generally cause the loop
to be iterated more than once, which I wanted to avoid.
I could reflow the code to hide the actual value from checkpatch, e.g.
with the help of a local variable if that is preferred to ignoring the
checkpatch warning.
---
 drivers/firmware/samsung/exynos-acpm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/firmware/samsung/exynos-acpm.c b/drivers/firmware/samsung/exynos-acpm.c
index 542eaff03f9e39422a8c5345ca75e05c1710a9ee..379da420b9eb3fcbca5461bec7e2de6bf0774659 100644
--- a/drivers/firmware/samsung/exynos-acpm.c
+++ b/drivers/firmware/samsung/exynos-acpm.c
@@ -300,7 +300,7 @@ static int acpm_dequeue_by_polling(struct acpm_chan *achan,
 			return 0;
 
 		/* Determined experimentally. */
-		usleep_range(20, 30);
+		udelay(20);
 	} while (ktime_before(ktime_get(), timeout));
 
 	dev_err(dev, "Timeout! ch:%u s:%u bitmap:%lx.\n",

-- 
2.49.0.395.g12beb8f557-goog

