Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56B5125B1D2
	for <linux-samsung-soc@vger.kernel.org>; Mon, 12 Jan 2026 14:32:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768228334; cv=none; b=dHpmajNxp3pp/Itysmd5w90xuIHJsKjixKUHI4hYzPC5iI9yNPc8O1wfBIt8tw5B6JFqvtC/S1ykAqckkqcGu9ncft3imxm0Knojq4FWk6tv/0tcNMWYJa1oU0/NEhYxIrBSuk1rYPVALsmaT5e0y5pGSwerMKlheJJqZxT7DXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768228334; c=relaxed/simple;
	bh=FfbWO1aGuOn2uSoQoraer2tqN4rBchMXS5VzEnX6yfI=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=bGman/FHcodHRSOgwTFLtKomTW45Bs9x92lvM20lqVRERoioRuJ6kCYkG9/IPsAPkTclZe6Uk4zorupv1Wfv4jTW7TkAOw5bYDFSi4NIUVdpnHSqiQZajnNE0Wvcncw3hmJDociPPBOuw9Zx2Dja764jfih9gMZm6YG57Wu4Q+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xJgZjaiX; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xJgZjaiX"
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-4eda26a04bfso78793421cf.2
        for <linux-samsung-soc@vger.kernel.org>; Mon, 12 Jan 2026 06:32:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768228332; x=1768833132; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=FfbWO1aGuOn2uSoQoraer2tqN4rBchMXS5VzEnX6yfI=;
        b=xJgZjaiXNoWBwLhrw9U818ib2IpTDu3i7fMG7wKQevOCu0DYhwpHlIKenbk7WCrq9b
         MnIoqM0kQ/bPHg6js+SDi0n7aPCXTgtfo+RPHmxZSPdtgZr0flf994xVXMxPWMLXnx33
         2K+v7kWNU+JMmqGJ+Yp1AFP9sQNL75gAGTYttgVh5Z8sBXsRFy/gRvCB3GmKEDDisAg0
         NSDT0qag6l5AfHrhY8GGjg4Oq/eac/FfNykaIQajGkHso5BLKMOzAcWlgOHLptz5qs89
         xxfotJN+9CRo2WBgqvLZ9PFbbNmYk6ZS3fQmHahc6ub40W57tTkKyI341EqrCwn1JDvu
         UB4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768228332; x=1768833132;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FfbWO1aGuOn2uSoQoraer2tqN4rBchMXS5VzEnX6yfI=;
        b=RgyiXHF673I21ZNclp4uAnjAAyzl1EjmvZCuDpOVtJcQSNzNXOxTCsHNA90q2weZ/1
         StcAJBXLdoq9sdcsSeYKK83SSjapicX+UuKuP5i47sLkXl4ousWeX6QsBP9heH1jekNb
         3zRSy4rUyCZprx5B5cUUJn6cSgbJdUmzm6/gcIVo5sue4twoCOpj0VV0l2grf33wWCxm
         g22e0vZMgr2CVLtaE3pg58qEG4F8H2wQy4fho2vVPZsN7cVIV30bY8X54CUGuqZhynB3
         9MJteA7+VoJ5gVl84vX8Isrjs4sx/i2FnGyn/WtiTPpqkDsA4Q88R4bQ+RJTNMbLsFTd
         an3Q==
X-Forwarded-Encrypted: i=1; AJvYcCUF29TaLwMfzmzyW3uIT3TZARYr2fAHsJk/KLEY5r7qUe4Im8HQSxTYs0SYzzRz32kFrjrFPACJT2TGCIN5l4u9+Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YwHQ1v350+QmM3VQCUDdFKbscSoCOZlb8lT3NkD2LWST8UAF772
	ka4vWURsfwV2UGlIBh5hUm1FuLJhr6n5fa5L6aW4XcD2fOcZFRd7drptC1SLXIMXSHg=
X-Gm-Gg: AY/fxX4hUQ/v3KFKSXo5tvMI2SbcWYScge35EMg0aYvFfQA4i4TNO9rOvr6BgrbOiUL
	o2XCV/lhgFlp2F5AH32HruTsE6h2JrQiPkE1TieiFx0rgNUVWvjCDRGoe0q8iRBnLyirYnz8hyK
	qDS4tUhPioGp7bICTYrFxAl97t2akZoFe714DxFdvIWvNMldW6ufwlMhAWb0bOjo9IKlzi23MhY
	e35gJgjVPtSNEBmEIZgb6FB820OK4KzVueXRnJWA+C5pky5CHv7zxOwpUioCXh6iZcds8F2KH25
	+zEy36KTRlIGww8Pk8WRipO2ufSqj780JKoA8vxvesFlb3hR8Zwjdi8YITPsYPJKXgeYqpLlinu
	DnUVkD40NVyXFng03RjIs/0FV9T3DEMxZ0OklfmIp9ZzhsiG/zF6ZFySrnrZdj7geo2/KQbh5EM
	skAvWJx4G4HTtKX/QL
X-Google-Smtp-Source: AGHT+IHea1XbblI0vmCFH9AgF6ECutmFZl6Uyg98T0XsIc8dVZ57in8jEwwvFP3O7OjCYMeRYIbGfw==
X-Received: by 2002:ac8:5359:0:b0:4ff:c63c:3ca3 with SMTP id d75a77b69052e-4ffc63c3d79mr136106261cf.47.1768228332043;
        Mon, 12 Jan 2026 06:32:12 -0800 (PST)
Received: from draszik.lan ([212.129.79.54])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4ffa8e627absm122860611cf.30.2026.01.12.06.32.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 06:32:11 -0800 (PST)
Message-ID: <0076e60fb5a4d3a6970d93b4768d4f083baa7a83.camel@linaro.org>
Subject: Re: [PATCH v2 2/5] dt-bindings: clock: google,gs101-clock: Add DPU
 clock management unit
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Peter Griffin <peter.griffin@linaro.org>, Tudor Ambarus	
 <tudor.ambarus@linaro.org>, Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>, Alim
 Akhtar <alim.akhtar@samsung.com>, Sylwester Nawrocki	
 <s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, 
	kernel-team@android.com, Will McVicker <willmcvicker@google.com>, Juan
 Yescas	 <jyescas@google.com>, Doug Anderson <dianders@google.com>
Date: Mon, 12 Jan 2026 14:32:49 +0000
In-Reply-To: <20260112-dpu-clocks-v2-2-bd00903fdeb9@linaro.org>
References: <20260112-dpu-clocks-v2-0-bd00903fdeb9@linaro.org>
	 <20260112-dpu-clocks-v2-2-bd00903fdeb9@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.56.2-2+build3 
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

T24gTW9uLCAyMDI2LTAxLTEyIGF0IDE0OjE2ICswMDAwLCBQZXRlciBHcmlmZmluIHdyb3RlOgo+
IEFkZCBkdCBzY2hlbWEgZG9jdW1lbnRhdGlvbiBhbmQgY2xvY2sgSURzIGZvciB0aGUgRGlzcGxh
eSBQcm9jZXNzIFVuaXQKPiAoRFBVKSBjbG9jayBtYW5hZ2VtZW50IHVuaXQgKENNVSkuIFRoaXMg
Q01VIGZlZWRzIElQcyBzdWNoIGFzIGltYWdlIHNjYWxlciwKPiBlbmhhbmNlciBhbmQgY29tcHJl
c3Nvci4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBQZXRlciBHcmlmZmluIDxwZXRlci5ncmlmZmluQGxp
bmFyby5vcmc+Cj4gLS0tCj4gQ2hhbmdlcyBpbiB2Mgo+IMKgLSBhbHBoYW51bWVyaWMgcGxhY2Vt
ZW50IChLcnp5c3p0b2YpCj4gLS0tCj4gwqAuLi4vYmluZGluZ3MvY2xvY2svZ29vZ2xlLGdzMTAx
LWNsb2NrLnlhbWzCoMKgwqDCoMKgwqDCoMKgIHwgMTkgKysrKysrKysrKysrCj4gwqBpbmNsdWRl
L2R0LWJpbmRpbmdzL2Nsb2NrL2dvb2dsZSxnczEwMS5owqDCoMKgwqDCoMKgwqDCoMKgwqAgfCAz
NiArKysrKysrKysrKysrKysrKysrKysrCj4gwqAyIGZpbGVzIGNoYW5nZWQsIDU1IGluc2VydGlv
bnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L2Nsb2NrL2dvb2dsZSxnczEwMS1jbG9jay55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL2Nsb2NrL2dvb2dsZSxnczEwMS0KPiBjbG9jay55YW1sCj4gaW5kZXggYTgxNzY2
ODdiYjc3M2FlOTA4MDBiOWMyNTZiY2NjZWJmZGVmMmU0OS4uMDA2MjBhYjE4NzJkYjA0ODlkY2Ux
ODIzYWI1MDBjMDA2MmI2NTFmMCAxMDA2NDQKPiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvY2xvY2svZ29vZ2xlLGdzMTAxLWNsb2NrLnlhbWwKPiArKysgYi9Eb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvY2xvY2svZ29vZ2xlLGdzMTAxLWNsb2NrLnlhbWwK
PiBAQCAtMjgsNiArMjgsNyBAQCBwcm9wZXJ0aWVzOgo+IMKgwqAgY29tcGF0aWJsZToKPiDCoMKg
wqDCoCBlbnVtOgo+IMKgwqDCoMKgwqDCoCAtIGdvb2dsZSxnczEwMS1jbXUtYXBtCj4gK8KgwqDC
oMKgwqAgLSBnb29nbGUsZ3MxMDEtY211LWRwdQo+IMKgwqDCoMKgwqDCoCAtIGdvb2dsZSxnczEw
MS1jbXUtaHNpMAo+IMKgwqDCoMKgwqDCoCAtIGdvb2dsZSxnczEwMS1jbXUtaHNpMgo+IMKgwqDC
oMKgwqDCoCAtIGdvb2dsZSxnczEwMS1jbXUtbWlzYwo+IEBAIC04Miw2ICs4MywyNCBAQCBhbGxP
ZjoKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpdGVtczoKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgLSBjb25zdDogb3NjY2xrCj4gwqAKPiArwqAgLSBpZjoKPiArwqDCoMKgwqDCoCBwcm9wZXJ0
aWVzOgo+ICvCoMKgwqDCoMKgwqDCoCBjb21wYXRpYmxlOgo+ICvCoMKgwqDCoMKgwqDCoMKgwqAg
Y29udGFpbnM6Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgY29uc3Q6IGdvb2dsZSxnczEwMS1j
bXUtZHB1Cj4gKwo+ICvCoMKgwqAgdGhlbjoKPiArwqDCoMKgwqDCoCBwcm9wZXJ0aWVzOgo+ICvC
oMKgwqDCoMKgwqDCoCBjbG9ja3M6Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoCBpdGVtczoKPiArwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCAtIGRlc2NyaXB0aW9uOiBFeHRlcm5hbCByZWZlcmVuY2UgY2xv
Y2sgKDI0LjU3NiBNSHopCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLSBkZXNjcmlwdGlvbjog
RFBVIGJ1cyBjbG9jayAoZnJvbSBDTVVfVE9QKQo+ICsKPiArwqDCoMKgwqDCoMKgwqAgY2xvY2st
bmFtZXM6Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoCBpdGVtczoKPiArwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCAtIGNvbnN0OiBvc2NjbGsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAtIGNvbnN0OiBi
dXMKPiArCj4gwqDCoCAtIGlmOgo+IMKgwqDCoMKgwqDCoCBwcm9wZXJ0aWVzOgo+IMKgwqDCoMKg
wqDCoMKgwqAgY29tcGF0aWJsZToKPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9kdC1iaW5kaW5ncy9j
bG9jay9nb29nbGUsZ3MxMDEuaCBiL2luY2x1ZGUvZHQtYmluZGluZ3MvY2xvY2svZ29vZ2xlLGdz
MTAxLmgKPiBpbmRleCA0NDJmOWU5MDM3ZGMzMzE5OGExY2VlMjBhZjYyZmM3MGJiZDk2NjA1Li40
ZWU0NjUwMzY2M2MxZjhkOTQ2MzUzNmMzNDdkZTVkOTkxNDc0MTQ1IDEwMDY0NAo+IC0tLSBhL2lu
Y2x1ZGUvZHQtYmluZGluZ3MvY2xvY2svZ29vZ2xlLGdzMTAxLmgKPiArKysgYi9pbmNsdWRlL2R0
LWJpbmRpbmdzL2Nsb2NrL2dvb2dsZSxnczEwMS5oCj4gQEAgLTYzNCw0ICs2MzQsNDAgQEAKPiDC
oCNkZWZpbmUgQ0xLX0dPVVRfUEVSSUMxX0NMS19QRVJJQzFfVVNJOV9VU0lfQ0xLCQk0NQo+IMKg
I2RlZmluZSBDTEtfR09VVF9QRVJJQzFfU1lTUkVHX1BFUklDMV9QQ0xLCQk0Ngo+IMKgCj4gKy8q
IENNVV9EUFUgKi8KCk1heWJlIGFkZCB0aGlzIGJsb2NrIGJlZm9yZSBoc2kwIGFuZCBhZnRlciBh
cG0gdG8ga2VlcCBhbHBoYWJldGljIG9yZGVyaW5nCm9mIENNVSBibG9ja3MgaW4gdGhpcyBmaWxl
LgoKQ2hlZXJzLApBbmRyZScK

