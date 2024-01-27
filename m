Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7648611CA9
	for <linux-samsung-soc@vger.kernel.org>; Sat, 27 Jan 2024 03:51:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706327488; cv=none; b=g282rBMkO5cC0xC1aw/Srver/Ay+8wPsvWYPhA+/EupovWRsA9vH+VDplk45YoNq0Y/PEUgaL2ORzWDX1JZEDsVDJT0Ps32bEEaD80Gde3i2cV2XJaLlh/Up194Ttjtmho0q0BpIw3pPC9OrC03vlbYYq4vwU/ts9kVy4DO4khs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706327488; c=relaxed/simple;
	bh=msAAsHnYp9dDU1nBGi7OeAQmsHg04Jp86mIxrq7A+7U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oTlnccj/2jqiT1olYqV/KAHCd8W4hBQEwY5c3M75A5OpfEescfOuyuMU7d0hcOZAnrlFcT0dUJ0C+m/q6mobD34hZS7TQYjSNc5B+9chlfCvk2E5dkGBNEno0DJmVtGwqFpafD22uLeCsgBYDxkDX2QlHuNleZ2OWlWza/deQ4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EIyFpAtO; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EIyFpAtO"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-33ae51f8111so9057f8f.2
        for <linux-samsung-soc@vger.kernel.org>; Fri, 26 Jan 2024 19:51:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706327485; x=1706932285; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eA5sHaQ/PWieJoQlxJp123U7HWC2lrQF3AkJ1Sjfd/A=;
        b=EIyFpAtOer02jvOWRLbZ/IkHCmn1iVarTB4liVG1OCs65kXee/aJpeMPXyG9lGSrys
         5B1f+0HfAGQH6Rsei6odiRLSTgX63C2+rnMXbV9HqdX3Z+Cr7JTZAZw8DDWeoQrhL1rz
         DOxodwLCDelIY/hJlNHAmtwf97cMraIVf0nG29a+1TfDhJf/5AJwkKjlnhG8bI+1PKw5
         RGh1XXcVZBbFW3Kxh4y5V/0zBtRJ8HPqxnFeSH+h8zk3w/0edwILEn8g0TjHQITjcaOx
         NCnIQDjWI62Ga6bTN5E8O5Dk7ISH9CdH40K8gOSVmtHvHOeLLCiCVx/LscZ3haA/3YF9
         wQjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706327485; x=1706932285;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eA5sHaQ/PWieJoQlxJp123U7HWC2lrQF3AkJ1Sjfd/A=;
        b=pyz7/+JFzXb2TkZJMmeVvgD0/7KAGCr9nzqW4HGn/V4kLUwWiMqj37PmlvoVngDeiz
         wuEvdmruFTImLA3aBojkwWYEy3L9fH0MmN4NlhMsF3ktcSAE92gSZBS/t1MQTPidSKoh
         daM08UgRqSs0/9KBlcYoSmi/L/hSmQ+fBKcmVq8dCJ/ZGtWtYRhZFot3c0B7Qf5xb3ke
         IWWEN6oSYO3ZzIIN7Ux7nm0QqN1+uiIhDV1YvUaE8AGt9q/+qzru1UfS0NWITs/1uKtO
         yWQypaCoeozr7PslRzsEwA5oe2vlkattAzTxMTcRKDWHvJnriyY4n+60uOWwE21TUAZa
         7MqA==
X-Gm-Message-State: AOJu0YyRzaBlqY6Cj5iWfpdEtAIXqegUNrnA8KGjLDtyE/pFyhW0WUdG
	Akpyr3pkWWA30H5QzYebOOlg1mNAc2ZxcMhmFeAE4Pe/OdDVedenchYVqFfjXP4=
X-Google-Smtp-Source: AGHT+IHJor75pF9ULrm9tvymvIXPCu81/kVDIGw5BNhsAxxvC06RX9bUMBn+3+IBrRM76q/uExGOJQ==
X-Received: by 2002:a5d:46c7:0:b0:337:c287:2997 with SMTP id g7-20020a5d46c7000000b00337c2872997mr428917wrs.44.1706327484673;
        Fri, 26 Jan 2024 19:51:24 -0800 (PST)
Received: from [192.168.2.107] ([79.115.63.202])
        by smtp.gmail.com with ESMTPSA id hw20-20020a170907a0d400b00a2b1a20e662sm1299962ejc.34.2024.01.26.19.51.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Jan 2024 19:51:24 -0800 (PST)
Message-ID: <3178cde5-32bb-4294-873e-44a993aef31b@linaro.org>
Date: Sat, 27 Jan 2024 03:51:22 +0000
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] clk: samsung: gs101: gpio_peric0_pclk needs to be
 kept on
Content-Language: en-US
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 peter.griffin@linaro.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org
Cc: linux-kernel@vger.kernel.org, kernel-team@android.com,
 willmcvicker@google.com, semen.protsenko@linaro.org,
 alim.akhtar@samsung.com, s.nawrocki@samsung.com, tomasz.figa@gmail.com,
 cw00.choi@samsung.com, mturquette@baylibre.com, sboyd@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org
References: <20240127003607.501086-1-andre.draszik@linaro.org>
 <20240127003607.501086-2-andre.draszik@linaro.org>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20240127003607.501086-2-andre.draszik@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 1/27/24 00:35, André Draszik wrote:
> This pclk clock is required any time we access the pinctrl registers of
> this block.
> 
> Since pinctrl-samsung doesn't support a clock at the moment, we just
> keep the kernel from disabling it at boot, until we have an update for
> pinctrl-samsung to handle this required clock, at which point we'll be
> able to drop the flag again.
> 
> Fixes: 893f133a040b ("clk: samsung: gs101: add support for cmu_peric0")
> Signed-off-by: André Draszik <andre.draszik@linaro.org>

Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>

> ---
>  drivers/clk/samsung/clk-gs101.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/samsung/clk-gs101.c b/drivers/clk/samsung/clk-gs101.c
> index 4a0520e825b6..61bb0dcf84ee 100644
> --- a/drivers/clk/samsung/clk-gs101.c
> +++ b/drivers/clk/samsung/clk-gs101.c
> @@ -2848,7 +2848,7 @@ static const struct samsung_gate_clock peric0_gate_clks[] __initconst = {
>  	GATE(CLK_GOUT_PERIC0_GPIO_PERIC0_PCLK,
>  	     "gout_peric0_gpio_peric0_pclk", "mout_peric0_bus_user",
>  	     CLK_CON_GAT_GOUT_BLK_PERIC0_UID_GPIO_PERIC0_IPCLKPORT_PCLK,
> -	     21, 0, 0),
> +	     21, CLK_IGNORE_UNUSED, 0),
>  	/* Disabling this clock makes the system hang. Mark the clock as critical. */
>  	GATE(CLK_GOUT_PERIC0_LHM_AXI_P_PERIC0_I_CLK,
>  	     "gout_peric0_lhm_axi_p_peric0_i_clk", "mout_peric0_bus_user",
