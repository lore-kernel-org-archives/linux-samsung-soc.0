Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1F9B53A7;
	Fri, 29 Aug 2025 11:04:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756465459; cv=none; b=RxdpbJ6gAE0LmJkQuedZGUqaJUAMtHHtxkQxr4Ps+WULx5f39v/ZBcwxpywjuUOKuO749+4X3cMKxg98A0Ustfz63hULXIfQZYYDu832rwWjbmsi8l3fSeyMrIQktDKv6Ofn/4v1/ewbD4w3X873hAYXb3wcg+RtYC+BgynWUiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756465459; c=relaxed/simple;
	bh=hU+tU2VplCkY1jCg7NY/C6SasU1xb9pS0yR/WEPfMWQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=f6OcFe55fXncAp2EqQ0ueEGb5C7WC69wzJobWXr7Ud9FJP36P6cH26do50Uhe9W9omgjikbLUwqzQqQjR/5HV7tX9l9bNVR0r+Edzt1VLiKD72kqrEW7G2TnswygKQXOwJXsI8EgqK/IEfTblog3Y/K5dLXS11NmLWpIEsAY+P4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ig5G8nXV; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ig5G8nXV"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-61cb9e039d9so3719764a12.1;
        Fri, 29 Aug 2025 04:04:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756465455; x=1757070255; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hU+tU2VplCkY1jCg7NY/C6SasU1xb9pS0yR/WEPfMWQ=;
        b=Ig5G8nXVGTPgWjozvbwsVlI57o+KWPHPHNnAHNs8/2XmksRSj1LePGkuIFlh/fdaJH
         wYRwJZHM5Y4gXHm2lpFA13p2lQ5lzIhon0kF+kYiYzzISnK8vpGTEhFpJzmCit+7hX0u
         oYZxnwQ7h/+VXRlS6V22+qLH6Kqw79f08sI5ysApFW7vuJaaF0fEa+W8wYKD89lpCvfG
         QyGEyhBRiIhEOx78ZFkDzTJbPIjj7QbnLzA5OgE5fPzaKVOXPJ58NY75HfAnyXk10VD1
         z9ajbtQUz5BLuREr3BioGAL6yb1+xCHF1RD9+e2OStiblkZLVwx9DO5vivGaj0NsjA86
         /9kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756465455; x=1757070255;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hU+tU2VplCkY1jCg7NY/C6SasU1xb9pS0yR/WEPfMWQ=;
        b=Wn60cxO3MWN/Dj9wQwbFrOG7IAyNbUCZ2lKhJqkk7Ew9y4KXxUCz4e9W4FLZV+/5UJ
         lUSVAjubGcL/T+BUm88SyS7P+gPU0WjN0/NnDjDsMXtoEuGE8IjppKeQP8ctESIsMIwb
         VtZ4/R9QdEgWbmJnQ4/OAfL4Kaw+eEeXJL4AygZ5+L1d3whOxEmDthSYf1t6c6Hu+aM+
         4pakKWoIHxNuV7Oj0phQUmXnhyKKnmRT/4wdPMOlHdXwndo/vydteZW2oVKuDQr8Dik6
         oEXaDhQe81FNkiDSVEIk4zDG2CzHgYo92hCoaU6k4P/E2/cvJqILrrEcWmE0NfC77Apc
         cdAg==
X-Forwarded-Encrypted: i=1; AJvYcCUnxtxiPv4VhtXaylyWYkzrD7Uq1DjhlxssWhmI8nPwBRbE1UYA3PGqH6gz2//tJW4vrV6XZUqsy5iztKOM@vger.kernel.org, AJvYcCVcey+R4eoPlyncMRVjBmYOa8NjSS9OYZW6zgMPCLeEU1Y/lyu75JzzmaJiYe6EmwDo43M4u1CNPobH@vger.kernel.org
X-Gm-Message-State: AOJu0Yy53sN0fCJPof/v0hsSjbbREBYa1h6jzLuXZXRku/SByEFPCWRi
	Bzc3YytdQ+q5vlMIBdqa7XUMXvreN1NVfncbkcwKGPqNKDOHHyf1Q/TvnlSymQ==
X-Gm-Gg: ASbGncv4MQvnsatpTnKCD+ysaBj+8qmbKXDhiGnBcndGB5nJdKCe5WNQGAznVU1kznp
	brOqcS4Zy/WbE2AcknLSeh6PHwcMjAisq2ApdKT1TUyQQ30Bbe4/Uudq4d9CsWOVD63ly5PSQEr
	UWq+es2yzMZlIKMXvih/YemFssI7GMhChOKKEp7RMwp8/3AlULxk25zFOy7BRBerbg2MJeaDe/z
	f2OMApcUJ2oFwFFBAR/tJhu8bHxKU5ubIU8Fj6PplmJ0rkfavMnutrpx73MpcYNy+SbpVuP/5DH
	1louf79bWzZFrfQMj7/DcsrVP7thBxuC28MfBE5m+x2hpA1MTn8Fau4mJE/cTIrEIpbyYYpls7Y
	Moky9lCQ26QFU6VNLpJSRfDedIhE/smoF4i+SLDGHURCAOODeWhMYT0vqf1dMzrHbiNQGuHIZzQ
	==
X-Google-Smtp-Source: AGHT+IEpjEEgJGol2tfKPNp2RrC4QuVEgEoma55i3wFC08IDA/HB59gsPcVPdBdqybmcvNhiYLRoEg==
X-Received: by 2002:a05:6402:24c1:b0:61a:9385:c790 with SMTP id 4fb4d7f45d1cf-61c1b6f9d26mr19627870a12.35.1756465454626;
        Fri, 29 Aug 2025 04:04:14 -0700 (PDT)
Received: from [10.82.207.1] (212-5-158-123.ip.btc-net.bg. [212.5.158.123])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-61cfc5572afsm1525721a12.50.2025.08.29.04.04.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 Aug 2025 04:04:14 -0700 (PDT)
Message-ID: <7e14b195-f383-45ee-a6b1-6e71fc8fea86@gmail.com>
Date: Fri, 29 Aug 2025 14:04:12 +0300
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/4] arm64: dts: exynos2200: introduce serial busses,
 except spi
Content-Language: en-US
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250815070500.3275491-1-ivo.ivanov.ivanov1@gmail.com>
 <31435f98-5701-4ae0-b822-11a99d1b2eef@gmail.com>
 <51240b84-b063-4b99-b755-cc958192fef2@kernel.org>
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
In-Reply-To: <51240b84-b063-4b99-b755-cc958192fef2@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 8/29/25 13:55, Krzysztof Kozlowski wrote:
> On 29/08/2025 12:40, Ivaylo Ivanov wrote:
>> On 8/15/25 10:04, Ivaylo Ivanov wrote:
>>> Hey, folks!
>>>
>>> This patchset adds serial busses, implemented in usi, for exynos2200.
>>> It's missing spi, due to me having troubles with reads when testing.
>>> Serial_0/1 have not been included in the patchset, as it seems like
>>> they're encapsulated in usi blocks, but are the only implemented
>>> protocol and/or do not have a dedicated register for setting other
>>> protocols in a sysreg. That'd at least require patches in the usi
>>> driver and bindings to add support for.
>>>
>>> About the naming convention for usi nodes, I've chosen to keep the
>>> downstream one instead of relabelling all to avoid confusion when
>>> cross-referencing the vendor DT and to keep consistency with clock
>>> names. They're labelled the same in the bootloader too.
>> BUMP - when is this going to get merged? I had a few other things
> OSSE25...

Ah right, my bad.

>
> You can help out by reviewing other patches on the mailing lists in
> order to relieve the burden of maintainers and move your patches higher
> up the list.

Yeah, sure. I never really did reviews before because I felt like mine wouldn't
hold much weight. But sure, I certainly can (and will). Thanks for your work :D

>
>
>> I wanted to upstream before merge cycle.
> You should have posted them already. b4 handles dependencies, this
> maintainer can read cover letters.

Yeah. I do things via send-email still, so rebasing is a bit of a pain when I need to
change stuff in previous patches. And I don't do new branches per patchset,
my hardware isn't.. the best.

Best regards,
Ivaylo

>
> I plan to clear my todo queue this weekend and close my merge window
> within two weeks due to travel.
>
> Best regards,
> Krzysztof

