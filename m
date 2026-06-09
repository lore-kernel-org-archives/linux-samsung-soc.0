Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 372C0410D13
	for <linux-samsung-soc@vger.kernel.org>; Tue,  9 Jun 2026 12:17:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781007449; cv=none; b=DDe/Ci1+2GRQ9phuF93K4i4wJPMn8w5vBN/EAWraYB7olTGCVX+LAFnFJN7NfAhXDEajFeJltJvvaLgZgr1Rypq0LugVbTUD4ReqIu6Dw/auWstdn1qHdvWgIte9FaiBwKYqWdvn+769S6lUQETJGJO/BO/5EJoOpYvoi/8W/Pw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781007449; c=relaxed/simple;
	bh=7mY4ZLLEtPhXCIzYG6qT0auuWpAN+xsmJ6MePgj9U70=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EAuMQQaK3KaRpE7bqS1wQbuJYIPshCHnYUK/183Q7cEZNXD/sZj8Zm8FdpmKiIjj2oRuaqCrPrkOzT1LSfIxbKUjRH4/AwDqg9+oZNR9OF8P0xNtChohqkrI5Br/Hb0OLq1aHPtYC0EJwlFUgFjDHO4zfRSU3BYLYVFCCGTCd6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PVQVXxTM; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PVQVXxTM"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-45fd45e596cso2678604f8f.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 09 Jun 2026 05:17:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781007446; x=1781612246; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0sf15Qn18zljQFqjYtY+ttqovVDRkyxEeVFCISge3H8=;
        b=PVQVXxTMsOamZccx0PR52rnSacwaUSO0Wr8g9gKplkHQsHXGFHmztBfWlAmYdrvIj1
         NQnlcqGUaSmWhMklqIUXg/8am1A5naQQroZJjRXXxGUkNNF9bNL9HqP0QAqGFRLsXG6u
         BP8Gj4goS8iZYmWkLfFlpqYu6sEaphoZKRQixRRxIfRvirMBcANrqa2sgOenQ1mH4GYQ
         aqwkrx9GznkR2vNunSOS324nJbdoseEnm8lwSxxyaX5lPMvOpDELaExK5Nx8h/q4O4Lz
         zG1kavv7BZoyoSggAFlBDWCBD2ceGj+Wifkc6jg4iYytXxbFp2YGNFcqr8jvWOFoWM30
         gAcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781007446; x=1781612246;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0sf15Qn18zljQFqjYtY+ttqovVDRkyxEeVFCISge3H8=;
        b=q2vQ0M073ucz3jHsGDkMMIMOdQmL4UFaU+BARF/DMEOD6nhbc83vdgzeUmINBEU2rX
         af088ftRIG0KthfOE7G0yjWZEDuPKEoLCF2Ex0PAmPGv6ioVr/JbPFF2pa/aufjkIlAt
         419DBeMvZeOGIsrPvR4qduGihGW8dB+r7jpaD2EvkpANYh4wip44RmJyzORMrT6IKQ0V
         yPxD9gJUNWUawFnECarSgFFXEh670hFiC3g8yjxMDlj2EVQppjHx22wA/IDYwvueyeAq
         Jd/FtPCxPvNzJOCi4o+R/hux/Wh2wgXcJ74uTxAtU5N9uEPvLjWZ4WKNqcXMToUaw0tO
         3sAQ==
X-Forwarded-Encrypted: i=1; AFNElJ9xabrPYrnD3zPoPMXKOZoB1E+kpqtyoXPJxxTvOAy3BUmmgIMx73s6M34n3zu7+UzvRgSWBn210MZW9F0v8YUYGQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxLJQlIVN+eeYh9bTkX3XD4eRHQZSAH71NDIcqqR24jkhA8DZ0L
	Q6pTCGz4S4b763iHy985GnJ+roJL5xM8aUvRCu344H213iJJTNj8w+OEtM1Ep1kOpms=
X-Gm-Gg: Acq92OF/c9xMuBkVTCMaEy1Xk7b+cJnT/Rh4mCBVSk5KAnhz232hHufG5irQxMwGy/2
	TXzgSuQVmNED1niAo8+doNV0W1XbgqqyJHvhwGtuWiX/TUxbglnojpZZY5KT/ejLaH2jk/tT0Em
	8UpOCAdgETy/vfZbDQ/PFzxLysedYTDT6kfycwlPgcpcR533A+ZxqcKrkMJU17jY90brr1pYCKt
	Pg+uB8semmFgSiMND9Oj9YlWufNiqSQJfgC/lgV7ouCr5mYK/4nzxUygBQEByhhkwqumgntx0tV
	Xdtp1WHInDSB+Eiz5Gyv3k53RVC0eWvX5u/lmVX1MFm9rDVhETSGLbv97OX9fLb2FKNnxt1naiX
	e+dPPt5wLt/lI8cQ8oX4TDjbr5mpHKLiBtKzKbqr9UC/kCoXETzngDo8Pmn7kGkj4kN2XREn3Uw
	931olpaj+zlrrsBXhgLVkla5qdgxdbBPzxA2UVY0l75vIqq17vUgG8
X-Received: by 2002:a05:6000:25e7:b0:460:3233:beef with SMTP id ffacd0b85a97d-460566dc381mr3315017f8f.43.1781007445883;
        Tue, 09 Jun 2026 05:17:25 -0700 (PDT)
Received: from [10.11.12.110] ([82.76.215.73])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f351ac0sm110033645f8f.27.2026.06.09.05.17.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jun 2026 05:17:25 -0700 (PDT)
Message-ID: <055b5f99-887d-473e-8211-aefb253cb549@linaro.org>
Date: Tue, 9 Jun 2026 15:17:21 +0300
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 4/5] arm64: dts: exynos: gs101: Add thermal management
 unit
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Peter Griffin <peter.griffin@linaro.org>,
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: jyescas@google.com, linux-kernel@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-hardening@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20260603-acpm-tmu-v8-0-0f1810a356e6@linaro.org>
 <20260603-acpm-tmu-v8-4-0f1810a356e6@linaro.org>
 <08d7299968e14e5fc07fa4791479abd9a2b11c2d.camel@linaro.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <08d7299968e14e5fc07fa4791479abd9a2b11c2d.camel@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 6/9/26 2:44 PM, André Draszik wrote:
> Hi Tudor,
> 
Hi!

> On Wed, 2026-06-03 at 13:00 +0000, Tudor Ambarus wrote:
> 
>>
>> [...]
>>
>> diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
>> index 86933f22647b..b6866ef99fb3 100644
>> --- a/arch/arm64/boot/dts/exynos/google/gs101.dtsi
>> +++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
>>
>> [...]
>>
>> @@ -639,6 +647,15 @@ watchdog_cl1: watchdog@10070000 {
>>  			status = "disabled";
>>  		};
>>  
>> +		tmu_top: thermal-sensor@100a0000 {
>> +			compatible = "google,gs101-tmu-top";
>> +			reg = <0x100a0000 0x800>;
>> +			clocks = <&cmu_misc CLK_GOUT_MISC_TMU_TOP_PCLK>;
>> +			interrupts = <GIC_SPI 769 IRQ_TYPE_LEVEL_HIGH 0>;
>> +			samsung,acpm-ipc = <&acpm_ipc>;
>> +			#thermal-sensor-cells = <1>;
> 
> Vendor-specific properties should always come after generic ones
> (samsung,... to move to end here).

Yes, thanks! I'll address this after I get some feedback on the driver
from the thermal maintainers.

Cheers,
ta 
