Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3B5C3314BB
	for <linux-samsung-soc@vger.kernel.org>; Mon, 22 Dec 2025 16:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766421038; cv=none; b=pvRbiThRsEtt42RwjsSsBoWxMd5mq3ovpCaznahWVRXxwqCDAJYJGF6vf4DAnhh4xjfI/0yiRwBuAkh5WSX1G/NtB6DC6niLHgPrFBx0Y+YPScH/tC0O+m2rIsCkeu/SL9oZkIk/gFmhxOAuwupBK+MxcdWf1nfrtUDN/wj+a6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766421038; c=relaxed/simple;
	bh=6z9CUWcsp9GVIL5C3R1I8VF/DTTGwdHlesVb1AdIEnI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rbYA+MUVxPJbcpV8+VwJ7x2atH59ph4kxwJr+EEhkAnllKZ8aMjYfKs0Dw8BELDHCt2Dh6dWTqCjW7FcPSorAYsiClxHH6tolPqDEGfmscc4IFx0w3jrp2j5dl+6axc5Jv4dvtChwYI1d+9zojrSuVRRhjetIx6R3ceugAa0N4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uQGJXvVe; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uQGJXvVe"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4779ce2a624so31235145e9.2
        for <linux-samsung-soc@vger.kernel.org>; Mon, 22 Dec 2025 08:30:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1766421035; x=1767025835; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LXXaYxB4OKZhMx1Cgr83/lDAFT6ZmYFvI5JvjRgVink=;
        b=uQGJXvVe7tDWizKBI8nIMFzGNYKhmsaX1bHuaY7QnUGbCSIzHUZECpcoyq3/AJsBh+
         0IF4gKvANyuLFqcDtZIlH01MxHIgxAp9b2g88r9cmd4RbU1NmQZpKvYDqJBjdgkj3vON
         X04FEW6x9SCio4IDZA1yt5dl+vQwmwk354M4JR27gcpQuBD3udKX3pBvR7sBAmZ9E1+G
         ZQ3Kgo9XgBu2YvVW1pLFYesB27IyE6X+eNgqd3pHuqJMlpGHSb5EWP35lkqm3I+oFKeB
         youSK3Nw6uXu5hux3Ot4xz6mtQhDZebk1tKeu0D1eATdnHKMPS8VWnmGYj/yjQnEROQA
         NSKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766421035; x=1767025835;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LXXaYxB4OKZhMx1Cgr83/lDAFT6ZmYFvI5JvjRgVink=;
        b=wCLRvTWXoMCzTXq+GTjU+6DXzbsyJMRSVkESldFK5FD4TPR1RZhivTthCRG6KkUnHd
         ywBwCX5NHSgd3q1uJcUBrn58de9u2ut9v846N/xIQGqB6W2nlCW73x0km5wNJcj1j+xl
         /ymg7T2f6FG7vVebWMAGXF6jJg0r5EUgMNawea3VgGu2S+MFaQqfAuXTkG+7r3LmPS4m
         rpxzuQJBpffrVtRn4UmSulE0gc0layAYMMjNQoScaMWYJZA3NsLfvFcY5M4oz1fn90hM
         cO3WDzkCKbcq9hdyjZxAyZxNyXCkevUbwlrvHK9aeWrWDUDbB4Ru+rIvSqnJfKWOMfkM
         CgaA==
X-Forwarded-Encrypted: i=1; AJvYcCXriv/i30AwQfIOZIxXaXMKelEp0kAoxEouFhalK+21T+FBwib3vYT8mdqCxN349hU6PYwFZZPkwKkjwCUsVQeFKA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxYjm2R3t+M9qLwTFttTyoh6n/DJ/RokhaQJdIgC11IkTQUt1Zo
	D0KMTJh9i5+FDnAYJJGyLsi2H6VSvlthzjJCQO+VdhQHenoWOWz9hYayKl9R3oDvzC0G7NT+UDX
	vtbL161Rg1w==
X-Gm-Gg: AY/fxX7apc1PZWmfvrpWp/43mT+IWbivmzd4cafH9D7bNKkgKAMycMLSGr4CYHbcYWg
	ReUEKz75xFLDUHJDrz1EG2BX2iEqgPXGTIrxVgWiwzOLBb3J/li6rY7jURO0WIAY9mSsH2IL8Om
	2K6HkJNiQGwZfHz5Ml3MR9cvKqithJljm+ogsAlwfYvQwCQ/Sxu5TeuWvbEe88J6iggHXUOrL6d
	SG97kXclOZqYsO4u6NzbLvlpOAD/CXR5qqFaoiEAiVRL4uX5MrEnphosYqCgvQmkvNPPxt5yxok
	Ksa4cAPdvnsWiWs7OcpC7aYaTCJ0xUHzOjIBz98QZz2bxpmCmLtQrlg0gBTFLEaWDTd26Zihryz
	oH/Iwhc99vwhHQjBW1nIKRGrxntrCEIoD8510TqcgEzRO5OCEPjLGlFqvN0ib45MnMDEsRclUs0
	C7M9LMD+nHSxnPBHQwMcebRp61HPBZesjujM1iDj0ewoqxWmhyJLtHwjhLoTEmSrFM
X-Google-Smtp-Source: AGHT+IHa18+n1INgxxNo+jf340UUAvjPm3Dl1qgbTOuYp1h5ebszYQYHTtgf1QwtGS2Gv5CnCqOd0A==
X-Received: by 2002:a05:600c:4710:b0:477:54cd:200e with SMTP id 5b1f17b1804b1-47d1c6298f7mr113410625e9.1.1766421035039;
        Mon, 22 Dec 2025 08:30:35 -0800 (PST)
Received: from ta2.c.googlers.com (62.221.76.34.bc.googleusercontent.com. [34.76.221.62])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324eaa4749sm23071258f8f.37.2025.12.22.08.30.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 08:30:34 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Mon, 22 Dec 2025 16:30:07 +0000
Subject: [PATCH v4 3/5] soc: samsung: exynos-chipid: downgrade dev_info to
 dev_dbg for soc info
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251222-gs101-chipid-v4-3-aa8e20ce7bb3@linaro.org>
References: <20251222-gs101-chipid-v4-0-aa8e20ce7bb3@linaro.org>
In-Reply-To: <20251222-gs101-chipid-v4-0-aa8e20ce7bb3@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Srinivas Kandagatla <srini@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, semen.protsenko@linaro.org, 
 willmcvicker@google.com, kernel-team@android.com, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766421032; l=1069;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=6z9CUWcsp9GVIL5C3R1I8VF/DTTGwdHlesVb1AdIEnI=;
 b=Bom7RtVo7DVIXc9G1f8o8cMGq6lBwLRC5DuHeb6AVEZqt1vgEnNM+UnyOKQPFoJiTN8ReY/47
 QJ5u61AajSJC0O2yc+yCafQBUBGxK+5ktnIuamalzQ+eLDgO2ZE/HVd
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=

The SoC information is exposed to userspace using the standard soc
interface. Downgrade to dev_dbg to stop polluting the console log.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
Reviewed-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/soc/samsung/exynos-chipid.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/samsung/exynos-chipid.c b/drivers/soc/samsung/exynos-chipid.c
index 88d264ef1b8835e15f774ff5a31f5b3de20f74ea..5c8660374269c87ec38ebca242918bd7b1d362e5 100644
--- a/drivers/soc/samsung/exynos-chipid.c
+++ b/drivers/soc/samsung/exynos-chipid.c
@@ -170,8 +170,8 @@ static int exynos_chipid_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	dev_info(dev, "Exynos: CPU[%s] PRO_ID[0x%x] REV[0x%x] Detected\n",
-		 soc_dev_attr->soc_id, soc_info.product_id, soc_info.revision);
+	dev_dbg(dev, "Exynos: CPU[%s] PRO_ID[0x%x] REV[0x%x] Detected\n",
+		soc_dev_attr->soc_id, soc_info.product_id, soc_info.revision);
 
 	return 0;
 }

-- 
2.52.0.322.g1dd061c0dc-goog

