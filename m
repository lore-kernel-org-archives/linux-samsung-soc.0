Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 059123612F0
	for <linux-samsung-soc@vger.kernel.org>; Thu,  7 May 2026 08:33:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778142788; cv=none; b=IhWBGflhs29T3D8R12Og1JHMZG2Ll8GAG9l7BJc7TbTsdDjIgR2uhaEiRBsl23jU68eyXsv0xTnTjX47iMloGVGis/1IcJS5fuEccq1TwCq95NARvr9r7L2Q/79QI5zpKz3YMSkGuDFGgeWEwcZnYrsEV0bwf7b2058vGRZ/i2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778142788; c=relaxed/simple;
	bh=qcvqULrg1L127w3Mirj0n3N+6vWZ6Q9bK1d+khDDJxo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dP3z+t+KBOv+l5TMBv8geaMhBy+ZXqyWZUY25PwV75XDgSVmrxu7ejyfHnyICXa8bQ1HR0SHL/y+OXAua+CCFYHlfSU9ICF38CqC+FKs4kvapq91eb0PtbWcYkNVcadYxIp2+AcpfMsq6hPTXNxUJJSdquM4zLFnHDGESRDEr2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RFlRHiz0; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RFlRHiz0"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-488ba840146so4693885e9.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 07 May 2026 01:33:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778142782; x=1778747582; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=86qRkTYkeTPGUaExOcKsMIcF7KjnGIGTELhJaNsShJE=;
        b=RFlRHiz0xIR8BEf/KDhg3GsLONezsF92ljL6JIYuU1LCLE9jgDZ6niEgbIdEYIlUrf
         KM2UhAzE3ajNssSxlm9YE5wg6D8lpMFRGZ0EuNU4TuylA2u3FcWdn1WvjhTinIwdM5KM
         Yxl6oBagrgsIRlRgsNaKr3p6ytGyBFPxmBZs/iTk7sLHi4GKy/vPelNJ1hx+R54THio7
         OaaF6fHWoKjVOQrPlSSgN7lZ3nQcE95HHe40tSZ9/XjEnPbwg6WnW09vGJFr+q5nULuh
         Cmy81hpSiKiDdyqFCbcnMwMrbS23V237yfBWmtPOO7xdSA4v6qOoWvgwUUQllMjcD+SN
         gYNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778142782; x=1778747582;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=86qRkTYkeTPGUaExOcKsMIcF7KjnGIGTELhJaNsShJE=;
        b=aQ8ufhNWkfrh8iXZ1jIZU6xLWTnaWiNUKJzPj9Ha7EdVVl4t63WnXk7vgUlCoyxUy3
         VfEmmbaiqiY7MSn1wIRI1Ui9m/rBv2XeH+U5TgMnf+7u+gDZxUzLXyhv9WXPm3jb1Jnd
         1gv+gb23OAqNvd6HiQtYa1QJsJ+XKHOr8jA2QGWgu4mVff+UiFpPRO7DhkCypdxG1+Xj
         BdiodBg260+VhblukGSVBriUOfG4u0V89qKu2XNLS9FQ72p1tzSUHes1VRmLyTppjKum
         h14aoVwLockZn2gZEE8m4JJBgoN7KNgDhSUnBdEnWOK8QiS1g6hZ6aAUzmD4slSZWU98
         6XNg==
X-Forwarded-Encrypted: i=1; AFNElJ9iSXITbv41absOSJLWCboVooMiKI2Obunwr478DRt5f1AiWyc8Af9yh7CEmT559Xq+BAVJvEqMBbxw7/olo8WFlA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7N1EftDzw8HqhxsPvz6XOZ+KngZEk/ZwjAcpjje6iYaXE0Ykj
	0Hqr/5eC71C57wTyAam47D62FNfIdlv+Ye1vzIeMSVKaKLce+ZY2iGuZDGWI4irIcbg=
X-Gm-Gg: AeBDievrpu3+PWna7tDR6S0cUPOZsG1mHg8W02qgCEfzO4GAvcL5aCNJaqowOh8KFwC
	6/OSqSVbo9bg5Me4r0u5Mnc5TpAvfurmQxBtEdSyNelwBeAtngHzJY7b+meHbQzcKluy4lR6B8i
	Wgr246oHzr2wEklo58y6frU7ONfDqhI9FvZmcBOKwTCvddiiJCQ7VbOMT5ZJV3Gian2oxF/l/ht
	9t+Wl4SmSHRBErIM5hIKpJ/cdR9MIlhLGJSfMzRUoEFdPmfn9XQ1N5VBrmEa69THBdmcWohXk6Y
	wYaBvsE8+tzshcfPDM8+2fZJoJcxb7YYqmRDnh5QRoHh5v3hsM3BLMeoJunxvfduDveg/pc0j0w
	Gj3lULxtzSR4Ta2qWTEuxjtILWtjMJr+jIjaqqAZIrQMOYsu/6ZraKhg/k6JRcY9DCY00W7P+ia
	4889QrdTs67SfRfQsdarlf/QOxTrfuLkgf5JVAZK8slyuWBmWZbHm1ug==
X-Received: by 2002:a05:600c:a317:b0:488:a977:8d6 with SMTP id 5b1f17b1804b1-48e52bd4f32mr82461455e9.19.1778142781642;
        Thu, 07 May 2026 01:33:01 -0700 (PDT)
Received: from [10.11.12.108] ([79.115.63.228])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e5390f854sm104780755e9.14.2026.05.07.01.32.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 May 2026 01:33:01 -0700 (PDT)
Message-ID: <4c57b107-e1eb-4eef-ad77-021d9669900d@linaro.org>
Date: Thu, 7 May 2026 11:32:53 +0300
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCHv2 0/3] clk: samsung: use kzalloc_flex
To: Rosen Penev <rosenp@gmail.com>, linux-clk@vger.kernel.org
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
 Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 "open list:SAMSUNG SOC CLOCK DRIVERS" <linux-samsung-soc@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 open "list:KERNEL" HARDENING "(not" covered by other
 "areas):Keyword:b__counted_by(_le|_be)?b" <linux-hardening@vger.kernel.org>
References: <20260506233833.178357-1-rosenp@gmail.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20260506233833.178357-1-rosenp@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi!

On 5/7/26 2:38 AM, Rosen Penev wrote:
> Switch three structs to flexible array members to combine allocations.
> 

What's changed in v2?

Cheers,
ta
> Rosen Penev (3):
>   v2: fix compilation and reword descriptions
>   clk: samsung: use kzalloc_flex
>   clk: samsung: cpu: use kzalloc_flex
>   clk: samsung: pll: use kzalloc_flex
> 
>  drivers/clk/samsung/clk-cpu.c | 34 +++++++++------------
>  drivers/clk/samsung/clk-pll.c | 56 ++++++++++++++++-------------------
>  drivers/clk/samsung/clk.c     | 11 +++----
>  drivers/clk/samsung/clk.h     |  2 +-
>  4 files changed, 47 insertions(+), 56 deletions(-)
> 

