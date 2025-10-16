Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECBB08BEC
	for <linux-samsung-soc@vger.kernel.org>; Thu, 16 Oct 2025 05:53:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760594018; cv=none; b=b8AicCOqJ4W9v92sqBbrH5lo+niFAFflSfweL1bbHZca7g0o+i/qHg4ulLHZMa0IJ+xB/9LZ146rxRhXn58TYdYN+rc/7HekMWizSf1N5e/xethUAwgl9ZoGCw5vDrYnCpgRSe2BG6i/xcVatfRx2TKQG9QCE+2cDF3C2bUFKSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760594018; c=relaxed/simple;
	bh=h43Lpj0QWKhbWHWyTH/CRqgeEv5tT9Y15JOhJ6HkdJ0=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=eLg+Rl1wiPqK2/vs0+u+Ix/CLUlvzQ1P4ZYN8jIDthp2Ef/1CO+mvxBEMESwMt5mFY4JrXzqMcXEhDRg6i9aNQCfLeIInpK1rbefYOOXg8bIb6XE7C4YIEPJ/4a80fqdD1lEOhap4mdKt3BeibJ8W54UGV95bExaPPvieaQT9bc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nHEOO7rK; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nHEOO7rK"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-b4f323cf89bso59662466b.2
        for <linux-samsung-soc@vger.kernel.org>; Wed, 15 Oct 2025 22:53:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760594015; x=1761198815; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=h43Lpj0QWKhbWHWyTH/CRqgeEv5tT9Y15JOhJ6HkdJ0=;
        b=nHEOO7rKZIkWtYDi0eGXlP30OPZK1y00frSaLEQQY6Gu7bIW6fRaePgg/AxT2wiZcr
         oRVHMkAiRfVxZceEAo7yjqCcb3srVt6ITxzT2eYoo/7CBzDbR1Spvq2hZDkBDWL6ac+J
         PgzzlF43++hfAvtEw2Ucjh1AksS0Ol6u9ma0Pt5Pb3VCj6M67suGtunfz1O6Z8Det2NI
         ZfmyOVBq3my+73f4EulUkpDWMFQeztQ5mXOf3hiSpKic2I1YzjpQIIi+aDOpV8pYTYP9
         z805UbnPCuQRvE8g1fAZ/9RbLd27BPhc5l/DftfypZ/SyH+zYHbHOpKCsoY4C1dM08o7
         R/og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760594015; x=1761198815;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=h43Lpj0QWKhbWHWyTH/CRqgeEv5tT9Y15JOhJ6HkdJ0=;
        b=exDDhJMa0pe+4Om4aH+GErOQ3OcaoufTQ4h2KKRXvNF9zPGbU8AbTlZGBkybncIVBB
         kZOaE4q6J35KoXJE/CljfkYi0aN59lsXa+5WR7X7q4U8VaXMRhbLfSYGXBsLRsSznXcW
         219FlbpXDq4Aaenwa3qaQc5eKnqEB73ltEVfG4pm1ANlTt7pbTKW0zTchHWnpHqdB6Os
         nDbHC99A1p2fqnOHzPjx6azHCubNu52RMA2bb+KZRPuk6Ujs5dpmDrAQF0PSnvD3JjDt
         5LpALRBGve0wJMsGfttcbqsHBcGBjkOCoO/vclZoIn3k5Wu9E9zuOaRZuCaPuKEw4nw/
         Knaw==
X-Forwarded-Encrypted: i=1; AJvYcCUxAr66Jyfzdy+J7HzNftZQck6uPmKEhpQw0Xl7S2snnpi2Sr5+bY/RsJOEbYx8A+9Vn9inLOcmUYP9RdZe4T/lhA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzvYJPI1n0rcbWNlAWX0NnxX9Z8o1dWwda7ozNiUUsi9nYmYrxL
	JSNCgd5TWqoB/n1im0dYyX+rSMmqPzDjoCqLTZNqzoGp/GbtFKySUVUy7gwXNP5nYXc=
X-Gm-Gg: ASbGncsWEg+G4wWoRSdV5Gavcm+sbNoYi0Tfv/N5eLjkktkZDUDGHEDa9kU5vYVTT7B
	9IYjzP3V9bWfa5fD4324SP/clucHYnVZFevVwkPm3vmEMyRsdgwmMGXwWHuk+3PaGXvo8CLWFKU
	cOc4V2ifjAEC4wzlNKyjaVRYoz8SLW0vdcRg/x4oHGsBnisEFRz2zJjUeTvMfcvkuR5IzeFJcSB
	YDonrXREWFQEqrXgjFnsIH12K+cAyU+kM7ArD/wHm6FZ4l0KF5mnRGMwRt6Awz/vZbcZd4C8elO
	LGAgDwzKLvYNqDGqQeRWNhHuWB0QNd3W8iyqZb/0SsUIi6AOZOxSMrTO6pgoauLiBswy0L++ckR
	j7d6vX9e1MtJP5tG3aiHfUdVW3HpA8Vz4CTwQphkfaZlFMGECd+Rx95HzTu2uPMH9rwHBl/DSMz
	ytmA+w+YD57QOzYBZzhXF3WpVarfuA
X-Google-Smtp-Source: AGHT+IG6k82old8Ss2xXFGeUWZ0Z24OHhJFIC1WYkbpaOPTTbKORZrmrrZeZpS+oP1oVNSzs9LZc9A==
X-Received: by 2002:a17:906:cb85:b0:b54:8670:7c2d with SMTP id a640c23a62f3a-b5486707c37mr2358791766b.55.1760594015284;
        Wed, 15 Oct 2025 22:53:35 -0700 (PDT)
Received: from draszik.lan ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b5cccdaa0f9sm427529166b.45.2025.10.15.22.53.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Oct 2025 22:53:34 -0700 (PDT)
Message-ID: <5fa16d95c5b421253135c5ec7974e99b8724f395.camel@linaro.org>
Subject: Re: [PATCH 2/9] dt-bindings: clock: google,gs101-clock: add
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
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, Krzysztof
 Kozlowski	 <krzysztof.kozlowski@linaro.org>, kernel-team@android.com
Date: Thu, 16 Oct 2025 06:53:33 +0100
In-Reply-To: <20251013-automatic-clocks-v1-2-72851ee00300@linaro.org>
References: <20251013-automatic-clocks-v1-0-72851ee00300@linaro.org>
	 <20251013-automatic-clocks-v1-2-72851ee00300@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.56.2-2+build3 
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

T24gTW9uLCAyMDI1LTEwLTEzIGF0IDIxOjUxICswMTAwLCBQZXRlciBHcmlmZmluIHdyb3RlOgo+
IFVwZGF0ZSB0aGUgYmluZGluZ3MgZG9jdW1lbnRhdGlvbiBzbyB0aGF0IGFsbCBDTVVzICh3aXRo
IHRoZSBleGNlcHRpb24gb2YKPiBnczEwMS1jbXUtdG9wKSBoYXZlIHNhbXN1bmcsc3lzcmVnIGFz
IGEgcmVxdWlyZWQgcHJvcGVydHkuCj4gCj4gU2lnbmVkLW9mZi1ieTogUGV0ZXIgR3JpZmZpbiA8
cGV0ZXIuZ3JpZmZpbkBsaW5hcm8ub3JnPgo+IC0tLQo+IMKgLi4uL2JpbmRpbmdzL2Nsb2NrL2dv
b2dsZSxnczEwMS1jbG9jay55YW1swqDCoMKgwqDCoMKgwqDCoCB8IDIzICsrKysrKysrKysrKysr
KysrKysrKy0KPiDCoDEgZmlsZSBjaGFuZ2VkLCAyMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9u
KC0pCj4gCj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9j
bG9jay9nb29nbGUsZ3MxMDEtY2xvY2sueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9jbG9jay9nb29nbGUsZ3MxMDEtCj4gY2xvY2sueWFtbAo+IGluZGV4IGNhZjQ0MmVh
ZDI0YmRhNTdlNTMxNDIwZDhhN2Q4ZGU4NzEzMDMyYWUuLjVjZmU5OGQ5YmE4OTVkNTIwN2ZmZmM4
MmYzZmQ1NWI2MDJiNGEyYmIgMTAwNjQ0Cj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL2Nsb2NrL2dvb2dsZSxnczEwMS1jbG9jay55YW1sCj4gKysrIGIvRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Nsb2NrL2dvb2dsZSxnczEwMS1jbG9jay55YW1sCj4g
QEAgLTQ5LDYgKzQ5LDExIEBAIHByb3BlcnRpZXM6Cj4gwqDCoCByZWc6Cj4gwqDCoMKgwqAgbWF4
SXRlbXM6IDEKPiDCoAo+ICvCoCBzYW1zdW5nLHN5c3JlZzoKPiArwqDCoMKgICRyZWY6IC9zY2hl
bWFzL3R5cGVzLnlhbWwjL2RlZmluaXRpb25zL3BoYW5kbGUKPiArwqDCoMKgIGRlc2NyaXB0aW9u
Ogo+ICvCoMKgwqDCoMKgIFBoYW5kbGUgdG8gc3lzdGVtIHJlZ2lzdGVycyBpbnRlcmZhY2UuCj4g
Kwo+IMKgcmVxdWlyZWQ6Cj4gwqDCoCAtIGNvbXBhdGlibGUKPiDCoMKgIC0gIiNjbG9jay1jZWxs
cyIKPiBAQCAtMTYzLDYgKzE2OCwyMiBAQCBhbGxPZjoKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgLSBjb25zdDogYnVzCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC0gY29uc3Q6IGlwCj4g
wqAKPiArwqAgLSBpZjoKPiArwqDCoMKgwqDCoCBwcm9wZXJ0aWVzOgo+ICvCoMKgwqDCoMKgwqDC
oCBjb21wYXRpYmxlOgo+ICvCoMKgwqDCoMKgwqDCoMKgwqAgY29udGFpbnM6Cj4gK8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgZW51bToKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLSBnb29n
bGUsZ3MxMDEtY211LWFwbQo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAtIGdvb2dsZSxn
czEwMS1jbXUtbWlzYwo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAtIGdvb2dsZSxnczEw
MS1oc2kwCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC0gZ29vZ2xlLGdzMTAxLWNtdS1o
c2kyCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC0gZ29vZ2xlLGdzMTAxLWNtdS1wZXJp
YzAKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLSBnb29nbGUsZ3MxMDEtY211LXBlcmlj
MQo+ICsKPiArwqDCoMKgIHRoZW46Cj4gK8KgwqDCoMKgwqAgcmVxdWlyZWQ6Cj4gK8KgwqDCoMKg
wqDCoMKgIC0gc2Ftc3VuZyxzeXNyZWcKPiArCj4gwqBhZGRpdGlvbmFsUHJvcGVydGllczogZmFs
c2UKPiDCoAo+IMKgZXhhbXBsZXM6Cj4gQEAgLTE3Miw3ICsxOTMsNyBAQCBleGFtcGxlczoKPiDC
oAo+IMKgwqDCoMKgIGNtdV90b3A6IGNsb2NrLWNvbnRyb2xsZXJAMWUwODAwMDAgewo+IMKgwqDC
oMKgwqDCoMKgwqAgY29tcGF0aWJsZSA9ICJnb29nbGUsZ3MxMDEtY211LXRvcCI7Cj4gLcKgwqDC
oMKgwqDCoMKgIHJlZyA9IDwweDFlMDgwMDAwIDB4ODAwMD47Cj4gK8KgwqDCoMKgwqDCoMKgIHJl
ZyA9IDwweDFlMDgwMDAwIDB4MTAwMDA+OwoKVGhpcyBzZWVtcyB1bnJlbGF0ZWQsIG9yIGF0IGxl
YXN0IG5vdCBtZW50aW9uZWQgaW4gdGhlIGNvbW1pdCBtZXNzYWdlLgoKQ2hlZXJzLApBbmRyZScK
Cj4gwqDCoMKgwqDCoMKgwqDCoCAjY2xvY2stY2VsbHMgPSA8MT47Cj4gwqDCoMKgwqDCoMKgwqDC
oCBjbG9ja3MgPSA8JmV4dF8yNF81bT47Cj4gwqDCoMKgwqDCoMKgwqDCoCBjbG9jay1uYW1lcyA9
ICJvc2NjbGsiOwo=

