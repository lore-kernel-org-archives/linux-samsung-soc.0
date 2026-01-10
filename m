Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 824EC1A2545
	for <linux-samsung-soc@vger.kernel.org>; Sat, 10 Jan 2026 02:17:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768011423; cv=none; b=XFE60CGKxPfccaURGYg4xJXugCT1yj5H6UBhcCxic3kObBWByiIRwn77oZywJqJCro2hOrT09+ah9ciojR4sydWXqnTjizGosTSnAQFzJtIQsADyv5hIdWOgKHZwh7FsvQwqYBzy9QGBuat97ZBLSa9q19ZE4A3ge5C7/BV9HqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768011423; c=relaxed/simple;
	bh=MR82Uddn6LpIx7Prbvd5G0/4W/Nrnou4KGzkP2OeRrw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=L6mNWMpFmXOUOQCThqBe7VjF47459Qd/7pE+ug6xulSPgZB87xQw1weblNznJ7tVdO5fRvyVq27T6eoWrX/bCrEsGyzXUZm8IOn8csBw8io9VM05BVqYWVkyAfEUDOYtqy1bo8BYReao8hwNLCIhMc9myY5wQPVVW2WTMhJXsq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=cU9icCWA; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="cU9icCWA"
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-79028cb7f92so45827957b3.2
        for <linux-samsung-soc@vger.kernel.org>; Fri, 09 Jan 2026 18:17:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1768011421; x=1768616221; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/CS+sPGCudOBw/4dF2tLtNG4zOFpBZ8fj0ZBfM+xSUg=;
        b=cU9icCWAe69IHgPF9ny/jE9bgV79h1TuCqsvuhAsSJ8+MRS9KeAAyXPKT5oP+lxnQq
         tZvDL5TpoeaTaVMSSL6w1+Y0oZon0bnl0i8fOhgVcxYeD03/3H4l1c5KFtp1ESOjD7zn
         Uiyv9mEFNX1ctzeKBUb8WDIw5HvzIhxF5Tm6JkbRoc5v8FhH9erwYfGAijysBUuYp7lh
         0FyhWdaqhhEZ4gNvCOvXAZSDQRdSHNMdMTx+Ln/Cp9uzfNtAD8p7dM024iO8HGm9/JO/
         +o6wIe7g46q+ELhPPSCeKTWNziX7YdmLkg5R3IJ0wKzh3Np5niXILsWzlti/TQuOr4Vb
         Zkrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768011421; x=1768616221;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/CS+sPGCudOBw/4dF2tLtNG4zOFpBZ8fj0ZBfM+xSUg=;
        b=SG4urTi68E0JuRGp02FdZmeEgoSZqIIunjTONfMupJJKzuKC/9hx5ZdeOPC1tFiM7I
         YsQxEYgOWO6SuteqS649y6dVAdJaQ5EdsHzSiqhKIZBuTwQ9JFJWKvYxx0uxw8udhYC5
         uHXOmyAV/rsWbudwrTB0xHj0J4R97gqbHp+IR8z5/JrLeL+eVPekJMW73o+UZabt3DnQ
         YeaZqBgA0cX+ugRpHHMRU4o70TmwbMOQhK2OPhbSx8a/irjOr5YVuIiLwXYMQbuy3fD9
         2QH9aLp1IdbH6ZxkofzsKPPy0+6zSfiSZSFHiWzeGYHPPW0WJbR5ksTEgeyVk18+M4+d
         0TAQ==
X-Forwarded-Encrypted: i=1; AJvYcCVrJysYN33xOnF2v0hyrbL3MAVYPJHwTFu83U4o3LzFYRi6N/ut8vrvlYlfn0ILKUuAKB6LDYiDnwYWmA5UUoUvug==@vger.kernel.org
X-Gm-Message-State: AOJu0YxvLlB/e5Wsnx2Gucn9rwwsvG2C1+8/ERwvCd/85g9CAr68tJyf
	MY9T1LfEt8wyUz11o70UlRDo+mpMT16tkPCPD57FkYDkupPXMX9DZ5pPD5W4PI60Ww==
X-Gm-Gg: AY/fxX4Es6son+xBJk75B2TG/oJvnkjjASjQykNYvLLSsoYJoQkwW0yDHjVXzej7PQP
	ZHP7jPOkGyZdpvT/Objh80pWNe4TnvrIOyYTms6ncJ1z7SSZBZeqO8E9HPYvYQp9nsgni3pjTEm
	GHUEQDH34+StvelWI9c4607VRPuv/1R2ipxsZQ1j7CEWQYGPGzRHUqFa+G6AYVTJPXW7U8SGbpA
	EDjCGFkmTMXWdhsXqcFAdQTAovz4UXdnjr0Lu3SmiQy951gWk2NDMZzmnAmfFl0uWwVJ7p9WXXe
	h5msTi18u6HPFo844icMtS9yQam060IBfuZ2r3JC+IdE5IFWofl/zWGaEP6ZwesotgSDZlo4YJu
	BcBhjaugYVrb7M7D+mQt1uKkKYExjpcAKphv/Uqu/KSw2JDdxoq2LcfZJaa+7OA4mOxlan+JsaW
	SbUiMtPHH7zbd0XBEbOmTBH88jdpEoy6n0WdapxTXCck6SmnP7avv3r82m3vhuesfm39JyZA==
X-Google-Smtp-Source: AGHT+IGX5MeGSKttRFeAc0MSgP/y2VLZfmVAUtwN+S37FdIJqLLc9vxJfr4q2stpMVFT7lLIyB/0qA==
X-Received: by 2002:a05:690c:6809:b0:78f:a6e7:76d8 with SMTP id 00721157ae682-790b5758359mr102216847b3.18.1768011421232;
        Fri, 09 Jan 2026 18:17:01 -0800 (PST)
Received: from ?IPV6:2600:1700:4570:89a0:1dd1:9ef2:39ca:beb4? ([2600:1700:4570:89a0:1dd1:9ef2:39ca:beb4])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-790aa553ac3sm47388137b3.5.2026.01.09.18.16.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Jan 2026 18:17:00 -0800 (PST)
Message-ID: <9f94993e-dd69-4c9e-b467-aad6031c83d4@google.com>
Date: Fri, 9 Jan 2026 18:16:57 -0800
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/5] usb: typec: tcpm/tcpci_maxim: deprecate WAR for
 setting charger mode
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?=
 <andre.draszik@linaro.org>, Lee Jones <lee@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Badhri Jagan Sridharan <badhri@google.com>,
 Peter Griffin <peter.griffin@linaro.org>,
 Tudor Ambarus <tudor.ambarus@linaro.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, RD Babiera <rdbabiera@google.com>,
 Kyle Tso <kyletso@google.com>
References: <20251227-max77759-charger-v3-0-54e664f5ca92@google.com>
 <20251227-max77759-charger-v3-5-54e664f5ca92@google.com>
 <aWD_RIPp1ULH9St1@kuha>
From: Amit Sunil Dhamne <amitsd@google.com>
Content-Language: en-US
In-Reply-To: <aWD_RIPp1ULH9St1@kuha>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Heikki,

Thanks for the review!

On 1/9/26 5:14 AM, Heikki Krogerus wrote:
> Hi,
>
>> +	if (source) {
>> +		if (!regulator_is_enabled(chip->vbus_reg))
>> +			ret = regulator_enable(chip->vbus_reg);
>> +	} else {
>> +		if (regulator_is_enabled(chip->vbus_reg))
>> +			ret = regulator_disable(chip->vbus_reg);
>> +	}
> It looks like you have to do one more round, so can drop the
> regulator_is_enabled() checks and just always enable/disable it
> unconditionally.
>
>         if (source)
> 		ret = regulator_enable(chip->vbus_reg);
> 	else
> 		ret = regulator_disable(chip->vbus_reg);

The regulator framework uses refcounting on the number of enables. If
the number of times regulator is disabled > enabled, a warning will be
thrown. Also, I don't want to call regulator_enable more than once for
the same refcounting reason (will have to call disable those many number
of times to actually disable).

> I don't think you need the check in any case, but if I've understood
> this correctly, you should not use that check when the regulator does
> not support that check because then the API claims it's always
> enabled. So I guess in that case "if (!regulator_is_enabled())" may
> not work as expected, and you may actually be left with a disabled
> regulator. This may not be a problem on current platforms, but who
> knows what happens in the future.

I don't think this should be an issue in the future as this driver is
specifically meant for max77759_tcpci device and should only be used
with max77759 charger (they both exist only in the same package). And
that the max77759_charger driver does implement the callback. However,
if you think that regulator_is_enabled() is unreliable, I could track
the state within the tcpci driver instead of calling
regulator_is_enabled() and call enable/disable regulator accordingly.

Let me know wdyt and I'll update the next revision accordingly.


BR,

Amit

>
> thanks,
>
