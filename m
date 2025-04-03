Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 610562459DD
	for <linux-samsung-soc@vger.kernel.org>; Thu,  3 Apr 2025 08:59:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743670755; cv=none; b=bh/skqsJ/2hB/89DnAdcU2I+5lFq3yth2eJ8V+sUmCuTMHeLcOJdaI86pLuJyeNa9nJjxypuQnQyaEZW0P3cabqzMDtEDxuo/uvlmqVAcdltJS3WStxMmOklJe3ZHsEJLdQRad2laSbphaSlG+0RBUOAoGdbf2a1diFPOWFsuw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743670755; c=relaxed/simple;
	bh=l1zcOTqbAXM+6Af1i6qiSSUmTQ2DiJduP75aVq1nYPQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uM0tSClJNfjV9ex8PAW3B5vt7DMd6mNa6EnZMG/e0dHUivlsb+L1YvZUGyeOpfb8heSOexF5PowKhRh9qUb5xtFP4arEplZeU1MKqB61J5e2IARfk0jB52pvEUZ0PnwH3S00W4NjNuHWZs0lzGytDkX6AAQ1aCWf6xoOrmcE06E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Zup1W2ke; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Zup1W2ke"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-ac2bfcd2a70so88024766b.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 03 Apr 2025 01:59:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743670747; x=1744275547; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2UDpkJYTJ8+02Ga55OV2M/CiQAcpkegARGuSb5F8VZs=;
        b=Zup1W2keMOnRI00TDDGp9mzIxTwY5O5DJoUCbFSCkkuvmr2PJ10IN1u5wCZI/LZP48
         UErPPHbYO/NFzKIdomHCR+0WMJxAizOMefapfK9LnLRD3ZI+l4Y9VaRMUHUXG47P6gJX
         OXXMMSAXEZh/JPi1KQIQtgmXxowJnIQ8nznrnSMa9wdsnWyweOs7lh8F+H9+fQAAYvOl
         OY1ComBPd7d2ovpwHZWuxb/xQ2NP5owvqHI0JBvymSG2oSlhf1txnGdj5ROmr1Ie7mej
         0amnOK8Ut4NyC/igZJfAxS52hFp9Ge5BF1iFzdJp6SfM3pqr8vOk1Hbi7TBWNEMy5aU4
         Mwuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743670747; x=1744275547;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2UDpkJYTJ8+02Ga55OV2M/CiQAcpkegARGuSb5F8VZs=;
        b=tN3aUc2uQuNRQmNeM94mglBn7/48qKsuSUGKYREug3VcONJLEI32em1GzKgU9mBysS
         AY/fLvbhnr92vkrG8tVqp2xKUT+RIBvxRXAXdPX7DtBDWAqB7mxNNfnPJw52ROmT81YC
         /7mTPEnD/lOUNAlZAxUfyxLjnyThiukkh0Wr72LFfNNV+kBC7hL4w/olOzKt7Tcb9cmN
         /Et3hf6Z22qbLLCw3DZ+KTZ9brr+J+9HDdvCD5ftfTXi7IwDbS/eL1BhgWAkXpvAloQ7
         vigJOBi6LwnVMtz7k40VdawGiZ+2pzQB0Uhyifp74tZjjcGcewDFvR3g2F8l3jvX8Wxz
         HuoA==
X-Forwarded-Encrypted: i=1; AJvYcCX3+1zhOHGtVOft1s3GeNLHm3mAozEFfL4UY7mnvLF+lxbN6QFsv4YXD49O/9EfEzN+0TlAbHrQc1s5mRLcm++/Xg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9CKeDwZO5BNTqg2eaNttIIOH1MrNGEF54a4ogfHyO5YFGnPVF
	WlS/opH05xx+1VDRrluHhWBGwfjg7lrN9TiZaCjw8elGhGfol0VjBU0LnX7C4rI=
X-Gm-Gg: ASbGncviSCG0BqTcw+KNBGi3aD951X+NADXpeUsx6S22O2ww1mPHT4xcogroYCiW2o8
	2hh8hUKItQgzvS4MAqKvPXmYd8sA9rZCyJnlevPAkzYjo9OEf0eSmQWU8uwSWF9+wPOKZsKAQ/2
	uNiNnJMRq9b+MDYG8GOE/N4NIEnDc8yWqs2FrAOUARcX0kahBa4UW8jJf6mJ0c2z/M62YpEAVf8
	otPCXnltGLvlidsv/ZqNNtWesA6emDVDmu2ZcS6S71K6BWM8K59g46rr6/EA5InKiNPDzI5uFDv
	DSe1n8+oxjrjwPhhGpni6dk9FrsvxepPfKmkDeMKXK4MTzrnRjLfZOO1dKDCCwSdPdA/fkT55Xk
	eX4MxJD2OWf8q3zTl3y+OsBmAp3O6
X-Google-Smtp-Source: AGHT+IFNqZWOvo+Tv4vLHdGRFBjU8kF7IIgTkc+Bnj5l7bb5nmPkogO1xX8561qZ+CITxdN2Zb0Cyg==
X-Received: by 2002:a17:907:9710:b0:ac2:cf0b:b806 with SMTP id a640c23a62f3a-ac7bc26ec1cmr186829666b.56.1743670747337;
        Thu, 03 Apr 2025 01:59:07 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f0880a535fsm637614a12.80.2025.04.03.01.59.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 01:59:07 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 03 Apr 2025 09:59:03 +0100
Subject: [PATCH v3 11/32] mfd: sec: fix open parenthesis alignment
 (multiple)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250403-s2mpg10-v3-11-b542b3505e68@linaro.org>
References: <20250403-s2mpg10-v3-0-b542b3505e68@linaro.org>
In-Reply-To: <20250403-s2mpg10-v3-0-b542b3505e68@linaro.org>
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

checkpatch complains about unexpected alignment issues in this file -
update the code accordingly.

Signed-off-by: André Draszik <andre.draszik@linaro.org>

---
v2:
* make new alignment more readable (Krzysztof)
---
 drivers/mfd/sec-common.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/mfd/sec-common.c b/drivers/mfd/sec-common.c
index 782dec1956a5fd7bf0dbb2159f9d222ad3fea942..1a6f14dda825adeaeee1a677459c7399c144d553 100644
--- a/drivers/mfd/sec-common.c
+++ b/drivers/mfd/sec-common.c
@@ -149,9 +149,9 @@ sec_pmic_parse_dt_pdata(struct device *dev)
 		return ERR_PTR(-ENOMEM);
 
 	pd->manual_poweroff = of_property_read_bool(dev->of_node,
-						"samsung,s2mps11-acokb-ground");
+						    "samsung,s2mps11-acokb-ground");
 	pd->disable_wrstbi = of_property_read_bool(dev->of_node,
-						"samsung,s2mps11-wrstbi-ground");
+						   "samsung,s2mps11-wrstbi-ground");
 	return pd;
 }
 
@@ -264,8 +264,8 @@ void sec_pmic_shutdown(struct device *dev)
 		 * ignore the rest.
 		 */
 		dev_warn(sec_pmic->dev,
-			"Unsupported device %lu for manual power off\n",
-			sec_pmic->device_type);
+			 "Unsupported device %lu for manual power off\n",
+			 sec_pmic->device_type);
 		return;
 	}
 

-- 
2.49.0.472.ge94155a9ec-goog

