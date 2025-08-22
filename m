Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAE5A2E7F2A
	for <linux-samsung-soc@vger.kernel.org>; Fri, 22 Aug 2025 10:23:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755858241; cv=none; b=TdS8DOlSli2mxejc3Lf0h/wEQ5TKc5peY1mCdwq/Iq/ciffCWozZGlx+iLw0yP0wasniJpD/qWsOSPuhREEiIxpr8rL9YpeSUPRMoxFocVxunc1LyRuvriCie0+gwLlma5QQacCDhJQe8o5+i0p2BjFgF7xjowQEgcO95ZC6Vi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755858241; c=relaxed/simple;
	bh=Pi24T1VzeRTeyxb78iSx9eOfruahP8bbLgZ7xrrxp9M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mp1+Jqgt7vPXZYrsxASkk3iQyUP6TWSZTd33qidZJDneA4Z9MAYJ9LMVp2zrX1Jkv7JCaH6XYp3nXgFA60+AuW6zZCXNXjikRrgDDvPbABQvj//V3yHccAgJVOgYZllZg8+UH1mCAUM1bU9d7feHu8g97d9lEgU8Wl6Tl1QKo4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Df1LibZf; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Df1LibZf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1755858238;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eJvTKEyEbzhmekaQhrASqnfJY8OZgIJPjxsG4VBPz2I=;
	b=Df1LibZfcCT038kHgiULSf3yMBc0QmSVpolCt1IIGRx00KGNE+NQC2rWV9xiouCzdV03BL
	7we2RefRSrXIk0nX66zvbHYXzR4ywC6nEaA14xyewBpBHjkBZNrHYP6zGJXWddB8BY4DjH
	jekmxmkuxoW9unZXX/EfJYQulJqu6Fo=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-307-Lb1ajCHDOo6S6N4BTJiLvg-1; Fri, 22 Aug 2025 06:23:56 -0400
X-MC-Unique: Lb1ajCHDOo6S6N4BTJiLvg-1
X-Mimecast-MFC-AGG-ID: Lb1ajCHDOo6S6N4BTJiLvg_1755858236
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7e864817cb8so812063385a.0
        for <linux-samsung-soc@vger.kernel.org>; Fri, 22 Aug 2025 03:23:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755858236; x=1756463036;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eJvTKEyEbzhmekaQhrASqnfJY8OZgIJPjxsG4VBPz2I=;
        b=wM7GoLT64QpMrgqTcEypbfadNy74PxXpI2Wv/3feIEjdgRRulmDDFL+a2XpNaQQ79V
         f7fIQlJuSikgmwWZdetyhREvzYlklE+14sYSRur2HB49hi6GLCLhgxg46Cc0BTq2Ejws
         xPNb+thHlJMIZZqq29QByS1GxNPqufLcBrBEV460C4SI0LTu9OVPhyNZZdaf0ZwMJpGE
         2g9QPB3D8ajwktD0zkXHED5+QlcwcjwptY+45PdTx4+a5F+x+E7vCEejFxAZFOTGG2yR
         Kn02oGfmmvM5R8DATzIto++nK/UrX/5aMOCKT/dxBMMikGole1/d3ew1vlNR2DYVJTwY
         Hzng==
X-Forwarded-Encrypted: i=1; AJvYcCWIcC+FVOvyGjHb/yjIky9UDZ2xpM9ZlgyD6ElOJOVnh1d9TxgDrwG5LrKONoDcIXIPhA7+8WjqvRbUjQMSe7Oykw==@vger.kernel.org
X-Gm-Message-State: AOJu0YywkGF7/gY+6od+um4c3sXUCV0c6WdYp0bpQrgXf9q4bE98eeYw
	r7iTtEE7tOwl9dxLOhf7orNFyh6ZENJ8XJsOvELOp+7wy4wBn514QnhIoF4vusLu2R7cjJBJmLC
	gh7CrZWMuCcu2gK8G0+Pmuf/+dHpCCTHikjx8GFPXG883DLvy2SEiB7WJxpjwH4exoyUg220T
X-Gm-Gg: ASbGncubkTbtMJx6ldXAJ4S4YRq6+UtA1L8Y1kvDeh7PCpnv12gNxAxVrcHVWHcTsFr
	pG6fyYs/c9wfuPsj2xP8t7jQzy5tadKBiDJNdLwQPZjTzKVgWBU8dPpUVtRFoniehcAEt3FleXA
	6GXLdsfKf1znfRErrLwwGtZPVoXY08aHkPvpp9ZYYfn2lbJ50iO8Voxy+woAc2hcDaL2ulSahP0
	Gueov+eHDjW1Jw6do5hgWccjnrpf7DBhgpjjjYpNVJwTQq7em6jKNgnFP1QB6oa36wMWb7BXr4G
	gFx+P00Z9q4QitXJV0Eqq7mYCK1JWtVLv4tjdpqbiH8/yNreDfqQzoTueHCH+r4ryI0kA0oGzq4
	VRY6QjI30ZlkUcZWMxpM=
X-Received: by 2002:a05:620a:2985:b0:7ea:61e:3ce with SMTP id af79cd13be357-7ea11515112mr250141285a.4.1755858235934;
        Fri, 22 Aug 2025 03:23:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGzbF5my1f7sWP1hvt+Ae8lWAWkUFPWkmMGpX8yUvMXDR4PmNo9Qp3wmQyKLcPE30uIWwQ98Q==
X-Received: by 2002:a05:620a:2985:b0:7ea:61e:3ce with SMTP id af79cd13be357-7ea11515112mr250139985a.4.1755858235417;
        Fri, 22 Aug 2025 03:23:55 -0700 (PDT)
Received: from x1 (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7eb1123ce2asm16520885a.65.2025.08.22.03.23.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Aug 2025 03:23:54 -0700 (PDT)
Date: Fri, 22 Aug 2025 06:23:52 -0400
From: Brian Masney <bmasney@redhat.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>, linux-kernel@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	willmcvicker@google.com, kernel-team@android.com
Subject: Re: [PATCH 3/3] clk: samsung: add Exynos ACPM clock driver
Message-ID: <aKhFOHFGKPYXgIri@x1>
References: <20250819-acpm-clk-v1-0-6bbd97474671@linaro.org>
 <20250819-acpm-clk-v1-3-6bbd97474671@linaro.org>
 <aKdmurrT1pFtLSI8@x1>
 <720799b1-04ce-46da-b643-1adbdfc661e6@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <720799b1-04ce-46da-b643-1adbdfc661e6@linaro.org>
User-Agent: Mutt/2.2.14 (2025-02-20)

Hi Tudor,

On Fri, Aug 22, 2025 at 09:14:03AM +0100, Tudor Ambarus wrote:
> On 8/21/25 7:34 PM, Brian Masney wrote:
> > On Tue, Aug 19, 2025 at 11:45:38AM +0000, Tudor Ambarus wrote:
> >> +static long acpm_clk_round_rate(struct clk_hw *hw, unsigned long rate,
> >> +				unsigned long *parent_rate)
> >> +{
> >> +	/*
> >> +	 * We can't figure out what rate it will be, so just return the
> >> +	 * rate back to the caller. acpm_clk_recalc_rate() will be called
> >> +	 * after the rate is set and we'll know what rate the clock is
> >> +	 * running at then.
> >> +	 */
> >> +	return rate;
> >> +}
> > 
> > ...
> > 
> >> +
> >> +static const struct clk_ops acpm_clk_ops = {
> >> +	.recalc_rate = acpm_clk_recalc_rate,
> >> +	.round_rate = acpm_clk_round_rate,
> >> +	.set_rate = acpm_clk_set_rate,
> >> +};
> > 
> > The round_rate clk op is deprecated. Please convert this over to use
> > determine_rate.
> 
> I can do that, sure. Shall I also update the kdoc for round_rate(), mark it
> as deprecated and add your Suggested-by tag? It would help other newcomers.

I am working to remove round_rate from the clk core and the various
drivers. Your driver just needs to be updated similar to this:

https://lore.kernel.org/all/20250710-clk-imx-round-rate-v1-10-5726f98e6d8d@redhat.com/

Brian

