Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 333A3207A2B
	for <linux-samsung-soc@vger.kernel.org>; Thu, 13 Feb 2025 07:05:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739430329; cv=none; b=RX2IVeiRdknkNtEQRJEs+gL0zeAcDAjo09NFm423M9ppAAEPNIIOtlRotuBd0Wnx5+lrM19zNXQ4YxbBxnR4X8KeL3pHxOVFNrBIY5LGFJpQFW5p1q1Bem/X2rll/jMwWs58VCPO3dd51hXns8u2BwNc7MkgZ1TvC24asHz0xeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739430329; c=relaxed/simple;
	bh=QET72BwZuEgfgng3GFWuJsSpAa0rMxkNifDEi7QIWKM=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=lyD+Ej3gZ8PkV/1pjr3SsjZsvoSAgIYYuQ7quIsKyfLdwx5Qxax1RIl/VuwwSeH5Bx1fHMU/Y6tGrsVvf/kQDZlT5FJHpaP/CXxAaWXigrArBpUKXkx0te024fH0RFgojE9WQ5LxlAsgn4SZpxrgZY/v5sWz1Ym7T8Kq9qGstEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=T2EmhXxp; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="T2EmhXxp"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-ab7cc0c1a37so104183366b.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 12 Feb 2025 23:05:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739430325; x=1740035125; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KXZVhKJ2K7k3WzqdZVJwEQ+tPoZ58G31W+/pRY1rx9E=;
        b=T2EmhXxpoAAKfj3W6Vn+l2Z2CbXmlA+e0sBJGxHkRa5iQxixCrlPLZuNitxmJOpvVp
         dAwvd7WCOZ60w3hRC1HdmD8ptUuBjkPTDkdSoLnltuxuqeMTSR+x4EFtEhfNCKsLxS1q
         R8mOSaFYui/ndm2cfELc6PJbZyqIwlv/1sJt7e5TZ36SFLjb1BlQnwe/NKY0hQW/X4OZ
         hxiqxHLINuMXX4Txc9da2IqCFNRW5fdRA3dq5S30bIMx6XgwIpgqWSc4dxq/z3Na121K
         ieJmrvWr1iWQaLc4jf70Fz2GJB+JSMOSQwmMkExjkyVk4pxGqTvExlZJEhfv+/fQ9q0r
         p/jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739430325; x=1740035125;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KXZVhKJ2K7k3WzqdZVJwEQ+tPoZ58G31W+/pRY1rx9E=;
        b=hI6bRgVA4XzD1aH9wGFT/lVg4cy0aQjh5MLjGV5+EInWXD8ngFgWSV8Afzq+UG9n7a
         MzqXHdB/BNPgqqUxFvlqElbNBBCsqw6usEjEIKV57FVLrW7B3PjAdUVWbFHsRZCgRBAs
         YNUsODf7R4Q8X4dObxeJV+JO4lwVTh6nMiKR67w924Fb5FjhjVI1K0PQ6nDEf7SKDBIq
         3OfKeM8XyOlctT7BR/94fjxGGFgo3Ts3oaM22dg/3AuEU/2eEfETUzJiMPRbWCCLgTqK
         mKGQn59THaZbC02olZEW8VAHoGJd2qS1Xr6QEGuu5bgJQl432XgA+xx+rfclXC9EUIDn
         Mx6A==
X-Forwarded-Encrypted: i=1; AJvYcCVQ+JD9faX8pDj2QK+CELncpkJWTsWFOET3jQsTIlVBagzHYt5Ru84yBY4Vjl/tQIBOs+juyaFZw9QhFg3DPDPDlg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyIyWcx3/r5RVJu6J5TnUeY+JW5BCSKrmXO1TnY3pHG1r0025q9
	/l+d2KBO9n6AqLiAH6wPs8INYU2qtBsX84y8Gid+x8M/8ZTlV+/d/KOg7g6QyQk=
X-Gm-Gg: ASbGncsCX5ntoLtAgT+SLIMiso0yVuJx6ehm2mOT+dsMJ2S2gO1l+aB5cMIKtayRKNp
	HDPQKmJylvVolNDL/fmBN4ETv9FdBEsazPpbGQ0eyxM99c4T9aSAdexZrpK0kyB2wxo1LqWzWr3
	e9D0kSzTf0W3M1ujl153BEkj8AlwBKtm0b1+wcoQKx96XyBQZjWD1oFz6mdN5k1Q6mPuzJwo5Pc
	3GIJ4q9wIOCqDq7+X72Ey1b42GTbu2dChqM//MGGVVvrHnKwUxnaSu2GhSYmDtCKdUGZMDSBV8v
	oGQd5t4VGnY519m0z4YimRlC
X-Google-Smtp-Source: AGHT+IHMrmKjXCi72IpIaaGCXzDCq4ibYmkuB+z09aLzRAGtSKSlts+BhuC/X0899B2uE4MTHf5wAQ==
X-Received: by 2002:a17:907:1909:b0:ab3:84ac:4dbc with SMTP id a640c23a62f3a-ab7f31a3665mr647610966b.0.1739430325446;
        Wed, 12 Feb 2025 23:05:25 -0800 (PST)
Received: from [192.168.0.14] ([79.115.63.124])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aba5339dcf3sm68465366b.156.2025.02.12.23.05.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Feb 2025 23:05:25 -0800 (PST)
Message-ID: <bad7b5b6-c61b-4e93-9415-6476976c8e81@linaro.org>
Date: Thu, 13 Feb 2025 07:05:22 +0000
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 0/2] spi: s3c64xx: add support for
 samsung,exynos990-spi
To: Denzeel Oliva <wachiturroxd150@gmail.com>, andi.shyti@kernel.org,
 broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, alim.akhtar@samsung.com, peter.griffin@linaro.org,
 andre.draszik@linaro.org, linux-spi@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20250212191241.280-1-wachiturroxd150@gmail.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20250212191241.280-1-wachiturroxd150@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi!

On 2/12/25 7:12 PM, Denzeel Oliva wrote:
> The Exynos990 SPI controller shares similarities with
> the GS101 (Google Tensor) SPI implementation,
> but introduces specific hardware requirements such as
> 32-bit register access and variable FIFO depths depending on

gs101 mandates 32-bit accesses too.

> the SPI node where it will have to be specified in DT (Device Tree).

gs101 has some USI nodes that can work only in uart mode and indeed the
fifosize there is 256. Does downstream define SPI nodes with 256 bytes
FIFOs? Can you please point me the the downstream code?

Cheers,
ta

> 
> Denzeel Oliva (2):
>   spi: dt-bindings: samsung: add samsung,exynos990-spi compatible
>   spi: s3c64xx: add support exynos990-spi to new port config data
> 
>  .../devicetree/bindings/spi/samsung,spi.yaml    |  1 +
>  drivers/spi/spi-s3c64xx.c                       | 17 +++++++++++++++++
>  2 files changed, 18 insertions(+)
> 

