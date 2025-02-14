Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECBD2205AA5
	for <linux-samsung-soc@vger.kernel.org>; Fri, 14 Feb 2025 07:10:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739517028; cv=none; b=Ez1QzuH8+J1A3bt2jy2JL4dXhVcABMKP6tuqeQSuRElRcj5K/plEA+rqkJdeddI/RjrxYaRwUdDo86Wqo37D6IVCBghvIT1wtQye9g7wCp3s7uPOPalFmOCJq/Jitrg5klxhjX+ZJfA8IeXZ2UrDjOef09gCwTmTZEH5/RThkA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739517028; c=relaxed/simple;
	bh=MFTdgdlExpqx8TY76AlrGCz5tN5VnT5stMEnutUk1/E=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=XNWKBP6yJM87phcoW4r/JRfc++8FeVzgkD9YQE8PclSJ7kUQC7bKD6H4eE6F6ahFmEWIWz7eYRwfRMgbYth8takpwNy3iSIa7cTHw7SnzPGf6bbr8LHORsTCM11/Ydu1WA0QcljwZyiK6Hxy1PJZXxvtgARrzuEVL1IgdaDaH6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=O0N96O70; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="O0N96O70"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-ab7c81b8681so306414066b.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 13 Feb 2025 23:10:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739517025; x=1740121825; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=D3KRD6Y81KP0hnKo/0jrjQjgKZ+r4kg7mu+pEFOiLI4=;
        b=O0N96O70xOcPoqujVsaCZ3lujDp61gTywZBB4UWVXCCSwbJbgcG7Q1u9vaPG0rkueA
         0uFDGGo7nMy/Wk64VzGtzeVAc276BMXvGjUWcGScBfBdp9OCqSb77L7kAwlzzEWyuDm/
         yeKCrhzy+acC/rqcfsIT8zqYz//Y9dTNcfWJytgrARVFJQ/l0yhWBdal0s1cgyzTawud
         141cpus2f/j1KzKVfoQt8pmvwxje2ep4wrYGQlf4xe3gfeWt6BkJI5YGaHB0IvLHEbXM
         1VzRRrRZDcJTQR6DaHr3DE6CLTxNL4GWdWSAK6I967XSHbvyEeCcJ/OGyRNVU3o0Zwc5
         8QkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739517025; x=1740121825;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=D3KRD6Y81KP0hnKo/0jrjQjgKZ+r4kg7mu+pEFOiLI4=;
        b=QDMCKqBNn36cTAyxtQNO0XbnEuqRUHz67lXxcs0v6uRhXl2gV7NrB+zp+/Pd7mEqJa
         JGgW3aUnSQ2km1BBORdOUkhkT/GoBf4hSzaZlJ8jTMr1bBzGWEY0sw9dAeivaeOtiAhS
         3GKnhXAdA0RdrXSknYUd1pHHM/HahmwVmKeSM95bIBHdeQj2OBdJKKn1bb/+dOS9Ky1H
         KbHUzOvevfTJNkkBgkXtYVDvI0uSgg1Wmi5jBaeuOYHEyh7a913qz/kbJzdt8dlBfO0C
         rWidu/LNQ2EaEZPsaOdLWvD2huYYQER+/Z7yhX5y5C0DThUj5rO61vOcq4qACnjnCXSi
         4M8g==
X-Forwarded-Encrypted: i=1; AJvYcCUOKlgixzQ36llBTX/aSPcsmgx0y4kXffut1h9APT9MK44DZXwiZH/33yK1VNNAqHy7OZ/BEGAv1UGOTqtSDp6WLQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzdKr7fQfGVnbCso7O+GkVXTMM3h5cxMo++9PhHfyBrdKhTpx81
	gbANQ3y+izyY4cPRcuQZcVSJEQeeRabk9ffVZ++JyLBBIjvR7a7wxZroILtONvI=
X-Gm-Gg: ASbGncsSJK7TQUQ2EoEdp0/7ndwzL+xMlmnzkwlMNDa9Z/ofggzJKKxr/SFML7taaOI
	VDVXPSWEmXDV5K2iHGgJL9j4b0ARKF3N+WPTRrF0+d9lt/Iad9ZTwLaTmBL207nTG9EOrnDe4D8
	ZAuNnwX+aeccjVKsJnZNJvO/x+U2vUBSfseTnXFUf7xT1E7M7pZFQy5L061gJ3e0gNad/4jEXNh
	YmmRBO5bXkbYH6og606cAh79sbQm7P+nRCn744EHUPd8NtSYlz/3uYuBj85h/nPDBfTB8kvasXq
	IqFqw6A3oTfstmqOfVPCXpX+
X-Google-Smtp-Source: AGHT+IGi8WLS5WHEderG6CbIqrMmNonKomIvShKsRt+y2awNKUvUu9Cp4ZCauxABS0cVTnSGyBw2GQ==
X-Received: by 2002:a17:906:7316:b0:ab7:effd:a395 with SMTP id a640c23a62f3a-ab7f389fdf1mr929358566b.52.1739517025159;
        Thu, 13 Feb 2025 23:10:25 -0800 (PST)
Received: from [192.168.0.14] ([79.115.63.124])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aba533bdc41sm279199866b.162.2025.02.13.23.10.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Feb 2025 23:10:24 -0800 (PST)
Message-ID: <12a67e21-220c-40d6-a6e0-64ba23cf6ecf@linaro.org>
Date: Fri, 14 Feb 2025 07:10:23 +0000
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] spi: s3c64xx: prioritize fifo-depth from DT over
 port_config
To: Denzeel Oliva <wachiturroxd150@gmail.com>, andi.shyti@kernel.org,
 broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, alim.akhtar@samsung.com, linux-spi@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20250214043343.263-1-wachiturroxd150@gmail.com>
 <20250214043343.263-3-wachiturroxd150@gmail.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20250214043343.263-3-wachiturroxd150@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 2/14/25 4:33 AM, Denzeel Oliva wrote:
> Rearrange s3c64xx_spi_probe() to ensure that the 'fifo-depth' property
> from the device tree (DT) is always prioritized over the fallback
> values in port_config.
> 
> Previously, if port_config had a fifo_depth value, it would override
> the DT property. This prevented DT from correctly setting the depth
> per node.

sigh. You had a fifo_depth of 0 in the driver at v1, this proves you
didn't test your patches, otherwise you would get a divide by zero.

You can't do that, you risk to get your contributions ignored:
https://lore.kernel.org/linux-samsung-soc/fbd06330-ccf3-485b-800f-83f624a7c90e@kernel.org/

Please provide prove of testing in v4.

Anyway, you shouldn't prioritize dt over compatible driver data, see my
replies in your v2.
