Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91E85236445
	for <linux-samsung-soc@vger.kernel.org>; Mon, 17 Mar 2025 10:23:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742206998; cv=none; b=G77dlekpaoLPksCP34D/dokoDb4OEA80uXQB/z1yo4lkHGsZ5qLFPgqLmql/O4dFlrdmcGHP7J1auPNKs22Y2gd2S8ce4fxv89b18SCf7Z8ldf5O8rB/O4JJI2soVYsaaN05ThXTIHVmlYnfZHCtdCCRNmzmmXNw7IryDX23HBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742206998; c=relaxed/simple;
	bh=iGSQ6NXu+6+ukEkaDKOdZLmmLzGAHGQQcsI1Moc2sHw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BGVSXCQ9fN/RcVpSuYhD6HjOD3l+0OLSM+YaVezyBumOQJvTTStZTrT3jrUCg3gigSR1bIWX95hNS9SFdhpQdOggmG7b42izd16eg3nRi9bSxM2/3uqt4nRlhcadCRJ/eIGid0a037lIS4E5t1CbytxcMJLpUiRoGYKawM6hmoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tjtclElq; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tjtclElq"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-ac2ab99e16eso285177966b.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 17 Mar 2025 03:23:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742206994; x=1742811794; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Qdm1qAxomHTlqJ31Ysp8XFGoFz7wUaS6yogMNzcGP94=;
        b=tjtclElqRrQiP9G4KkD2nG6CA74QShWZsqLGfAlVe0BB+pcBT+NQ0IfgpZi9XDlHfg
         lbzOWqn8sWFJSmIm2PR4B3F2If3eQi65O+1QVkC8ZhHWP0erjV8UXoukiwpOy9gdzjhv
         BGl+2DIFlCOhyI4rvN2/0RPTd7Z46ZQt+ycU/o6JZjCGuY4DsFu/iZDBbHk2e4oBJ3kC
         RhIuECCtKYxB1lBR0VBlzHHuFABQsgr3TPXUYf2lDZue4IkFY2uYC8OdVuguJ3ZQMQy9
         KWTOLusyletSAIy6DtWcphddzFSGh+c9167lg/660o2eFVVxAZ1+7F6TCcuk1et2a0Xp
         H3VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742206994; x=1742811794;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Qdm1qAxomHTlqJ31Ysp8XFGoFz7wUaS6yogMNzcGP94=;
        b=wdzPbKsyKej+BRLS2JZh5j6nOQvGceMmYGS/52Nw0R31sVSb8V7jdexknHApKB8oq2
         cXn9q5ESNzhjC4MIqV4/jDOjFVkbXBTG4YimdSZkGKHV7JpumYkEZt0ZJXyCOEFDlEDR
         sTJDOK/GkJIab2zejA2ik3KpWH8cBi0Pzj8xr79YXEFHg8qZuUiq2AIqGkowWtlS0MQJ
         V9kTpWoV3xl0E8kSVhLIu21D1h/b0Rl0eGkduxawVtb7WvikYclVR4eDtu1godBRVT6/
         UZKpzQRs9gUP+3iqPS+T4F0BERSJbwCRkh+bsrBI86iYjvy09TLdNma+b2kZnqb2jWVA
         B6+Q==
X-Forwarded-Encrypted: i=1; AJvYcCV4PUrUs2BQOK85eiTPSpwFROOh2sRJ1OHzygk26uLfSfafjkHOPPcb/hVlKIBZjjU3LkJF0ppgv/+0ylzfsuLKEw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1nTQVi5DdXgcDctQctT0MedPi96aDLRhpL44TUw3pQuS6hUy3
	NN/m1hEbHBndPJjKRWiJId7jdz5xSweIc9FGhPrIZg6GodBPKiOz3ody+lsUILk=
X-Gm-Gg: ASbGncuQdAYvTR1c87D/lfdd1JhiBoGsnjMTNpFBpyUkTXdgy/6ei5+nymg1jyC4QM7
	AZzN9wOjFR8ei/D8d+4eKeKJwQZvoE+A7Y6qHM/zvuEu8RTKZhkLZZYSb0B7nK6zo8GVtvyPr+E
	G8ym0JSNqRNeES8sx3mGc6Wcjt5t1NW9Mr8NHIco/IqqIXIRsTjmFWstnEC7hVQDlKkVnFlzx01
	W1+/I08y8HP9QSG+HmpX51fQZNip6KckPOjyRgAtDS6gQ5SHUl6jIgXk98TiGw7BmnxOzx/Jgoc
	kdrf16gYARHKDh0TlQq2+OmFE14TN9w5IoEVJPh540GQxkHNGxeIke1j+52e9Tz9+uQz0zpnLTc
	cn6KeoOjumjTpFtEnRkA=
X-Google-Smtp-Source: AGHT+IHCBMDjgNT3Tdkp1GpOCjRuCJSOXbxDi3KNnxO9K77oOjx1sb8tnp36htT883NnLPExiPbV3A==
X-Received: by 2002:a17:907:6ea9:b0:abf:52e1:2615 with SMTP id a640c23a62f3a-ac3301db85emr1309545066b.7.1742206993695;
        Mon, 17 Mar 2025 03:23:13 -0700 (PDT)
Received: from ?IPV6:2a02:2f04:900a:ff00:eb98:2c37:6a77:39? ([2a02:2f04:900a:ff00:eb98:2c37:6a77:39])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac314a497bbsm647663666b.148.2025.03.17.03.23.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Mar 2025 03:23:12 -0700 (PDT)
Message-ID: <5918c64f-856b-4820-b35b-538ffdd9ac6a@linaro.org>
Date: Mon, 17 Mar 2025 10:23:11 +0000
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] firmware: exynos-acpm: fix reading longer results
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Peter Griffin <peter.griffin@linaro.org>,
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com,
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20250314-acpm-fixes-v1-0-ab03ca8e723f@linaro.org>
 <20250314-acpm-fixes-v1-1-ab03ca8e723f@linaro.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20250314-acpm-fixes-v1-1-ab03ca8e723f@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 3/14/25 4:40 PM, André Draszik wrote:
> ACPM commands that return more than 8 bytes currently don't work
> correctly, as this driver ignores any such returned bytes.
> 
> This is evident in at least acpm_pmic_bulk_read(), where up to 8
> registers can be read back and those 8 register values are placed
> starting at &xfer->rxd[8].
> 
> The reason is that xfter->rxlen is initialized with the size of a
> pointer (8 bytes), rather than the size of the byte array that pointer
> points to (16 bytes)
> 
> Update the code such that we set the number of bytes expected to be the
> size of the rx buffer.
> 
> Note1: While different commands have different lengths rx buffers, we
> have to specify the same length for all rx buffers since acpm_get_rx()
> assumes they're all the same length.
> 
> Note2: The different commands also have different lengths tx buffers,
> but before switching the code to use the minimum possible length, some
> more testing would have to be done to ensure this works correctly in
> all situations. It seems wiser to just apply this fix here without
> additional logic changes for now.
> 
> Fixes: a88927b534ba ("firmware: add Exynos ACPM protocol driver")
> Signed-off-by: André Draszik <andre.draszik@linaro.org>

Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>
