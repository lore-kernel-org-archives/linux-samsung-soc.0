Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7BD02FD695
	for <linux-samsung-soc@vger.kernel.org>; Tue, 11 Nov 2025 09:54:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762854890; cv=none; b=ETgEbCdH3bWNjOF50TJUJgQCYahFHOW4GdZTAZCyekAv1X5XGk/TpIGIZR4ixsAXrGSPf9bu9JzDGRv8Ui7s8fy/Fh6S99OpB3ylZ37Dg7hpolHaGtKd04x0i654N+6cIY0cRUpuGP9lnJQa8m16PTFZU/F2f8a8fF0kL0Gr7oM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762854890; c=relaxed/simple;
	bh=juEdnXgxukjP9ZDJM/F2G+Y1pTg5tm7ZX7Y0m15vG88=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=SHReW1ysfIZ3UKLJmHMTmQOgUWM6Rbf82+wMMef6rs0duFM27/NYq2Q1gN8waGJI9KqIvakqmI0eGVI12/GfKLbxR1tnBe4VHGV+qnsUB4mvOZJt5cEbMFhtsAwZwSnasaE7FwdtVQn+Y3lQ0Pub6fjcRid9SgPSm9Z+lYAIFJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ym8KapOs; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ym8KapOs"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-42b427cda88so558300f8f.0
        for <linux-samsung-soc@vger.kernel.org>; Tue, 11 Nov 2025 01:54:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762854887; x=1763459687; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=juEdnXgxukjP9ZDJM/F2G+Y1pTg5tm7ZX7Y0m15vG88=;
        b=ym8KapOsVxHOLEIhlQzSr7f9elIfVvtPF+8AvCZ9w+ClT/2RG3GqjRLjkcxVyHzJkB
         +ccC971wbyYcxhP3zBfHKoRjqPH/Jk7AmgQwFDwoaeqb6dTcMCJLbLVa+up872mMU2Cn
         cFMt+YJj+mDhuQz/SesSddZx71D0QvYUrZrktPuSy/kKbJmFtJsUJT9/Jq0/jRvTTTQ4
         jAUrLv8OPesW0TUeYqd55zZ9LJuddwYexg825eQPqZVSoz3QOPf+8WqDB3ipPIzrA2Ek
         LVn+o7tULAk8W6+9Avw4fbq5YFGTBvcZ6DwcVvCvQ8oprYSeWifcN11CVfunks9bvLrv
         +D3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762854887; x=1763459687;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=juEdnXgxukjP9ZDJM/F2G+Y1pTg5tm7ZX7Y0m15vG88=;
        b=eb6Pm/kfN9NLSwrIzRYsNAiLFffVofFzZLNdEtqfvPrQ+NRPD669d9erqQMfNxvmoq
         WG89MClhTy3VKFvvDcVBVYYzSFUkmSCssq9y58QW+OvxXTCrTS8VrOKQhpjXtAQHtKCu
         z/RT1uH9IwMHqlAYhDeB9O+aZs7Nb91Njzgq8fl9GDubPPk2EZxicnvZuN2H1+ig3+7q
         z9HAVRctDg7J38LwmV054iYT+ZBhjT11kMMGuiVRZD9v++V/uyNGPP+gndRdxGNWnK/G
         lG8HgY3QkalSddnYCxxnVfOWKs7LIGdsyPQPrEtFk8VS+nhjV/Tlm+2bxZgt0mKs3p3D
         6iQw==
X-Forwarded-Encrypted: i=1; AJvYcCXNR6/LhCXR6zZSvjScVGtQzqeJQiVZSm2ckPluvh3vBABKNpG+sE8YYRI/l0cZx+q1MZK8wzqDzw/LsvdcXgqBxg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyMgHuPVbplu/ygE8Fwj/tszmQeBBo41rRLH91KI55HRIuW10yV
	Sm/jQl6yi4nG/uZWttLzkKLYR70fRv2SZhj7MVgs84E23/w5bSZNLUH/vq446hVoUIU=
X-Gm-Gg: ASbGncvCVddYXVQUmcnVbE8ARSAGn/TFpoQXuOHRpqeQxQfjj1ACnGJYQxrBmeDN4vi
	XI/X5kWopGZbslE5psxuGkIXJCea1G+wPrmxhN4gyr84XY69uCtqTGVvrlz710pTCDyVzpWzOhA
	0ougo8udVcuT9wVbotppFfgs4K2bMjPg+gdv0s1IHcSsgW808ClvEEd76uokwfyNiDIed40I5Or
	JD8JXKI1LkeNPeAvcoY2pDe4VYBTZ+Wt91D3o4BVMZpC/jtoPDylEQbqThYoQdCcwAZGi+wmUuA
	Oa0ldhq9ZEBTHz0vX7Rsg0aoMGUobStwm9pdmrc7A0F7kyKr9VGsoKYYV171JK1vhUOqjRCaPz6
	fgQRCd1evYGv2ySWtzV9Htp8LHhKw80jNmTDWjFW8P2tAR4G0ghaX99jsxqsFJZ3OUl5Cdcqh8+
	//keZ8iBrnViGsTj0LKClQqIdwbvI=
X-Google-Smtp-Source: AGHT+IHvLNA4fOeh9HdXCHeE6agVf5WRmWl1BvXGsAPsjjhtMFCdo+PVgS0jTmWpuz3ipwTVliR8Gw==
X-Received: by 2002:a05:6000:2211:b0:42b:4081:ccea with SMTP id ffacd0b85a97d-42b4081cff2mr3938949f8f.35.1762854887062;
        Tue, 11 Nov 2025 01:54:47 -0800 (PST)
Received: from draszik.lan ([212.129.83.89])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42ac679d544sm28207462f8f.46.2025.11.11.01.54.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Nov 2025 01:54:46 -0800 (PST)
Message-ID: <3bb47929b08370d9114ff1dd6b0d0f16d354d63b.camel@linaro.org>
Subject: Re: [PATCH v4 1/4] dt-bindings: clock: google,gs101-clock: add
 samsung,sysreg property as required
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Peter Griffin <peter.griffin@linaro.org>, Rob Herring <robh@kernel.org>,
  Krzysztof Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Alim Akhtar	 <alim.akhtar@samsung.com>, Tudor
 Ambarus <tudor.ambarus@linaro.org>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Sam Protsenko	
 <semen.protsenko@linaro.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>
Cc: Will McVicker <willmcvicker@google.com>, Krzysztof Kozlowski	
 <krzk@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 kernel-team@android.com
Date: Tue, 11 Nov 2025 09:54:42 +0000
In-Reply-To: <20251110-automatic-clocks-v4-1-8f46929f50b7@linaro.org>
References: <20251110-automatic-clocks-v4-0-8f46929f50b7@linaro.org>
	 <20251110-automatic-clocks-v4-1-8f46929f50b7@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.56.2-2+build3 
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

SGkgUGV0ZXIsCgpPbiBNb24sIDIwMjUtMTEtMTAgYXQgMTQ6MjEgKzAwMDAsIFBldGVyIEdyaWZm
aW4gd3JvdGU6Cj4gWy4uLl0KPiAKPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL2Nsb2NrL2dvb2dsZSxnczEwMS1jbG9jay55YW1sIGIvRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Nsb2NrL2dvb2dsZSxnczEwMS0KPiBjbG9jay55YW1sCj4g
aW5kZXggMzFlMTA2ZWY5MTNkZWFkOWEwMzhiM2I2ZDhiNDNiOTUwNTg3ZjZhYS4uNWNlNWJhNTIz
MTEwYWYzYTJhNzc0MGI4YmEyOGUyMjcxYzc2YmRkYiAxMDA2NDQKPiAtLS0gYS9Eb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvY2xvY2svZ29vZ2xlLGdzMTAxLWNsb2NrLnlhbWwKPiAr
KysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvY2xvY2svZ29vZ2xlLGdzMTAx
LWNsb2NrLnlhbWwKPiBAQCAtNTIsNiArNTIsMTEgQEAgcHJvcGVydGllczoKPiDCoMKgIHJlZzoK
PiDCoMKgwqDCoCBtYXhJdGVtczogMQo+IMKgCj4gK8KgIHNhbXN1bmcsc3lzcmVnOgo+ICvCoMKg
wqAgJHJlZjogL3NjaGVtYXMvdHlwZXMueWFtbCMvZGVmaW5pdGlvbnMvcGhhbmRsZQo+ICvCoMKg
wqAgZGVzY3JpcHRpb246Cj4gK8KgwqDCoMKgwqAgUGhhbmRsZSB0byBzeXN0ZW0gcmVnaXN0ZXJz
IGludGVyZmFjZS4KPiArCj4gwqByZXF1aXJlZDoKPiDCoMKgIC0gY29tcGF0aWJsZQo+IMKgwqAg
LSAiI2Nsb2NrLWNlbGxzIgo+IEBAIC0xNjYsNiArMTcxLDIyIEBAIGFsbE9mOgo+IMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCAtIGNvbnN0OiBidXMKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
LSBjb25zdDogaXAKPiDCoAo+ICvCoCAtIGlmOgo+ICvCoMKgwqDCoMKgIHByb3BlcnRpZXM6Cj4g
K8KgwqDCoMKgwqDCoMKgIGNvbXBhdGlibGU6Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoCBjb250YWlu
czoKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBlbnVtOgo+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCAtIGdvb2dsZSxnczEwMS1jbXUtYXBtCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIC0gZ29vZ2xlLGdzMTAxLWNtdS1taXNjCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IC0gZ29vZ2xlLGdzMTAxLWhzaTAKClNob3VsZG4ndCB0aGlzIGJlIGdvb2dsZSxnczEwMS1jbXUt
aHNpMD8KCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC0gZ29vZ2xlLGdzMTAxLWNtdS1o
c2kyCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC0gZ29vZ2xlLGdzMTAxLWNtdS1wZXJp
YzAKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLSBnb29nbGUsZ3MxMDEtY211LXBlcmlj
MQo+ICsKPiArwqDCoMKgIHRoZW46Cj4gK8KgwqDCoMKgwqAgcmVxdWlyZWQ6Cj4gK8KgwqDCoMKg
wqDCoMKgIC0gc2Ftc3VuZyxzeXNyZWcKClRoZSBhYm92ZSBzdGlsbCBhbGxvd3MgKGJ1dCBkb2Vz
bid0IGVuZm9yY2UpIHNhbXN1bmcsc3lzcmVnIG9uIGNtdS10b3AuCgpNYXliZSBpdCdkIGJlIGJl
dHRlciB0byBpbnZlcnQgdGhlIHRlc3QsIGFzIGNtdS10b3AgaXMgdGhlIG9ubHkKb3V0bGllciwg
YW5kIHRoZW4gdGhlIGJpbmRpbmcgZG9lc24ndCBuZWVkIHRvIGJlIHVwZGF0ZWQgd2hlbiBtb3Jl
CkNNVXMgYXJlIGFkZGVkICh1bnRlc3RlZCk6CgogIC0gaWY6CiAgICAgIHByb3BlcnRpZXM6CiAg
ICAgICAgY29tcGF0aWJsZToKICAgICAgICAgIGNvbnRhaW5zOgogICAgICAgICAgICBjb25zdDog
Z29vZ2xlLGdzMTAxLWNtdS10b3AKCiAgICB0aGVuOgogICAgICByZXF1aXJlZDoKICAgICAgICAt
IHNhbXN1bmcsc3lzcmVnCgogICAgZWxzZToKICAgICAgcHJvcGVydGllczoKICAgICAgICBzYW1z
dW5nLHN5c3JlZzogZmFsc2UKCgpDaGVlcnMsCkFuZHJlJwo=

