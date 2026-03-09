Received: from mail-yx1-f51.google.com (mail-yx1-f51.google.com [74.125.224.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC9FA26F46F
	for <linux-samsung-soc@vger.kernel.org>; Mon,  9 Mar 2026 03:02:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773025376; cv=none; b=UzyF1MYUwWZkpPuWTvRaE17wRNFAAdDZxNoD4i1hfeGevrTj/b3/EE1O5/bN4j0ORCCUehSrvBnp7HXU9moJncuczqKAZpAmdkdizNfbed49MHCi4ylEWFxQkVQaSbH+g2skNMb7qLE/R+OPskzrCbDxpqyen62N/R9630YX6+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773025376; c=relaxed/simple;
	bh=BGjkXwXFeJle68octNDMR19EHMWwrZil3s7gHM3J0bg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MOZV8Ftkf3RtgqBGII6McLPEywhZv281X3+V0nMIE8V4zbyr0H5sYWSFZgcJL7VFTEpyklTZNd3yvl1zcH0GmQ1tdCLZoPQNRzlymA+FAasX6SIY/smXHm61NaMBscJRbxaGykEZxntfRxNiK3+c7tCtonGtSwJTeEhx/lZQGfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=EyjJwkFV; arc=none smtp.client-ip=74.125.224.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="EyjJwkFV"
Received: by mail-yx1-f51.google.com with SMTP id 956f58d0204a3-64c9cabfe5dso13740858d50.0
        for <linux-samsung-soc@vger.kernel.org>; Sun, 08 Mar 2026 20:02:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1773025373; x=1773630173; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DRC/SSBoLNJpBv7w3HXObuyQkJlK3e7PgCYEr0NFv4U=;
        b=EyjJwkFVWzJNjMAd6yOjTRBmZI7d9gOhHIWC21TOHKITr6YTn9n4l80Xu7Pv18+KyU
         kfWBI6ymCmL4PPjGirEcqKsY4XEHfQ+nt2VQwUr5YItaGNOJNOpIzLggBVIP4zMt5Exy
         gt0gHwPViT7fTLnvyFaqp80/4bj6v3USQOkZr3LbykPGuBMqRF5NSX+IZerO/8k1qPrM
         wph0+noQ0rCJyoiBOpuaE1cEaGDY3fDA0Fh7DCydJN4afYBApqo080AIjY7REwMFbghg
         YPZAmb7nF1afmRviKdDmGihbZWLeodHLdKmQSrywDUC1oea6A9eyaDCXwYVmWvcuwSEw
         3WNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773025373; x=1773630173;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DRC/SSBoLNJpBv7w3HXObuyQkJlK3e7PgCYEr0NFv4U=;
        b=kx5A6ublWZoCDpCjUpTgjKchYGEN6TlZIr1Kdo+OIYQkIY1OjaGgZbak32111N2LYG
         zd6qQ+RVq4gJZvS+F7IRdhyBuTm4hDS7k+fyeqpttktPyj7EOK2RVX1JR+lB87I9G7V1
         uboz/RRAsaJkNjRw9rNz3bZW5h+L5MPzBnWqKDuGuqktphZNvk6waREAejyNrSaXxDun
         nI7tpWpdYpSgwOG68YVMtbNVre9QQR3vwxKpWWIYh8LlrFoJsJndZwFKjMgre3ZfnnCt
         WBuxyvjom1EHwB2GbxuJ5wiew9GiaMowQxA+RipVX+ybPwisGogjdCiYXmRhabOYl8Zi
         MqkQ==
X-Forwarded-Encrypted: i=1; AJvYcCXIaU3QGYu15BvRIUxKL/3w704yzUa2MpmDenj6nsUuaWJ9NB+9Ngs3kkih2Km7IwplbyRB/WcmnrzJKWXuXLNmsg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxZATvSaGGs0DL+8xmozYKXjAFxUFTTlB+7RZV1hm+rA4CGN4dh
	Uw0nW5/8TUyZcflJAkeA4DvQOhJMPXlwSl8MzSqQ7OllV7d4XaNeQEstEY4ZNzkQJQ==
X-Gm-Gg: ATEYQzzMFArNBh/6cOsAlQnGn/Tt7g7gIGLi7tum9olMtjj/jku2bUoIKCIGmKR4bhM
	s3gfg5+tpbOvYkTJNMdJaXSiUNDlU4Eh/SL04VaIOep26K/M9K4CRrt6u2ZEv0pnPSyYO0xNXvj
	cdaA+bXY4LN0j+Cd6wEo7L9RPPIiwfKVG5CgL4gI1VnWmvVwelM1kEM/Pzp+F8ObowjaADVhJiX
	lr97idYYg4FCoTVrHIcQT5QnwARFic6sSvpmR3SKXt5DqXKOp3jbmAaZP9Wzf1jyFkpUyMD4iu5
	fkeNrVaKcJewD2ZDoNccFEayXL435lU8IxJvrJeydmgp3ijzrGur0VFRoadKomsPkTpZkh12HSm
	OtGnhdDQe1gMdobf8Wd8OyE34u1WqkXZ/Sj6wFpU6+2YkTUvR4eTN0sRDxpZ2Z+anWk0+2aSdCQ
	bohbTl3qsUDZjCIvQ32uwwyhTpCaX8owWbCckLP/l7PHsHQei6MS1Y9TKC8LCDjZMSFx135so=
X-Received: by 2002:a05:690e:1186:b0:64a:7bf2:3afa with SMTP id 956f58d0204a3-64d0715a07dmr12447389d50.28.1773025372369;
        Sun, 08 Mar 2026 20:02:52 -0700 (PDT)
Received: from ?IPV6:2600:1700:4570:89a0:3329:ea09:3c41:e7ec? ([2600:1700:4570:89a0:3329:ea09:3c41:e7ec])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-64d176c59dbsm4094408d50.11.2026.03.08.20.02.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Mar 2026 20:02:51 -0700 (PDT)
Message-ID: <103a2828-c567-4b95-8583-e2358ccfc1f6@google.com>
Date: Sun, 8 Mar 2026 20:02:42 -0700
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 3/6] mfd: max77759: add register bitmasks and modify
 irq configs for charger
To: Lee Jones <lee@kernel.org>
Cc: Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?=
 <andre.draszik@linaro.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Badhri Jagan Sridharan <badhri@google.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Peter Griffin <peter.griffin@linaro.org>,
 Tudor Ambarus <tudor.ambarus@linaro.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, Mark Brown <broonie@kernel.org>,
 Matti Vaittinen <mazziesaccount@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, RD Babiera <rdbabiera@google.com>,
 Kyle Tso <kyletso@google.com>
References: <20260224-max77759-charger-v8-0-eb86bd570e9c@google.com>
 <20260224-max77759-charger-v8-3-eb86bd570e9c@google.com>
 <20260306130031.GK183676@google.com>
From: Amit Sunil Dhamne <amitsd@google.com>
Content-Language: en-US
In-Reply-To: <20260306130031.GK183676@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Lee,

On 3/6/26 5:00 AM, Lee Jones wrote:
> On Tue, 24 Feb 2026, Amit Sunil Dhamne via B4 Relay wrote:
>
>> From: Amit Sunil Dhamne <amitsd@google.com>
>>
>> Add register bitmasks for charger function.
>> In addition split the charger IRQs further such that each bit represents
>> an IRQ downstream of charger regmap irq chip. In addition populate the
>> ack_base to offload irq ack to the regmap irq chip framework.
>>
>> Signed-off-by: Amit Sunil Dhamne <amitsd@google.com>
>> Reviewed-by: André Draszik <andre.draszik@linaro.org>
>> ---
>>  drivers/mfd/max77759.c       |  91 ++++++++++++++++++++--
>>  include/linux/mfd/max77759.h | 176 ++++++++++++++++++++++++++++++++++++-------
>>  2 files changed, 230 insertions(+), 37 deletions(-)
> Does this patch have any dependents or dependencies?
>
This patch does not depend on any other patch.

The patch that depends on this one is:
https://lore.kernel.org/all/20260224-max77759-charger-v8-5-eb86bd570e9c@google.com/


Thanks,

Amit


