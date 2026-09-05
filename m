Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D8BD47885C
	for <linux-samsung-soc@vger.kernel.org>; Sat,  5 Sep 2026 10:56:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788605767; cv=none; b=hqsLOks3p+P5orXUcz41A8Pqea0Q8rhvJdM+GDrQaYa1bSY0OqSesoaqzuBSOJsAIJoZ87MU41nwcVn7ZFKVWE9FWb1xvKd7mTihRk0ywMdak+5uHpp1VNEMSUnUr6qaW3X8m14eaoPsK7sjz7YHsvFqT0w3N6oy9UWbDTtmPtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788605767; c=relaxed/simple;
	bh=lLJrHhl9CX3BrBODX3AB1MUAjuoC/G2/t7jZncKSTBc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FDD70kaV/JXG02d2iUjZQJWSQ2QusZtt/bZwzuKnksv07Mt4P9NPOZMwaXKPP4w93Azq+69RSaBgF2HiU+2qAtpl08wNa4W5GUbXVVrHCKgWCa4rc7oiCHyFHZhAZjA1FRKMulybs4wO5HvWH5g+2vLwuZD/gAjqmdfSscH+kIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QUDJg6v4; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QUDJg6v4"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5b6188a2c0eso1364651e87.1
        for <linux-samsung-soc@vger.kernel.org>; Sat, 05 Sep 2026 03:55:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788605756; x=1789210556; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C/K62fur/QZSZ3PEXdQG+JTXHX6rDaSLLwnm6mZxkj8=;
        b=QUDJg6v4oJyUvCTQ7OTN3fXqm+nLZ8p7+bg/DWpM4CrU24AKrRop0UftYllcl35O+G
         DYCqJKWsxMd1oOmubI1GaDFiK4ewHEPQYipc+u6b6j96bTmt6xuXbnuO7lizALBF1VAe
         B9gWfZXgbX53RTwuTzQ8ZLs9583MlJ04iG8jo4Hzf4W1MWXwTZ87NdflpFTLcxWhU7Em
         E+De/+TVVlGt+AgVlZBRFDZbQ1ybDO0+7zq5e1Pn5LfmQPHWP4zf93CwfAlYe/5wOfBK
         InwJp8ejVfZrsZ8x+6JTIOgZRF0MG+mN6azaoMQEfUwDSH7i+XYJM/hDg/dML15fzKzh
         E+RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788605756; x=1789210556;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C/K62fur/QZSZ3PEXdQG+JTXHX6rDaSLLwnm6mZxkj8=;
        b=n/RKq/ElIgbdr+XB2M2Vvj6Z9I3bUstcLD6CJTPZEqDbxinuswpNk1jF3OFpTqI4ZG
         9giJITtq9Fy1K3h9evnCYGoCXDZ1A6UGEy37IX0Am8LHiPawFeHZL/AvT/Z4KkTS9w2Q
         8zzLPwKj8nyTYpq430owBxPFarNbnE0Tey1DnRWrdJ+rz5UNW7/253aJ2MNBQJyKvxNK
         dC85DxWGwyTwk64PzRhJBdIYcSZ8RVSR88EqbvQZOS7V64H+Auef8YroX8SzLfTVAwHS
         JmYbZlKzq/Ln1kuTpMcZc29L5IVKI3UpYg0t/k0nfVSEK1sCJLLpT36USM1XuTSaEnSK
         Y5gg==
X-Forwarded-Encrypted: i=1; AKwUvBxRmVgK8T0npAfJ+NGlAQbsQQ/0+MR6jms14Gb6ypVvOd0yKnohY5PP8tVw+FD9poRuQIhZ562YTTlRC1UYCeDpHQ==@vger.kernel.org
X-Gm-Message-State: AFuF++mYahdnZugQs9ZA55DexOCDnCd1ZhNAsiWa078semsBU/WkASRY
	BfK7wkTB1GSGg12kN8YAa+R5bLXHKcv8xAHgnA7slyKTrvHQR293f58j
X-Gm-Gg: AYBFou26aFH8LOyhT6Kk4bbAzdnGvzKfo30UCd048m3CqSA3auA5gxnPaAdIyOIWYli
	kFVJZGS/ZLXsf6oriwkp/3PkTOj07AIfAVgO8qO8BvTPpERSMByobcpXZ8N8H7rKmkc6oVfEG2P
	YPpdrVOcBURLEtyCtp1ybGS1qrXFp8RJtUCZ5uR7MYwoZuMQMEhdFwliAQKongW0yj3dVNP5ZKn
	rb1lAhZ7MSdEVZsNtRM6i0DX3VZg74mjVvYmqUIFbCogg4I96QE4tNWLcpRw0tSZO1XdimLbcjb
	xc+zFj7bgFuDh6ptd64wDYKv2HxEqnGiXj1fH2Nr/SetMxofH1IqtTKEzOtjcGyy1pya0LhIyUK
	O4dP12ASoU6F2jiPaW9a7zOhxnSH7rsM24R7a4GksfOTEZL5q0xkNsSbHezv37Z3UhYuaAcrKiQ
	v0QHPiUK4w9s614ILmBsc46U1VKQki3QAqqG0sxRzSt/a7Td046AL7MWQVymckVlP3D34q9oNCR
	ilc/2+G9p0ie3/B0TKVCTDC4r7zk8quehZ/FvNeRxDp2sADQW6kS+k=
X-Received: by 2002:a05:6512:2c8a:b0:5b6:4ae:a3f5 with SMTP id 2adb3069b0e04-5b617070ac3mr1786241e87.29.1788605756034;
        Sat, 05 Sep 2026 03:55:56 -0700 (PDT)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b6166fe651sm1020664e87.51.2026.09.05.03.55.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 05 Sep 2026 03:55:55 -0700 (PDT)
Message-ID: <fdb1bbb8-1ecb-4636-bc1e-2f025e75ff91@gmail.com>
Date: Sat, 5 Sep 2026 13:55:53 +0300
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mfd: fix typos in comments
To: Hemanth Selam <hemanth.selam@gmail.com>, Lee Jones <lee@kernel.org>,
 Support Opensource <support.opensource@diasemi.com>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: linux-kernel@vger.kernel.org, mfd@lists.linux.dev,
 linux-samsung-soc@vger.kernel.org
References: <20260904122834.33723-1-hemanth.selam@gmail.com>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <20260904122834.33723-1-hemanth.selam@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 04/09/2026 15:28, Hemanth Selam wrote:
> Fix typos in comments, reported by scripts/checkpatch.pl using the
> misspelling list in scripts/spelling.txt.  Only touches comments, no code
> changes.
> 
> Assisted-by: Cursor:claude-opus-5
> Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
> ---
>   drivers/mfd/88pm800.c                |  2 +-
>   drivers/mfd/kempld-core.c            |  2 +-
>   drivers/mfd/max8998.c                |  2 +-
>   drivers/mfd/rave-sp.c                |  6 +++---
>   drivers/mfd/si476x-i2c.c             |  2 +-
>   include/linux/mfd/da9063/registers.h |  2 +-
>   include/linux/mfd/db8500-prcmu.h     | 32 ++++++++++++++--------------
>   include/linux/mfd/lp8788.h           |  2 +-
>   include/linux/mfd/max8998.h          |  2 +-
>   include/linux/mfd/palmas.h           |  2 +-
>   include/linux/mfd/rohm-bd71828.h     |  2 +-
>   include/linux/mfd/samsung/core.h     |  2 +-
>   include/linux/mfd/si476x-core.h      |  2 +-
>   include/linux/mfd/twl.h              |  2 +-
>   14 files changed, 31 insertions(+), 31 deletions(-)
> 
> diff --git a/drivers/mfd/88pm800.c b/drivers/mfd/88pm800.c
> index e9941da58b18..aac630322b3c 100644
> --- a/drivers/mfd/88pm800.c
> +++ b/drivers/mfd/88pm800.c
> @@ -275,7 +275,7 @@ static int device_gpadc_init(struct pm80x_chip *chip,
>   		goto out;
>   
>   	/*
> -	 * the defult of PM800 is GPADC operates at 100Ks/s rate
> +	 * the default of PM800 is GPADC operates at 100Ks/s rate
>   	 * and Number of GPADC slots with active current bias prior
>   	 * to GPADC sampling = 1 slot for all GPADCs set for
>   	 * Temprature mesurmants
> diff --git a/drivers/mfd/kempld-core.c b/drivers/mfd/kempld-core.c
> index b64729918dfd..47062f876e5d 100644
> --- a/drivers/mfd/kempld-core.c
> +++ b/drivers/mfd/kempld-core.c
> @@ -37,7 +37,7 @@ static void kempld_get_hardware_mutex(struct kempld_device_data *pld)
>   
>   static void kempld_release_hardware_mutex(struct kempld_device_data *pld)
>   {
> -	/* The harware mutex is released when 1 is written to the mutex bit. */
> +	/* The hardware mutex is released when 1 is written to the mutex bit. */
>   	iowrite8(KEMPLD_MUTEX_KEY, pld->io_index);
>   }
>   
> diff --git a/drivers/mfd/max8998.c b/drivers/mfd/max8998.c
> index eb13bbaeda55..5032eab05bb4 100644
> --- a/drivers/mfd/max8998.c
> +++ b/drivers/mfd/max8998.c
> @@ -146,7 +146,7 @@ static struct max8998_platform_data *max8998_i2c_parse_dt_pdata(
>   
>   	/*
>   	 * ToDo: the 'wakeup' member in the platform data is more of a linux
> -	 * specfic information. Hence, there is no binding for that yet and
> +	 * specific information. Hence, there is no binding for that yet and
>   	 * not parsed here.
>   	 */
>   	return pd;
> diff --git a/drivers/mfd/rave-sp.c b/drivers/mfd/rave-sp.c
> index 05d26d92df03..53c57bafea8f 100644
> --- a/drivers/mfd/rave-sp.c
> +++ b/drivers/mfd/rave-sp.c
> @@ -331,7 +331,7 @@ static u8 rave_sp_reply_code(u8 command)
>   		return command + 0x20;
>   	case 0xE0 ... 0xEF:
>   		/*
> -		 * Events emitted by all versions of the firmare use
> +		 * Events emitted by all versions of the firmware use
>   		 * least significant bit to get an ACK code
>   		 */
>   		return command | 0x01;
> @@ -544,7 +544,7 @@ static size_t rave_sp_receive_buf(struct serdev_device *serdev,
>   				 * NOTE: The above means that only the
>   				 * frame started by third SOF, sent
>   				 * after this one will have a chance
> -				 * to get throught.
> +				 * to get through.
>   				 */
>   				goto reset_framer;
>   			case RAVE_SP_DLE:
> @@ -595,7 +595,7 @@ static size_t rave_sp_receive_buf(struct serdev_device *serdev,
>   
>   	/*
>   	 * The only way to get out of the above loop and end up here
> -	 * is throught consuming all of the supplied data, so here we
> +	 * is through consuming all of the supplied data, so here we
>   	 * report that we processed it all.
>   	 */
>   	return size;
> diff --git a/drivers/mfd/si476x-i2c.c b/drivers/mfd/si476x-i2c.c
> index 9bce720a0a08..6351aef2d3bb 100644
> --- a/drivers/mfd/si476x-i2c.c
> +++ b/drivers/mfd/si476x-i2c.c
> @@ -222,7 +222,7 @@ int si476x_core_stop(struct si476x_core *core, bool soft)
>   	atomic_set(&core->is_alive, 0);
>   
>   	if (soft) {
> -		/* TODO: This probably shoud be a configurable option,
> +		/* TODO: This probably should be a configurable option,
>   		 * so it is possible to have the chips keep their
>   		 * oscillators running
>   		 */
> diff --git a/include/linux/mfd/da9063/registers.h b/include/linux/mfd/da9063/registers.h
> index 7b8364bd08a0..376c5d330599 100644
> --- a/include/linux/mfd/da9063/registers.h
> +++ b/include/linux/mfd/da9063/registers.h
> @@ -14,7 +14,7 @@
>   #define DA9063_I2C_PAGE_SEL_SHIFT	1
>   #define	DA9063_EVENT_REG_NUM		4
>   
> -/* Page selection I2C or SPI always in the begining of any page. */
> +/* Page selection I2C or SPI always in the beginning of any page. */
>   /* Page 0 : I2C access 0x000 - 0x0FF	SPI access 0x000 - 0x07F */
>   /* Page 1 :				SPI access 0x080 - 0x0FF */
>   /* Page 2 : I2C access 0x100 - 0x1FF	SPI access 0x100 - 0x17F */
> diff --git a/include/linux/mfd/db8500-prcmu.h b/include/linux/mfd/db8500-prcmu.h
> index c939c9a1170a..87a28c4f1d81 100644
> --- a/include/linux/mfd/db8500-prcmu.h
> +++ b/include/linux/mfd/db8500-prcmu.h
> @@ -337,31 +337,31 @@ enum sia_mmdsp_stat {
>    * @SYSCLKOK_ERR: The SYSCLK is not available in the given time
>    * @BOOT_ERR: Romcode has not validated the XP70 self reset in the given time
>    * @ROMCODESAVECONTEXT: The Romcode didn.t correctly save it secure context
> - * @VARMHIGHSPEEDVALTO_ERR: The ARM high speed supply value transfered
> + * @VARMHIGHSPEEDVALTO_ERR: The ARM high speed supply value transferred
>    *          through I2C has not been correctly executed in the given time
> - * @VARMHIGHSPEEDACCESS_ERR: The command value of VarmHighSpeedVal transfered
> + * @VARMHIGHSPEEDACCESS_ERR: The command value of VarmHighSpeedVal transferred
>    *             through I2C has not been correctly executed in the given time
> - * @VARMLOWSPEEDVALTO_ERR:The ARM low speed supply value transfered through
> + * @VARMLOWSPEEDVALTO_ERR:The ARM low speed supply value transferred through
>    *                     I2C has not been correctly executed in the given time
> - * @VARMLOWSPEEDACCESS_ERR: The command value of VarmLowSpeedVal transfered
> + * @VARMLOWSPEEDACCESS_ERR: The command value of VarmLowSpeedVal transferred
>    *             through I2C has not been correctly executed in the given time
> - * @VARMRETENTIONVALTO_ERR: The ARM retention supply value transfered through
> + * @VARMRETENTIONVALTO_ERR: The ARM retention supply value transferred through
>    *                     I2C has not been correctly executed in the given time
> - * @VARMRETENTIONACCESS_ERR: The command value of VarmRetentionVal transfered
> + * @VARMRETENTIONACCESS_ERR: The command value of VarmRetentionVal transferred
>    *             through I2C has not been correctly executed in the given time
> - * @VAPEHIGHSPEEDVALTO_ERR: The APE highspeed supply value transfered through
> + * @VAPEHIGHSPEEDVALTO_ERR: The APE highspeed supply value transferred through
>    *                     I2C has not been correctly executed in the given time
> - * @VSAFEHPVALTO_ERR: The SAFE high power supply value transfered through I2C
> + * @VSAFEHPVALTO_ERR: The SAFE high power supply value transferred through I2C
>    *                         has not been correctly executed in the given time
> - * @VMODSEL1VALTO_ERR: The MODEM sel1 supply value transfered through I2C has
> + * @VMODSEL1VALTO_ERR: The MODEM sel1 supply value transferred through I2C has
>    *                             not been correctly executed in the given time
> - * @VMODSEL2VALTO_ERR: The MODEM sel2 supply value transfered through I2C has
> + * @VMODSEL2VALTO_ERR: The MODEM sel2 supply value transferred through I2C has
>    *                             not been correctly executed in the given time
> - * @VARMOFFACCESS_ERR: The command value of Varm ON/OFF transfered through
> + * @VARMOFFACCESS_ERR: The command value of Varm ON/OFF transferred through
>    *                     I2C has not been correctly executed in the given time
> - * @VAPEOFFACCESS_ERR: The command value of Vape ON/OFF transfered through
> + * @VAPEOFFACCESS_ERR: The command value of Vape ON/OFF transferred through
>    *                     I2C has not been correctly executed in the given time
> - * @VARMRETACCES_ERR: The command value of Varm retention ON/OFF transfered
> + * @VARMRETACCES_ERR: The command value of Varm retention ON/OFF transferred
>    *             through I2C has not been correctly executed in the given time
>    * @CURAPPWRSTISNOTBOOT:Generated when Arm want to do power state transition
>    *             ApBoot to ApExecute but the power current state is not Apboot
> @@ -376,11 +376,11 @@ enum sia_mmdsp_stat {
>    *                    been correctly executed in the given time
>    * @ARMREGU2VALTO_ERR: The ArmRegu2 value transferred through I2C has not
>    *                    been correctly executed in the given time
> - * @VAPEREGUVALTO_ERR: The VApeRegu value transfered through I2C has not
> + * @VAPEREGUVALTO_ERR: The VApeRegu value transferred through I2C has not
>    *                    been correctly executed in the given time
> - * @VSMPS3REGUVALTO_ERR: The VSmps3Regu value transfered through I2C has not
> + * @VSMPS3REGUVALTO_ERR: The VSmps3Regu value transferred through I2C has not
>    *                      been correctly executed in the given time
> - * @VMODREGUVALTO_ERR: The VModemRegu value transfered through I2C has not
> + * @VMODREGUVALTO_ERR: The VModemRegu value transferred through I2C has not
>    *                    been correctly executed in the given time
>    */
>   enum mbox_to_arm_err {
> diff --git a/include/linux/mfd/lp8788.h b/include/linux/mfd/lp8788.h
> index fd17bec2a33e..e8c50bd38a8a 100644
> --- a/include/linux/mfd/lp8788.h
> +++ b/include/linux/mfd/lp8788.h
> @@ -34,7 +34,7 @@
>   #define LP8788_ALM_IRQ		"ALARM_IRQ"
>   
>   enum lp8788_int_id {
> -	/* interrup register 1 : Addr 00h */
> +	/* interrupt register 1 : Addr 00h */
>   	LP8788_INT_TSDL,
>   	LP8788_INT_TSDH,
>   	LP8788_INT_UVLO,
> diff --git a/include/linux/mfd/max8998.h b/include/linux/mfd/max8998.h
> index 5473f1983e31..ad2ad24412fb 100644
> --- a/include/linux/mfd/max8998.h
> +++ b/include/linux/mfd/max8998.h
> @@ -45,7 +45,7 @@ enum {
>   /**
>    * max8998_regulator_data - regulator data
>    * @id: regulator id
> - * @initdata: regulator init data (contraints, supplies, ...)
> + * @initdata: regulator init data (constraints, supplies, ...)
>    * @reg_node: DT node of regulator (unused on non-DT platforms)
>    */
>   struct max8998_regulator_data {
> diff --git a/include/linux/mfd/palmas.h b/include/linux/mfd/palmas.h
> index dabcc0dea802..1d872363820a 100644
> --- a/include/linux/mfd/palmas.h
> +++ b/include/linux/mfd/palmas.h
> @@ -251,7 +251,7 @@ enum tps65917_regulators {
>   	TPS65917_NUM_REGS,
>   };
>   
> -/* External controll signal name */
> +/* External control signal name */
>   enum {
>   	PALMAS_EXT_CONTROL_ENABLE1      = 0x1,
>   	PALMAS_EXT_CONTROL_ENABLE2      = 0x2,
> diff --git a/include/linux/mfd/rohm-bd71828.h b/include/linux/mfd/rohm-bd71828.h
> index 39fe275a8117..ea9b1a8f495f 100644
> --- a/include/linux/mfd/rohm-bd71828.h
> +++ b/include/linux/mfd/rohm-bd71828.h
> @@ -186,7 +186,7 @@ enum {
>   #define BD71828_REG_RTC_ALM2		0x63
>   #define BD71828_REG_RTC_START		BD71828_REG_RTC_SEC
>   
> -/* Charger/Battey */
> +/* Charger/Battery */
>   #define BD71828_REG_CHG_STATE		0x65
>   #define BD71828_REG_CHG_FULL		0xd2
>   #define BD71828_REG_CHG_EN		0x6F
> diff --git a/include/linux/mfd/samsung/core.h b/include/linux/mfd/samsung/core.h
> index 6191f409de94..e489ca0d55ed 100644
> --- a/include/linux/mfd/samsung/core.h
> +++ b/include/linux/mfd/samsung/core.h
> @@ -106,7 +106,7 @@ struct sec_platform_data {
>   /**
>    * sec_regulator_data - regulator data
>    * @id: regulator id
> - * @initdata: regulator init data (contraints, supplies, ...)
> + * @initdata: regulator init data (constraints, supplies, ...)
>    */
>   struct sec_regulator_data {
>   	int				id;
> diff --git a/include/linux/mfd/si476x-core.h b/include/linux/mfd/si476x-core.h
> index d9e3a322134c..40866d7162c9 100644
> --- a/include/linux/mfd/si476x-core.h
> +++ b/include/linux/mfd/si476x-core.h
> @@ -97,7 +97,7 @@ enum si476x_power_state {
>    * @command: Wait queue for wainting on the command comapletion.
>    * @cts: Clear To Send flag set upon receiving first status with CTS
>    * set.
> - * @tuning: Wait queue used for wainting for tune/seek comand
> + * @tuning: Wait queue used for wainting for tune/seek command

'nit':
Could you please fix also the 'wainting'?

With that:

Reviewed-by: Matti Vaittinen <mazziesaccount@gmail.com>

>    * completion.
>    * @stc: Similar to @cts, but for the STC bit of the status value.
>    * @power_up_parameters: Parameters used as argument for POWER_UP
> diff --git a/include/linux/mfd/twl.h b/include/linux/mfd/twl.h
> index b31e07fa4d51..238d9dcefc35 100644
> --- a/include/linux/mfd/twl.h
> +++ b/include/linux/mfd/twl.h
> @@ -739,7 +739,7 @@ int twl4030_sih_setup(struct device *dev, int module, int irq_base);
>   #define TWL4030_REG_VUSB3V1	19
>   
>   /* TWL6030 SMPS/LDO's */
> -/* EXTERNAL dc-to-dc buck convertor controllable via SR */
> +/* EXTERNAL dc-to-dc buck converter controllable via SR */
>   #define TWL6030_REG_VDD1	30
>   #define TWL6030_REG_VDD2	31
>   #define TWL6030_REG_VDD3	32


-- 
Matti Vaittinen
Linux kernel developer at ROHM Semiconductors
Oulu Finland

~~ When things go utterly wrong vim users can always type :help! ~~
