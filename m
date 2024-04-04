Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9575412880A
	for <linux-samsung-soc@vger.kernel.org>; Thu,  4 Apr 2024 13:54:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712238854; cv=none; b=iFb2YLHEPMzWNZpgZo/vKSHHOceIo1xxfcUieTsTV9E9Kll3vbr15vGHW7qN44nTjLbA1SJtEpqKJyApASIIaAxTc3t+nm33hP45u1ILuNm62fqFmQT5kCFHZNZ8X6iE++HL7vjt+xM6SDisPTMwpdgpICUz4A7rHlz90MJFPXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712238854; c=relaxed/simple;
	bh=Kd6He1kPXb23wPl80+cRyCvgEmJFAXfl7xnheHym6gM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tDVl1g3pUxopyV9aZKI7LTZ3xeNXMPhNltSBCYExoppkieEhbTvkJfaeGWMZQTyvrvSlGq4pdbWHz/jHIM9Jg5Dudb0t7+CTkMJBrnM42UxsvbgdbOjyyEIbbIdWTC1P53QJLtyZFDNzHjoJ8lOLItkFyf2eJRTX934sCnFXarM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=F+iv+GL0; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="F+iv+GL0"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-513ccc70a6dso1810151e87.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 04 Apr 2024 06:54:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712238851; x=1712843651; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=6aEpM/+fP0FvQ14sgwS/ClYeEj6K/aAC5RFKlSHgGvk=;
        b=F+iv+GL0wlR2G+JjNfosDiOpK8SupPKhxucRzOKv2xqrlVvENMr/E6Gw34ka3Lkp6c
         j0jj3iTtUEkTF9o15cp7RYCNE3GL2yfr70bibrS6RZjvFj7CX49+o0bcrml01rEOw8NV
         gU4944ay2utrwQqVmnl27jNvsAjRqFFIFkPcAVFh3ir8c4KpyCmUXN66EX/CHrdl/uLv
         A79vgUW4JlgHxYd+iHwqFf1IXSOBZgvPkzMJB6wqHRHRpChtCA0EI+dyErVEl9jWFssO
         uPAbflWs1U2UTeMSbNLvKqfLZ29VZ5NjM9uwlOD1JiW3YsXckpLkG1mk3qPbIy/j1Ibn
         hFNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712238851; x=1712843651;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6aEpM/+fP0FvQ14sgwS/ClYeEj6K/aAC5RFKlSHgGvk=;
        b=VsYlZh67uIk7RjcUh5QB/oTL/HwXQpab/f/JPt6Cy9CS05jaSbjFH8FSOBUSRMbRdv
         GhKN+Od2DOpunupmSOeszMkmNyfJS20Rsf5bYyPGd4EL5b+3nH3THwq2nByh9jwvLbWE
         Mjh5vEBaXn1pEtdDOHBmZOqR24/Nz6EVl75wCbxnsQTGODSqHR/hLBfB7lqxrq2ubcD9
         aaH3ptuzQWnPqyTbyB+NFx2PdsfNEWA1roM6tfH+cb/EWclFORhFyFtJbAFdzHAAi4zU
         V1pWoCgY+/Xpv+8yfXgAwWJf9ZbGdZSo8jd0Qf5wv6SyTCUeVnYqlJwwJ64rOqk2jTHU
         J0DA==
X-Forwarded-Encrypted: i=1; AJvYcCVgE4PgsJjNg8tH5bJU2JLafl69PNiOIDRqKyOy+aR8/xSZ03Bw9i3ISRMYyP+f21UF8EKDWRbRnSUkFk/FLGGCU/j9I/kWOxD2+A0ondp5EGc=
X-Gm-Message-State: AOJu0YyrCwjO4fpnQYvj5jm3vAGrIICUPzNKmYyEY+KN2PGliirup03I
	aovE3Eihyr705BtBnaJ7Nz0Zy35te0eFhBUFOi0sDJRigVGyHani2rdA8hNew6U=
X-Google-Smtp-Source: AGHT+IFMMuKe+6VVnutgRNuCLUoYSVcsiEt2f+eP7kf0quULoF+vbtfhgBJBr9EBjonC6c0OmVB/7w==
X-Received: by 2002:ac2:58f7:0:b0:512:e02f:9fa7 with SMTP id v23-20020ac258f7000000b00512e02f9fa7mr2213270lfo.1.1712238850664;
        Thu, 04 Apr 2024 06:54:10 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id xd2-20020a170907078200b00a4e2e16805bsm8365341ejb.11.2024.04.04.06.54.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Apr 2024 06:54:10 -0700 (PDT)
Message-ID: <f52f0634-a12c-46bd-9701-e5caf4326432@linaro.org>
Date: Thu, 4 Apr 2024 15:54:08 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/6] usb: ehci-exynos: Use devm_clk_get_enabled()
 helpers
To: Anand Moon <linux.amoon@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Alan Stern <stern@rowland.harvard.edu>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Johan Hovold <johan@kernel.org>, linux-usb@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240404071350.4242-1-linux.amoon@gmail.com>
 <20240404071350.4242-2-linux.amoon@gmail.com>
 <2024040442-subscript-detective-8d12@gregkh>
 <CANAwSgTpvrUY_H4Q4TzZWF+z-B=rGM1ny9B-pgSZ3dKCn-mXrA@mail.gmail.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <CANAwSgTpvrUY_H4Q4TzZWF+z-B=rGM1ny9B-pgSZ3dKCn-mXrA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04/04/2024 15:52, Anand Moon wrote:
> Hi Greg,
> 
> On Thu, 4 Apr 2024 at 18:30, Greg Kroah-Hartman
> <gregkh@linuxfoundation.org> wrote:
>>
>> On Thu, Apr 04, 2024 at 12:43:17PM +0530, Anand Moon wrote:
>>> The devm_clk_get_enabled() helpers:
>>>     - call devm_clk_get()
>>>     - call clk_prepare_enable() and register what is needed in order to
>>>      call clk_disable_unprepare() when needed, as a managed resource.
>>>
>>> This simplifies the code and avoids the calls to clk_disable_unprepare().
>>>
>>> While at it, use dev_err_probe consistently, and use its return value
>>> to return the error code.
>>>
>>> Signed-off-by: Anand Moon <linux.amoon@gmail.com>
>>> ---
>>> V2: drop the clk_disable_unprepare in suspend/resume functions
>>>     fix the usb_put_hcd return before the devm_clk_get_enabled
>>> ---
>>>  drivers/usb/host/ehci-exynos.c | 19 +++++--------------
>>>  1 file changed, 5 insertions(+), 14 deletions(-)
>>>
>>> diff --git a/drivers/usb/host/ehci-exynos.c b/drivers/usb/host/ehci-exynos.c
>>> index f644b131cc0b..f00bfd0b13dc 100644
>>> --- a/drivers/usb/host/ehci-exynos.c
>>> +++ b/drivers/usb/host/ehci-exynos.c
>>> @@ -159,20 +159,15 @@ static int exynos_ehci_probe(struct platform_device *pdev)
>>>
>>>       err = exynos_ehci_get_phy(&pdev->dev, exynos_ehci);
>>>       if (err)
>>> -             goto fail_clk;
>>> -
>>> -     exynos_ehci->clk = devm_clk_get(&pdev->dev, "usbhost");
>>> +             goto fail_io;
>>>
>>> +     exynos_ehci->clk = devm_clk_get_enabled(&pdev->dev, "usbhost");
>>>       if (IS_ERR(exynos_ehci->clk)) {
>>> -             dev_err(&pdev->dev, "Failed to get usbhost clock\n");
>>> -             err = PTR_ERR(exynos_ehci->clk);
>>> -             goto fail_clk;
>>> +             usb_put_hcd(hcd);
>>> +             return dev_err_probe(&pdev->dev, PTR_ERR(exynos_ehci->clk),
>>> +                               "Failed to get usbhost clock\n");
>>
>> Why is this logic changed?
>>
>> If you want to call dev_err_probe(), that's great, but do NOT mix it up
>> with a commit that does something totally different.
>>
>> When you say something like "while at it" in a changelog text, that is a
>> HUGE hint that it needs to be a separate commit.  Because of that reason
>> alone, I can't take these, you know better :(
>>
>> thanks,
>>
> 
> Ok, I will improve the commit message relevant to the code changes.

Please read Greg's message one more time. He did not propose to fix
commit msg, right?

Best regards,
Krzysztof

