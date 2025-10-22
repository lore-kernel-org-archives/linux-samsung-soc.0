Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D06221B9C1
	for <linux-samsung-soc@vger.kernel.org>; Wed, 22 Oct 2025 05:59:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761112760; cv=none; b=X+O8KJuoUWlDfbTeLXTToC79ZLsdn0wczFdBu1gD/k4iPbXD20Ba4D2Yizotyqd6KRC9DFrHIdAjZyioUV6S7fSN+c7yN9LC7q3Wr/Bqr0tZocasp5J5WN1PNVcx+kpWLJ8WS9p/gDvRSFC2gueonVgy0977aP5XpYf4gQi5vpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761112760; c=relaxed/simple;
	bh=1mAYXh5gf85r3zkPuSLEJiUvmaJbkw4OlD/ZND9lC/k=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=WfJDwLg7oKnj//mx1Tag7Jjar47sAL+ncls8nE0XVpW2t7IaQ8a8aV4WdojZmfFMXEjtd1g4JhjikLnNkyXwWAhiZEzBVNQnSxKb90+R06hNsgJ9pujstNV/f6UV5D8edWY/Rq/1jXtAc3cBnyyE2nZjsyyK3mL+1xwCQEFkESg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NsEJvJfQ; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NsEJvJfQ"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-b40884aeaf4so129757466b.0
        for <linux-samsung-soc@vger.kernel.org>; Tue, 21 Oct 2025 22:59:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761112757; x=1761717557; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=01+Fe0eWiJBF/0jGmWtSiJdY8eUSJHrRdRgDTl7S34E=;
        b=NsEJvJfQGIQpdYFZaM6kvheklhKveP0WvhzNoRHlLUPfv8u7RYqRKR7E6AEjKfjY3M
         06RWrACHsg43i+78HLM6myjd/vAteo2r/jDVB+o69GRczSkSPn6t9/RlVU4ZPEK/0Xcl
         IfAGRAzc2RJ2Jfvj1aeW2w8mFfprcf8sXIrJV01WzRuH9vmgOn6pRZy20/3aztwY8bnq
         IVOOudvR4XodL93BmfYgp0qnAeNeTPf9wbRnDFJbRDmF5nKs8liDQK2g3Blcl5+iWh9x
         Doy3FRvF6iWUcGWRWSY5XOjDxxnwoi4zXN21Ul0WpvLV46RpAww+fjADIlnliukyYv6E
         X9VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761112757; x=1761717557;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=01+Fe0eWiJBF/0jGmWtSiJdY8eUSJHrRdRgDTl7S34E=;
        b=n/zeg7kOPT/S70/Zq7ne1r3rB8BseRXMQXDRm9exm2iAYOswNw9qCdz039h6GOnhk+
         X1vLXtXIiti+vNIWUxrVkucjgXbuuR7E2sjRJ4KbR7VvXYRb4boNguG01xRzyqmvdFpm
         2BW+n0AsID9IH03X6XBKZksKKvkGsT9YaDF9AUjD3qQS9CFycXZKSkFTmFh0lU6bTamb
         gkcGCihLmB0LOciovS5euH1mIHAU6GxUrBherYlZDvbS18usWuYpSE2cTiVnr0auJ32G
         DxGYwgMx3OlVnUwfH3isNfcP5r495KQib/b0CI15NfnpR/moUhdU1qH+fMnxGJ2KWgm3
         Vd4Q==
X-Forwarded-Encrypted: i=1; AJvYcCX5Rpta61IsM6VgOQHrNcFpz+7FFkUbOAeqAPfp8MC6xXsP2LzEnjFISj1LvgrQE2k3oX+nTX7baQvABJQXr93sPA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw09biez8802BQk29P3rCuIuIqO/CMReheiO1tMvqCh/4IkVJ8s
	ujnta/JWFWSSDC3xG3ftlrcBSw1HOXYXZ0DJXCyYWxxWHHIjXWpfVKgjfI9TR0ez1MY=
X-Gm-Gg: ASbGncvLEkkmV+KVunrbpLicCmQNipn6NBMlXb+UJ7/g/q8Ljz+Olmdy5eYxWQDoY9x
	VAwrYLQhoNej0hBrATrko+XXMD5x7iDuk2U93NUYWap6QBDve19NS9rSHoOLJmAmYedEE2c4VTL
	RVYO0OsUgZdboK9zgsjC70JHZWA0bAZXppNgK9UsQowSN3f+0w/euVUXI7aWf9hV3ed0pZuJJpK
	ioo5KPER4TYLvd3SXZN4UD/Qoen9ViTlXzIGwGusiL5/Q7+8aea2WW0Qv9uipuMB5ABTzOsinN3
	TyWiYWVHuUBVIt21EAXRL5NmZ/c+ANdPSiOjc4UGmHvZnjfa47B/bhaHNbnSXloDTjPsgG2xJSf
	vKx8SnUAVj+qgBcZIyYZyoa3/zVwxN6EnXrvch0jJ/5eXLH5ukd/aulIEe4ykL5WnPYPT9XQkV5
	DfSmszyj81YizOj4lHWeXOI+/0M/M=
X-Google-Smtp-Source: AGHT+IG1W5Hfo15+e9j6LfyFkdiiBEUF4jK5x8ekTLpFWUxvmYf1mD24olvCsGRfz8UWl/h5IepeGg==
X-Received: by 2002:a17:907:3e08:b0:b46:b8a9:ea6 with SMTP id a640c23a62f3a-b6475a06d9bmr1365635266b.9.1761112756660;
        Tue, 21 Oct 2025 22:59:16 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b65e7da33d1sm1251417966b.7.2025.10.21.22.59.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Oct 2025 22:59:16 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, peter.griffin@linaro.org, 
 andre.draszik@linaro.org, willmcvicker@google.com, kernel-team@android.com, 
 kernel test robot <lkp@intel.com>
In-Reply-To: <20251021-fix-acpm-clk-build-test-v1-1-236a3d6db7f5@linaro.org>
References: <20251021-fix-acpm-clk-build-test-v1-1-236a3d6db7f5@linaro.org>
Subject: Re: [PATCH] firmware: exynos-acpm: add empty method to allow
 compile test
Message-Id: <176111275526.8693.8621837502734274047.b4-ty@linaro.org>
Date: Wed, 22 Oct 2025 07:59:15 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3


On Tue, 21 Oct 2025 15:24:47 +0000, Tudor Ambarus wrote:
> Provide empty method for devm_acpm_get_by_node() if we aren't
> building in the CONFIG_EXYNOS_ACPM_PROTOCOL. This allows to
> test-build the CONFIG_EXYNOS_ACPM_CLK code.
> 
> 

Applied, thanks!

[1/1] firmware: exynos-acpm: add empty method to allow compile test
      https://git.kernel.org/krzk/linux/c/6837c006d4e72d6add451411bcf407e0dea4ad25

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

