Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE16F66B54
	for <linux-samsung-soc@vger.kernel.org>; Tue, 30 Jan 2024 09:40:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706607603; cv=none; b=g/xQHlhwHKKmGRx3BieaM3O3dX5GMNgsSsX10QC1xb/639pyJ7BUm1MNzdElcexSSVsZpE9XwP3aGC1Zl3zRFIG/409RnW+VkHL1XbYcup1Jos0g0/6T1XiVj+KsrU5MEUFobGZSeiTbsblBL2b4IB2vnAHrWSgz7jM4NCe39oQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706607603; c=relaxed/simple;
	bh=sqjBSjiIAiPzVydwvpARikkoctAVPgNVNSiqqVZayNU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=H6VYS8UKRzlBb/ekfchhyLIOWDEpALiQ3GaW4KrgypbpdWWrRkCQMzd3VzlM290ZLCSytyWDspiZsHVXF2VqH0WQEbE4yLOZIhf9mgFX20cHcHAqguCq7hdKGXnziU72WDYCd/4kfhrqdxVlnjprPgTK7EO534n8nc+chtII4iQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CgD+XqZG; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CgD+XqZG"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a36126e7459so76816766b.2
        for <linux-samsung-soc@vger.kernel.org>; Tue, 30 Jan 2024 01:40:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706607599; x=1707212399; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=V9cfPb4W5k9B4duDj0ed74N38vchVtwGZnJWXfHN68Y=;
        b=CgD+XqZGNTcEe6d+oXBxts1dhp02XLSJ0cyrgQ2aKmR428t5naHWpTnBfJhFzAU3Kt
         hpXi84J4YS1XgiDzFtpEaYfTSP7AUCb+uBhpx57FfhOQAktYl6EeVeGWxKU3LzHe2u/I
         +f8oZuxyQDYgdmL5C9ofrX+WM2n9dkdGQEbDU/tEskKFWnZ3Y1JZ95ODwUcGHUNZH50R
         +ydR4yrl9Ej2wL0v5RiignGzBr1rc3qxq2soEd5GiOtX4IE3hVyrpQN6uvAmNNYnOsl4
         ArigLJIphTKorDDw82mmznicZQtRVEzgQZgk+fTXh/IIB1udALFzkaBMV2OgSOK+J+qk
         JXtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706607599; x=1707212399;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=V9cfPb4W5k9B4duDj0ed74N38vchVtwGZnJWXfHN68Y=;
        b=OsK2cDdfhi+IbzBdqkyWlF8zqAfBe9HZYPPTZmZlgxRP3X+++N7tt386dHTmbyPPjt
         uWp83evqUkhvHxexw2oCufoYfFDecEZkcW3NGdbrw/8U8xn2ZwPu7X8LxCrgEvw66+vP
         oAhvdatHTNJ3UgoW8l+gIB4HP47nSDnO42cWWLXVxkoNCGrJPAxOFRqjtwE+YQdXR7Gz
         RW2S2S0RKXkVZZFxcAr3AgEZx9HDvwgk9CFhAIdijTq2un67WpCrP6avITLdiV7uv0Ei
         xusXiz/5blqFiMoBrdZ5cQRgZEGNje0kK++GpmvX+ZFkfTa6X9lEPF51uoL7y2QO2mXa
         9kuA==
X-Gm-Message-State: AOJu0YyWfTRBCbtRHc8St0n/37lqRIUOschzhELHVsz4tbx6vlx7ZPMw
	dklIf6h81omDRki7pCJZObR0TODilcC1brvm7Lh5w/jIPPry9fcn2A5m16UDPvU=
X-Google-Smtp-Source: AGHT+IHkd+Zd88JeDXPCLK6I9F6Ulh4JNK7qznck4C7apqUj6lWZusJ+ynHeltFvsS+TGJ1CugoU+g==
X-Received: by 2002:a17:906:c8c6:b0:a30:76dd:35cb with SMTP id gc6-20020a170906c8c600b00a3076dd35cbmr5961607ejb.12.1706607599085;
        Tue, 30 Jan 2024 01:39:59 -0800 (PST)
Received: from [192.168.2.107] ([79.115.63.202])
        by smtp.gmail.com with ESMTPSA id p7-20020a170906784700b00a310f2b4b91sm4909455ejm.48.2024.01.30.01.39.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jan 2024 01:39:58 -0800 (PST)
Message-ID: <06356847-edfe-4073-a370-90f57feaf64a@linaro.org>
Date: Tue, 30 Jan 2024 09:39:56 +0000
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] clk: samsung: gs101: don't mark non-essential clocks
 as critical
Content-Language: en-US
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 Sam Protsenko <semen.protsenko@linaro.org>
Cc: peter.griffin@linaro.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 linux-kernel@vger.kernel.org, kernel-team@android.com,
 willmcvicker@google.com, alim.akhtar@samsung.com, s.nawrocki@samsung.com,
 tomasz.figa@gmail.com, cw00.choi@samsung.com, mturquette@baylibre.com,
 sboyd@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20240127003607.501086-1-andre.draszik@linaro.org>
 <20240127003607.501086-6-andre.draszik@linaro.org>
 <CAPLW+4mL1gb_R8PhKaMhwOUTa0GDqat_9W=348ScYj+hBarQJg@mail.gmail.com>
 <d45de3b2bb6b48653842cf1f74e58889ed6783ae.camel@linaro.org>
 <CAPLW+4kSka+twSoZmQeMsh3RWermrGG-wyENrr14AmX3zZ2eqA@mail.gmail.com>
 <bbaab3addf958bc1f484a20ee0bdb65af05cf5da.camel@linaro.org>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <bbaab3addf958bc1f484a20ee0bdb65af05cf5da.camel@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 1/30/24 09:31, André Draszik wrote:
> On Mon, 2024-01-29 at 13:16 -0600, Sam Protsenko wrote:
>> That sounds reasonable. But I wonder if that bit (about making this
>> clock CLK_IS_CRITICAL to make earlycon functional) can be documented
>> somewhere. Perhaps in the serial driver (earlycon function), or
>> somewhere in device tree bindings? Because otherwise it might remain
>> an arcane knowledge and people won't be able to use earlycon later.
>> Anyways, for this patch:
>>
>> Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>
>>
>> and if you think it makes sense to document the bit above, please do.
> 
> Will do on top of
> https://lore.kernel.org/all/20240119104526.1221243-6-tudor.ambarus@linaro.org/
> once that is in.
> 
It was applied, it's in linux-next. I like the dt bindings idea, it's
the first thing I check when dealing with new hardware. No idea though
how to add comments just for a specific compatible. Shall be a
description somewhere...
