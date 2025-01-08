Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1314D1FF1DD
	for <linux-samsung-soc@vger.kernel.org>; Wed,  8 Jan 2025 16:40:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736354418; cv=none; b=Dh2Z44MbxixCDVEeDSNqozcGHDpN2ANviGsB64Ohqzb5XDbhlSFFIC6rSyqYxhWIGPwLbY5wEcUuaCViBsLFBq3YifqFmXsUuvNf1oEwlzoVCs8pf+6UlxKNB4uAizcLwf+4V8trF+f238i/0oRG004SqgKT52KX3Yac9knrjr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736354418; c=relaxed/simple;
	bh=WcjTfDkH9dXfEqgNl1DnowyrGJESQ3gBR/y+8lDI0CI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iFRgyLydhriaRk5jir4xNucRJz4fTm5QXHDl0WuzHMn5PQRgrUc6eqeXT4OEH7JNyCnQ6L2WliHKZVAw8tKcvZsw4Lnr8pwXqFddUXTyc3utk20FKJ96vs9/JJkku5eDs2iQQYj9tA1RE2BQQsfkQKIo0plDYFUJ0gEfw5q4uyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=M6MjskTG; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="M6MjskTG"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-385d7f19f20so7571414f8f.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 08 Jan 2025 08:40:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736354415; x=1736959215; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=deCdOEFNOf75jPBBQAgdeMZQiPxVvZH3Ou1tOWSHr6o=;
        b=M6MjskTGFGI3QL+xtNc/Ke4HbG9jUGMtzX1URRKgeAgZSG5EM3eDCSuMIHGcIZVoal
         zK3HLG3jKH/K/ERWUyIATPKKepTiFSoQPA3YCW9Zw9ZqBA7cDuCazmsrNZ11qzshJLa2
         MD7mDng4boOJpjcyCEjcbPYaDrA1mwtw+nlG+DFs3tZOJRYtciUgWu+RMEa88JrTk/sY
         6Jxb4gOm5EOVCJ0P4XHtpDH6fVXN3M/eo8qRwh6ZI+l6g7QGSMzAwi3LBciXJG4SVWqE
         EzW47aDjuUddczdcE+MIui1rMg0tlIJIpBBjR5dh9OutHMtlRNxrT0rrSoNO1u0Z4Fsm
         XYXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736354415; x=1736959215;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=deCdOEFNOf75jPBBQAgdeMZQiPxVvZH3Ou1tOWSHr6o=;
        b=Qbh7f68OjP5/qdhyNXMpQ/AtwjwpLQNWmtwfuOcM+luS4GbJW1JHOPoZsF+XINTGiE
         fTpDMwLPtpc6PlHoCAQoZLVtjkErlxvlQuHoDhFg4If7HpQ6rHxeXU9GLZ/6GZFuTypD
         +wwFkJ4hDuznaqc2xE9bF0NCoAN1KTuLn3rvMau30FL2L9POmC2V9ykXQNEI1qOSm7rJ
         gfvDr5xw/eOciA1fNkD8Ft2eXOhgMEeRI7PzrgmaMAOnWHXJYfYIkjC3Wrw0TkK6/YSE
         reaWEh9ajxKIkqBDqKKeqde1xvDVazhM+xs4MP6/slVHIrX48hNJFY4nlkvBo05XH9IM
         xO3A==
X-Forwarded-Encrypted: i=1; AJvYcCXAHRsUP2233Vx/UZy4R8c2YdIHuj+d6IDZrLzcDxFPiEdgh4m5BZpdyIT901740LqgwbtrvDX5IVV362qt5wlTxA==@vger.kernel.org
X-Gm-Message-State: AOJu0YySmc+Hf/aQA466aP/g9s/CZAGpCA4uGQha6L6M/Vs3x2yImLyw
	8S3aeWXRlrSqs7L85ZlxymReo3DGirZ//Qc8ntkBpGRXcBZudiDrA36RW6wA7IA=
X-Gm-Gg: ASbGncsqi48Xc9hFl/rhN7o4FlGLAZeXGkWmXOQTqiUDoU/HCMTP5GxJEd9RhVH1S/7
	lQNZbwbP7O17d+oQjG8k6WSfk8D+JRonr1j3P6jfYb3l+vRdd3sV+lYgZeml+TV6W1twMD2470u
	JTefbGlm+BpY1KHsvZZwhOnjal+hpzOhSEOwiHeMVhDC+QS+TH08ai/DXKaocXSbtPJbmYzf/zO
	HxNuF5BRlWk7llJeO7Spkqm4MB5Gi7xBcQ7Y4rknTf+mSjQ1U464CcVvZ3qFqgmFZEpVv/zcsS5
	dJIuL5ojbANOZMs+UuuL
X-Google-Smtp-Source: AGHT+IE4abllXEGQrABSU9KaQSrAPNt2UJoX+UrddjzVaSi3eoBYN+JcyuNs9drr9UEmuphRRteJdQ==
X-Received: by 2002:a5d:5f52:0:b0:38a:50f7:240c with SMTP id ffacd0b85a97d-38a8735760fmr2780072f8f.47.1736354415474;
        Wed, 08 Jan 2025 08:40:15 -0800 (PST)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-436e2dc0bb7sm25990875e9.16.2025.01.08.08.40.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jan 2025 08:40:15 -0800 (PST)
Message-ID: <076daca7-55e0-40d4-8ea5-93254ecd19b8@linaro.org>
Date: Wed, 8 Jan 2025 17:40:14 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: timer: exynos4210-mct: Add
 samsung,exynos990-mct compatible
To: Igor Belwon <igor.belwon@mentallysanemainliners.org>,
 Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org
References: <20250104-cmu-nodes-v1-0-ae8af253bc25@mentallysanemainliners.org>
 <20250104-cmu-nodes-v1-1-ae8af253bc25@mentallysanemainliners.org>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20250104-cmu-nodes-v1-1-ae8af253bc25@mentallysanemainliners.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 04/01/2025 21:54, Igor Belwon wrote:
> Add a dedicated compatible for the MCT of the Exynos 990 SoC.
> The design for the timer is reused from previous SoCs.
> 
> Signed-off-by: Igor Belwon <igor.belwon@mentallysanemainliners.org>
> ---

Applied patch 1/2

Thanks

   -- Daniel



-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
