Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C156125C8
	for <linux-samsung-soc@vger.kernel.org>; Mon,  5 Feb 2024 07:35:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707118527; cv=none; b=HZotuBPEhFUgBz5eY4ld+ZZN8geGp7RSfxDAAbrQq2gCSOYKDUtYB4s2r+TBFvPVB2cz9/Ea7n3C/YZ6PG+f5PcQpPjs7c0UJAuTeqXF3hLkbmKF/fXSUJ+3lQ6kuX0vAj59QSYvic1Qgq61ZzM99HkHWLD3G1sdG2CwO/OdwiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707118527; c=relaxed/simple;
	bh=6S7y18vY8Iy8eXyY8FFgMpmPsFmV4cNKMjjL9B/PAoE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oZWiLaVF4yYXNlUjMcTRGaaKWuM0YRQnFJXwJVpemdw8xyPOePGlx7SlxgCCmgtsyjVaceH0J137+LRXuNNvcmEuxczecFd1/i/v3jx8VQs4cSRMGeSGimEyT1GQir7vPakb8rRE9WD4pCA52EVGWYn+P2OEivB5QufwesQ36OA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VgWWP39s; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VgWWP39s"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a37878ac4f4so105276666b.2
        for <linux-samsung-soc@vger.kernel.org>; Sun, 04 Feb 2024 23:35:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707118524; x=1707723324; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=a9+PxViUSEbLXsStOZXQtUAqR68q0lKskK6ai3PMNzw=;
        b=VgWWP39sQXHsyx2dhjfCeD7zes0lk8NmT9niPsDLwSTK/qUmSe+wYLmCpxwnvmF6rT
         BSlUJ27I9CRcr7W8tL9ELwZW/Tc9DmFe7/HxwKU5b2uHxP6a0Sf3egWH5a2kZKHP77E5
         BPH0RwEGbTEHLzSEFWzr1Ec/bqTZTay0Knhn2qQiZqNDvr6AEpG5SNcyqq4GPr8pF+Ic
         OT6Ak/IYZbBr+YYWIMcTtCQaN3+fIE2wGKwggPWzRtv0R2cdx87vhxXd73CPTdVzoZft
         zZthjz/xxsdni/0MaDLmEqjv91d40HeTFSA+OWYaP1thsVPkCC7ONsAAyFRXMvNCX7PU
         y3ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707118524; x=1707723324;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=a9+PxViUSEbLXsStOZXQtUAqR68q0lKskK6ai3PMNzw=;
        b=iHn/VfCK4zxc0f9XXV4G2DD4PB+sD5jL4AK7M/f9eln9CcisceU57l6sQmdK/WS1No
         2wo+xmV58EtBKOisUKn/CA541hRfcv6D6YpFjw42UsOa9C+Uxs7shsox2UFHvcqcSqPW
         6fQxnvADHOTGKEGUbfFivWp+zkm/AICalAGqlu9qzVaxSiSxWw3Pz2BiBGb14utyph5Z
         IJB3VcICf2jIRjE8V0WrdbJXFrdP58SurO0yLSvHCFW8PGBSvFMbNKN68trhQaIGJmr6
         PzSpjTHWfKTqcTViLyBo1mk4SNaf4f6bgOgfb/GOkCRflCkVAYjBrUY5vzyWxg6YjCDI
         fvJA==
X-Gm-Message-State: AOJu0YyVehcw3YIhMIdflMTB78xiPmC4i4WRg7IRfPKwBMPxFZvGvx9f
	2Ymrg83IUH6Txhbk9qc/90OkLEyRe0MN8L1X7mHz5XM1XvNnONoyShGAWXxctWo=
X-Google-Smtp-Source: AGHT+IG/StZbel1XNo7TbbrHmi2SzMUuWcmAKJzOFuSRjRD760yPN5VdX20Iku4LxofgcK656hPxSQ==
X-Received: by 2002:a17:906:ff53:b0:a30:f4a2:5688 with SMTP id zo19-20020a170906ff5300b00a30f4a25688mr9402604ejb.1.1707118524344;
        Sun, 04 Feb 2024 23:35:24 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCVwiP8+DCyD3PxjgRywI3kiQGWWPy5TvE7QFh0s2cdWnZUisWsBtQ1yuivlYoFKSjqzlUilmV0vxoB1AzHqxk50Vp13q/ji9L86BdEnkN1s2+Mdct046m+RCOyOE0pk6TPgYqonwRIU/Kjf+DIWo522O15bLWnNW7ScPUuJeDxRwdRscWDtUed4mMkDUThcg9LqEQnJKXWfFblkq0FMGo9d5w/rMMyR/m7V6mwNciBtL57AFT43ekNrnoL/
Received: from [192.168.1.20] ([178.197.222.62])
        by smtp.gmail.com with ESMTPSA id hz18-20020a1709072cf200b00a37c745e385sm623575ejc.44.2024.02.04.23.35.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 04 Feb 2024 23:35:23 -0800 (PST)
Message-ID: <792c737f-cefb-4d1b-93f8-c1d2dd2573f6@linaro.org>
Date: Mon, 5 Feb 2024 08:35:22 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm: s3c64xx: make s3c64xx_subsys const
Content-Language: en-US
To: "Ricardo B. Marliere" <ricardo@marliere.net>,
 Russell King <linux@armlinux.org.uk>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20240204-bus_cleanup-arm-v1-1-41d651dd8411@marliere.net>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240204-bus_cleanup-arm-v1-1-41d651dd8411@marliere.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04/02/2024 15:46, Ricardo B. Marliere wrote:
> Now that the driver core can properly handle constant struct bus_type,

Is there any dependency?

> move the s3c64xx_subsys variable to be a constant structure as well,
> placing it into read-only memory which can not be modified at runtime.
> 


Best regards,
Krzysztof

