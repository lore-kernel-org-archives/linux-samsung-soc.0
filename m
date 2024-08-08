Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72EA0189F50
	for <linux-samsung-soc@vger.kernel.org>; Thu,  8 Aug 2024 09:57:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723111029; cv=none; b=DMUQK1az8P15/EpuKXmE6Wd27STt9M1/1VkmX8pG7XGJl9JqgvYlABdF0e4sG5ACVjL8NOFW61ZbDHepc5VQFIgEVFcin6/Mq3CRsceT09OFlQREZp/g4Y4BVahQutFe+P7n9ngIWlbDDCJMckUEE+p8EPzjpj4/ubgajR4iqOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723111029; c=relaxed/simple;
	bh=BCc3JMeiVU/pbaDkOckj9tlDKP3uaM6hbtGH0PHfALk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=T9MmG9jYQ3jLko40Ygn/ZJm9yKrfotU5vm9GxTumg0FjyhO0GtJ6sSajjEoERQquyqIolK94uEFn9gKQb5I6exEyRqwYn0CX7pLENs5++GiYncO+rOpRX2pnwPOVbKNtER7Flauh7wtv1SU20qlGYEI5XVWJHp1EXsAZYOGdqOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PA9KRask; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PA9KRask"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5b8c2a611adso989886a12.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 08 Aug 2024 02:57:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723111025; x=1723715825; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=wGmpPT++dxS0VwVrHHvITcmSKbRjA6D6vdhXmz2ZdyI=;
        b=PA9KRaskFT/E3zHE3icU9Ueh/Am7h3ywvXbUpwEDlsHvLWHOYlebcFw46IvCkHP2oT
         wKqOa7xucEy9b47+3BJSxrhWVn8iCWFSSSOYM/XdILfVCnkt/WuUutfcK8SPjTg5l0LE
         PoLny+iqGLv66Qfk4un5cW83nNMAlxb4CxtUbdlFqfep4XxtST5BnLKaG9zoGflgAvxN
         ArWHXKhD9w6ELV9k6r+voHLA1gd2pxMqRlhuAVRsVkgR0H6y2KGD2Do/IB+QoYyyVVL7
         nrZvW38TEI0x2DkMghXzMkSKnlzIhEXLRPtwcrjefxznwNdN9vkBT83IKpfs0hY+B8/e
         o9mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723111025; x=1723715825;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wGmpPT++dxS0VwVrHHvITcmSKbRjA6D6vdhXmz2ZdyI=;
        b=BLYa8dK8ieUb0ctESMQSIKwpQVFGV8ZEIwnfnacEK84RI/Pm7QDw37IJln7kuzaDog
         FBOmDxpyo576y8+DnFkixHCdThPVohQvmSjuXVDdoibNLNErwAI44+IzpT4ZJV9pwBYk
         +blgHdiiOZHXRovm9haqWEZka/15iVZCza2WMReElEsZvoMdgTWmLJ+U8fxilxE8sn3E
         qcV/HPUa2P2SYTmFmO06+/A/aCKbVSUDXqnrOSlC2n0e+XSnQ4CF16gAnqOm2ga5Pb2O
         lsM+SECS3fRQ/0VHgYVrQbhU5tvoDOUUijfk0H+VTo2rjCVVcKa0vhvdQOISjJo04Sx0
         ytcA==
X-Forwarded-Encrypted: i=1; AJvYcCXfOOcTNzMD1bQtn6YN92Wgtj8v6H+Ni/dQzYgsx2c2DqoD/Y0+rQWjvVAHeHXbQt/eetSfV5i2ibp3JgHbBq0InFbbE30KHca49XKirEDD+cs=
X-Gm-Message-State: AOJu0Yzp8pzG0daYRVQ/ExN3khVIkO1vsCJMeSw+8ui2pzdfH2Jq0INO
	G1z75sHiN5oI2XGtimp9EhtXzYlvJpRVAGGs7XdI1r2ScvQfr5qAsluTiBKn1IC2lLDmhGrcoo/
	x
X-Google-Smtp-Source: AGHT+IFe3lArDXHLFN9+vIQ2xudce7dStaP5T9pFhGDsyWTJCn+t8VuWCIKjDVbHkGDtMuboeY5P9g==
X-Received: by 2002:a05:6402:35ce:b0:58c:2a57:b1e7 with SMTP id 4fb4d7f45d1cf-5bbb218daadmr1093950a12.8.1723111024719;
        Thu, 08 Aug 2024 02:57:04 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5bbb2c41ec9sm490339a12.42.2024.08.08.02.57.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Aug 2024 02:57:04 -0700 (PDT)
Message-ID: <4230387d-0413-4da8-b55a-ac708af05e34@linaro.org>
Date: Thu, 8 Aug 2024 11:57:02 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3] dt-bindings: media: s5p-mfc: Remove s5p-mfc.txt
 binding
To: Aakarsh Jain <aakarsh.jain@samsung.com>,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Cc: m.szyprowski@samsung.com, hverkuil-cisco@xs4all.nl, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 linux-samsung-soc@vger.kernel.org, gost.dev@samsung.com,
 aswani.reddy@samsung.com, pankaj.dubey@samsung.com
References: <CGME20240808083027epcas5p153e64139a5e71448b1ea3f04af1df2bd@epcas5p1.samsung.com>
 <20240808081815.88711-1-aakarsh.jain@samsung.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240808081815.88711-1-aakarsh.jain@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08/08/2024 10:18, Aakarsh Jain wrote:
> s5p-mfc bindings to json-schema is already merged with
> this commit 538af6e5856b ("dt-bindings: media: s5p-mfc:
> convert bindings to json-schema"). Remove s5p-mfc.txt
> file.
> 
> Fixes: 538af6e5856b ("dt-bindings: media: s5p-mfc: convert bindings to json-schema")
> Signed-off-by: Aakarsh Jain <aakarsh.jain@samsung.com>
> changelog:
> v1->v2
> Add Fixes tag suggested by Krzysztof
> v2->v3
> Aligned Fixes tag in oneline and corrected commit message
> Link: https://patchwork.kernel.org/project/linux-media/patch/20240213045733.63876-1-aakarsh.jain@samsung.com/

Something got corrupted in your changelog.


Best regards,
Krzysztof

