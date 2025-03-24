Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 041DE1CD1E4
	for <linux-samsung-soc@vger.kernel.org>; Mon, 24 Mar 2025 13:23:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742822585; cv=none; b=DQOcNaKz1AOTAK8DHBRuA3NmOu41rRC8dUVSDgXEHbAU5LIBIT4wEdzs0/Xqu0x/NRZQnCBjMhqoY3gC4yNQBb0QuMK4BOvnwdYpr+D+ZMKs40M0yWp1aV/mOjc1veqlgzVLpoc6LcvHgnF9g97RLo9woIWlQ3myA6fZwOFgpBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742822585; c=relaxed/simple;
	bh=FWGjGltJ73Yzplwv0HeDy+Wxd+YiFD2X298kLBzUJwM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OGxWV0LkDaLcJmIENiwg3aF5ba6vuvVmKGr1LB24XrNEYPbsbnMFL7w98sv21C5aZVwXca3a9enR4LmK4PIOPpGIy3oJGP/Uc3qcQTS9VdtzzM1d2liicpcxHWyxAUMr5tre+vhg1DCJEo9B8ypxS+q/dHO/X4wOvP2ghV/sNss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zGqfTfhU; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zGqfTfhU"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43d04dc73b7so46786875e9.3
        for <linux-samsung-soc@vger.kernel.org>; Mon, 24 Mar 2025 06:23:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742822582; x=1743427382; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QpLay2NRUxXBZBIq5TN4wg5iG7+LcfQc4wrhgea9GRc=;
        b=zGqfTfhUdRizp31hO4Iy4WxON2/XVloAwGCHpIjhqrYkEoTnh5YKyWSwzXVmxhZ3g9
         LlyBAaRJDHPmFIL0SbPdOV2Ip3oJEtJb7TAlDMIEr99kZIkbMuVMjKc0Q8MpK6OyNxxs
         blicuqqbTYiAJU8zwGe5xwJi5TKFe+YjUsBsoIPdDtE1UE7ILuQfZYepJDjWSei2V9P8
         nLoSKyNLz+hHINJ0zcTrpPazNHx9Shy/lbefXlTCad38B56cpo/OlfPbp/yCruejShN9
         ChZu1iwzriD3VmnNynHIbaxaBhS6z54vZ3DmlH4+fTO8omPhc600rOsV1Boq6cjUL5/F
         gXFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742822582; x=1743427382;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QpLay2NRUxXBZBIq5TN4wg5iG7+LcfQc4wrhgea9GRc=;
        b=DqoT+YxepqpbeJxeYbdAIfGuPxE+Sj+xkFPT9HOTpSyKIbpzSp8798zQiuEhEbyOR/
         EDfqgfoF8M3iL4v/IfoNzpoBODj/eUmD25F0fDTQXkPlYtoxxgaT2NbI7PurqCzm50QE
         BGMXkWULdThupeZekH+ceiU37ajEnJvT6Szl+cyaPaBd4nGzAU6LMstR2i9UTrZGZTjy
         WGUWNoKx1NIU9Ta11IH6R9sEVYTV9m1zvVxscEiX1nIFAhhvk69qwU75w9fX1dIcB8/f
         dskeV/Sj3u+05aVRb7Doz9uHsQ00tFWi2hh0eu2n8WOYuAdmcg2TU9TzmiSe7GNZXnJL
         0uXw==
X-Forwarded-Encrypted: i=1; AJvYcCUqkpTbdKFFsKClXHdi4gBoQBWLim6X9SjX6O9xv3qfa3UUb1nN2ZBr4u6gUrMZChfEX1Oy79o8/01fN9SSAwf1JA==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywv9gEoUJHSBr/BUxzjYmV6KjGnNBX24WbRZ496NEn7Kum9qKnD
	X2+5pLasaBrK52JcF3H/lx+y6k13jV1YqBiF+TcJTonSjY1D0P6DKJGSQwuXmu4=
X-Gm-Gg: ASbGncuOb/LjZX+BpoZyqsLbSf7TK9487iSFTXdFpnCbF8Jcrq/PC9ISLkImXmksc58
	l8vra3/orP5LoolvLF52z8j4UnYPeUfgVYmL5trsXAVj9l+bvTwzFsB64BBJ/FMqL3Oxey+hQ1O
	+IqJhaxQ7sCeLt1nvbQIk+pkfO20CzFvq/Hk0H9Bm3N7I5wyfi6wKsRw93jWPEKygFli3d8p6kK
	u6Z5N4f8YsG9VognVYdyrTYuqjrQqu1YYK+/Bbju82TZp2mlMojbTrfjres/46Rz7yfdAK3+R6q
	fYgGSCT7EiySj0jD8UoVI2MOflCWzIfwpKW0IUbp8NZJ1rXSTF2zB/XpdskP0BkDYQ==
X-Google-Smtp-Source: AGHT+IEf/zzI0Tp9Ahcexm+a6tN9Lg0kiY6AKaxAwg/q8l9R6KHv3dKYwSmrj+c+Gwc5IajDQJz/DA==
X-Received: by 2002:a05:6000:186b:b0:391:4684:dbdb with SMTP id ffacd0b85a97d-3997f9039ecmr10697036f8f.17.1742822582202;
        Mon, 24 Mar 2025 06:23:02 -0700 (PDT)
Received: from [192.168.0.251] ([79.115.63.206])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3997f9b4ce9sm11091922f8f.53.2025.03.24.06.23.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Mar 2025 06:23:01 -0700 (PDT)
Message-ID: <9b372589-1c52-4f3d-9f5b-8f729489b545@linaro.org>
Date: Mon, 24 Mar 2025 13:23:00 +0000
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] firmware: exynos-acpm: allow use during system
 shutdown
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Peter Griffin <peter.griffin@linaro.org>,
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com,
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20250321-acpm-atomic-v1-0-fb887bde7e61@linaro.org>
 <20250321-acpm-atomic-v1-2-fb887bde7e61@linaro.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20250321-acpm-atomic-v1-2-fb887bde7e61@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 3/21/25 4:40 PM, André Draszik wrote:
> We need to access the PMIC during late system shutdown and at that time
> we are not allowed to sleep anymore.
> 
> To make this case work, detect this condition and use busy waiting via
> udelay() instead of usleep_range() in that situation.
> 
> The code isn't switched over to udelay() unconditionally so as to not
> waste resources during normal operation. acpm_may_sleep() was heavily
> inspired by the I2C subsystem's i2c_in_atomic_xfer_mode().
> 
> Signed-off-by: André Draszik <andre.draszik@linaro.org>

Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> 
> ---
> udelay(10) causes a checkpatch warning (it suggests to use
> usleep_range() instead for usec >= 10), but that's exactly what we can
> not do.
> Reducing the udelay to be smaller will generally cause the loop to be
> iterated more than once, which I wanted to avoid.
> I could reflow the code to hide the actual value from checkpatch, e.g.
> with the help of a local variable if that is preferred to ignoring the
> checkpatch warning.
> ---
>  drivers/firmware/samsung/exynos-acpm.c | 19 ++++++++++++++++++-
>  1 file changed, 18 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/firmware/samsung/exynos-acpm.c b/drivers/firmware/samsung/exynos-acpm.c
> index d7ed6b77a957af5db5beba7deecce13ac7b30fd2..33cde6e88e2c0773fdd36c80927c77d3bcb44135 100644
> --- a/drivers/firmware/samsung/exynos-acpm.c
> +++ b/drivers/firmware/samsung/exynos-acpm.c
> @@ -15,6 +15,8 @@
>  #include <linux/firmware/samsung/exynos-acpm-protocol.h>
>  #include <linux/io.h>
>  #include <linux/iopoll.h>
> +#include <linux/irqflags.h>
> +#include <linux/kernel.h>
>  #include <linux/mailbox/exynos-message.h>
>  #include <linux/mailbox_client.h>
>  #include <linux/module.h>
> @@ -24,6 +26,7 @@
>  #include <linux/of_address.h>
>  #include <linux/of_platform.h>
>  #include <linux/platform_device.h>
> +#include <linux/preempt.h>
>  #include <linux/slab.h>
>  #include <linux/types.h>
>  
> @@ -272,6 +275,17 @@ static int acpm_get_rx(struct acpm_chan *achan, const struct acpm_xfer *xfer)
>  	return 0;
>  }
>  
> +/*
> + * When ACPM transfers happen very late, e.g. to access a PMIC when powering
> + * down, we can not sleep. We do want to sleep in the normal case, though, to
> + * avoid wasting CPU cycles!
> + */
> +static bool acpm_may_sleep(void)
> +{
> +	return system_state <= SYSTEM_RUNNING ||
> +		(IS_ENABLED(CONFIG_PREEMPT_COUNT) ? preemptible() : !irqs_disabled());
> +}
> +
>  /**
>   * acpm_dequeue_by_polling() - RX dequeue by polling.
>   * @achan:	ACPM channel info.
> @@ -299,7 +313,10 @@ static int acpm_dequeue_by_polling(struct acpm_chan *achan,
>  			return 0;
>  
>  		/* Determined experimentally. */
> -		usleep_range(20, 30);
> +		if (!acpm_may_sleep())
> +			udelay(10);
> +		else
> +			usleep_range(20, 30);
>  	} while (!ktime_after(ktime_get(), timeout));
>  
>  	dev_err(dev, "Timeout! ch:%u s:%u bitmap:%lx.\n",
> 

