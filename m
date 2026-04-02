Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE61C258CE5
	for <linux-samsung-soc@vger.kernel.org>; Thu,  2 Apr 2026 01:25:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775093161; cv=none; b=fvsNgbgTOXP906u7s1UXz77qGmF2l3a0q9BhBBELiIMI0KP2QXCBC2PeMwSnIX2xb+GySV8c13dwZG9hganKq9Fs1zZ5QZ6DXSpNKMV4Q3GRcI12Ck5PHrJ3I/jYvcldC/DuxsEUM50K5bgVz1pIlCr3sP+5B+/jMYsOys9QO44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775093161; c=relaxed/simple;
	bh=evfYIKJkPHZ9+yUV/8inPLH60gyR9XmPjdvpEZbmVHQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TGgdj9vMzT/CuX5O6An48MlBpcdqi4gn02M2uHFgn+vizmTpUQXaoq7XdgXSvVW5kqv7XTpKdgt/xoAvZYk6dnL9EGMjSNyN6J9xKYpfFpYI8yOl6azhpvWBCJ7ZRyx39xcIHt1di+w+NH7kMDdbDQzvhwENbkLR+g4nXnqe39Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=pWvMSrP3; arc=none smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="pWvMSrP3"
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-2c18af885c0so775243eec.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 01 Apr 2026 18:25:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1775093159; x=1775697959; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=w0TTSvzfniH028lzX8No8jAcQ7PnQHkFWjL5CrlFmII=;
        b=pWvMSrP3g3ebFOk9pjA+H3/BmMbMXn55mhxlpTneELsRD5dm9b3Z13QXPMg2wNxWJj
         peOALi5jY/t49jCgxJCk+Awr2EJypLlL+IuRnVWsUidtpceq7KW5crNXY51Rg15XzMXq
         ubwZ12FgnPQK8HJSLDyOfbblGV/s1rTXWnbNkkRusbXqqz7ozQXGIILiDH6LeyQAMCtR
         L2gj/QAR1elR9jjdD0Ow+6pdw/WC/MsdXUwIe4KpBjpixkgr6JQGK5mqjH65hzEZrrh1
         adc7CbKr1xMzgVqNgyjFULbvlFGSo0h38K2UYEmGZJpTThgOrVNwnefrb5r9pttNX0Re
         Fw0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775093159; x=1775697959;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w0TTSvzfniH028lzX8No8jAcQ7PnQHkFWjL5CrlFmII=;
        b=Utycyy2x1oWDbvvrpF7H1b9fqEdc2PWNHQj0WFGLK575ux1SOjiX4Rz01dE9exlavQ
         +LNqBYLXU0324QQc1bR6b+pmS0ozQ3DD0OhTbyaoNNuI15U2pKCQeo5KUJhR+xlZmr6R
         DVJ0Nww92NX+EGQ4fqPnzkaRZ2DopMAP43TMNyRrpcb3Beyvg51n56n+DLK4zVO2nbP0
         VUuIUWaoSOiF0JIQN7KhAmiTje0CWZYTSRYmcTzLnGavUxwOp4PZpz3k+LKt9+9VrOXj
         MXby/MNKYnjos+1IoRWhsu9Pkepr94CXduMgb/MXxKYay4qkzUkAG7CbBZV6ZDKZvsPN
         yHfw==
X-Forwarded-Encrypted: i=1; AJvYcCU+9vr1szkHOGyi/a2dFVfRkaWPX6A0BWB5eyj2PIbspqPGjUJqNQ7Syxtd2Urc3J9EfR5+z01xWJt87qPQhdSIJw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzDN+s7wuys4ILEQPwYjO1+KkxOwLorOil+I0zLzDm/qx15oJkQ
	CEe2x0dxPePa6wVbBhhBzF6pS+nM6qC79zefygMNTGYHQdkr8CyT3d/79mXi2EYgdg==
X-Gm-Gg: ATEYQzxV62ndomJIeMwEt1mCiyA73pdxMGNKsPII8Dm1Krwc2dsvCm/gZOoTpuCiONi
	OyqYd6j0D2/Xud1hs4N5y9xQjUbs8gLYkZnSshJo1n7vd282Zzs35el+pMWhzqdXh+ZEYMaY77W
	TkjhPOqQEbq7b5kVGk8/xaELSjovFICBZNejQzP0iLPN27wdRXwyLz9Sphz7UxLQL4/Sj2MWRvc
	bYkta2lsHDTofY6I6GcFQGp4pZ4zyy5e5yIk72TjqWYbbKXgwwf85yC5rb46wmI1StOSMXcxoQi
	BXUtnFeiMUbjgUpaquO3/2A/coGG9wncdWsNUdksSDjQW0Yz1H8yFGMxN9QFLFFR6o9F0umvQh3
	ev9qd0c6O8z2qQ2dK7rg0TgEdebf46I/RQ6aFe4WoStAWr3lHJMwMw/Um0ye7qQiNQj5PShtvMO
	aPqTLYdSnCYwEn9ufXomAinRjrlhkVJVpwnteSS61XnzvJbPNJYjSD+MWDXriRZ4g6wc7DsWaUT
	2dCQl6qDg+p5MLSWnFFihbpoQ==
X-Received: by 2002:a05:7301:fa0d:b0:2c1:6676:5ebd with SMTP id 5a478bee46e88-2c930e6b1fbmr3100327eec.10.1775093158301;
        Wed, 01 Apr 2026 18:25:58 -0700 (PDT)
Received: from ?IPV6:2a00:79e0:2e7c:9:862b:f392:67fb:ffb1? ([2a00:79e0:2e7c:9:862b:f392:67fb:ffb1])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ca7cf1271asm1676362eec.26.2026.04.01.18.25.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Apr 2026 18:25:57 -0700 (PDT)
Message-ID: <dc670de4-2dae-4d5e-bf15-ac52c5a0868a@google.com>
Date: Wed, 1 Apr 2026 18:25:55 -0700
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 5/6] power: supply: max77759: add charger driver
To: Sebastian Reichel <sre@kernel.org>
Cc: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jagan Sridharan <badhri@google.com>, Mark Brown <broonie@kernel.org>,
 Matti Vaittinen <mazziesaccount@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Peter Griffin <peter.griffin@linaro.org>,
 Tudor Ambarus <tudor.ambarus@linaro.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, RD Babiera <rdbabiera@google.com>,
 Kyle Tso <kyletso@google.com>
References: <20260331-max77759-charger-v10-0-76f59233c369@google.com>
 <20260331-max77759-charger-v10-5-76f59233c369@google.com>
 <ac2jYUA2F5oQsA2g@venus>
From: Amit Sunil Dhamne <amitsd@google.com>
Content-Language: en-US
In-Reply-To: <ac2jYUA2F5oQsA2g@venus>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Sebastian,

Thanks for the review!

On 4/1/26 4:17 PM, Sebastian Reichel wrote:
> Hi,
>
> On Tue, Mar 31, 2026 at 11:22:20PM +0000, Amit Sunil Dhamne via B4 Relay wrote:
>> +/* Charge Termination Voltage Limits (in mV) */
>> +static const struct linear_range chg_cv_prm_ranges[] = {
>> +	LINEAR_RANGE(3800, 0x38, 0x39, 100),
>> +	LINEAR_RANGE(4000, 0x0, 0x32, 10),
>> +};
> Let me quote from include/linux/power_supply.h:
>
>  * All voltages, currents, charges, energies, time and temperatures in uV,
>  * µA, µAh, µWh, seconds and tenths of degree Celsius unless otherwise
>  * stated. It's driver's job to convert its raw values to units in which
>  * this class operates.
>
> What makes you think that CONSTANT_CHARGE_VOLTAGE_MAX is
> special?
>
> [...]

It was an oversight, I will fix it.


>
>> +static int max77759_charger_get_property(struct power_supply *psy,
>> +					 enum power_supply_property psp,
>> +					 union power_supply_propval *pval)
>> +{
>> +	struct max77759_charger *chg = power_supply_get_drvdata(psy);
>> +	int ret;
>> +
>> +	switch (psp) {
>> +	case POWER_SUPPLY_PROP_ONLINE:
>> +		ret = get_online(chg);
>> +		break;
>> +	case POWER_SUPPLY_PROP_PRESENT:
>> +		ret = charger_input_valid(chg);
>> +		break;
>> +	case POWER_SUPPLY_PROP_STATUS:
>> +		ret = get_status(chg);
>> +		break;
>> +	case POWER_SUPPLY_PROP_CHARGE_TYPE:
>> +		ret = get_charge_type(chg);
>> +		break;
>> +	case POWER_SUPPLY_PROP_HEALTH:
>> +		ret = get_health(chg);
>> +		break;
>> +	case POWER_SUPPLY_PROP_CONSTANT_CHARGE_CURRENT_MAX:
>> +		ret = get_fast_charge_current(chg);
>> +		break;
>> +	case POWER_SUPPLY_PROP_CONSTANT_CHARGE_VOLTAGE_MAX:
>> +		ret = get_float_voltage(chg);
>> +		break;
>> +	case POWER_SUPPLY_PROP_INPUT_CURRENT_LIMIT:
>> +		ret = get_input_current_limit(chg);
>> +		break;
>> +	default:
>> +		ret = -EINVAL;
>> +	}
>> +
>> +	pval->intval = ret;
>> +	return ret < 0 ? ret : 0;
> As people like to use existing drivers as reference this definitely
> needs a comment, that none of the properties used by this driver
> support negative values. This is not a general thing as e.g. the
> CHARGE current may be negative depending on the battery being
> charged or discharged (OTG mode).

Ah okay, thanks for letting me know. I will add a comment.


As these patches are already in flight and part of usb-next of the usb
tree, I can send the suggested improvements as a separate patch, if that
works for you and Greg.


BR,

Amit

>
> Greetings,
>
> -- Sebastian
