Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2A42745E7
	for <linux-samsung-soc@vger.kernel.org>; Thu, 25 Jan 2024 15:56:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706198210; cv=none; b=bOwkYU/CehyRHro67nTZKnfF3pzZCeC7CEbdUetUu52ixcrn+TFTap+PNkJEOl5h2hhknrTCx3NwGfm2IBSjauSFRSKEY5T9/sZ27QRN3GARO3rzgUD2jnr1/6VDw3d0DZjT686QPNAglfZrxufR48BLgroTcLBBMbQ3ttrq0GI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706198210; c=relaxed/simple;
	bh=juRKaRMDv4cbltizqT0zFF5a8XSwtyov/hSi9Hh0SqA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=I9m4adxMpoJ2Ba7wsMBUHSmDIzUs68RQmpFSL6B5Navujjn/qnO8weYHKEcYakoe25h7PYjkr1GUuZHz/uihXkZxTjuktvWAE4JmjdCipM3IWZeHh+HoiS19OfLrrTirTV3z1ggWt+rUEAEAClGQahXz1dagsW+DCtesSmf4Fkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=a8Sp4HtS; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="a8Sp4HtS"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3392291b21bso5833320f8f.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 25 Jan 2024 07:56:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706198207; x=1706803007; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=n5KW3cGWOologfkUAtnPYUm4hK4xuDwJ4A0oJbDxe8Y=;
        b=a8Sp4HtSuutWs7ootURVVXs7Cw+N3XPK/SBGfMJa5U8DQU0uaEEXc7OyalrZIerVgh
         bzF+6ni2Dzu8AvMjkc25jxemSj1aP+r5MGohTMoy9yOTVm3xzGHHiCWNcZYi6IL7DQ9P
         UOacLXG3B6mwKuK2pv+AehrHwJsWp9BlXD+Rdnw7f3q092xa2xS3I4d+rRfHZn8e2q2P
         /e2Rmv9x0yFe6T3jcnY3jAwrT34NCFsA+TaTRi24bu7vuKGq9ZHNzywz7UeuRf+9s73c
         Nn7VUYJm1ISVjvplvgQhMhbtETfnhICBzvYCyrQL/BEIYTXhRR5MkOMBF52+c80zSJdU
         EYIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706198207; x=1706803007;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=n5KW3cGWOologfkUAtnPYUm4hK4xuDwJ4A0oJbDxe8Y=;
        b=Az7687It5kJBRoTBnqWDhiDPJtvo6RRU5yW2eeIRlqMDUG3ULXqvpwYOvU+3BE9nz1
         6uNQRQ1YOGl0oTYlDNOkDCMN+de+ii71iXkgbQMI5Q58cNvZ3kc/tW3ifbjVt1PxMPI5
         MGhHmGnjWnJdfyma92pCgh5GIkafR683I0EOoMjTbodMMusHbOUWRi2gb5nEPlWlT5j2
         lpfI7f5ix6r+k74Sp+vcexs6jYv/kwowneICa2D/JICLGD3A3f63R9RSjH/7wsuAw5/q
         25JEkZ/wazR7ZNgn/HafIJUGG/qNUT+7cOaOODaAhvzRK4B/6I3MB0OW5j83/tGQfPGK
         kxQw==
X-Gm-Message-State: AOJu0Yx58Bkkt3Z9B/xdHDYXoG4MsvkdNeV2rBZPxvQZCOobnlgG40p3
	mtXvvNl6HoPWhLlqPdVDjTd3LBVMQhJZhe4YiKlPJx0z0Ac0xQM+0wRzYHBNmQs=
X-Google-Smtp-Source: AGHT+IFPfTqnSRv5OmTbnRNo2YdJXXj+rIyKtLlxPTVuohq08LFuZui3s4qdRTru4THU9byyitLVLg==
X-Received: by 2002:adf:b1d4:0:b0:337:bfd8:e94c with SMTP id r20-20020adfb1d4000000b00337bfd8e94cmr4388wra.55.1706198206858;
        Thu, 25 Jan 2024 07:56:46 -0800 (PST)
Received: from [192.168.1.20] ([178.197.215.66])
        by smtp.gmail.com with ESMTPSA id g18-20020adff3d2000000b00337f722e5ccsm16485821wrp.65.2024.01.25.07.56.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Jan 2024 07:56:46 -0800 (PST)
Message-ID: <a355b700-44e0-440b-91b5-c41af7953bfc@linaro.org>
Date: Thu, 25 Jan 2024 16:56:44 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/7] ARM: dts: samsung: specify the SPI fifosize
Content-Language: en-US
To: Tudor Ambarus <tudor.ambarus@linaro.org>,
 krzysztof.kozlowski+dt@linaro.org, broonie@kernel.org
Cc: robh+dt@kernel.org, conor+dt@kernel.org, alim.akhtar@samsung.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, andre.draszik@linaro.org,
 peter.griffin@linaro.org, semen.protsenko@linaro.org,
 kernel-team@android.com, willmcvicker@google.com
References: <20240125151630.753318-1-tudor.ambarus@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240125151630.753318-1-tudor.ambarus@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 25/01/2024 16:16, Tudor Ambarus wrote:
> Hi,
> 
> The "samsung,spi-fifosize" was introduced in the following patch set:
> https://lore.kernel.org/linux-arm-kernel/20240125145007.748295-1-tudor.ambarus@linaro.org/T/#t
> 
> I expect Mark will provide an immutable tag for the bindings so that it
> can be merged into the samsung tree. We'll avoid this way using the
> property into the device trees without having it defined into the
> bindings.

No need. Any merge back to DTS branch would anyway question my pull
request to arm soc, so I am not going to do this, unless absolutely
necessary.

I'll take the DTS once binding is merged to ASoC, so everything will be
fine as long linux-next is fine.

Best regards,
Krzysztof

