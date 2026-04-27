Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79D963A255A
	for <linux-samsung-soc@vger.kernel.org>; Mon, 27 Apr 2026 08:48:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777279725; cv=none; b=iUyx3hwXCuXOHR3zWuFuyGktWnT4zqvNdaSoxmCi/+HLwxqSJD/XwgGe8bZaaYZ7LKciOmW2gG/lQDHI1LLAncNWmJf5BdNndegT+11oomliJ2xaPn2Q4j/DLnr5qs2eNgo4W5o8ROa16jgsgtNV/mVLUUCB1crJMplL49kOuD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777279725; c=relaxed/simple;
	bh=bQSKliJdOgSghj/0j57jxwwP485TZouAqr/8lLlLuNs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=juvunEf0oFgGv/To2asEoQ4+twpQuRCjlsHn3iI+RYPAXkgH/T+3R9oafAeutNxflgsrPprO0aDiXgHmrI3CjTpLuHBIhpe80PqnxR6NXmQZ6qb50UJTOwPnw8uhPNFdp204d09IFekLkKt9QCXitU83w9KFlHGs83C7SbgKMNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UKFRNcDE; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UKFRNcDE"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-43cf7683a28so6602876f8f.2
        for <linux-samsung-soc@vger.kernel.org>; Mon, 27 Apr 2026 01:48:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777279722; x=1777884522; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0JA+E2OJoqNXeWdWbhpFOoKA8w/M6yXZ6Nq/L8Dy8vA=;
        b=UKFRNcDEpPwR3Z7y8ROLx3oZWCI+WSQxkCITgNgqU5Co5zeLqYXe64KnG08Evx3v88
         urS/fgSLxF1he8nJZBA8BGdOzUW9nc81kWvKLPXaHkTcivsRYII0fGexhUSOZkM+3VXU
         tYC3/wsrzWsoiA/sDt4XLbjLMiktLb39mGCw1hn+llR2IO9dGX4DHa72QOn5c/wGyc0R
         WqYDa03+7vPReJHaZo0zI8yhLNdHEaRGEddW6v/gEsppCb1cxS7pPdsr0HqpzajC1PKE
         97kOFsEKNvbfBATP9Purc//SS3UCr82y5/FOyEtH+ajIit5flO4VhoaKoJkqgaBepjAQ
         iDUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777279722; x=1777884522;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0JA+E2OJoqNXeWdWbhpFOoKA8w/M6yXZ6Nq/L8Dy8vA=;
        b=ha3hYlEOKjuxu1O0+Vu9/24ZccGl7KPdgZzIvrbNYasvXyezugYbWqscOoSRdDtD2T
         Kgp9/fxj6hTigLV2GWj6fmaezgkrC6WZWwIAdNTLXZfzpV8rRORJJb8OpwdV+rwI5Nlk
         luFsOK3divDtblxbP+OOy1jhJjwoLoMHS/vmmCRiWCKEtQs8+W1M0PAZGg+gOlK/MJp/
         1SV9JP2GTGJB0LKn7wXS5Cf2iF+CbP/m1NhoYhIRq6fLiMo84c+A9jytCx9u2KzkGYk0
         AVNSi2wVoO9Ts2eM2tmJVqZYOxLcybK+Vo9mURMEznNsU+LZu/cRNrZDWPOH/kWzPsOu
         06IA==
X-Forwarded-Encrypted: i=1; AFNElJ+IFvhbEgouT61viiROOmaFnzs9mQGEC1OoCYHCl5vwO5s9FjOZyUDr238VQNQCqmoMxFsVTvbTYiPTLefqmRxPZQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzcFa3Hrn5UGYC37IoZEM03wwHJ5lZI3uckIKj++WBb6YfdcubQ
	gjZGU4aNdgU7ab+pK9LK/d8SYgxCYjUGW0fwoCNyvoQ5PphJJpEV063jT0iArazago8=
X-Gm-Gg: AeBDies8VBkaRDkRHErk3eVzQvA0sXu8uPhyJTJna2U1RnjBJjxi/ej9CbwmpG656Wz
	pwJFrjf/rlUJQ9B9Nt5NAm5aMURKKESgHjeG3aCwzNQOXaKK2EJTBi+019N/mOCq8KMhYy+M/JS
	7cbW7wnmHySrBixTTtPpg3p3OqR1WjrA2C4ou/RPnZ5IdMHk1ZKJ9/xlPZTFZajZqraExjf1fV4
	RqLCrluLwoHdmWdSYY/4YT0y9V4nCEBB30sYzo4GD9mOaX4t6p7sVmRBdQyHp/mkKu6JTq8gNCM
	ULc9/g0izOOkllV4DmopfYW9yADha83q2mhKHZinPYOa7YFgNvSt+Fk916McE/rJMRfT+w/vC1h
	nRQe/83mWaZBdGpvRAPx8fXvH5ikvtOd/4in3K/UlQemV6Q8NsWZnZRQNF9Ce1HAjRnoTan7rxs
	I7MX8s7reyR9dhDVMezHrW3BmcW049WGg2/IRydoHvk/Y=
X-Received: by 2002:a05:6000:184e:b0:43b:9a9f:8956 with SMTP id ffacd0b85a97d-43fe3e0715dmr63483116f8f.22.1777279721576;
        Mon, 27 Apr 2026 01:48:41 -0700 (PDT)
Received: from [10.11.12.108] ([79.115.63.228])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4cc2cacsm79702504f8f.13.2026.04.27.01.48.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Apr 2026 01:48:41 -0700 (PDT)
Message-ID: <84c292d8-d2a0-4c29-bd28-cc00f66c2f43@linaro.org>
Date: Mon, 27 Apr 2026 11:48:38 +0300
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] firmware: samsung: fix stale response flag in
 acpm_prepare_xfer()
To: Titouan Ameline de Cadeville <titouan.ameline@gmail.com>
Cc: krzk@kernel.org, alim.akhtar@samsung.com, linux-kernel@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20260426210255.73674-1-titouan.ameline@gmail.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20260426210255.73674-1-titouan.ameline@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

Thanks for the patch!

On 4/27/26 12:02 AM, Titouan Ameline de Cadeville wrote:
> acpm_prepare_xfer() only ever set rx_data->response to true, never
> false. A reused sequence number slot could therefore inherit a stale
> true from a previous transfer that expected a response, causing
> acpm_get_rx() to enter the response-copy path for a fire-and-forget
> transfer whose rxd is NULL.
> 
> Unconditionally assign the correct boolean value so the slot is fully
> reset on every reuse.
> 

How did you find this?

Sashiko identified this too when reviewing the ACPM thermal patches.
I sent some fixes last week, where this bug is squashed as well:

https://lore.kernel.org/linux-samsung-soc/20260423-acpm-fixes-sashiko-reports-v1-0-2217b790925e@linaro.org/T/#m1c32aa4c84ea7e3909bc8fe7599585b71e95d8b5


Thanks!
ta

> Fixes: a88927b534ba ("firmware: add Exynos ACPM protocol driver")
> Signed-off-by: Titouan Ameline de Cadeville <titouan.ameline@gmail.com>
> ---
>  drivers/firmware/samsung/exynos-acpm.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/firmware/samsung/exynos-acpm.c b/drivers/firmware/samsung/exynos-acpm.c
> index 16c46ed60837..2fee6bb60efc 100644
> --- a/drivers/firmware/samsung/exynos-acpm.c
> +++ b/drivers/firmware/samsung/exynos-acpm.c
> @@ -380,8 +380,7 @@ static void acpm_prepare_xfer(struct acpm_chan *achan,
>  	/* Clear data for upcoming responses */
>  	rx_data = &achan->rx_data[achan->seqnum - 1];
>  	memset(rx_data->cmd, 0, sizeof(*rx_data->cmd) * rx_data->n_cmd);
> -	if (xfer->rxd)
> -		rx_data->response = true;
> +	rx_data->response = !!xfer->rxd;
>  
>  	/* Flag the index based on seqnum. (seqnum: 1~63, bitmap: 0~62) */
>  	set_bit(achan->seqnum - 1, achan->bitmap_seqnum);

