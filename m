Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B5B53E717A
	for <linux-samsung-soc@vger.kernel.org>; Sat, 13 Jun 2026 13:06:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781356008; cv=none; b=f2SZ2Nh1eKnJ8Ic7g0KACHa7G3zq3QbvorsspTv+3AHKY//vCF1KR3oDcyh6wqWxEvkktfBaoaCbdgcEFV6zDRHK0qmYy++uw9LeQwdeOpFLG6242K1v2qX0lqZKEaW3HUtFbUUFlQGCW/vR46yEXwoIqzOBOIh1/qlQMnNlrGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781356008; c=relaxed/simple;
	bh=N/aP5eDxpyw2n4AsTqEONVjJMGlgTeC3rtTHjXXYzAI=;
	h=Message-ID:Content-Type:MIME-Version:Subject:From:To:Cc:Date; b=LdS5+CJtfRsoBPbyrv0rTIumkC0yTQgDf35e5miLuqJ+1ilyUIO1qZdhHKJejhOOHwJlWAxlVXV+V7zClTn6GSrevlXqNTnXujbAMFwq3/qZ6CokSPE0lp+bBaFu/WIVCRm0vytqHbAH5PsSCq+WOXX+Jht1EwrwyKiB8XVqefM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BPy08EH1; arc=none smtp.client-ip=74.125.82.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BPy08EH1"
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-1384eb94d20so2506786c88.1
        for <linux-samsung-soc@vger.kernel.org>; Sat, 13 Jun 2026 06:06:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781356003; x=1781960803; darn=vger.kernel.org;
        h=date:cc:to:from:subject:content-transfer-encoding:mime-version
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=N/aP5eDxpyw2n4AsTqEONVjJMGlgTeC3rtTHjXXYzAI=;
        b=BPy08EH11QJgztMKs97NWSC2nXQ/EkAD0bKuNp4u16ZrvkLgN1gT0AavIByGhX1bBB
         hFEkGnZl71HldQe8irHuaIPevBpMoCrKrb/Mg6C69hrBX0lP5mBd8lF056YA5MeOM1YZ
         xo2Q+WcBN1zAHreweTs1CjPnK3NBgDkIPoHxtHHL3xCEVAaihB0kwhbtmqK6+S+lQ0RZ
         ZxM49q342oc4BH0TYCBVQcj5FvOUOeZPkCxs+1GVT9y7GCKxctSRa6+7F9v7Old6x0Gc
         UIKEk7eXALThOhFhwgQpGRtw4XKlxfB7ZhOSbiUYx498HzHTYLF0pe04p0vpOkcakcn6
         nE5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781356003; x=1781960803;
        h=date:cc:to:from:subject:content-transfer-encoding:mime-version
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N/aP5eDxpyw2n4AsTqEONVjJMGlgTeC3rtTHjXXYzAI=;
        b=X55QYjvrGTr15HlBX8kwUGtG66pw/2wCShHkaLJ1qtkFmKw4XzBNXKcRkGI5tVzSu1
         Kp+OyGmq6mes1mPrmZ6+OMsiFgpyUSDSrMigxU2OGYyeFj+oDqYLJFzon1zBKoek9wVe
         GCDT+ZPr/Vx9j3ppsnX2zRJTxkMrggTT5qA1aTZDdIGkm/14rSYJ5v/RZMbEJEEovuQC
         I8U/MX71J2xGRbuCpjuM/yMCLEpD6PHtRO00me+rxVSFJuA/3IKhJ57xu4q4bWFAet0+
         nezt8xTYk6RpWFCs3N+J1U0lv0AFz4sVWZhI+3kZG+yY+U027SasoGQfDraAlZnVl9Lg
         q8yA==
X-Gm-Message-State: AOJu0YzR0Bo67W8cU3r28kket/8/Kw55pCo3IOKYud2YcX7kme/U/+zv
	NgvTMrA/3SMxubu/K8BXgIxxVLgeKJQwLytCMpPSykwUD6JnRUuW+XYeUllUFQ==
X-Gm-Gg: Acq92OGWOZf4N44lhdt4LC8O8OOu2yRIGnrC42si9yMC3hCy6eTJw8zV2OetGojtQKF
	Uc7Iy9X7XAM9zCiWvF4vVGfCTE4USdX57bWrz8EXxqTsDT2qz6vvu/JtqP+ScvF7MgwBCLNGr1V
	XCQoN5bs7BvuCfoF0vFO15K2+wlBypLAfFH4kTHOTdhEHgol1QJ0g3k8R+2xyCm745cO1360v2v
	k8CnMmjJ9PO6DXKGEQcR+7uHOKdqs4qoVKwM3intl0/TaJzNzYD4CpDOUjXj187LA47oPGM1YAI
	bGYOEBLzmIHditW0JClYMSiolCir/ajaNXgJIuFzpbmTGG+9NmbOCjdyeRh5tR8nyQMdfJzoizJ
	mHcGgK3RVJLNV2gltGrHpnmWjFeatuHeHBjzJ5Fr2nu0pxcoHu13BgjHrnSi60/8j5agFyi4Zif
	1T2Ro1J7hPuf50aMKpItikWiC5khqwo2yGiebA7Q8=
X-Received: by 2002:a05:7022:619:b0:138:36f:4288 with SMTP id a92af1059eb24-1386f24697amr1581778c88.15.1781356002926;
        Sat, 13 Jun 2026 06:06:42 -0700 (PDT)
Received: from [127.0.0.1] ([38.252.222.131])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1384b9815a6sm5298534c88.15.2026.06.13.06.06.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jun 2026 06:06:42 -0700 (PDT)
Message-ID: <6a2d55e2.bf38ae28.2d8f62.4755@mx.google.com>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: Re: [PATCH v3 3/3] clk: samsung: exynos990: Fix PERIS gate clock
 parents
From: Denzeel Oliva <wachiturroxd150@gmail.com>
To: linux-samsung-soc@vger.kernel.org
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Sat, 13 Jun 2026 08:06:40 -0500

T24gU2F0LCBKdW4gMTMsIDIwMjYsIFNhc2hpa28gQUkgd3JvdGU6Cj4gRG9lcyByZW9yZGVyaW5n
IHRoZSBtb3V0X3BlcmlzX2Nsa19wZXJpc19naWNfcCBhcnJheSBicmVhayB0aGUgaGFyZHdhcmUK
PiByZWdpc3RlciBtYXBwaW5nPwo+Cj4gSW4gdGhlIEV4eW5vcyBjbG9jayBmcmFtZXdvcmssIHRo
ZSBpbmRpY2VzIG9mIHRoZSBQTkFNRSBhcnJheSBjb3JyZXNwb25kCj4gZGlyZWN0bHkgdG8gdGhl
IGhhcmR3YXJlIG11bHRpcGxleGVyIHJlZ2lzdGVyIGJpdCB2YWx1ZXMuLi4KClRoZSByZW9yZGVy
IGRvZXMgbm90IGJyZWFrIHRoZSBtYXBwaW5nIOKAlCBpdCBjb3JyZWN0cyBpdC4gVGhlIG9yaWdp
bmFsCnVwc3RyZWFtIFBOQU1FIG9yZGVyIHdhcyBhIHBvcnRpbmcgYnVnIHRoYXQgaW52ZXJ0ZWQg
dGhlIHBhcmVudHMuCgpUaGUgZG93bnN0cmVhbSBFeHlub3M5ODMwIHNvdXJjZSBjb25maXJtcyB0
aGUgaGFyZHdhcmUgcmVnaXN0ZXIgZW5jb2RpbmcKKGRyaXZlcnMvc29jL3NhbXN1bmcvY2FsLWlm
L2V4eW5vczk4MzAvY211Y2FsLW5vZGUuYzoxMDkzLTEwOTYpOgoKICBlbnVtIGNsa19pZCBjbXVj
YWxfbXV4X2Nsa19wZXJpc19naWNfcGFyZW50c1tdID0gewogICAgICBNVVhfQ0xLQ01VX1BFUklT
X0JVU19VU0VSLCAgIC8vIGluZGV4IDAg4oaSIG11eCB2YWx1ZSAwCiAgICAgIE9TQ0NMS19QRVJJ
UywgICAgICAgICAgICAgICAgIC8vIGluZGV4IDEg4oaSIG11eCB2YWx1ZSAxCiAgfTsKClNvIGhh
cmR3YXJlIG11eCB2YWx1ZSAwIHNlbGVjdHMgTVVYX0NMS0NNVV9QRVJJU19CVVNfVVNFUiAodXBz
dHJlYW06Cm1vdXRfcGVyaXNfYnVzX3VzZXIpLCBub3Qgb3NjY2xrLiBUaGUgb3JpZ2luYWwgdXBz
dHJlYW0gaGFkIHRoZXNlCnN3YXBwZWQsIHdoaWNoIHdvdWxkIGNhdXNlIGNsa19zZXRfcGFyZW50
KCkgdG8gd3JpdGUgdGhlIHdyb25nIG11eApyZWdpc3RlciB2YWx1ZS4KClRoaXMgcGF0Y2ggZml4
ZXMgdGhhdCBpbnZlcnNpb24uCg==
