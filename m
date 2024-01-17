Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6607F21366
	for <linux-samsung-soc@vger.kernel.org>; Wed, 17 Jan 2024 14:59:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705503571; cv=none; b=lIG7Zy696cFavN5jLQ6Rp4EgP0DzOP+DC4ig/XSI+eX14sZ8CKZkNc5UT6TER1yBtcx113zAgij3Hh+6r4FX537S7MnSjOIi3G68upQgFf+lzRvGfqrRXWshhA3KC6AKhafoF1/6x4muYUKYtFQ0zVfKMV423D+t2TXsir3IIGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705503571; c=relaxed/simple;
	bh=7j81HGmM3UVZuMW1aajgnh/Tqkfv5ZlF1e2arTN11NI=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Google-Smtp-Source:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:Content-Language:
	 To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding; b=EnwXhzxHbjO9kTqymIQLGwT0ak8bllwD7fAnRQHAxN5CWL9VZMpTQYuftmlPOXCXmHQRXUSRazkt8QYRxnHB+PDZ7se1xSI5m816IcY29wPZSg3Ih7pWLtnBlm22+rJFRZV2iK9XknrnlMy11KN9a1oLtovvpZty+0CTbksG1jo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=M126Baao; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="M126Baao"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-40b5155e154so134240035e9.3
        for <linux-samsung-soc@vger.kernel.org>; Wed, 17 Jan 2024 06:59:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705503567; x=1706108367; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nmOxe8Kt63reb+K83M/fiIpc7ZoymLxbMzD4gGdoAzs=;
        b=M126Baaoif7bxWr9cLsIatT/8b81mBZd4R7H9bNooD8W27aH0LrMDecGWraXMcRqC8
         Ir2XCV3QW5PYHHEZyxbiTeHHcKTbpDjR0+sj4IAcyoWnPfqhEul5vKC2d6GpAHnQPeik
         RfVme+heJWOj5cgrC3fNaO4kOw5O9+CkeB0Mxj6UzWe53WYVKsbVgIpFK/Lw69MGhDC1
         tNDxkChPwapCvqQWBVrKshvO6rOwmxdBjbl9PrPGqABSStMEmZfwIIxmNT/swZBRRHS+
         TuM7NxiyJInuDpgPPQmdz/SB4/Bjqsa4hE+fDa+fYE3Eew0ORyFTxVBaxLpeZ0Fq1T2d
         7UdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705503567; x=1706108367;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nmOxe8Kt63reb+K83M/fiIpc7ZoymLxbMzD4gGdoAzs=;
        b=h1SMPCSD9fOI3Y8o1QJCG06aghXSqYaCOyNNuAIawKAAwcipHZgBS/QWk+9yRjibAG
         AzlFavAuPSRYVtjaSET+Hj+zVl877ESZmX425166ckzFt1lnDCW9s12dR75MSxa2zeJR
         CvHe61juEK6qdJ1/+iP/WOQSoE1c020bRXwBQ/dPblnc/lyEvUmYLLBNDGSJQVdITIYW
         +Vc5uuUA51U8vAWKPuoa7HlEKhyuXtRfkaTPINaZkWHFj5UCx5+9zO4VDd/W92RiPdWD
         71jt97Wg6ks5ey1b/RVnPdoGiEP1DmVSVOw218708e1zmkpVzfSAgJ8RjorD2FXPEIDN
         LeTg==
X-Gm-Message-State: AOJu0YzfH2V9wtHGZUTsHJSzouVOnm04Ns9DKgjLZSpLu9r+tXIHkDlg
	7oLRBVpsUnpy1KZIljyAgPuNigmL4ccTcA==
X-Google-Smtp-Source: AGHT+IGy6qHkEPrF3Ir1FNIzi8E8U7HINl3OXeiajhONjDtBYPNIZN6SHJlqkSjxbgHRxUhaMtMqfg==
X-Received: by 2002:a05:600c:84ca:b0:40e:4e54:3e46 with SMTP id er10-20020a05600c84ca00b0040e4e543e46mr4715735wmb.91.1705503567601;
        Wed, 17 Jan 2024 06:59:27 -0800 (PST)
Received: from [192.168.2.107] ([79.115.63.202])
        by smtp.gmail.com with ESMTPSA id bm19-20020a170906c05300b00a2362c5e3dbsm7856439ejb.151.2024.01.17.06.59.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jan 2024 06:59:27 -0800 (PST)
Message-ID: <59a2e142-e970-4792-9233-7c447ac391b2@linaro.org>
Date: Wed, 17 Jan 2024 14:59:24 +0000
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 08/12] arm64: dts: exynos: gs101: remove reg-io-width
 from serial
Content-Language: en-US
To: Sam Protsenko <semen.protsenko@linaro.org>
Cc: peter.griffin@linaro.org, krzysztof.kozlowski+dt@linaro.org,
 gregkh@linuxfoundation.org, mturquette@baylibre.com, sboyd@kernel.org,
 robh+dt@kernel.org, conor+dt@kernel.org, andi.shyti@kernel.org,
 alim.akhtar@samsung.com, jirislaby@kernel.org, s.nawrocki@samsung.com,
 tomasz.figa@gmail.com, cw00.choi@samsung.com,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-serial@vger.kernel.org, andre.draszik@linaro.org,
 kernel-team@android.com, willmcvicker@google.com
References: <20240109125814.3691033-1-tudor.ambarus@linaro.org>
 <20240109125814.3691033-9-tudor.ambarus@linaro.org>
 <CAPLW+4mUMx9RvFiS0L2U+_Fd_PzcHhmNbyR4cmUrYF3BVgb=Cw@mail.gmail.com>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <CAPLW+4mUMx9RvFiS0L2U+_Fd_PzcHhmNbyR4cmUrYF3BVgb=Cw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 1/16/24 17:57, Sam Protsenko wrote:
> On Tue, Jan 9, 2024 at 7:00 AM Tudor Ambarus <tudor.ambarus@linaro.org> wrote:
>> Remove the reg-io-width property in order to comply with the bindings.
>>
>> The entire bus (PERIC) on which the GS101 serial resides only allows
>> 32-bit register accesses. The reg-io-width dt property is disallowed
>> for the "google,gs101-uart" compatible and instead the iotype is
>> inferred from the compatible.
>>
>> Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
>> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
>> ---
> Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>
> 
> Just out of curiosity (I probably missed the relevant discussion
> earlier): what is the actual reason for moving 'reg-io-width' to the
> driver's code as 'iotype'? I mean, what is the actual problem that's

The majority (if not all?) of the hardware blocks in GS101 SoC require
32 bit register access widths. Instead of specifying reg-io-width = 4
everywhere in the device tree, we infer it from the compatibles.

The relevant discussion is here:
https://lore.kernel.org/linux-arm-kernel/db368449-f446-47e8-81b6-a11c2a872306@linaro.org/

Cheers,
ta

> being solved by this -- is it to make the earlycon functional for
> gs101? I'm asking because the bus width looks like a part of HW
> description, which usually belongs to dts, from the design point of
> view. Anyways, that's not a concern, just trying to understand the
> decision.
