Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83D3E29D27A
	for <linux-samsung-soc@vger.kernel.org>; Fri, 16 Jan 2026 08:50:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768553453; cv=none; b=ZmoBv2+PtWvtb+E9Ckr6TQayT7k8mhmI3wuu8Q8Mr/1vYSTnEnCMseUrMoPblXKJqgLmb4K/V6WawJy/+SCGcmQPDVQJMjvaIZuQuE7U7ZQJaoZ1vvllLTwRWvTLW3RH/leHWveL6i5yMNRu5Auf7R6tgrSVK0fRciaFfANA29s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768553453; c=relaxed/simple;
	bh=IxxkAHO4EnPiHaHTmJj8q4lvkE9SooXBNoQmhRF6Nyk=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=ZFahueD2F+sduiohjoCQXmsQhetoRMIS9b6ZdMBxUGzivQilszJbSlH35z+4wrHswUifVY0txcu5fBr9/niHMuKYlesWCrqmoSn5JLFQoXfmf+V56brGFJ3J2Ww0HTVDYIYK2KFXMxcsxNXFaBdrHKN3IArdVcxVhzmpGE36SsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zvBuCoPB; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zvBuCoPB"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-47edd6111b4so15127435e9.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 16 Jan 2026 00:50:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768553450; x=1769158250; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pXXyXgD5w4PG1Vior3rmQ9g78aObU3Raj1nrRdpjO4M=;
        b=zvBuCoPByJXT9NLYNA68cAungP0ITFpI66ZhsO+5vkuZ5N1TpAFG+ih63w5C76MILC
         G61Se8IF2SxC68Nr71xtzdG6xwL6Krchlw3SKkG22w1/NVpTUfbQ7A3n542Jt4LYu4tJ
         KKE33g1lXRqwinONAfe+l4Imp2CHXhDwiwWImNeogjaql4y4C1SeqN9RTOR3hpGAwGtH
         FnD7wBcDWaeZ5S8mJeHkeq/F8LvWJ5qtmtToGx4k0BhjDiInimIo+0MWgj9aVK/JXOh0
         ocunQbzUYBnIW/U6KMNGP+QgT/8TpTn63eKTh9NNJOBhaNNr29RlKwXLGxwlUNnfveI7
         QaOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768553450; x=1769158250;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pXXyXgD5w4PG1Vior3rmQ9g78aObU3Raj1nrRdpjO4M=;
        b=ei0/bWz3E4EnttUKmWvo63IcFTXCVh+Vm3QG/QaGanxHiOtf0FTKYNQUlFQOYf3E3b
         53ennChbWdVFy8T82HrA1i0+vZHWE1pzHDm7YBFoTQNOZV9vt8s1EXYJ15N0ZIJ286TY
         AS8KGV3ngt326F/SCVrEF3hOLlMyQHTu8YOZN3YvfGmVrvVJaggLdqdDoSj/USCZd+E3
         HgzrrYnKYvQLxSKRSmx0AzGBy2nuXUiN1DWW0iJOthj6n6wK8XAp2tYyJYRU1c3CmRRg
         x684n3L3kW8ilr77CIO2Lb6WhD1PX0gLHmB/LpK40Tr3MOBQd6Y5AoQNRaWL/ol1l3vA
         VzbQ==
X-Forwarded-Encrypted: i=1; AJvYcCWXd3lo/ekDuCiJ1J1GgeJ9FXA+JFmFaXMyk7Hw6jcW5xSRsI7misEYbdEFYgUSQhpnNztqYWAv4DUFYC78KEZhYQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyj9S2tg4MDxHG2GWWMQdaNr+/WRBV4U8ryVbYKEMye7jBXefum
	wr2IjzNxCrIGwHYbb7IARVa3z7JGhElTHlQ2o9WXMPzsYKWRdwJmFUoyRFqEAAUaoe0=
X-Gm-Gg: AY/fxX5mfGBP9TZcNbAkYuPRDUWxtS06f/8W3/FwdZokS2IzT/XVXXkhpDB1P5zL4yH
	7XwfoKlk15hO1pkfW86XaLYgoVhGib0NmsPYkrfsx9e8xoVuXQM5EAxYlyK3FPQ4DBtGvCkoixl
	kieK6NOhxAtYDtMr86h6raEWlHoNgIaOrIlDeJVol8V+X0G5WPB99eSqWyi9hmp06IAjzhnsR+v
	PO8OY0IdhzaUm2LtTuVXpqlugfD/Z3jsmMCerdCPjDFrxA//5JoPfABpGPj/UH0r2xSh2hcPo0E
	EpBe2vyuzx8H3QNjkOhz3VEyNAUuGlm/50/xmCo7pAuT/x04T9ozzzy92S2RZi3mLpkX1MStd+C
	xw/wms2N78G5Rsjt/eo60YH35rBU566I2NgdhwT8vZyvdFuk9NwIVmEX2qV1aIDZv5+/l5yahCA
	zndUPxTRqf6ZG+GO+uWQ==
X-Received: by 2002:a05:600c:414f:b0:480:20f1:7abd with SMTP id 5b1f17b1804b1-48020f17c12mr10430535e9.31.1768553449885;
        Fri, 16 Jan 2026 00:50:49 -0800 (PST)
Received: from [10.11.12.107] ([86.127.43.8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47f4b267661sm87966875e9.13.2026.01.16.00.50.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Jan 2026 00:50:49 -0800 (PST)
Message-ID: <26d86470-aaa2-46e3-9940-010a903df4fd@linaro.org>
Date: Fri, 16 Jan 2026 10:50:47 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/8] dt-bindings: mfd: Add Google GS101 TMU Syscon
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Peter Griffin <peter.griffin@linaro.org>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>, Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, willmcvicker@google.com,
 jyescas@google.com, shin.son@samsung.com, linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-hardening@vger.kernel.org
References: <20260114-acpm-tmu-v1-0-cfe56d93e90f@linaro.org>
 <20260114-acpm-tmu-v1-3-cfe56d93e90f@linaro.org>
 <20260115-slim-denim-potoo-cad9cb@quoll>
 <200d34bf-150e-4f8a-b400-2f54863502ac@linaro.org>
 <e2f028d6-774f-4773-889f-7d56b833067e@kernel.org>
 <fcc5405e-189d-4195-8db0-3acf35bbc0a9@linaro.org>
Content-Language: en-US
In-Reply-To: <fcc5405e-189d-4195-8db0-3acf35bbc0a9@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 1/15/26 6:10 PM, Tudor Ambarus wrote:
>>> I'm going to link the ACPM TMU child node with the TMU node via a
>>> "samsung,tmu-regs" property.
>> This could be fine, but I actually wonder what's there. What registers
>> exactly. For example modern Exynos 88xx, already with APM block, still
>> have exactly the same TMU unit at 0x1008{04}000 with all typical
>> triminfo, current temperature and thresholds.
>>
> It's the same for gs101, the TMU instances have all the typical registers,
> it's just that everything is handled via ACPM but the intpend registers.

I could still use some guidance, Krzysztof, thanks for the help so far!

Based on the current feedback I was going to propose the following
description:

soc: soc@0 {
    tmu_top: thermal-sensor@100a0000 {
        compatible = "google,gs101-tmu-top";
        reg = <0x100a0000 0x800>;
        clocks = <&cmu_misc CLK_GOUT_MISC_TMU_TOP_PCLK>;
        interrupts = <GIC_SPI 769 IRQ_TYPE_LEVEL_HIGH 0>;
    };
};

firmware {
    acpm_ipc: power-management {
        compatible = "google,gs101-acpm-ipc";

        thermal-sensor {
            compatible = "google,gs101-acpm-tmu-top";
            samsung,tmu = <&tmu_top>;
            #thermal-sensor-cells = <1>;
        };
    };
};

GS101 handles the thermal sensors in a hybrid way: it uses the TMU IP
block to read the INTPEND registers, and everything else is handled via
ACPM calls. There's also the abstraction that one ACPM sensor is comprised
of multiple physical TMU sensors.

My concern now is that the ACPM TMU child node is not hardware per se,
but just a firmware abstraction (One-to-Many sensors).

If everything was handled via ACPM, without the need to read the TMU's
INTPEND registers directly, I would have describe the sensor just as an
ACPM child.

Because of the hybrid approach I'm arguing the ACPM child node does not
fully describe the hardware, and it's just a firmware abstraction.
So option 2/ would be to have just the TMU IP block described with a
phandle to the ACPM IPC:

soc: soc@0 {
    tmu@100a0000 {
        compatible = "google,gs101-tmu-top";
        reg = <0x100a0000 0x800>;
        clocks = <&cmu_misc CLK_GOUT_MISC_TMU_TOP_PCLK>;
        interrupts = <GIC_SPI 769 IRQ_TYPE_LEVEL_HIGH 0>;
        
        /* The "Firmware Phandle" approach */
        samsung,acpm-ipc = <&acpm_ipc>;
        
        #thermal-sensor-cells = <1>;
    };
};

Which one do you think it better describes the hardware?
Thanks!
ta
