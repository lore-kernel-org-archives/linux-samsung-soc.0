Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 164DA1EBA1C
	for <linux-samsung-soc@vger.kernel.org>; Tue,  3 Dec 2024 13:09:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733231365; cv=none; b=Omep0O1ftrV/PpgoTkaj10N/Z5s1NUdvp1k17qJb4SlSQ/2xZklYmpokclSVUzBMXudjtLFCfTlp0HZv8scX3EVO45kyvnoJOSDeo2yhzBrjHHg0y91xjsAtGl9hWz8J/cF0HAAvU4If9mUNRHmkw7ugkCo+fxFptppy/oWiLvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733231365; c=relaxed/simple;
	bh=YDR0YWnLKGpWYxX3gsPfp6VDfdpjHUDFZy8cOfRDBUk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KG3RVFhMnyodmmgLlxOAqaWWGaQ48Ftnofwfy/5czROcV1fNy5A+7Ou4m2pcHGEQgrM1iY9wJEuZ6H7p4PtPmSa5m6tMg8ZArDI+uX9A/HCCVNg6tRPIGBUq5sI0WAf525b51ZMDdPUxutJPIjLyPVpy3gg2g4emeQe+BhUo7gg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FugLlNpf; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FugLlNpf"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-434a766b475so50765435e9.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 03 Dec 2024 05:09:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733231362; x=1733836162; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YDR0YWnLKGpWYxX3gsPfp6VDfdpjHUDFZy8cOfRDBUk=;
        b=FugLlNpf94Emlvnc5inyluRDnT9mo36guXpwbXFve/LZJGA2yJMsZFpdHVw95AAwQ/
         PuD6DrQRfLq5mMsElkn/snh1OsE7hEcKJMHbXmdUtViZJBRgehZz8nrUq5+ec9tTeEu3
         iGHUC6BZT4p+Uea7Gx8w57UsN88UuIaC+XUQItlvwq9Rp9c0MC2dmLYj3c51Vh39YvQE
         bSQl36K9/JTxqLmZYmQ5LrfrcFaTlOqWC6G6ShzQYpKf3hh1OCT2DM3v9Cp+1HFmh+AH
         xs3MSyP5swocQIcl0WI600vISb58q0B++zPk2VwOyMFYTNn/3imPUW/F8gZQkeSF5OFF
         /SnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733231362; x=1733836162;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YDR0YWnLKGpWYxX3gsPfp6VDfdpjHUDFZy8cOfRDBUk=;
        b=HfM6nWIZ+zAzaGbiM4Crd81QqmP8BWMjKW93u5U3+fPXcPiGO7V3SP1gnbv1x1w2EW
         o3qA/VG0ECY4zZEXqRn7RGqjCWHN8Qyul3+2vt1io7REiduPU8D31FUGemQcGb8QnZzv
         A3dOL5ilIO3DrTx5D1zdPiZDfbETFrLsYMeTx1/6nckfM9hMOrXf/Xp4+x4eydjjiD0b
         Xn4r65yQZmznIkjV/kHLVphDEZHP9Fq4iHX5nmTXEmIMrS3b973KizgXepMaFpyXO1kP
         wLQ3ZODXdkbmVI9zmDWOTTtsBqdvxTiEejf/Vzvsg60hrd7GQEDkBwKmm4lX0ca7Teq2
         QtgQ==
X-Forwarded-Encrypted: i=1; AJvYcCWgvK9FBWOL8nDV9Hj/Xhp+CMu3A351pdVmf7Gi3uZ0aQTacJqSmdLqcox2tCQh7PM9IZr8gt8QQF7cWO6+gs108w==@vger.kernel.org
X-Gm-Message-State: AOJu0YzCp4Q3NAsrcE4no+8fW1ndbTEzg5jtcYXqEyTxQTzC9Q0DqKQ4
	m4jmA2ks4bNdB5UOPKqqMt1IIbhJcO363UKtyAKhinmA6t1cVuri25QgxL1R+Xo=
X-Gm-Gg: ASbGnctzx1VJsqVmeT3ELzULIyFnQ7sltFvg1Ty1azHw99ctdfPL2GiHkV5qpM/j15s
	D24YlSrO7FiPczZ9Kt5lZ0U1dPHsfAJYULfw1A9iMMN38t8P9KWtIxM/9N8RtmOsiuL5KedNo28
	NwGXN5evH3CXZSNvSoROlQ8C8nyOCeaQrQaUmwxfMbxoR7uiMKJhDcprgoPNRlw8Y8Is6Cc4iIL
	jRcVJDuqu4uvUeon7GqRXSrwXpUOG8S4Po0OssYanu/sHrKAyEjBlKD0Q==
X-Google-Smtp-Source: AGHT+IEgjZh4TC8j5dPhQityM39qffPlfEhObsWPGXvaJj36DpzimRcwsGyIcCWZhT//1+YJClpZ4Q==
X-Received: by 2002:a05:600c:4f87:b0:42c:b5f1:44ff with SMTP id 5b1f17b1804b1-434d0a07e55mr21049565e9.24.1733231362310;
        Tue, 03 Dec 2024 05:09:22 -0800 (PST)
Received: from [192.168.0.14] ([79.115.63.27])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434b0f32589sm193447135e9.28.2024.12.03.05.09.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Dec 2024 05:09:21 -0800 (PST)
Message-ID: <dad1bbd4-0eee-480a-8a2a-08157dd609d8@linaro.org>
Date: Tue, 3 Dec 2024 13:09:20 +0000
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MAINTAINERS: add myself and Tudor as reviewers for Google
 Tensor SoC
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 Peter Griffin <peter.griffin@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org
References: <20241203-gs101-maintainers-v1-1-f287036dbde5@linaro.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20241203-gs101-maintainers-v1-1-f287036dbde5@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


On 12/3/24 1:03 PM, André Draszik wrote:
> Add myself and Tudor as reviewers for the Google Tensor SoC alongside

Acked-by: Tudor Ambarus <tudor.ambarus@linaro.org>
