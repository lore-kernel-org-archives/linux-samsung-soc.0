Received: from mail-dl1-f66.google.com (mail-dl1-f66.google.com [74.125.82.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DB2C33B6ED
	for <linux-samsung-soc@vger.kernel.org>; Tue, 24 Feb 2026 21:28:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771968530; cv=none; b=OmnUGCkBOVOAR9+Xn4d1kwZtbMHBsRBtu0UJNAqJ9cmlUpGGDqZheXYrS8cBj2BjyTkSJmsZHVCT9ETQ7sQJSwtyxxHisJHjgI8diGRPwrnfmnrfcGtoqGSbFVspckoNywcEI7YM42y6eerMtYXjq95vJEyYaXPU1/xbVzv88Ak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771968530; c=relaxed/simple;
	bh=htTvdtaSYWfRahiauDhevYDzpS+gGQW68oZKpwXdYA8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GxZjS0/DW/8ky9E8gO2sO1QGMv2FTbt9r392HRlkDKTSUvVcw0AZL9rQ43U4hdaQZw9wgUoEym99PsEQA/XRZLq83KrewuDZhoys5Xgt1BJSVhET1zcZeHyF4CoZzqWa7gNWRS652mTuQqUoj9rzx/1f8ZJMa8X2963yqfwSW58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=3CBYaaxe; arc=none smtp.client-ip=74.125.82.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="3CBYaaxe"
Received: by mail-dl1-f66.google.com with SMTP id a92af1059eb24-12776bebe9fso1218622c88.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 24 Feb 2026 13:28:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771968528; x=1772573328; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yDayGCTx715bDzSgsBZo6/sacRFjwz6HQIrmD08ogXA=;
        b=3CBYaaxerIG9p2ZCYSHXTQ3uqCQLkFJHwuibcdwVooSAEZCOC5+YALSm47xkLnIUd2
         zHJ8YID7my43p0XoBnOUcHZRXLvdFJk2bva1c0FA+GfFF8DxWzi5yGwuH68libltVMbZ
         tS3U+OtgoUNSVST3q/q+/HChHN0PPQ0roDsdmPR8DNpsUULm7/U37kb6AeW7AMrz2SPz
         inrb+O/rrLvZFw3HZbZQsMRc9xWm9PqtePSGr4PutrbW3s07aKmathtHpEBArvneQV5J
         fKtdI/mP86r+EBL6whcNNVvbs44C3xJscikgQjiKVyH2j8QU9G+ADl4GhK6wGFqy+RQS
         4l2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771968528; x=1772573328;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yDayGCTx715bDzSgsBZo6/sacRFjwz6HQIrmD08ogXA=;
        b=rMFyLIgJ7uxNAQjzIkTMXMNuIAYq7GZF4j1PKJfJaUMUCOfrx0ILql7W0CjThwiQxA
         t6m0Rp4fjC0fFrOnoJnCBWdHIJNKxXJQIIq9GOlw5SiMwKHGdLQLAcE3HKJ52Ltt1/Zy
         d2sk/EbRUhd1vj6UKWdf3r92zVcLZVKPOvWYDMbQNbY4fg82lMl1WzcZfMDoMqcZEkX7
         /ahbMuVtU62qrBBo6VsbS8BVTbY1S0hTsPcfhPpo12aCgdomReeIpb7wlXJvujmyH3pZ
         +rwtNYXsVOl9KdtMkauXJJ+jwTggC8ObBpQVt5Ix7zbWfIV0pHL7fpsDYjfbajYpBTkY
         GiFw==
X-Forwarded-Encrypted: i=1; AJvYcCXxnWTSMaAIjY+sCUJB5vyAWPI4+qWL2DYJ4qeVcwijub3wAnwLjj4d0SGrKpoNU04up2ypeR1s2n7wU83cNVgT2w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzn6ewkI4RpEsXWmq1NFcHb0037XOAskHGmr06nAVatTGVYxU2q
	vIscs0Ek7sRX4GtYtgQzNR7s/KyUfRqaDva2VkoqAdeeUz+yKWTgn5YrDytcMy/kvQ==
X-Gm-Gg: AZuq6aIAb1P4W+UjN4GCkSTG9UubCbF4fLxGd2R6UUHzGHt/8kK0lqR+CplD1zwIWPD
	BR2sdeLenveLodqb3LkbCqyhyq1qOJ+VsilMmejxJmITIEtxi6pkwhomTddiMq5IE4ArCf3QG9O
	Tdc1zwwuewqSX7gm1Laza530S8Cjkgnoyp94Ze/PVBV1swzJWzpUcqOwlxHHUfQGeUt/ID7l9vM
	PBg9AFhdLpv+zDn2iIVLTgklOuBir2Wk4H8RVKEyD8qxzgcbBl0L88teW5168PbKRKxlicZS6W9
	z/u0A6U2BmGVE6vpUv11TDT8R19Hw9AcHrvSVrTSmOJIjkYZMVV72PkheahDds59fa++yg/GpGA
	e39b0IVFUkD3lwDvbdsrqIdU2thJT1Yy8D195xWW6f7ARUis9/po+gBNcNxMKDIzXfNFmIGPBMu
	oTQhkWwS3QMv3oS57bODTmDBWPomRCpl5HoBEzUyPVoyDRTLHqrvqTCVQqphGddS8x3HZa/U5wT
	vgryZaHOSb8PlamorJYkR+NZQ==
X-Received: by 2002:a05:7022:1285:b0:127:33c5:5390 with SMTP id a92af1059eb24-12781e0aac0mr52023c88.11.1771968527891;
        Tue, 24 Feb 2026 13:28:47 -0800 (PST)
Received: from ?IPV6:2a00:79e0:2e7c:8:665e:550c:2a20:8866? ([2a00:79e0:2e7c:8:665e:550c:2a20:8866])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1276af207d6sm12385902c88.5.2026.02.24.13.28.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Feb 2026 13:28:47 -0800 (PST)
Message-ID: <fa253e2f-bdb5-4ad0-9308-ba2f9bb97596@google.com>
Date: Tue, 24 Feb 2026 13:28:39 -0800
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: exynos: gs101-pixel-common: add supply and
 regulator properties
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Peter Griffin <peter.griffin@linaro.org>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Badhri Jagan Sridharan <badhri@google.com>
References: <20260224-max77759-charger-dts-v1-1-b443545c04aa@google.com>
 <48d5eb8e-834f-4e87-a59c-d05add0dfda7@kernel.org>
Content-Language: en-US
From: Amit Sunil Dhamne <amitsd@google.com>
In-Reply-To: <48d5eb8e-834f-4e87-a59c-d05add0dfda7@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2/23/26 11:01 PM, Krzysztof Kozlowski wrote:
> On 24/02/2026 06:03, Amit Sunil Dhamne via B4 Relay wrote:
>> From: Amit Sunil Dhamne <amitsd@google.com>
>>
>> Add power supply and regulator properties to the MAX77759 pmic. The
>> usb-typec device will reference the regulator provided by the pmic as
>> it supplies vbus to the typec device when operating in power source mode.
>>
>> Signed-off-by: Amit Sunil Dhamne <amitsd@google.com>
>> ---
>> This patch depends on the patchset [1].
>> [1] https://lore.kernel.org/all/20260224-max77759-charger-v8-0-eb86bd570e9c@google.com/
>> ---
>>   arch/arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi | 8 +++++++-
>>   1 file changed, 7 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi b/arch/arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi
>> index 93892adaa679..2cc00d34dda8 100644
>> --- a/arch/arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi
>> +++ b/arch/arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi
>> @@ -142,12 +142,13 @@ &hsi2c_12 {
>>   	status = "okay";
>>   	/* TODO: add the devices once drivers exist */
>>   
>> -	usb-typec@25 {
>> +	maxtcpci: usb-typec@25 {
>>   		compatible = "maxim,max77759-tcpci", "maxim,max33359";
>>   		reg = <0x25>;
>>   		interrupts-extended = <&gpa8 2 IRQ_TYPE_LEVEL_LOW>;
>>   		pinctrl-0 = <&typec_int>;
>>   		pinctrl-names = "default";
>> +		vbus-supply = <&chgin_otg_reg>;
>>   
>>   		connector {
>>   			compatible = "usb-c-connector";
>> @@ -236,6 +237,11 @@ pmic@66 {
>>   		interrupt-controller;
>>   		#interrupt-cells = <2>;
>>   
>> +		power-supplies = <&maxtcpci>;
> Missing blank line. Please follow DTS coding style.

Sorry, will fix.


BR,

Amit

>
>> +		chgin_otg_reg: chgin-otg-regulator {
>> +			regulator-name = "chgin-otg";
>> +		};
>> +
>>   		gpio {
>>   			compatible = "maxim,max77759-gpio";
>>   
>>
>> ---
>> base-commit: 8bf22c33e7a172fbc72464f4cc484d23a6b412ba
>> change-id: 20260224-max77759-charger-dts-23493398e77c
>>
>> Best regards,
>
> Best regards,
> Krzysztof
