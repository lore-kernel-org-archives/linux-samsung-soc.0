Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69AA5256C9F
	for <linux-samsung-soc@vger.kernel.org>; Sun, 31 Aug 2025 10:58:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756637934; cv=none; b=uLPjlnvpdSWEzn6IzM4W3SLbVLwN3MEXgJiEE0tQdc/DTAvvUHIeYop/pni9ehGh1eKw2BWGiN4neDxuQTWWmWlMkD5FKGEU+rk4UQHb7x/68au6I8mphdNypksys9omKOVZ3g0xtbz3uPSY4chUmB/SItWzx4AN4nJyq/5CZMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756637934; c=relaxed/simple;
	bh=WVIesh8/RBO7fqb/F+aCLBcMtMA9LcfeCRq+222xUIc=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Tc+LqB7YK3H4yW8zXw8u37K0LTFvfL3dN1CrXK40dW4RedR/MiUZA4+Z9/dGUpujL24jWspOZsJqjOsTjF2ntR54NRNXE7unWxL76wdDM3UOpPUXnLkj9WjB0kSZrjw+os0HCXxc15McZa85OA5T8+NWpD87Xntwvs5nG6Ci0tQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Gstl4kKN; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Gstl4kKN"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b041b155a6dso1416966b.0
        for <linux-samsung-soc@vger.kernel.org>; Sun, 31 Aug 2025 03:58:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756637931; x=1757242731; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w3zy+4FxM6e/ZYJU6tdKRgGniGSW0dORiZkBYaBYdq4=;
        b=Gstl4kKNr1k2/CoNvVwMBDUgJaKJI7OdDt5JO+aBfCazoJEHMvMwgH6eh0DuAWW73n
         WirdSYdOIcCmUyzuxB2h0ZQ8ljC70jiyUZo5fG5Y1cDoTfrytPhmP7BUQ3EoeYw25XsQ
         xWSBw6RxxMbCGwsYMraFUnQIWxrGLcMBTUXl5j/2+JBDYkkftD2QJAURIsHa6NYtmFZs
         qlkAsbZrC/HvrnGPscZYCsa7/r1pD396RTKhoulstVuUobdQQMAQ0YM6a4z7M24bcU71
         85LA+8kNv3xADoDUSf37bc2dqzqLkMxqa0fDT8yixNXm9mde5YuzyocbpS67bnxpUhME
         gOjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756637931; x=1757242731;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w3zy+4FxM6e/ZYJU6tdKRgGniGSW0dORiZkBYaBYdq4=;
        b=WWrBKKZvOo9qv2Y7MGyC7kvjciO1zi8i1nOBmEcmqktAIiy8QSEubjQyXmqr4aKAit
         ys8+AsyYoxcr38bmDd4jvFoMjwUK8JrRKmIU4gQeo5mje6/HiAQwQiFk/aKrt+9ZLh8N
         bvnJFj60KHhCCjql7O3i4XVd/1Aw1HvZ8ZLjs9UUOKSPg3F5wBaQTgZ+9ymN2TEwOFcx
         NrFuP9a+VSWIasT90OTZ0+reQjqiol1w68FrBZSWgj3RCo4NRVVo4e9//+twZFbSvADO
         sF/4dUqqnAA7R4jkjWvpBUoeTR6jCPCGUs3NSLlWb0zFz+PTxhgbEx3NO97dNc0me2+8
         MPRQ==
X-Forwarded-Encrypted: i=1; AJvYcCVj7sChfumRGt8cbCoU0GFqO92ib8NX3a9vp3CglSxrJlkd/qSoDSvDZ3cNB+J6O0CSEJp89Ua6IZRZeRwu/E+eag==@vger.kernel.org
X-Gm-Message-State: AOJu0YxsXXC7mVrosTamX5rKtEuE7t7+e/cTCyPDWy3NYe5yTq/j2yJZ
	eiIXfMXzTYPt8VosUWG8VuDhL2q/+RiUTu6LlE57sFdULvb4CnYjpGXb5YtALtms4aQ=
X-Gm-Gg: ASbGnctPrlbInQwfeFi2jZBiyPqifsN+WsY4W8+Y64ZOuf35SN7JZ2gIbfSPfM65PaJ
	3NwfCAxmDVwqjSq2sWMz5xpokUnhNOtrMmcL0t0eQGww6/8JlSb5FCiOJbQlaISuZka+i6iozez
	2a9y2MR+qKThwf7peibuFir6TsxwMgfHqQr879zITCS3xDWDw0bqWTp9xIrn2DPKPO+yUf7OXXX
	cVd8WoeSWuWJ3uHWX1AzpkEcoQ3Okjc8EQzxldDR/YBynEFK/yK4m6cdufEeQ0gexSgRqDE+Pd1
	5T+iKWoGrYsN45MDh19847CRjqyRtpq2ruYN1rkO+A03YElQf/f5i7ddCj8EnIBZV3T2hhw4OFW
	B7o/+TbfMVVYlUpN982Gil4XJf/V2OhImkS2SA8OMxh96ryhAcQ==
X-Google-Smtp-Source: AGHT+IHTBJiyshvnvgCsLBk30RyM3YNR2Y8KXQJ7s2S5taB2fYhC2gtwsyGjCqiwFtwHqMDToZZ4hw==
X-Received: by 2002:a17:906:c152:b0:afe:c2e7:3707 with SMTP id a640c23a62f3a-aff0ee1afcemr349633566b.4.1756637930739;
        Sun, 31 Aug 2025 03:58:50 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b017e4b9ed7sm349176466b.90.2025.08.31.03.58.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Aug 2025 03:58:50 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250830093918.24619-2-krzysztof.kozlowski@linaro.org>
References: <20250830093918.24619-2-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v2] arm64: dts: exynos2200: Add default GIC address
 cells
Message-Id: <175663792937.36292.10292837875011385286.b4-ty@linaro.org>
Date: Sun, 31 Aug 2025 12:58:49 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Sat, 30 Aug 2025 11:39:19 +0200, Krzysztof Kozlowski wrote:
> Add missing address-cells 0 to GIC interrupt node.  Value '0' is correct
> because GIC interrupt controller does not have children.
> 
> 

Applied, thanks!

[1/1] arm64: dts: exynos2200: Add default GIC address cells
      https://git.kernel.org/krzk/linux/c/59abe5c87267f1f3bd627af20355b490b59f9901

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

