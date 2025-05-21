Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C486026B96B
	for <linux-samsung-soc@vger.kernel.org>; Wed, 21 May 2025 12:56:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747832195; cv=none; b=po+q9pZJD8Uo8byJTW0y/hwiMjQk4yDwAXG8Lq8SUWVQ4d0tbt47M2KfnK/5dls4XTkAHHsPt254AYVWUR2kRe0AQppXOUKD6Fkt4PmLscVaLIlJBb0oN1J9mFJNnfR2mOgyqO/KCWSMeMSuXsiTDu6dybc9N/PzeqcmnLRMq8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747832195; c=relaxed/simple;
	bh=bvFmYbd/cR74UnRjykpJQMeZQL2a2vYyuS0pmooZ+gw=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=aSSJNPe6PC5prxPWl6QkjVAbglmUnu7rwlI1uDx3AQod/79nXcbCu7uQdjZdr02afspYHcKbuniTwhsJ6GAbTrfEQbOAYkRukZwrrgMrvH8BhKJP18ynS34NVzs9hJmge8yE0XoqP1cBj2GjjYHi2yck+NzDMN3jGHVj4OZWwtc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ltNZVhtx; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ltNZVhtx"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43edb40f357so56667215e9.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 21 May 2025 05:56:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747832192; x=1748436992; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lFIDlDb5icsBjUnjw7c2gJhHJtxbm8Ehn5sVOvHqQ7c=;
        b=ltNZVhtx84mLjIa8MgPASuqE4Q0rHxO38H/hUbUQPKfKd/ujkMnJ9roNP8T+BYAhms
         9O2jL/1r2ZG9/bK0HvUECZvSjC8zBfMoYIv9UzbVL7NG9nUUbC9EEmh3M7MHTJHp2kqh
         Y7pie1eHw1/W9kgW1zHC6KgngCgGv09VnyQzsKIgd7/NesZgJp8s82D/jtznKDO740sd
         Ncrv7USCNLk/dTySLy5mk/m9E7pLzo2p8EZM9JEdYnqkB7fNIRn0Rn+w4xpx7CGlosFt
         2JCH1rpdTkO97ooCgNY8ectS6oiJdw4RPdxKlgHJrK9h+9VmF5vSNEPqFOeA76b05UU3
         A68w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747832192; x=1748436992;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=lFIDlDb5icsBjUnjw7c2gJhHJtxbm8Ehn5sVOvHqQ7c=;
        b=SGYIY2OrIVfNqyjW+RhpCJIoiPXxo/hwXS6tmtw8M9/4ofIJDBxHPMEQJ36peFoBeS
         EolKYxPGU2hjmBeZWATnhUjzrTLWgRslmenY5GL+PslOYFe2MB+e9G/H8iVRDrvH51CA
         wvbcoxDOZEhEjzl13eXawPt2eZxjqlFAYwlrLgL+YYMdlWvtbLZWVPzqYDcMNluaCLqf
         GQxDD2E1faTmPGGZK+jPJdRjogqaIF9wpLc0zPE+aC4yhMO2TcnNxr49n+tccdW0WETQ
         4VCSrs+lE3nYnnMIB8IVajBs2QfZWH442BTJ3uyVX10xPiAUjZHYwelXiSfvN79sc+0p
         b1LA==
X-Forwarded-Encrypted: i=1; AJvYcCVVcHDfhGfjHacju4g1dwjTMXKW19QN3Dbyvg2wqbWybyRsDxre7GV1K8jkYj54PTbxeucSRWC3Q+iZrMBrVJHtTQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzagyQ3AXeV42qNEQBJNz5XsYEuu7t6SV1iwEGHVvKceO8cXhYq
	WCKCVAcIyaoVE1Wk00QwfuCcamAFuKPX94qq4MywOCGnIhfg6t36WZ+UN3AYtr0VpGI=
X-Gm-Gg: ASbGnctkSFt1YZreEgKfBDCpc+2WuC3ryj3Go9Yko1n4UcxgMVcQ0Bs3QJVWhbODwPk
	pnT7GpbijKsKf65Gis4F2rrcVwtFeFNWUGqZXqTd/vH4BwbCQFWaaxI2BWOl+SNqZ0tqhPEFtHY
	YmDhNCdtBcdQew2cGpXyg/lxSQe2FbM8XmUOuHLNcmIdZztVKnS/WnzLNBM/VVXzA62dkBIPvgI
	u+6ajClNQ3WjQeb5SjziKKKLjMCyR4k1OTbMqoXd1s57XTW0FB0LyewpA7Ye7f4eQtudCUx/kNU
	sfZiz6PL+sG3olPRHB53nZIvIPVDlrXdXnZYLeIWJL2VbEyutKHIU9s6l+5ARlNzC2SnyqFhX5q
	CQvVhAQvEPUnuD23vtdO8oknrX+aj
X-Google-Smtp-Source: AGHT+IHvlxzqwfXaCVzPmrYzPKC5fQvHlhgdEJUw2990YoCs9+4bYKBjVnCrGTnpC0BhEynFW8In2Q==
X-Received: by 2002:a05:600c:c13:b0:43d:79:ae1b with SMTP id 5b1f17b1804b1-442fd627416mr198031985e9.14.1747832191898;
        Wed, 21 May 2025 05:56:31 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:80b6:c1af:bc94:958d? ([2a01:e0a:3d9:2080:80b6:c1af:bc94:958d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f6b29633sm72893415e9.8.2025.05.21.05.56.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 May 2025 05:56:31 -0700 (PDT)
Message-ID: <42ddb5c6-0f17-41ed-8bd4-ab58880515b1@linaro.org>
Date: Wed, 21 May 2025 14:56:29 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: 'Neil Armstrong' <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 2/2] phy: exyons5-usbdrd: support HS phy for
 ExynosAutov920
To: Pritam Manohar Sutar <pritam.sutar@samsung.com>, vkoul@kernel.org,
 kishon@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 alim.akhtar@samsung.com, andre.draszik@linaro.org, peter.griffin@linaro.org,
 kauschluss@disroot.org, m.szyprowski@samsung.com, s.nawrocki@samsung.com
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, rosa.pila@samsung.com,
 dev.tailor@samsung.com, faraz.ata@samsung.com, muhammed.ali@samsung.com,
 selvarasu.g@samsung.com
References: <20250516102650.2144487-1-pritam.sutar@samsung.com>
 <CGME20250516101803epcas5p2d9403d89d840dcad88a03d437a48aceb@epcas5p2.samsung.com>
 <20250516102650.2144487-3-pritam.sutar@samsung.com>
 <a5c1a064-d760-4140-9e78-d74823b400a8@linaro.org>
 <000101dbca1d$78ca5570$6a5f0050$@samsung.com>
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
In-Reply-To: <000101dbca1d$78ca5570$6a5f0050$@samsung.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 21/05/2025 08:56, Pritam Manohar Sutar wrote:
> Hi Neil,
> 
> Thank you for reviewing the patches.
> 
>> -----Original Message-----
>> From: neil.armstrong@linaro.org <neil.armstrong@linaro.org>
>> Sent: 20 May 2025 01:10 PM
>> To: Pritam Manohar Sutar <pritam.sutar@samsung.com>; vkoul@kernel.org;
>> kishon@kernel.org; robh@kernel.org; krzk+dt@kernel.org;
>> conor+dt@kernel.org; alim.akhtar@samsung.com; andre.draszik@linaro.org;
>> peter.griffin@linaro.org; kauschluss@disroot.org;
>> m.szyprowski@samsung.com; s.nawrocki@samsung.com
>> Cc: linux-phy@lists.infradead.org; devicetree@vger.kernel.org; linux-
>> kernel@vger.kernel.org; linux-arm-kernel@lists.infradead.org; linux-samsung-
>> soc@vger.kernel.org; rosa.pila@samsung.com; dev.tailor@samsung.com;
>> faraz.ata@samsung.com; muhammed.ali@samsung.com;
>> selvarasu.g@samsung.com
>> Subject: Re: [PATCH v2 2/2] phy: exyons5-usbdrd: support HS phy for
>> ExynosAutov920
>>
>> On 16/05/2025 12:26, Pritam Manohar Sutar wrote:
>>> This SoC has a single USB 3.1 DRD combo phy and three USB2.0 DRD HS
>>> phy controllers those only support the UTMI+ interface.
>>>
>>> Support only UTMI+ for this SoC which is very similar to what the
>>> existing Exynos850 supports.
>>>
>>> The combo phy supports both UTMI+ (HS) and PIPE3 (SS) and is out of
>>> scope of this commit.
>>>
>>> Add required change in phy driver to support HS phy for this SoC.
>>>
>>> Signed-off-by: Pritam Manohar Sutar <pritam.sutar@samsung.com>
>>> ---
>>>    drivers/phy/samsung/phy-exynos5-usbdrd.c | 85
>> ++++++++++++++++++++++++
>>>    1 file changed, 85 insertions(+)
>>>
>>> diff --git a/drivers/phy/samsung/phy-exynos5-usbdrd.c
>>> b/drivers/phy/samsung/phy-exynos5-usbdrd.c
>>> index 634c4310c660..b440b56c6595 100644
>>> --- a/drivers/phy/samsung/phy-exynos5-usbdrd.c
>>> +++ b/drivers/phy/samsung/phy-exynos5-usbdrd.c
>>> @@ -177,6 +177,9 @@
>>>    #define HSPHYPLLTUNE_PLL_P_TUNE			GENMASK(3, 0)
>>>
>>>    /* Exynos850: USB DRD PHY registers */
>>> +#define EXYNOSAUTOv920_DRD_CTRL_VER		0x00
>>> +#define CTRL_VER_MAJOR_VERSION			GENMASK(31, 24)
>>> +
>>>    #define EXYNOS850_DRD_LINKCTRL			0x04
>>>    #define LINKCTRL_FORCE_RXELECIDLE		BIT(18)
>>>    #define LINKCTRL_FORCE_PHYSTATUS		BIT(17)
>>> @@ -1772,6 +1775,10 @@ static const char * const
>> exynos5_regulator_names[] = {
>>>    	"vbus", "vbus-boost",
>>>    };
>>>
>>> +static const char * const exynosautov920_clk_names[] = {
>>> +	"ext_xtal",
>>> +};
>>> +
>>>    static const struct exynos5_usbdrd_phy_drvdata exynos5420_usbdrd_phy = {
>>>    	.phy_cfg		= phy_cfg_exynos5,
>>>    	.phy_ops		= &exynos5_usbdrd_phy_ops,
>>> @@ -1847,6 +1854,81 @@ static const struct exynos5_usbdrd_phy_drvdata
>> exynos850_usbdrd_phy = {
>>>    	.n_regulators		= ARRAY_SIZE(exynos5_regulator_names),
>>>    };
>>>
>>> +static void exynosautov920_usbdrd_utmi_init(struct exynos5_usbdrd_phy
>>> +*phy_drd) {
>>> +	u32 version;
>>> +
>>> +	version = readl(phy_drd->reg_phy +
>> EXYNOSAUTOv920_DRD_CTRL_VER);
>>> +	dev_info(phy_drd->dev, "usbphy: version:0x%x\n", version);
>>
>> Please do not add mode info to boot log, use dev_dbg instead.
> 
> Will replace dev_info by dev_dbg.
> 
>>
>>> +
>>> +	if (FIELD_GET(CTRL_VER_MAJOR_VERSION, version) == 0x3)
>>> +		/* utmi init for exynosautov920 HS phy */
>>> +		exynos850_usbdrd_utmi_init(phy_drd);
>>> +}
>>> +
>>> +static int exynosautov920_usbdrd_phy_init(struct phy *phy) {
>>> +	struct phy_usb_instance *inst = phy_get_drvdata(phy);
>>> +	struct exynos5_usbdrd_phy *phy_drd = to_usbdrd_phy(inst);
>>> +	int ret = 0;
>>> +
>>> +	ret = clk_bulk_prepare_enable(phy_drd->drv_data->n_clks, phy_drd-
>>> clks);
>>> +	if (ret)
>>> +		return ret;
>>> +
>>> +	/* UTMI or PIPE3 specific init */
>>> +	inst->phy_cfg->phy_init(phy_drd);
>>> +
>>> +	clk_bulk_disable_unprepare(phy_drd->drv_data->n_clks,
>>> +phy_drd->clks);
>>> +
>>> +	return 0;
>>> +}
>>> +
>>> +static void exynosautov920_v3p1_phy_dis(struct phy *phy) {
>>> +	struct phy_usb_instance *inst = phy_get_drvdata(phy);
>>> +	struct exynos5_usbdrd_phy *phy_drd = to_usbdrd_phy(inst);
>>> +	void __iomem *reg_phy = phy_drd->reg_phy;
>>> +	u32 version;
>>> +
>>> +	version = readl(reg_phy + EXYNOSAUTOv920_DRD_CTRL_VER);
>>> +
>>> +	if (FIELD_GET(CTRL_VER_MAJOR_VERSION, version) == 0x3)
>>> +		exynos850_usbdrd_phy_exit(phy);
>>> +}
>>> +
>>> +static int exynosautov920_usbdrd_phy_exit(struct phy *phy) {
>>> +	struct phy_usb_instance *inst = phy_get_drvdata(phy);
>>> +
>>> +	if (inst->phy_cfg->id == EXYNOS5_DRDPHY_UTMI)
>>> +		exynosautov920_v3p1_phy_dis(phy);
>>> +
>>> +	return 0;
>>> +}
>>> +
>>> +static const struct phy_ops exynosautov920_usbdrd_phy_ops = {
>>> +	.init		= exynosautov920_usbdrd_phy_init,
>>> +	.exit		= exynosautov920_usbdrd_phy_exit,
>>
>> <snip>
>>
>>> +		.id		= EXYNOS5_DRDPHY_UTMI,
>>> +		.phy_init	= exynosautov920_usbdrd_utmi_init,
>>
>> <snip>
>>
>>> +	}, {
>>> +		.compatible = "samsung,exynosautov920-usb31drd-phy",
>>> +		.data = &exynosautov920_usb31drd_phy
>>
>> All those new ops are only called when matching this compatible, it it really
>> necessary to check the version ? is there "samsung,exynosautov920-usb31drd-
>> phy" PHYs with version different from 3 in the wild ?
>>
> 
> This SoC has a single USB 3.1 DRD combo phy of version v400 (major : minor versions) and three USB2.0
> DRD phy v303 (major : minor versions) controllers those only support the UTMI+ interface. Currently,
> supporting only v303 phys in this patch-set, and planning v400 phy later (soon).
> 
> Yes, there's v400 phy version that is different from v303 phy. Hence, phy version check is needed to support both the phys for same compatible.

OK so add 2 compatibles, one for the usb31drd and one for the usb2drd since those are 2 difference hardware.

Neil

> 
>> Neil
>>
>>>    	},
>>>    	{ },
>>>    };
> 
> 
> Thank you,
> Pritam
> 

