Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795098199;
	b=bHuhGbSv1DE81lT8dRb1QTDoes6V4QNOZStu8ZYveutX4BnrkzfROLSw3h5IjSQAdgoj
	 iq58ie8qtoRgL9Dw9S4ijxOfb903wKpHJERCvtW2Ar8ZLL82P1B7AjuiINrOio5tnbzH8
	 Q1V2j/ULKOl0nP3tQoryQmf4IJjBGdyTHN5+rWfqy3DyLKLitBW4O3gYTpMBAI23L9HXC
	 9J5pZmgAcJztGuoGFAjvtql7HkaJvA1uvviFWYDBlsLBRXWlWqEuy3fBP++9Yq7UgXfrj
	 rFdYSkqh8hZjvWwIwJAZ6QqkeejPz9q3j/mNSbsLHNKHDG5DYt9k24+7yZCyIjoFf7A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795098199;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=msdP55vXlTy09UO8puWvvjC8jVxycl34xfHbtsiaeYU=;
	b=arGPkxqq6GZRaJ8tD33oSLuQBtG/nSjfEcKwCiuqxugV2+0W3V2JhwND/Tz2CtK5A9L4
	 aSuLI4u66avxIldHfEOHIzyBYEBh7VvlcgSz1hpY24xt06oyUOpDioFl7WqNUKKu0qzKo
	 IH1hLF2jnriu0Zc8UNOMwehcYtwRm2ICDaD3eiOWTYc9Jg33L8I8UaEjp+cUE2j7nEGYL
	 m5L4jqhSjamI9xMgOCfTF0+c0BM2THzHIASwyuDWmyle0lKiGuNyrB1aztioJpOqTAs/C
	 Xs2a0m5ETbjeuxVYthZuaWA8+we3tnNMEMXGSYXv5GjEZdFRUX1IgZ9r4rnuIZzwctg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZQZx+Caf;
	arc=none smtp.remote-ip=74.125.82.52
Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 992CD606A324
	for <linux-samsung-soc@vger.kernel.org>; Thu, 19 Nov 2026 14:23:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 992CD606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZQZx+Caf
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-1b3beeaf6f9so2874864c88.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 19 Nov 2026 06:23:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795098198; x=1795702998; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=msdP55vXlTy09UO8puWvvjC8jVxycl34xfHbtsiaeYU=;
        b=ZQZx+CafJ5sxSFPQQyG/F1QUdmwM+0jyz51i3cLNmRf0AGkpQ+ZnCpBfBA3HXufm/Q
         Ra+N8okJV3kOThm9oQsZNK89WDQDpzgsvgjiZo+09l8NdlFuhaXfs52Mnz9h6frCUFOc
         EGefdz1RZ3j1CGmvo+566APwO8MNo0OS5m+BsgKG+brlLQsmsaBrAte5hyTKQokS8kQP
         MFYu/TP3mPJuYCEW6UsLsmae8BramVwEubGfKQJd/qHW3Nelkru39Wx0r4BoMyUcC1xK
         8IYI6pRineGwyRr8fGLu0tfblqqACuO7In20mbZSwNXZ+KAlkOJ99QdWYHE8x255pSC/
         cX8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795098198; x=1795702998;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=msdP55vXlTy09UO8puWvvjC8jVxycl34xfHbtsiaeYU=;
        b=DecODkiscO2R/zK++pcuVnY6WJ+DAeaSnIhq6AVGzCabgzoL0R2rtCN9hqlR8T/WsL
         NFnwD03re87wXm3jDoIoo/c4cdhXlid8uxq+WNV5ck18U2htjxh4/n9wyVOTAW2kQMHJ
         X5zmS8ygJPDkgpYmIvxSORZ/7ExrvgqcD9OxKRCHgSMeBsyMxH4oyEMvnpiP+xPD1Sye
         pICwk9fq+ZCJg49s14l0pyMnJ5TVUTAGp/vqXU9tK6Yte2O1Q0q25KLNh2LZi0YXVKvV
         MudrDe8zooKZKShrGeCRVP3Fb1gGx3sGkIahXy0MmUohDa5NQvNLltcwS9D5qMCPw3LR
         42Bw==
X-Forwarded-Encrypted: i=1; AL+hErFqtdEcIM9A7kseL9RcCQPfg3irzLs4mtEDfgTJ45C+7eSpLwag/MBU3xtMerj1wxmMCzxNxwzskXi3FQUY/OrHMg==@vger.kernel.org
X-Gm-Message-State: APuU4Z/dRXt4DC2XL6Y0GwmmMLbybrh+f1dXedSYkSjlpeDSTr6Os9P0
	yUrzn6QG88NPL9B+UcaFLHhpi9nOeIUK6VM4jI0TW2u9bK3FipNqpDDU
X-Gm-Gg: AYBFou1VYfXXKsV6n1ywGhETuSzIMLvOECbNTmlVX3Rw6F13ppPfy4R1SmOks0d8EbK
	yyKewPywE97xf68m30jOJz1xkfHOlWjTpuwzIhnOGkXH8MCoWuphiiD0VvNEFh/FnB79ZdDGpkV
	i92V6VCEsmh9Tswf1i2P2JAxNl3sKrGXTrSR8GKuptkW/gxeq2uA1Rx7dvucTv3efVX7/rnCDkJ
	8Ob7jE4w1XiDg8tXxXtaro5C2gnE84cOBWJeMRsmlT6IM6fGhE0IQn224E/VxaMxwiHNlxrstjc
	DkwjgS8BRTpcrEsmcUTK/cIfkAt4KAAsVv+kSo9Zc+x/dnov+26uICNMkeu8jTziCxSj72tN0gI
	Q0kcsPC7MlBa54ttI/lr1P8azBpCcxZqD+Bx7YRP92Jo7rqdwOkHlqOc/JmAeop9AQZHAcw1TnW
	5qpjlhNQFDMcFatGY4Xo5VVv8hvAtozBPgy9rx2WXjxgn2WBNdVSfWR+L0eC1cZDKuWqCWP6t0U
	tWp+tBjGd3t4jnBTrGerv2Fzi3hABaThKTiAUBbP5psfFhh8izGJxuiEFw2+rR5y9BVwSco7+Is
	UlnCy80wWRGLqpMs+9esIaPmYVSFt103QEzWp7KF62fnHRzPTqeJ
X-Received: by 2002:a05:701a:c961:b0:1b5:10cf:c402 with SMTP id a92af1059eb24-1b543d09a83mr5609963c88.10.1795098197560;
        Thu, 19 Nov 2026 06:23:17 -0800 (PST)
Received: from localhost.localdomain ([103.149.158.188])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b549e398e4sm10306022c88.15.2026.11.19.06.23.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 06:23:17 -0800 (PST)
From: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
To: krzk@kernel.org
Cc: alim.akhtar@samsung.com,
	bhelgaas@google.com,
	jingoohan1@gmail.com,
	kwilczynski@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	lpieralisi@kernel.org,
	mani@kernel.org,
	peter.griffin@linaro.org,
	robh@kernel.org,
	sreekuttan2156239@gmail.com
Subject: Re: [PATCH v8] PCI: exynos: Handle PCIe PHY initialization errors 
Date: Thu, 19 Nov 2026 14:22:51 +0000
Message-ID: <20261119142251.2665-1-sreekuttan2156239@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <0a3b7886-3800-42ee-8e22-80944114dfcf@kernel.org>
References: <0a3b7886-3800-42ee-8e22-80944114dfcf@kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Post: <mailto:linux-samsung-soc@vger.kernel.org>
List-Help: <mailto:linux-samsung-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-samsung-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Krzysztof,

Thank you for your feedback. I would like to clarify a few things regarding the patches 
and the concerns you raised.

The code is not entirely AI-written, as you claim. The reason I sent multiple patches on 
the same day is that I was working on them over time and submitting them as they were ready. 
They were not all written and sent at once. There was a time gap between the submissions, so 
please don't assume that I was blindly sending random patches just to get past the review process.

Regarding the v2 to v9 revisions, I admit that I blindly trusted your Shashiko reviews. I submitted 
the patches on my holiday, assuming that Shashiko was properly trained on the latest Linux kernel 
source code. I also assumed that, since the PCI subsystem uses Shashiko for patch reviews, its 
feedback would be reliable enough to trust.

If Shashiko repeatedly reports issues that are incorrect or misleading, why is it being used as a 
review tool in the first place? Isn't relying on such feedback equally problematic? I trusted its 
suggestions because I assumed that the review system was reliable and that its feedback had been 
properly validated.

Manivannan Sadhashivam also advised me not to blindly trust automated review tools. However, he 
explained his concerns constructively and helped me understand where I was going wrong. 
He understood that I had trusted Shashiko's feedback in good faith. I appreciate that kind of 
review because it helps contributors learn and improve rather than simply questioning their 
understanding or dismissing their work as AI-generated slop.

I'm not claiming that my patches are perfect, and I'm willing to take responsibility for genuine 
mistakes. But dismissing the work as "100% AI-written slop" simply because I submitted multiple 
revisions is unfair. Humans can also submit multiple patches in a single day. That alone does not 
prove that the code is AI-generated or that the author doesn't understand it.

I understand your concerns about code quality, and I will take greater care to verify every review 
comment instead of blindly trusting automated feedback in the future.

I respect your experience and feedback, and I am willing to learn from genuine technical criticism. 
My intention has always been to contribute quality code to the Linux kernel and improve through the 
review process. I hope you can understand my perspective as well.

Best regards, 
Sreeraj
