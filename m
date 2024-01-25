Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8822F130E43
	for <linux-samsung-soc@vger.kernel.org>; Thu, 25 Jan 2024 17:30:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706203859; cv=none; b=cduhfx4y/EFVSvPHLVm442sXjxZUQC3eTcJQ8JzaHyHrkY/3iCOS+dzjKDlt/kyPZwphThMP5O2C32PCqLbz4lfwCYc8K4tJvwUtwj347SMxR3RF7zDV03fAr9XXSu0GQeiGJoTn3zYcDB6xBZLHO3aIFA5Y8r5PvR3A+sgH4hw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706203859; c=relaxed/simple;
	bh=bCw/HUurHJ1qdBhBYQuW0bpfzi+EJCZAMtvmywaQIQo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qEdN6e2XqOpQ+6f+diIjd3VXAjIEAi6Fw8sTVKvWbtffPtZrlVieZ3jF/TBFLjc6vhwU4T2wGzDFq88JDMoXtK6gO/BGkzwJF53sDXFIUkzIzQ1ia2S3fG/bZNG43uoe74rvyIUMdRx/BhzyG6cKg3rVShIxWg5u6QgheDaMyQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=n9LWDxOJ; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="n9LWDxOJ"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3392b15ca41so665806f8f.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 25 Jan 2024 09:30:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706203856; x=1706808656; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VDpXdV1xjn9xA6o5INqM6Q193iqPmYntEZprkTGrWcc=;
        b=n9LWDxOJQlH6CnDVlEm5/hDYdpGCtgKP5QQYK0+YSg5tlBNHSQ7RbFIf2s/KV5zPup
         9V658NMlHJI/QBZdXxUkgPm1v1fHmxEEA38golvm0S0jY3YH0N4RWCnPfdO53sfgtQp4
         Mcf07eIxxT+oLHlfjoxXnlvVeIEMj68Y9Mw7IrlTBYB84yAoNZVFDPDG8m1l74q1fqqC
         RCG5e++hwjGnE/4yDZ7f1xbBtrJqBM0xq+6SodVD+Pq9gxVtPbQEtKTJWgqNN0sjHykM
         CYklqw/G7zg2LXXF11hwA3eru2eIhq1qDaF6VYa2+R13CODmF98ac6ryQVKrAfgg9ULo
         1xRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706203856; x=1706808656;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VDpXdV1xjn9xA6o5INqM6Q193iqPmYntEZprkTGrWcc=;
        b=s9pLnjbma4OmimPjehz31HHQ3u8ME1GSlEAYTxUOtXqBdlPlnnQ+LGutAoGxLIIvV1
         NTMjt+TE4AuB44V7hOWa9R8gXVy+8hlycNsyv8vBDa5NiGgSl3PrAFDhzz7VkJ7btXqr
         Wr+8q5tMqQ4ybwumglMtl3ZXY5jZ9I+9YzVxs6G2MapwMoPYj2tXzQ4u3xQpCc9HfJWd
         TxIT4gym7H3PFbDECZih5dBmCVV6Y0hjTY9znzyZh7cYgf/rZUCI1LK1szS94fPlcnXT
         YPVuQe4017rDoBf6gprI3FYMZUcsoXSOrmyIg+3b2RgDYNxPHNW1oR0jL8Tm02WcIBQK
         Aq8A==
X-Gm-Message-State: AOJu0Yzmk87IdkGOVkXDqzUkBxfoVJ79ZptbQeEq3IT/exRFHk4bYzlz
	K1f6bS1LvoiUX4ktPMJCx2Y74AvwpoEFsA8b9BZvNJ0erbmN7bR1cLtwqJc3b2g=
X-Google-Smtp-Source: AGHT+IGIk5PNkwGKI/BJQtUpwfWv36HzFewcdFwM5JlbY4LkAkmYMkvcxZfcsbTcCYV+ZYvwT48bGA==
X-Received: by 2002:adf:fe46:0:b0:337:b74b:6f1f with SMTP id m6-20020adffe46000000b00337b74b6f1fmr133414wrs.22.1706203855769;
        Thu, 25 Jan 2024 09:30:55 -0800 (PST)
Received: from [192.168.2.107] ([79.115.63.202])
        by smtp.gmail.com with ESMTPSA id c16-20020a5d4f10000000b003393592ef8dsm10715665wru.54.2024.01.25.09.30.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Jan 2024 09:30:55 -0800 (PST)
Message-ID: <f2ec664b-cd67-4cae-9c0d-5a435c72f121@linaro.org>
Date: Thu, 25 Jan 2024 17:30:53 +0000
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 05/28] spi: dt-bindings: samsung: add
 samsung,spi-fifosize property
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>
Cc: andi.shyti@kernel.org, arnd@arndb.de, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 alim.akhtar@samsung.com, linux-spi@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-arch@vger.kernel.org, andre.draszik@linaro.org,
 peter.griffin@linaro.org, semen.protsenko@linaro.org,
 kernel-team@android.com, willmcvicker@google.com
References: <20240125145007.748295-1-tudor.ambarus@linaro.org>
 <20240125145007.748295-6-tudor.ambarus@linaro.org>
 <7ef86704-3e40-4d39-a69d-a30719c96660@sirena.org.uk>
 <1c58deef-bc0f-4889-bf40-54168ce9ff7c@linaro.org>
 <55af5d4a-7bc9-4ae7-88c5-5acae4666450@sirena.org.uk>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <55af5d4a-7bc9-4ae7-88c5-5acae4666450@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 1/25/24 17:26, Mark Brown wrote:
> On Thu, Jan 25, 2024 at 04:38:07PM +0000, Tudor Ambarus wrote:
>> On 1/25/24 16:16, Mark Brown wrote:
> 
>>> Do we have any cases where we'd ever want to vary this independently of
>>> the SoC - this isn't a configurable IP shipped to random integrators?
> 
>> The IP supports FIFO depths from 8 to 256 bytes (in powers of 2 I
>> guess). The integrator is the one dictating the IP configuration. In
>> gs101's case all USIxx_USI (which includes SPI, I2C, and UART) are
>> configured with 64 bytes FIFO depths.
> 
> OK, so just the compatible is enough information then?

For gs101, yes. All the gs101 SPI instances are configured with 64 bytes
FIFO depths. So instead of specifying the FIFO depth for each SPI node,
we can infer the FIFO depth from the compatible.
