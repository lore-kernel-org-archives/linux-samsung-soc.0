Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2513455E6D
	for <linux-samsung-soc@vger.kernel.org>; Mon, 29 Jan 2024 10:26:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706524006; cv=none; b=HsUDXCZGoPTqdPfvNtY+F+nS+WrYNBwdzmFWmYkQo7T18eCInWX0nB+treJ9s62xHW9L1HL/Xy0i3s2g90YGmsaIBn24ND2xT3brCY1a/D7WrJDKT/XkM5hqyE8v/MvXr+BxfvGHtMagN1jQJw5YqMXqNLAbfkUXyVHEnBdnstc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706524006; c=relaxed/simple;
	bh=qQPDYqNFKTtJZgfPLIqstPXY62WbL9F9fpeNM+BxM0g=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=VVB41h8bLD9Rma416M6gWOhamHQ0/20EFnfLtU2u4/C1YsEY/OI9l9cIfeXN7NNBGFusL7uuylptLN7COGmvJ/riK2tk0xlp3RtSLc6RNzog+XifZDSFnPmWYs4M1ishV4tGbONspk4zWTqe8DgPSWILYJtdvedlq2KDTMUabSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nHNOHhg9; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nHNOHhg9"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-40ef207c654so11187865e9.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 29 Jan 2024 02:26:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706524003; x=1707128803; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=qQPDYqNFKTtJZgfPLIqstPXY62WbL9F9fpeNM+BxM0g=;
        b=nHNOHhg94m3yiLzXs2rIXxnZcSnocxktoAOz2Tp2yl4c+Z3wqkBAx7lJO/uXSe+qsl
         uZY9v5y76FlHQ/7tA84hnhOfU4kYPpU2tSJEonYuc4/MYSHe91egm1DHwflkZp4HOE0H
         MhhEi+lyp4v2L7gnnVeJi9FPBogbX38viV4KIy5BrnVW2C2pvFNn8FCISNhSrFUbNa9a
         PM/shRWQj0MjQRa7HmPUj0ZsxnTHx9JIBIOANEKHBpW924EGw4ZOsThvNlqbYyBa0r3e
         yYl5lzdbzMrstORifJO5UFilAw7IrI4JUjX0J4HhUaHlT9nfnJbU8Lh8h0qbGsQ9IMfv
         sPNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706524003; x=1707128803;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qQPDYqNFKTtJZgfPLIqstPXY62WbL9F9fpeNM+BxM0g=;
        b=p+G1oy92Eh7p6i7IVMG35HV13JthmBl9/oaMpUnFSDR0AxxiUYa1iImFS8eftrh8Iy
         lqD+WOHN/Ni+k+eCdyLaaVj+E/Ff7WDtHkf8ae75xMrC68v1RcLNTkeGoHExvyouyhxc
         R2rHo31U4fgA9tbwNsgZCjaS0IYJbvpftcczq75kOAffHe4bdq/VumRGwdy4kx3asEKe
         74ulK03gYXrgwCY/ErdA3f49VjOuoiDob9QW7CtvZre0azlfNuD/Ibe/m4CufJ9ySPag
         om+zJpWjz0tRbwvxScZDGjX9Wh5Y23yabg5Zvy19QV3O7/3JjASrhZT1jqPXJznZMv8q
         Nzfw==
X-Gm-Message-State: AOJu0YynYzSQCkD67zmde5Sk3PG8XezqG+5tItoDbqTB7FWOSP7RshjK
	fpGCofHo2BKF0ftrqnjRhnSSEOKfRAR1wHhbGQKhGLVgYJRHfcNYCSt8jbE1JDU=
X-Google-Smtp-Source: AGHT+IFrkgMwW5JA9XnEb8dITynYGKtz4f0avtoo0nrhCnXSt34jRsApPKKQBpw0u3HwgGnZ6lbeXA==
X-Received: by 2002:a05:600c:4f92:b0:40e:397e:16e7 with SMTP id n18-20020a05600c4f9200b0040e397e16e7mr5488679wmq.3.1706524003124;
        Mon, 29 Jan 2024 02:26:43 -0800 (PST)
Received: from draszik.lan ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id bd19-20020a05600c1f1300b0040ed1d6ce7csm9783469wmb.46.2024.01.29.02.26.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jan 2024 02:26:42 -0800 (PST)
Message-ID: <219a57cc21d670c19745a4861e83dd79d4ea2b68.camel@linaro.org>
Subject: Re: [PATCH 5/9] arm64: dts: exynos: gs101: define USI12 with I2C
 configuration
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Sam Protsenko <semen.protsenko@linaro.org>
Cc: peter.griffin@linaro.org, mturquette@baylibre.com, sboyd@kernel.org, 
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
  linux-kernel@vger.kernel.org, kernel-team@android.com,
 tudor.ambarus@linaro.org,  willmcvicker@google.com,
 alim.akhtar@samsung.com, s.nawrocki@samsung.com,  tomasz.figa@gmail.com,
 cw00.choi@samsung.com,  linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org,  linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org
Date: Mon, 29 Jan 2024 10:26:40 +0000
In-Reply-To: <CAPLW+4=rgcftDjd-KDg0G8_JYa9XEBdFB+B42o5JSjEXkr7VNw@mail.gmail.com>
References: <20240127001926.495769-1-andre.draszik@linaro.org>
	 <20240127001926.495769-6-andre.draszik@linaro.org>
	 <CAPLW+4=rgcftDjd-KDg0G8_JYa9XEBdFB+B42o5JSjEXkr7VNw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.50.1-1 
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

T24gRnJpLCAyMDI0LTAxLTI2IGF0IDIwOjU1IC0wNjAwLCBTYW0gUHJvdHNlbmtvIHdyb3RlOgo+
IE9uIEZyaSwgSmFuIDI2LCAyMDI0IGF0IDY6MTnigK9QTSBBbmRyw6kgRHJhc3ppayA8YW5kcmUu
ZHJhc3ppa0BsaW5hcm8ub3JnPiB3cm90ZToKPiA+IC0tLSBhL2FyY2gvYXJtNjQvYm9vdC9kdHMv
ZXh5bm9zL2dvb2dsZS9nczEwMS5kdHNpCj4gPiArKysgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL2V4
eW5vcy9nb29nbGUvZ3MxMDEuZHRzaQo+ID4gQEAgLTQ1MCw2ICs0NTAsMzYgQEAgcGluY3RybF9w
ZXJpYzE6IHBpbmN0cmxAMTBjNDAwMDAgewo+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCBpbnRlcnJ1cHRzID0gPEdJQ19TUEkgNjQ0IElSUV9UWVBFX0xF
VkVMX0hJR0ggMD47Cj4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfTsKPiA+IAo+
ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdXNpMTI6IHVzaUAxMGQ1MDBjMCB7Cj4g
PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgY29tcGF0aWJs
ZSA9ICJnb29nbGUsZ3MxMDEtdXNpIiwKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICJzYW1zdW5nLGV4eW5v
czg1MC11c2kiOwo+IAo+IEl0IGRvZXNuJ3QgZml0IG9uIG9uZSBsaW5lPwoKTm8sIGl0J3MgODEg
Y2hhcmFjdGVycy4gV2hpbGXCoEkga25vdyBpdCdzIG5vdCBhIGhhcmQgcnVsZSBpbiB0aGlzIGNh
c2UsCnRoZXJlIGFyZSBvdGhlciBjYXNlcyBpbiB0aGlzIGZpbGUgd2hlcmUgdGhlIGxpbmUgd2Fz
IHNwbGl0IGluIHRoZSBzYW1lCndheSwgc28gSSBmb2xsb3dlZCB0aGF0LgoKPiA+ICvCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcGlu
Y3RybC1uYW1lcyA9ICJkZWZhdWx0IjsKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcGluY3RybC0wID0gPCZoc2kyYzEyX2J1
cz47Cj4gCj4gSSByZW1lbWJlciBLcnp5c3p0b2YgYXNrZWQgbWUgdG8gcHV0IHBpbmN0cmwtMCBm
aXJzdCBpbiBteSByZWNlbnQKPiBwYXRjaGVzLiBOb3Qgc3VyZSBob3cgaW1wb3J0YW50IGl0IGlz
LCBqdXN0IHNheWluZy4gT3RoZXIgdGhhbiB0aGF0LAoKTWFrZXMgc2Vuc2UsIHRoaXMgY2FtZSBm
cm9tIGEgY29weS9wYXN0ZSBhbmQgSSBoYXZlIGZpeGVkIGl0LgoKQ2hlZXJzLApBbmRyZScKCg==

