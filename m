Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11E4A57338
	for <linux-samsung-soc@vger.kernel.org>; Tue, 23 Jan 2024 08:21:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705998111; cv=none; b=PntFsNfXlc533EpwVsrbCREAJNxAHumo2xpJIrP7G7fAoCBActw2PTlxPc3+hUaKAjRRO05KT3GE9ZGyzFIzHW1RSVwM2h5Vj0Mrm5sKvXvjvLPyFW6B0RchMrPNar8bMxCLbIr1vpil3H709wcXDTINiUPPgfGTRgyXumWrdFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705998111; c=relaxed/simple;
	bh=yLmCf3LZn4vpBl6Mi3X/E4/QwFaBbTAwx3SO0oARWpE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aOl7EHelgXqjQHOmCYzlBofqTHA8aZmpgf4wYj/QGOjpMcNn5U0j7ns8COcpIE9YUVi67DpuLtyMwu0Lw3oEp23VERcp+JCa1JUom72SFHpTApzEItEn+zWbOMiQRJea+EE5W/6x8gtrafgQoKVZCNNRuiWL8DiA3b4+lWWbMxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WtTViEB1; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WtTViEB1"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-337d5480a6aso3841888f8f.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 23 Jan 2024 00:21:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705998108; x=1706602908; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Zhs/3EXWuNywd5myI2R42csthImnPa9FJe9iZYIsfrA=;
        b=WtTViEB1j+0E5AzBwH0m5FlcIqcTIXjOtIp6GP72G8A8jf8sE8Q84736oGM6GMDM8r
         E5XhDeto7dH/z9hFl189iEeZUGZuCrr2MLllH8bmBUiAr+HZXig/3v3/K9UYqOHhhUWc
         RojB55CMh+2hwQefzwPXdayPjT4p/53UiL9mhG3hXMjvlxN6wqclMbn2kKeZQ+bPAWK1
         swGnk6ataniKii90vkyZrp5zuxRoVIkL3XO3Xeoc4F0ua7ZT/XspeamiCF+XEtBtURaM
         9wBfFR4qkvCLWE5OZiS11J5QQrO6BrgjNfITlfcAL5xPGUUjUINTGtncFEqHTnUlmmsE
         fsDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705998108; x=1706602908;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Zhs/3EXWuNywd5myI2R42csthImnPa9FJe9iZYIsfrA=;
        b=XbpDZPcMbYCqXCy42qe05APQmxpjwgYV/8d/4NpSkhvYIjwpUnvRsqANcMSobE1JbH
         ldS16PC99h6E1wmX5QcHRMrRqr8Jo9EIoZAzv6lZAo9BXMTdrgSkTskSnoM5QYOli+aE
         DuVDhT8JziCjpjNcZLL3z67Q8TZIlZOBOYsCb4snrbwSwRFPLwa8QwN3jivyo+msH7m+
         dR8MJo2xdIIVfnLj5pCP4GZD+BobbPoInNH2pnDRxmza7qLE3UhYq42ZcQ+6zBcU1hno
         Pci3G5RrlxSmIBkTH1p1xvAjmOtDeo1/nuAqzWIi6bl7/HmdZB0KC4eQ4T0zcY0ieHBh
         IKFg==
X-Gm-Message-State: AOJu0Yzp4Jn1g0zKjIBrCFqorCXqjcOA3WxwuYulrAzldWgnyZl3ZzEf
	kqYZhutyXsjAsdgeCMKUJtBL3fvDaN65sWC+aOz844DFOvwtXM6i7hteE0YQ5Xk=
X-Google-Smtp-Source: AGHT+IFMNKBfaxHkYhIDB96hpHah0NfQUDbzn+gQCywMAWzaKl5qJMw4Fbz2etGtoM+OwlUljrSozw==
X-Received: by 2002:a05:6000:18cc:b0:337:610f:56f7 with SMTP id w12-20020a05600018cc00b00337610f56f7mr3269725wrq.127.1705998108301;
        Tue, 23 Jan 2024 00:21:48 -0800 (PST)
Received: from [192.168.1.20] ([178.197.215.66])
        by smtp.gmail.com with ESMTPSA id h10-20020adff4ca000000b0033925aa222dsm8715975wrp.57.2024.01.23.00.21.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jan 2024 00:21:47 -0800 (PST)
Message-ID: <05d8a712-a527-4892-aee1-4b52c21c3d32@linaro.org>
Date: Tue, 23 Jan 2024 09:21:46 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: clock: Fix spelling mistake in
 'tesla,fsd-clock.yaml'
Content-Language: en-US
To: Varada Pavani <v.pavani@samsung.com>, mturquette@baylibre.com,
 sboyd@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, s.nawrocki@samsung.com, tomasz.figa@gmail.com
Cc: linux-samsung-soc@vger.kernel.org, alim.akhtar@samsung.com,
 aswani.reddy@samsung.com, pankaj.dubey@samsung.com
References: <CGME20231219115856epcas5p371abeb4264f60309e597b90954e6d58c@epcas5p3.samsung.com>
 <20231219115834.65720-1-v.pavani@samsung.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20231219115834.65720-1-v.pavani@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 19/12/2023 12:58, Varada Pavani wrote:
> Fix typo 'inteernal' to 'internal' in 'Documentation/devicetree/
> bindings/clock/tesla,fsd-clock.yaml'.
> 
> Signed-off-by: Varada Pavani <v.pavani@samsung.com>
> ---
>  Documentation/devicetree/bindings/clock/tesla,fsd-clock.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied with subject fixed.

Please use subject prefixes matching the subsystem. You can get them for
example with `git log --oneline -- DIRECTORY_OR_FILE` on the directory
your patch is touching.

Best regards,
Krzysztof

