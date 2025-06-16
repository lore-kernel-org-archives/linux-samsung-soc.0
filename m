Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E741A29CB48
	for <linux-samsung-soc@vger.kernel.org>; Mon, 16 Jun 2025 11:33:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750073607; cv=none; b=JGtQI9ICVAfnUo2nBPj0TwLgZR2/6++MteeUYxxgAtUqjb7R90d4iWA7uMevFVrVLvOHxf2VlnYDQZHA/Q8k7DAymZz6msRIf+NeuFQbf2WrAdKuB94edGpVlP/KL3YdosEPBg1kjY6S7tM0a2/ZOql2Byp/hFnOhdklVvrVw6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750073607; c=relaxed/simple;
	bh=sUJtxVCgOPUC9izlgo4CNw2jnzc7+5K3qEajbBawjgg=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=FrBWW7Hz5hl3QAL3nTwiqLxdtFlgGM8bZn+wOSs/eaezMLYplKPK595sYOjKb3wxdG2vB3I51a4ak6VQEy2qGqnPE2u36ddr/ar/m0kMhmlmYFyBxCLRd86nL3C+L/b88HTE6Gyt9q0xSAco5D+lz+gMJipbNhYKPMqyKXk3u+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DgZmK78e; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DgZmK78e"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3a4fb9c2436so2620974f8f.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 16 Jun 2025 04:33:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750073603; x=1750678403; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=sUJtxVCgOPUC9izlgo4CNw2jnzc7+5K3qEajbBawjgg=;
        b=DgZmK78eRIvsGmJEJg3/5LzJP6Jt1UIMX+KReOFN2e6WY7772YzjvQKG8Ob4NQke1v
         7JbWE6tg3XFdbI+PdFQE4NdFat6syGXC1yBSpd2AKEkCAEB/TOkNC5LWbBVrtIN2fFwW
         dfVUJMWM51xdFBjkXK0tsbaesFESXrfM2cPsMQnN7c/zCHt5F3ihxluYnxjXwNvPHr4X
         WH4XD/YzpzMoh7+sYVRwPfl08wD5okkeGBSqKth6UWxZUQ9ywxHZHl+OR1Hxso+uU7W0
         h7Mv3B+G3vIw6t7wgM4HEP8U1j3boV+J8pi7MEW8549I8qGh4c3BNqwRKe+ZFrKy07Q5
         C7Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750073603; x=1750678403;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sUJtxVCgOPUC9izlgo4CNw2jnzc7+5K3qEajbBawjgg=;
        b=G2YBDxbWcqbUV8Z6wTOiIdcjQuY/JrE0oVOQGl5NAhZPFZS1jl6AM26aHyHhWfkWy8
         TyzUjVAHWRc7GxX40H0AEUYY2dUEuinsuEFyNyL7hhcRvQCXnUUrr10UBdV1q5yndyRI
         8xW64htEa6i2zizDCs3k3+4uqLQ6/zoi6YwAEP64VlUMlK2fibFyRyphNgERjcj6s/Oz
         gYGSOy3AcaXKuftIySHnnpLsGrTLGCvHQf45fZz8kMPoY4NO8FfngzgvU7CCxHiSHNOi
         /tTjWnJJQ5eN2eVHhXPKALRztIj1lroyjeBXRir3EFx6NhxW79pbqXGsfAy+pfNCovtV
         4h8w==
X-Forwarded-Encrypted: i=1; AJvYcCXbgrMrIGyHBrWTEuHMuNkf3fBzDSHDN2dp5lTKmI9VrHAXLXuLgTr4xzMdKSx4LtYMSqADyBGVqEC/djyHDDRjww==@vger.kernel.org
X-Gm-Message-State: AOJu0YweTiFmBpO2rkMyyEJYUY6Jqp2fHssxa/SxZsFkxFmNlMa2sGE+
	orpPWPAKjZqb7IJroj5BCNFmxdHOYFFmI5CJdE4+01NB9okbOts9D2Yi1PHdOhKg04E=
X-Gm-Gg: ASbGncsqgQjxou2iWWxMVTGgJqJb5KOC6OKbwmLStezHL7viXyLV+6hXNkD1qXu7k5E
	iXk+tF99jFM6H8uNrqJe1CxaAizEs6EEYBnSezxw99NuKzsp3as5wMaHG/yDFrBepEq4a3lxYCi
	2aSIokPtzG7XxrX0CyqIfTYcwaTIdzcuZAt8W5v7uV5sMgpuuB4lTrHen+/XhoGEdqqXPOh7MfM
	ybcEiQrjYrNWtRPlEu/2TAnqlKBDb719Ez+yswXaKgWoNwgDJrmZgmToesJx5U9UmuMDMLqTSsK
	WYuzKo7/OxG7RcVokOKnUzNOdhitdQeVZHvpqkNM9mDS3+0d5+CeAmr2XkQQjIK1De7W4xdfUZw
	QzA==
X-Google-Smtp-Source: AGHT+IHENEkwxduA7K0Vjfe2dGuq+xptRSYw34g+0tog7rCYhbhJGOxjnsq/iY/dAhPOFFaN1g90tg==
X-Received: by 2002:a05:6000:2501:b0:3a4:d700:f773 with SMTP id ffacd0b85a97d-3a5723977camr6533466f8f.11.1750073603145;
        Mon, 16 Jun 2025 04:33:23 -0700 (PDT)
Received: from [10.1.1.109] ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532063ebf6sm111747185e9.3.2025.06.16.04.33.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 04:33:22 -0700 (PDT)
Message-ID: <b193e94f042cf6134d2bed92152c23ee5bba6a26.camel@linaro.org>
Subject: Re: [PATCH v4 00/32] Samsung S2MPG10 PMIC MFD-based drivers
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sylwester Nawrocki
 <s.nawrocki@samsung.com>, Chanwoo Choi	 <cw00.choi@samsung.com>, Alim
 Akhtar <alim.akhtar@samsung.com>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Russell King	
 <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, Will
 Deacon	 <will@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, Tudor
 Ambarus	 <tudor.ambarus@linaro.org>, Will McVicker
 <willmcvicker@google.com>, 	kernel-team@android.com,
 linux-kernel@vger.kernel.org, 	linux-samsung-soc@vger.kernel.org,
 devicetree@vger.kernel.org, 	linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, 	linux-rtc@vger.kernel.org, Lee Jones
 <lee@kernel.org>
Date: Mon, 16 Jun 2025 12:33:21 +0100
In-Reply-To: <905e6cab9932c814a578826329f5e3f944418ef9.camel@linaro.org>
References: <20250409-s2mpg10-v4-0-d66d5f39b6bf@linaro.org>
			 <20250415160212.GA372032@google.com> <2025041715425693974c6d@mail.local>
		 <24314441936d97a1892474eacdbbd690612de265.camel@linaro.org>
	 <905e6cab9932c814a578826329f5e3f944418ef9.camel@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.56.1-1 
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

SGkgQWxleGFuZHJlLAoKT24gTW9uLCAyMDI1LTA1LTE5IGF0IDE1OjQxICswMTAwLCBBbmRyw6kg
RHJhc3ppayB3cm90ZToKPiBIaSBBbGV4YW5kcmUsCj4gCj4gT24gTW9uLCAyMDI1LTA0LTI4IGF0
IDE5OjE3ICswMTAwLCBBbmRyw6kgRHJhc3ppayB3cm90ZToKPiA+IEhpIEFsZXhhbmRyZSwKPiA+
IAo+ID4gT24gVGh1LCAyMDI1LTA0LTE3IGF0IDE3OjQyICswMjAwLCBBbGV4YW5kcmUgQmVsbG9u
aSB3cm90ZToKPiA+ID4gT24gMTUvMDQvMjAyNSAxNzowMjoxMiswMTAwLCBMZWUgSm9uZXMgd3Jv
dGU6Cj4gPiA+ID4gPiDCoGRyaXZlcnMvbWZkL0tjb25maWfCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqAgMzUgKy0KPiA+ID4g
PiA+IMKgZHJpdmVycy9tZmQvTWFrZWZpbGXCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgwqAgNSArLQo+ID4gPiA+ID4gwqBkcml2
ZXJzL21mZC9zZWMtYWNwbS5jwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgfCA0NDIgKysrKysrKysrKysrKysrKysrKwo+ID4gPiA+ID4gwqBk
cml2ZXJzL21mZC9zZWMtY29tbW9uLmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIHwgMzAxICsrKysrKysrKysrKysKPiA+ID4gPiA+IMKgZHJpdmVy
cy9tZmQvc2VjLWNvcmUuY8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIHwgNDgxIC0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+ID4gPiA+ID4gwqBk
cml2ZXJzL21mZC9zZWMtY29yZS5owqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgIDIzICsKPiA+ID4gPiA+IMKgZHJpdmVycy9tZmQvc2Vj
LWkyYy5jwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCB8IDIzOSArKysrKysrKysrCj4gPiA+ID4gPiDCoGRyaXZlcnMvbWZkL3NlYy1pcnEu
Y8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgfCA0NjAgKysrKysrKy0tLS0tLS0tLS0tLS0KPiA+ID4gPiAKPiA+ID4gPiA+IMKgZHJpdmVy
cy9ydGMvcnRjLXM1bS5jwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCB8IDE5NyArKysrKystLS0KPiA+ID4gPiAKPiA+ID4gPiBNRkQgcGFy
dHMgbG9vayBva2F5IHRvIG1lIG5vdy4KPiA+ID4gPiAKPiA+ID4gPiBXaXRoIEFja3MgZnJvbSB0
aGUgQ2xrIGFuZCBSVEMgbWFpbnRhaW5lcnMsIEkgY2FuIG1lcmdlIGFsbCBvZiB0aGUKPiA+ID4g
PiBkcml2ZXIgc3R1ZmYgdG9nZXRoZXIgYW5kIHN1Ym1pdCBhIFBSIGZvciBvdGhlcnMgdG8gcHVs
bCBmcm9tLgo+ID4gPiA+IAo+ID4gPiAKPiA+ID4gSSBkb24ndCB0aGluayB0aGUgUlRDIHBhcnQg
ZGVwZW5kcyBvbiB0aGUgTUZEIG9uZSBzbyBJIHdhcyBnb2luZyB0bwo+ID4gPiBhcHBseSB0aGUg
cGF0Y2hlcyBpbiBteSB0cmVlIGlmIHRoaXMgaXMgZmluZSBmb3IgZXZlcnlvbmUuCj4gPiAKPiA+
IFJUQyBwYXRjaCAyNyBkb2VzIGRlcGVuZCBvbiB0aGUgczJtcGcxMCBtZmQgY29yZSBkcml2ZXIg
KGR1ZSB0bwo+ID4gdXNpbmcgZW51bXMgYW5kIG1hY3JvcyBpbnRyb2R1Y2VkIHRoZXJlKS4KPiAK
PiBMZWUgaGFzIGtpbmRseSBtZXJnZWQgYWxsIHRoZSBjb3JlIGRyaXZlciBwYXRjaGVzLgo+IAo+
IEFueSBjaGFuY2UgdGhlIHJ0YyBjaGFuZ2VzIHdpbGwgbWFrZSBpdCBpbnRvIHRoZSBzYW1lIGtl
cm5lbCByZWxlYXNlPwoKRnJpZW5kbHkgcGluZy4KCgpDaGVlcnMsCkFuZHJlJwo=

