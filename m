Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3108C3D3CEF
	for <linux-samsung-soc@vger.kernel.org>; Wed,  8 Apr 2026 14:31:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775658661; cv=none; b=DYjS41V30X2eYAIJt8F/mqnp98RRWVO4x/DTMahFeefrwHH7eyRXzUN093Apk/ZKDfczLbskoSk3l65k4nXJCps4VdATOCNIuIcPkDDYALqsPzejr69lgLm3PH/4q2O3H8S0w5wEdzt3/gJRVBDFgg+eEMkHdveoAthO+CIUMVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775658661; c=relaxed/simple;
	bh=CxH0oCbGTr6B8Wm+BS8m8qhdCPE3WP5aAsJAIX7L2eQ=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=sJp65LqP/oniz6OJbiIRj5L+FWuIx1adesRub/RFYayuDpflk3uQ0Wbf/yPGcFWYoDndR2Ot4op7bFJ5QYCEcy3OKVC3Cke0VydXznyCe+1eBAn/FWo+OVSEWCdXJl8t8oLMZsN+sA6Rny6txtUKyWSoxzK/8mrRXkCFXsMmzIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Lm+/BRgt; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Lm+/BRgt"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-488b0e1b870so54359845e9.2
        for <linux-samsung-soc@vger.kernel.org>; Wed, 08 Apr 2026 07:30:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1775658658; x=1776263458; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CxH0oCbGTr6B8Wm+BS8m8qhdCPE3WP5aAsJAIX7L2eQ=;
        b=Lm+/BRgtsVNmyu+X8bOaxFfWfEWZPaaOtpPKl4vWOX9EDRr+QEfWDNSWGcHIng0rii
         Z6+UGG1gxrUKTjTElmU2D6cedEdi9uxbIY8owq1QlLmOUvH4gS1aQxra1/5k232nvSF8
         w7aMvtM3dH1VytuTstSKeVlVJcYzZElte/W7pEH88KKXQcsjyGfK9XfbbJ3UTN8ZJxUt
         31hmAXOTy1A92K4ud3r9eJcvjqrbG8RDHLgKy/tUJKtwxlsXBltaJZUqADHa0UwabAAB
         tUSpaIje6ta9bet3oCCZUVODOiMwdRrORDFj9pSoOteIW5YEaTbUxIkvUnj9rLDRoSZQ
         uAYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775658658; x=1776263458;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CxH0oCbGTr6B8Wm+BS8m8qhdCPE3WP5aAsJAIX7L2eQ=;
        b=X9M/pCbapq2c/ktVR3zqPKieuyuAxQHM70c8yUfRfhrlYcpsKmJeqbCzfEuSqC5s/4
         hkrjHINTAfJqxQfh99V05pzUUyRIawjQ+ygfZrL35NZsCEdA205P4/zVwhFNa2O2YMef
         FNUaYeVDI666z3w/6BkoH4UFVNzcIBryshxiYTLEoI7zgsKTRqEhsfxqqMgO1SF/BgyM
         PrRe4tH6va/qgHMz+pe9j5sm8qrDtYAAlK7Y24VulGvB/nT0cItFQXB3uDt50jECswdB
         XyZH1RdKIr6uxQaLhaF2Ki33ZQCFvcMDhAC+UURV6TDfbDaJBYCyh1vNEsWW/lRbo5Q5
         bC4w==
X-Forwarded-Encrypted: i=1; AJvYcCXyepMTTuMlL/84jWxa/UDdtlH1a6lOLb5Q7/W13nOerrHqUXEXCLk0ECPYRiiWaSqcMO1/Xs07ZZUwv2nmNEZfFQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzQFV3U0KvUqgzt9IWGKgJJMHY72uXPo0ixM4Ra7A7dZQVVC0h1
	GxtkDadLwTWFk0aoC45If3jo4y8R0pxCBd8O48HBJRxXWOkyHHlUgtERHZXjIhrR4eg=
X-Gm-Gg: AeBDieuPGnTnmzqAASEcgcHz1LoRfNzC/Pn4TzLaw6ve/O7VHlzR+aHmDepmgOAh+3R
	PzbE9Wc1ExX20DlLFaz5I6HM3rweBtnfMV5LkuOpx3VI+9t+VED0w+/ujqRM2PR3bTSJx/Gtmpm
	YAJZdRGyE/fEOrzAfQmi06QCQB12/N1qvi93cFQhOmxmItgaWWkLOlr/4/ld5X4fjUIg58YxUjW
	d2VgjodiQiqw3BRUaahjIVcM4ZTPZreZHcmB/1GI35i2NM/koCZ5oHWCd65wibdPvLYG0OjOf+X
	2WwiU5L5vfnObLsY+N+hkliWu89eS1sQzbWoZzIKTd5xeA9khezqYsJb7zAbSCBsoYPFz5f6sQN
	oxOFjBBDrgggjmpMQbCsZEOktP8gDyxLkv+9SsU1e30TfRKyd22883ADBvKtMmETo0Mq87bh1yN
	5i1He/4LSJ72C/nKpyXqf7KiiODMaou5iOpSd2fFNZnsfNPL8GK1a/zF4vz7k++WyPFcuJ6AFtL
	O+vt0rmlnBRxhJgVA==
X-Received: by 2002:a05:600c:8710:b0:485:5ba3:37d8 with SMTP id 5b1f17b1804b1-488996b0589mr341915565e9.5.1775658658541;
        Wed, 08 Apr 2026 07:30:58 -0700 (PDT)
Received: from localhost ([2a00:2381:fd67:101:9775:58c0:569c:bd74])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e4e56fesm56397818f8f.27.2026.04.08.07.30.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Apr 2026 07:30:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 08 Apr 2026 15:30:56 +0100
Message-Id: <DHNUGLJYPTUR.BTHWV3J1RRVT@linaro.org>
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, "Sam
 Protsenko" <semen.protsenko@linaro.org>,
 <linux-samsung-soc@vger.kernel.org>, "Krzysztof Kozlowski"
 <krzk@kernel.org>, "Peter Griffin" <peter.griffin@linaro.org>, "Conor
 Dooley" <conor+dt@kernel.org>, "Alim Akhtar" <alim.akhtar@samsung.com>
Cc: "Tudor Ambarus" <tudor.ambarus@linaro.org>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 2/7] dt-bindings: soc: samsung: exynos-pmu: add
 samsung,pmu-intr-gen phandle
X-Mailer: aerc 0.20.0
References: <20260401-exynos850-cpuhotplug-v2-0-c5a760a3e259@linaro.org>
 <20260401-exynos850-cpuhotplug-v2-2-c5a760a3e259@linaro.org>
 <01ffe5d3aca040edcedb084386ab6e195cb93013.camel@linaro.org>
In-Reply-To: <01ffe5d3aca040edcedb084386ab6e195cb93013.camel@linaro.org>

Hi Andr=C3=A9,

On Fri Apr 3, 2026 at 11:17 AM BST, Andr=C3=A9 Draszik wrote:
> Hi Alexey,
>
> On Wed, 2026-04-01 at 05:51 +0100, Alexey Klimov wrote:
>> Some Exynos-based SoCs, for instance Exynos850, require access
>> to the pmu interrupt generation register region which is exposed
>> as a syscon. Update the exynos-pmu bindings documentation to
>> reflect this.
>
> You could mention that this is similar to the existing google,...
> one due to same requirement, hence a new and more general property.

Ok. Thanks.

>> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
>> ---
>> =C2=A0.../devicetree/bindings/soc/samsung/exynos-pmu.yaml=C2=A0=C2=A0=C2=
=A0 | 18 ++++++++++++++++++
>> =C2=A01 file changed, 18 insertions(+)
>>=20
>> diff --git a/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.ya=
ml b/Documentation/devicetree/bindings/soc/samsung/exynos-
>> pmu.yaml
>> index 76ce7e98c10f..92acdfd5d44e 100644
>> --- a/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
>> +++ b/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
>> @@ -110,6 +110,11 @@ properties:
>> =C2=A0=C2=A0=C2=A0=C2=A0 description:
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Node for reboot method
>> =C2=A0
>> +=C2=A0 samsung,pmu-intr-gen-syscon:
>> +=C2=A0=C2=A0=C2=A0 $ref: /schemas/types.yaml#/definitions/phandle
>> +=C2=A0=C2=A0=C2=A0 description:
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Phandle to PMU interrupt generation inte=
rface.
>> +
>> =C2=A0=C2=A0 google,pmu-intr-gen-syscon:
>
> Please keep alphabetical order of vendors.

Sure. Thanks for noticing this.

Best regards,
Alexey
