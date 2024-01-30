Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9A7F57898
	for <linux-samsung-soc@vger.kernel.org>; Tue, 30 Jan 2024 09:00:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706605203; cv=none; b=O6Yeath7DAIsC6xYlQ3MTgcbIAloesT5MNYO8wQc+EcWoNUE/vHuICJ+dn/thF2GE7hvn/rmQgyrJv++PFDzR11Nc+Ai6gG0jQeIMNYmk6ELggg6LBJv2EifKLDGtmYwfSmb/Hbt/seiYQN86pCQp9yE8kjOV8cSTNxhnzF/l9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706605203; c=relaxed/simple;
	bh=Ss8eXXVOK69pwFg4ALxuF9O7AP24QrPRskLjKqOA56E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=e2uwp5WbB11J6tOgAGB2N1gEzQihuCl3ItX+9+Knrzgw0h1K0FbLlktRSVpH5ot3Gxo3vwH3Iit8+Fo53xKKBjRLCxrvI9DXigj9YEXzIlNALV72pIMna/+pINZC7BuzA3aiO2IMjRm/Yz2iwLCwsJyu6maSqHiDLrfQXgoBvHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ccmA6EkN; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ccmA6EkN"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-55f279dca99so1763793a12.3
        for <linux-samsung-soc@vger.kernel.org>; Tue, 30 Jan 2024 01:00:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706605200; x=1707210000; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Db3zP9xDe7AQg6WDfeMGEY2GUxXn8qP4OsKoMMuxQJ0=;
        b=ccmA6EkNzCqWrEQnNllEh5x+B612famcR+jlP8oxYKGjSZoV5kFif7IeHvL5qOA9ex
         trkC183mEh/r7lh1b7iFoieOKGBSpBGLXi9FL1g9pzocgc9L+zDzcDAlHbV8efoKtiQc
         xh86Nre7G5tEOJACdu1SvoH9jfcZBnNNNWeU1ZqzYIJ4Yp47ynBRJSko3Bx85VlPe2Cl
         30R2qciJAtpnO/NaoFjkf7Ji0gP9xOg0OHy5N78864zBR88IpP3CaqQ0+dZGpSFdhFDc
         e1dEerihR3/7wBOndQJR9kygmz4QjwOHH1C9xMsy9ZnOS03qQuKSNGNKjveI3aWP+m1m
         fGCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706605200; x=1707210000;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Db3zP9xDe7AQg6WDfeMGEY2GUxXn8qP4OsKoMMuxQJ0=;
        b=gBKa6lyyhGiem7AtWrP/l3Stuto2ArzrBy4O4PcumyaB3u/i5+vbr1eO5U3kGIrftY
         iPmHX4hPnT2MgPYFVYpOYyTLvwtkxeksH4SGg1QNmuBGjiWfM1b57FBEF+VM3QRkp34A
         xONGT4j/V2bE1g0KYxbJXmquZuj31AphfsQobDWxO3tXK53mp8wlQvs5KT2S9vzIUoKG
         OM3iG+Go1D//lhDPGcu2V/XEC8IDaL7blUYB/JQSX+6ugMvby07DXfcrprbYovH+kb3q
         B8n6inXgzTO55IiZkkOmio2TONZaVyIABA8vB1pvPA7wWECRI3NpOsHKq+cbc1vQLx96
         Gi5w==
X-Gm-Message-State: AOJu0Yw3WeIaXhAG9z/ZiKcoy7VFrRvI5iR6iGKhLyZY4fiNhUKjlZ9A
	q2r5TYvNvPIGgeO6MhASzSYrsZTC8LkoZ0kCOs2oQUck+w/XhCriABkajupvpAg=
X-Google-Smtp-Source: AGHT+IFpF6eb2hwZ1pcq0BDPc8nFxpTlxhdwU9wZlPnph/0Br1InfNUBcZB2iLz9YJiS9cXsEmiNZQ==
X-Received: by 2002:a05:6402:22e4:b0:55e:f4fb:66f6 with SMTP id dn4-20020a05640222e400b0055ef4fb66f6mr3348290edb.18.1706605200064;
        Tue, 30 Jan 2024 01:00:00 -0800 (PST)
Received: from [192.168.2.107] ([79.115.63.202])
        by smtp.gmail.com with ESMTPSA id f19-20020a056402195300b0055e96290001sm3700180edz.27.2024.01.30.00.59.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jan 2024 00:59:59 -0800 (PST)
Message-ID: <3e078f39-ccd4-4bf4-b11c-5160cc1f0221@linaro.org>
Date: Tue, 30 Jan 2024 08:59:57 +0000
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/7] clk: samsung: gs101: add support for cmu_peric1
Content-Language: en-US
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 peter.griffin@linaro.org, mturquette@baylibre.com, sboyd@kernel.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org
Cc: linux-kernel@vger.kernel.org, kernel-team@android.com,
 willmcvicker@google.com, semen.protsenko@linaro.org,
 alim.akhtar@samsung.com, s.nawrocki@samsung.com, tomasz.figa@gmail.com,
 cw00.choi@samsung.com, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20240129174703.1175426-1-andre.draszik@linaro.org>
 <20240129174703.1175426-4-andre.draszik@linaro.org>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20240129174703.1175426-4-andre.draszik@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 1/29/24 17:46, André Draszik wrote:
> CMU_PERIC1 is the clock management unit used for the peric1 block which
> is used for additional USI, I3C and PWM interfaces/busses. Add support
> for muxes, dividers and gates of cmu_peric1, except for
> CLK_GOUT_PERIC1_IP which isn't well described in the datasheet and
> which downstream also ignores (similar to cmu_peric0).
> 
> Two clocks have been marked as CLK_IS_CRITICAL for the following
> reason:
>     * disabling them makes it impossible to access any peric1
>       registers, (including those two registers).
>     * disabling gout_peric1_lhm_axi_p_peric1_i_clk sometimes has the
>       additional effect of making the whole system unresponsive.
> 
> One clock marked as CLK_IGNORE_UNUSED needs to be kept on until we have
> updated the respective driver for the following reason:
>     * gout_peric1_gpio_peric1_pclk is required by the pinctrl
>       configuration. With this clock disabled, reconfiguring the pins
>       (for USI/I2C, USI/UART) will hang during register access.
>       Since pinctrl-samsung doesn't support a clock at the moment, we
>       just keep the kernel from disabling it at boot, until we have an
>       update for pinctrl-samsung, at which point we'll drop the flag.
> 
> Signed-off-by: André Draszik <andre.draszik@linaro.org>
> Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>
> Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
> 

Looks good to me:

Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>
