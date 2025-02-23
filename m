Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A67E6EB7C
	for <linux-samsung-soc@vger.kernel.org>; Sun, 23 Feb 2025 23:48:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740354495; cv=none; b=cJk/tnGR3RfUQceHqUbH7EDksldMb2anM/8LStDsWfoRhyx8n594cqpkPUSpHzE2UP0Kv+LlL4+hILthtnjED71Uo6BVCabkPzBqwi47CG9tAk0Cz25W2yPP7B+cBMUPStMuklgqSk1YCUal0tAKlhjjOaXwKt219MA4gWITDbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740354495; c=relaxed/simple;
	bh=yBWzsyr/XNm6UaYOSTJcDGaRT2g3B3VBzdxrx9oo+LY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gGC43Mocm9sr1ZSII8lUyA2iIJaToGmMGc7JPNJURLAtz4b10hcX4F0Z1erIpp6GscsS8UjtrnplEn5ap1t+bPvmGSRpWxC39eXy7ADl5f0VAHA1ioQHNUUX95YXafgd87iTdFP5N++qopmtxq/r0XXFDi93FPW0C8riYtBXN+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bkLVvf2k; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bkLVvf2k"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-54529e15643so4432070e87.1
        for <linux-samsung-soc@vger.kernel.org>; Sun, 23 Feb 2025 15:48:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740354491; x=1740959291; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9wcnMV7bCjw+onbQP13XkDfLLYTKBRINzQvJtc5RrEM=;
        b=bkLVvf2kXf166mx8Xgj93WnecWs9Hqun8jP73qvFhH62NFs2nCEvYFMudYBCk3fhAQ
         lfnGM1Z8vW4rjqnaQpkbBLMk50ZT0E7KK3ZB0/OTCbw3WGWR7LE6f81SJIIME3xaKQC2
         UUVVegjIZrIho8atw04XG59r+5PdyF+8eCCIWopzy6Xw2UeaEqDFx5aIOmNS4r8+2TF5
         W2DzuT1T5sW/iwOIME9n2quQbcsc50ncz42C7ALc+2s/K4AGmjWEoc/Ifs2p1g7+W5+E
         WO7/ZlknJe53kSF5gfDb4yowV2LoANsyQPJOkvqc761V+yBCYILz6IvAC9cnbhPT5QQE
         9AxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740354491; x=1740959291;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9wcnMV7bCjw+onbQP13XkDfLLYTKBRINzQvJtc5RrEM=;
        b=GDCKJ3JT1Lzg6BtIsH1y5QbNLpEa2Sj7yJChRbfe+ff5JIf1ZO4hcbSM+M2tGBgC0i
         Sl9Pp3/O9EneoZNmqZCi9s/W9faiwYwV7EzNohUdJfZSsAacECCzg4xQ2nEZ3ejM1ZKz
         G2oGdGwPf1tyr/nzVy167HPTQmJzAyoaSnllnlSIejdRxJXWlfzGtD6WIjzaxVMZdnjj
         TctWVlYGAgK+gd5V+mzWaKbs0I2kIEBIB4hNxVJpBVx9r4PV73oui3pX2bkWSD+epDiA
         lGz53RW/xBNIDf/rLlIpqU6xUCMw1tPA+t/FpK87lSiF6cXA2Eto8GozXb2CIUrX41nx
         K3mQ==
X-Forwarded-Encrypted: i=1; AJvYcCW7WsVe/Wgp76/zrDaHNBLBCyo+qX0K/e1Lm//zHmAKKwHH6HksnCHjxeyWHPYEwtc+uF/HYLxguWtio7Nv9qCdtA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxkg69td+X7ru1Yr6OthUyYumwqE/jcRf+0O3sywxLI+3tPCibC
	9810zxzV/oBEzdwB90VzsOt5Mp22pZKNmkiAGzql0Jl5PKuQkg2yzgkO4EEoVv8=
X-Gm-Gg: ASbGncvGvyj9c4lbkZhAKg0n9ccY7IXtHWKrS4pcetalip6mms2AqPbnkn2mLMdDgVx
	6WVfkepKbvYS+lt2HoY/BRtEwxOG0bGx5OAoiUaTl/biJzmMO0VcVTKz68l7DHd58lJVlC08qyy
	fOEqiB/PQuOI1r1Ue/at4U8b2WetfDloGctWgkjGfwD4S/3tumrT6Tq+/1jWmMH8nGB7sEIMKD2
	gsS0jRumcZ0MxQOTKnyBcu2m0UsnhVzaNCH5f3i2Y8yvGkGDeHL/Fb406twR5WEOWtYz+Le1jOE
	dK2+mqP4rWLiDDAo2kbQoPmfWwXQY/Je1ScOe9PrTov+4oeC1f3UT50hMKas8ruh/gBmctimHlg
	B/931WA==
X-Google-Smtp-Source: AGHT+IGXmEWcaphU72erBHimrC5JqF3fr1E4pBz3cUxisqWzEmoQZicuyftwCeCY3akeN/V+TAZxhg==
X-Received: by 2002:a05:6512:3f29:b0:545:1049:eb4f with SMTP id 2adb3069b0e04-54838a00232mr4288474e87.0.1740354491225;
        Sun, 23 Feb 2025 15:48:11 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5452a67e6c3sm2955721e87.1.2025.02.23.15.48.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Feb 2025 15:48:09 -0800 (PST)
Date: Mon, 24 Feb 2025 01:48:07 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Abel Vesa <abel.vesa@linaro.org>, linux-arm-msm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 6/8] phy: phy-snps-eusb2: make reset control optional
Message-ID: <rcny5iaxs6gr6vcxmjep6hwtkt2fvtgzhbxlpu3ax6vj7maure@n5bg5y74vwc7>
References: <20250223122227.725233-1-ivo.ivanov.ivanov1@gmail.com>
 <20250223122227.725233-7-ivo.ivanov.ivanov1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250223122227.725233-7-ivo.ivanov.ivanov1@gmail.com>

On Sun, Feb 23, 2025 at 02:22:25PM +0200, Ivaylo Ivanov wrote:
> Some SoCs don't provide explicit reset lines, so make them optional.

Is there an external reset or some other signal?

> 
> Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
> ---
>  drivers/phy/phy-snps-eusb2.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
