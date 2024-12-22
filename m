Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2FF718E75A
	for <linux-samsung-soc@vger.kernel.org>; Sun, 22 Dec 2024 14:26:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734877572; cv=none; b=qVdsd58goOYlOHvxhJNzSjiV2KExPhpZs7TG9weZgSa5wxGYG/e2MOezikxaFY47Bm6H5fpQITJTSqmsENlyFaz4sW2hDx8wlREB0AVF3xZia7kskyIbrmtQ/LntvV408eZ3knbi5Hsagf1vJzy0wk6eOZvlynGs9WcsSxrIPUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734877572; c=relaxed/simple;
	bh=gJpG7eEPpKdqn7YHrV8VUJX7uJhho/nnN60DqmsLQbo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=igCowAt1Jyo4MSfzEdQU31DxD9WpADYeBL6LM9wZTi9JD9FQHOYJQOO9b6HVBOKajX23KjAeWUMMCtSuYzmhRCYZ7aRASZP90EOev+ygiiwXXhYznDuZDXFeCRELRrRItLjGt+aily+pdAbRnmcJKVN307UUZDtlNeovM0UkQmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Nx1wkOkR; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Nx1wkOkR"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-aa6647a7556so72280466b.2
        for <linux-samsung-soc@vger.kernel.org>; Sun, 22 Dec 2024 06:26:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734877569; x=1735482369; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8qtqb2q9SZdIxrsGX5zFz/zmOaa7ahdn4J/z+KWdZJM=;
        b=Nx1wkOkR5SFb9w+z6J79jtAfHY5PkZT9OfbIjbugd79OxxjuGREy6trK1YM6rMrjJ7
         QgvZPOTLs22NbC75uyC/AVZbLLIRHu9j6bh2QiZ2lo1Z75BNN2cqyosuBOnf1gJCmFsl
         42LboMNUwGywphUURjCG/KJM5Bvufpp5y397NmKIFqYb1mrXYHynXnnnxIYXP2OdBPsx
         zxEnFbUwC95XxieMAcbEoRUL11s2oJh/NUmQmpR3LHNdapC3H71ZsBh/D6nEj+PNwVCa
         NAdg2kMR4Gd3MqXea3t/4plMWm1buAmWwIYPEJKl3mgDRU1Jy/MJPSG8KOZ/+p5jHGYt
         GqPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734877569; x=1735482369;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8qtqb2q9SZdIxrsGX5zFz/zmOaa7ahdn4J/z+KWdZJM=;
        b=WkrNw348dhcm7MGnLk5kEJeJ9skXyDxvZtX6ltVPhrXjNCBJY3PXVo9UP93ES717jm
         Lb22S0FSJJbl+DbQYbOB3kWWtUnEIbTKk64nXjWNY9VeiwtxNI8PNmOwhGRSEDHRHtg7
         /hXYy+d1+H9XKb2UhNJ5lD8i+Ne+i+h/iivtZN0TQTN/eRLdBPYddGyw254vMHuTqrTW
         h8/8kyAkkDXgGxNENZDA5YNS53oavyqPfcI5YscVdiwjgwF6Drz4qS+0et9bt69pOwYA
         Bircj66+Mq+4EWOyLFp8iKiat/rn3HDh1CiAAQES2MOEIJ+lMllMKe2twZrKqs6ErmZR
         nH1A==
X-Forwarded-Encrypted: i=1; AJvYcCWUHZDBmnyxkhr8dzhDLGrlte2TFgAVL6wu1zhRdhXauyqjLIpv/XqlFgQF2YdprEkRJj1rNFvkI5dsdQPEi57Mxw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzqN9kJeV2PtCKJR6eGeef0Jn5no2VeldsP1c13fSBwKA29i/qj
	2l4+WqlnSzIpC7pQVkf7NMdRFIa4uQUYizEiHnw5nEOQDvES7WSYt99gRYLLFfs=
X-Gm-Gg: ASbGncswY7HhP1wx8U/4EJQb7fn8vQeJbBOu4kmCS8i9LHrt1X9i+JtEjLGBjjDx2+H
	OEjEwNvXMswzBvNgaGWjqxfWQfYqy3ciUNNwzXA8H9hFPk08BJI521IlP/huSGjwj0nGxKXQm6c
	BhlLdTAbABnZkjVMz/eqhVOk+EtZWF+2pW92cxaBkY02CD0HJRXfwFw0pWdbmIHzG9L5rFQk0TF
	rd6xmgfbW1Vh+U4c5VpyuZ/qssqIW6Da+7bwsYqF4bx8daj2qufElRbCgQEV2imcPg/6AGu+usF
	sGhBo1GOnMcckVJuds9GeO4VgOcNGcs=
X-Google-Smtp-Source: AGHT+IGJEflLR7LUL0jWhIG8if351byh4oOU18ryBTE4nHXQMghZCSJJMazHqwq4sLeRDspVGmm4qg==
X-Received: by 2002:a17:907:3faa:b0:aac:619:6411 with SMTP id a640c23a62f3a-aac3352c94amr296886666b.11.1734877569000;
        Sun, 22 Dec 2024 06:26:09 -0800 (PST)
Received: from [127.0.1.1] (78-11-220-99.static.ip.netia.com.pl. [78.11.220.99])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0e82f577sm392716066b.18.2024.12.22.06.26.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Dec 2024 06:26:08 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, 
 Sam Protsenko <semen.protsenko@linaro.org>
Cc: Conor Dooley <conor+dt@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20241211033027.12985-1-semen.protsenko@linaro.org>
References: <20241211033027.12985-1-semen.protsenko@linaro.org>
Subject: Re: [PATCH] arm64: dts: exynos: Specify reserved secure memory
 explicitly
Message-Id: <173487756773.3738.7711760267747537170.b4-ty@linaro.org>
Date: Sun, 22 Dec 2024 15:26:07 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Tue, 10 Dec 2024 21:30:27 -0600, Sam Protsenko wrote:
> Instead of carving out the secure area in 'memory' node, let's describe
> it in 'reserved-memory'. That makes it easier to understand both RAM
> regions and particular secure world memory region. Originally the device
> tree was created in a way to make sure it was well aligned with the way
> LittleKernel bootloader modified it. But later it was found the
> LittleKernel works fine with properly described reserved regions, so
> it's possible now to define those in a cleaner way.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: exynos: Specify reserved secure memory explicitly
      https://git.kernel.org/krzk/linux/c/11fd6c9b047c30c72dcea3f79c0acb7deb69c822

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

