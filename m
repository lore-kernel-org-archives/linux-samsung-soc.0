Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FF827FB
	for <linux-samsung-soc@vger.kernel.org>; Fri, 26 Jan 2024 08:12:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706256780; cv=none; b=gGvsUFjFZ8pMzK74b+JSTFwPBwXRQJJr7OxIGsyWjNu4m5oyjLTZyIJGfUHxT2R3JdU2TIVc+7u04wuXn2l5iQYUfTGARoJb1ii2VieXzxhxr2wyVJIj0hMnUWeF6OB26hGa/jLbnqAJmaq6CzLiEAwIsNIQoXnoHwSMWLLtNwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706256780; c=relaxed/simple;
	bh=j0KyPZxIPo0uWsEdhfU4pbbVE5DXmn5Ni8Prmsb0wmQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kNZNwfhFuioastfD/IlfFOAzNoHjX366wsdjXovxrow7mx2/xI5QjEcFyTuBsfiTn88rnkN88a+Yqa07HCVExUHjZdYYzidXogqzAiRdRGXI44vRKysFEChxNjCfJKjsFf1Ze/b7+kKUFOod5sA9Ea3e9NAt/QnZOI/ygpq1vpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cGhbUI0d; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cGhbUI0d"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-338aca547d9so127857f8f.0
        for <linux-samsung-soc@vger.kernel.org>; Fri, 26 Jan 2024 00:12:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706256776; x=1706861576; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7rrGeLbPaiEO5WdfZAroSibRcJzRjQTQSH2UK6pfWWU=;
        b=cGhbUI0ddbkg1yqHF5QGLw29FKlMaq4LhI9mCSEsD25FDzarB3MzZo1b6djaDYcGq7
         6SiuoRJhq2FIqcceuV2QYjChtdXsEdTiKoQZxO7oUcyTa/E/xVwPuzSIQSHqyiK+YgKI
         zVd5jiO81CqXTk9MGNEsnmnoUGln34XDCNBnbdDKibWahhFE2eH3mi9jK4GyeBcOfw3L
         11HljxmiW6DkX1Xi+udVapg9OiqVCSlnxtuIcglkbZQaRrzdQvqTiTSswB0l4+VbeFRV
         Srq9JGt0dPXFznN+pu78EuT7iCtW7E8R1q3t6yRBC3vUOcrBz/vPCrG4xtYaql/YqfJI
         Q0aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706256776; x=1706861576;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7rrGeLbPaiEO5WdfZAroSibRcJzRjQTQSH2UK6pfWWU=;
        b=oM491YZyL/C/eLkpXYddp+IC7gP4vGPIefByogiPGLbnGht597dmRmNFYipAaSak23
         3kSIIYYkkB4GimooxV4paPY+21ru+vDqxQg2dbK5u1Ygpb6bPYyEYJeiU3Euj6JQaMyL
         2Kb0PjbuRePHsmb6jsLOzzdQWJ2gQKWM6rQXKkagfo9hsgLDlCuFt+AUGGFTW7TfnQmK
         wgUqzgCX1XwvWGIHJxCoxz/7/9uKSyTT/VRlloyY7PM+qHntAibqt0FoDxA8lv/dpxPZ
         RTFiamegVmu2uz1KlRzE6GFVu10Sj3eTdLG0XD5vXdvTEKZshE8MOKGlxbYy+3UdCu4O
         Hauw==
X-Gm-Message-State: AOJu0Yykpfo3h6xcqchvM6xZm0ROBzReVgwLTlrBvAtZ60dBfPhDjU/9
	t7QJBzkbdTVnN9wGEuc3c5Xv9MyGccdSQmjgS29FzcEx20sQ5yIQQS40y+eAQDs=
X-Google-Smtp-Source: AGHT+IHYWsJaFOgmZA2cYd4ZXS8KktyrXEtOyqRNy+rcez2sY0vlMH99r9icXczxQRRDhB61fWdP/Q==
X-Received: by 2002:adf:a485:0:b0:337:bdff:bfc0 with SMTP id g5-20020adfa485000000b00337bdffbfc0mr296142wrb.99.1706256776614;
        Fri, 26 Jan 2024 00:12:56 -0800 (PST)
Received: from [192.168.2.107] ([79.115.63.202])
        by smtp.gmail.com with ESMTPSA id s18-20020a5d69d2000000b003393457afc2sm694393wrw.95.2024.01.26.00.12.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Jan 2024 00:12:56 -0800 (PST)
Message-ID: <6cedad43-766c-4b3d-81d2-957b9e88f471@linaro.org>
Date: Fri, 26 Jan 2024 08:12:53 +0000
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/28] spi: s3c64xx: use full mask for {RX,
 TX}_FIFO_LVL
Content-Language: en-US
To: Sam Protsenko <semen.protsenko@linaro.org>
Cc: broonie@kernel.org, andi.shyti@kernel.org, arnd@arndb.de,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 alim.akhtar@samsung.com, linux-spi@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-arch@vger.kernel.org, andre.draszik@linaro.org,
 peter.griffin@linaro.org, kernel-team@android.com, willmcvicker@google.com
References: <20240125145007.748295-1-tudor.ambarus@linaro.org>
 <20240125145007.748295-11-tudor.ambarus@linaro.org>
 <CAPLW+4nOGjfniu+shzO5irmH5bC1E_yD0EZcuDwQJKdfMiDswA@mail.gmail.com>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <CAPLW+4nOGjfniu+shzO5irmH5bC1E_yD0EZcuDwQJKdfMiDswA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 1/25/24 20:03, Sam Protsenko wrote:
> On Thu, Jan 25, 2024 at 8:50 AM Tudor Ambarus <tudor.ambarus@linaro.org> wrote:
>>
>> SPI_STATUSn.{RX, TX}_FIFO_LVL fields show the data level in the RX and
>> TX FIFOs. The IP supports FIFOs from 8 to 256 bytes, but apart from the
>> MODE_CFG.{RX, TX}_RDY_LVL fields that configure the {RX, TX} FIFO
>> trigger level in the interrupt mode, there's nothing in the registers
>> that configure the FIFOs depth. Is the responsibility of the SoC that
>> integrates the IP to dictate the FIFO depth and of the SPI driver to
>> make sure it doesn't bypass the FIFO length.
>>
>> {RX, TX}_FIFO_LVL was used to pass the FIFO length information based on
>> the IP configuration in the SoC. Its value was defined so that it
>> includes the entire FIFO length. For example, if one wanted to specify a
>> 64 FIFO length (0x40), it wold configure the FIFO level to 127 (0x7f).
> 
> s/wodl/would/

oh, yes, thanks
> 
>> This is not only wrong, because it doesn't respect the IP's register
>> fields, it's also misleading. Use the full mask for the
>> SPI_STATUSn.{RX, TX}_FIFO_LVL fields. No change in functionality is
>> expected.
>>
>> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
>> ---
>>  drivers/spi/spi-s3c64xx.c | 21 +++++++++++----------
>>  1 file changed, 11 insertions(+), 10 deletions(-)
>>
>> diff --git a/drivers/spi/spi-s3c64xx.c b/drivers/spi/spi-s3c64xx.c
>> index d046810da51f..b048e81e6207 100644
>> --- a/drivers/spi/spi-s3c64xx.c
>> +++ b/drivers/spi/spi-s3c64xx.c
>> @@ -78,6 +78,8 @@
>>  #define S3C64XX_SPI_INT_RX_FIFORDY_EN          BIT(1)
>>  #define S3C64XX_SPI_INT_TX_FIFORDY_EN          BIT(0)
>>
>> +#define S3C64XX_SPI_ST_RX_FIFO_LVL             GENMASK(23, 15)
> 
> What about s3c* architectures, where RX_LVL starts with bit #13, as
> can be seen from .rx_lvl_offset values in corresponding port_configs?
> Wouldn't this change break those?

ah, wonderful catch, Sam. I break those indeed.
> 
> More generally, I don't understand why this patch is needed. Looks

I said in the commit message and subject that I'd like to use the full
FIFO level mask rather than just a partial mask. On gs101 at least, that
register field is on 9 bits, but as the code is now, we consider that
register on 7 bits. For gs101 the FIFO size is always 64 bytes, thus
indirectly the fifo_lvl_mask is always 0x7f.

Unfortunately I'll drop this patch because I don't have access to all
the SoC datasheets, thus I can't tell for sure if that register is
always 9 bits wide. s3c2443 and s3c6410, which have the rx-lvl-offset
set to 13, use just 0x7f masks. That's a pitty.
