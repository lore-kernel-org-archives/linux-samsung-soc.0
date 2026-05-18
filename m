Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97E873F0AAD
	for <linux-samsung-soc@vger.kernel.org>; Mon, 18 May 2026 11:11:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779102673; cv=none; b=gLC0PLjmDRa3e1yk4QLnINpP/remQgXTfwQ4zlAuVU1XHUN747RSzywfUev6HuZqfjQEnK5BqOFUbmybWF72c5jsQzTd3aEcVVoG21iCNwGRClil+FNFFph1mlF05T9nLqdZZb1dbHnEAaPi67ngw9CjoJGNW9XeJil/XNHNEEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779102673; c=relaxed/simple;
	bh=eBGNN3cQ1oYBHdEWTtUpFu68vN1lWzsFe48wsiQL2RM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=b5XcrVnYCdpssNjafDe7agM6ugVrC+NXfWM6ljfdcSkaquLfEpdNVrEN705AX0iFWfJGEXrqixxKzbAKl+CTf5zVjAfBiRRXBUXOhDEwY+KmsunNz8QRXkFuBcmpXY40yWr6MsEM7iKQ7Cy56sb/uV8KtwKC2GL1pfy+hsqIOW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VpqpthSy; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VpqpthSy"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-4585a116a4aso1702851f8f.3
        for <linux-samsung-soc@vger.kernel.org>; Mon, 18 May 2026 04:11:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779102670; x=1779707470; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rhSlpTxKQOIIhfQZpsJkH8iQwD455XYlIgQYrUpDW9c=;
        b=VpqpthSy+pmFocyvGhWrlYkP5ReVhyLWPU8Kwy+FYwcdNrLF+1swdHTX1YPQRHlnm9
         eYs6zU1BYDAhzXgzpoixxRGj9WGhJcCJFz/7uxGysVC4epBE3H2xPZU7dfVi41z4t/f7
         4UmDMtCmH1GDGrrzvuBjtpY7Nvwqvx0A6L+vyZ7fOdjAF2Rob3fzCP8I//2d/Do/1oCi
         nSM2C/5mHkOwabffHLItuG12HohHKyIMEgSoEjmxFXmZ9Mw22No6byGXuYEFQOrGa9k4
         m1HhaQF747usylp0ywUsP0WYwEhoQcIbgWnebTDyXec+4g4mVB4PndLMZf9GaW3CUh29
         HfNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779102670; x=1779707470;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rhSlpTxKQOIIhfQZpsJkH8iQwD455XYlIgQYrUpDW9c=;
        b=XTxOyBA+FXdNkT/wynNM0o1IU/2j7vhUMF7deudHZ7dyfrXOAyUEnjFI4zTcP+soaH
         3PDS0ln9VEJrNcq5H3dHx4v3PRwyNBvQrb4s650ylcz0dHu8OSv4mVGYuD2tYv7PgV4K
         ccdiLMH87TW3v7dZA6yFyi4uUelFt2HDC8m1GsG7hmMOdPkACo9fGvy6o55Qbu10M7Ud
         Bw96k1UXRciBq7CerawXhB5MptnzAlzYIBMk1knfvrpYPRnjq+gmYj/3j+S4oaC4QmfG
         9nLOpmcwyIoxXVFaTezv36KLS0yFFqhen2rd8vErEBwzTdfO7TOJSKNPnFh9EBGw8D3G
         FqZg==
X-Forwarded-Encrypted: i=1; AFNElJ9LNkCZSUXUplgPCiikbSk4BfkD3qlhudR0PCg/WBgWR3k47pg+/J+QxBjX5mPnN3mE8NW10aWQysOyvz144umTgg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3ucMml7luBG1p/v+mHSNAgSBz+qeS4TqnJl8TtSZ1dK7Q/bOz
	1a4IWDPlvn/Z0EN0vwZJNAslFk4XcIhm3NX7ckcTDogBBUWzGm3mxeZkMK8lXBY8hZQ=
X-Gm-Gg: Acq92OFRIdRLQyWhm/yF663gL9ye9FHAb+ax7VFKrtIwzoVVj4f5rH/j+9wMFInIPCZ
	AEzj5BzR9Lmx3rc7GBD/Iud/Bbjps31OYDCxmSK+WvQcDxZK7xWDrw8O47jeBXqFY5sqI08V+VZ
	O8pAV+hgTOsprY3JCloSt4uT3paU0mzPrRNBKV/+2gay/FTKV7KJNA6DxG0oijg89I2NS05SqOK
	NpKp0ipAQkVadcTvv2IWGODpMRMTfdvnQHWchZt7H1k5O8mImt+pOGsOEG5q018JtmDSNVQPlSy
	OyaRNxITsH90SKG8WZou7hQtSsBfoKaBbW8goei0wWMqOkTUXNqtAx7HV4mX1txqvaR3ngmr676
	ilXjcWQlWMXplWgoBSxYVWI6RfpuXTdi22wvMX+d7BmN72ntLDWBiaTxkkSA0P6QzAjrIZEZK5i
	+tzCjrqKmWG2dvurlT16pjWCldYKZQ5SY=
X-Received: by 2002:a05:6000:25c4:b0:452:c246:ab79 with SMTP id ffacd0b85a97d-45e5c5894b7mr24451750f8f.14.1779102669836;
        Mon, 18 May 2026 04:11:09 -0700 (PDT)
Received: from [10.11.12.109] ([82.76.215.73])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45d9ec39806sm35689863f8f.9.2026.05.18.04.11.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 May 2026 04:11:09 -0700 (PDT)
Message-ID: <52063f07-626a-4f60-ab62-66f5df5f837d@linaro.org>
Date: Mon, 18 May 2026 14:11:08 +0300
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] firmware: samsung: acpm: add Exynos850 support
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Alexey Klimov <alexey.klimov@linaro.org>,
 Sam Protsenko <semen.protsenko@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Peter Griffin <peter.griffin@linaro.org>,
 linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260513-exynos850-acpm-firmware-support-v1-0-3858d097e433@linaro.org>
 <20260513-exynos850-acpm-firmware-support-v1-2-3858d097e433@linaro.org>
 <6802a856-76dc-4bd0-a026-59b0249646af@linaro.org>
 <b1631f32-aafb-46fc-86c8-daff0d6dc2f7@kernel.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <b1631f32-aafb-46fc-86c8-daff0d6dc2f7@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 5/18/26 1:46 PM, Krzysztof Kozlowski wrote:
> On 18/05/2026 12:27, Tudor Ambarus wrote:
>>
>>
>> On 5/13/26 2:12 AM, Alexey Klimov wrote:
>>> The Exynos850 SoC contains an APM co-processor. Communication
>>> with this hardware block is established using the ACPM protocol,
>>> which handles IPC messages for clocks, power, thermal management,
>>> and PMIC control.
>>>
>>> Add the "samsung,exynos850-acpm-ipc" compatible string along with
>>> its associated match data. This includes the specific initialisation
>>
>> s/initialisation/initialization 
> 
> Hoho, careful, that's a quite hot topic :)

:)

> I think we do not have kernel-wide preference here and even if there
> was, no need to resend just for that.

I wasn't aware of the British term (thanks Alexey!) and I already gave
my R-b. No hot topic for me, thought that it's just a typo.

Cheers,
ta
