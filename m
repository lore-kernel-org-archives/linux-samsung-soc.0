Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 320692BAEC
	for <linux-samsung-soc@vger.kernel.org>; Thu, 19 Dec 2024 10:51:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734605466; cv=none; b=I4BarJwviQwr5sKGwS92POqgpMdA0icrKgYA2co+kutzip6zsqjoa20fN3VGeqj8bk0U3fKB9Z/rLcajrwVK1eXk7HSvO/RiBL3n6ZEtSJzL1hwqxRyvD2CHJakn6W33JQQe9+gpy13DFBoiiOUhxbb7moNPqLofFsYdxRmdpsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734605466; c=relaxed/simple;
	bh=emwP4RqztVOrkW2c5/KEohCWdgWL/oxDpV22fyZpUE0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=L/x3WEsZAIMiuM+VCgQijJYNwSrL3oroWMPuoLcN/xzw8/K3iYPH863UZeQtYlr09ad9gvol5IUydlniT1s3zFJtmKTHJ4jF6vJMghyorPdQkb6ihLQBnIo6pYQfKJwaOwWuIpsOZhtPIUamUUijNF+BNn/c36RFYo7sXmIVTY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LFEsRBhC; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LFEsRBhC"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-aa69077b93fso87700366b.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 19 Dec 2024 02:51:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734605461; x=1735210261; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aVaHqJdzzc6/RXsrUMqwYr4L9WjHePTtMi55G/q79tg=;
        b=LFEsRBhCgkyWQ/96yNvWMf8r33A0ZZY3AJV5MuiqVatWniXmNy7MQlthDhNS0LPrA7
         B4hbAW+s5+2xEv8NMwIcKESqSKWxwS/Aui0fqq9GZBQR1NXoQ+KbwvSm38ECfOlMNkht
         HLucs9TlwdKyGVG4LqhKGQeQP5FUpievzqj0y8dMIq1n1aoTIQrHSdEe6ZnDLJCcRIYi
         ausjBqud0ApizXDvwPbdChd8f6fs+MroIqylBSdugy3RevqdhrobqsS8KORbuHoZNP2K
         n8NKQShxjaI7UbuQKY3thZ251KzCTTiAOXoCxx8JP2jdN6m2fB3yKCZZLO1Gn9pSTtkH
         cWMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734605461; x=1735210261;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aVaHqJdzzc6/RXsrUMqwYr4L9WjHePTtMi55G/q79tg=;
        b=k2DEbsz8w9Yii5bK8usTbIGFhgpmJQeMneBvRGMeIzgHSvrQ64oGJl3sc05/9/EUXk
         ogdSOpp4WyqzGqs7kWQfL/cSK0Im4bRqcbfTtNEb5OC1cpyWB2GIT21OoCxxt6UleyMT
         +YmSURd0gorzJE71WYwd3U7KIOlQuSKbxTEAWlGj/YuZS1bT7VX5RzZDFOhMHbsqJOm+
         azuTWVwSG/zQoX+TPRxH/WnmcKuaaWrn3p2Ifj6XqICeLToKFDxjPibV18tHYsW7pLBv
         M+HZ+Wh0rsTNNXaWiXfIBVBGBgqIsvImMDHuXvVgfOrYJcrOtNdDHIjRocb51zpRcpQ4
         ImRg==
X-Forwarded-Encrypted: i=1; AJvYcCVceqOaaXKOONE8W4v498m8ngXUs/53Vry5EOhq0oTTsdyG8ZBqRdrgVossTPwQXUi1FDEf8ZOT3l6NUjgpMZtFLw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyRZAXOIVgQv3v0LzclW+1959C5WYxitzdCJrgGekAn+vNtOcNP
	XMoe9hEBjWkahS0m7zDeq1ATOoGWQfKYrRf8H8+0sZTvOgYaFrLYzVAyxmIJm4k=
X-Gm-Gg: ASbGncsVUTpNMKwuvGCsg5TTkVL00oXn5BjV9/Aa8jxllDN8bEfrkkATPN2oOAeR02z
	Q+Bu4fUeWvKjWMYirW1x52LcbfLPdGpbeHaoQTE//WmvvVrNhxN5SK/KifcI1Rd0922g3U8P5mF
	4XcE/Qzng1ekk1srToJiBxwve+HuZXEvmXUvxksd0Yw+1GDNjv7C7nIxcR3L8PDwq5txcKLh9OD
	DBj18XWwU34/50/ZD3vFt3xvJO0g+n/fgTf1/cYzQMlK8/SSgHPYOWVKRf9yXqX
X-Google-Smtp-Source: AGHT+IHBuRkyoQD1EHB9ZmOyTHsx9PCdtAK0b+CCDpTw9RoYQfSOBxBrLbZUs1ESOuaSGAfTefp1Fg==
X-Received: by 2002:a17:906:3145:b0:aa6:b4b3:5923 with SMTP id a640c23a62f3a-aabf47baa14mr514507566b.33.1734605461426;
        Thu, 19 Dec 2024 02:51:01 -0800 (PST)
Received: from [192.168.0.14] ([188.26.61.92])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0f06cf19sm51704366b.198.2024.12.19.02.50.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Dec 2024 02:51:00 -0800 (PST)
Message-ID: <ec3cdfd1-df7a-466c-8581-c9546ca6b089@linaro.org>
Date: Thu, 19 Dec 2024 10:50:58 +0000
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/3] dt-bindings: mailbox: add google,gs101-mbox
To: Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 andre.draszik@linaro.org, peter.griffin@linaro.org, kernel-team@android.com,
 willmcvicker@google.com, daniel.lezcano@linaro.org,
 vincent.guittot@linaro.org, ulf.hansson@linaro.org, arnd@arndb.de
References: <20241217-acpm-v4-upstream-mbox-v5-0-cd1d3951fe84@linaro.org>
 <20241217-acpm-v4-upstream-mbox-v5-1-cd1d3951fe84@linaro.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20241217-acpm-v4-upstream-mbox-v5-1-cd1d3951fe84@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi, Krzysztof, Jassi,

On 12/17/24 9:40 AM, Tudor Ambarus wrote:

> diff --git a/Documentation/devicetree/bindings/mailbox/google,gs101-mbox.yaml b/Documentation/devicetree/bindings/mailbox/google,gs101-mbox.yaml

cut

> +
> +  '#mbox-cells':
> +    description: |
> +      <&phandle type channel>
> +      phandle : label name of controller.
> +      type    : channel type, doorbell or data-transfer.
> +      channel : channel number.
> +
> +      Here is how a client can reference them:
> +      mboxes = <&ap2apm_mailbox DOORBELL 2>;
> +      mboxes = <&ap2apm_mailbox DATA 3>;
> +    const: 2
> +

Revisiting this, I think that for the ACPM interface mailbox client use
case, it would be better to introduce a mbox property where I reference
just the phandle to the controller:
	mbox = <&ap2apm_mailbox>;

The ACPM interface discovers the mailbox channel IDs at runtime by
parsing SRAM. And all ACPM's channels are of type DOORBELL, thus
specifying the type and channel in DT is redundant.

It would require to extend a bit the mailbox core to provide a
mbox_request_channel_by_args() method. I already wrote a draft and
tested it.

Do you find the idea fine?

Thanks,
ta
