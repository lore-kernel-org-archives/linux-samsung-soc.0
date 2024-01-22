Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D2503BB4C
	for <linux-samsung-soc@vger.kernel.org>; Mon, 22 Jan 2024 12:12:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705925524; cv=none; b=CBS3RbMJ8u8g4g0boy5rbsRyWz58+m76fMKeVdd0o3JC4w9yFcTaGqcl5rumklpMBwVB3eUhqwoPIo0Y6v42laMwGN02/MnnraXnuzRTzS1+OCabjUPkrLciXsRUXr7VJiAyJMgUK5YTom0rfPF3sYek4QDor6PYlldb4IrDtRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705925524; c=relaxed/simple;
	bh=XsjrwFUbPagjf42Y9qmXToMWE70jnXHEmc8i9mZpqmE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OtdizVKxgX/vl/saak8TmlNt//SAbd21u/pynNNwEOJggBrOuidEiH9Jq3+Leop96a+FqO4LbyMxJiFjUhAR0wKMLagprV3jVj8h5clZzwa1b4H+CwVpijan85PgoBSuze+7CBBfc8s4BhUbRdv4o5x/3ANiEjiUWDPc9Ey1Tmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Qrwm6BJP; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Qrwm6BJP"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-40e60e137aaso34610765e9.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 22 Jan 2024 04:12:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705925519; x=1706530319; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JZISQUpNOr22c4fKmEuMChAKwdEFwddCk4q6QmgaO8M=;
        b=Qrwm6BJPQMrg/yf+dB6DqVc63A3X/YXFuFsXUchGmEdtnF0CoE9EkuJOU+uonbw0ot
         ZvxTPM0Y99+Z92I26CqD8T85SBF56LaXey4dfMyVlWbLB9WrTfmEX02VoOTCc2/S2Sg+
         yDKOjoS4hwFdu+Z4KVAD/d3ImKhspswD+6jDK3g+vrO98j8gVkh3V4x4yHqrPcFqeuWF
         cw9ZJ7rqcmURhwpTaZEuYkk7evH5nMDnGSWXEuVq1deKnEyIDAxIFNM2jQ3PSK4dtUNV
         PEcSnSj/TKAWdSDHGWdHnpZUTccyZyMqs3YcQ1p5UHVtkmasx4KKpPTRUBfx4ERTPzwc
         +SOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705925519; x=1706530319;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JZISQUpNOr22c4fKmEuMChAKwdEFwddCk4q6QmgaO8M=;
        b=MFBOFmAEiXyOSrk6RMghfQRRBy/Z4W7u9hsEcjXL3O2nWcOXz1klhfBvM68HoFL9WW
         iCIo6FhbwIadZQCDbIyNw1q8w0sBNz5Z6svXilxLmzIrfwVrfyWE4cWMlFmZL3Ags1WM
         iRgV4DVG182YRuBe88vZdGzFG1qt3WImjLSpvGQj5Hb9mlRpYhCTqF5XNqxf1dyFvUOs
         EiwtvviHeUB8ElW8ATGxt/VRRlbFLgcrDtuThq3J4w8w2u/Ll+Fkmy/vPSfRdFXel774
         uKHrTqyvM7TQviRuJK5tT1rA29Wq1wgvyXAh2UqG2Rtl2vmXd0zNILPm75tzxSeY7u9g
         AUQA==
X-Gm-Message-State: AOJu0Yzcq95j9NRVpw2BvAZWV2ntySfM6PjcKrdYdp/tfgHx8XoikUPE
	xhL2UhcRP0YAgho8Ib9TqNft2doGz5+i0PRr0rmzasnCbWD6PLNIUneZ8gMyjsA=
X-Google-Smtp-Source: AGHT+IGCG5Khoe/1oQjX1DFLwPQkaYesrnTTQ5bk157a5/61v0MK6kfoRoDLbJ0mfk1ZEGN224EOGw==
X-Received: by 2002:a05:600c:2d52:b0:40e:47de:d804 with SMTP id a18-20020a05600c2d5200b0040e47ded804mr2091816wmg.63.1705925519179;
        Mon, 22 Jan 2024 04:11:59 -0800 (PST)
Received: from ?IPV6:2a05:6e02:1041:c10:371e:2a86:62f0:bc48? ([2a05:6e02:1041:c10:371e:2a86:62f0:bc48])
        by smtp.googlemail.com with ESMTPSA id c11-20020a05600c0a4b00b0040d53588d94sm42839717wmq.46.2024.01.22.04.11.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Jan 2024 04:11:58 -0800 (PST)
Message-ID: <e4288d81-cd0c-41cf-989f-85ce10d5904e@linaro.org>
Date: Mon, 22 Jan 2024 13:11:57 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: timer: exynos4210-mct: Add
 google,gs101-mct compatible
Content-Language: en-US
To: Peter Griffin <peter.griffin@linaro.org>, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, tglx@linutronix.de, conor+dt@kernel.org,
 alim.akhtar@samsung.com, s.nawrocki@samsung.com, tomasz.figa@gmail.com,
 cw00.choi@samsung.com, mturquette@baylibre.com, sboyd@kernel.org
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel-team@android.com,
 tudor.ambarus@linaro.org, andre.draszik@linaro.org,
 semen.protsenko@linaro.org, saravanak@google.com, willmcvicker@google.com
References: <20231222165355.1462740-1-peter.griffin@linaro.org>
 <20231222165355.1462740-2-peter.griffin@linaro.org>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20231222165355.1462740-2-peter.griffin@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 22/12/2023 17:53, Peter Griffin wrote:
> Add dedicated google,gs101-mct compatible to the dt-schema for
> representing mct timer of the Google Tensor gs101 SoC.
> 

Applied, thanks

-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

