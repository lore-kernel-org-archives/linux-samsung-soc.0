Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB7C54C8F
	for <linux-samsung-soc@vger.kernel.org>; Tue, 18 Jun 2024 00:37:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718671071; cv=none; b=bnyE9zBTOwIUCOSO1HXkIqPUMJIBY/3qAaGAycFjwfSxOJNP4UInL7JUMDvu67ka20rSiEFoH7Y/GwGWNAxJXxecKyqY25IO2V0Zf6fQ2gA3c4YDoaGb828V6bqqOyTbPKYiBZN2+xju33oj4w8a64878umP2Ni0wbkb098maPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718671071; c=relaxed/simple;
	bh=Hvedb86I9a8BBqTvsputX1R5bqo1eQlMeauBsu3wu2E=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ZEroa2Yeoebo0oyxmBjFz7lAT0LE0vl0DKANUPNfoH9qgsola2g2G33qqey3/M8yjqWXILtujCtqFYSEcGTkj+0VMk5mBLf5XVMnciC4bUX0VKi+r6fesQUKM1LY4iFeZYR6H3UXML7zSGho7N8Ue/OF9c534wmXB1TwAEvX2j8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LmFsQD2I; arc=none smtp.client-ip=209.85.210.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LmFsQD2I"
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-6f361af4cb6so1486089a34.3
        for <linux-samsung-soc@vger.kernel.org>; Mon, 17 Jun 2024 17:37:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718671068; x=1719275868; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cJM+FjwIt8Vsqi9DQbiY4E0tjpC6f+V3n620JM6N4W4=;
        b=LmFsQD2Invf78Dc5T6F0FvvEXN7h/hoebIyiDd0WL59W0TiXbLQRXF3cOs5OwYKbGI
         XrpeUxQYJU13IsSJujiRYQd9bhKCdXk1TA72yCSpyGU/t8jxkMlvHfRWhEuD3PXi+KnQ
         BjOHtqe5zpc7dFwqgRqHGfUKwmJZ6daxw5nJ2A5PmvdaV4mJskUMkMuenfBIQxBFqbZN
         tY20xeqQZQAKaKHqgTavTPRthhOSm3OoTaKjv8jCb6sxdhBUObajg1ImquwmIkLeyLbW
         PUddStxaoeDk6VuC1b3AOxoFhNYRz3TM7MbjLjqzoZuKIjtYoVawTruHp1GQTnnfg9TP
         7PlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718671068; x=1719275868;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cJM+FjwIt8Vsqi9DQbiY4E0tjpC6f+V3n620JM6N4W4=;
        b=c3WIzfzOTNJQ0btcLPmdy3T5gxNVWvp5ybnzs7fnato1zq5XST8s1z3Z/IJG320Oze
         ONM291FGJEsW9r+7Xu6fYknVlrDLJeZMzddTERaEPNYF3O+iuUPUCIk+18ZdD7OmBma1
         G/htTuIYC0TLEyew+/IQQsI7/ySiLuS18JqTC68leB7ElaA+PwsTOYbYT40vQeY5bz4G
         VwoiQ8l/qxj7xwn866BXt1RF+ce5QX5x6CrxJkhlxupDZtm2ENimqomXdWO8mARKrIVJ
         6lXW0L8yjK7A1h9exZpHJ3vKUQZk3znB3nP+Lhz0MUzuTdTW52uF20fQCWQZXQ+AI5hE
         K78A==
X-Forwarded-Encrypted: i=1; AJvYcCWnAsOs113b8wDqsu42w/GaRbTswTwqzazWOM16Z1BWw2whCdwUqoSXLiK//x+/yrr+hOLu43/ERyf/U9sf8SWOi97hNiuIZDFStm6MT1jq4eg=
X-Gm-Message-State: AOJu0Yx/hfvPtpTE4P+mNbTMQJ2tm12zzGErIbL6lx0L5VSYnwI+nawM
	C7/T/TroYQpp3F9BOENOkxmWlgth7TRVU25ElnCkR3BLB3qfhNmrvMSzjN33VOo=
X-Google-Smtp-Source: AGHT+IHmWqNe1qFCpia0kcsa+KwsVizvSzvqatZv/DcZrfeCuQFKkxSB7UvgdM255Z2koLHPoO/haQ==
X-Received: by 2002:a9d:758c:0:b0:6f9:6786:485d with SMTP id 46e09a7af769-6fb93b1ef3cmr12795074a34.37.1718671067847;
        Mon, 17 Jun 2024 17:37:47 -0700 (PDT)
Received: from localhost ([136.62.192.75])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-5bd5e0874b7sm1324092eaf.14.2024.06.17.17.37.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jun 2024 17:37:47 -0700 (PDT)
From: Sam Protsenko <semen.protsenko@linaro.org>
To: =?UTF-8?q?=C5=81ukasz=20Stelmach?= <l.stelmach@samsung.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Olivia Mackall <olivia@selenic.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	linux-samsung-soc@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 6/7] hwrng: exynos: Enable Exynos850 support
Date: Mon, 17 Jun 2024 19:37:42 -0500
Message-Id: <20240618003743.2975-7-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240618003743.2975-1-semen.protsenko@linaro.org>
References: <20240618003743.2975-1-semen.protsenko@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add Exynos850 compatible and its driver data. It's only possible to
access TRNG block via SMC calls in Exynos850, so specify that fact using
QUIRK_SMC in the driver data.

Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
---
 drivers/char/hw_random/exynos-trng.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/char/hw_random/exynos-trng.c b/drivers/char/hw_random/exynos-trng.c
index 98b7a8ebb909..3368a08df9ce 100644
--- a/drivers/char/hw_random/exynos-trng.c
+++ b/drivers/char/hw_random/exynos-trng.c
@@ -333,6 +333,9 @@ static DEFINE_SIMPLE_DEV_PM_OPS(exynos_trng_pm_ops, exynos_trng_suspend,
 static const struct of_device_id exynos_trng_dt_match[] = {
 	{
 		.compatible = "samsung,exynos5250-trng",
+	}, {
+		.compatible = "samsung,exynos850-trng",
+		.data = (void *)QUIRK_SMC,
 	},
 	{ },
 };
-- 
2.39.2

