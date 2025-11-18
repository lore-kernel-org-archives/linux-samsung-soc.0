Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89B0A30F929
	for <linux-samsung-soc@vger.kernel.org>; Tue, 18 Nov 2025 09:14:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763457256; cv=none; b=uOFlMLnD8Kg4/V69dkdqewCeeW/rpbbUiHJcyVgf8RLjhzd/j1VU3j5ErEseVWFs5YPKsjYnMcJGugycBLPdXeQO2Amolx7KuoMPbVCPDLvZ0DEbwBC6O4dWuHNMm2aEuux7TGwr5rQWzdYomsHPtp/RQ8JBq6giZuy2TtWlB3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763457256; c=relaxed/simple;
	bh=Pd8dSarINawX7MIJYTYtSqvmM4a6mRfNVuK/8FX1u7U=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=lArEVYrJOOrqSI8k/YYtUq9LOfKJjsKVl3k8DV0taupwYBGE07hN9vp7NETWkCkqtxhAZExOtpB1e1EVteGXit5L3nXNh5v97YRYdnrcbv8OzTWc7AAjTgdE3dnxVduYrruH7V9v6cO97GrgXhBFeYLXEwF+SD/zxoSRm6C6LW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LaOsPhb1; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LaOsPhb1"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-47795f6f5c0so22244825e9.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 18 Nov 2025 01:14:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763457252; x=1764062052; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PebSiGPl1ns0dYlefJC1vEn1itPg8Ola/syHJIvUBo4=;
        b=LaOsPhb1N39tuKMBAIyG/zBj5r+qeST6Zv2oDrCNVGCR2QZBkogILMRdGH+QrZ1gb8
         weLSzo2JYm8zZEu6atumtFcso0CBSxcI5s/PLFvSoSDnaNH0p5Jg8pdHsjSKvCIoI4p0
         ed3T5xh7OWUuBYUX9vfXOK+A8cqNcq3Y63ankb4nbkijsQOpyIqFZr4bW/x3G4eeQtGA
         NVnDPCwWwHeLQPoX5BBS4+DPMRG2IeKeXLxEymC+Szw5QAHKR2cI+tvktdMMebfliYJA
         1GfXuDN9gFFlLAOVB5TFnFdk7zul5e8qvgyjdevMUk/NBCCeARBsig8R6qPVLeBzDSYb
         H8sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763457252; x=1764062052;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PebSiGPl1ns0dYlefJC1vEn1itPg8Ola/syHJIvUBo4=;
        b=ParmJudzssz2POHiZeWLBrBA0O34Px+rb0ldp9qFXOQiOvWr1gCZlh2xPvqP+S9xjV
         I1TsivBqqjQS6CwkFHBfZvB0iTTPLgtPqpopEuBPWM/2RSLTg5N7+zy9JXkjmXMPl4A3
         5qnTJgC33f40pDFYkj8UA/nOgPPQpeSzXHOwQXlj5+S3sM4u3w81ZI/MP5XkEEJlwrW6
         Ejv5cbXt7AsF0uGAyzpxAEnYJwfv364dc1der4YKKr5Na944E75U9XYCfwWU8tSsUtfZ
         oHwkGg6S4IxcN6E6t0J8S/YdPuySdF+CQneCI9iUCTkFmDACxBTtJ/byS0Ro3bAq3lli
         ZNNA==
X-Forwarded-Encrypted: i=1; AJvYcCXXZDFiZTgdO1K2Eg93AzdZg+/Xui2exdfzLHzGlvLfACqKDvcJ0uxez3j0DZm6RXlDfZcHBLomg2PcxM0phO03Tw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxLh0562tIojTQckeHz1zvAErUgwTBQXhEMMlii75fqL7gFzhhp
	gZ86s1zqXb9rVLV/9Fzn3tqlrI+ogaVkTcpSCqHIDmPdhUzYPTbWnfRecOn31TASdlw=
X-Gm-Gg: ASbGnctiRZltPo/QO6vB4t4Gp8E0c1BzNsTCaF++X52oNPkcMTWxmdAzTYQTcM4YIDe
	d9+u4sGA+UKnpsZgZlD62jBXK82M6MifBf5RDP18XgQvE4qp68X6JFWK31y+R5YalCErZMcC3OE
	gnIhsh10xctmzVv7WJNldVTBcFk7pknc4170quYGP0GeU8kGr2ENKGI+K/f087vck0Md0IP91xe
	gUK/+ckAWE1oLnWXshHY68REXH6NvIa/gIKlserwqMXLEALM6mJpcaJGtxhuo8J2VJ3t9FnMD4z
	THjlC37MeEMTsNUrTcK8m0Wq+qOj5Cg4N5fvjZynC9eGbQAIM1tTHUI64AjpbZU7Rd/PNLwe/RQ
	Kw8VGrG2dR/h9AjijgSHmwrbu4CGd8VsD4Lcakznu/t6UyiMIXps87UGv5ZVQQKFHJg8hQHWWAB
	06hRhCmW4lfLjFck4SpjeL/tBn965bHyij2ihPquxHewyMTqn/HfxN1S63OtaoZcwfouFjFEOSH
	w==
X-Google-Smtp-Source: AGHT+IEYy6/KbbCp7l8IvIhZJFi+0VW8FfDRXOxrQm9yiGuqpablbDwGJU0+st74VLAeFQ7djiYlnQ==
X-Received: by 2002:a05:6000:1845:b0:42b:3aee:429e with SMTP id ffacd0b85a97d-42b5938a9d7mr14137889f8f.56.1763457251502;
        Tue, 18 Nov 2025 01:14:11 -0800 (PST)
Received: from ?IPV6:2a01:e0a:3d9:2080:366e:5264:fffe:1c49? ([2a01:e0a:3d9:2080:366e:5264:fffe:1c49])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53f174afsm30272784f8f.33.2025.11.18.01.14.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Nov 2025 01:14:11 -0800 (PST)
Message-ID: <254ec2db-bfe2-43aa-8bd5-a45ec89a7d0b@linaro.org>
Date: Tue, 18 Nov 2025 10:14:10 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v5 2/2] phy: samsung: gs101-ufs: Add .notify_phystate() &
 hibern8 enter/exit values
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
 <20251112-phy-notify-pmstate-v5-2-39df622d8fcb@linaro.org>
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
In-Reply-To: <20251112-phy-notify-pmstate-v5-2-39df622d8fcb@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/12/25 17:27, Peter Griffin wrote:
> Implement the .notify_phystate() callback and provide the gs101 specific
> phy values that need to be programmed when entering and exiting the hibern8
> state.
> 
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> ---
> Changes in v4
>   - Resolve Intel 0-day warning
> ---
>   drivers/phy/samsung/phy-gs101-ufs.c   | 28 ++++++++++++++++++++++++
>   drivers/phy/samsung/phy-samsung-ufs.c | 40 +++++++++++++++++++++++++++++++++++
>   drivers/phy/samsung/phy-samsung-ufs.h |  7 ++++++
>   3 files changed, 75 insertions(+)
> 
> diff --git a/drivers/phy/samsung/phy-gs101-ufs.c b/drivers/phy/samsung/phy-gs101-ufs.c
> index 17b798da5b5761f8e367599517d2d97bf0bb6b74..a15e1f453f7f3cecd6d3aa75217633ac4b6085d0 100644
> --- a/drivers/phy/samsung/phy-gs101-ufs.c
> +++ b/drivers/phy/samsung/phy-gs101-ufs.c
> @@ -108,12 +108,39 @@ static const struct samsung_ufs_phy_cfg tensor_gs101_post_pwr_hs_config[] = {
>   	END_UFS_PHY_CFG,
>   };
>   
> +static const struct samsung_ufs_phy_cfg tensor_gs101_post_h8_enter[] = {
> +	PHY_TRSV_REG_CFG_GS101(0x262, 0x08, PWR_MODE_ANY),
> +	PHY_TRSV_REG_CFG_GS101(0x265, 0x0A, PWR_MODE_ANY),
> +	PHY_COMN_REG_CFG(0x1, 0x8,  PWR_MODE_ANY),
> +	PHY_COMN_REG_CFG(0x0, 0x86,  PWR_MODE_ANY),
> +	PHY_COMN_REG_CFG(0x8, 0x60,  PWR_MODE_HS_ANY),
> +	PHY_TRSV_REG_CFG_GS101(0x222, 0x08, PWR_MODE_HS_ANY),
> +	PHY_TRSV_REG_CFG_GS101(0x246, 0x01, PWR_MODE_HS_ANY),
> +	END_UFS_PHY_CFG,
> +};
> +
> +static const struct samsung_ufs_phy_cfg tensor_gs101_pre_h8_exit[] = {
> +	PHY_COMN_REG_CFG(0x0, 0xC6,  PWR_MODE_ANY),
> +	PHY_COMN_REG_CFG(0x1, 0x0C,  PWR_MODE_ANY),
> +	PHY_TRSV_REG_CFG_GS101(0x262, 0x00, PWR_MODE_ANY),
> +	PHY_TRSV_REG_CFG_GS101(0x265, 0x00, PWR_MODE_ANY),
> +	PHY_COMN_REG_CFG(0x8, 0xE0,  PWR_MODE_HS_ANY),
> +	PHY_TRSV_REG_CFG_GS101(0x246, 0x03, PWR_MODE_HS_ANY),
> +	PHY_TRSV_REG_CFG_GS101(0x222, 0x18, PWR_MODE_HS_ANY),
> +	END_UFS_PHY_CFG,
> +};
> +
>   static const struct samsung_ufs_phy_cfg *tensor_gs101_ufs_phy_cfgs[CFG_TAG_MAX] = {
>   	[CFG_PRE_INIT]		= tensor_gs101_pre_init_cfg,
>   	[CFG_PRE_PWR_HS]	= tensor_gs101_pre_pwr_hs_config,
>   	[CFG_POST_PWR_HS]	= tensor_gs101_post_pwr_hs_config,
>   };
>   
> +static const struct samsung_ufs_phy_cfg *tensor_gs101_hibern8_cfgs[] = {
> +	[CFG_POST_HIBERN8_ENTER]	= tensor_gs101_post_h8_enter,
> +	[CFG_PRE_HIBERN8_EXIT]		= tensor_gs101_pre_h8_exit,
> +};
> +
>   static const char * const tensor_gs101_ufs_phy_clks[] = {
>   	"ref_clk",
>   };
> @@ -170,6 +197,7 @@ static int gs101_phy_wait_for_cdr_lock(struct phy *phy, u8 lane)
>   
>   const struct samsung_ufs_phy_drvdata tensor_gs101_ufs_phy = {
>   	.cfgs = tensor_gs101_ufs_phy_cfgs,
> +	.cfgs_hibern8 = tensor_gs101_hibern8_cfgs,
>   	.isol = {
>   		.offset = TENSOR_GS101_PHY_CTRL,
>   		.mask = TENSOR_GS101_PHY_CTRL_MASK,
> diff --git a/drivers/phy/samsung/phy-samsung-ufs.c b/drivers/phy/samsung/phy-samsung-ufs.c
> index f3cbe6b17b235bb181b3fae628d75822f0c9183a..ee665f26c2361ff9c3933b10ac713bbd9085b459 100644
> --- a/drivers/phy/samsung/phy-samsung-ufs.c
> +++ b/drivers/phy/samsung/phy-samsung-ufs.c
> @@ -217,6 +217,44 @@ static int samsung_ufs_phy_set_mode(struct phy *generic_phy,
>   	return 0;
>   }
>   
> +static int samsung_ufs_phy_notify_state(struct phy *phy,
> +					union phy_notify state)
> +{
> +	struct samsung_ufs_phy *ufs_phy = get_samsung_ufs_phy(phy);
> +	const struct samsung_ufs_phy_cfg *cfg;
> +	int i, err = -EINVAL;
> +
> +	if (!ufs_phy->cfgs_hibern8)
> +		return 0;
> +
> +	if (state.ufs_state == PHY_UFS_HIBERN8_ENTER)
> +		cfg = ufs_phy->cfgs_hibern8[CFG_POST_HIBERN8_ENTER];
> +	else if (state.ufs_state == PHY_UFS_HIBERN8_EXIT)
> +		cfg = ufs_phy->cfgs_hibern8[CFG_PRE_HIBERN8_EXIT];
> +	else
> +		goto err_out;
> +
> +	for_each_phy_cfg(cfg) {
> +		for_each_phy_lane(ufs_phy, i) {
> +			samsung_ufs_phy_config(ufs_phy, cfg, i);
> +		}
> +	}
> +
> +	if (state.ufs_state == PHY_UFS_HIBERN8_EXIT) {
> +		for_each_phy_lane(ufs_phy, i) {
> +			if (ufs_phy->drvdata->wait_for_cdr) {
> +				err = ufs_phy->drvdata->wait_for_cdr(phy, i);
> +				if (err)
> +					goto err_out;
> +			}
> +		}
> +	}
> +
> +	return 0;
> +err_out:
> +	return err;
> +}
> +
>   static int samsung_ufs_phy_exit(struct phy *phy)
>   {
>   	struct samsung_ufs_phy *ss_phy = get_samsung_ufs_phy(phy);
> @@ -233,6 +271,7 @@ static const struct phy_ops samsung_ufs_phy_ops = {
>   	.power_off	= samsung_ufs_phy_power_off,
>   	.calibrate	= samsung_ufs_phy_calibrate,
>   	.set_mode	= samsung_ufs_phy_set_mode,
> +	.notify_phystate = samsung_ufs_phy_notify_state,
>   	.owner          = THIS_MODULE,
>   };
>   
> @@ -287,6 +326,7 @@ static int samsung_ufs_phy_probe(struct platform_device *pdev)
>   	phy->dev = dev;
>   	phy->drvdata = drvdata;
>   	phy->cfgs = drvdata->cfgs;
> +	phy->cfgs_hibern8 = drvdata->cfgs_hibern8;
>   	memcpy(&phy->isol, &drvdata->isol, sizeof(phy->isol));
>   
>   	if (!of_property_read_u32_index(dev->of_node, "samsung,pmu-syscon", 1,
> diff --git a/drivers/phy/samsung/phy-samsung-ufs.h b/drivers/phy/samsung/phy-samsung-ufs.h
> index a28f148081d168344b47f2798b00cb098f0a8574..f2c2e744e5bae87c9cfcaa17f4a09456f134966a 100644
> --- a/drivers/phy/samsung/phy-samsung-ufs.h
> +++ b/drivers/phy/samsung/phy-samsung-ufs.h
> @@ -92,6 +92,11 @@ enum {
>   	CFG_TAG_MAX,
>   };
>   
> +enum {
> +	CFG_POST_HIBERN8_ENTER,
> +	CFG_PRE_HIBERN8_EXIT,
> +};
> +
>   struct samsung_ufs_phy_cfg {
>   	u32 off_0;
>   	u32 off_1;
> @@ -108,6 +113,7 @@ struct samsung_ufs_phy_pmu_isol {
>   
>   struct samsung_ufs_phy_drvdata {
>   	const struct samsung_ufs_phy_cfg **cfgs;
> +	const struct samsung_ufs_phy_cfg **cfgs_hibern8;
>   	struct samsung_ufs_phy_pmu_isol isol;
>   	const char * const *clk_list;
>   	int num_clks;
> @@ -124,6 +130,7 @@ struct samsung_ufs_phy {
>   	struct clk_bulk_data *clks;
>   	const struct samsung_ufs_phy_drvdata *drvdata;
>   	const struct samsung_ufs_phy_cfg * const *cfgs;
> +	const struct samsung_ufs_phy_cfg * const *cfgs_hibern8;
>   	struct samsung_ufs_phy_pmu_isol isol;
>   	u8 lane_cnt;
>   	int ufs_phy_state;
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
