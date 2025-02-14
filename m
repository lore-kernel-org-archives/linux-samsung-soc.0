Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D8FD1FC0E0
	for <linux-samsung-soc@vger.kernel.org>; Fri, 14 Feb 2025 06:14:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739513659; cv=none; b=MOcOFG4fpagL7MucTD4pgCrWmGId5sKf+kEViXNCCZG2XZwAMQIUc1xrma90CSjSUU+ZRefFrozIOmjYqoMbybzJVgzRX9Fc5iCXzi8eNsf8MCbiw90WgiF390N+hrYovW8m4AAPZmTCUQt4xJbaLQs/EdaqLrG9Bt7MZ3OaKYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739513659; c=relaxed/simple;
	bh=E+zHukzTxoUAqQh1pniz8wv7WSmBiWd4YYjBi2Wtb9c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AVS8ulZUfAHkedTUAUHpiiR6jnUu7QY0F2cGA0y1EVDMLd8u072atJzZwtmKsCWFrS3RLgmfh3JM996Ho7xxEOqjq4o9V/Tn+A9Xrq3XHz1wxwawhGaBhuSD4jbBMTw+E9wFg7getSyRAUq1czFoTm9fXXl+QZjEH7W15788gmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Na+XqpLG; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Na+XqpLG"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-aaf3c3c104fso273106666b.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 13 Feb 2025 22:14:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739513655; x=1740118455; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=E+zHukzTxoUAqQh1pniz8wv7WSmBiWd4YYjBi2Wtb9c=;
        b=Na+XqpLGWcI+DhFBWBNj8ihX3QXlbhQ7PWgqxkpSpXNDqQ7cyzcARnDBQ6OeTzqT8q
         Qo6IAHxgXcX4muL+yCs3x9kmHzqf+PFkIoLYesZOJrZQfYPCSMBlzHDLzFTL2ujvkWxB
         aMGsBAlWvxUr3PSoQDxXgGrgZCYSPVLWLFM1WTptbZNj2Mu1ELYD8+ZVzoAsrArbHmJe
         LPLD6Cwyre0y5aTZfmQZOrnC6Xtl575jZgAXw1u2imNWFV/CBOXFnDBP/zSkGFquCI1P
         jFh0Qw2QPFAEsBd/CWxFKITxtGy4Ga8K7/4EuTjdn0WD3mVOXNvmiSVNhOQDoZVgCu62
         fDUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739513655; x=1740118455;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=E+zHukzTxoUAqQh1pniz8wv7WSmBiWd4YYjBi2Wtb9c=;
        b=sg9hot4OwHCblql85a+TGgcSknxCnSpLR0WpwlMsyrAbSu6Dr6+LIqcEBFv6IYJdpG
         GavcCIrW6lLXxvP2+lvnIggDhz3uGpRocgoaCgbxMdvGWF8qc639nUoSmvDRPC+K+guH
         L0eBSwFW/dVAiUMIRJ1xPyHVBEz1INdCjDdLH9Uv1oaGeDKyTs3vQiwZ3on7FCNaRjsn
         2vxwng0l8sEAIqRK0PKZKAGDkgQE4/E/qGQn4FYjv2lK6BNYqwSFYV2rLruqVglLufly
         grgvszoIrKam4/jXrE3CfLxbmMDaCjGbfh86YWxZbfgSCyndEw75ZubHbBqUUZn3dAAv
         H/qw==
X-Forwarded-Encrypted: i=1; AJvYcCXRIRSS7S1fbPlyLg8uf9ggrVAzmTFlzDz5XJU+8VhIOSCqLJsX3D9Vr8HWhdDrv9WkLmRSpip4sEy1uaFYJtGWTg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyq4jVdn7i+DlN9NK1+w3cTB/4rXwuYJXeiI1M64tmFO8DhdOFY
	M6//pDdXZGphE5paNtS1/AuEwWuY/QI0nMVsVPzLNqAO5VqrBKlvWfgA/WQmkTE=
X-Gm-Gg: ASbGnct6g0+ycxhKzTOEkgkPABb90MbZ65kFVE+4WSCee0DRVDSqcUTFLYq/xZzdfkW
	85vi6fC4a7YejhUN0IdbkTsdz+nHvsLQA7roC9Bcut0LqeW98Wkhss9DA5OKFHDSHTaDTN3K/Hj
	DjH5rm/6QTBJz6/VAkHCADVcB/HOzf3WFCfy9wWG4tojVQRpg5NAnnw34D/9v4eNquviiY0bLFZ
	6iIPKFfICqSwHS+BlLI/XySz5721fsTG3evdfQwIqIDnS13W85Fl20WyHhNcwoyZkUwK8VLySUS
	+22KhA989NrKOOxGnVA24OGQ
X-Google-Smtp-Source: AGHT+IEmV/spFwDvPJBmBni+qOvQYaJLBVXLCJxYkFEXGyz6aAo+8zl5YqR1HK+HjXkmRorI/a/vqw==
X-Received: by 2002:a17:907:724c:b0:ab7:d10b:e1de with SMTP id a640c23a62f3a-ab7f339c868mr973175866b.13.1739513655453;
        Thu, 13 Feb 2025 22:14:15 -0800 (PST)
Received: from [192.168.0.14] ([79.115.63.124])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aba532580c5sm276049766b.56.2025.02.13.22.14.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Feb 2025 22:14:14 -0800 (PST)
Message-ID: <f4967c68-d79d-4ba5-ad0c-5526e7e1ccec@linaro.org>
Date: Fri, 14 Feb 2025 06:14:12 +0000
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 0/2] spi: s3c64xx: add support for
 samsung,exynos990-spi
To: Denzeel Oliva <wachiturroxd150@gmail.com>
Cc: alim.akhtar@samsung.com, andi.shyti@kernel.org, andre.draszik@linaro.org,
 broonie@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
 krzk+dt@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-spi@vger.kernel.org, peter.griffin@linaro.org, robh@kernel.org
References: <20250212191241.280-1-wachiturroxd150@gmail.com>
 <bad7b5b6-c61b-4e93-9415-6476976c8e81@linaro.org>
 <Z65MYSNuDdCFNlv6@droid-r8s>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <Z65MYSNuDdCFNlv6@droid-r8s>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 2/13/25 7:47 PM, Denzeel Oliva wrote:
> Yes, Exynos990 has SPI nodes with 256-byte FIFOs, and you can see this in
> the downstream kernel. Here are some relevant references:

thanks for the references!
