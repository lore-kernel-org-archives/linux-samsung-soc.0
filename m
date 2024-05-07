Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C57A158D6D;
	Tue,  7 May 2024 12:44:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715085845; cv=none; b=YnS/nEOlR78G6JiJD+MIf1n5o1vQqHbG6Td94RuxicTIJF0nnhKUCC0XPl8wH3VmmFvRbGffxRLkrmcMFzfs0Mg+aGuZtVASpGu9JeGmqEnuayxLXTQMMowMwhRHQnebieGtLqMqJg8+2h7pOTMaeDKVy08Fn7M2KQSxo8+LoSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715085845; c=relaxed/simple;
	bh=KnIVJedJHZe3sxJyLX2GN7WsyXIrdkUeKLWLWsv/Q5w=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=Wv98+nLuKCg/A1YF6zZrSwqQB6FTUXxUjLWRdIyAGutBdJoZdBJPD2ftSXgU+gDluyw/GCmLsIsTjo979Sh9jnhW9CZe9qBzrdYEF+czu6B+26Ezddje4K0cuv/u4YUj7H33W2IBAXJbifWthMNSZFIpM7DPD5rIxRB6tI3fkxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JUBPrksF; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JUBPrksF"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a59a0e4b773so735686466b.2;
        Tue, 07 May 2024 05:44:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715085842; x=1715690642; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=F/oIRhG5AjkWY6V2xiSuojwWNRWmfLxMa4/7v40uDqE=;
        b=JUBPrksF9DGIlQKXKffGpnOwTILazMKwBaW85OXD6Q5ECOs5WZflFg74eOq3gFI56/
         l5AH8OU48RdF1MVLlfhgRwfEenxwak11LX5Fa4jmXRoewLe85/keS+MlwCEThsujKIOn
         JszboVzfThsZLioAmctGXFJYfmLwc7pTe7JVoDm90pIvAa+/pLXyEFdQpsvZ78syR8Ya
         SEXD2FAZWrtEAiCsrztej8RbtHI0TnF+RB1sjrYKXTKeTgW+pQcyzbNKlKxDavpIa6hA
         r6+BnIv4hnCNV3eekUsz9lUEXCcYvJAUN1m/y07TH+t4F3tVJJrqUSb8R/2+RLF3ntGr
         CR9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715085842; x=1715690642;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=F/oIRhG5AjkWY6V2xiSuojwWNRWmfLxMa4/7v40uDqE=;
        b=A3SU6gbxgYIj6PqE9IdkSVNEiwZzUNw669gSnMmNrSEmW0kma1Fiut/o9kvuUo3qfy
         9pgOpWNal/5DF+NdrRKVKXkzTjsGW6aWtbMjm6ttI5Z/hIfQtXwM6ux+Vs2b2Gy9eGGJ
         Xs3ti7HKJ2n9bvnA841C444DQLOeZPGy2AA4+O69IzAgy6bhTAvXEbgaHEZQYChexzqw
         ukxtD7dYzrwvIo6j/73Ad8RPla0tWHRLFmPLh+N7Q6v4aMCyoj01PpLNwPlkw2cQk1Dw
         oM8vKJCnb0VleSzITvRlGDDYXMrzCClrIweAKZtUXVgZopVziC0jN4eBeTi5K/HO0/hf
         QtFg==
X-Forwarded-Encrypted: i=1; AJvYcCUAMUqQcH/N3Ju0eydv6fl4WUFGuOe1vAVtNtVnJQfJke1DQ2+ruq0AJ5tsuAIj5kbpvWb83/0SRNHkUupfLfR12tYURUYAQjupS2zQeVrlW/F3d0lbVnkziyfakvFvxqJ7ILrV2fDmH5y3c9NusMs4dNXPaI+hSTvlXqsmtdQ5YVSi+rwVNJtawQsVmN/cuqeABMG2+TRKIha7fIBUoq0ba/XUsBjf39Q=
X-Gm-Message-State: AOJu0Yy4/l++5IfgeLUvHpEuorSkl55K5burhe1T3mWjFQOsCxkcK81h
	YzSRWvLOhNdQ/fqKjftt4F5TFUso4xUsVhoPGlhm62Da+X/K5k0V
X-Google-Smtp-Source: AGHT+IEH520oqokwkCG16wuOPDMKOF55ptHNw2OadsqHHoYygvWVxSH9Lxsegkq6WAFM/BF8tPoVtw==
X-Received: by 2002:a17:906:6a1e:b0:a59:b8e2:a0cd with SMTP id qw30-20020a1709066a1e00b00a59b8e2a0cdmr5656811ejc.59.1715085842060;
        Tue, 07 May 2024 05:44:02 -0700 (PDT)
Received: from [192.168.50.244] (83.8.126.253.ipv4.supernova.orange.pl. [83.8.126.253])
        by smtp.gmail.com with ESMTPSA id lb14-20020a170906adce00b00a59bc8c01b1sm3321340ejb.82.2024.05.07.05.44.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 May 2024 05:44:01 -0700 (PDT)
Message-ID: <c76fa2cc-d41e-45c5-891a-b83d5d0634b1@gmail.com>
Date: Tue, 7 May 2024 14:44:00 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Artur Weber <aweber.kernel@gmail.com>
Subject: Re: [PATCH 3/3] ARM: dts: samsung: exynos4212-tab3: Fix headset mic,
 add jack detection
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Alim Akhtar <alim.akhtar@samsung.com>, alsa-devel@alsa-project.org,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
References: <20240503-midas-wm1811-gpio-jack-v1-0-e8cddbd67cbf@gmail.com>
 <20240503-midas-wm1811-gpio-jack-v1-3-e8cddbd67cbf@gmail.com>
 <d1007753-bdcf-4db9-bb01-b36e742cee4b@kernel.org>
Content-Language: en-US
In-Reply-To: <d1007753-bdcf-4db9-bb01-b36e742cee4b@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6.05.2024 08:31, Krzysztof Kozlowski wrote:
> On 03/05/2024 20:55, Artur Weber wrote:
>> Add the necessary properties to the samsung,midas-audio node to allow
>> for headset jack detection, set up the mic bias regulator GPIO and fix
>> some other small issues with the sound setup.
>>
>> Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
> 
> ...
> 
>> +
>>   &bus_acp {
>>   	devfreq = <&bus_dmc>;
>>   	status = "okay";
>> @@ -505,12 +521,11 @@ &i2c_4 {
>>   	wm1811: audio-codec@1a {
>>   		compatible = "wlf,wm1811";
>>   		reg = <0x1a>;
>> -		clocks = <&pmu_system_controller 0>;
>> -		clock-names = "MCLK1";
>> +		clocks = <&pmu_system_controller 0>,
>> +			 <&s5m8767_osc S2MPS11_CLK_BT>;
>> +		clock-names = "MCLK1", "MCLK2";
>>   		interrupt-controller;
>>   		#interrupt-cells = <2>;
>> -		interrupt-parent = <&gpx3>;
>> -		interrupts = <6 IRQ_TYPE_LEVEL_HIGH>;
> 
> Does not look related at all to the patch.

I rolled up two small changes to the wm1811 audio codec config here:

- Dropped incorrect interrupt parent - GPX3-6 is the headset key GPIO,
   and does not seem to be the interrupt parent like on Midas (downstream
   calls it GPIO_HDMI_CEC on Midas, whereas for Tab 3 it's
   GPIO_EAR_SEND_END, so they definitely serve different functions).

- Added the MCLK2 clock as specified in the schematics, to more
   accurately describe the hardware.

I included them here since the whole patch modifies properties related
to audio (this section is what "fix some other small issues with the
sound setup" in the commit message refers to), but I can split it up
into a separate commit if it's necessary.

Best regards
Artur
