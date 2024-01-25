Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B126136678
	for <linux-samsung-soc@vger.kernel.org>; Thu, 25 Jan 2024 18:44:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706208255; cv=none; b=jzuIo9cmCbOFu4ZHkoTKjyhoXJ52BA64Wd01Xj+buGb2VJwcuEAHJqPU8Yg3SJhTYNXMT7emx3yIpITauZ6gMyKE5VQpoRD5/yMB0pS9nWz4fy0ucysZUFSPqJXQl9pZafUhve14flUO1HAqQ1OXdedArTvHGUYYA5l9Iawtm7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706208255; c=relaxed/simple;
	bh=awSLOrEXP9rFT2y8LOhZ/9MdiMBuYZIY+MSqb9WthkE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RLL+3SUrSlNX6mnt5hhh78rG911QsLlt//Os49N+IdIM/xiq9NtV4cscBCmtFCy0186JmIUskJb6b+eqnqD31DK3PcixixaROUc1YXp+PBdb0YaEGDbi3LPb5/aOOLBwXkvhHHsBWy7q6lXr20m9b03UlI2f9wCqFVEDp2wDcJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=l1olWlRk; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="l1olWlRk"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-40eb2f392f0so40781525e9.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 25 Jan 2024 10:44:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706208251; x=1706813051; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UrYJdLBwLw70S4ObciiJY9LJFq5pZvqC5Of2nJ/JVJM=;
        b=l1olWlRk4TjO8OAIsZZryqaOk/GF9PstHdjIOXjr+HkBDWxypi/BYkIypXPBcWxDiy
         cLhcvAunUVILJSecCliRaPKAzA/E7Vq82JX8UIHyHvHe4gZQ0+Y3NQOo4RBUMiFfVt0U
         oWzz5EGlZBN/QnuXdxEuz1HF0LHovGxS17EwYfPdAkydnDk7bCG8DSH6njZZbpbqMmwl
         AMGFsHRaWC8cOgJkzLguVKS9lpKS27X8RUHJKzbY7uNTPcAHo8d65dlcNEJm7Hfqoz1M
         iSPp3NSv6XEr8Ot9yLDs6rKSYfuuZoXJTD/voGPF81fhd626RaJjFeOx0y2VmyvcVCgE
         WK6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706208251; x=1706813051;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UrYJdLBwLw70S4ObciiJY9LJFq5pZvqC5Of2nJ/JVJM=;
        b=h/IHJJ87wwGksa4E3I8mKvOvg0hzua+wysRVj9nYNizztHJzxJrangrLmQneMrNXS8
         7wNkXlbR/481KAOTNs5EwY06OyHlHbpo8b3hSt1uFR5uYsiTv90yqva5WHVwJjQG8d2P
         mwe8KpDomBEP9ZlxCfFfTgGtfLp99kazDnVbgGesyTkEE1TvcJHXO/wCA5o4dowpAgv2
         FrTE9p1mKfcikqyz3GzImN6hofrY+Soy6KBTiZtW0zdf4YrU0pM0eVPFlK+LvOhFwmD4
         YWobYQ0frLYvTJD6EBXuYpcMkZA4GVk+3gXingwmlwhCJRIblzj6dqe90i0dnV0B1nXO
         qeXw==
X-Gm-Message-State: AOJu0YzhNEjm/thlt4oizrTDRYTE/tYmyORDVgwsrVIS5YKYfyuaAmGU
	qMqOkay3Uesbnx55WjqvWGh8iTq3Ye/0LKzvWmrn0EA8PsCe2pP0LGpIMg7cLaY=
X-Google-Smtp-Source: AGHT+IE+cIhZxK3kunbbIhBn/MOUJGzmsMnmINwXcGYl+d9le2UEsWFf+v6SdKU9oWvk60jPYq4SJg==
X-Received: by 2002:a05:600c:365a:b0:40e:b174:8b0b with SMTP id y26-20020a05600c365a00b0040eb1748b0bmr120888wmq.40.1706208251067;
        Thu, 25 Jan 2024 10:44:11 -0800 (PST)
Received: from [192.168.2.107] ([79.115.63.202])
        by smtp.gmail.com with ESMTPSA id k10-20020a05600c1c8a00b0040e451fd602sm3426678wms.33.2024.01.25.10.44.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Jan 2024 10:44:10 -0800 (PST)
Message-ID: <40ba9481-4aea-4a72-87bd-c2db319be069@linaro.org>
Date: Thu, 25 Jan 2024 18:44:08 +0000
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 21/28] spi: s3c64xx: infer fifosize from the compatible
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>
Cc: andi.shyti@kernel.org, arnd@arndb.de, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 alim.akhtar@samsung.com, linux-spi@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-arch@vger.kernel.org, andre.draszik@linaro.org,
 peter.griffin@linaro.org, semen.protsenko@linaro.org,
 kernel-team@android.com, willmcvicker@google.com
References: <20240125145007.748295-1-tudor.ambarus@linaro.org>
 <20240125145007.748295-22-tudor.ambarus@linaro.org>
 <2086b88e-45fc-4224-b00f-0840d446d042@sirena.org.uk>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <2086b88e-45fc-4224-b00f-0840d446d042@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 1/25/24 17:18, Mark Brown wrote:
> On Thu, Jan 25, 2024 at 02:49:59PM +0000, Tudor Ambarus wrote:
> 
>> Infer the FIFO size from the compatible, where all the instances of the
>> SPI IP have the same FIFO size. This way we no longer depend on the SPI
>> alias from the device tree to select the FIFO size, thus we remove the
>> dependency of the driver on the SPI alias.
> 
>>  static const struct s3c64xx_spi_port_config s3c2443_spi_port_config = {
>> -	.fifo_lvl_mask	= { 0x7f },
>> +	.fifosize	= 64,
>>  	.rx_lvl_offset	= 13,
>>  	.tx_st_done	= 21,
>>  	.clk_div	= 2,
> 
> I'm having real trouble associating the changelog with the change here.
> This appears to be changing from specifying the mask for the FIFO level
> register to specifying the size of the FIFO and unrelated to anything to
> do with looking things up from the compatible?

Let me try to explain everything.

In the driver there is a weird dependency between the SPI of_alias ID,
s3c64xx_spi_port_config.fifo_lvl_mask and the IP's FIFO depth.

s3c64xx_spi_port_config.fifo_lvl_mask is not a 1:1 match with the
SPI_STATUSn.{RX, TX}_FIFO_LVL register field. Those fields are defined
in the datasheet as:
+#define S3C64XX_SPI_ST_RX_FIFO_LVL		GENMASK(23, 15)
+#define S3C64XX_SPI_ST_TX_FIFO_LVL		GENMASK(14, 6)

Thus the register mask is on 9 bits, but the driver used either 0x1ff or
0x7f, which was not reflecting the real register mask. Patch 10/28
updates the driver to use the full register mask regardless of the FIFO
depth configuration.

Another problem with s3c64xx_spi_port_config.fifo_lvl_mask is that it
was used as a way to determine the FIFO depth. The SPI of_alias ID was
used as an index in this array to determine the FIFO depth with
something like
	fifo_depth = (fifo_lvl_mask[alias_id] >> 1) + 1
For example, if one wanted to specify a 64 FIFO length (0x40), it would
have configured the FIFO level to 127 (0x7f).

The patch set breaks this weird dependencies. Obviously the FIFO depth
must be tightly tied by the compatible and not by an alias. I tied the
FIFO depth to the compatible in 2 ways:
1/ For SoCs that have all the SPI nodes with the same FIFO depth, I
chose to deduce the FIFO depth from the compatible. Instead of
specifying "samsung,spi-fifosize" for all the gs101 SPI nodes in the
device tree, I chose to infer it from the compatible. I know for sure
that all the gs101 SPI nodes have 64 bytes FIFO depths, thus don't
pollute the device tree with superfluous info. (patches 20/28 and 21/28)
2/ For SoCs that have instances of the SPI IP with different FIFO
depths, specify the node's FIFO depth via the "samsung,spi-fifosize" dt
property. (patch 23/28)

Hope this helps. Please tell if you want me to elaborate on something.
