Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E9772EDD7E
	for <linux-samsung-soc@vger.kernel.org>; Mon,  9 Feb 2026 14:07:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770646030; cv=none; b=Xy5DEVCP/4DR+bKHGHnZ/X+ajxfXCTJhbT0EkGz+14StmeYVreelezQsRWqe6DhzBG82USJQIo6pkKnvjDlOjMN0BC9kirKjGwtKn24wDMqE+dJnWvRYOGgQE2fHCDfLLSit7M+e1iUAZlXC8OQnPIdOFFGVU5REIHIlLGEeDcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770646030; c=relaxed/simple;
	bh=gGVQD4ar0VlOkG/DUP3JIs46G4+cGF27Hj36Z3a631s=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=FqKgMOc/y1eDEmCfCzJP5OjXlaGFxOaYx9Zhi/fqHidHq/JK3dulehG5E05mi6botnmTKDKCthiQrVWrVRYIBmUaGxoyVoe9thQTKpNtwCKtdesqIzfrUwEGcOOlfSNlwBy7UEL7Rez8DcDYEvEdFX4KobcplYl/tJo3c9IiFKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ek1MZjwp; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ek1MZjwp"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-b884a84e622so781770466b.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 09 Feb 2026 06:07:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770646028; x=1771250828; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=gGVQD4ar0VlOkG/DUP3JIs46G4+cGF27Hj36Z3a631s=;
        b=Ek1MZjwpVawAAMBuQFXxJ+brhPAsXqbPB7bMSTFCt2zrfoL2dkcXei8wgXFlsF2AwQ
         1PiYBGJYw25qVFX6P5jGPOyqBDUHxZMlUSBSVo9g6fSd81TKiq4ga6rofsr2MmjnpjiV
         TnrLfOMDRbUeW1l5Sd6BJpcu6fWUp+hcViC7vTrrWRvdeGk3/XWGEfMtQ/WLdatbr9BX
         gN711CoZe+BCJXY2wrs5qSVGqe0ZPb8lFlOId1Gh/7YeA7XdZK3JQ/iw7/OAN/lNShoV
         zi5f55C1UhJjyiBdzjbB22KAllIErNl6vqjJX1ggREqhVd9345V054AqXSlPsBMAe4Pk
         q6AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770646028; x=1771250828;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gGVQD4ar0VlOkG/DUP3JIs46G4+cGF27Hj36Z3a631s=;
        b=vL9/StsjRKJUwGX4YGFwxaOmiqtoy68EOkweHC+t6T7NWcgvdb9gXOmK/FD/TUQze8
         lkD/QfAFWmUXl0YMTBPrmsnFif9QuwImsa/9M1PO5+IbkzptEjb0/cllvUa6CWQSmT/z
         iaQS/mog4cL+mYLUbSFgI1nlxVQZ99NhPC6mBU/5LPHSUkuSaAzAxEKUr51nElgY6pae
         In0kc4YDgQH9ZzwTouQ5mWdHpVpiPAsBx+rH+oWjs4p4fQSykVz3ThxQp6gEDNADA/rb
         trx1i+yt5Gs8+CKHkwxHlnHQEbQUdqlmriJNyYg5//zY9n6mBs7fRXG8pzpa9nW1lizF
         y7tw==
X-Gm-Message-State: AOJu0Yzaz6t9o1LnDAaUGNa4V2LacPodZad87xakqC6Llc5yixiRcDyw
	FZChu7yUkphEqcH2GNZk1rR+zW0LxTssyNp2YT4VQHaTYiKc3W+xL1B+FNU/BEK3a4UL0o2iaNv
	EjELl
X-Gm-Gg: AZuq6aKdIaEmDOlfvmvyJFfu7FzlpnAsU/cJvzugywlmRBZkAXn3OIGxNoJDegdYZob
	FfNfnIvsVspwHOTVF8F8MuBIyRBFIH3Xh5EyzH496ytzUm320KFguW+s9mZzl3vzQYCd4s19eSA
	3/qLh1kyOJU6m+DdTGmuPZZAwsQbArZ8SJp+PHdwBNvtw0so9sw/fwo8l/gas0MhRQkh+58SDfz
	l+lxuV/0e8taGJZjsxHeU541O/aYh5AOkc71UEXPmk017sq3Mm7RDHd+7kAFNUb/aqiBbH4zMmi
	tQtrg/EMvsgJoEoN6kVLSNFz4VpuVr9KYvPpB8eeVEHvxo/zR4GRspYPB4fxbzatuOks+twHJdz
	jCHAn/JhSvBjN9t44R3OzZeBsr5/P/Iem80p7C/pDmvRbJTiV6tgEOt+Z80vWWwMmpwL+j7Lkyj
	wA2e3hN8W6ZAxXFxMmaw==
X-Received: by 2002:a17:907:a4d:b0:b87:6:3727 with SMTP id a640c23a62f3a-b8edf3556cfmr654809066b.48.1770646028080;
        Mon, 09 Feb 2026 06:07:08 -0800 (PST)
Received: from draszik.lan ([212.129.87.125])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8edacb18c5sm409293766b.43.2026.02.09.06.07.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 06:07:07 -0800 (PST)
Message-ID: <13e12c2bf5e5396e3971137e4ab74e15b38d4b78.camel@linaro.org>
Subject: Re: [bug report] regulator: s2mps11: add S2MPG10 regulator
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-kernel
	 <linux-kernel@vger.kernel.org>
Date: Mon, 09 Feb 2026 14:07:35 +0000
In-Reply-To: <aYmsu8qREppwBESH@stanley.mountain>
References: <aYmsu8qREppwBESH@stanley.mountain>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.56.2-2+build4 
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

SGkgRGFuLAoKT24gTW9uLCAyMDI2LTAyLTA5IGF0IDEyOjQ1ICswMzAwLCBEYW4gQ2FycGVudGVy
IHdyb3RlOgo+IFsgU21hdGNoIGNoZWNraW5nIGlzIHBhdXNlZCB3aGlsZSB3ZSByYWlzZSBmdW5k
aW5nLiAjU2FkRmFjZQo+IMKgIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC9hVGFpR1NiV1o5
REphR283QHN0YW5sZXkubW91bnRhaW4vwqAtZGFuIF0KPiAKPiBIZWxsbyBBbmRyw6kgRHJhc3pp
aywKPiAKPiBDb21taXQgYTJiOGI5ZjMzY2UzICgicmVndWxhdG9yOiBzMm1wczExOiBhZGQgUzJN
UEcxMCByZWd1bGF0b3IiKQo+IGZyb20gSmFuIDIyLCAyMDI2IChsaW51eC1uZXh0KSwgbGVhZHMg
dG8gdGhlIGZvbGxvd2luZyBTbWF0Y2ggc3RhdGljCj4gY2hlY2tlciB3YXJuaW5nOgo+IAo+IAlk
cml2ZXJzL3JlZ3VsYXRvci9zMm1wczExLmM6NDgzIHMybXBnMTBfb2ZfcGFyc2VfY2IoKQo+IAl3
YXJuOiBvZmYgYnkgb25lICdleHRfY29udHJvbCcgPT0gQVJSQVlfU0laRSgpPwo+IAo+IGRyaXZl
cnMvcmVndWxhdG9yL3MybXBzMTEuYwo+IMKgwqDCoCA0NTjCoMKgwqDCoMKgwqDCoMKgIGlmIChv
Zl9wcm9wZXJ0eV9yZWFkX3UzMihucCwgInNhbXN1bmcsZXh0LWNvbnRyb2wiLCAmZXh0X2NvbnRy
b2wpKQo+IMKgwqDCoCA0NTnCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4g
MDsKPiDCoMKgwqAgNDYwIAo+IMKgwqDCoCA0NjHCoMKgwqDCoMKgwqDCoMKgIHN3aXRjaCAoczJt
cHMxMS0+ZGV2X3R5cGUpIHsKPiDCoMKgwqAgNDYywqDCoMKgwqDCoMKgwqDCoCBjYXNlIFMyTVBH
MTA6Cj4gwqDCoMKgIDQ2M8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHN3aXRjaCAo
ZGVzYy0+aWQpIHsKPiDCoMKgwqAgNDY0wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
Y2FzZSBTMk1QRzEwX0JVQ0sxIC4uLiBTMk1QRzEwX0JVQ0s3Ogo+IMKgwqDCoCA0NjXCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBjYXNlIFMyTVBHMTBfQlVDSzEwOgo+IMKgwqDCoCA0
NjbCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBjYXNlIFMyTVBHMTBfTERPMyAuLi4g
UzJNUEcxMF9MRE8xOToKPiDCoMKgwqAgNDY3wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIGlmIChleHRfY29udHJvbCA+IFMyTVBHMTBfRVhUQ1RSTF9UQ1hP
X09OMikKPiDCoMKgwqAgNDY4wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gLUVJTlZBTDsKPiDCoMKgwqAgNDY5wqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGJyZWFrOwo+IMKg
wqDCoCA0NzAgCj4gwqDCoMKgIDQ3McKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNh
c2UgUzJNUEcxMF9MRE8yMDoKPiDCoMKgwqAgNDcywqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlmIChleHRfY29udHJvbCA8IFMyTVBHMTBfRVhUQ1RSTF9M
RE8yME1fRU4yIHx8Cj4gwqDCoMKgIDQ3M8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGV4dF9jb250cm9sID4gUzJNUEcxMF9FWFRDVFJMX0xE
TzIwTV9FTikKPiDCoMKgwqAgNDc0wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gLUVJTlZBTDsKPiDCoMKgwqAgNDc1
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGJyZWFrOwo+
IMKgwqDCoCA0NzYgCj4gwqDCoMKgIDQ3N8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IGRlZmF1bHQ6Cj4gwqDCoMKgIDQ3OMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCByZXR1cm4gLUVJTlZBTDsKPiDCoMKgwqAgNDc5wqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgfQo+IMKgwqDCoCA0ODAgCj4gwqDCoMKgIDQ4McKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlmIChleHRfY29udHJvbCA+IEFSUkFZX1NJWkUoZXh0X2Nv
bnRyb2xfczJtcGcxMCkpCj4gCj4gVGhpcyBzaG91bGQgYmUgPj0gQVJSQVlfU0laRSgpLsKgIEFs
dGhvdWdoIHRoZSBlYXJsaWVyIGNoZWNrcyBwcmV2ZW50IGFuCj4gb3V0IG9mIGJvdW5kcyBhY2Nl
c3MsIGl0J3Mgc3RpbGwgd29ydGggZml4aW5nIHRoZSBzYW5pdHkgY2hlY2suCgpUaGFua3MsIHll
cy4gQWx0aG91Z2ggdGhpcyB3YXMgb24gcHVycG9zZSB0byBhdm9pZCBkdXBsaWNhdGVkIGNoZWNr
cy4gSSdkIHNheQp0aGlzIHRlc3QgY291bGQgYmUgcmVtb3ZlZCBhbHRvZ2V0aGVyIGFzIGl0J3Mg
anVzdCBjb25mdXNpbmcgYW5kIHVzZWxlc3MuCgpDaGVlcnMsCkFuZHJlJwo=

