Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B7EA28A3EF
	for <linux-samsung-soc@vger.kernel.org>; Wed,  6 Aug 2025 14:40:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754491244; cv=none; b=gEUF/DuPNNERGFzFELbPpwAYL4DRt9ivIQ9CKf8iD4VCl4PkhE6XUkaSNq7K4f2Da6EhUkvFeYCyyQ90qXR+v8/jkbZ5hLhCuB3OTR+GetwMncozSTBydPojyfF9uX0uF3CwQPoIxGv2badc+d5ai+8+FEaQ63dYxWc0PsaDMyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754491244; c=relaxed/simple;
	bh=Yq4+Yg+s7G/DTrQrYYUyQAh0fZYUk/b+sNrvPufl5IM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sLRxtNyVSG3WkDHrMBC5XaA3Shs4EBaaG/nh3tDqWlcdElZMYLyOaEQDVvhpIb9BDHS+iGfiixHE9AhvfGdTtvJ4MlIXENoxg41YuzRvfNvmeasMSB4ueIA16nLJZBfzxY5cM7jJ+b6NCbQYdAxb4ScWtJFj8c2Ne9Mum+9tZZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XChj0wWO; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XChj0wWO"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3b780bdda21so4747616f8f.3
        for <linux-samsung-soc@vger.kernel.org>; Wed, 06 Aug 2025 07:40:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754491241; x=1755096041; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mxj2Kb4c2cHaAqMwhewT0o+Azovwd0DMlxDKMvCajBE=;
        b=XChj0wWO5Tp4Yp421qM5Os0QsrX7SdEl9VRJA3a1n7Fa2Q/FwXbXREFqRSpwJPm7g6
         2rjZPWqHSjzJP0gFVlkBRDzDVG523hvv0XoK2glebcjz07evPic8e6izW4gHzMrvnDqe
         DmpIe/aRX+A2ZSS9cDNV4DrVOeMA+kP7TCcMM7ck83iIQb/xBikRncydIXEFRojyo/1W
         235y0n6kzKyS6ghZ6I18BmJ5fzunCUZ67JoMrjbQzV+iYR8nw4YKu8G2lMZ9rn5+AL7g
         Bg1/+I1IBRxypAB/A+ZEP2wUlHN8x++0jszdwcK231f7twOnKHlhdaf3kko6WqXFuUKE
         +IcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754491241; x=1755096041;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=mxj2Kb4c2cHaAqMwhewT0o+Azovwd0DMlxDKMvCajBE=;
        b=qsuwEkKJDs6R6fqOSdq69XUwyYseVMGkxqiNSdPdWVn6QCs0TGZRlhjF6LJien9Nzq
         H0kEi2Q2Nkh0FOS0sCGQjp+1cD/nejZGKIEIW9OIcLp4vIOpI6xlPwtO4//vn6yevsuQ
         KFms/XHuJRBikVvPXDE1LJ815KfDC8bLOUD0ia8C2s1NURsQzk+Jw4weKj4WlXN3Ny3t
         RiuUYctSBD+OPm0/AE0aKuVug4SzZPq+YVBqZOMOriLLe4mR0B5C952gv+6iIFOHNAeW
         WucfEf8NAv+OymAGcsJ4ELJ1tfDPp/rtzRjOG0K7u1LuOYze1Ek11RsbqElCFbQI/w+w
         ++jg==
X-Forwarded-Encrypted: i=1; AJvYcCXS2zqpeghk4a8zqHQf2TTncW45Qi39Pz/r2v6umevrYYdkwvId0apQFyET13MzfvThWCH3qX291+qYQ5P+5t/gOw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzQQlfYyd3I+yEuUSyVkmhJiOk/AoIbexaNlcOy5wRTwzEVlYUY
	o9TAaeEdDcG8L/p4eCHVzlBYpgsAzW7M6HCz+cxPo5H8b2SspRq9m4UyQ9m3tzUXI9A=
X-Gm-Gg: ASbGncsV/KtwIJBQTTu39IK6+PRG+ZwFGUZenU261Jk35j7J7l0WkGt4BMHmZIx5i3q
	TpiOngIziedkAsInQrd46Cyh5EzKi1eH7kYpsjsHKGAv5YiQZntrMQvjeXwgchybwQpm8eGg0m6
	ptG2a5WCDayF+A8cpsV5hEep5l66YedbdvYSK9Q17SDuEMjq4PPFmJQBaquHCztthxfr8ldqo0/
	+kKSZwn5JECfxIKhCNXQAsKfY4VL5oweyb92yFU/D6cWN2yBpeZ33e9Y90jN9oZ5rhYC9DRIYNB
	pP9t5pNtfMDuzI/97Yv25RwuxskmexUsiJj4xDLzRaw5OEjeRsJ5SoCEyyerc/kkaMm0VZIam2Y
	enj95ZNvqllkO1/PlCwbHz2BBd7mLnY00z0G+dh4TyAgmtI7yoF9vGf4rNPRgO4PmuaMUuYdApd
	E=
X-Google-Smtp-Source: AGHT+IE7HUmcdn6gMWzXwLK4pq9FeM3DNXOHuvSf2VKplEZd8b0DggW2fzVBdDHM8SmnOeSMsbaHBw==
X-Received: by 2002:a05:6000:18a9:b0:3b7:7ded:ddb1 with SMTP id ffacd0b85a97d-3b8f492004amr2533955f8f.33.1754491240547;
        Wed, 06 Aug 2025 07:40:40 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:96df:e381:55b8:1990? ([2a01:e0a:3d9:2080:96df:e381:55b8:1990])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c3b95e9sm22963623f8f.16.2025.08.06.07.40.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Aug 2025 07:40:39 -0700 (PDT)
Message-ID: <4f67b4f5-3dfe-4f5b-81a9-24fa7009b9af@linaro.org>
Date: Wed, 6 Aug 2025 16:40:39 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 1/2] phy: add new phy_notify_pmstate() api
To: Peter Griffin <peter.griffin@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I
 <kishon@kernel.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?=
 <andre.draszik@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, Krzysztof Kozlowski
 <krzk@kernel.org>, linux-phy@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, kernel-team@android.com,
 William Mcvicker <willmcvicker@google.com>
References: <20250703-phy-notify-pmstate-v2-0-fc1690439117@linaro.org>
 <20250703-phy-notify-pmstate-v2-1-fc1690439117@linaro.org>
 <e2lhm237c3xtbdjux2wuesq5fwu7nky3w7oq2fnsgn2pqcg5kh@xhxktriooyes>
 <aICKM-ebp9SMAkZ_@vaman>
 <yaz4ozb55t3pkwd2gj4l4d2hdspdcsqjm2dfsux7lfdxy6lxjl@uae2qz2vjo64>
 <CADrjBPpE0ab3MD6tAS-JQns1HaPfmngRhixkUpqqAfj_2D5nmw@mail.gmail.com>
From: Neil Armstrong <neil.armstrong@linaro.org>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <CADrjBPpE0ab3MD6tAS-JQns1HaPfmngRhixkUpqqAfj_2D5nmw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 25/07/2025 12:21, Peter Griffin wrote:
> Hi Vinod, Mani & Neil,
> 
> Thanks a lot for the valuable review feedback.
> 
> On Wed, 23 Jul 2025 at 09:04, Manivannan Sadhasivam <mani@kernel.org> wrote:
>>
>> On Wed, Jul 23, 2025 at 12:37:31PM GMT, Vinod Koul wrote:
>>> On 22-07-25, 22:04, Manivannan Sadhasivam wrote:
>>>> On Thu, Jul 03, 2025 at 02:03:22PM GMT, Peter Griffin wrote:
>>>>> Add a new phy_notify_pmstate() api that notifies and configures a phy for a
>>>>> given PM link state transition.
>>>>>
>>>>> This is intended to be by phy drivers which need to do some runtime
>>>>> configuration of parameters during the transition that can't be handled by
>>>>> phy_calibrate() or phy_power_{on|off}().
>>>>>
>>>>> The first usage of this API is in the Samsung UFS phy that needs to issue
>>>>> some register writes when entering and exiting the hibernate link state.
>>>>>
>>>>> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
>>>>> ---
>>>>>   drivers/phy/phy-core.c  | 25 +++++++++++++++++++++++++
>>>>>   include/linux/phy/phy.h | 25 +++++++++++++++++++++++++
>>>>>   2 files changed, 50 insertions(+)
>>>>>
>>>>> diff --git a/drivers/phy/phy-core.c b/drivers/phy/phy-core.c
>>>>> index 04a5a34e7a950ae94fae915673c25d476fc071c1..0b29bc2c709890d7fc27d1480a35cda6a826fd30 100644
>>>>> --- a/drivers/phy/phy-core.c
>>>>> +++ b/drivers/phy/phy-core.c
>>>>> @@ -520,6 +520,31 @@ int phy_notify_disconnect(struct phy *phy, int port)
>>>>>   }
>>>>>   EXPORT_SYMBOL_GPL(phy_notify_disconnect);
>>>>>
>>>>> +/**
>>>>> + * phy_notify_pmstate() - phy link state notification
>>>>
>>>> 'pmstate' doesn't correspond to 'link state'. So how about,
>>>> phy_notify_link_state()?
>>>>
>>>> s/phy/PHY (here and below)
> 
> will fix
> 
>>>>
>>>>> + * @phy: the phy returned by phy_get()
>>>>> + * @state: the link state
>>>>> + *
>>>>> + * Notify the phy of some PM link state transition. Used to notify and
>>>>
>>>> Link state change is common for the PHY. So remove 'PM'.
>>>
>>> Is it really link or phy state?
> 
> I think it is likely both link and phy state.
> 
> Looking at the wording in section '9.5 Hibernate' in mipi unipro 1.8
> spec we have phrases such as
> 
> 9.5 Hibernate "Hibernate is a UniPro state in which the PHY is in the
> HIBERNATE_STATE, and the UniPro stack keeps only a minimal set of
> features active."
> 
> 9.5 Figure 99 describes Link hibernation where one Device, typically a
> Host Device, initiates Link hibernation with a peer Device.

So this is part handled by the PHY

> 
> 9.5.1.2 The local PA Layer receives this request and places the M-PHY
> Link into hibernate using the PACP protocol (detailed description of
> PACP protocol can be found in Section 5.7.7). Once the PA Layer has
> successfully hibernated the M-PHY Link, subsequent layers of the local
> and peer
> UniPro stack (L4 to L2) shall be hibernated by the DME by sending a
> <layer-identifer>_LM_HIBERNATE_ENTER.req SAP primitive to the
> respective layers.
> 

And this by the controller, so yeah we set the PHY state, and the PHY will
set the link state accordingly.

>>>
>>
>> This is a bit of ambiguity. But as per the spec, Hibern8 is the low power state
>> of the M-PHY and Unipro controller.
>>
>> Maybe, phy_notify_state()?
>>
> 
> phy_notify_state() seems like a good name. It might be better suited
> for other peripherals as well rather than narrowing it with link_state
> or pmstate.

Ack

> 
> Vinod, any thoughts on your preferred name?
> 
>>>>
> 
>>>>> + * configure the phy accordingly.
>>>>> + *
>>>>> + * Returns: %0 if successful, a negative error code otherwise
>>>>> + */
>>>>> +int phy_notify_pmstate(struct phy *phy, enum phy_linkstate state)
>>>>
>>>> I think you need to use 'int state' and let drivers pass their own link state
>>>> values. You cannot have generic link states across all peripherals.
>>>
>>> I would avoid that, people start overloading this if we let it keep
>>> open! I would like to avoid the api -(ab)use
>>>
>>
>> Then we will end up with peripheral specific enums in include/linux/phy/phy.h.
>> If you are OK with that, fine with me.
> 
> Ok I'll add peripheral specific enums to include/linux/phy/phy.h in
> the next version.
> 
> Thanks,
> 
> Peter
> 

Thanks,
Neil
