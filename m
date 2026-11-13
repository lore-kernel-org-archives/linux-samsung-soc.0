Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794575003;
	b=sQK2PLishoMV0phs6RKWg5BxWzWHH+NzgsCt+91P6RNtAaCeD1G2F/r1BGKyYytaRAUp
	 irjepWqZzww6bCOkDPcBot7uSKGa3AvGmmf8EXSv1d1m8F8a0KBHtaFlQN1gu/sKOlkno
	 Q+nKjD21Vu6hP8IBzbAkA4uDq64leYjpNycGy8xpwlcV/xJxCxJOQynMKWBvSXHi5C8IB
	 9iVlU/UHez98mNWjuWez6A7wGTuhLbeRToII9eREE57o74dWhBE6R40Kaw9I3TWMh7cm+
	 G1TIkLPo2Rn5PQmO2oeanLvmZ+a+wSssh2PdumPrHXuZp4wr86LSVVfyWIo3NJERApA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794575003;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=kKBMVrrjJxWb4uJFICeq1Z/Q6PHnOrbC3VFk2e1elCU=;
	b=qlaS7zhulr2lP4QItnsLpm0BW9hHwwa+swupowS0GHiW4nBJavKqct5w3S/mgKpFMVDY
	 FW2WroOFo3sA3cOgUs36Fmi6VqjbvBpWeu1fcfBEZwzRLgIFh3DWGSpyafgH67UUhS4iP
	 6orKJbbE78hy5Zeglw3Ix36uJnLV7eBTtrepS3nKR8YQXD+OeF+ny6PNEUNoj0pC3n53r
	 CZ3X9Lk7Hn6ZkAKhQ4bPJWMvrjjof7AZh17WKFAfbEQ3WcCkhQCs9GmRyEzZqQJT8rLNl
	 sITzM61P5emv+YPKtMkKRN0Hju7NGa5nrCb80D9g/sa6Rf+SqQ/+RZVFwCO3N1x7gZw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=aJ5s+LOD;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.50
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 568E2606A323
	for <linux-samsung-soc@vger.kernel.org>; Fri, 13 Nov 2026 13:03:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 568E2606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=aJ5s+LOD
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6b47c1a3c74so1917751a12.3
        for <linux-samsung-soc@vger.kernel.org>; Fri, 13 Nov 2026 05:03:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794575002; cv=none;
        d=google.com; s=arc-20260327;
        b=VL6HRN587WdAvUnIQmuo6FJVk5CXg91VY0V8jf/SOY4O49vDPgomHLtEfnUySCr1tY
         buNyR0vxJ/qbjM38IFcRDmpSXsRGQOpXFEiHSzQVUZXup/u0uQn/vOMnjoORnbHi9KlB
         gSZ1tAz4NWe4gfmxk1wlkS8ZT82ikjp6oPXpOJ68ps7WwSmMEK7eEHqERtPVMjGuaJC6
         RTpJ2peWgOPuwl+r+PQYnH+VXJtkiCj4pdU9qBi5TsjBj1NC9/Ptq2bK86vnY4hQtSgX
         a3UrGiKLefjVA/SqUNwdFtPNf11rHa5MIdHskzD/Qn4xKrYub5rse9JUsBxh46dS/hGe
         8Z9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=kKBMVrrjJxWb4uJFICeq1Z/Q6PHnOrbC3VFk2e1elCU=;
        fh=mE9auLqeIuFW95BKfY754BF4YUY1Zv7cZrV+lNTdjNg=;
        b=A44HOlU861aN/7l1vZUimjEIRmUlN+HZSBRqxMkdyB6G8npAFDcHi/f3bclbbVHu0c
         vy7md5J+91iMcuZiEb2HuEbO1eA6nrXOdGB/73jpL8AaloZgdggoda86taMoRz49B1n5
         E7jpATCBMNF573ddgO5kSThAYsCd/hAykS6Xyr76sjbUf5IEYWptcYEM5AyHkYlLpKVm
         Vqv0Wa2iwypsW+BriAetcG1Taz+43+vFvFa67rxwD5MwXVuBs42ZRN8SHdWxmH3VnrOe
         HidEpjw0gx+gIINVWSPqndM/ELV0c9+j0RbCmIqCuMGLyKcXjX1wiEFq+qlpjs6e5xU8
         19XA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794575002; x=1795179802; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kKBMVrrjJxWb4uJFICeq1Z/Q6PHnOrbC3VFk2e1elCU=;
        b=aJ5s+LODrTBmRhVW9mdEBuV0ItjC6oE9WnU0EAlypd9HUuGd33Rc9jHB0ESw55qLVE
         XCHFjKB1r5N8neiJ9MkAxutTT1CFEwL1EexRpPanr+PWI0CLkLZUvTvsVvTxN6blv6g8
         rIek8Vm3FiaW4AzOw7hRkyyD2IOjQI0n1C6iMlUMin4QYzjCbRbbMm6j5pXCwSDAOA1/
         Pl//oWlOy1pK3ECO+xlcOdE532VuYbUsD54UwyDhX4HFHx0IflHDnq4yKGfDbgTzCN24
         fkcSziJ7sCoIKdYIj4YfCbDXBjw8CbH9PrRIRffFgxdKSHpvAj+KGbH5x5+Fy6yaTLdp
         oRPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794575002; x=1795179802;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=kKBMVrrjJxWb4uJFICeq1Z/Q6PHnOrbC3VFk2e1elCU=;
        b=kHq5v4uBb0QOlrVR7Iaodu92qqeLQGySXKCzF+y/n2wrkUA8EySOItL1Sq5+dlnxFf
         a8+Bwc2ZYbFyDwCVCStfHaFoyYorby0hnOI7MMuBX7dRSZ8YdYJCY5lORut5AqMYfi7v
         UxhPhUX7HxqciUlDC+EPJ+xV2470Ay7/PAnzAQS8XeGPKjr/XToCpiapjI80eqGyNccV
         anKFEzBSW6sPVsDtPUKN8d4S2ag8OZsZFhRdfz4cF8WdXxZ6ROMZXXcew9FbLytWaj05
         6vY918LvXr6X0lWTL69HzW7THmENTrbaG+gCh7amitfCITDkKjXMxLNmlk2F/Yzs9h7h
         LOFg==
X-Forwarded-Encrypted: i=1; AL+hErGOmmaRKHvOxP1zdlIy/4KwDHM/woDPOfS6k9m158iDowmcIkxiQbQv9wBXfdQS75l4I0EXJazVerzSBWvwREQRow==@vger.kernel.org
X-Gm-Message-State: APuU4Z8+1qbAXikglIEmH6FVP+aNhA+GSuTkAQ3FURGfjSPb2LZnO7s1
	g2gFXe9mqjd85SqyT2BlKNCQmdILQJHkZEt4AAh1npuc1S0Lgsaud/R8l4QqSDw/etv11pTR6cl
	bw+D39+TpVx0rc0PrsEZeDLbY9Pdj0vsct8e9AjBpng==
X-Gm-Gg: AYBFou0mj90fKgdNvmZm2ydonR+s1mRkUKRPV+2F+WLIfQQeHWTG+2qctilknmbJ3xI
	basFu4XhlFOnhVIdBtfPNPRuu47uAMZEZzJbyZ3b4l1ijq5whheM7BiArCOrFT4c/5iVCBqMY/9
	cQBfBhvHg9o7I70sCprfZrOy1vq7eQ5qtCh3Z+aSMKylWJvUE8bxKfjNguKhAQyuZcrj54UTIFZ
	RCmVwz65kG3sMXambA2/3SH5JoHASoA7LKdsLc2uIh9mczxmH2eUzF7+IugmTFZHTfOxFYqcA92
	j4kmmGTKfnfAt66zFi2robZwS9qA2ztVWKvdMoGHiVVoJqIpdFjsDpO9zg8ld6F6AefegCoWX72
	HlA0N6Buh0HbjLHFkXXVHcSifHu+xPif2Q1TNeJUX2IQST8BAOFaBO6JFUlm+mvvy5Vip6k+kdU
	t/TmtHDyYpKlGrK08=
X-Received: by 2002:a05:6402:c517:10b0:6b3:d0e9:2e87 with SMTP id
 4fb4d7f45d1cf-6b7c08b0a8cmr1544223a12.5.1794575001558; Fri, 13 Nov 2026
 05:03:21 -0800 (PST)
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Post: <mailto:linux-samsung-soc@vger.kernel.org>
List-Help: <mailto:linux-samsung-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-samsung-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CGME20261113104858epcas5p47fb0f4e46302dfe01070f4cd298870ca@epcas5p4.samsung.com>
 <20261113110612.3265841-1-raghav.s@samsung.com> <20261113110612.3265841-11-raghav.s@samsung.com>
In-Reply-To: <20261113110612.3265841-11-raghav.s@samsung.com>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 13 Nov 2026 13:03:10 +0000
X-Gm-Features: AclHuK8TI6TajdXfbmO4ZfXjIUyzkcLZWaP_zfTUGkQ09RFX-UNUsATe86j4dT8
Message-ID: <CADrjBPpUGoWPfmS1Ne6=KnXoGM_vc_X3510xF2zwmqKkGzms3Q@mail.gmail.com>
Subject: Re: [PATCH v3 10/14 RESEND] clk: samsung: exynos8855: add block usb
 clock support
To: Raghav Sharma <raghav.s@samsung.com>
Cc: krzk@kernel.org, s.nawrocki@samsung.com, cw00.choi@samsung.com, 
	alim.akhtar@samsung.com, sboyd@kernel.org, bmasney+clk@redhat.com, 
	jbrunet+clk@baylibre.com, robh@kernel.org, conor+dt@kernel.org, 
	linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, is.gandhi@samsung.com, ts.amit@samsung.com, 
	pokala.reddy@samsung.com
Content-Type: text/plain; charset="UTF-8"

Hi Raghav,

On Fri, 13 Nov 2026 at 10:54, Raghav Sharma <raghav.s@samsung.com> wrote:
>
> Register compatible and cmu_info data to support clocks.
> CMU_USB, this provides clocks for USB
>
> Co-developed-by: Alim Akhtar <alim.akhtar@samsung.com>
> Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
> Signed-off-by: Raghav Sharma <raghav.s@samsung.com>
> ---

Same comments apply here as for the other CMUs in my previous email.

Peter
