Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFE931D90DF;
	Thu, 24 Jul 2025 07:02:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753340526; cv=none; b=t5CdI4/8Dey94nTQwV1amcYH8p+BQ+oIj84NL82diKK5v4UGSGUIbfyXTfFr+686oHcX8FnbghHzcjsb0wN9vrlKb0+cc9CW8yo0uzCKBMTa/dE6fy9ucMA/tVmDe9mitLULwltPzFP+Drui2IPstMsc48f3jqkDtlg2338jCGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753340526; c=relaxed/simple;
	bh=Q1vmtZhAqt5hBWwprbn4CUB66zCHOr4Mx+OTWP+3XfY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VOlXn/rTNp3tzIYFtqiqetA284TEJFdStcJr1kopUc0bX4Hn82Cj1mELdRalqyMBhFTahb5GfILSNzGX7vP5PZn1oU7Zr4uUqVpFxwxkG4/92OeIsYhALkyQ76jBbWw5wVRstdhyJ1YZAuLun9r4g/XgXAvVYX9i6VMq3daAYkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IHhQzT5t; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IHhQzT5t"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-451d41e1ad1so3922795e9.1;
        Thu, 24 Jul 2025 00:02:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753340523; x=1753945323; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OlUtBVs7mVLIbrf7opyOhCkogChwruSdb2WYQaTp8x8=;
        b=IHhQzT5tv8vxbf8sD6m53LbpTHESgtH1SXAUMNK4KsScItaIgGGiWoZs38aW+fcczr
         Jyl3E6AUcQVBO8BFHGrHzSvLSR4ugo7RoWae9rL7NPzPDYr7tAgMEROacHxNK9aAWdhk
         3UaSOscXg10DbJ6YRLYc/vvwicRO3FXB0lGYLt+qoSIekjnq1t5U/M4tx2w+kwAjzfEq
         UyIJBb4bJ5oEv2qOafjbgJwvGpQO9dC4jPyyB/V42EcnBaqF027xRW9mwOdU8eqmMkh3
         L1iId5isIBqjnO38jH51wtqwEI6/xiLxwd3E7EzKUSP//JhGGXjsqXWXv+i3N4stpFCm
         Pbhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753340523; x=1753945323;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OlUtBVs7mVLIbrf7opyOhCkogChwruSdb2WYQaTp8x8=;
        b=NQ6Yombh7U9Y8/aWCd6E3b3G3mwx6GmK9PWh34Ou3lABCSXojEODVLT/yMeNyMGekw
         MBbWsBPU0n1WsHkRTcjNmSD6SYLqY7zRbSShGbRHLIi98pCZQXjWsg5CDIeqVf0++p1V
         z00BFO9hrC38NIXaYSSnim6ud6JIVDmmjA0j2qjDc0wcRSFAg43xEhnThrqJYrLNZhH7
         WnYdXA2Xf6L3WmgYd8R7zs4AoNT6bEvJyFmYMYsX3dCXgaipn3TAgVswldqjS0syOywu
         f2A5FQppEU29vo/u1MrCMXusG90zZedI2anHVnxczJxGTbjlW+LY/azSJL6K0I7P3/3e
         GAVA==
X-Forwarded-Encrypted: i=1; AJvYcCWOZzZmug5Z6JQ0DHvfbJOGz/yNFavbvZScVGRw3h3iJpLWDwh51t2+eEKhrfAVYOaporooETWZaSb0in+47GZdo7Y=@vger.kernel.org, AJvYcCWP281iLAlfWEfACXGBub6Ip/yLTLyJALyDKn3+SNu1DmmHeG7UQKa+Ieq7kPodhJbCiseACuXqPZ88/gGT@vger.kernel.org, AJvYcCXNu5G447LyZRKbczoQE4EIrCTNfhwQKq832hBJ2TDSUZAZPEZurOjLsjl6cP92TGzCVyq9PabS4cLG@vger.kernel.org
X-Gm-Message-State: AOJu0YyspxIFEgyGf0GKpdYFGL6hE2sE5mXyQMYyLnZpeVhjlU2/ixFH
	Ri6pgPurHVgCSo0BGzqSnf+JlwD12dgO++ohUG4p8y4JzaZDnLM7ZJbs
X-Gm-Gg: ASbGnct6+//xOcaNdMj3Hu1+Dv5IjtJosyIlPpNzUo9WxpQHx0/B5DP6Ig81rquHb3y
	sRGcVYHp4HAunUPUMKLV5T6pu2ZCAYaT26ACP/rm3Eo+r3f6PJCpAkYZd3GjXNdj+mpUPKN2sWt
	1NH5hykt3sOLXicvHcyooXcM+HFEXo7cY5G7Lj9ABO2DUSAK7gZJ8qIZDJMskYmedr6nliH/zPc
	ycZUrIhvy9xJ6unz52Qi4ZrpHAjr8ICzkCzsoHjXUyw2nmO0xzNHU/rwFVZZthnZwLvzG0gUvvw
	cYyS+i0NK56xhIRpx20LxMlXUU5VlVTR2yJwdrSMRvt/8RIl6msRV8rXKRb5gszS8sT8WSp0ccu
	eALa8x07kMF0OAtlIa2tWcwW0XCckbTx/zh0+4mi46/b2vwpr4eV9ZciLuRUqCwF0pNNEfGg+/2
	bENFTM6kDJqKY=
X-Google-Smtp-Source: AGHT+IFGy6HODxEH7/PmTdmL1a3/zjPLMsIBH3rq+Xq0Tau9JAc9/MY1EEnrW2AphA2h+4ON6UFPxg==
X-Received: by 2002:a05:600c:a408:b0:456:1904:27f3 with SMTP id 5b1f17b1804b1-45869e4b95dmr39641815e9.18.1753340522595;
        Thu, 24 Jul 2025 00:02:02 -0700 (PDT)
Received: from [192.168.1.107] (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4586ec79441sm9982835e9.2.2025.07.24.00.02.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Jul 2025 00:02:02 -0700 (PDT)
Message-ID: <cf7030d4-a686-4edd-9698-1a9c301d1dd0@gmail.com>
Date: Thu, 24 Jul 2025 10:02:00 +0300
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/2] dt-bindings: soc: samsung: usi: allow 64-bit
 address space
Content-Language: en-US
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Sam Protsenko <semen.protsenko@linaro.org>, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-samsung-soc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250722121037.443385-1-ivo.ivanov.ivanov1@gmail.com>
 <20250723-hypnotic-malkoha-of-trust-9efdb6@kuoka>
 <3e1d7be9-e99f-41c3-8b0d-aaa426aa9de8@gmail.com>
 <fbe025c9-2688-49f1-bd94-2cb0a1bbc8d2@kernel.org>
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
In-Reply-To: <fbe025c9-2688-49f1-bd94-2cb0a1bbc8d2@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7/24/25 09:56, Krzysztof Kozlowski wrote:
> On 23/07/2025 10:21, Ivaylo Ivanov wrote:
>> On 7/23/25 11:15, Krzysztof Kozlowski wrote:
>>> On Tue, Jul 22, 2025 at 03:10:36PM +0300, Ivaylo Ivanov wrote:
>>>> Some device trees, like the exynos2200 one, configure the root node
>>>> with #address-cells and #size-cells set to 2. However, the usi binding
>>>> expects 32 bit address space only. Allow these determining properties to
>>> So if USI expects 32 bit, then why do we allow 64?
>>>
>>> Switching this to 2 means you use 64-bit addressing for children
>> I don't, but the main point was to avoid defining ranges for every single usi
> I do not understand your "I don't", because you do.

I meant it in the "I don't _need_ to explicitly use that, but it's _nice_ to have"
way, so I don't have to clutter the nodes with address translations in ranges.

Best regards,
Ivaylo

>  You change the child
> address space to 64 bit and switch to 36/64 bit DMA. That's the meaning
> of address cells 2.
>
>
> Best regards,
> Krzysztof

