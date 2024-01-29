Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DB9F15698B
	for <linux-samsung-soc@vger.kernel.org>; Mon, 29 Jan 2024 16:46:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706546799; cv=none; b=lDb78TN+ic2tc07Mew9/S+159KXZIWKepdRyAnwS+NInLxz9/mM+PCmFIcMZD/JJbFZfuh5iMV1tpkF30EkL9dTbALAJnsDuEr5hQBfbtZLKVZJbQGBRqcUpUfMc4FNqg7wlbdIBGO6KSCyp/orQ0B3hcvednk5KEsWNsckIwKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706546799; c=relaxed/simple;
	bh=mbENMP6ALwn3I6z8Y/mXtvTa2m+2zY7iKoHkFhuJDc4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qFlLkvyHuQ50kT6KklDFiOGm3oywGyUC9rpsGQ8oE8vUuKTUqH1sr0d4pcPXddhIl2ZqmgKMsVNhrYi5X7g5SdaNeAydeN89Ls0f+wmNDhZgCQATs5+UG50qG9hJcNZQcasi+KMCl7D6+5lrjQIbPojRvnpJgUIuzQz6oehBalY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OwF4pNCZ; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OwF4pNCZ"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a35e9161b8cso103406466b.3
        for <linux-samsung-soc@vger.kernel.org>; Mon, 29 Jan 2024 08:46:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706546796; x=1707151596; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Q+f1+9NV9x1H6HYmKDscBmLQc10yQKPAhIN9I9MCfkQ=;
        b=OwF4pNCZfnV9A/Pdsjytx3AX7yX4m/jyHqPKuoONZtlWqv9N5oRr1uWinxZVTqPSKu
         rm9WahLftPjhRDOFKmWW+HXI7WEuJ+Z/tpQ0Sj+3XgoCVHENWXo5Livz1BYnQGIuUmlB
         OWUlNq55iPGY9kbCqHHn/G8pxa2K0qSe59n4bLicgO5wzB35K5ZF8zx0ak/0NxnXG/5b
         b1EFxLmBOhatShNT2eDbKP62BIuTbkSr/LggBpaCYW0rAToqVMjnmpc5tXA9zU5PLmUd
         uam2lr5ooBW8Qwv3u8zKG300hH+lgtgu3Kbrrqj6hR/F8KZqVJLVSBcc6Fc1NEWUqZmI
         ygrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706546796; x=1707151596;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Q+f1+9NV9x1H6HYmKDscBmLQc10yQKPAhIN9I9MCfkQ=;
        b=tS9ZQNs4+5gx5zIJ/Rx+0IDz3fNJoPcoU08RH6Yvk0G19M4XR/hBrWJftK4asnsniW
         6YL7IM15RHs5Dc7O8uI2Jmue+BdVAIgUCdyU0UUin1zFi6JmP8yFUJFcsPHf1wZjZTO1
         3Dn2JmNaeBp+hCoB3fDZa172cqQR9V8zWrQJr1sCjOVzBwiPD7xCP8iOY8e9qzayLvov
         roLqGPLp8lpk97/BXzJipfHLItczxGJVsqNXUy8sCpOL7CWFBNYV+TSGEWQSrkEuwqL1
         fTARYR1HRm3bshp79zIBOqY/ZJO2B71aMSnJaaKcImzrTXVzWw1XL4yuoljxpuJEvrhO
         rDLA==
X-Gm-Message-State: AOJu0YzENd/cvwnx2PCkaFu9Uwi6OtLU/cXjfwicqpIVP9Mk9xTTPPpa
	4GKJTf3WsXhrkfgty1CY8HcF2xWmsbTI/o4XtIc4n/ZWsPVhXSGrDtx9YNBfi28=
X-Google-Smtp-Source: AGHT+IEAgNenRs7ZgVCn7z/QNduayBhI1e4zb16MJM4JFkdHotSTBXrMQjRH9PgRvYrvY7DsFi3P7w==
X-Received: by 2002:a17:906:6c90:b0:a26:98ee:9fc0 with SMTP id s16-20020a1709066c9000b00a2698ee9fc0mr4624982ejr.43.1706546795890;
        Mon, 29 Jan 2024 08:46:35 -0800 (PST)
Received: from [192.168.2.107] ([79.115.63.202])
        by smtp.gmail.com with ESMTPSA id tx18-20020a1709078e9200b00a3551f727d1sm2744582ejc.68.2024.01.29.08.46.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jan 2024 08:46:35 -0800 (PST)
Message-ID: <6dd93b49-359c-45bb-99d0-b380882ce739@linaro.org>
Date: Mon, 29 Jan 2024 16:46:33 +0000
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/9] dt-bindings: clock: google,gs101-clock: add PERIC1
 clock management unit
Content-Language: en-US
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 peter.griffin@linaro.org, mturquette@baylibre.com, sboyd@kernel.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org
Cc: linux-kernel@vger.kernel.org, kernel-team@android.com,
 willmcvicker@google.com, semen.protsenko@linaro.org,
 alim.akhtar@samsung.com, s.nawrocki@samsung.com, tomasz.figa@gmail.com,
 cw00.choi@samsung.com, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20240127001926.495769-1-andre.draszik@linaro.org>
 <20240127001926.495769-3-andre.draszik@linaro.org>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20240127001926.495769-3-andre.draszik@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 1/27/24 00:19, André Draszik wrote:
> Add dt-schema documentation and clock IDs for the Connectivity
> Peripheral 1 (PERIC1) clock management unit.
> 
> Signed-off-by: André Draszik <andre.draszik@linaro.org>

Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>
