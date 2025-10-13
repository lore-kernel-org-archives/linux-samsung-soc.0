Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E704419DF8D
	for <linux-samsung-soc@vger.kernel.org>; Mon, 13 Oct 2025 00:26:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760315164; cv=none; b=U3nGXqG2/gyoK/syXTJnEPqoHe+2LdQRB3RUIpO9Y+86baODpPLhwpd+5MToJdm9HEIHjH7p2xwImRmELI+LKwERVbbZuq96M49mT+cirvZs8CD3BvjOV1KhQh6SLYsqphS/a9XGrdtPxjfVuWSY73HYhdBry3wTUrT1TXrFqpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760315164; c=relaxed/simple;
	bh=yTHGa3VhxPtU4MdOYplB9XQjuEwqZ7zeosg38lw/Lsw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ph6f124MbSI8Agaoogt2NNFWzlgnPxsIhL6vJGwRvNI2pMbn9cBph3oB6ZrEcZ0TRIHka/Ie8/x9dXwo0hMWQ9m904RvYRLPLeKdWRoF2r2z+rcQDju9toIuyb2Rm77QIsTp+mWeuR6b32AieiiaIBczswIyoyclSfO1eu/xxaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=b+QRD+Eb; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="b+QRD+Eb"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-27eda3a38ceso8630645ad.3
        for <linux-samsung-soc@vger.kernel.org>; Sun, 12 Oct 2025 17:26:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760315162; x=1760919962; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WBN2M9cMiE7Nv+ckCsZbOUgyHJWNUYkdtLKpVQjtD08=;
        b=b+QRD+EbM1H25Euku2dTdoM8J7+VeYBtOrh/D1hMwaDuRv2LDuwYnYVXAwqDW/WUck
         CgjFWN4WF19N4HbbDhwoo3LOXSk6mlSDkbOrGC+F0H4WFYil4JSW6TpCF9hunZ7S6LmP
         2w7vL82PKoPSZKYkUr6c0S43u+k3VVp62YIHqTzuRs70FRSBKakUsF+DdDKIV2Oe/1IW
         rwpa8xga4WF1qteQHag72CPeTWWn8Uk5tCGdMJl5ecJGzmG2YGuk99jSjlzVeF2htO9A
         EfVuEztVc733T9XhQCD209h3vpi5ZuhKuhiV1rohgpMpbGETpdRyNr2qzIq5xTmk/YL8
         rp1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760315162; x=1760919962;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WBN2M9cMiE7Nv+ckCsZbOUgyHJWNUYkdtLKpVQjtD08=;
        b=sF9geJr0V2S1s+wMfG3ELmsrcylevNXQ9J1x7QoL8rus+EVTRoHtpP/fOpTQikE8vs
         y5QzFQkuFpVY6xBpPooBDK3oREr2BgiRthNT6qeCdKLB0PNH6XmavvnUY6WQ6fyv5fos
         wn8CTCHwVZnmXT3IngxKfRmINDAWI9VZuCBcGWbD7i/u4T/H0obya8YO/CHNAulHdmkG
         TeBUykZ25tD88CKW+Cr4w8Q/YL2hD1ObC84WNa3+YBKmMNBpti1snUpGFLloJdhvUEaH
         TDEQ0J7eidAye4JLvkj609N7sJfDA6S8TYVYfq9/ivzrezFWusRJV+nqcHvTC1/eVJiV
         1oDQ==
X-Forwarded-Encrypted: i=1; AJvYcCVw5JFdwNLTec28hGTljZeh7un59eoczj+fDZSkQ+IwJm+EGtEsgMkORCuB3s1FsoANN9/VzjcX7tq2R7FCWThB3Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YyjVk1fE83gW+jpLGA2hPRs0yR2iHWkyRHG5pCQy4kUfdGrIlkD
	nA7oz5dPGQxWDSu076NMph+XM3zzKqwzcTWu7ZaeMYMgxfKMkTqNJJF/8u8Lv3YA6sUQpiHoT6m
	HCPq3sDU=
X-Gm-Gg: ASbGncsWpZhj4QjVhgRxB+hmI/eUidO8jiVGBkfXCutabHrFoD2mfNeuLstgN+oniv6
	YMnLzqGxlEuv811nj/EWVcIwNOTDuOyXRyYJpHDibBCV0z7otYQa2flkuFba2oLzT9wwfJv9NiD
	ZrxBQomcJjGnW7n1tsFPfZN7S4aepyn5mrqQGTse71ii0F3w06L5VKWY/D2w/kIhCMWWoh+HF1E
	W2dLMrK4JlDqKHdsHpf+w1FIX61iYkedeKL8jMWD3lStKVwvLa6dheFqXvBYpnMcwT+fL8WGpmW
	PlQe1rdzcJiPCL8aKHO3LyBo6LAz+cegFOrL/LhzHNxBRMqRv9ZScJwdqxoYz6W7OTUKbjbWp3a
	wW4j0/UUmnybziQK+vN5Ulr5FrvXmf/+mpWr29OxaPWOcwcuofL1bS8dCOs6g7ik+P0Vh8/6taA
	yhJBH8kw==
X-Google-Smtp-Source: AGHT+IEwIgW8gINldWjknWYV8MJ0j1jUN7u37O93AJbcBBhfRalcRq5iqyc2MYvjmSLv9qtnZvLvRw==
X-Received: by 2002:a05:6a20:9383:b0:2df:b68d:f7e with SMTP id adf61e73a8af0-32da8461710mr14706065637.5.1760315162189;
        Sun, 12 Oct 2025 17:26:02 -0700 (PDT)
Received: from [127.0.1.1] ([121.134.152.93])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992d096740sm9624862b3a.38.2025.10.12.17.25.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Oct 2025 17:26:01 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Kaustabh Chakraborty <kauschluss@disroot.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250928-exynos7870-dt-fixes-v1-6-a40e77a73f16@disroot.org>
References: <20250928-exynos7870-dt-fixes-v1-0-a40e77a73f16@disroot.org>
 <20250928-exynos7870-dt-fixes-v1-6-a40e77a73f16@disroot.org>
Subject: Re: (subset) [PATCH 6/7] arm64: dts: exynos7870-j6lte: add
 bus-width to mmc0 node
Message-Id: <176031515743.11660.18346080313426927067.b4-ty@linaro.org>
Date: Mon, 13 Oct 2025 02:25:57 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3


On Sun, 28 Sep 2025 22:13:57 +0530, Kaustabh Chakraborty wrote:
> Add the bus-width property in &mmc0 node. The Exynos DWMMC driver
> assumes bus width to be 8 if not present in devicetree, so at least with
> respect to the Linux kernel, this doesn't introduce any functional
> changes. But other drivers referring to it may not. Either way, without
> the bus-width property the hardware description remains incomplete.
> 
> 
> [...]

Applied, thanks!

[6/7] arm64: dts: exynos7870-j6lte: add bus-width to mmc0 node
      https://git.kernel.org/krzk/linux/c/9e3e37939362ba110c341cae09acaf000c0edb34

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

