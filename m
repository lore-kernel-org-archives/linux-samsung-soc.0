Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 233A83B290
	for <linux-samsung-soc@vger.kernel.org>; Sun,  4 Aug 2024 15:01:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722783670; cv=none; b=PbkRG9wH2l6fGQk37Lnj6rZ81lyVYaQKJYr4KxDWEfpgzUydk2zkZXl66YkGpkMg4ZTcG30J2GhIEQtfb4zaBpJ54m4iuttGws2VpldoFMhsgw8q4d8RbHepK35VE2BLZrTwl+IlmsOxRFe4v3ooIuhD+PG9TfFRGTOH7HNksJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722783670; c=relaxed/simple;
	bh=CajBkE4wLrtMnRKOYpFG7Sh2NuylE8/OeJTwiS7Hdfs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dhhOlyLJP6RCIT1fFNbXlA3F+WGjKqKZxDbhSwWe9N0NscOCKEjA+wC9/ezWtcFNrOZVMXhGnNFB3lsFDf6e97+2Tk6x2zdZM/yKss7fDZt7Ar9nSZ+bEtbqOtnlVdTeF5PfcsHlrDQUCHNBZ21MjbEYITmrOCh/QJlN4X006NU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=C2KSGKeH; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="C2KSGKeH"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a7aada2358fso790084666b.0
        for <linux-samsung-soc@vger.kernel.org>; Sun, 04 Aug 2024 08:01:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722783667; x=1723388467; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nEjWa4pkzcfMlCjLYLkJWGX9WM6UqKyJJKuJ1PAMiNg=;
        b=C2KSGKeHLw4GE6q6T6YzgXbRWfPd1I5z5W19+CFRkTKgPzzy1IhnPGuVTbiOE8kUUM
         G7e+dB9z+G+6xB0wA5Fo07RyjeWo7c59HnJEA6vzlOJjVnxklEh0FIxsx3YuFqmYKbjX
         owsXdUBr4rAXqo4W/PKxka02cmJq0F7z8UwdNcEe+Kxk5x4O1k5G86RRxtAksjARt7aV
         hoxNdK85O39DtVWNtHQReyBuDdwv8PLIpHMnhrxw3VZ1XUKcrXoNUlrfMoLth5ZQq2XY
         CcHUsXgvxCAx8LYncNainSCGZzsVfsOm5ExsQYBY54M2rQ1rRO5TeuXc3mtv8K2aP2t7
         Ey4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722783667; x=1723388467;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nEjWa4pkzcfMlCjLYLkJWGX9WM6UqKyJJKuJ1PAMiNg=;
        b=Ll6SJvlHCD32RJcgeNpJ6E+s8vy+lXFZOpng1SHvsxIqFSTSZb+snGdKHiorzXLaLI
         9xauK1TJipnobu6c+A5Cguxx74OuSUx4c2dwHROsUJr51KCnoXv7xR8Y0k9PMgpQNPjH
         7grVWCHEPzTIRwZHmVt+BJ/GcLQg8jPthDhMC+nYMylGli9/JbpznbbUtvOXvKQSK37F
         lrl1wjX29aVBMg88z1oz6CrjvM4gTLzek0XY62ZEybXqcp2aff2s3K4S/dAHV0viy0oY
         zmWc1qE8V43FGbwvQHxKLBjkIXURJ9rKkYsB28dI9yxFG/asJf1V4gQHqsq1UUPBxTKP
         oyYQ==
X-Forwarded-Encrypted: i=1; AJvYcCW4Ya6APONfFX4/YI+ch77+79nY5NGFo8TLM6VSDuGrvlZnl8HNzyUJmTiiCj2HjJzjXmisYZPthL+tQT1Kckmd0HykKp2FYxFKtrxBbXxgyfw=
X-Gm-Message-State: AOJu0Yz/hV9laPApXiq11YiKAWtzrS6Kp972y4Ku1ZaybR3xHXZtPZhb
	akF+wWHlmFTXH9y+CHe6P0R2JMOB0S3P/4TO0Uxt0fjkCR4xvoScX7QatwMtxCE=
X-Google-Smtp-Source: AGHT+IFgQvjuEQMq5i8PxyVFOfHu5y8cX1lv6VnDLI0y40anOtcoAyMQrpAuVCM/qRgiuCYX9vZoyw==
X-Received: by 2002:a17:907:9406:b0:a7a:952b:95cf with SMTP id a640c23a62f3a-a7dbe66cc25mr826648966b.32.1722783667303;
        Sun, 04 Aug 2024 08:01:07 -0700 (PDT)
Received: from krzk-bin.. ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7dc9bc3cbesm338973566b.5.2024.08.04.08.01.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Aug 2024 08:01:06 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Sam Protsenko <semen.protsenko@linaro.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: Add entry for Samsung Exynos850 SoC
Date: Sun,  4 Aug 2024 17:01:04 +0200
Message-ID: <172278365082.32845.11234581938403878166.b4-ty@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240129204717.9091-1-semen.protsenko@linaro.org>
References: <20240129204717.9091-1-semen.protsenko@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 29 Jan 2024 14:47:17 -0600, Sam Protsenko wrote:
> Add maintainers entry for the Samsung Exynos850 SoC based platforms.
> 
> 

Applied, thanks!

[1/1] MAINTAINERS: Add entry for Samsung Exynos850 SoC
      https://git.kernel.org/krzk/linux/c/265e472e12da17af754f584b6a2f11cedb94fe49

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
