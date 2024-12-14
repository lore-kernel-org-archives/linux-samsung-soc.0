Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5551F185B5F
	for <linux-samsung-soc@vger.kernel.org>; Sat, 14 Dec 2024 10:49:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734173398; cv=none; b=OIgsZIm5Ol+LbNQjZxpG9072FX4FaT/nJqOAu3VLIakEJY5B7fAorqsvtd3cxgN5/+gQCHxRMUuMItZsUCGLuNp/QYCZGvuSE5qgmWRqiLjeGULK1wjvw0PGNY7JXcj2vQPVgANhek8tmrJQLhpOyCahVQzJNO+C/2m+G1gl09I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734173398; c=relaxed/simple;
	bh=uHmvStd7TL8wNOeQ/8/7MuJ74LQDGzhKKAwzIGLKMGY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=E7Nnh1DK5j+TO76Z0/zbDCNL0BXGtapI74qPks+kxIdAKu7CpUIAc5ukSXAObjhXWMzCn4IgclLYiIWjMcaaSGRLvvnfTm6gEJoiudIf7u7JmuFYEhw3NY4AL1H6x2PhZwACvUtvVyV53oTS0V11ZCBH4MR7oriQwV5OV4u2wpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yrBqsm5I; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yrBqsm5I"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-385db79aafbso232930f8f.1
        for <linux-samsung-soc@vger.kernel.org>; Sat, 14 Dec 2024 02:49:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734173395; x=1734778195; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VV5uB4pW3I7PFM+MdqLT3Z46mt4gLHWB+cSrr/zUkkQ=;
        b=yrBqsm5Icw0+3rHxIjSd9pPUUQlg6+ZJC8o331lmhVD/YGM9ntzNDaJKZQyvfWtRB5
         +OJKoBZDvVjt9v2SPjJP8til3ToFVFvveFsy6cb3uwSvKJ1M1KWSJ6Ndisi1gAhOhslD
         Mbz3UIUbQUV79a+A/KE7rY4fP1ZKIszWdmINyFb3jRYk/qSEe9P9BwOUCPOgwUaXmJPM
         amumeOL+WFY9tLQ55124ilp50r7Ehd7l9dqH4LguARr2e0S+bKskukwWLIpwFhjym8Yw
         ZkcmO/zxIC9MfB3zRYVNXnUNgR+I8Zvi8MppZFirgbasaG28g/U7jr4OiMYVMUoRSxy9
         /hrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734173395; x=1734778195;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VV5uB4pW3I7PFM+MdqLT3Z46mt4gLHWB+cSrr/zUkkQ=;
        b=tqMAv8NTp4DSWEjxlUJFEV82wbHoPGtf+zMQJIw8tpjidBXtEMBhzTUN/mmumdhhId
         WqHaAupFZoL73t9B+9Ku3haMoCifXcnXS1B2J1FIRJ36mVY9jVKARDwJtk3lr8OvUnVp
         GxDost+IC9TDLol2nYU2Tj3feoqo20JHc2o3RS3B93Eu1Mkit/rtqjEm9CSKj1On3mwN
         Xnkh1Aqprctj3ct4krZfi1Q80eqiH/VEPGcL6VUn99JJTCmZ9WULmL0MtbKYD6Arl1Jm
         gGjSqbZ5EBPDo69F2yyqvsu59O3iws58AAj/VUY/Scli5V8jfnybTGHGIXGUEOITK3bF
         NZpQ==
X-Forwarded-Encrypted: i=1; AJvYcCWhsM9F6YxFNW4lVnWL/MczKd/ERyMKcqttuFEWLOhk5PWkad7X4llnZnADVNn5DdxWoyDKI6pdhKsspoTJaMsk7g==@vger.kernel.org
X-Gm-Message-State: AOJu0YzlTIKdTYXRx5x8PrCbR5bak9XYXoAy+Y7maDR5z7y5CrB//akb
	6OYY/A+ZjNI0Vb+zYIAd/MtbkWKDWtrTxTIGx9tLAxs2o63UXJagvOSRKofLoW1DlQuS8h03w4g
	D
X-Gm-Gg: ASbGncvPDneNZlOIcJTGAmnzflfvKPUoiPJkOPnojFmkGVaESc3Tk9b+kKQiHvCqt8Q
	BgiwU9CrnzomiRQ2wfgz3dEjTtrjTcxQJCQXoFp1WeuY1AWv2/PFpK+CSj4y7KHRtrdMq6QiyAg
	NCkERuoX1Jp1xnYo4CXep8lSqD9mjkoWrcENrm6vyL4MfqTvUPG1ua78nHtAnscrnGDthl5MQ2D
	FJQMKedJHFzD1j9GduVjpusm2v6aofrUVJIcA7gs/gp4FdpqrGLO0Pav5hlEZjnIPuUdZ/n
X-Google-Smtp-Source: AGHT+IHyTzhFYErYVyT7VJHfprfadGDQxildtN+M2wr4sWYswaUikDqlBN7Bu8mHFXxUDCZdzq8sog==
X-Received: by 2002:a05:6000:400c:b0:385:e355:7ba with SMTP id ffacd0b85a97d-3888e0bfa95mr1693389f8f.12.1734173394680;
        Sat, 14 Dec 2024 02:49:54 -0800 (PST)
Received: from [127.0.1.1] ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-388c8049facsm2256481f8f.79.2024.12.14.02.49.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Dec 2024 02:49:53 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 krzk+dt@kernel.org, robh@kernel.org, Faraz Ata <faraz.ata@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, alim.akhtar@samsung.com, 
 rosa.pila@samsung.com
In-Reply-To: <20241212115709.1724-1-faraz.ata@samsung.com>
References: <CGME20241212115815epcas5p29fdba4ddb93d08035f422444cb826ec3@epcas5p2.samsung.com>
 <20241212115709.1724-1-faraz.ata@samsung.com>
Subject: Re: [PATCH v2] arm64: dts: exynosautov920: Add DMA nodes
Message-Id: <173417339330.24605.2885183556743988867.b4-ty@linaro.org>
Date: Sat, 14 Dec 2024 11:49:53 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Thu, 12 Dec 2024 17:27:05 +0530, Faraz Ata wrote:
> ExynosAutov920 SoC has 7 DMA controllers. Two secure DMAC
> (SPDMA0 & SPDMA1) and five non-secure DMAC (PDMA0 to PDMA4).
> Add the required dt nodes for the same.
> 
> 

Applied, thanks!

[1/1] arm64: dts: exynosautov920: Add DMA nodes
      https://git.kernel.org/krzk/linux/c/de7a4e01055b040b303d01d709262b7ce9d818ff

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

