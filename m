Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC0FD21421C
	for <linux-samsung-soc@vger.kernel.org>; Thu, 12 Dec 2024 17:53:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734026009; cv=none; b=DX2JjK4T+qbjiGypUQSGTcdNgTloIxgL5tmS+jbaYNd/2kHdXBEg+gSJwmJZWLZltybFzbELRNS5w+6OJ0uXZMlAiFFMQ8huM8K6ZRr0sVcVFa73HpPunZ7BTO/nt25q3vNILfq2omvfOxgjCRGjSyK8PRxuIA0XEutom03Uffo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734026009; c=relaxed/simple;
	bh=L1WIsAN43K0HrWyRNBVugjhyMqQIDDcbptHMdI9LmpU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gJW2hu9bfZy3fdghvlH3ZQRF1ajB3UB7YjjpZg3V2/Xna8M2HFbWktIOKGRNfnbeykrtGh6qKjuNNTjOZP03FwNuMBUCa/0gcZh+w6p0o8TM3tnttKk9eJTmSNHnDsDrXMkt4uxBXgefGm5ikpn+x1c6BqhNznf9EWTvlXLb038=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=X22hr0hd; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="X22hr0hd"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43622354a3eso6761375e9.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 12 Dec 2024 09:53:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734026005; x=1734630805; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iS6863oeUmKqOBJ6Lt6qSkxo7yA97VcWeLWD1WZrtzQ=;
        b=X22hr0hdNd8aXkUVp+WtJyUuzD4SAipx0uWml0HIhp37uoHN76hJOm1PkKx898H2w/
         7pWgVgGFjRJDZowXkPAZge6dDSAXNAGAS5vHMncu2XfChzY1QiZcfQaT3y+k8yXe4WOJ
         8WX4zq//cG8wYCxTXnRQ3ytQAlgWZtky/xsIlUXuya2BGRT5C0XIdZ4+1qy1iGqZdXXN
         vjYVmH3G8TSXSC2mGeQiyzsErJniuvFleapuTJGfYdCYbrlsVRmK12R7jjTMFdjOYpdx
         UxXtORCSPqrvpj+/CO1xq1sXANZazkQKCY5xnugZngI2DqtEbEsMphu5lbMvLYW0/Ypv
         mIXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734026005; x=1734630805;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iS6863oeUmKqOBJ6Lt6qSkxo7yA97VcWeLWD1WZrtzQ=;
        b=DVl3I7eQC7eLZc22OOo347kYYnd3qNj/uFVodNauuqs+rR0kyFxzsq4QrB7pCPvpI7
         igAH11EP0cwddW4VqBaNlOzib1/U2w5iBMDZVFpt4Amtsecm4Wyrd0rDf6N6UXSI9gYp
         ValJu3A/c7BAGxjRzZ9J4nsyS1qFJhDxz3Loh5ALaNr0UsHSW57rmU19+SNryx+9B0mS
         +ZZqmGvj/8gcMX/7mV1D5Rit1+FFsVtD+CM1fRLIIKv/OBfUCirrgGfI1pqYHBU2nIdH
         D7cS8jNBdwTyYyj+7ayk+yR9qTSmItIdje5DpoWlL+63Qxa3fI32W6ejqWPmAR8idhxh
         JfIg==
X-Forwarded-Encrypted: i=1; AJvYcCWosJjTsS8ezIc5lkVa5cX6yr0jbANvxcaVSOIlfhiON7q5HC6fQPD9RZ7h0OjDW4uYJFsd5Yn30g7eJCQNav49Cw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwXX/pa8Poj5C7W1clAUgVb+LYRQURUe0qSBUMTr/pCkd3XUQQ5
	Ddu/+l7hQs5F5R3yf5Q9NJ6Tvy/hlrVg3rxjqWgqfWSqFy7jn8U6bxlLBMu24r0=
X-Gm-Gg: ASbGncu2x0NxKZIJWW7jXYIVmGSsNiq4cKKjrb53MFIuwMr0IQkQzPNMeBfZH/IqFRI
	1EcYJ02jUssoI0Wd4vpjivBmp00TH3mVB7wJY978/AHBjD90HpBPaCVhMFkwE+W9CLlR2uvEpo8
	g8TXgP9xE81zqxhjnsJiJ42wyFTvHu94ogd+CfyYveyIcwXR8uzfq8dGhiIr2kNpOVkD4WbJDZq
	Hxg/vUtToVaIBk8xFRibbXovWZaAy8582lxSIEruAvaN8HVsk606sroj3iNcYDn
X-Google-Smtp-Source: AGHT+IFRGvN+/sW8H26flYvrygsp+C9djqkNOUFxuOEJhm3v18/iBNpicIZcLpwU/7AIFCb9hRvAuQ==
X-Received: by 2002:a05:600c:1c14:b0:434:ff9d:a3a1 with SMTP id 5b1f17b1804b1-4361c396c09mr67357115e9.2.1734026005162;
        Thu, 12 Dec 2024 09:53:25 -0800 (PST)
Received: from [192.168.0.14] ([79.115.63.27])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38782514f29sm4767900f8f.77.2024.12.12.09.53.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Dec 2024 09:53:24 -0800 (PST)
Message-ID: <90720b8f-340f-4f27-ae51-df98b2e5e820@linaro.org>
Date: Thu, 12 Dec 2024 17:53:22 +0000
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] dt-bindings: mailbox: add google,gs101-mbox
 bindings
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: peter.griffin@linaro.org, devicetree@vger.kernel.org,
 daniel.lezcano@linaro.org, Alim Akhtar <alim.akhtar@samsung.com>,
 Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
 willmcvicker@google.com, vincent.guittot@linaro.org,
 kernel-team@android.com, arnd@arndb.de, Krzysztof Kozlowski
 <krzk@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 ulf.hansson@linaro.org, andre.draszik@linaro.org,
 Jassi Brar <jassisinghbrar@gmail.com>, linux-samsung-soc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20241212-acpm-v4-upstream-mbox-v4-0-02f8de92cfaf@linaro.org>
 <20241212-acpm-v4-upstream-mbox-v4-1-02f8de92cfaf@linaro.org>
 <173402453635.2828943.15564980222849076434.robh@kernel.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <173402453635.2828943.15564980222849076434.robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 12/12/24 5:28 PM, Rob Herring (Arm) wrote:
> My bot found errors running 'make dt_binding_check' on your patch:
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> Documentation/devicetree/bindings/mailbox/google,gs101-mbox.example.dtb:
>  /example-0/soc/mailbox@17610000: failed to match any schema with 
> compatible: ['google,gs101-acpm-mbox']

ugh, I remember I fixed this, compatible in the example needs to be
updated to 'google,gs101-mbox'. I'll send a new version tomorrow.

Thanks,
ta
