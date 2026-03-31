Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ACCB3590A9
	for <linux-samsung-soc@vger.kernel.org>; Tue, 31 Mar 2026 20:39:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774989583; cv=none; b=kvvIj+jPRT4wbjdf2H9hha3Blr5yiTS5e8t38HCv/MbS1GFTacloqorMNwiYSVAajnUAcnIDGZ97vYfGKhoAUj51fsodm9NdI/zURkKqRPR+W5nOJUitQl9rbkJX/pm01GXidD5sEU3B4tDrhBdPP6/6FthAVRR0AjsMyNwXVYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774989583; c=relaxed/simple;
	bh=HP1NLiOIWXUdUXadhKy3DijqQs/PEm5plRHuOWWD/BE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=blqMtLdB9RBj4mDSGjb+5cjO+VNg3gppjlqSbJFB56Vd6ZBe4Bt4T5X82sMEHw2kS/Y3W3avpND+wTbRs2zYbgVcNdrR9PtGN1GYPkKhqMz98VhhgQmdFs5kEo67Km92ieRUAnopx6RjcSLgj6XznzEiOQ2bi8bCwcRJ+6ylfu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=DPBpTV4h; arc=none smtp.client-ip=74.125.82.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="DPBpTV4h"
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-12732165d1eso8507512c88.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 31 Mar 2026 13:39:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774989579; x=1775594379; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZRCQMa9zMGlvIHkM8ghTZ/x9mDeTjIV8vVymtj5kVU4=;
        b=DPBpTV4h5w2BFiOw69qC+snsZ6UIPwzQUE28J8UvFype6PVntmyF2izsLsD3mVkNpo
         hEX0V2St3RZ/fo7/DNSHVdP/nRF2pDhUmS82K+mOK0dKLWg0ZEy1SHHW/KYikQ6jlmg+
         /QRCmbdxAr0z30oIdubZGSvnCXv5vPZiAGAtiIx50CcbCaB5Btz2XYpoebS2eGo1nAtX
         JzST46OlyDicpt9dwVPP7+vuVa4HMyPUXC+3QyUTgQeBHwd89ewVamIHDySTBvH3i+Kx
         puL+W9SyIIYqID6hvy2VtRKnfNMKP0CUzKemuiDoGSRs3jWdKjyStdNPB0ufQutwUP4S
         iufQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774989579; x=1775594379;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZRCQMa9zMGlvIHkM8ghTZ/x9mDeTjIV8vVymtj5kVU4=;
        b=q6GnvBr0i7VkP0A8o1pDHdDyj15szjAX+DU2pFuBOvdarwMiDMzwIQaYG4S+D/02jE
         aYsTj0BC5X6K5CycAq1S4shjiylk4QjOb6hp3Kss1LQiqFDPmDEisqQgGsqlkMisym6y
         fE9OOkytp5upLmg/qyvkOdIbLpPk++Xi8Ws6Ik6ZljUjTvCgad0slVtgrK9B1pq4iDd/
         53/UJz29dZHxrx6zTX/cm4AizQgu/feRQmzFhfYGmbZZ5W/zedU6FSxv7GUabb3GYPwu
         G+0RmUPHIH2xqQS54frgFH8QeVUlLu6/8ih71TmFdB3M+gAdRAMu2pNUDbfdwaXBfIgW
         pFkQ==
X-Forwarded-Encrypted: i=1; AJvYcCX1q2KrrPoKcjzy5aQaUFzd8oqtre7gSOKQ9xEaqUKbq23iEFJ5ATDtyUQ9WzK11+K7BrHeRJDikDgIs6D2/p1atA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxioC5QU1V56zoBlZYVvFuptUTfQtvvQ/dJpjqIsJkc2FaU5YMO
	u1HlHk268rJkI710tUBq9ejZbS+Kx7Up0dubggf2AuOSIP9RBb/bPqBbssILJDrNAw==
X-Gm-Gg: ATEYQzwB2GrqxdgmSG+xrO7hsTdBc9Kd73+Q8+bfmpGkV+j+8A70H+UXPI+4vPkR6Et
	+Sn9yxjs/OB6O7T55YZgdg5gk415hZOb/WibUnA2o5JxRR+AoGMyGrl57o6g/r2krPO4OQzdNDY
	+ZSUJMx6V4vEMehsa9Fj3UZw+zBW/FUmCvzBVeWJwSZe1lzGiL9iKdMnWkjHlUzksdQe85rJDVq
	0fGJoqHTEI/K4j6L0d5mfxLCbokjBPC+IiWyltOnfuJMyejYYDvIUN4tv/rWljMh1MZQ9ovuY8e
	5qYlrnEy3K/6HkaX8QO+RgZ/beVIbRgWop4hMczPijCfdpHsPo3IWDCUBqFhaXcw5aLIC/tf9TD
	i8m82whQ/HfGV99FyYZ9O9ijsF7+ciTal4esfaLqAJxyHLtB4qHTkZVX3HkSR2gAA0mMdm5TgEI
	qpqQ6cV+x+nWfAsxNrTKF1LtL3usFNIjQ87V9ZIA3MtAsFukCk/4O3j+e707N7t3E1JEb2oar5N
	0DNQnS5Yw6m34z7cKeU4Qo3Rw==
X-Received: by 2002:a05:7022:41aa:b0:128:d494:a1ab with SMTP id a92af1059eb24-12be649eb12mr512442c88.15.1774989578723;
        Tue, 31 Mar 2026 13:39:38 -0700 (PDT)
Received: from ?IPV6:2a00:79e0:2e7c:8:6a92:85c3:5cd5:d23d? ([2a00:79e0:2e7c:8:6a92:85c3:5cd5:d23d])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12ab983f9f3sm16792226c88.10.2026.03.31.13.39.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2026 13:39:38 -0700 (PDT)
Message-ID: <e5384261-7a9d-4c24-8387-6002268f5c1d@google.com>
Date: Tue, 31 Mar 2026 13:39:33 -0700
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 3/6] mfd: max77759: add register bitmasks and modify
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
References: <20260325-max77759-charger-v9-0-4486dd297adc@google.com>
 <20260325-max77759-charger-v9-3-4486dd297adc@google.com>
 <20260331123138.GE3795166@google.com>
Content-Language: en-US
From: Amit Sunil Dhamne <amitsd@google.com>
In-Reply-To: <20260331123138.GE3795166@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Lee,

On 3/31/26 5:31 AM, Lee Jones wrote:
> On Wed, 25 Mar 2026, Amit Sunil Dhamne via B4 Relay wrote:
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
>>   drivers/mfd/max77759.c       |  95 ++++++++++++++++++++++---
>>   include/linux/mfd/max77759.h | 166 +++++++++++++++++++++++++++++++++++--------
>>   2 files changed, 222 insertions(+), 39 deletions(-)
>>
> [...]
>
>> +/*
>> + * enum max77759_chgr_chgin_dtls_status - Charger Input Status
>> + * @MAX77759_CHGR_CHGIN_DTLS_VBUS_UNDERVOLTAGE:
>> + *     Charger input voltage (Vchgin) < Under Voltage Threshold (Vuvlo)
>> + * @MAX77759_CHGR_CHGIN_DTLS_VBUS_MARGINAL_VOLTAGE: Vchgin > Vuvlo and
>> + *     Vchgin < (Battery Voltage (Vbatt) + system voltage (Vsys))
>> + * @MAX77759_CHGR_CHGIN_DTLS_VBUS_OVERVOLTAGE:
>> + *     Vchgin > Over Voltage threshold (Vovlo)
>> + * @MAX77759_CHGR_CHGIN_DTLS_VBUS_VALID:
>> + *     Vchgin > Vuvlo, Vchgin < Vovlo and Vchgin > (Vsys + Vbatt)
>> + */
> This comment is masquerading as a kernel-doc header, but isn't actually
> kernel-doc.  Either change the formatting or adapt the formatting to use
> /** and use W=1 to check it.
Thanks for pointing this out! I'll fix this in the next version and 
ensure it's a proper kernel-doc block.

BR,

Amit

>> +enum max77759_chgr_chgin_dtls_status {
>> +	MAX77759_CHGR_CHGIN_DTLS_VBUS_UNDERVOLTAGE,
>> +	MAX77759_CHGR_CHGIN_DTLS_VBUS_MARGINAL_VOLTAGE,
>> +	MAX77759_CHGR_CHGIN_DTLS_VBUS_OVERVOLTAGE,
>> +	MAX77759_CHGR_CHGIN_DTLS_VBUS_VALID,
>> +};
