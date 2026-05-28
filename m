Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ADB024676D
	for <linux-samsung-soc@vger.kernel.org>; Thu, 28 May 2026 15:01:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779980492; cv=none; b=UcP8fTczKAjv/QN98QJItb8FD1u10AZme5h1uRxixbjACTBIBPBsaOrwdiYxZHgGVq+IZBwHXZz8fjPOcLZuxe9QN5FyWjw/loN8Zwt8l76pRXx4SWdhVxOuPM3ntdnZDhToSXtLO6eG54q2Yt+CNIWeXM58GosvZCc43DY5RDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779980492; c=relaxed/simple;
	bh=9xzyoUE6qOdj6O2bY4JAlCLASTXIu14f/2Bz1bQlr7A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u9DJN3D88Ik8PhcXGTrlSrRW2yvGffdgk7GAcnpoHNs21v9/O4xM3rREy4HWfptv/Gs22Iot2d8lo29Bvj0I5V9iv1ZtOc03b7o/2oxD2Vjn+0f3Udpu9QuULtLaBDKYBJv1E2riSb5WhiZBFhx/LoEat+OP9OTNxKc0pbmnFv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=g/eRvKoh; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=TuWhcrHS; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="g/eRvKoh";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="TuWhcrHS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1779980486;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CBJS8Qa+mR61hdZo89Fp/7Obv2aTJuMCATxA11asNhY=;
	b=g/eRvKohqZLH7NK3tzwyf7Cr3n6rFTjjPvFBg+EfzGVwD00eiPLH0i992GLK8xpy3MpIm9
	NxYD9G4LWzdoz1o2RPJH/NUYoSejR0QouDx/fvHGMzepfDjBR5tELIBgwSezfYD5FnbKrw
	/AEGwdUWQkPHV4TXJvIv4EMtxVtkkMg=
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-511-gGBR8zYEMRG8O4oQMqWxUA-1; Thu, 28 May 2026 11:01:23 -0400
X-MC-Unique: gGBR8zYEMRG8O4oQMqWxUA-1
X-Mimecast-MFC-AGG-ID: gGBR8zYEMRG8O4oQMqWxUA_1779980483
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-7dc18e2498cso20510427b3.3
        for <linux-samsung-soc@vger.kernel.org>; Thu, 28 May 2026 08:01:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1779980483; x=1780585283; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CBJS8Qa+mR61hdZo89Fp/7Obv2aTJuMCATxA11asNhY=;
        b=TuWhcrHSCbDVsh1FhAWXHOHesxZavnhMOC0RiPM35ssQcVyAnC36bspFEDeRjqrT6d
         zWtJGwyi5WBwo8PCL8F6ejSEPlBweCd4UI0xw931zB13gPKDAVsl7KQ7UfxOlFb8KM+I
         DaDKKHbmrQnDcQHftSTtLvjxUJ+7cXWUa2Ft7HZ+619fjsg/c90X0be7hUwDAwYzMXhN
         LyI0BCTZWTvGgND7nKiBZnJHi2+idKVhSxEvuzfZDcTi5kYOwPqH5I9H0enwIjLDJ4Yj
         jf/gPj3u1n8RJKoJP03asjppHxlltUvWILvCpkBaV3Ko9BaMyc+EFG+Y3JCUCpP4EEl8
         XS4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779980483; x=1780585283;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CBJS8Qa+mR61hdZo89Fp/7Obv2aTJuMCATxA11asNhY=;
        b=SZ93er11VjRpcleGocR5Ze/b35C86D4vz43N0jU9hVMAVkI6imeQLkGINSYmnWZ9Ty
         y/aFxFKUlIUa+REuFd5+a+0+7/nCBauXte/H9Buwg62hWij4JyJYaZYiFwSThJCc1Vx8
         Wcl67kWyMWiCPqqjA6kv85dpnnRXyREF7NSqYjZNG+Vsg5cR6HmdkYlSmwY8TAwpp9KS
         xZgoqlRiSw3MixqTgMzjnfgEfdSbl0on1MYz/FLC4hwNtxUfvfu3kwBErKBQVeDb7DkF
         qr/CU+B7BbBnzo0Mkq5WozHInIyytOfU33aCgzb/fRaqKhke/0hH+R50WJEZuQoKj0FX
         Rhmw==
X-Forwarded-Encrypted: i=1; AFNElJ8TbUBgNj2tkeLeRJCF9ZejNtwEXPBGNj6o8gi6RdwFLIyO8XICMnJWPheax6FClgZKE496LIBFmcfTCe0TRW6ibA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyZ9X6N4z4x87nlQrl+Wc5SC/FpFZU7qEwROcYqMOqS+CdhXDsP
	gPAQw3hiT1AZg0iCxq/svXqwcVRA+GQtn+JXdYtmDtpxQGMinrYKfWL3ihNPdWAi/PaQVplql3/
	CDMiG3gGuImqOMxpcXFqEoDtusNi2+SFJY0YuAEWCWCsQCsiCebfZRtxcmgYNivUHaM8hDNhi
X-Gm-Gg: Acq92OESBy0Ka84A9bKyqdkc8RRaIMAeCWcHygfEqihREYUffy6/eevehGd2lETjVha
	DlDvspMV/tvSQOmlErjHnibMCPhQejAbbd//joAwZYGT0vZzaT2obDdBjLQcC0hAn3yyEYuGS9l
	CK938Bpxma8zLhTpvCpOhNPI5sXEdsYWE3C4oFp7mgGtxzAfBy5NyfrwC/RcQSYFv75nfBGNk+S
	91Vphgj83sVEdCTo4FMjJ2DUyQfdzdOwKWffJAza+wWf94Mt3bogR7DUA8gjq9lzhRIs13cfoAv
	qDh7OfMhiHFCU9FpeN8E8PHVkZhP0hbF3C2xAuOEmljIS2OZdGiPVZqV4T2fYS5T+bhPSTHUUhN
	mLif5pF/yCe+Mrf//CA1iITPbSx9ZwEnHZN9cHM+3U1P29Rg1EWqqD/ErriUiTJLV5kw=
X-Received: by 2002:a05:690c:6901:b0:7db:ba77:89a0 with SMTP id 00721157ae682-7dbba77995emr58160177b3.35.1779980481566;
        Thu, 28 May 2026 08:01:21 -0700 (PDT)
X-Received: by 2002:a05:690c:6901:b0:7db:ba77:89a0 with SMTP id 00721157ae682-7dbba77995emr58158977b3.35.1779980480727;
        Thu, 28 May 2026 08:01:20 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ccdf274370sm5674976d6.32.2026.05.28.08.01.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 08:01:19 -0700 (PDT)
Date: Thu, 28 May 2026 11:01:11 -0400
From: Brian Masney <bmasney@redhat.com>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH v1] clk: Use named initializers for platform_device_id
 arrays
Message-ID: <ahhYt69wr3vg8A24@redhat.com>
References: <841cf835a24bb2f3acb99a97bb58e583220e03a2.1779963984.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <841cf835a24bb2f3acb99a97bb58e583220e03a2.1779963984.git.u.kleine-koenig@baylibre.com>
User-Agent: Mutt/2.3.1 (2026-03-20)

On Thu, May 28, 2026 at 12:29:38PM +0200, Uwe Kleine-König (The Capable Hub) wrote:
> Named initializers are better readable and more robust to changes of the
> struct definition. This robustness is relevant for a planned change to
> struct platform_device_id replacing .driver_data by an anonymous union.
> 
> While touching these arrays unify spacing and usage of commas.
> 
> Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>

