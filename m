Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2F67284665
	for <linux-samsung-soc@vger.kernel.org>; Mon, 19 May 2025 14:41:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747665675; cv=none; b=qnpkkx1sxaSLmSIYWEzBmKHNm+a6rwiNhXRT0g10qjhNdcEsmM4lwQzZDkyzXjjQ5FthhS09Ieq9cl9xXZkCX8BeTjP+UKQwKftUo8iHrMMdcvJJNkCs55eGUmzOb5DU2TOvO49dX+jNn1FFlxurxi2cLMH67RPd5LgxAgRt2gE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747665675; c=relaxed/simple;
	bh=PXgngoiMruUqQcJAJ36RBgxyhu0aqtovmZVT2JgqK6o=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=XbDhHSCvjL1x+WPIRiDMlmrTJuEhsU47OtkIFVP2BxeT8M3rVrjjEHAQQ/hn2NNhEaTh3ToImdKFFHfhesQvRIa5a0te4KTur9u/ZNrocBXXOt7riTtsKUrNV6av4I3JmK6FNCr9WwDN/9yqODtoJScWOwQgbA6YPEiTvgP/Dnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Y/HVMwht; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Y/HVMwht"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43d2d952eb1so35633095e9.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 19 May 2025 07:41:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747665672; x=1748270472; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=PXgngoiMruUqQcJAJ36RBgxyhu0aqtovmZVT2JgqK6o=;
        b=Y/HVMwht+P6ClZ6FRCjrCwoCe3I3xlb9Pc1ENe3eyrnxucAZrgfMzpAAJqIRdjCKwa
         VwD3RrLBnDlXlCPI4lamDQqm/tQIVASPf3npaxyNguxlUFCsx1SPd65TALcTxiGHNDQe
         ejVCQJJAn3l+QMhlLGwtj5yV8Mrnv7TLzYuU7oMFEDAOAyX6Cn5PPFDDLtbgJbwh0Zd5
         AceMZQFp0slKw0XGl9hLLp4cLObt9nvcSMJ6HAuFE/SzD2ZxTbXtzVh9htMjlH78hcOS
         iAygszZQG/42m0EE99WBLZKBXiXD0hHG+b6GHi/uNEzps06NFtFLBBwj5RMnb6OhkiV9
         ztog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747665672; x=1748270472;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PXgngoiMruUqQcJAJ36RBgxyhu0aqtovmZVT2JgqK6o=;
        b=tcrNVJ0dh8iw382I7LZqm3yLQcZYrbNWkgXrZ1vhHrQxTgQAWSHvknFXn4pQbgoaNx
         woc1u74bKZSZZa9d4upTy1aVOgpTXZJ8yxk4ftI7BTR06OwciI1xJt8Gh8F25V0ufWmO
         S82pxOcquDrqaU1RHknj1JEisvPjNLZhEf3AvsF21ahsMmjZfk328xMs4m+8gOyclFeM
         JWH3qZtJjWdjXfFRByjCzauOOq79toeKfe5jRmVKdzxFjQa4syzINmGAGhz/oeuitSVE
         TI6d9mHKKGhuU/7QaPcgbdySKexf8CUEVIHYsadjprBATOgI2dwkyfHmnX6CmCy2kQn0
         9vtQ==
X-Forwarded-Encrypted: i=1; AJvYcCUSy5bFtSS/s7WyzT1ZUGx6IcrkvJhUQySs8WNe3oFTWPgXfe8IshRuWmL9yQLSz2RuE6SjLFXswfsjbMDLNnBWqg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxPOyR91kKqu5wOuMW481k7/3PMHwi8FC/6HAgwu/NRVeO4/mXw
	TFDWT9iwguzmwiObpe0Jw2sW4o6GeI1ZNo4XqhC8PgrSarJ4Irwbs02IYF0tKafqQIQ=
X-Gm-Gg: ASbGnctGXgR3bxwmadx0Du39/ueTi+LIoBf+KOfJ+nimONBgTPzAfyo6gbbLnpos+EK
	smZt2K9DkWjuPApJ3jqcivZrM6awm6uUdfITLzGHGEmvGfechHuZE+1SlPjuL3aP94Ho3yK/0GL
	Shu3oLy9rReCJ88tpTNwl0MnHM4swyQ0FwssbHN4pYm1u115zzIuT7Ul9unfoias7c9is3Qp9KX
	q283VNA6B6I0r7EHdqxHOPlwDpvbS2wGN9a/V9oQ8hT+ON8HFaaQYHIs5rNC9Ly+wyJ5xvZ9pJe
	qpEhlOqW/Ri8ot1ulF+jHIv7sJiLlNW/N0ScA43bhCLMeTt93Lvg5cs=
X-Google-Smtp-Source: AGHT+IHEhMCIc1i5zg2NHcyMONsLyjwexSaW7YUlCJbZ3CdVo6leSerVam5BZph5FKXtCrhVs3o4xg==
X-Received: by 2002:a05:6000:310a:b0:3a3:6a77:3350 with SMTP id ffacd0b85a97d-3a36a77371amr5540633f8f.8.1747665672038;
        Mon, 19 May 2025 07:41:12 -0700 (PDT)
Received: from draszik.lan ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442fd583f20sm140139625e9.28.2025.05.19.07.41.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 07:41:11 -0700 (PDT)
Message-ID: <905e6cab9932c814a578826329f5e3f944418ef9.camel@linaro.org>
Subject: Re: [PATCH v4 00/32] Samsung S2MPG10 PMIC MFD-based drivers
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, Lee Jones
	 <lee@kernel.org>
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
 linux-arm-kernel@lists.infradead.org, 	linux-rtc@vger.kernel.org, Krzysztof
 Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Mon, 19 May 2025 15:41:09 +0100
In-Reply-To: <24314441936d97a1892474eacdbbd690612de265.camel@linaro.org>
References: <20250409-s2mpg10-v4-0-d66d5f39b6bf@linaro.org>
		 <20250415160212.GA372032@google.com> <2025041715425693974c6d@mail.local>
	 <24314441936d97a1892474eacdbbd690612de265.camel@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.55.2-1 
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

SGkgQWxleGFuZHJlLAoKT24gTW9uLCAyMDI1LTA0LTI4IGF0IDE5OjE3ICswMTAwLCBBbmRyw6kg
RHJhc3ppayB3cm90ZToKPiBIaSBBbGV4YW5kcmUsCj4gCj4gT24gVGh1LCAyMDI1LTA0LTE3IGF0
IDE3OjQyICswMjAwLCBBbGV4YW5kcmUgQmVsbG9uaSB3cm90ZToKPiA+IE9uIDE1LzA0LzIwMjUg
MTc6MDI6MTIrMDEwMCwgTGVlIEpvbmVzIHdyb3RlOgo+ID4gPiA+IMKgZHJpdmVycy9tZmQvS2Nv
bmZpZ8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIHzCoCAzNSArLQo+ID4gPiA+IMKgZHJpdmVycy9tZmQvTWFrZWZpbGXCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKg
wqAgNSArLQo+ID4gPiA+IMKgZHJpdmVycy9tZmQvc2VjLWFjcG0uY8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwgNDQyICsrKysrKysrKysr
KysrKysrKysKPiA+ID4gPiDCoGRyaXZlcnMvbWZkL3NlYy1jb21tb24uY8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfCAzMDEgKysrKysrKysrKysr
Kwo+ID4gPiA+IMKgZHJpdmVycy9tZmQvc2VjLWNvcmUuY8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwgNDgxIC0tLS0tLS0tLS0tLS0tLS0t
LS0tLQo+ID4gPiA+IMKgZHJpdmVycy9tZmQvc2VjLWNvcmUuaMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoCAyMyArCj4gPiA+ID4gwqBk
cml2ZXJzL21mZC9zZWMtaTJjLmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwgMjM5ICsrKysrKysrKysKPiA+ID4gPiDCoGRyaXZlcnMv
bWZkL3NlYy1pcnEuY8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgfCA0NjAgKysrKysrKy0tLS0tLS0tLS0tLS0KPiA+ID4gCj4gPiA+ID4g
wqBkcml2ZXJzL3J0Yy9ydGMtczVtLmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwgMTk3ICsrKysrKy0tLQo+ID4gPiAKPiA+ID4gTUZE
IHBhcnRzIGxvb2sgb2theSB0byBtZSBub3cuCj4gPiA+IAo+ID4gPiBXaXRoIEFja3MgZnJvbSB0
aGUgQ2xrIGFuZCBSVEMgbWFpbnRhaW5lcnMsIEkgY2FuIG1lcmdlIGFsbCBvZiB0aGUKPiA+ID4g
ZHJpdmVyIHN0dWZmIHRvZ2V0aGVyIGFuZCBzdWJtaXQgYSBQUiBmb3Igb3RoZXJzIHRvIHB1bGwg
ZnJvbS4KPiA+ID4gCj4gPiAKPiA+IEkgZG9uJ3QgdGhpbmsgdGhlIFJUQyBwYXJ0IGRlcGVuZHMg
b24gdGhlIE1GRCBvbmUgc28gSSB3YXMgZ29pbmcgdG8KPiA+IGFwcGx5IHRoZSBwYXRjaGVzIGlu
IG15IHRyZWUgaWYgdGhpcyBpcyBmaW5lIGZvciBldmVyeW9uZS4KPiAKPiBSVEMgcGF0Y2ggMjcg
ZG9lcyBkZXBlbmQgb24gdGhlIHMybXBnMTAgbWZkIGNvcmUgZHJpdmVyIChkdWUgdG8KPiB1c2lu
ZyBlbnVtcyBhbmQgbWFjcm9zIGludHJvZHVjZWQgdGhlcmUpLgoKTGVlIGhhcyBraW5kbHkgbWVy
Z2VkIGFsbCB0aGUgY29yZSBkcml2ZXIgcGF0Y2hlcy4KCkFueSBjaGFuY2UgdGhlIHJ0YyBjaGFu
Z2VzIHdpbGwgbWFrZSBpdCBpbnRvIHRoZSBzYW1lIGtlcm5lbCByZWxlYXNlPwoKQ2hlZXJzLApB
bmRyZScKCg==

