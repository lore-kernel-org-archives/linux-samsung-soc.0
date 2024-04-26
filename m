Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3AD2144309
	for <linux-samsung-soc@vger.kernel.org>; Fri, 26 Apr 2024 10:56:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714129011; cv=none; b=ZMR1sT/aWi2/1DCQZQrT7aut0H2FJ1XsnyWuqCWgGSYNAPiu7PMUZyRhV5hxRPehYWUu1XHEQXHXKoIcGihSpOP58XY5YpskqQ91O935TKEdB5QOcCoi5m4EQAmxX1cJAxVSXzHsH+l5tZqy/PxwqYdgwPTsUVVqPoqwlHzh0jA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714129011; c=relaxed/simple;
	bh=udxVw+++iagTZz2k70xeWORhBBMM1NSdmmV1VIlzjVE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PgkzT3uJcQh8wCt1fVP+cDI8JyUAE/wu6WnjZ10lLEosajUaOmwQE6EiBnwQy+CTdDkD/hgCIFt3O096Jr9CvIHd26AueJ/zYgMQizVO5yBBdLb5fS1MwJDY5ztEJSrCPP5nU2t7wKTtZbSfWMAOLdQGIwA5TvZQc+V7DRmcvAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=v6r/LC9f; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="v6r/LC9f"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-41a0979b9aeso13302055e9.3
        for <linux-samsung-soc@vger.kernel.org>; Fri, 26 Apr 2024 03:56:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714129007; x=1714733807; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aoFcIxQR0t8oCPEZALjo58lCFFW8rW/ix4KBRT7bHB4=;
        b=v6r/LC9fsLJejint+tmI8ixVtC9J04TR25xcGgsSboGkocJh2fvRXvqzWVBr83x/va
         tSmAL+QrEOMOYYAUwzpVPDpgYgnKPDa72yElAlzfpRAHphTySHpuhDErwhrOZ4IvFb6A
         DsQQ9WC+ur1kk9Kx8xoOeIGPjUSzqrB/GjtxgRC+OrtUslX6ak8wHIbCMtpJFIoWrhN+
         oJyYmzyVWafENaLgz3ED56eJTSlWMwa+Ok2yVv9a1qVq5v+gz8R8Mrp6MObi222jLNpx
         tWUPwaZbeZT4xB6vPFuH2RkOuDgSnqampKlnar5FNwz4nTRLHg8YNfK21u5zCQoAWNfT
         F8sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714129007; x=1714733807;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aoFcIxQR0t8oCPEZALjo58lCFFW8rW/ix4KBRT7bHB4=;
        b=ElhjpDUr8rWPyNbt7XHDaHth2K/goRv/ntTF4Wj58ANEZkB5aI5qDr9WH3VtK8fNvt
         RY4yUDsDP4f3Fy8iPI0BrIC85y2EuaJCvHy2sgtpopDHG+TTFL/E2KV6aqTV57AR5n2i
         RgAhk+hNXd/mYYGlmbOOZcdtrrileMuS+IpLUlqyFovz9Gt4ZPb8NpoGr8XceVl9WVa5
         f1MZDuAZQ3LO/iJn1MyZdFSyFY+3rmD7mllrmnahpauFJYqeYFDbk0ZpTiIzGTb0aWAo
         /ptKoyHnVNFrV3lKTgOmoC3noVqXULVcG/wDIW90oRsdFwrfIZEAbYq16pgiihIIlDU6
         JyIw==
X-Forwarded-Encrypted: i=1; AJvYcCUL+HBEubKoebyP6gniFBbeHcZUnS5OnpdY9SQR0Z9XgOpNOaAiOtSXemX7tYmhd3bULzPzQ8T5Z5lUKxuI202535Borngvomx+iEuM2zioYQk=
X-Gm-Message-State: AOJu0YxH6kjKog413FWllCV9kGwOkOK5BeI3MtSUKMaNZXR+sPBYUczD
	zK5aelxWs3T626h3S1R5BzWU3oN2gCusamaorpZYuGDsEhRFBQ+TLD9jNr0D5vo=
X-Google-Smtp-Source: AGHT+IFH1L79332kHOc1PS5JXFd6A4jTTtznIl2/7hWiWbCz0rliE+qlQeT9xmpERZC+fKb3uldVYw==
X-Received: by 2002:a05:600c:470a:b0:41b:8b3b:7a3e with SMTP id v10-20020a05600c470a00b0041b8b3b7a3emr1669796wmo.22.1714129007204;
        Fri, 26 Apr 2024 03:56:47 -0700 (PDT)
Received: from [192.168.2.107] ([79.115.63.100])
        by smtp.gmail.com with ESMTPSA id hg16-20020a05600c539000b0041aa8ad46d6sm13030298wmb.16.2024.04.26.03.56.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Apr 2024 03:56:46 -0700 (PDT)
Message-ID: <e36591a1-8e6c-4fb1-a2c7-d8b161d5fbe9@linaro.org>
Date: Fri, 26 Apr 2024 11:56:44 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/5] arm64: dts: exynos: gs101: enable cmu-hsi2 clock
 controller
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 Peter Griffin <peter.griffin@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>
Cc: Will McVicker <willmcvicker@google.com>, kernel-team@android.com,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240426-hsi0-gs101-v2-0-2157da8b63e3@linaro.org>
 <20240426-hsi0-gs101-v2-3-2157da8b63e3@linaro.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20240426-hsi0-gs101-v2-3-2157da8b63e3@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 4/26/24 11:03, André Draszik wrote:
> From: Peter Griffin <peter.griffin@linaro.org>
> 
> Enable the cmu_hsi2 clock management unit. It feeds some of
> the high speed interfaces such as PCIe and UFS.
> 
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> Reviewed-by: André Draszik <andre.draszik@linaro.org>
> Signed-off-by: André Draszik <andre.draszik@linaro.org>

handling the patch already implies that you reviewed the patch. I'd drop
your R-b tag, but maybe just a matter of preference.

Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> ---
>  arch/arm64/boot/dts/exynos/google/gs101.dtsi | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
