Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDE232D24A7
	for <linux-samsung-soc@vger.kernel.org>; Wed,  5 Nov 2025 07:25:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762327529; cv=none; b=EVR3bHuNHJJtRWUnUnxjU0ts3b1/pdQR3QyUdabD9vrJm8EkpJmF9oDf1lSApXw4JH4PglXj4RFEAHZNzeXZAOM5Vix7T2MPqdggEle8p8mSI93K+mddTJamE+I170v9z6CPAQ6PjAVPDaawCZjE5+6sVesMTMp/frs441c/Rqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762327529; c=relaxed/simple;
	bh=3MQHnfbexcJms+PA/tw+OrIpFP88dlcCh/W8jqhAOro=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=McTOk+kyic/vQ+yXMpftL7+sHC7qzCyAM0rH1CU4tfonLRKxeh5hkHPR+4aVaN11714K0a+iJT53z4lcmuEqyGo4FU3tbJlIxq2AUYPbuP1WB9G3v6uX+6cSMevUUQDGZpWw8I9esJamRg4+QFC6qXZ2FWFNSzt05/IGjR5CFJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iNL7Fy1O; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iNL7Fy1O"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b7128683174so36466166b.2
        for <linux-samsung-soc@vger.kernel.org>; Tue, 04 Nov 2025 23:25:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762327525; x=1762932325; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FzyJ0fh/wAbVru2AIw9Z/iVWtj/2W/vCo97JCS7BrIo=;
        b=iNL7Fy1OY0+Dx9QAPDnlVHJl+cc3sXENxyOY6qqsxmiOI8/KIGCsHnlZ11mGvzdL4i
         udBuAtRhfrVU8IXZifgZKGC4r7TUPf6BiICiYaL52ux8H1Ip7Yc4gatf/Fm3+HwzVN8r
         TTtxnNkYlHN1yinjnEbsrAJMiglk1+2fB+G6pm6Kg67ditQO21OVAd3zGtJrkfP7IXlC
         YLoj2d1Lgpe4WXSSnSrWEE1gkrkdkuX+5NjhnqHJTmuhRfyEPzFvJ377Eiqky+ny0rhJ
         Wv9dxEbIb+n9UkDJIUPyZXfTMr3F8DNZn592pXisXWlJt6O9ZQUuOPOmsoGNpZHuYjFh
         5D9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762327525; x=1762932325;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FzyJ0fh/wAbVru2AIw9Z/iVWtj/2W/vCo97JCS7BrIo=;
        b=tND7ZgxrNX++bIwA5IdV/x4IQLHAwTtFtynkNUXJJUBKsmFTGUmqxMB6fDx98GUoGH
         EVEEgQDqRYpoUrAo2s9HJJwYMuapBTCOuu+1EmAE47xB9+BykPQzPjNMXii38XMZuR4l
         RFtKyN0uHgyetXuhQrK6bQQgDUQmr/IQMTAXj0oZt7NIGfKsqELPg+qEuFsrxR6KXvcc
         w/XVhAu5BkEfC6jIHoXtooJpzQjmOCl6siWQSqkrjBgVZjrAZYLCSHGuJfGlEa74F+YQ
         SMtrWGwrKEZN6fOOJQA8Q65y+pjAvtzOB+52Uy7uipyRkxPTUvhvtgum+VElGZ4XxZXD
         ZT4g==
X-Forwarded-Encrypted: i=1; AJvYcCVVZ5FkxQwsI80cshHovvAY8aqEgsyndBQioYC9RZHDEKa+l8tq7Fh8SaI+lOO6kTmaUnUsnXfPHakoYs8A79mhGA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzOCsJOAk4rwH6rT/g81PHP9J3bedwkHoMi2JBn11gRZSVbW2Pq
	hxzgQz8ewJh26MkhVPSnx9Q2s8jkpjTHLX1FgDrTypFO3NGGNPGpVib1xaudWzhp+iNkzmfji5T
	MFRwX
X-Gm-Gg: ASbGncvsIwoNkZ2NEEJOf0RJHuhQjUh2WkJ5xZgFzFlBBmWOYa5/bI+2bilzP2xoDjz
	Q1A2b60Rt9TseTe2xOz7OrKDMXMRvmDvPEbb0VxD2Kw8tF5YB40zrU8D/6j5HDptm54R88R6fHM
	MLHldExMH9YN/3dt3rI1686YNNUMg1yM5dB2jRXNQNUBW3SkiYu88tqzVwTSc23cnA6/Bc8Zx9Q
	Yp7Aetsyehb6jGeP/mYKBb3P34YwzvmYAynsG7cm7zImJSRdiEuvkhIxwCQe7RFb3x+kBeTfhnQ
	teNo5X7VHvE9XDpswfxh2H5iLkNXeiUrgQ2J8XvIO9rZ4vcRKU40Tx/G2qx95ZVQMY9IeGoBBd0
	Tu25Kc6mT4MGXn5KuoKEGgs/anJr2JfI9P18dBHeWrDwTmHJUKdRQO46714uza4xHQ1NER8id31
	kn+GZ/R0ZhT1pX0aKB
X-Google-Smtp-Source: AGHT+IH5PD1LXiuJ1OVxB91pB1B4L0WrpF1/eJTOcdn/V7iCjj7s8mrxuloXatGB8SxHsWzsC8nfAw==
X-Received: by 2002:a17:906:f34e:b0:b72:6762:f76c with SMTP id a640c23a62f3a-b726762f87amr59779866b.5.1762327525074;
        Tue, 04 Nov 2025 23:25:25 -0800 (PST)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b723d6f8c5bsm411534866b.20.2025.11.04.23.25.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 23:25:24 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Kaustabh Chakraborty <kauschluss@disroot.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20251031-exynos7870-drm-dts-v4-3-c1f77fb16b87@disroot.org>
References: <20251031-exynos7870-drm-dts-v4-0-c1f77fb16b87@disroot.org>
 <20251031-exynos7870-drm-dts-v4-3-c1f77fb16b87@disroot.org>
Subject: Re: (subset) [PATCH v4 3/5] arm64: dts: exynos7870-on7xelte:
 enable display panel support
Message-Id: <176232752377.13426.2352187579192770383.b4-ty@linaro.org>
Date: Wed, 05 Nov 2025 08:25:23 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3


On Fri, 31 Oct 2025 00:50:17 +0530, Kaustabh Chakraborty wrote:
> Enable DECON and DSI nodes, and add the compatible display panel and
> appropriate panel timings for this device. Also, remove the
> simple-framebuffer node in favor of the panel.
> 
> This device has a 1080x1920 Synaptics TD4300 display panel.
> 
> 
> [...]

Applied, thanks!

[3/5] arm64: dts: exynos7870-on7xelte: enable display panel support
      https://git.kernel.org/krzk/linux/c/35e69cc6bdef74a3c4794bd278a94dfb512abd7a

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

