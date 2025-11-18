Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B57BB30F55A
	for <linux-samsung-soc@vger.kernel.org>; Tue, 18 Nov 2025 09:13:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763457214; cv=none; b=IKOk5zXiB0O4NEICwsNcSDz3JiRX/O8MydW1Lxq92dC/mCEbtK62JKNRcIBvMtwL0TOGbhasoQLn8m/1odBQUxiwgpfuU/Efu0TZbCWx/t2ZBDiBsN70K0+PAKnWDxYvN0msMtKUox5wSRxNv7EypY/95Ry5SAORU1o+GdFru5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763457214; c=relaxed/simple;
	bh=PJBTeQOCZE2jeSZbQMU5ntGJGD96cAqQ1M5sGv+ocec=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=CNmySaIjeLWaksP84t3cZV1i5IJarqJjiP3uFhzc4TuPxe1FbiVddfGCmmgg0oWnuH2QDF0Za/ONrka94AbFm6/SldKTWc+HvlBAWa/spaNPRbRuivNzcSDRGWTmLqZYVI5fXbJcpf/8/ptsFVzOgNPtkALYPiLq4m2gsfo9sgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=m8pSttba; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="m8pSttba"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-47798ded6fcso9872145e9.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 18 Nov 2025 01:13:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763457210; x=1764062010; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b3d9aSuODkFC9g/oScA6ndSxxtPyvcgy72vCoZYW6hk=;
        b=m8pSttbadbt6R3bByAV+EFUfjBzPob/UiR7pzHkiRIbs2vieDOvw4e+9UzOwyWgE/C
         O/dl0BIA4IJFarqlXAIlg5OgY7460EISUKWAI2eEJwQXVdzt1NEex9WFNVQzAOMEctgK
         1Su6eo6rZpYp+xwezxKjMPQ/v+7GF15ALHpOMWL/fGP3prFarCqdl0oh0Jt+18eC25cE
         +M9mw4qDTM06ut9DJC09FF87AcRsujWvKI/jCG5X85C7Y92QlOyq2Bld6IWE76h9RMuB
         5scxX2TkuSsO+sqksDanQHEKlunHIrK56U2268dG1ZnMZZ6gYVWASKSVHYC/XAuvrF7O
         QXOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763457210; x=1764062010;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b3d9aSuODkFC9g/oScA6ndSxxtPyvcgy72vCoZYW6hk=;
        b=E/dmNidfSceByWcwCI2rVRo8IaE0jOCN7Tjnopa4NdQtiLfg7HwHL5MIHmjWCz7and
         1XMXgFwVlMvh8rcQTa7tuYDXsY7CPp8E1EVJ2HEhTvDr3LuU12MSDWTDxj4lJ9KUcA2j
         TjX4Ez9oAya2BRN9At2T1aVgeocvzMe9SaYzCA4Z5GTHs9gCX+CLmTKveWiKg8PQZezS
         Rel5KUQhqkHWGb37ZR3ia4bLgaCt5e/pnjHcoHF96jHRbqX53/kShot0V/4qO+xeeGIa
         O+ZpwM5p2StOI+rWsXQ6H8eY5kRA/iQOyHtDhF3OIh+EXsGzNSM6OOaFBGJVwDnbcOgT
         F2Rw==
X-Forwarded-Encrypted: i=1; AJvYcCU9CIanCoB7cSVrOc2CdN9C62HRbs56i5XLbapiiMbrT9RtYtf5nSwAnZPd+alCRDvKBR2UQTc6kk55Sus2jzNnJw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+pPqn84Yqw1yOZ+K1pT1hZxtmQb55lfp2b8akZG8IAuRB72k2
	ZnY9/l0JSmiEzdFJ2j0SX4lg2cLXDDjlKcszGw8ud15rOuSV8JrTqtAwSjapdglBjOY=
X-Gm-Gg: ASbGncuL4lqfI49ae54ZuukMUDgOZQ4ndS+eggrGu9N7+y9WkQTdBCAE0FzOdeTAVy7
	N8/E881pj2Iuu0FHLiQIEtZDvMMY54sU7vW9eKg9fhZxmGMsXviOHfn95eo0jAGBdNaomJbA2y5
	/bIXsK1L26aFseB1NpaWE/7P1ZJZYRJRRLOcwC9R6BMi0LgGdgSq51+pcnTp3hmsE6/H//PQIVL
	OHkAjt08XDQXgPCiZeoAoO0POGlMTsKUQeo1kkfVbl727cO+dPQWyu2kfdXJChAfwL1fGsXxuGF
	qKVv3SvmOKE5u+Cw+GfNaWyT/JYMgsDpaCJRRILMVNz9NOHqPvTXX+WteUqqXbskIVLyRvja3ct
	578+271dpyd4fB4ZET9XpnKPiIEcIhPQc1xenEe6nGippinXbtsMbuiuUDT1xWaoKporPzmyZ39
	bCY1Tm4SB9bDuVkSFYvCcmjZ/ou4FEf0ex4ytuki1JVQwiAZ1AInWUjaABO7N9XPw=
X-Google-Smtp-Source: AGHT+IG0kFz9gx02O1y5oWOQ9n3OLuLQ5sSciCR005X4QnJdS+EzbkU+x3njzrapxSpWUzk8bgSoEQ==
X-Received: by 2002:a05:600c:3b25:b0:477:7925:f7f3 with SMTP id 5b1f17b1804b1-4778fe62d4emr129814195e9.14.1763457210262;
        Tue, 18 Nov 2025 01:13:30 -0800 (PST)
Received: from ?IPV6:2a01:e0a:3d9:2080:366e:5264:fffe:1c49? ([2a01:e0a:3d9:2080:366e:5264:fffe:1c49])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477a97213b8sm13156565e9.1.2025.11.18.01.13.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Nov 2025 01:13:29 -0800 (PST)
Message-ID: <c95faaf1-57e4-4387-89c1-be6befc79416@linaro.org>
Date: Tue, 18 Nov 2025 10:13:28 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v5 1/2] phy: add new phy_notify_state() api
To: Peter Griffin <peter.griffin@linaro.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 Tudor Ambarus <tudor.ambarus@linaro.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 kernel-team@android.com, William Mcvicker <willmcvicker@google.com>,
 Manivannan Sadhasivam <mani@kernel.org>
References: <20251112-phy-notify-pmstate-v5-0-39df622d8fcb@linaro.org>
 <20251112-phy-notify-pmstate-v5-1-39df622d8fcb@linaro.org>
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
In-Reply-To: <20251112-phy-notify-pmstate-v5-1-39df622d8fcb@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/12/25 17:27, Peter Griffin wrote:
> Add a new phy_notify_state() api that notifies and configures a phy for a
> given state transition.
> 
> This is intended to be used by phy drivers which need to do some runtime
> configuration of parameters that can't be handled by phy_calibrate() or
> phy_power_{on|off}().
> 
> The first usage of this API is in the Samsung UFS phy that needs to issue
> some register writes when entering and exiting the hibernate link state.
> 
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> ---
> Changes in v5
> - Fix typo phy_notify_phystate to phy_notify_state (Russell)
> 
> Changes in v4
>   - Add missing 'used' word (Vinod)
> ---
>   drivers/phy/phy-core.c  | 25 +++++++++++++++++++++++++
>   include/linux/phy/phy.h | 19 +++++++++++++++++++
>   2 files changed, 44 insertions(+)
> 
> diff --git a/drivers/phy/phy-core.c b/drivers/phy/phy-core.c
> index 04a5a34e7a950ae94fae915673c25d476fc071c1..60be8af984bf06649ef00e695d0ed4ced597cdb9 100644
> --- a/drivers/phy/phy-core.c
> +++ b/drivers/phy/phy-core.c
> @@ -520,6 +520,31 @@ int phy_notify_disconnect(struct phy *phy, int port)
>   }
>   EXPORT_SYMBOL_GPL(phy_notify_disconnect);
>   
> +/**
> + * phy_notify_state() - phy state notification
> + * @phy: the PHY returned by phy_get()
> + * @state: the PHY state
> + *
> + * Notify the PHY of a state transition. Used to notify and
> + * configure the PHY accordingly.
> + *
> + * Returns: %0 if successful, a negative error code otherwise
> + */
> +int phy_notify_state(struct phy *phy, union phy_notify state)
> +{
> +	int ret;
> +
> +	if (!phy || !phy->ops->notify_phystate)
> +		return 0;
> +
> +	mutex_lock(&phy->mutex);
> +	ret = phy->ops->notify_phystate(phy, state);
> +	mutex_unlock(&phy->mutex);
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(phy_notify_state);
> +
>   /**
>    * phy_configure() - Changes the phy parameters
>    * @phy: the phy returned by phy_get()
> diff --git a/include/linux/phy/phy.h b/include/linux/phy/phy.h
> index 13add0c2c40721fe9ca3f0350d13c035cd25af45..2af0d01ebb39f27dfb34ccb5140771beef8288d5 100644
> --- a/include/linux/phy/phy.h
> +++ b/include/linux/phy/phy.h
> @@ -53,6 +53,15 @@ enum phy_media {
>   	PHY_MEDIA_DAC,
>   };
>   
> +enum phy_ufs_state {
> +	PHY_UFS_HIBERN8_ENTER,
> +	PHY_UFS_HIBERN8_EXIT,
> +};
> +
> +union phy_notify {
> +	enum phy_ufs_state ufs_state;
> +};
> +
>   /**
>    * union phy_configure_opts - Opaque generic phy configuration
>    *
> @@ -83,6 +92,7 @@ union phy_configure_opts {
>    * @set_speed: set the speed of the phy (optional)
>    * @reset: resetting the phy
>    * @calibrate: calibrate the phy
> + * @notify_phystate: notify and configure the phy for a particular state
>    * @release: ops to be performed while the consumer relinquishes the PHY
>    * @owner: the module owner containing the ops
>    */
> @@ -132,6 +142,7 @@ struct phy_ops {
>   	int	(*connect)(struct phy *phy, int port);
>   	int	(*disconnect)(struct phy *phy, int port);
>   
> +	int	(*notify_phystate)(struct phy *phy, union phy_notify state);
>   	void	(*release)(struct phy *phy);
>   	struct module *owner;
>   };
> @@ -255,6 +266,7 @@ int phy_reset(struct phy *phy);
>   int phy_calibrate(struct phy *phy);
>   int phy_notify_connect(struct phy *phy, int port);
>   int phy_notify_disconnect(struct phy *phy, int port);
> +int phy_notify_state(struct phy *phy, union phy_notify state);
>   static inline int phy_get_bus_width(struct phy *phy)
>   {
>   	return phy->attrs.bus_width;
> @@ -412,6 +424,13 @@ static inline int phy_notify_disconnect(struct phy *phy, int index)
>   	return -ENOSYS;
>   }
>   
> +static inline int phy_notify_state(struct phy *phy, union phy_notify state)
> +{
> +	if (!phy)
> +		return 0;
> +	return -ENOSYS;
> +}
> +
>   static inline int phy_configure(struct phy *phy,
>   				union phy_configure_opts *opts)
>   {
> 

LGTM !

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
