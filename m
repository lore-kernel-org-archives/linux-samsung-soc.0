Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A11A19048C
	for <linux-samsung-soc@vger.kernel.org>; Wed, 26 Jun 2024 23:36:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719445012; cv=none; b=FYx6UH1Yfom1wTQqDdlIeffVOWwg5AWgE1ReYWLLu4LidTYfG3fWlZqKkO6YXRSR0CnzElIsV0GX04vCoZAaWOyM4nl7x28Qqz2TsOA/uxZ2gQqXjp3HgpZv3iZ7/p/IFpWvRU3uoTX60MpFFgsUmxOuThLCgesmxxvr587i+2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719445012; c=relaxed/simple;
	bh=z/wAF2IKsQ5synR7GDt8p9XW7wQtUDuAPAF7D3cS6cE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HLsVeJfzGlpFAMx+a5J1h71R3rAwxmPoTNkNmzkYPh3dgeuVFOegtfRLvshXemtIiNJVY/sMzCwMPNhsefVdp3lpExzFdGEL/Awj4r+fcyFsw9XyfWy5CRN9HImj5Kq1uuWSz8TQn797e0rnxUKkVMqxDqkQeuOmZfIX7T2Ln7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=rt3pnG4M; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rt3pnG4M"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-1f70ec6ff8bso44795ad.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 26 Jun 2024 16:36:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1719445011; x=1720049811; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oH/qUWFW4tGC7M67sX1amiT3vWfL3r4iG1qiqBFOKFA=;
        b=rt3pnG4MJ7hLQhRdM8Kke2tbcSbdYgd+gklTSa72kINn5PK0R4a+z2pWzv5tHutOU/
         ukXyCEqqfjJyjDGKw6OCqn0Se6ebzihvRTNSQBIITxrTr6dCDfT53w4M5+UaI7lJ11gB
         htJ4FiEkEIs04OnKIrkKNrUzcNYamSh/se2/qnm6uhh7VVs6EleJx+1PdjnxWlYW/TAM
         +/cdF0BsHd8UIh3qZE2PMUPrORE8WidmUlQaUGTFJ7WPgRun/zTygQ3wnEhGAsoO5Cir
         mVwNcYxOFQUxPdLjbh6XfzRovtW352xivntqyCaUz+EE7voHeOLDRuA6rTg0Rbw29ytf
         uHFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719445011; x=1720049811;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oH/qUWFW4tGC7M67sX1amiT3vWfL3r4iG1qiqBFOKFA=;
        b=PxUvemyr+buv1eCtY2nDkl0K1QJjOWSri2puiDlhRjjnCIa3Kp9B00/K6M9WRxKrly
         QrdKDhug4M59ZqiTuhkHpX/Tc0HMHPgwz63JdYyOzpslAM+ImX1r//QPrKcz6C/Qq3aS
         NVfIIxPL47Wzmtn8sxRmpvYr5WhuaQed0egi+HZGkvr7RKo/qwB5FqZt60No5N8pAj3u
         m4UCKE4kaSK+9n0j4GW+xlwFdm/oOedUqSMePIkW6CUH4SXN10MWdHjjGaoermaeyILA
         3W1YzuQLod/Yp8a2a2G+XMjvgihLBJjyPO1g9/MELKl+blDaizBrXMm4XVMRUicSg/Qe
         sIWA==
X-Forwarded-Encrypted: i=1; AJvYcCWlKPObBgU1kWk+vobHQMiDKAk9cdfKHDJIcs59XBw8FWnYl9KnMY67SP2swqmIxhmMRlyiBBznuEu0IltziEMN9A7ihs2WfE9EeNa2+by4ADo=
X-Gm-Message-State: AOJu0Yy4+McaQ+ScZ+XavTHgXHj9TcTFtU1p0Ni0hHsIoQFpLHv9dtu4
	tRW/todtJmeieaDo8sCwbjSguEwDR4tY9v/avojkPISS5p/SsY95j9SJtZJkWw==
X-Google-Smtp-Source: AGHT+IGWzunzRKU/pxSD5TKBv4BbD7ipJSDwv30o0P4jS2ap96vNu+qiT1InfYybFnYLD+PBVkyeiQ==
X-Received: by 2002:a17:902:8648:b0:1ea:963e:2e2d with SMTP id d9443c01a7336-1faa999a933mr1481655ad.24.1719445010425;
        Wed, 26 Jun 2024 16:36:50 -0700 (PDT)
Received: from google.com (7.104.168.34.bc.googleusercontent.com. [34.168.104.7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1faac9a75b6sm484945ad.247.2024.06.26.16.36.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jun 2024 16:36:49 -0700 (PDT)
Date: Wed, 26 Jun 2024 16:36:46 -0700
From: William McVicker <willmcvicker@google.com>
To: Peter Griffin <peter.griffin@linaro.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	alim.akhtar@samsung.com, s.nawrocki@samsung.com,
	cw00.choi@samsung.com, mturquette@baylibre.com, sboyd@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	tudor.ambarus@linaro.org, andre.draszik@linaro.org,
	kernel-team@android.com, devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: Re: [PATCH 1/3] arm64: dts: exynos: gs101: add syscon-poweroff and
 syscon-reboot nodes
Message-ID: <ZnymDq5Yzd0oyuIr@google.com>
References: <20240626194300.302327-1-peter.griffin@linaro.org>
 <20240626194300.302327-2-peter.griffin@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240626194300.302327-2-peter.griffin@linaro.org>

On 06/26/2024, Peter Griffin wrote:
> Reboot of gs101 SoC can be handled by setting the
> bit(SWRESET_SYSTEM[1]) of SYSTEM_CONFIGURATION register(PMU + 0x3a00).
> 
> Poweroff of gs101 SoC can be handled by setting bit(DATA[8]) of
> PAD_CTRL_PWR_HOLD register (PMU + 0x3e9c).
> 
> Tested using "reboot" and "poweroff -p" commands.
> 
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>

Tested-by: Will McVicker <willmcvicker@google.com>

Thanks Peter. I verified the device reboots and powers off with these updates.

--Will
