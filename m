Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E30843B47C9
	for <linux-samsung-soc@vger.kernel.org>; Mon, 23 Mar 2026 16:33:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774283614; cv=none; b=ZOL4VqRWSXrNLUNGpZjaOvPCGZci+WWovRflTzqc5b/8XDLlA+CrseOvytBvsxoTSiakWzFTk9znuX9sz6QsIFwL+3zPVJRr+Th08uvl4DtzF8cqSSiMs2bzSn+EerfbuxPV1uEESL8y/2FiFr//b8rs8M1rUvYEqTA+5qNkcgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774283614; c=relaxed/simple;
	bh=mZQYdyuzrERlRzc0a3/bTlADzdtLlwwGfbzAubppi8s=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=NrHzskHMpQ40sPOdIkKLkE+LUnL9xjCaWkbVOcL/Kof235QH7zi2vkFCPCOEfjRuvCFkl3IuA8JQDTr7vq8bhtCOsvKu35UGYMyk166D7V1c+hlt+REuUBQh7lgJi7dXfrOAmjsFtIKbUhhOIMjqyupjs2lmpW5FPcVuOR3nrv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=L7wETQRX; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="L7wETQRX"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4852a9c6309so26353745e9.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 23 Mar 2026 09:33:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774283610; x=1774888410; darn=vger.kernel.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tw1CKAGR78adc6SIaonWynMm4T02YyIsxi3rErXI5qo=;
        b=L7wETQRX8m/aqZvJLqeSEwp5r1fon+QU8gfuB2fFS9LMT5lZZece3XVQdqFqqozbd1
         zIFR83qVjUCqeKoB1u+qdOcWcnIvl7BiCaUFttEtrFIjNaHemRy36pi3Q9bZOKYcDRKq
         kug6aedW2/A47yS4K40Rnvu/NqlxhtaGldToe6ngYDRwkqERH7IQ0BI112n4LYltq0kB
         4+20q6exX+hTSrcRgz0XZjm5BGNoUMotaZAmRFAa2GxB9BfoVlev950lLJ4G8kGzUr2A
         pHEW5Sg0mSoSczzOnxB5Dx3BkHqDnj33Bv26182eOaYSL2Cf+051CQ5CjjghdKGUTcEq
         heIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774283610; x=1774888410;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Tw1CKAGR78adc6SIaonWynMm4T02YyIsxi3rErXI5qo=;
        b=DM2iXxMAy4vZKnIjDsEhQ/rqi92wOtG5jN7SrfalvYsT/qzS+9bKuk80U9XAZqcOmR
         J94mXIg/kHC7oQOBcvrxi2yYJC6FRRrBq/Qi4bSoVHb4hAo8cfq+TenR4D2enpU7Im1p
         JlAamD1Puyw+aAjuZJic68OZpDPI0Hw1mx5QNF1MWIp/us0jPaLmFLkesP5qdZggStcp
         cjAWcaRYJfF0WJJkEmGnXrGMH5yoErTqJu53bHyIM09T6W1aSpK/SKCjmQ2DlQurmyyk
         Q/YSxWmQqD72AAcFM3k+aTURSfCE4y5Z22YGeowbzQHw5Vg6zs6o+D6gGMbDdypqbSKa
         Mv8Q==
X-Forwarded-Encrypted: i=1; AJvYcCWyd3Bn7vgH+osmjiHaOfjQMCwNYqc+soS93NJC3CBXcxQjWUyTCl/Ad6uOMCKI4zj6V7U9Vnak2c/nXChE4SNoRg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwXNkhJ/qX6LrJA3qZj7KBW8Ink1BP5IeWGTAI2wNC64j0JC2RK
	L02jxYg2wl7eWZZNpOetLSrXiMj15uIg4R38v2qlMUyNds/am8sLszxEubBE4p8olvA=
X-Gm-Gg: ATEYQzxTXLbQ5nwzIsREhoX9vSaXrX+EGPHGrESr89JxvWBI6TZfFKx/5eIh67+WrGk
	LAQvB2jnmmmZJF3+K+xMYzN0DGp5Ae9wSLRhPEM9gRUFtGG0KPnHyDH3XeNF7jZVQSJSe50+YuX
	Kovpp1bJh9P0tK4mfKCXAxHgBldPExMFxLCVq3wxSKDDcRLTcmHg5TAtbYp0SN8YB5sxdyQRC6a
	bgxsj15IJazZ/lsqZx82a49pXRsYdMzbaQCxGBtXvd2USvofsevrILLDcB7j5rTJTWYXGalF0DS
	h+F4XvQbWdAw+LzGFeHb669nEsH7dOFkc9r6wKqwq5O7f/pLHAXFSR7OvAb3QuiHfwLbOf7UMMx
	sRfnfNQ9pjyQfJiSDVGWxV7evNP1lQ0izHl5DFOodxZ6mZrZv1Kh4Xr5ZUdHHFjV6AcoKg1/qzx
	aq4dY+1Lh3CIk1r6b/2KVmYetrORmvBd+CLHKWuBCK5sjeZQ397InSfHz6HqSJ5E85P17FJTjg1
	aSNGtCcFAqz
X-Received: by 2002:a05:600c:4714:b0:485:3bc7:a231 with SMTP id 5b1f17b1804b1-486ff01f1d0mr187337805e9.29.1774283610196;
        Mon, 23 Mar 2026 09:33:30 -0700 (PDT)
Received: from localhost ([94.4.193.72])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486f8ba4baesm564276095e9.13.2026.03.23.09.33.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 09:33:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 23 Mar 2026 16:33:28 +0000
Message-Id: <DHAB1PA67E94.241OXUFJG1GSK@linaro.org>
Subject: Re: [PATCH RFC 1/8] dt-bindings: soc: move and rename
 google,gs101-pmu-intr-gen schema under soc/samsung/
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
X-Mailer: aerc 0.21.0
References: <20260226-exynos850-cpuhotplug-v1-0-71d7c4063382@linaro.org>
 <20260226-exynos850-cpuhotplug-v1-1-71d7c4063382@linaro.org>
 <b02f06e1-dac7-4521-bf5e-471b5575467d@kernel.org>
 <DHA9YL83GF3E.VOMD4KV10NLW@linaro.org>
 <7831dd9f-3e7c-4016-8d84-fe1fa82bdf9d@kernel.org>
In-Reply-To: <7831dd9f-3e7c-4016-8d84-fe1fa82bdf9d@kernel.org>

On Mon Mar 23, 2026 at 4:03 PM GMT, Krzysztof Kozlowski wrote:
> On 23/03/2026 16:42, Alexey Klimov wrote:
>> On Sat Mar 7, 2026 at 5:03 PM GMT, Krzysztof Kozlowski wrote:
>>> On 26/02/2026 16:47, Alexey Klimov wrote:
>>>> The GS101 PMU interrupts generation block is actually a standard Samsu=
ng
>>>> Exynos IP block found in older SoCs like the Exynos 850 and others and
>>>> not exclusive to Google SoCs. Thus, renaming to
>>>> samsung,exynos850-pmu-intr-gen, moving the schema file to soc/samsung
>>>> directory to reflect its origin, since Exynos850 predates GS101 SoCs,
>>>> and preparing for adding Exynos850 description.
>>>>
>>>> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
>>>> ---
>>>>  .../samsung,exynos850-pmu-intr-gen.yaml}                             =
 | 4 ++--
>>>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/soc/google/google,gs101=
-pmu-intr-gen.yaml b/Documentation/devicetree/bindings/soc/samsung/samsung,=
exynos850-pmu-intr-gen.yaml
>>>> similarity index 80%
>>>> rename from Documentation/devicetree/bindings/soc/google/google,gs101-=
pmu-intr-gen.yaml
>>>> rename to Documentation/devicetree/bindings/soc/samsung/samsung,exynos=
850-pmu-intr-gen.yaml
>>>> index 2be022ca6a7d..f9b40f3fd165 100644
>>>> --- a/Documentation/devicetree/bindings/soc/google/google,gs101-pmu-in=
tr-gen.yaml
>>>> +++ b/Documentation/devicetree/bindings/soc/samsung/samsung,exynos850-=
pmu-intr-gen.yaml
>>>> @@ -1,10 +1,10 @@
>>>>  # SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>>>>  %YAML 1.2
>>>>  ---
>>>> -$id: http://devicetree.org/schemas/soc/google/google,gs101-pmu-intr-g=
en.yaml#
>>>> +$id: http://devicetree.org/schemas/soc/samsung/samsung,exynos850-pmu-=
intr-gen.yaml#
>>>>  $schema: http://devicetree.org/meta-schemas/core.yaml#
>>>> =20
>>>> -title: Google Power Management Unit (PMU) Interrupt Generation
>>>> +title: Samsung Power Management Unit (PMU) Interrupt Generation
>>>
>>> Rename is fine if you add here compatible, otherwise the name does not
>>> match the compatible.
>>=20
>> Thanks, I'll rearrange commits then to make it sane in the next submissi=
on.
>
> If you re-order then the case will be the same. Filename will not match
> compatible. IOW, rename is not a logical change on its own.

I probably should have used another word for this.
I am not going to *just* re-order.

Thanks,
Alexey
