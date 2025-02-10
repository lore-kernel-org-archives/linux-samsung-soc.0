Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 203EC2566D1
	for <linux-samsung-soc@vger.kernel.org>; Mon, 10 Feb 2025 18:17:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739211461; cv=none; b=OAnJ/shlBgDcUba3DSlIWfhbwWHKGyfRbwKUUSW8laPRWw1YMN683nF87ZdYpM/uWcDgj8wkieFk9TDtGghrB02UocYzhEin+9KvyEuW3H+FqHIGAZdCwyiTWJmGsfm5TlBoQ4DUkE9cOu9mVBFPhT6UWePNc+lD/MtzRdGvFEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739211461; c=relaxed/simple;
	bh=Wh5yx6BMUnphP2RVBhvJu+atXSSYBvxEAcLfKspktSE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XGJENo0Dlu9bQU8E1cfPUXBAcKtWZ6AcoOix1qWYZoxqM1sRKanyAiVX06AH3s5IaFWPBdPSGe4LKRzOUGAKMTJUWr+qwDOqAQdZ/gYNIq3BRFejc6guvetcvCym5+kv8/itsgIYC0p7rowoHeBTZdpKq6X0Kwodc7UzTKCEZM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PsQprjGz; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PsQprjGz"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5de74599749so2315717a12.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 10 Feb 2025 10:17:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739211458; x=1739816258; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qHaDIsqj34B8usesjY16LwOg4JnnE1Cbsm7V9RJsdE4=;
        b=PsQprjGz3ROFlSIQZf+hdQLGtFdi6zZZR9+GIGFv2lB6OQyU6mrcFoC60ODFSq74PW
         oBSuTWodn50rcSzX/+F+W3s69hs66SENM9HFRmd3NHK2jdkimURKnlJ264OE9oHxRlB5
         NutwbHN641OhEOxVfLRLLsoyI08JD7/IJNGrpd4/rufdwH+dTW08pdv4z1J5isqAuGcf
         PNSbvRoKIxkht7ggH2D8JDtwmGDhK7nHZjwwpgunWIpqcoNodRIMZTsCiC0TJve6GQXr
         7Fd4THN2slCEQdeOJHR+AkyOMtp+OCDxPhkdf4SKmA6IF3tfoIQbg1Db7uKS63oSjWqQ
         dHhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739211458; x=1739816258;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qHaDIsqj34B8usesjY16LwOg4JnnE1Cbsm7V9RJsdE4=;
        b=eRUcqt5uERHzlwD+XUOv4ShtjNWsZttvKk1CZPE65djcoY8+ouxoYouw7XpGD9XyWK
         2mOm/MeZhaWr0r/OoyPidTwEUesbbzD4t5K3GlFusV0ud7eBksk3E/4YYsvP5dVjscXm
         InhEEBOu/HtsK6TM/TEYrdjU31Rv4TcNn1iCHC6X7SCoICQougq//xKfxYKFHzae0sAG
         C4JMHHc4851ZvBib+lZla1J81ZjNnzGBSewZhbhrb3MF5G6JYMoLOjgVUzt6jtOTEM4S
         JloMYuSNl4GnfZoJNKgMEzy5+HgSxBEdfGHlp0a9yFlfZDAUl49xRyDMbR8pDOsUWiJR
         0B2w==
X-Forwarded-Encrypted: i=1; AJvYcCUgM3klOqSZbjvqFgeCH2bQ7f3KoYNoaYIbXetYu/AePlBsLXVR+P7q7n8qzwdJ5MLE+zlPx2j9ABiwy3gnn27JuQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxUBMJK/mSTZb9otMWYuyxcMYpzIntESUlNRv/r2QGea3fVSqhb
	HulLxBWtsYXnoyEP/dmZCsll5Ujrcdw9HbdqHpup+Za7gzQ9YRTxzI2lLqRnwf8=
X-Gm-Gg: ASbGncudBPFKEDnE+tAS14ID63OVi5d93aYH6YwqlxIO/WGY2XzdLlh9Ohj9mw+KNjh
	U2Ined9TzhrYJd32zr5je/j0vaH1vU5k0O94IyY5Y1WL/0F4RO3MExWIIBEVGexR/wHYj8qb1oH
	6raV3kdeF7rurAzOLRljX6e7e7kevSkuGyEpHKUpF3q1m6neLXefF6kshP6Xigafj5hl1UBGao0
	Qp61DN0+r8V5B/RKzLdLJtqxNm7Z/RyB6I8CPQsb3c2ja+mF5w40+NzE5XzB46fPHM+ZGmEFAIr
	Ww77XzYqUeKi6CWD+iwClA+w
X-Google-Smtp-Source: AGHT+IE17precGVn60p0mKS1K0f7v1etGQpp1R/N00rlHb4aVUugfxbIzoj2Q7spw41fxBN5V9dokA==
X-Received: by 2002:a05:6402:5290:b0:5d9:a62:32b with SMTP id 4fb4d7f45d1cf-5de4503ff1emr15027701a12.7.1739211458355;
        Mon, 10 Feb 2025 10:17:38 -0800 (PST)
Received: from [192.168.0.14] ([79.115.63.124])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5de4690311csm7037457a12.60.2025.02.10.10.17.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Feb 2025 10:17:37 -0800 (PST)
Message-ID: <88c69965-ed8b-4895-ac99-11a6cddd1a42@linaro.org>
Date: Mon, 10 Feb 2025 18:17:34 +0000
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/4] arm64: exynos: gs101: add ACPM related nodes
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-kernel@vger.kernel.org, Jassi Brar <jassisinghbrar@gmail.com>,
 daniel.lezcano@linaro.org, devicetree@vger.kernel.org,
 Alim Akhtar <alim.akhtar@samsung.com>, peter.griffin@linaro.org,
 vincent.guittot@linaro.org, Conor Dooley <conor+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, willmcvicker@google.com,
 linux-samsung-soc@vger.kernel.org, andre.draszik@linaro.org,
 Catalin Marinas <catalin.marinas@arm.com>, ulf.hansson@linaro.org,
 Will Deacon <will@kernel.org>, arnd@arndb.de, kernel-team@android.com
References: <20250207-gs101-acpm-dt-v4-0-230ba8663a2d@linaro.org>
 <173920411592.476427.15574016492470186426.robh@kernel.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <173920411592.476427.15574016492470186426.robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 2/10/25 4:22 PM, Rob Herring (Arm) wrote:

cut

>> Bindings for google,gs101-acpm-ipc are proposed at:
>> Link: https://lore.kernel.org/linux-samsung-soc/20250207-gs101-acpm-v7-0-ffd7b2fb15ae@linaro.org/T/#mb557ee342de628b1a8e462d4fb7c3ac6eb8be4e4

cut

> New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/exynos/' for 20250207-gs101-acpm-dt-v4-0-230ba8663a2d@linaro.org:
> 
> arch/arm64/boot/dts/exynos/google/gs101-oriole.dtb: /firmware/power-management: failed to match any schema with compatible: ['google,gs101-acpm-ipc']

Thanks for the report. The bindings are proposed at the link above.

Cheers,
ta
