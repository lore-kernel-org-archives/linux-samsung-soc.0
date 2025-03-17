Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 134FE18C332
	for <linux-samsung-soc@vger.kernel.org>; Mon, 17 Mar 2025 10:26:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742207209; cv=none; b=V7SklXZYRdqo6Stxn4co2iEIQrjHSdGJT2T47S6w4uxrvOqvfDyPIhtUSWTyKL3Z7lhnWmtb3XFEoyEYPljS8jnBBk/UVT2s8avWHRdVkiV5/UG1xmi7FKrBRrTeF9ZoWjE/i/5JE0vFZBWNrfKPpfyFZm7X/Lt20UDychVcoYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742207209; c=relaxed/simple;
	bh=dLoz0EqgH+2ayW70DkHm7D86BlzG8oHIxB6X0i+YFG0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uWk9BpS23BYUqqKNEbPr/ao/pehcVMnukLWAl7ka1VDmsihLVipeN1egwGE7qgUbAkbf83FO4qW2qZ9bGbpLwQLWNc6fSEtJRVorZfTgCwbfrgN4IAyqI5MB8VlHB6EZF0oNC2IrYpZwjjBbl1FFk9uitsedng5qZM7bsYx8zmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=K8meO48B; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="K8meO48B"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43cf680d351so10258155e9.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 17 Mar 2025 03:26:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742207206; x=1742812006; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mvPPPRDaspsoA4k2Dj6ph9FjCMOMwv56adQmuxz0BxQ=;
        b=K8meO48Bv+liNADsMllxVSaQAKrhHdmZDzGlE0WDLMGlkMiGwuj6M0Fes6Y1+SlxKa
         FO/2TIEQK+ffHp16umiceR1DCDJBH4YkNBhFCcVG3V9YXf1qhO+qtSylmVG4j+e4x6Iq
         vpyphuZHWnQGG27YnrMxdoewpuIpc3E43KW1FJ01oer1+1BbeAlWAvTHlg5ufmMTw14H
         PqcIS94ToFobeeQ4BdPWRJWlep8P6LLjMm5vE7caVfLC86k4NnES4mVFJwl6zMJ2UfSq
         Xh1HugZZaFwVkEpkBhjAtK8jwlOjAxnXJXcF2aS29k78Kr07lA4Ga9wdDgOmztafMuuo
         82cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742207206; x=1742812006;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mvPPPRDaspsoA4k2Dj6ph9FjCMOMwv56adQmuxz0BxQ=;
        b=Jqs9yZOfiiarzm80DjZXmMJrLYXJaFbF0NLnEPgP9Xld2DgiO24HubwRh/Maxbmxi3
         DlOsOmj+tHzKYz9PoaEI2yZbm4CjnriLgIjXU2Uu1vJf5IHrHhdRIbp7WQ/3dRPAeYUK
         SfKLaYTWYlZiUDftej4/aqpt43tOsduolmAwl4PnSdMDQSfjSs29vTJQpWL/9RqxmcHb
         JYV/33STteLCOhOdww4hGX6ltfLcncTgvpTlSzh2CLqdqIgddHz9kZlDbzA8f2t5yG4e
         gwEMDb4uh716ghoFTiyz0N1AEVkvIHTWXHRxHXDiVQfqn2sR/VjeAweAugtK+A2TZU0E
         QEnA==
X-Forwarded-Encrypted: i=1; AJvYcCXgVveWBI3XTL5lviB93ySTsqhMTukZZXwY86m94NQ9aZDq7iGWPJYqginYyNhN8+rbN8GzQXopKSGSqeZprBy0Ow==@vger.kernel.org
X-Gm-Message-State: AOJu0YwAxTTNt/RMTIuZDcOZvr7f8nSsiJ/ZNL4yrP+UWMqNYiRFJ730
	NVrSKcs8TzYeaeEzzs7J1pL5ohFCpgZu9tiaHQT4zQ8KzA6zhiRo4YUkjv/xVS5BmLH0ZcV8bOJ
	U
X-Gm-Gg: ASbGncvHp4e7YU6sXpuscdnmphSh4BOwMk5WyuJYrf4ffgTPItGQLin2z03y9Enfmfm
	h+0ozAdt2uIyYy8LnohKz0bhrRUPn6ACg9Ct+YIsp5Vjxe1WSrUij10ql6wfLonjFfc28bRjcGQ
	7rJZ7nZaez0Lekr+AMET+f1L+gm9hxSG7kJ3rUPChNOMl9aXZa2rOP8uQEpohpF6ueZeKxd+cQR
	eG2JNAV0/xBF7ilOWeHUwhkD30OMrWZdT1YiKt6fho+TfyWd8BV0yTSzffG0MIICdj7bkfL1hoW
	WzpsfxNnRZq6S0fIZtZUHp8VmocEcyLRPtjzUp4+uBTq0uOYJKRbE9dkM0NLetBWlc8DQbtOuPh
	nbhcjhxqXpPl63EfXJEo=
X-Google-Smtp-Source: AGHT+IEl2lf5EodXDcMOp4zSumpDeUgpvHv7ZiCprUcc+z1261XnZYzYUr5LHoaWJbWt0CgfV/KCKA==
X-Received: by 2002:a05:6000:2cf:b0:390:f116:d220 with SMTP id ffacd0b85a97d-3971c97ba0cmr10611286f8f.17.1742207206352;
        Mon, 17 Mar 2025 03:26:46 -0700 (PDT)
Received: from ?IPV6:2a02:2f04:900a:ff00:eb98:2c37:6a77:39? ([2a02:2f04:900a:ff00:eb98:2c37:6a77:39])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-395c7df3506sm14950791f8f.11.2025.03.17.03.26.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Mar 2025 03:26:45 -0700 (PDT)
Message-ID: <638cf070-9fd1-416e-8172-75f189ab0dfe@linaro.org>
Date: Mon, 17 Mar 2025 10:26:44 +0000
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] firmware: exynos-acpm: silence EPROBE_DEFER error on
 boot
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Peter Griffin <peter.griffin@linaro.org>,
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com,
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20250314-acpm-fixes-v1-0-ab03ca8e723f@linaro.org>
 <20250314-acpm-fixes-v1-2-ab03ca8e723f@linaro.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20250314-acpm-fixes-v1-2-ab03ca8e723f@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 3/14/25 4:40 PM, André Draszik wrote:
> This driver emits error messages when client drivers are trying to get
> an interface handle to this driver here before this driver has
> completed _probe().
> 
> Given this driver returns -EPROBE_DEFER in that case, this is not an
> error and shouldn't be emitted to the log, so just remove them.
> 
> Fixes: a88927b534ba ("firmware: add Exynos ACPM protocol driver")
> Signed-off-by: André Draszik <andre.draszik@linaro.org>

Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>
