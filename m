Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F04027146B
	for <linux-samsung-soc@vger.kernel.org>; Wed, 23 Jul 2025 07:52:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753257156; cv=none; b=fbmvKbO+otjuF48lbVglMiPBc4A4zSdl0VNm+n8Fcn1J3BWeWMOj/omwJ2c3KKLBvsDN3Vnd/1Rjr2onj1KpD7v/Z2EJsepKCQxL4jNPvJeyJeKNFP14opolJUyiSFa5HdjjcBofo4frjhJyUCF7Bcdb7LyLsf66SlaCgEWkfNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753257156; c=relaxed/simple;
	bh=ud0gO2Wa0cMTDxDy0tyqeRKDtzrmUjlTHcoL1rFLobo=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=i+JI+9hq2NEuGJ6gsRCWT0sIPMim/0TSRHaeDZhO82b9rmPxnB5gY/s1+JyPmiPw79DNrzpw5sgXWcYf2SzygYuoqRfavOv+f8kBIC2+7DAhkDyMnn55wZFoMdqo6/SeP/AVs/qdfcOA0FUfeIUS5HfWBnhh712x7xt0eGzKZAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Cae+OoNf; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Cae+OoNf"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3b49ffbb31bso4112425f8f.3
        for <linux-samsung-soc@vger.kernel.org>; Wed, 23 Jul 2025 00:52:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753257153; x=1753861953; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wJr/hw1dHQH58OkL2qscj1xdCFrGFtnGhH2Sn1vmVSA=;
        b=Cae+OoNfqmYA6R9LwXX8Fi4zSdaxLsTtLlKKc38RyI/3Iwo0LxRWhzuOWkiOfJxFH6
         N/Vrg2i2lq5SRdwe1x8kDdSJWsZBZ+JeYqvhJZVXmn1MO9mVvO2pnzFBSAkqP6cI2BGI
         cGI4jmXHQ+hU1ZXP14mCOdZ1+tpkicKlxBhxu9Zah2ChpzZUFy/0ch/2ILfQc3JGbi0V
         QP7bxpdh5T8TZ/bF67SwHe6Olk6F97lsVnR6vseP+kN4d+/lRXelM6jt9gkkquO05BW5
         oy6tKYPLgv0mJmlORSuYK7qkQxfHP1CTd8ryMYRUs0CvQlFdYHBWqfmRu7qqxneyNoS4
         TXkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753257153; x=1753861953;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=wJr/hw1dHQH58OkL2qscj1xdCFrGFtnGhH2Sn1vmVSA=;
        b=lh5cii3iPBliAiZy7gJ1aKCYXKP8mKF/xORzh/NW3ZGBuUaThwf3t89Oato9OwfZmF
         215efEF3jUd/S6E/pnHYgovDQclSpU8phpPNQnYxHE4JCO+bagXH2ZU327Nv8a9SjuOp
         cwbOCvEAL7+nXFtINtqKm9v6bxz2SjPfsYJRNN53roHK+IGCg/voKWoPuCVzUSHD6yvJ
         8ccL7RfADncw+9xIC3wCYxyNDlcWyNuEIw/dz8wOdXRLr7O0OgbkPnSGK+J1LQE+56bS
         1mYeUBxzItUaVA4KJhF+PscrWeF4U4RZJJ62eqzqHfPV36bWemqNKgMZr+1GmzXHO2+9
         LPCA==
X-Forwarded-Encrypted: i=1; AJvYcCUDYfUOGLsbl5Uzg8nvBfoxrGqDQ8JKfofPpPemjdDxp5VN02rzJFMguFvk1iCM5AiYtH10RdxdI1dJxqS9v02H7w==@vger.kernel.org
X-Gm-Message-State: AOJu0YwUgJtEXRcIGlu2lg8V+u8BZmXBi2soWxiBfhUQR+yngdQglwQK
	OEjeCnLNx3AbJ0ta+sBBldKRqjX461yVjZx4jxeSjnMxLrcdRD0FuCD7YWceQHtkyg0=
X-Gm-Gg: ASbGncscSB/3wnXE3mnXkX7xLwaUKY6HNeeyJ/kFCT9MpKYtNXLlPj4+4782HrP2qEE
	lKHv4CDqCZ7yIBNCgwYAKsnnSfOfC1sVWWQRmfLqN2HkkQxiIEAHJONfYY5Q3lYy4yJRp2DZ//v
	4FAPqmqu8/QLQvm5VgRKdH7I+vu2oIL105QWOJQVmQHM5O0jEtpRnDUQFwF38es7CoXfTbGMBQ0
	zdoC3fEx/H7SE6kJaJiqryZWzJmKMli6glcuHoYvaWSrLC4keEUPMK44FUuFsTBgw1R+4OmWr62
	C8bApUdpuyrQSBx/aHf4Zaf12v04YzjyaYT2jdkvKVUBon4Ugww9cH6xLQWSJYZf2K0Rar3unpe
	PfEI4dv7J//TWQFXCrWNnrKLnWK8xiZvNpmk401uChENwxijIAMm6paU68JwJZQ9Md0VTkKQaib
	I=
X-Google-Smtp-Source: AGHT+IH1+KGiK7+CPpG7hfWiA/jq/1R1SSgKNRLgfm5//YxJ7f7pwzncw9zDFJZ9mt07q0lMm4XQyQ==
X-Received: by 2002:a05:6000:4024:b0:3b6:1630:9204 with SMTP id ffacd0b85a97d-3b768ec8a1bmr1439039f8f.19.1753257152837;
        Wed, 23 Jul 2025 00:52:32 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:8813:2f0d:f9e0:5294? ([2a01:e0a:3d9:2080:8813:2f0d:f9e0:5294])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45869199605sm14357735e9.14.2025.07.23.00.52.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Jul 2025 00:52:32 -0700 (PDT)
Message-ID: <d1c67441-85d6-42d7-9ace-c4884f767dc8@linaro.org>
Date: Wed, 23 Jul 2025 09:52:31 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 1/2] phy: add new phy_notify_pmstate() api
To: Vinod Koul <vkoul@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>
Cc: Peter Griffin <peter.griffin@linaro.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 Tudor Ambarus <tudor.ambarus@linaro.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, Krzysztof Kozlowski
 <krzk@kernel.org>, linux-phy@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, kernel-team@android.com,
 William Mcvicker <willmcvicker@google.com>
References: <20250703-phy-notify-pmstate-v2-0-fc1690439117@linaro.org>
 <20250703-phy-notify-pmstate-v2-1-fc1690439117@linaro.org>
 <e2lhm237c3xtbdjux2wuesq5fwu7nky3w7oq2fnsgn2pqcg5kh@xhxktriooyes>
 <aICKM-ebp9SMAkZ_@vaman>
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
In-Reply-To: <aICKM-ebp9SMAkZ_@vaman>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 23/07/2025 09:07, Vinod Koul wrote:
> On 22-07-25, 22:04, Manivannan Sadhasivam wrote:
>> On Thu, Jul 03, 2025 at 02:03:22PM GMT, Peter Griffin wrote:
>>> Add a new phy_notify_pmstate() api that notifies and configures a phy for a
>>> given PM link state transition.
>>>
>>> This is intended to be by phy drivers which need to do some runtime
>>> configuration of parameters during the transition that can't be handled by
>>> phy_calibrate() or phy_power_{on|off}().
>>>
>>> The first usage of this API is in the Samsung UFS phy that needs to issue
>>> some register writes when entering and exiting the hibernate link state.
>>>
>>> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
>>> ---
>>>   drivers/phy/phy-core.c  | 25 +++++++++++++++++++++++++
>>>   include/linux/phy/phy.h | 25 +++++++++++++++++++++++++
>>>   2 files changed, 50 insertions(+)
>>>
>>> diff --git a/drivers/phy/phy-core.c b/drivers/phy/phy-core.c
>>> index 04a5a34e7a950ae94fae915673c25d476fc071c1..0b29bc2c709890d7fc27d1480a35cda6a826fd30 100644
>>> --- a/drivers/phy/phy-core.c
>>> +++ b/drivers/phy/phy-core.c
>>> @@ -520,6 +520,31 @@ int phy_notify_disconnect(struct phy *phy, int port)
>>>   }
>>>   EXPORT_SYMBOL_GPL(phy_notify_disconnect);
>>>   
>>> +/**
>>> + * phy_notify_pmstate() - phy link state notification
>>
>> 'pmstate' doesn't correspond to 'link state'. So how about,
>> phy_notify_link_state()?
>>
>> s/phy/PHY (here and below)
>>
>>> + * @phy: the phy returned by phy_get()
>>> + * @state: the link state
>>> + *
>>> + * Notify the phy of some PM link state transition. Used to notify and
>>
>> Link state change is common for the PHY. So remove 'PM'.
> 
> Is it really link or phy state?

It seems to be a link state, and I think adding a way to force
a link state to a phy, which is basically the role of a phy,
more coherent.

Neil

> 
>>
>>> + * configure the phy accordingly.
>>> + *
>>> + * Returns: %0 if successful, a negative error code otherwise
>>> + */
>>> +int phy_notify_pmstate(struct phy *phy, enum phy_linkstate state)
>>
>> I think you need to use 'int state' and let drivers pass their own link state
>> values. You cannot have generic link states across all peripherals.
> 
> I would avoid that, people start overloading this if we let it keep
> open! I would like to avoid the api -(ab)use
> 

