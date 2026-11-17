Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794917999;
	b=Ed94XAvZSnSEoi3/7qCK2VlAW443/3FguSVd295MTtMHPwYm14KlhSs2WjcbXjsenmDh
	 rciAWaJrHteFbjtohcGtSFonZ4D1d1kCwNp4bexV21ZIDDnN7jBqvrq7xAV4m5Rolxwei
	 U+dAcnMr3GjoPR+BoWlAg1gALCT7oDqho0vaVH2kwy6nL6xOWBqMg6Zg9WoA1/NG9IQNz
	 Jfobd7eYGZeDdlqouhZdI0ogSLt9s4F6mlcmjQ0KlzlsImJl9xewo8QDSFPYo2YjKJOU5
	 1HKks0iAXpqgtT56QOCDKweWBE0JGIUtGsnXFgGlaF55o+8l07LN9AwlOypSBN4+1gA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794917999;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=ZFVJi+i+sc9nYgluytKQGXSriWb6Sc1xPMl64Y6JsfM=;
	b=uxIvMO6kl5G+8dLJlMhT2EGBIjzRmZTl+l1GtOMNmb2L84DUFQLaKL0ly0PWpKpnlUrQ
	 ZsVwTnzzGapdY3GvUPvfxZzMWveuZ9zP59GClLZCEi3Z9a2SSPXSzrXlMnnZ+BLZZd8VU
	 VOoz9F6UVpGqJoPpzZwfs0nLzaCWKbkb/7/ED6qDbFssyncurhBd/etuBIb9FcLmWpHIY
	 sJib9ATdlRbLlu+jZfnnQOtbpgnRB8oWT3xzmU2OuFmCPuvgKeb0aflBoYVE2mtgAA8R5
	 QaSPMhhQmJvzTfqYMCQ8N4tzl9KItc+D1iznchPd3eh5EAt/hOtbYSJ/spZU/TwA5xQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=oz3feJS1;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.48
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBD19606A883
	for <linux-samsung-soc@vger.kernel.org>; Tue, 17 Nov 2026 12:19:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BBD19606A883
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=oz3feJS1
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6b757029223so5589570a12.0
        for <linux-samsung-soc@vger.kernel.org>; Tue, 17 Nov 2026 04:19:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794917997; cv=none;
        d=google.com; s=arc-20260327;
        b=VsTLm16E0BhL0iZPWDnqwBXivXNvOX4RozLA1qb0Le4IRuVGHz1fhKASldj2YExNHg
         F/J7n5Dp5Iyu7KzyEuCqqh/A+4grlzBSwP0JV+k1I/086roIBM1a0gzgfVLQXFCzUi3B
         CatEiqbqNSBchUF3goV9uOyTZIaBIhnedRAVkmCaWRgE+etl5e6tBRQEncAqHjSiASac
         r9lhLTLvTItd0HYVq8NVbEP/V03Gq5/16XiiEHAQ3PSDz0Woii6pAOTH5jkl0rs3bs7p
         2CFUYtGnrCv2Ab4IpX/FuzuJqfrv1UlkTQd+dzR2DlH3VhvQ/1jmzufkdCR4Wqqa0n/+
         DjNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ZFVJi+i+sc9nYgluytKQGXSriWb6Sc1xPMl64Y6JsfM=;
        fh=NHgtVmbuAQPN2XlE9WIy2WbcALrKLO3xaHDIQBgAnJA=;
        b=hsvDKVgYx0o5yRibnFtncwYmIjuRt/lqrkUjilCXFOraZXt9CaXr+U0AMQt4wgS7Ph
         CTRmJAF1kR8Wntc9Ov23pbKJw4VmzTlj8P/ouUBRuLuWZQqcjw55V8pWACA+QRvPoa08
         ALLtS8Ib8GJZDDfoxKv/HhCiNbz24wCVl1uSiP36Jy67u3fs3Gfzqm/ZrOym49EeJZED
         BgqIkGLe4EgHmOgAax+Cab0JIzdzMDKwdXknJYAG/L1kb93fI5ECeZvlQ/eStGIFCaDo
         DRSrkwomG49kSegk/Mx7DG/7oj3hZtqTi4LiqhhpFpLWh6fyuLzY5Tx3P49Swm4OcSWZ
         YbGw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794917997; x=1795522797; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZFVJi+i+sc9nYgluytKQGXSriWb6Sc1xPMl64Y6JsfM=;
        b=oz3feJS1iAIJQC7p7Mwm1JmwyC1qiU6R72jdHYTvotIELPBf9qMxlog1xtibjUkxgU
         3zG+MEu723WNTYbZ5YYZ8Df56Vtx50NLmAXa5i++s8nTZ2uAI4gVwwNpLP/o2CMOe4eg
         lF9+9E/74uoDjUdpcR1MCP2KgEwHgeOmiBdyGWB0q2UqyXLTtn4QTeLYg3nPdTtix8Qh
         DRZkorWs7NAj+2mcAE1YNat0DZsk868MZmh+EYRECG3mmX9gLw65JkdgO2RlO30SdaLL
         0D5aKyBpnYENo+0zdqGX4kjkEDJ3fKeUAVtbkK/FnkbcHPAiBvFkvzVrHIIKxVHXw2aq
         sd8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794917997; x=1795522797;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ZFVJi+i+sc9nYgluytKQGXSriWb6Sc1xPMl64Y6JsfM=;
        b=ypOJWJAHwvF+GRyhtmzcg6VvepRYq2qfEnwAESiZE6zWcSzWbktaJ2tHLfwoCEBDFZ
         o8GCAPAWqbVDdQkHuyVQhO0/UuiJ7q8rmEg3UVP2VdN/ZNPoh2Gg6oK+KwyHG2izaRCz
         9/8lCwL2jxhK/dhD9GzFFDMGX27vXIwT2wRebDIjK/c08PZ3wyao+rz41FsEA4T2/D2M
         03yy4e2i9TlIw7WicgWDikmc9q/u6ijeRmvnkhlS88xiJ4j12YOJ9Ita3lY+76LmqSFq
         iqwQ42MSAyTy5T1ER9Wq2I21oyVc7v8NueWsHKpTwhLVmjFK+0XW+gVnVK+pcsqJHFLq
         Zs/Q==
X-Forwarded-Encrypted: i=1; AL+hErEUMjacnMtYedMffy7DYoC8j78PsRzU+B1twYLwqQExhMyjKHpgaI/Q2k7Iv+fFgus4GtDmvP8+hsn0dhE9jO3O7A==@vger.kernel.org
X-Gm-Message-State: APuU4Z8teSHFt/IwqFkIY9i3n9erNCtKeuBY85BaJvpXtO/qedlNMU36
	0e9p0i5Jw2uj7kR5/qbA5RzPUKqSmqwbl4n5FcrA6xf2/K/8bHlpYKuU4eRatfzDgTdArYRgank
	IhmJ46U523eb+YHCXcwtDaSVAs284DiZH3vPNvo9lYA==
X-Gm-Gg: AYBFou10PTo9i9Pys4Qm48456eEICKNciOIsb+tPwVRIv5E1h3tMKBwOFgIu2YH6lTO
	+8ydzK5JfdQ94FlmO+EBpWvnjPsD5xVhUXl3SL1zGk/WUL5eyxNKnkUrNmY/fIDAwhUA7RgfyU1
	2BhdpBvuQoK/ltCKZ1ORJEKceyGXmHk5Z6X00ojMhvEXj8z0awIwAL/tkfEd85ZIK6kVzyD0ZHJ
	tl7lLYc7X5UNeKkWRYKBXeib/b6B6ZP1hjX9pzvTWUOZERm2hjosjCQ2zXqLJ8HL4T0Zrr4bHNB
	hrTV3GnzZkjNiLgPV6nzNGKRIWlIwgFjNvQtxxbwO6mbV+Y7SlqN6lT7JsSOpsLsu2o/IknrpVx
	aDTyB9edndlz0gDLmAogdpfPi9X2CEJ/7rJAh0/qer2L2lM/IWHSIjmp1zjWjIbmr/CbrD0M3E1
	OXXnpK/Q30WpzS9HPK
X-Received: by 2002:a05:6402:1ed5:b0:6b7:e861:8f50 with SMTP id
 4fb4d7f45d1cf-6b7e8619543mr6865668a12.37.1794917996838; Tue, 17 Nov 2026
 04:19:56 -0800 (PST)
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Post: <mailto:linux-samsung-soc@vger.kernel.org>
List-Help: <mailto:linux-samsung-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-samsung-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261116-b4-iommu-passthrough-devs-v1-1-dc5b493f7551@linaro.org> <20261116174238.GC2299285@ziepe.ca>
In-Reply-To: <20261116174238.GC2299285@ziepe.ca>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Tue, 17 Nov 2026 12:19:45 +0000
X-Gm-Features: AclHuK_ulY4P51VnkuhR_K0XogE5A7oe02gNjInWa6kLbfDjJ1Wh2QAX_5471Bc
Message-ID: <CADrjBPpyhKcvdH=jxiGSN46SZoFahaBdH4fAQ5KEzRvH_C3AJA@mail.gmail.com>
Subject: Re: [PATCH] iommu: Add iommu.passthrough_devs early command line parameter
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Mostafa Saleh <smostafa@google.com>, 
	Daniel Mentz <danielmentz@google.com>, Juan Yescas <jyescas@google.com>, kernel-team@android.com, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Jason,

Thanks for the review feedback.

On Mon, 16 Nov 2026 at 17:42, Jason Gunthorpe <jgg@ziepe.ca> wrote:
>
> On Mon, Nov 16, 2026 at 05:37:45PM +0000, Peter Griffin wrote:
>
> > Instead, I propose handling this in the generic IOMMU core via a
> > kernel command-line parameter. This makes it available uniformly
> > across both Device Tree and ACPI systems and across all IOMMU drivers.
>
> Something like this could be useful, but also Leon's series will allow
> userspace to do it from the initrd too. IDK if that is more/less
> interesting to Android.

Could you point me to the series you are referring to? I want to be
sure I'm looking at the right patches :)

>
> >  static unsigned int iommu_def_domain_type __read_mostly;
> >  static bool iommu_dma_strict __read_mostly = IS_ENABLED(CONFIG_IOMMU_DEFAULT_DMA_STRICT);
> >  static u32 iommu_cmd_line __read_mostly;
> > +static char iommu_passthrough_devs[IOMMU_PASSTHROUGH_DEVS_MAX_LEN] __read_mostly;
>
> We can allocate memory at this point.. No need for a fixed array.

Will fix.

Thanks,

Peter
