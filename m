Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EB051A314B
	for <linux-samsung-soc@vger.kernel.org>; Fri, 28 Mar 2025 13:30:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743168662; cv=none; b=c4BQ6zxOW9ebuXbzOVcPY9vB2Z0wnae+2LIOUn8TVmsH7Qi9fy7+xsHhlqFPOhIFy4b1oLKghi19nq2b3b2h+I7lRN6ylIPGTnVKeXj5VrpddzIVOY3VaOeRVrNEI78uPCrMJ8fT1k29Fc98gXbiHxYCxf/f6IDFbYM0gok6p/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743168662; c=relaxed/simple;
	bh=rtY22MgptB+tLy3QVxclIgluL35Op8OhX0cRjsl/mJo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mSMB06OE+aR8HHhTig8AErmL67t/mGokEg3/QSrTsKymINTwRFN3hGUzUHrcQ+ZXmiTcxWi73wVrMe7O5bUnULCQ1BmtbYUnekMoqA5d1RmyG8cnZYlwwaUCNB/l4EIcKTE1AdZ2+sTWkCdbh4COUGUUfWC5oQzJzHEmczWNPek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=udZ7EYqk; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="udZ7EYqk"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5e66407963fso4149338a12.2
        for <linux-samsung-soc@vger.kernel.org>; Fri, 28 Mar 2025 06:30:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743168656; x=1743773456; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eMxQ7UQKMt0+Oaxy9pEE80XpNTXV7CL+WPCOZ4uzjjQ=;
        b=udZ7EYqkiqCuXbSiRXCMBZmiDe3QWEWva5a3Tl21XVIONFFX3Ga/CUAOfR4oJNO7Fa
         7wvSQQEP23kKdZ+CiLQncc0Gfz7pFq5bpayn9fMgltnzJutksKItUmRbte5hGgJcLA42
         JP/Jp4ERedHbLVmXjXBUgKWzIDu3LWlVxfJnaKxhNrwn/2Lyiu3my9hjnXrkNawzJVrs
         AbT2qJ59MzOKV/fKVGYE6k9fnCN1Om0tsjVSXQcGff3YJS/oU/8brGL1vuPFAx/hQm0i
         b6BKdcme94J24CtPFbz2DioFe4X0kmvZyfxH7HbhsRvhNXAE7RK/Tnar73n0lyB1L2+h
         q1sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743168656; x=1743773456;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eMxQ7UQKMt0+Oaxy9pEE80XpNTXV7CL+WPCOZ4uzjjQ=;
        b=VgOYropZcivHvx/ewAoYB53pIZlO0iwFyQ2stCEFLbL7xyqfHKFMmbUgAnpHXaCZsb
         HpTleRYtsV6DhduA/jjVs2bgJGeTEJ+IYVCA2VqeFVibxo1qoUq+GgTdps9PMjyC6pIn
         WzLv6W6IGi56aV0MJyQ30EIIqezd8gg02QN1lAjGs/fq4jYVXOZ08nAC0I07jjgQmeIn
         /m//p+ZgY3PGrQOLyFZoZrIB0YIDXysGqLo+qveOtrrW45eRxLoVEE3Mt2bITGyvC05b
         3u6GdH1UUQApfIXBPVd92MHQWFjarHSkaCgNpcnNhJwTR37HPUhfptFsrKoCjN3S6CJY
         iulw==
X-Forwarded-Encrypted: i=1; AJvYcCXUZDvg3r3Wua89x8XTrCEtUhi8+RNHBBn1ZhaP0l7gw1xhNSGQVegi2KTjYcS786nOtVNeuYiihtodi2lcCzlluw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxK9HJEciF6ii4ebHFiLRLZTJrJwPIO/NkP9+QzlSxFUuKpPHJ7
	2nUECmSYsfns+aabxb82M2XYyWvroFBJOncB/kWvUWA0FTD3XW6gks9t2hWlTFQ=
X-Gm-Gg: ASbGncuxvCW5QyDoJNNx226LEMSsLjSPK0ijv8antqqISfgJDDF1eVnUjkRQO0ycgl5
	7/ec5yRqCtwVAPhzQwiNGmQB/GbneVs7g5csCVCTOoLBPdfOvayKrkOZt4nTlR8DhdjIHKJZBDs
	e8n5h6zibE1RuaDBSBggWFemHDeQbj6u6IN/bgsK8INKy0+Ba8ycPzgzUb/OE9rLdYxdkg76a98
	ewFX+i5y2DX6gAPckneP61s5+t+EA50nhVAOlo+gfmkjKjJw6sJczEuDGqxeGDYw5FWCFqO/3I4
	R7ZmXlP7U7hIyI/3rS1vo8ThDO9zRUTNdGigNZp3jBY0RDg0MtXARncLfN7sXrMTowJgtFp1D5M
	t8hBtmngbJ9mbHCBY3Kok3saE1mLaKXJtVCU18+E=
X-Google-Smtp-Source: AGHT+IH35FaKYo+gSI6anwiHIjdD3ef6MXj/ihpM/TgWINmZ8ShobAVb92+tkqSJyQ+wsMpl6rBS1A==
X-Received: by 2002:a05:6402:51ca:b0:5e0:82a0:50ab with SMTP id 4fb4d7f45d1cf-5ed8f9027ffmr7884197a12.27.1743168655554;
        Fri, 28 Mar 2025 06:30:55 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5edc17e01f7sm1355284a12.79.2025.03.28.06.30.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Mar 2025 06:30:55 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 28 Mar 2025 13:28:50 +0000
Subject: [PATCH v2 04/32] mfd: sec: drop non-existing forward declarations
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250328-s2mpg10-v2-4-b54dee33fb6b@linaro.org>
References: <20250328-s2mpg10-v2-0-b54dee33fb6b@linaro.org>
In-Reply-To: <20250328-s2mpg10-v2-0-b54dee33fb6b@linaro.org>
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
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2

sec_irq_resume() was removed in commit 6445b84abf91 ("mfd: Add s2mps11
irq driver") and sec_irq_exit() in commit 3dc6f4aaafbe ("mfd: sec: Use
devm_mfd_add_devices and devm_regmap_add_irq_chip") while the
prototypes were left. They should be removed.

Do so.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 include/linux/mfd/samsung/core.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/include/linux/mfd/samsung/core.h b/include/linux/mfd/samsung/core.h
index f35314458fd22e43fa13034439406bea17a155c9..b7008b50392ab857751b89e0a05d2c27f6306906 100644
--- a/include/linux/mfd/samsung/core.h
+++ b/include/linux/mfd/samsung/core.h
@@ -72,8 +72,6 @@ struct sec_pmic_dev {
 };
 
 int sec_irq_init(struct sec_pmic_dev *sec_pmic);
-void sec_irq_exit(struct sec_pmic_dev *sec_pmic);
-int sec_irq_resume(struct sec_pmic_dev *sec_pmic);
 
 struct sec_platform_data {
 	struct sec_regulator_data	*regulators;

-- 
2.49.0.472.ge94155a9ec-goog

