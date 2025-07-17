Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28F8119D07E;
	Thu, 17 Jul 2025 11:33:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752752019; cv=none; b=IM+Yy5lkxch4W0HdBFaav723KBELDwdGJSf/hovsG7ct2v1itlNE714rEyWJl9l+2owr3rpU6cI90xrGSxVQc8i+LUMHoSRTF4rgCxxoHA9NCpohvWgaYDzYQQzBLfT1X596Cw58gNIMqDLOzvp2w0W1q78sWHAFwnjalarkN2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752752019; c=relaxed/simple;
	bh=6U2OH/CjEwXIt8VklPkbpyEDxQKKccJGFPTbQ20C3M4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CZfEf/u1e+j4RO9x1/NOeTaE3oYw+T+rn/1LKDtacNKLRdlxHQJbL/acLXbmRLGjNUc4R2I2cEFyvNE9982QRr3rnEJ87cIfeIwOW5C/Sj9Tp5lVZ1913Bbnl4Rlrvf8zg5JoNDHpBvdhV5PifMrWAF9OXgBs4s6yXNl8+gsN0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cmYXwm6A; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cmYXwm6A"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-ae0df6f5758so145586266b.0;
        Thu, 17 Jul 2025 04:33:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752752015; x=1753356815; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6U2OH/CjEwXIt8VklPkbpyEDxQKKccJGFPTbQ20C3M4=;
        b=cmYXwm6Aa6VT8WZSu1zJAIRPe1Luxb2Xb0v9wNYFCoy0AYmm2rKaAxmGKLjeZvcwVz
         lHpd+5gDJERgdlZNtPIIQUwkLuxjuQsWeLdYOPn6mE+naRzAkUiw4wP01CDQQ+pqZnAf
         rApSpMMIWlm6HP3A2hLo4UfL413vJgr5M6+H0O6kpH0cMuWgEKDwwpHnRNnmV95BCYEd
         lh3VBBENNKmCpy8XQVKAVcJJrEu6O2PVUITxYlc30fJIuC4/9s0+smQH4Fs/E1uI9ts0
         J9BSQWwAmU+YAacZrlZjt1a69Yq6iEzGH/epFxC+rLGBlrN03h+4FWVBszBm7SVW4E/u
         mf6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752752015; x=1753356815;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6U2OH/CjEwXIt8VklPkbpyEDxQKKccJGFPTbQ20C3M4=;
        b=PZMW7WTBZirLhNbH1uCOPZv/QiaKi1QsfiSIYcSAS1/3OYGM2u75JmkNxuagQLcteU
         73vn4+JmaAu5HPEWmbkAIYk38Jv/6ZDhajgr5jb8dlgNCjato3CE9ALQl2DQ6m9Qkwb1
         +0VaLEsgchj/HDNMHF8EuCkI0eG8WzMkwwTiYJxeRFn9bWcqXQxPqW+Xr/OYI6eugixL
         fC9Ow1UdNIDelpGLwjOIOE04rpoboKtEJtboLvvDGqeb/m85xGu7/mKYem45D74/RSIv
         aZIasgjzqVURNBZ3/3Uo1WtIyIbKtKZ5Bu6KfF1QYP6qGxJt8PWXxJeDRIgVFgNywLRY
         dTfA==
X-Forwarded-Encrypted: i=1; AJvYcCWIFvku4cZSNTAL/ur7qVZCDlzdniwHU0IQwI68/cIIjt4nmBdkdrjGN0BirhvTPnKr34GrWfMa3TtGFUdk@vger.kernel.org, AJvYcCXFhZACsSyBZ4ryxiQ4g4lpIMCm30cheRsg3pLclcR1W7d2EFabM8RLGPawLSB70msi3kg2TDuixgA5j94iSKDr+Dc=@vger.kernel.org, AJvYcCXzjoE/ZgGGrZRL4PsImqRJHWkfoKAYJffe/J8TqrYzs0NAqKWQyGTYWgODCMLI8mheN5uqLNoOP8dc@vger.kernel.org
X-Gm-Message-State: AOJu0YzLwbObwS31h4u4i6PbKigospZ9OgMPdxAThn4yIxmQ+vOfHh0v
	d3iOJT93ip3sF2FO9xvbzg2IccWoZVQsH4w0ekVzuztYQ9AJNLv7wcA7TdH72w==
X-Gm-Gg: ASbGncu6DDTQs0hpvl76RWOsqgPNiXyV66kKI0IDXXIitkdel4/A8NSvhg06UVhi0J+
	h1D4R5N+D0Be730/5uj7Rrf6e8J8qVFwcwkNySqVHKGA/9X81pTS1MVRqk5pcnWiAks8piP4gug
	fbKB4GbF/ESDvSuLM9BaRV0ch/VFULAUH9olZ6CcHZBaytcQpxPpK/UHTHis+zLy4fPRg/3spw8
	bVkIBSfOU1iVqicKCCqyoMfRs826lPZzud9qRn33QFKu4JD0km/K6r+Vws2G0BmlKTDrSCUYgim
	pXcQbfKcVOXb4Wz4bhQ8/sBcVXTAqfZAgLpwkWC2TJV0pNZV8EPVvRk1aKZ+uxoABDICbmJTFcG
	HgR1aYuU0bi/R7pPOaiGoalxCPiqx/g66G1kWeSuNTCOqq9eAvunVJaPEaPAlYFd5U9eTjQVPUp
	fp
X-Google-Smtp-Source: AGHT+IFokpYaErCcaLWj5J3oTUvALXxh1UB06PRFPPxGEEZnsvtJjgJ9UYtDrOcF22Ow5ej2G53Evw==
X-Received: by 2002:a17:907:ea8:b0:aec:56e0:c4a9 with SMTP id a640c23a62f3a-aec56e0c8f5mr139334766b.28.1752752015030;
        Thu, 17 Jul 2025 04:33:35 -0700 (PDT)
Received: from [192.168.1.107] (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aec53b053a4sm95354066b.139.2025.07.17.04.33.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Jul 2025 04:33:34 -0700 (PDT)
Message-ID: <3e640051-35e5-4eb8-aa00-cb57abcbb919@gmail.com>
Date: Thu, 17 Jul 2025 14:33:32 +0300
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/3] regulator: add s2dos05 regulator support
Content-Language: en-US
To: Dzmitry Sankouski <dsankouski@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>,
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20240617-starqltechn_integration_upstream-v5-0-ea1109029ba5@gmail.com>
 <20240617-starqltechn_integration_upstream-v5-3-ea1109029ba5@gmail.com>
 <7bec6fc2-6643-4ddf-9475-8ead4b312912@gmail.com>
 <CABTCjFBTY4NV2yKyRO31MacGFAnJ4T-viDLrXkPs9z66VU6nyQ@mail.gmail.com>
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
In-Reply-To: <CABTCjFBTY4NV2yKyRO31MacGFAnJ4T-viDLrXkPs9z66VU6nyQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 7/17/25 11:12, Dzmitry Sankouski wrote:
> чт, 17 июл. 2025 г. в 10:28, Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>:
>> On 9/26/24 12:47, Dzmitry Sankouski wrote:
>>> S2DOS05 has 1 buck and 4 LDO regulators, used for powering
>>> panel/touchscreen.
>>>
>>> Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>
>> When is this going to get merged? This patch brings the regulators
>> functionality of the pmic, so not having it merged is odd. This PMIC is
>> used on other devices too, like the Galaxy S22.
>>
>> It seems like this has been hanging for almost an year at this point.
>> If the author won't, will somebody resend it?
>
> It's already merged, see
> https://lore.kernel.org/all/20240617-starqltechn_integration_upstream-v5-2-ea1109029ba5@gmail.com/

I don't see patch 3/3 being merged anywhere, nor is it in my linux-next clone
from today. Do you _not_ need it anymore?

Best regards,
Ivaylo

>

