Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A79118DF90
	for <linux-samsung-soc@vger.kernel.org>; Fri,  9 Aug 2024 08:50:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723193435; cv=none; b=RyClXPF0LuZSx/JNk1FOgTy0BexarhEsWZIAGcPIrhIT2wYSbIQYvI4HgS0pkVHIbvcJyxPe/QJHzsPf4kZ3PmNAjx/R/WaT9Z2CeNWjVJdbcsVMJgXbY1wQC97Mg13k6yN3LEyQA0GnB19ftCfr3nXmXrhhn1OIhIJuWu8vbDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723193435; c=relaxed/simple;
	bh=RKgd2zdio0dAosSwWMbaRzFxhkRwCk63+py/Kc6c8tM=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=LazuHJ15Dar9+I2kXfR12haOojOakKjsE9H9uPIh0HxhmizBOarQ4KZKeyT8KTu6fOOKwEei9NYHYgnXyczaPGT1vCOtBEdHWXqzCiJTj6yHhSRCts0wXSY7MiVeSq+WVI4DjZEx+pZVWZy7JdKcfMcsOQZMZ98tvezGWT4bTis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hZ3ILZRA; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hZ3ILZRA"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-428163f7635so13521245e9.2
        for <linux-samsung-soc@vger.kernel.org>; Fri, 09 Aug 2024 01:50:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723193431; x=1723798231; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=RKgd2zdio0dAosSwWMbaRzFxhkRwCk63+py/Kc6c8tM=;
        b=hZ3ILZRA4Cb6x7h6gHe/NlXKMLxiU/iScexTTKQ6KcxDSPN4u8AhCUm6b+x0CwEYe4
         vUkshmMneyR2A8vs7M8LLRovfp+5XLB59aQjPSCqiQdTg4Wc1xDJKcLNMDmd5Z00MCft
         AE+2pjCZ+gvF/sEBQYQtiPaMOTIt+yTyp3T9Bw67YrNHYYeMlEgCc1ioCk1UV+OY+h9c
         EH73R6HOBDTxhgbnOaHmHc4ku17CDoHz741PJIGOh3Dw7XTQksVUH7VOJXx7cZiathcr
         Wh4sfmliswNeCoex9qWS8nU5CE9gN/QSS11Crg90anPP2cAMKphyQR4kmU+Wfx42huSL
         fh1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723193431; x=1723798231;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RKgd2zdio0dAosSwWMbaRzFxhkRwCk63+py/Kc6c8tM=;
        b=K9owQmvluanFaA4zNo9662NPknhuSDlA5EqjLL1w+HsA6sp5+DCPj7mZ9JhVmsdgw8
         cUPAxrmr7ghGRsDvC3trfHSRNk1biMZ8F9xubdg+uGGqHTdRYePzrVhtD2EnUwCeJtxY
         RCV/TwThnP55IuQxcOeawlYaYd2Ba+3opStrDGwyiPk93mhYPzrtqswmhFBv88h530r2
         NR+mPVkjyLO9qUa49m723u5BfNezAUPE765ObcIrhirW4K4lkvhHONyZyLhyfEYuxkQl
         JM9zDEX6GbEik4jKvDm32qZCNam2yZ8QlocZJSCBm7sG+CesuObUGTv7XA2sBFMB3XOe
         a/bA==
X-Forwarded-Encrypted: i=1; AJvYcCXUSmYw+RMhypmXHoJriH4zPHNzd1fYZiKD8lOq5JmIIf7zhaER1IwcUft3YW+HwWXd6r0+pifpDC90zc2jIEJrDIJcUz9urD8gLyRVZk6621I=
X-Gm-Message-State: AOJu0YwXRuaAbbQusr956iN28VjUkA1+gpTCxkVLuI71swor851GcWhi
	EWDls02UiSICOdfVpakDgL6Ai8p5njqzkuBXnNYYRW5rPmElMAa2vpwnJMj1feA=
X-Google-Smtp-Source: AGHT+IHks8Z0xl1ZuEparvUIK2wax152e6XGVPIgYuBOLCPJlgfYzi8d5SJM3ltNVlXRgOLh74uyrA==
X-Received: by 2002:a05:600c:5014:b0:427:d8fd:42a9 with SMTP id 5b1f17b1804b1-429c3a2a896mr5951685e9.22.1723193431326;
        Fri, 09 Aug 2024 01:50:31 -0700 (PDT)
Received: from draszik.lan ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36d27248c80sm4549855f8f.110.2024.08.09.01.50.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Aug 2024 01:50:30 -0700 (PDT)
Message-ID: <596b4d23059e14a89c6817123bfc9a020c28d839.camel@linaro.org>
Subject: Re: [PATCH v6 01/20] clk: bump stdout clock usage for earlycon
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Stephen Boyd <sboyd@kernel.org>, Abel Vesa <abelvesa@kernel.org>, Alim
 Akhtar <alim.akhtar@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>,
 Fabio Estevam <festevam@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Peng Fan <peng.fan@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, Peter Griffin
 <peter.griffin@linaro.org>, Sam Protsenko <semen.protsenko@linaro.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>, Tudor Ambarus
 <tudor.ambarus@linaro.org>
Cc: Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	imx@lists.linux.dev
Date: Fri, 09 Aug 2024 09:50:29 +0100
In-Reply-To: <7fc258e4208a01748ef024f286a85ca0.sboyd@kernel.org>
References: 
	<20240808-gs101-non-essential-clocks-2-v6-0-e91c537acedc@linaro.org>
	 <20240808-gs101-non-essential-clocks-2-v6-1-e91c537acedc@linaro.org>
	 <7fc258e4208a01748ef024f286a85ca0.sboyd@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.52.1-4 
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

SGkgU3RlcGhlbiwKCk9uIFRodSwgMjAyNC0wOC0wOCBhdCAxMzoxNCAtMDcwMCwgU3RlcGhlbiBC
b3lkIHdyb3RlOgo+ID4gK3N0YXRpYyBzdHJ1Y3Qgb2ZfY2xrX3N0ZG91dF9jbGtzIHsKPiA+ICvC
oMKgwqDCoMKgwqAgYm9vbCBidW1wX3JlZnM7Cj4gPiArCj4gPiArwqDCoMKgwqDCoMKgIHN0cnVj
dCBtdXRleCBsb2NrOwo+ID4gK8KgwqDCoMKgwqDCoCBib29sIGhhdmVfYWxsOwo+ID4gK8KgwqDC
oMKgwqDCoCBzdHJ1Y3QgY2xrICoqY2xrczsKPiA+ICvCoMKgwqDCoMKgwqAgc2l6ZV90IG5fY2xr
czsKPiA+ICt9IG9mX2Nsa19zdGRvdXRfY2xrcyA9IHsKPiAKPiBUaGlzIGNhbiBiZSBpbml0ZGF0
YT8KCldpdGggdGhlIF9fcmVmIHdyYXBwZXIgeW91IHN1Z2dlc3RlZCBiZWxvdyB0aGF0J3MgaW5k
ZWVkIHBvc3NpYmxlLiBXaXRob3V0LAppdCdzIG5vdCwgYW5kIEkgd2Fzbid0IGF3YXJlIG9mIF9f
cmVmLiBUaGFua3MgZm9yIHRoZSBwb2ludGVyIQoKPiA+ICvCoMKgwqDCoMKgwqAgLmxvY2sgPSBf
X01VVEVYX0lOSVRJQUxJWkVSKG9mX2Nsa19zdGRvdXRfY2xrcy5sb2NrKSwKPiA+ICt9Owo+ID4g
Kwo+ID4gK3N0YXRpYyBpbnQgX19pbml0IG9mX2Nsa19idW1wX3N0ZG91dF9jbG9ja3NfcGFyYW0o
Y2hhciAqc3RyKQo+ID4gK3sKPiA+ICvCoMKgwqDCoMKgwqAgb2ZfY2xrX3N0ZG91dF9jbGtzLmJ1
bXBfcmVmcyA9IHRydWU7Cj4gPiArwqDCoMKgwqDCoMKgIHJldHVybiAwOwo+ID4gK30KPiA+ICtf
X3NldHVwKCJlYXJseWNvbiIsIG9mX2Nsa19idW1wX3N0ZG91dF9jbG9ja3NfcGFyYW0pOwo+ID4g
K19fc2V0dXBfcGFyYW0oImVhcmx5cHJpbnRrIiwgb2ZfY2xrX2tlZXBfc3Rkb3V0X2Nsb2Nrc19l
YXJseXByaW50aywKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgb2ZfY2xrX2J1bXBfc3Rk
b3V0X2Nsb2Nrc19wYXJhbSwgMCk7Cj4gPiArCj4gPiArc3RhdGljIHZvaWQgb2ZfY2xrX2J1bXBf
c3Rkb3V0X2Nsb2Nrcyh2b2lkKQo+IAo+IFRoaXMgY2FuIGJlIF9faW5pdD8KCmRpdG8uCgpDaGVl
cnMsCkFuZHJlJwoKPiAKPiA+ICt7Cj4gPiArwqDCoMKgwqDCoMKgIHNpemVfdCBuX2Nsa3M7Cj4g
PiArCj4gPiArwqDCoMKgwqDCoMKgIC8qCj4gPiArwqDCoMKgwqDCoMKgwqAgKiBXZSBvbmx5IG5l
ZWQgdG8gcnVuIHRoaXMgY29kZSBpZiByZXF1aXJlZCB0byBkbyBzbyBhbmQgb25seSBldmVyCj4g
PiArwqDCoMKgwqDCoMKgwqAgKiBiZWZvcmUgbGF0ZSBpbml0Y2FsbHMgaGF2ZSBydW4uIE90aGVy
d2lzZSBpdCdkIGJlIGltcG9zc2libGUgdG8ga25vdwo+ID4gK8KgwqDCoMKgwqDCoMKgICogd2hl
biB0byBkcm9wIHRoZSBleHRyYSBjbG9jayByZWZlcmVuY2VzIGFnYWluLgo+ID4gK8KgwqDCoMKg
wqDCoMKgICoKPiA+ICvCoMKgwqDCoMKgwqDCoCAqIFRoaXMgZ2VuZXJhbGx5IG1lYW5zIHRoYXQg
dGhpcyBvbmx5IHdvcmtzIGlmIG9uIGFmZmVjdGVkIHBsYXRmb3Jtcwo+ID4gK8KgwqDCoMKgwqDC
oMKgICogdGhlIGNsb2NrIGRyaXZlcnMgaGF2ZSBiZWVuIGJ1aWx0LWluIChhcyBvcHBvc2VkIHRv
IGJlaW5nIG1vZHVsZXMpLgo+ID4gK8KgwqDCoMKgwqDCoMKgICovCj4gPiArwqDCoMKgwqDCoMKg
IGlmICghb2ZfY2xrX3N0ZG91dF9jbGtzLmJ1bXBfcmVmcykKPiA+ICvCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIHJldHVybjsKPiA+ICsKPiA+ICvCoMKgwqDCoMKgwqAgbl9jbGtzID0gb2Zf
Y2xrX2dldF9wYXJlbnRfY291bnQob2Zfc3Rkb3V0KTsKPiA+ICvCoMKgwqDCoMKgwqAgaWYgKCFu
X2Nsa3MgfHwgIW9mX3N0ZG91dCkKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJl
dHVybjsKPiA+ICsKPiA+ICvCoMKgwqDCoMKgwqAgbXV0ZXhfbG9jaygmb2ZfY2xrX3N0ZG91dF9j
bGtzLmxvY2spOwo+ID4gKwo+ID4gK8KgwqDCoMKgwqDCoCAvKgo+ID4gK8KgwqDCoMKgwqDCoMKg
ICogV2Ugb25seSBuZWVkIHRvIGtlZXAgdHJ5aW5nIGlmIHdlIGhhdmUgbm90IHN1Y2NlZWRlZCBw
cmV2aW91c2x5LAo+ID4gK8KgwqDCoMKgwqDCoMKgICogaS5lLiBpZiBub3QgYWxsIHJlcXVpcmVk
IGNsb2NrcyB3ZXJlIHJlYWR5IGR1cmluZyBwcmV2aW91cyBhdHRlbXB0cy4KPiA+ICvCoMKgwqDC
oMKgwqDCoCAqLwo+ID4gK8KgwqDCoMKgwqDCoCBpZiAob2ZfY2xrX3N0ZG91dF9jbGtzLmhhdmVf
YWxsKQo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZ290byBvdXRfdW5sb2NrOwo+
ID4gKwo+ID4gK8KgwqDCoMKgwqDCoCBpZiAoIW9mX2Nsa19zdGRvdXRfY2xrcy5jbGtzKSB7Cj4g
PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBvZl9jbGtfc3Rkb3V0X2Nsa3Mubl9jbGtz
ID0gbl9jbGtzOwo+ID4gKwo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgb2ZfY2xr
X3N0ZG91dF9jbGtzLmNsa3MgPSBrY2FsbG9jKG9mX2Nsa19zdGRvdXRfY2xrcy5uX2Nsa3MsCj4g
PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzaXplb2YoKm9mX2Nsa19zdGRvdXRf
Y2xrcy5jbGtzKSwKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIEdGUF9LRVJO
RUwpOwo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgKCFvZl9jbGtfc3Rkb3V0
X2Nsa3MuY2xrcykKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCBnb3RvIG91dF91bmxvY2s7Cj4gPiArwqDCoMKgwqDCoMKgIH0KPiA+ICsKPiA+ICvCoMKg
wqDCoMKgwqAgLyogYXNzdW1lIHRoYXQgdGhpcyB0aW1lIHdlJ2xsIGJlIGFibGUgdG8gZ3JhYiBh
bGwgcmVxdWlyZWQgY2xvY2tzICovCj4gPiArwqDCoMKgwqDCoMKgIG9mX2Nsa19zdGRvdXRfY2xr
cy5oYXZlX2FsbCA9IHRydWU7Cj4gPiArwqDCoMKgwqDCoMKgIGZvciAoc2l6ZV90IGkgPSAwOyBp
IDwgbl9jbGtzOyArK2kpIHsKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHN0cnVj
dCBjbGsgKmNsazsKPiA+ICsKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC8qIHdl
IG1pZ2h0IGhhdmUgZ3JhYmJlZCB0aGlzIGNsb2NrIGluIGEgcHJldmlvdXMgYXR0ZW1wdCAqLwo+
ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgKG9mX2Nsa19zdGRvdXRfY2xrcy5j
bGtzW2ldKQo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IGNvbnRpbnVlOwo+ID4gKwo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgY2xrID0g
b2ZfY2xrX2dldChvZl9zdGRvdXQsIGkpOwo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgaWYgKElTX0VSUihjbGspKSB7Cj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgLyogcmV0cnkgbmV4dCB0aW1lIGlmIGNsb2NrIGhhcyBub3QgcHJvYmVk
IHlldCAqLwo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IG9mX2Nsa19zdGRvdXRfY2xrcy5oYXZlX2FsbCA9IGZhbHNlOwo+ID4gK8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNvbnRpbnVlOwo+ID4gK8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgfQo+ID4gKwo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgaWYgKGNsa19wcmVwYXJlX2VuYWJsZShjbGspKSB7Cj4gPiArwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgY2xrX3B1dChjbGspOwo+ID4gK8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNvbnRpbnVlOwo+ID4gK8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgfQo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
b2ZfY2xrX3N0ZG91dF9jbGtzLmNsa3NbaV0gPSBjbGs7Cj4gPiArwqDCoMKgwqDCoMKgIH0KPiA+
ICsKPiA+ICtvdXRfdW5sb2NrOgo+ID4gK8KgwqDCoMKgwqDCoCBtdXRleF91bmxvY2soJm9mX2Ns
a19zdGRvdXRfY2xrcy5sb2NrKTsKPiA+ICt9Cj4gPiArCj4gPiArc3RhdGljIGludCBfX2luaXQg
b2ZfY2xrX2Ryb3Bfc3Rkb3V0X2Nsb2Nrcyh2b2lkKQo+ID4gK3sKPiA+ICvCoMKgwqDCoMKgwqAg
Zm9yIChzaXplX3QgaSA9IDA7IGkgPCBvZl9jbGtfc3Rkb3V0X2Nsa3Mubl9jbGtzOyArK2kpIHsK
PiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNsa19kaXNhYmxlX3VucHJlcGFyZShv
Zl9jbGtfc3Rkb3V0X2Nsa3MuY2xrc1tpXSk7Cj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCBjbGtfcHV0KG9mX2Nsa19zdGRvdXRfY2xrcy5jbGtzW2ldKTsKPiA+ICvCoMKgwqDCoMKg
wqAgfQo+ID4gKwo+ID4gK8KgwqDCoMKgwqDCoCBrZnJlZShvZl9jbGtfc3Rkb3V0X2Nsa3MuY2xr
cyk7Cj4gPiArCj4gPiArwqDCoMKgwqDCoMKgIC8qCj4gPiArwqDCoMKgwqDCoMKgwqAgKiBEbyBu
b3QgdHJ5IHRvIGFjcXVpcmUgc3Rkb3V0IGNsb2NrcyBhZnRlciBsYXRlIGluaXRjYWxscywgZS5n
Lgo+ID4gK8KgwqDCoMKgwqDCoMKgICogZHVyaW5nIGZ1cnRoZXIgbW9kdWxlIGxvYWRpbmcsIGFz
IHdlIHRoZW4gd291bGRuJ3QgaGF2ZSBhIHdheSB0bwo+ID4gK8KgwqDCoMKgwqDCoMKgICogZHJv
cCB0aGUgcmVmZXJlbmNlcyAoYW5kIGFzc29jaWF0ZWQgYWxsb2NhdGlvbnMpIGV2ZXIgYWdhaW4u
Cj4gPiArwqDCoMKgwqDCoMKgwqAgKi8KPiA+ICvCoMKgwqDCoMKgwqAgb2ZfY2xrX3N0ZG91dF9j
bGtzLmJ1bXBfcmVmcyA9IGZhbHNlOwo+ID4gKwo+ID4gK8KgwqDCoMKgwqDCoCByZXR1cm4gMDsK
PiA+ICt9Cj4gPiArbGF0ZV9pbml0Y2FsbF9zeW5jKG9mX2Nsa19kcm9wX3N0ZG91dF9jbG9ja3Mp
Owo+ID4gKwo+ID4gwqAvKioKPiA+IMKgICogc3RydWN0IG9mX2Nsa19wcm92aWRlciAtIENsb2Nr
IHByb3ZpZGVyIHJlZ2lzdHJhdGlvbiBzdHJ1Y3R1cmUKPiA+IMKgICogQGxpbms6IEVudHJ5IGlu
IGdsb2JhbCBsaXN0IG9mIGNsb2NrIHByb3ZpZGVycwo+ID4gQEAgLTUwMzEsNiArNTE1Niw4IEBA
IGludCBvZl9jbGtfYWRkX3Byb3ZpZGVyKHN0cnVjdCBkZXZpY2Vfbm9kZSAqbnAsCj4gPiDCoAo+
ID4gwqDCoMKgwqDCoMKgwqAgZndub2RlX2Rldl9pbml0aWFsaXplZCgmbnAtPmZ3bm9kZSwgdHJ1
ZSk7Cj4gPiDCoAo+ID4gK8KgwqDCoMKgwqDCoCBvZl9jbGtfYnVtcF9zdGRvdXRfY2xvY2tzKCk7
Cj4gCj4gVGhpcyBjYW4gYmUgYSB3cmFwcGVyIGZ1bmN0aW9uIHRoYXQgaXNuJ3QgbWFya2VkIF9f
aW5pdCBidXQgd2hpY2ggY2FsbHMKPiB0aGUgaW5pdCBmdW5jdGlvbiB3aXRoIF9fcmVmLiBUaGF0
IGxldHMgdXMgZnJlZSB1cCBhcyBtdWNoIGNvZGUgYXMKPiBwb3NzaWJsZS4gV2UgbmVlZCB0byBz
ZXQgYSBib29sIGluIG9mX2Nsa19kcm9wX3N0ZG91dF9jbG9ja3MoKSB0aGF0IHdoZW4KPiBmYWxz
ZSBkb2Vzbid0IGNhbGwgdGhlIF9faW5pdCBmdW5jdGlvbnMgdGhhdCBhcmUgd3JhcHBlZCB0aG91
Z2gsIGkuZS4KPiAnYnVtcF9yZWZzJy4gSGVyZSdzIHRoZSBzdHJ1Y3R1cmU6Cj4gCj4gCXN0YXRp
YyBib29sIGJ1bXBfc3Rkb3V0X2Nsa3MgX19yb19hZnRlcl9pbml0ID0gdHJ1ZTsKPiAKPiAJc3Rh
dGljIGludCBfX2luaXQgX29mX2Nsa19idW1wX3N0ZG91dF9jbGtzKHZvaWQpCj4gCXsKPiAJCS4u
Lgo+IAl9Cj4gCj4gCXN0YXRpYyBpbnQgX19yZWYgb2ZfY2xrX2J1bXBfc3Rkb3V0X2Nsa3Modm9p
ZCkKPiAJewo+IAkJaWYgKGJ1bXBfc3Rkb3V0X2Nsa3MpCj4gCQkJcmV0dXJuIF9vZl9jbGtfYnVt
cF9zdGRvdXRfY2xrcygpOwo+IAo+IAkJcmV0dXJuIDA7Cj4gCX0KPiAKPiAJc3RhdGljIGludCBf
X2luaXQgb2ZfY2xrX2Ryb3Bfc3Rkb3V0X2Nsa3Modm9pZCkKPiAJewo+IAkJYnVtcF9zdGRvdXRf
Y2xrcyA9IGZhbHNlOwo+IAkJLi4uCj4gCX0KPiAJbGF0ZV9pbml0Y2FsbF9zeW5jKG9mX2Nsa19k
cm9wX3N0ZG91dF9jbGtzKTsKPiAKPiA+ICsKPiA+IMKgwqDCoMKgwqDCoMKgIHJldHVybiByZXQ7
Cj4gPiDCoH0KPiA+IMKgRVhQT1JUX1NZTUJPTF9HUEwob2ZfY2xrX2FkZF9wcm92aWRlcik7Cgo=

