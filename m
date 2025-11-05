Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B29D2D0C8F
	for <linux-samsung-soc@vger.kernel.org>; Wed,  5 Nov 2025 07:25:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762327527; cv=none; b=ELbFs428UwVcJdLBnOYRS1EBxvVLBBPuqnED1tAZGieKtRhfOZ7NTMPFkhNAtGHJFh9DEvrQQQcOBRBFIxGVdOpbc+NquN2a/PqEKYeROvtVNS+NhLIrMtjYJCvsEzMabyitEUm/+hlqU0AyrPY0lE6pCvII2FqjMWOLHpQXScM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762327527; c=relaxed/simple;
	bh=9STBCQOILyz749lFbNAuvnKVBlSgF+Sd3nrxQOUQ2Ss=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=iRq8oOokkaRYEspeqyOUZ5LJ1AFPhKJtYCXtBUEeyhbFdDkw+McAm/FMlLdlEctgpE3KTD6f7AJUUIvwAkE01TJZ51236YQaz6gPpkhXGqgreArRsqJbauwgzMUjE9Rx4dYLleZw/WWXtmsTRwxLKIOVBF8IeJJtoBApWJ1kj44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=okarLFN+; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="okarLFN+"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-b725c6be585so17139366b.3
        for <linux-samsung-soc@vger.kernel.org>; Tue, 04 Nov 2025 23:25:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762327524; x=1762932324; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TBCEYpPk6nDrVD/DXvDSlhdXPOYf8NnBeJJnqXSBeoA=;
        b=okarLFN+Y6fU58s/f/fVLwHP45+cEZ1LVB6busXSzC57prwLbSDD4a/lPnhz5RQOkP
         FmvAfjveikEU2IL4ENqUGlhYZKhnP51CChBC7E841eefz2Xnp8AL1M8uvqaYJ6iZkRhR
         ZBFt2L4cKWCGeNj7DGwCmi7jx6PpMFT+DmNtYEPiCMsgLYk0y0Zu/yef6pzO71aTscRc
         R+Aj0ph3eQg+CnocvQIXoyMuiao71HJ84byFh+LEYPrlIivifca16aHtkaoEm6FOJSO6
         QyCqcaAH3hwuThglJO6MoNpmcpF5FclzcRUYOanK7Rh62O8ZeAe5L0lQx84RGtgpFpSY
         +vIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762327524; x=1762932324;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TBCEYpPk6nDrVD/DXvDSlhdXPOYf8NnBeJJnqXSBeoA=;
        b=rFynkk51QgEwkYs/R71hUhIMA1geIdXwIBntVviLtYUjgRCzQ3FG8Zlx/vVhfHFesZ
         G/E7YidOIlyuU3vxsYK1Ehm7X4n/MbbXhVNyyUqZbUIwY28mrRmfMhP+iiVhxfE0YDsq
         pCeu4eMKQE9eJ1fCIrXYJs+UIizOoYzTaNE44TUSx9tjYmhdkeQWzwwtZOR76FNm3St+
         oe6eozlk4K295BIzQXiQtOm0KHN1V5Y2JmaTsXh4kGfjCDoB3eZ3W2ZKlGzu1kvJvSe6
         dGmi15CsvJQIpk1KQbceYOnPqpGJYb8tGfPC0b+9Ppi+foq6vDKat+aK7wChxcVf0lBl
         E23A==
X-Forwarded-Encrypted: i=1; AJvYcCUBYHNspXo5//Xu+0muYxY+6cy9QaHJrhejHEQiZCHCArzp8cax+Gy5rH7O2HD1LYORnIJ3kIlY7fV8r3W4/pFU3A==@vger.kernel.org
X-Gm-Message-State: AOJu0YzNsKaDuymIS/UXKN9n0HIbaucx9RKD74bZgjtMGbxEfKt3rL0G
	XuLZR1QRCohiLg5R6eiZ9reywnDaP0WgoHJpMhqVBsAQFRnP55ZQKkvHgZCWUuYqe7c=
X-Gm-Gg: ASbGncuumtMOWkV1khosacfHiLt9S7QjWQWDZ4R9d7DfsAk+NNpVnQUAObkn95rKQwQ
	QNO8aCYNddBPHgF1xGMq9ts9yQ6IMBuVkv5K44RlSAgLBy3QvN4Bot5wP6rGkc9JTaRWhuvR0H/
	CyvkrOp2C7wTICUtmgxxoIBor2MoZ02Axv+x1oUjZUI+1Lr2A8EBRhPNtSzwmPXyXFrk6MUalw5
	rfAMhcPgVniFjXyOfbsafAFuR0t5ztzEX+ijOMVlYtWjATgcKY+Tm5IFBMzt8nBD1E+sQq+wrq/
	fVvtH3blSTAchoqKFmiryLq73itQTaY3O1va02beOKOHGMSy7QxgS6uWR66BOETEPdgoVhavZ5i
	hFYAEmlseqTq6Z5/SliaG+PO8DhksUpQ2rBK7fTuitGdfJj2yBugiK0hMmVid6nL9GJqe1UcyA6
	BymuuUsBYuPAZIOXF/
X-Google-Smtp-Source: AGHT+IEnjtguPuZ2sKAErgkJCvf8b73YR4c88V8qvFIT7wye40P43wR9p106dk24VUSPEEUbZI5zSQ==
X-Received: by 2002:a17:907:60cf:b0:b71:a627:3da5 with SMTP id a640c23a62f3a-b7264e1235cmr109681666b.0.1762327523668;
        Tue, 04 Nov 2025 23:25:23 -0800 (PST)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b723d6f8c5bsm411534866b.20.2025.11.04.23.25.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 23:25:22 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Kaustabh Chakraborty <kauschluss@disroot.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20251031-exynos7870-drm-dts-v4-2-c1f77fb16b87@disroot.org>
References: <20251031-exynos7870-drm-dts-v4-0-c1f77fb16b87@disroot.org>
 <20251031-exynos7870-drm-dts-v4-2-c1f77fb16b87@disroot.org>
Subject: Re: (subset) [PATCH v4 2/5] arm64: dts: exynos7870: add DSI
 support
Message-Id: <176232752223.13426.17010346252705230831.b4-ty@linaro.org>
Date: Wed, 05 Nov 2025 08:25:22 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3


On Fri, 31 Oct 2025 00:50:16 +0530, Kaustabh Chakraborty wrote:
> Add devicetree nodes for MIPI PHYs, Samsung's DECON and DSIM blocks, and
> DECON IOMMU devicetree nodes. Enables SoC support for hardware to be
> able to drive a MIPI DSI display.
> 
> 

Applied, thanks!

[2/5] arm64: dts: exynos7870: add DSI support
      https://git.kernel.org/krzk/linux/c/fe02894a1930c85e542e5dd2044e6a3afcf717a7

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

