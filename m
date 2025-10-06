Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DD6D2DCF52
	for <linux-samsung-soc@vger.kernel.org>; Mon,  6 Oct 2025 16:43:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759769012; cv=none; b=tkVpM67RS//6RqBASRkQamjRJc5DtYfn6wdgLxGAszPo3bNevdWkHHuBQXEguwt3b/t+a1rqF0eF/aiKcyOkqrNaDDeNFdyVQXJnCwJb00JeMRiSU2LDYjFKkGZ1L/yV/AaiLF/WiQb53Wz84CfSg56PE7gT3Pg18n7iFn7sCWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759769012; c=relaxed/simple;
	bh=2BU3Or20eOW+8/DchoNoBhvg8meChDG58BOoaEtXI6k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mkvS8vjCM8xz1NDJpchg6QgXKsouBmfZZCJDunXrYkyUjJDrwcvFmEOYP67xejK6iz/IVsNVZ44yOs3WhUyeEIsxum9IQPm2DxH93+b/93/Uxjh03P/2c+ISX0XlGwbzxWDmfWftmKnc6RbjbgrphRR+LWj7jIQA4gO9YjNKmJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QJQfDCv+; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QJQfDCv+"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b48d8deaef9so715985666b.2
        for <linux-samsung-soc@vger.kernel.org>; Mon, 06 Oct 2025 09:43:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759769009; x=1760373809; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZygAzCt4BgJHIzlNAdvVKPmowO3lR1rw3aDJhpq+oRQ=;
        b=QJQfDCv+zXuT7IVL9dr3s2AkwfHatRt23ZMYisoiNIvHAiXkPO+WkMHAk4M7VJW2Xy
         mjcrX7iLoQQZE6C9pLdFl9S9d/ZPCd+t6qEkWVE/KQIuWIfFvX2Jv0Gsctl8uinvyjp/
         QXBCvyqIBXglir0NtOyROSO+uz+4cjy0PwYxc86cHuIVAMsBWbpeRJj+cDXyJjF4YjJx
         Vg/c0dtwwNuzZsQobqqPrKwaWXzm/fybtpzhOJXvgDoJ8p6DErC4YHkK3g/hyXzpc1WD
         G+TQ6lYVhkGE5yyMfVWrCN8fNtQps+8kF3hW5V76FO0aGOlz/wnSyu7rqYZ/9r2xvg8J
         F+7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759769009; x=1760373809;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZygAzCt4BgJHIzlNAdvVKPmowO3lR1rw3aDJhpq+oRQ=;
        b=KDAQPjQ7nuoP4ouYywuu1NJ6jO5WSw3bJlXWPQdUc3xs7sa6r0/dELYO9JZ1OHwzkz
         CW9Y44n97FnxMOTU4zn1x9blWX3jECqJt8DIuu+D59RAkBVTUU9zzVXEAGDy1Q6sIS9T
         GRs0Y+mOTXE/rNfihbxo+mpqKhIRFxBtE/s8zTP7rsssd2mwdGT5HsYGMTWzpOHA1d6v
         KzsFVbZoCkbymZoHydXATtal8Sq1ZJE7MZVgZ6bLV5lNquDBYDOkB6I0GGISD//TIBs1
         PRSiH9FroTxVCTSkMOQiy2g06MBSecs089vuLl58kuOYNnQyjNSS5RBBqF2ruDOIWlnc
         oNQw==
X-Forwarded-Encrypted: i=1; AJvYcCUK0sILh4WVNY2JAZddrftKJoo1B/X3W8tCADyJTgXIPI/iUe0I6w4viL12j8rcjO0G73KgfTcpJVB5BXjWvPRH3w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxy7Zht0wsdu1VOB0gR73uIGdk+RIpTDkKc61GESd7BMbrBZ03Q
	gfsHvoCY17AT9Xd40rvRUHgIMC7U2gyFtZD/xdL3gyMe5wuO9s2j06Z1+ANBYFlT9E4=
X-Gm-Gg: ASbGncvy+Gr9MMsiiWlQBD8+orB7x+lKdv95GPoFN3AEREBsIohS/YzJzBu+XtnW0YD
	9C4vffjWAE8g17AP2S7g9LNtRg2vzNHHa5vNNE/z6l6zfF7R/QGLPpNF+9jt2J36JFzUV0RmZsG
	swuhifkCD+9ezI9qfc2bEocDn5iTDXt9a2HRIMk8lARgcJykJquAcCj2NSQtfi9Ev3DG+SbY8Gb
	/wydzr2L8eSMFnFfnd4dv5aWYqCRbyuiW7L9q54BX+1RJ/sjiu64QeJvNWhtrmcshYBD/2H5AV2
	8DNAy9llzL4UklK3veJJyWOa/IeWyyDI5TdoV1ysgnA+/Pj7kT0dZNKUifUqjilwQ5d2R1jWLO+
	jKf5luI/ICvwLuT/nrBii8JgGqOw7nSzjlqj1QT/G7DrvGBjNWd0s5QfRomusJiLcoYc5hz+Np6
	yyckbDGYWLzZ9FkDdsRqDFgeMD9vNrZI7M4Efb9LrsD+75LSL5wSY=
X-Google-Smtp-Source: AGHT+IFKZW5wiQTkUSviOMSQIOsmLTTkBC5m6wYT7o0NG+U9VIzLggcGukVJvrDeFkRocqCcAImACQ==
X-Received: by 2002:a17:907:1b26:b0:b45:1063:fb62 with SMTP id a640c23a62f3a-b49c1d60b06mr1448559466b.24.1759769008797;
        Mon, 06 Oct 2025 09:43:28 -0700 (PDT)
Received: from puffmais2.c.googlers.com (224.138.204.35.bc.googleusercontent.com. [35.204.138.224])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b48652aa01esm1193841866b.2.2025.10.06.09.43.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Oct 2025 09:43:28 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Mon, 06 Oct 2025 17:43:27 +0100
Subject: [PATCH 01/10] dt-bindings: power: samsung: add google,gs101-pd
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251006-gs101-pd-v1-1-f0cb0c01ea7b@linaro.org>
References: <20251006-gs101-pd-v1-0-f0cb0c01ea7b@linaro.org>
In-Reply-To: <20251006-gs101-pd-v1-0-f0cb0c01ea7b@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Ulf Hansson <ulf.hansson@linaro.org>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2

Add support for the Google gs101 version of the Exynos power domains. A
new compatible is needed because register fields have changed.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 Documentation/devicetree/bindings/power/pd-samsung.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/power/pd-samsung.yaml b/Documentation/devicetree/bindings/power/pd-samsung.yaml
index 9c2c51133457112ca0098c043e123f0a02fa1291..c35c9cb0115d79e5c36142da2c2a5dd30cd2ad47 100644
--- a/Documentation/devicetree/bindings/power/pd-samsung.yaml
+++ b/Documentation/devicetree/bindings/power/pd-samsung.yaml
@@ -19,6 +19,7 @@ allOf:
 properties:
   compatible:
     enum:
+      - google,gs101-pd
       - samsung,exynos4210-pd
       - samsung,exynos5433-pd
 

-- 
2.51.0.618.g983fd99d29-goog

