Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AB9B1FBCB8;
	Tue, 17 Dec 2024 17:31:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734456671; cv=none; b=roGpR3izlfU9F+U9IXIwtQHUtoEKdzaelH9tphC4h3hPt8fbtexFASC87lE6sRB5suQ+DKKzxBDfjpxlkzM9upQ1OIrW5Q86a7f53iiOYRMrzIMOFonlzOqdbDkL+dnYVmLZUQwYEtWoSi0bwpDP7fitkoERZxTHmtltDs2XEMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734456671; c=relaxed/simple;
	bh=0u8GZTE/ATgnlJ77MnJjoFgTTZFTZia0rw7GhwEPga4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=diGoIKyQSAZDbEkBEldYbvLP1Dx8SwACQzmwiCQ8lWdo/g3uYOgNAz7ZRBIt39+SnCYZRkNlvb7b9z3joxk3/1A1B8h6kCAJey5wrYV3WL6Pg4SkwuLhZd/FDI5FFTciVxXVpyMLx/3pMx26jIW+7g2LacwfUuK6yjZjdWINwyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UFpIn5i6; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UFpIn5i6"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a9e44654ae3so859772566b.1;
        Tue, 17 Dec 2024 09:31:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734456668; x=1735061468; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rBBCHmjJ8BfQE5A/y32+aeYDRhAmzBYfai/tB2V6O2c=;
        b=UFpIn5i6PCFfGw9zSWKPLS+DueuAjZDDOt4ym8muRN07z3eLL9jTF3utNjn7okvl6G
         myBrzNWn5T498OnLfYoSEYIzQWJa9814blAmR+FAtRFgsODYO9GJbrEaiZAgtAiSRe8R
         uQsKpCHzBfH+blp/BaTOYuTxYyyPyeAll+bIxFFYDLLLaQWTpW+J0yy9J7Zo0YIgcCFo
         BkbuwRfjpUwhORrxNd9cbpUC6icWgPda0LsvUed3/LjxeILF32EP9HeBSxRx7V/j9v7+
         tchyZ4KH0ChXT0atpP0KnqtXI2GAHQIICYFkas8Z8HFLPVm9W9ofhVmDcN2MP4AzYgaU
         C9KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734456668; x=1735061468;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rBBCHmjJ8BfQE5A/y32+aeYDRhAmzBYfai/tB2V6O2c=;
        b=vcdHoLIt7uNRQE8iwKKHEMPz0466gyI6HzeUy5BgkahmS6YzvFtD2Ge1brJvyFphvC
         o/kAF2+x/jHuSosc39HKc2VvoibqwOrGT2CQ0l9VQkreKQ05qn3mx/kSkeAia4p8tpgx
         A+DL1/ivdGtDSEVgoA5naLiOZM6VWFuek4abYfUEFHNJgwFxS5SMDeQJANKb8KyYfx3r
         8yRBRmLe0P8F96d4Dqkp3BORVMfE0gWcjqTkfW5TqInqYAcOzMPucNMEdUYk7fD9MQxA
         ioEVPfFm7x/oJS9Sfv7o56T7GMGX9/XbkVYrcLuS0iFkzZ1NlmYNivvPftcG5yFBcMm/
         EORg==
X-Forwarded-Encrypted: i=1; AJvYcCU3Ha42f/EJ6qMGLrbVonZmZlAz2z6oXHti3XknLNnqCOHeGlWsgZXoILHDWOOvJFeGD7yuSPn5uXopahZ7k1WfzvI=@vger.kernel.org, AJvYcCV3y7Wkk57oRxz7ol4c1zTpWP0f3EOpBdtwmpymdkWpY2lqDT4JuqDRJa2YI6tK0mhloIuFuf0/2yX7@vger.kernel.org
X-Gm-Message-State: AOJu0YzSXd6I9PgdWLpl/6QvJv9aGn6hg2Gh8DCR2rYeTCI/W6r620KL
	q22mrHONXQUjCozkMY1uONgrEhBn3LYXPbWBK65ERo2ju4M465+0
X-Gm-Gg: ASbGnctChDUtvdLcPLYXj8AabrVh5Q2OM3B6QxWpIDeGR84rYDxkhysyEJTS6zHkAfZ
	JaFzn+zgD3ZmFF/MmU85CS1gqzYznIqTAyjaJClHVHm8Rg89T2PINwzgoP47cPnLa0wyopkWQTh
	Dw/gFLvvx4wVVv0Eh/no14C5EpVvKFVqfmOMuZj95uIICm2pNjnun2PP/6rOHv1rcMwD5gs1+Lh
	Xxmmgw4PXcgq0PL9XG4SOxx9ywDsV2s3Y1b43RJjRdKnO7CHiyNuK21QzMTyvhsmFPU
X-Google-Smtp-Source: AGHT+IET9mrZEHGyCN84q2P3UbSuc+Z8xHdme19p+Tq4s9g/cPQ1ee4Z1KgRDlQkyuj9FtD2I63F3g==
X-Received: by 2002:a17:907:7811:b0:aa6:8b4a:46a4 with SMTP id a640c23a62f3a-aabf1c85370mr15686266b.44.1734456667314;
        Tue, 17 Dec 2024 09:31:07 -0800 (PST)
Received: from [192.168.31.111] ([194.39.226.133])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aab96067ef1sm461047266b.48.2024.12.17.09.31.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Dec 2024 09:31:07 -0800 (PST)
Message-ID: <6b257549-b166-4772-a824-894b4b84e322@gmail.com>
Date: Tue, 17 Dec 2024 19:31:05 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] soc: samsung: Add a driver for Samsung SPEEDY host
 controller
To: Markus Elfring <Markus.Elfring@web.de>,
 Maksym Holovach <nergzd@nergzd723.xyz>, linux-samsung-soc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Alim Akhtar <alim.akhtar@samsung.com>, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>,
 Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
References: <20241212-speedy-v1-2-544ad7bcfb6a@gmail.com>
 <44419be4-65b3-41eb-a696-cfefae84a423@web.de>
Content-Language: en-US
From: Markuss Broks <markuss.broks@gmail.com>
In-Reply-To: <44419be4-65b3-41eb-a696-cfefae84a423@web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Markus,

On 12/14/24 4:43 PM, Markus Elfring wrote:
> …
>> SPEEDY is a proprietary 1 wire serial bus used by Samsung
>> in various devices …
> You may occasionally put more than 57 characters into text lines
> of such a change description.

But does it really matter where I break the line? For me, it just seems 
ugly no matter where I do it...

>
>
> …
>> +++ b/drivers/soc/samsung/exynos-speedy.c
>> @@ -0,0 +1,457 @@
> …
>> +static int _speedy_read(struct speedy_controller *speedy, u32 reg, u32 addr, u32 *val)
>> +{
>> +	int ret;
>> +	u32 cmd, int_ctl, int_status;
>> +
>> +	mutex_lock(&speedy->io_lock);
> …
>> +	ret = speedy_int_clear(speedy);
>> +
>> +	mutex_unlock(&speedy->io_lock);
>> +
>> +	return ret;
>> +}
> …
>
> Under which circumstances would you become interested to apply a statement
> like “guard(mutex)(&speedy->io_lock);”?
> https://elixir.bootlin.com/linux/v6.13-rc2/source/include/linux/mutex.h#L201


I did not know such statement existed, thanks for the tip, it definitely 
helps and makes it simpler!


>
> Regards,
> Markus


- Markuss

