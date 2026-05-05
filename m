Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47031421880
	for <linux-samsung-soc@vger.kernel.org>; Tue,  5 May 2026 12:14:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777983289; cv=none; b=cJ6TinYyXYrlMsYyc+/M11hMwE68TO2Yujmd0W0T2mCkNMUxefTPHslzitUysY5MEnYBVKD53qOqZZEgzVCINquAw4EHCg9DArYhXvOjN7oIfv+m2wOJ8GXdefE+who5q3iru2Nj5anKkpnCMqj/Vq3X4P692bMeB1EukY6GJnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777983289; c=relaxed/simple;
	bh=sp+LO4TT1w2KXKSdG77dGU2CwJG8n8ZXUH1+jk/AMic=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ScT0z2XQzVpG31ytnzJ/HBdI0bz7guK1VPEuaOAJKn8k9olhenUXfzfFGY7DY2TbftXbhFEOlFn5jJgXdXo0dTg3aXHflhc6iCLwqjUzyx4oMFIwsJ0XIi4yGyHkrNfy6JqR5nZRUpdKEt7w52QaaxEX52ejBOgjlw+QvPRalzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=glcoBprD; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="glcoBprD"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-48a3e9862f0so34832845e9.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 05 May 2026 05:14:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777983287; x=1778588087; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tzVA3bAqqUzorx+k6MSHtdqUxfZ3J2aAaM3KCVizFPE=;
        b=glcoBprDTlo4VZhJnk2MeW3gMc+RDZvRBJ5RG0dC0HBt42AMK8Oael440uwO3pq9vY
         kpDYAQ+9KzkIwPUhGoopXYqquLAq4O6r76N4NEWuqHp/AkfsRnS5IGJIPwH7nVkohJ4c
         3zMKhpgfTgBG8DIOGqP9+l6u1z1iNsGXaKwPuHkYUapXVc+nfiwFnvYPiGX+7VV07QDp
         GHfy4333F1Phhho8cl/KJDYAkQKbBviU3BqpgfhLf6P+ziOf0nC+x7CKDqKwpZJGXsiq
         5fWAACFM/WU0BT0aS7zI5ZJhnMyUl+bO6f93X5WJect2A7FMwYh1+qyl44NZ9ps4w5rH
         W36A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777983287; x=1778588087;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tzVA3bAqqUzorx+k6MSHtdqUxfZ3J2aAaM3KCVizFPE=;
        b=CcHfoPQNfthQe0Yg/Eye68VF8ySx46ox5xYnVx6iuqNXSBhOfhuPfKWmT4H72BuDm5
         HrqjvfnvdWXoHYvkSraNBJeqWUruNaqeGSWL4tyMgzQUkVLi9v3HdH6GQNn+FgRwrYGF
         UyGX+RpyAfwOvcKYw9EULkZXtq6NGg+KpTKwaCaQ5JhYCThbNWxNZKGfwRxaSbUYSsOV
         9h6ZWlRQIz7fJo7M2lGdYhVyy0SpBJ79RPbslS5phJpDEtn6zd69Ec35DCQtaMazNLg+
         Bmf+IxqermYw8AmugEZLOdxdXINoySPekfz8VQUb2AWq7KMDLpheKLzFhqmjJ4UKEIda
         sXqg==
X-Forwarded-Encrypted: i=1; AFNElJ90ZoGp3vFG6BseyNeJp+XC+f5K/L9iOA8FkF9C0ZeQV33cCrQYQldl2OQ8KSomzqcBP5JOy/g/yzBgnHoEktH8Og==@vger.kernel.org
X-Gm-Message-State: AOJu0YzI8DoBUsi8CbJimX447pwy2N3CLdcd3R8+LG0I74/ULwDfD6dW
	OFogN/c2T/eQBEIfNBT/V49CeDkbPox2MoEAxNhTK9cP+U18zTIi1XYbYqCpMpBfBqY=
X-Gm-Gg: AeBDiesH5NGAO9s6mNSXt5GXKhkOX0kEIgPrtzJ2hG4voC6tJionoNxX24K920tVQNx
	qnT3FpdTVnnP2p/QS6+eW/a+AAVW+3YFnn6Yefl1DMWgmTmPxvxIorublWz3FiEVT1Sw6MR6tv2
	SUae91uAqKcwt74h1S7iZ1F817r5O3JMd9SEC8VoP+dNauaYzjmecRAhWF1UPhMfvDVSosYkzo3
	aKwaD1jyP/mtmIaTta2jcU5kTtSUm2O3qaEgK66R8QfNhF2fD3pP68izRu3jSmCer/J1LYX3QVO
	uWXhKFL+7CcgpBGrcpISfHZ+hJo6Mi5wICCZDU7ltsmhun6GMMfkKLI/i9KvM2AC5LwbuAn3J8g
	3sOl+ph3kESkRqhfVRNioH45/mjqCW07KKTv4eLaRpBOAroxSSm6BqgllY4wjqbvoOTekwQifbN
	44XXwPloRG3Ur8CbNRDMJSGAZs/agdU3f789Kv+4rwaKA=
X-Received: by 2002:a05:600c:3f06:b0:48a:761:5816 with SMTP id 5b1f17b1804b1-48d1424a351mr58621115e9.8.1777983286660;
        Tue, 05 May 2026 05:14:46 -0700 (PDT)
Received: from [10.11.12.108] ([79.115.63.228])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a8eb72a17sm362772905e9.6.2026.05.05.05.14.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 May 2026 05:14:46 -0700 (PDT)
Message-ID: <366fc343-0cac-4e03-a08e-aa50a6e17314@linaro.org>
Date: Tue, 5 May 2026 15:14:42 +0300
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/7] firmware: samsung: acpm: Fix false timeouts in
 polling path
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, peter.griffin@linaro.org,
 andre.draszik@linaro.org, jyescas@google.com, kernel-team@android.com,
 stable@vger.kernel.org
References: <20260504-acpm-fixes-sashiko-reports-v4-0-529246be6b2b@linaro.org>
 <20260504-acpm-fixes-sashiko-reports-v4-5-529246be6b2b@linaro.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20260504-acpm-fixes-sashiko-reports-v4-5-529246be6b2b@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi all,

Before sending out the v5 of this series, I wanted to share what Sashiko
found when reviewing this patch, I think they are great examples of
tricky concurrency bugs. I'll also give some hints on how I'll be fixing
the problems in v5.

> @@ -261,6 +264,12 @@ static int acpm_get_rx(struct acpm_chan *achan, const struct acpm_xfer *xfer)
>  			if (rx_seqnum == tx_seqnum) {
>  				__ioread32_copy(xfer->rxd, addr, xfer->rxcnt);
>  				rx_set = true;
> +				/*
> +				 * Signal completion to the polling thread.
> +				 * Pairs with smp_load_acquire() in polling
> +				 * loop.
> +				 */
> +				smp_store_release(&rx_data->completed, true);
>  				clear_bit(seqnum, achan->bitmap_seqnum);

Sashiko pointed out that calling clear_bit() immediately after setting
completed = true creates a fatal Use-After-Free window.

If Thread A natively finds its message, it copies the payload, sets
completed = true, and clears the sequence bit. If Thread A is preempted
right before evaluating smp_load_acquire() in the polling loop, a
concurrent Thread C can claim that exact same sequence number, overwrite
the buffer, and reset completed = false. When Thread A finally resumes,
it reads false, misses its completion signal, and eventually times out.

>  			} else {
>  				/*
> @@ -271,8 +280,19 @@ static int acpm_get_rx(struct acpm_chan *achan, const struct acpm_xfer *xfer)
>  				 */
>  				__ioread32_copy(rx_data->cmd, addr,
>  						rx_data->rxcnt);
> +				/*
> +				 * Signal completion to the polling thread.
> +				 * Pairs with smp_load_acquire() in polling
> +				 * loop.
> +				 */
> +				smp_store_release(&rx_data->completed, true);

The second issue occurs when dealing with cross-thread responses. If
Thread B drains the queue and finds Thread A's response, it saves it to
the cache and sets completed = true. It intentionally skips calling
clear_bit(), expecting Thread A to do it.

However, if Thread A calls acpm_get_rx() (finding nothing) and is
preempted right before evaluating smp_load_acquire(), Thread B can
step in, cache the data, and set the completed flag. When Thread A
resumes, it sees completed == true and immediately returns 0 (success).

Because Thread A returns immediately, it completely bypasses calling
acpm_get_saved_rx(). The result: the sequence bit and the response are
permanently leaked.

Both of these bugs stem from a lack of strict ownership over the
sequence slot. To fix this in v5, I will be rewriting the polling loop
to enforce the following invariant: Only the polling thread that
allocated the TX sequence number is allowed to free it, and only right
before it exits the polling loop. Specifically:
- clear_bit() will be completely stripped out of the RX draining paths
  (acpm_get_rx and acpm_get_saved_rx).
- acpm_get_rx() will now return a native_match boolean, which evaluates
  to true only if the thread natively processed its own sequence number
  during the call
- the polling loop will use native_match to determine if it must pull
  data from the cache.
- the polling loop will execute clear_bit() on its own tx_seqnum only
  after the payload is safely in the caller's buffer.

Cheers,
ta

>  			}
>  		} else {
> +			/*
> +			 * Signal completion to the polling thread.
> +			 * Pairs with smp_load_acquire() in polling loop.
> +			 */
> +			smp_store_release(&rx_data->completed, true);
>  			clear_bit(seqnum, achan->bitmap_seqnum);
>  		}
>  
> @@ -318,7 +338,13 @@ static int acpm_dequeue_by_polling(struct acpm_chan *achan,
>  		if (ret)
>  			return ret;
>  
> -		if (!test_bit(seqnum - 1, achan->bitmap_seqnum))
> +		/*
> +		 * Safely check if our specific transaction has been processed.
> +		 * smp_load_acquire prevents the CPU from speculatively
> +		 * executing subsequent instructions before the transaction is
> +		 * synchronized.
> +		 */
> +		if (smp_load_acquire(&achan->rx_data[seqnum - 1].completed))
>  			return 0;
>  
>  		/* Determined experimentally. */
> @@ -384,6 +410,7 @@ static void acpm_prepare_xfer(struct acpm_chan *achan,
>  
>  	/* Clear data for upcoming responses */
>  	rx_data = &achan->rx_data[achan->seqnum - 1];
> +	rx_data->completed = false;
>  	memset(rx_data->cmd, 0, sizeof(*rx_data->cmd) * rx_data->n_cmd);
>  	/* zero means no response expected */
>  	rx_data->rxcnt = xfer->rxcnt;
> 

