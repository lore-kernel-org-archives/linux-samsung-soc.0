Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3A7D1F03C3
	for <linux-samsung-soc@vger.kernel.org>; Sun, 23 Mar 2025 22:39:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742769592; cv=none; b=PhJzSvS2JYMTAyr5Mxpjp3VcHgtNFEoNFTePfDadWuvIVHvyVAxwwkgfTpbXz3ECB41tkYGZHLwHk2TWRxsMLaMUl2O4H7g/GcYT4d+wjrosK+OCYhjaS3rdZGDc2LvW7+icaro1VUqrrUsGIlJS7ldJYaolBTv6+Flgi5J0138=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742769592; c=relaxed/simple;
	bh=PIE3UA5RRPW78dm5St1dv8icSuMZdl9l2kQ0j44xOOk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Cx2gNz0uN2rZBj0xSYh70n7AP2g0PCcY8+mxu8V1RM3sHE3F92yu3IepMIxlPK94n7xfL217Xa8cTo6t2sPrqB3qXYsDb7HIKIIG+kPdCa20tYVFqjYWrkQy8e2hhFLelMcrmJuRT5jO6by/R162znZT7O4yLhIpM1815uFK4P4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zeR+DCHD; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zeR+DCHD"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-ac2963dc379so636679166b.2
        for <linux-samsung-soc@vger.kernel.org>; Sun, 23 Mar 2025 15:39:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742769584; x=1743374384; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jhTacnWIaHzojbgZVRhkXLoj0m8Qn0dJu2GgWCUO9Oo=;
        b=zeR+DCHDsDBIMpShQebkdtUXd40HXIHIzeIvW7Kd+RwPGGXp5/ug1FhtqNmdp0LjpT
         89inYhfOkztgyaHcOSyUKjD62uXumVJsbYEuhsodv65UAAcZWAaQWGQOn7O2EmSiTIly
         vYA1ccF21zyR1GxD68OogxS8Vw06JkrR5s5JVYQYxLftw0dwbbSuBFq5eWzOijVSfRoF
         8qT78qjhKymxXXtNqphz5NjHp0+5HjuPiZSz7jqp7obOiMYeyMDVZCsz5xXEmAnpj7AN
         82OwFGTRWWles4Sc2f3lL9q6w688lwkqMRA49Rg1+meWzd7qZ8CumTyXWx7ittyOKLnC
         SFiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742769584; x=1743374384;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jhTacnWIaHzojbgZVRhkXLoj0m8Qn0dJu2GgWCUO9Oo=;
        b=K/S934xCJXveFvnjaVoVIs4U9LdeBHXJsjzu081b24gtce+Pp1lNgqW64Doyr3a/h6
         Mf67At10tgpJvs7eK/FQ9bvg3sXVtbZXsNIPKDZIir+ZFaiHg1tn7c4i/DDEdvpT7Rxf
         Xpf0saysEQS0ZVL6XWjUbmicMVCjKteupUBEceUlWs8zEhoDpGktUljoajhaSLp9eXX4
         IujN0rBbcDEc6oathgRCzArqOyFD6v2IsDF0cdGJywKfo9QTMX174wI8017Y2WdoGVA6
         nXtNSit9eOoya2yV+PvbpG5B/9DgcNDuu8i+MSBVkrZMaalVniUeadECGqnEugdjTyIw
         XhJg==
X-Forwarded-Encrypted: i=1; AJvYcCVwHn4yhkZx4Ogd2W3KVNbpeYFxY0mkYZcWrmQgFHRTZDpRlxqW2zM/o3rnGxMZa/BoNm9F4BUHZumViIxZJho2ng==@vger.kernel.org
X-Gm-Message-State: AOJu0YyiHuiGX9YoQu1lqNLMY3uGICrk3u8m+nNST4Q6IrILn043DKrS
	7q9I+hO5GrFzgxZgxbNZxdumsc2Eogm+milVX4WSu18WiBFbVYWZTFWMOx8l5I0=
X-Gm-Gg: ASbGnctYgBU3qEBNd6yCrhD/p3JdNRBabeGIwuYC9oWzUL87q4s7SrHyF8oDjO7G0KV
	VS82lL7aL4RlTa2coD2mZmSjXbsVVcwX6HjUM67hgc5r70gPr/9/UBnTohWViC2NYdrlv+1EINk
	nTaBVQGcSyCv9hIRxgsFWI/s7NChOJIZEGmxpdB7KiuE88SBq8/G3axHbbQqC9JHk/xNwPRFxRj
	sRPn9A0OljrD5DtgCJ+l4ODiyRroeV0lWM0lig5i5kOgXiF1q5MjSiNLBwXSeH1NdyvtMc4DlcY
	/q3U1VmmrXC/bx3VX9YZ1Koxr+3U2e9ywWVPi2YlxwF/Oll8hXmBRiM/KP7s0Tcy0jGoTj0tBKg
	2gdxd28LwrdAM20J0Kka99Xf/bKPG
X-Google-Smtp-Source: AGHT+IGBmk43Q/5KSqStfiKdhkMzhnRppuC/FFtUW+Zjtoma50FlDv2NtShPafcq2wFC3LRoUhXzZg==
X-Received: by 2002:a17:907:d2dc:b0:ac3:a7bb:1c2f with SMTP id a640c23a62f3a-ac3f241b95emr1147181566b.7.1742769583868;
        Sun, 23 Mar 2025 15:39:43 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3ef86e44dsm559686666b.31.2025.03.23.15.39.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Mar 2025 15:39:43 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Sun, 23 Mar 2025 22:39:50 +0000
Subject: [PATCH 34/34] MAINTAINERS: add myself as reviewer for Samsung S2M
 MFD
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250323-s2mpg10-v1-34-d08943702707@linaro.org>
References: <20250323-s2mpg10-v1-0-d08943702707@linaro.org>
In-Reply-To: <20250323-s2mpg10-v1-0-d08943702707@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2

I'm working on a Samsung device which includes this MFD and would like
to be Cc'ed to further contributions and help on reviewing them. Add me
as reviewer.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index d686e02dc7ccd61e35173df997d2f894ee5ab515..10945909f5b317a894b6afbeb6bbccd1a691de9d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -21341,6 +21341,7 @@ F:	drivers/platform/x86/samsung-laptop.c
 
 SAMSUNG MULTIFUNCTION PMIC DEVICE DRIVERS
 M:	Krzysztof Kozlowski <krzk@kernel.org>
+R:	André Draszik <andre.draszik@linaro.org>
 L:	linux-kernel@vger.kernel.org
 L:	linux-samsung-soc@vger.kernel.org
 S:	Maintained

-- 
2.49.0.395.g12beb8f557-goog

