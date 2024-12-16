Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4B5E205AA8
	for <linux-samsung-soc@vger.kernel.org>; Mon, 16 Dec 2024 18:54:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734375261; cv=none; b=PZNxJAewJQO26hVW/zGwcNMj3tAiairjaY4VlwM6cQv6ydiZAzL4fGR0yTpp9wFlw5dbMPhNfp/iW5z7/9iRFeChX2udUoUQAqHPYhZBacaB5lD6Y0AuPXFPb0J0C82NDDX1JaNjclCX72yXLBnR0v49qJmqiy4EX+Xkt5+uQIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734375261; c=relaxed/simple;
	bh=+CN3MFvUIjIXgzPDpt7apU1DXFBh0hoCPHWJbqmsbkQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n+YUCQ1tJ4EqYOZ4Q0H0wBL/drA4aTehojL7mEFXjlDQTln4TG9wD01MTRQtkE2P9b1059Mw9JT95IYVfsjHn245dwb0twQLr8UqOag+4ssbkXO9P8+aNTBLioayjRJJ2euTbE49RnenUcYRMt1hfzHWlk09aoLwu4wRxtolbeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=gQjagBjI; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="gQjagBjI"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-725ecc42d43so3799744b3a.3
        for <linux-samsung-soc@vger.kernel.org>; Mon, 16 Dec 2024 10:54:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734375259; x=1734980059; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=690bYW6+JhWBO5SGjqvjGmOT9zUI0kV2wWETtbgOT54=;
        b=gQjagBjI/x3wlc6h/IK3uQbfOn5OB0vrhoewcDgl+umH8td8XE9TUQ0kb9EhrxMpq7
         +grI9IfzB4i1aLypPDKFHQfrQRVr3lESzufxo110LfMcotqo6EZH3ggPxhE98ubROfx8
         7UaJiSjNlUA4I95WHgg7iKAedb0CJnptEEFpwTRLffzT97FbzHHEGTYoOkz6vg//Ik4R
         ImpfitT7puLDKuQqHH++rZ9UFjubK3XduhHUBM2MlwVjZswvUshsffNoChX0la4LGn0w
         5/mTBzglfN44ebL4GfHIfP/sCsc38z5qJ+21lq9PvQsp4yTDj56kuHVtfCLU7n6ZszPj
         M3SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734375259; x=1734980059;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=690bYW6+JhWBO5SGjqvjGmOT9zUI0kV2wWETtbgOT54=;
        b=quyV9Kh6dxbQR0XcjIVX+R16+1RRq1fXzLWDMZTXpdr/wNtrbJFob3mmSWGi/gyVjW
         8zZew4hntkB3hBuRk8k0yfnI6exKnTQGT/4+n0xeZ+vnASqYts27FUtoh7B7YL6LZgtI
         SmBIm9irpqDkpSJPiB+hYAurt/4vFHh99Snkm/8A570mlPIVIJDgocKZnhl2ahRTjriR
         cii9Sk9FCVyTDf1KsSDi2gW56ObfjFZ6o0OIJpmPYAloY1vsAYzgrpCPdt4kvLbIiEUo
         w9Y4ZRsAEEy/Tax8Oo+yWBIsWUbyDLjz8XowHDz+8Co5TW9wyRI3QSSiYZgsI454n9D7
         6nxw==
X-Forwarded-Encrypted: i=1; AJvYcCWNKMn5n0m7x4rkOvPklvgTsE8KPpeZN5+4cJ0GMrfFBxYZGWvzbOQvTSesDyCQgjDM1xn/1bsNm13rb+DKRrj+MA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2bf2U/w6+RXlfr452qoQ+5WM2iBwTPTWm6vHLt5ifpMh9bbeL
	mfDwrZzDIcnA6z+csZHodgZxcw5X9/HueNf4DogXlVqjXAsQqUMrcOcFGh1YHQ==
X-Gm-Gg: ASbGnctMoXFIdfIIqAurTkkMoXoDjm9MzJuc5OcuqyYGGKqHrAyp1zKJcHkarqJXBvB
	0DdORtBz8Q2OWCeDYoNga8bMrzQsQ8k20Naskrdsuif1+0ILdLWfA04QNhT5u2Vgz2HQfcQuoXS
	jW79lO6YH7qb4zUPlrnA2QA+p+wjcTElH02xN7R0R7wJ/jQoqlco5aPuAuQ6lbqBT26AgnN/s6L
	oM+qnjytnEkEhdKSFTyjwMawdrerCGLCWM3vf4lza+W0aYp59b9NJvzh89oqdNsZ12BXpzKm6Au
	sGolbXCOVUQSlKU2hLGsndWv
X-Google-Smtp-Source: AGHT+IFLkxN//qOcEYYuBjw4V9elaQ3W3HVovjotDyIMx9yQiA5AcZ4RTDQhTqISuW2kKbScrkRKeA==
X-Received: by 2002:a05:6a21:1796:b0:1e1:9fef:e960 with SMTP id adf61e73a8af0-1e1dfc0970cmr19290101637.6.1734375258877;
        Mon, 16 Dec 2024 10:54:18 -0800 (PST)
Received: from google.com (123.65.230.35.bc.googleusercontent.com. [35.230.65.123])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-801d5a90832sm4476417a12.11.2024.12.16.10.54.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Dec 2024 10:54:18 -0800 (PST)
Date: Mon, 16 Dec 2024 10:54:15 -0800
From: William McVicker <willmcvicker@google.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Peter Griffin <peter.griffin@linaro.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, andre.draszik@linaro.org,
	kernel-team@android.com, daniel.lezcano@linaro.org,
	vincent.guittot@linaro.org, ulf.hansson@linaro.org, arnd@arndb.de
Subject: Re: [PATCH v2 3/4] arm64: dts: exynos: gs101: add ACPM protocol node
Message-ID: <Z2B3V78k2ibIdLYh@google.com>
References: <20241212-b4-acpm-v4-upstream-dts-v2-0-91b7a6f6d0b0@linaro.org>
 <20241212-b4-acpm-v4-upstream-dts-v2-3-91b7a6f6d0b0@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241212-b4-acpm-v4-upstream-dts-v2-3-91b7a6f6d0b0@linaro.org>

Hi Tudor,

On 12/12/2024, Tudor Ambarus wrote:
> Add the ACPM protocol node. ACPM protocol provides interface for all
> the client drivers making use of the features offered by the
> Active Power Management (APM) module.
> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> ---
>  arch/arm64/boot/dts/exynos/google/gs101.dtsi | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
> index 04561e15b96c..8c3f07371912 100644
> --- a/arch/arm64/boot/dts/exynos/google/gs101.dtsi
> +++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
> @@ -277,6 +277,28 @@ apm_sram: sram@2039000 {
>  		ranges = <0x0 0x0 0x2039000 0x40000>;
>  	};
>  
> +	firmware {
> +		acpm_ipc: power-management {
> +			compatible = "google,gs101-acpm-ipc";
> +			mboxes = <&ap2apm_mailbox 0 0
> +				  &ap2apm_mailbox 0 1
> +				  &ap2apm_mailbox 0 2
> +				  &ap2apm_mailbox 0 3
> +				  &ap2apm_mailbox 0 4
> +				  &ap2apm_mailbox 0 5
> +				  &ap2apm_mailbox 0 6
> +				  &ap2apm_mailbox 0 7
> +				  &ap2apm_mailbox 0 8
> +				  &ap2apm_mailbox 0 9
> +				  &ap2apm_mailbox 0 10
> +				  &ap2apm_mailbox 0 11
> +				  &ap2apm_mailbox 0 12
> +				  &ap2apm_mailbox 0 13
> +				  &ap2apm_mailbox 0 14>;
> +			shmem = <&apm_sram>;
> +		};
> +	};

You mentioned in the previous patch that "GS101 has 14 mailbox controllers",
but here you have 15 mailboxes. I looked at the downstream driver and see the
number of mailboxes is defined by the ACPM framework (firmware) which is read
from SRAM initdata. Dumping that, I see there are 15 ACPM channels. Have you
looked into into extracting the data from the initdata SRAM address?

Thanks,
Will
