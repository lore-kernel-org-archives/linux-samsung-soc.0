Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAFB5282F0C
	for <linux-samsung-soc@vger.kernel.org>; Mon, 23 Mar 2026 15:42:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774280549; cv=none; b=QvPxpUVDWLP3jqo3Dg6hDRghM2LsNTOOzJC1zWHHn+HCcgJzu61H+q8SB4dCCTFh1JaBxHW4pT6Zt7H3HmpaQKzKGh5HSFTUVCcEyvGbW8jpBraJIrwinJiSIasedzjo1hBnJKE0jtUAbgTcTPGrPk4H9VfriU1T2rtOfM8BGz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774280549; c=relaxed/simple;
	bh=rRhxVK/c/+wH2KhlKu+QUVmINgMaPr8vrZEfbRxuvmc=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=pck3cEYkc5g+VROl5PdvGEa+9K+lkxocyi6S0hG1UJM9OpryJ/nyP004vEM/oMb8S3LRI+0EUfMweQgQ/OPXIhc0h1XWlXkpip/X8CUG9J38nX40yuTPjC11ZAOzBaVjnA2jBAic7On5RC+HAuhKrGs/IAUZHpwPGKIog23+iOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=C0E8TlYL; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="C0E8TlYL"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-439cd6b0aedso2916436f8f.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 23 Mar 2026 08:42:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774280545; x=1774885345; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d+UUACqAEvJ8nDbjPv0hUOrpaSay71+UWgCtj8ajV1Q=;
        b=C0E8TlYLgYBI/zxAOfx6N/xW2+JHbRv5nPy6Q6X1ASDNtyWsRP0lwFOB+LotUS0rLe
         NQAZGj5XFdtKu+YjnwIBHeDzU6LsaEvUXaX14Yb/Mf4YPd2PPwKqloGAyiB4RwEl1QRO
         WRut9tOIAiD4bhOFAIu0J1EEhnb7kotCg6xMFJWoASSPQbHWA5gurFl9Z0RA8A+2vPCF
         f+LVcYytx8vNu7DB5thHsIDlczbIv8npWyHMPMu9oPxl1g4QqE1rlv+BgGrZcOI2RRcN
         YyEwz1Xz6bKHVqCbvBJT2MwV9DZ9+s0suRBx2Bu64FgOGUzR58eeyltSHnLPn5Z3MGjs
         Qpxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774280545; x=1774885345;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=d+UUACqAEvJ8nDbjPv0hUOrpaSay71+UWgCtj8ajV1Q=;
        b=A/fnpGygGM1lWRZE8ZdzZf/VBgfASZpfkhK4ZJRcgb77/Ug2arHunyXP7Gbyqvyp0T
         PPbqGt82ZrvoREPdmF5iDyTPM+U5h97J+6Rd2DVkTEoDDlwvUZkAcKu+x1C04BBB1hQB
         qBEfBzZgTK34+WXeWL1eIt116ZBwCtO6+rMhW8toJax2eQ9c8BnIUQo7biPFXeT2dFxR
         s5XZGo71JLddMZfuWMHFtoVBuCBI6QLJVKyT6DXG8AatKk0o7xiD1Ciz2aufbigpEWw3
         yY1bmqBCxP7t764a+GdmHhnZQGGBSv43VkABxW9EFbjy7ndvA22tUevat7ChxekbVy0O
         Ucjw==
X-Forwarded-Encrypted: i=1; AJvYcCUngIhex/+kD4iNmdvCkomS2WDFPAjePXkm6i3LLG/ec1bKWVLchYUV2bU6eKOKtZ5lT/iYlsRXQYmVwV/IZHq3WA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyovkOr1u5Eh8CCnLI217oPgPoGKQRhEoB0XbWO0q2kWdvwsV3/
	CcHgQB1i+b4Y1pDwKsd5N/okgOs5qbxI/6DWlVLquo8l1UywRcYVFJsfvCCnKNrkTZ0=
X-Gm-Gg: ATEYQzwYo0fByBzNEtD3TOSRLhGI+/RFfkWec/bwuk5uFEbPSEj19dRb59xxwRlOA/q
	qVY+bi1nZJltepmZYrA8OcINuavIMtjkBI/6PNTptKqwxWe5e3S4Q/6A5jBrTOUxEE/LXQ8MCY3
	k2UuJBCC/E8/Bbr9eXd9lNW68CcTBFkfsoCVK0SB6dzZ0i0bx3Y8/GgknP7jSyuMphp8FqOyGEE
	6Q2aM76sqv3jx2KL1laKf2hCTDMCwT5AgQaBtw+3GI0NCkn1fTmZN8rxXoxa3M+WARU9Smh1f8N
	Yjr6508us+juSzx4UiG9tdbGJhQB+CxSgjWyUPN0Co2YfEMALPWiaWp9p+O7m7s5rywNJnh46Ac
	l+FkuGSobx/ijm8UabYabw7o1hexQuFrmWa/Bs/OGgY/ECVDN8CDtY+tPBdGSpRdJbvjBg1g88o
	CqCgnlBnfpPvkd6WSF1Ge7enHqtN/MDaTjs9NG70IUCXG4sugTDTjGoMmgMsW6bsW95jK7BR4p/
	Bn63HNThV0C
X-Received: by 2002:a5d:5f53:0:b0:439:be04:13c4 with SMTP id ffacd0b85a97d-43b6423d85bmr18780048f8f.4.1774280545056;
        Mon, 23 Mar 2026 08:42:25 -0700 (PDT)
Received: from localhost ([94.4.193.72])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b644acb52sm32068966f8f.7.2026.03.23.08.42.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 08:42:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 23 Mar 2026 15:42:23 +0000
Message-Id: <DHA9YL83GF3E.VOMD4KV10NLW@linaro.org>
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Krzysztof Kozlowski" <krzk@kernel.org>, "Alexey Klimov"
 <alexey.klimov@linaro.org>, "Sam Protsenko" <semen.protsenko@linaro.org>,
 <linux-samsung-soc@vger.kernel.org>, "Peter Griffin"
 <peter.griffin@linaro.org>, =?utf-8?q?Andr=C3=A9_Draszik?=
 <andre.draszik@linaro.org>, "Conor Dooley" <conor+dt@kernel.org>
Cc: "Tudor Ambarus" <tudor.ambarus@linaro.org>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Alim
 Akhtar" <alim.akhtar@samsung.com>, <linux-arm-kernel@lists.infradead.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH RFC 1/8] dt-bindings: soc: move and rename
 google,gs101-pmu-intr-gen schema under soc/samsung/
X-Mailer: aerc 0.21.0
References: <20260226-exynos850-cpuhotplug-v1-0-71d7c4063382@linaro.org>
 <20260226-exynos850-cpuhotplug-v1-1-71d7c4063382@linaro.org>
 <b02f06e1-dac7-4521-bf5e-471b5575467d@kernel.org>
In-Reply-To: <b02f06e1-dac7-4521-bf5e-471b5575467d@kernel.org>

On Sat Mar 7, 2026 at 5:03 PM GMT, Krzysztof Kozlowski wrote:
> On 26/02/2026 16:47, Alexey Klimov wrote:
>> The GS101 PMU interrupts generation block is actually a standard Samsung
>> Exynos IP block found in older SoCs like the Exynos 850 and others and
>> not exclusive to Google SoCs. Thus, renaming to
>> samsung,exynos850-pmu-intr-gen, moving the schema file to soc/samsung
>> directory to reflect its origin, since Exynos850 predates GS101 SoCs,
>> and preparing for adding Exynos850 description.
>>=20
>> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
>> ---
>>  .../samsung,exynos850-pmu-intr-gen.yaml}                              |=
 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>=20
>> diff --git a/Documentation/devicetree/bindings/soc/google/google,gs101-p=
mu-intr-gen.yaml b/Documentation/devicetree/bindings/soc/samsung/samsung,ex=
ynos850-pmu-intr-gen.yaml
>> similarity index 80%
>> rename from Documentation/devicetree/bindings/soc/google/google,gs101-pm=
u-intr-gen.yaml
>> rename to Documentation/devicetree/bindings/soc/samsung/samsung,exynos85=
0-pmu-intr-gen.yaml
>> index 2be022ca6a7d..f9b40f3fd165 100644
>> --- a/Documentation/devicetree/bindings/soc/google/google,gs101-pmu-intr=
-gen.yaml
>> +++ b/Documentation/devicetree/bindings/soc/samsung/samsung,exynos850-pm=
u-intr-gen.yaml
>> @@ -1,10 +1,10 @@
>>  # SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>>  %YAML 1.2
>>  ---
>> -$id: http://devicetree.org/schemas/soc/google/google,gs101-pmu-intr-gen=
.yaml#
>> +$id: http://devicetree.org/schemas/soc/samsung/samsung,exynos850-pmu-in=
tr-gen.yaml#
>>  $schema: http://devicetree.org/meta-schemas/core.yaml#
>> =20
>> -title: Google Power Management Unit (PMU) Interrupt Generation
>> +title: Samsung Power Management Unit (PMU) Interrupt Generation
>
> Rename is fine if you add here compatible, otherwise the name does not
> match the compatible.

Thanks, I'll rearrange commits then to make it sane in the next submission.

BR,
Alexey
