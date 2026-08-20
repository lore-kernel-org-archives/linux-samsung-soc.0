Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7534037F323
	for <linux-samsung-soc@vger.kernel.org>; Thu, 20 Aug 2026 15:09:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787238545; cv=none; b=LWRZbcBdHVsAK2mYP2cdSwrj7xeahhVc4oDDPVwvDoGskK4Nc+qH2JJ+V+hL4oHujr3OGHetagHb0s4dez7I9jSPHc99YfA1hsRh9YkZaFVLBY0RYIWQGCPXb9WwAG7yYbD+vdCUX51r4J35zJ+jI9SQL+4PoFv2rAk3fWT2rSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787238545; c=relaxed/simple;
	bh=I1DtpNiKv1KnqpYZERtbv20FbK7xO5TjOqNoiX5FaIg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EL8YM2kmdUgGTFMYboQ3dFUTacgoLchAA7c3EgV5BnJgfHCvqRCFaCeWc+Dnx9ajeDH6ygHruqZ1o068i9k919T3VfUDF0ytflTkneZetZxDPxsUHmjL/cA7XZ2T+0rVu+yV6Fm76LgGDtIC2dZZXeprSRj3XLi1sE67A9nLLeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=eSUKvD17; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=X1w8HNWb; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="eSUKvD17";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="X1w8HNWb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787238541;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gJnamaX6JlRGHuZ8sO/4OG43OjrZQHiP9rUJ3vO4bbE=;
	b=eSUKvD17VuzFt1ezUoDVi4h+Do/v8u9+zB6iK0qbYxGUumLhub2eEHBGWcfKtH2lIXxCSk
	uIplCUrsgbw6lQcY+BMRvxRq8LJtjZUdOczMO7fUgQ9D8LL9jrUhVZu8i46SGTRfUDk+NG
	8uzA6jk8EYlyQSE37EUUP9fpOzF1Ank=
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-295-dtM45yvXMGOF8-83QjhIZQ-1; Thu, 20 Aug 2026 11:08:59 -0400
X-MC-Unique: dtM45yvXMGOF8-83QjhIZQ-1
X-Mimecast-MFC-AGG-ID: dtM45yvXMGOF8-83QjhIZQ_1787238539
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-822ce245c5aso67375807b3.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 20 Aug 2026 08:08:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1787238539; x=1787843339; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=gJnamaX6JlRGHuZ8sO/4OG43OjrZQHiP9rUJ3vO4bbE=;
        b=X1w8HNWb/tapYuZDzYmwn4lddtV8e/WhF3vyNs6d6R5K6IbHdfJ+A+avl8BCxKweO7
         AI7bjJww1EwWh9fajvO3QQs/Eyp0cyJeXgpUIu4O8kO4Yj2bSqK14S+EvkGQk8+QAfA+
         KEFBzq+tvIcqVTPlqG7iVq4i4pj3lLPyXWzLDPaN5IxjvNAAaSp1JHWprMzSun1sqwXe
         FRez0axInHrneKlGqOfuZ6IcnEniPOiSdADATuo23SyA5DbOj+uX9qpGl+9XFIIZGFJU
         5BORRToxDJoYJQAoQ+hHv3DynpqUZbtRkBd06VMr9Xr/PkFqHQUOLxKrnSr/G+TkfC5W
         3mMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787238539; x=1787843339;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gJnamaX6JlRGHuZ8sO/4OG43OjrZQHiP9rUJ3vO4bbE=;
        b=ckdJ9ybKwDjMWiIq0jbNzfRNOWfoaxc+YWfjZeplMmza/pBggcNsfBUZP5qAPyuryZ
         Kghk2m2APwZDyVodeDv6ZQvoX9/Dx465ZJIpS7/XdKXYSZDg8gR9hGdU3NXoTs2uV7Tx
         5Hg0vMrXFZRhskhYL0MI/ZfDyZPquN+uYtZilOwzCZceG61728+i3m8wB3XrIzoeDq5B
         GBuqZE4Qw4S9rkV5fOcSi0YJV1dXUPdcxdSLdgvKG1trchFaBxjjZT2oTBp3GtX/GBAz
         z1OTFPjvc/R20x9OA1X1LfzF0JRt2t/5jCaYAM+eqgfSO2sJ84fz4sjJpcUoV8tv0WJw
         Oemg==
X-Forwarded-Encrypted: i=1; AHgh+Rom5xkTlbxKrFRAkiDxNs37OsUEsS16BSu8qjqXYgYGJZsffIV0vhYK5xNFPyHGyFmgImCVDpzF5kqEasgasbmwvA==@vger.kernel.org
X-Gm-Message-State: AFuF++mW2XEYsVigTVGJs5PRq7Tf3ky3LetRhNF8Tbip21c+lFZKNmr5
	UBqvJT/TpJ9pPPr5fSoV1y9Q7008NBiMY1tju957N6q1mLJcZKafLyuzx10S17Tr9oD0AukIBcw
	qHNcQ5/fJBdROEIgNiB1csuE3PrCeQgDd0TXJAPyWPT6amMzGIMOzS+IO5uCGCkKHn+7aXIAt
X-Gm-Gg: AR+sD12rNOL5jxMFg2HxOgwgvq52u9O/FV72nH2O6Hu7eweO5mtiR0GyGDeBIyr6kJH
	OVm09DTmqO3J6kjUSDvWkRlE1uOOg58ygyUnq7SA2ibOywZEeTzvqWLWU3drHvRcBZGQx0fmuiH
	7h/fDYJbiOMyNFg90bNCAjwjbSC7X7vFzf00wViWAJiIZ8+p72j26By7jg4S7MPrlySoNJv07J9
	mBaS/KQ3Z2P/RzPRzNoxfX40al6AfSr27CwZ/Tpvy9IB05rbT4tz2V2C99TD01MBraHfSiweZVH
	53VH9M6Prc8Ms0xzAfQPq+XnqlvAsaJTM4PAYeGE1XipQVPYBg/wnRx3Ijah8qgsCgAV6FODTaw
	fIbDon4mIEosVz480pds9lggYCbGZ4/V28FM=
X-Received: by 2002:a05:690c:c59d:b0:81f:3b6d:a0a4 with SMTP id 00721157ae682-844e3d5d5cemr41714197b3.25.1787238538969;
        Thu, 20 Aug 2026 08:08:58 -0700 (PDT)
X-Received: by 2002:a05:690c:c59d:b0:81f:3b6d:a0a4 with SMTP id 00721157ae682-844e3d5d5cemr41713897b3.25.1787238538408;
        Thu, 20 Aug 2026 08:08:58 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-845186c0dacsm26600967b3.36.2026.08.20.08.08.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 08:08:57 -0700 (PDT)
Date: Thu, 20 Aug 2026 11:08:55 -0400
From: Brian Masney <bmasney@redhat.com>
To: Triet Hoang <triet.hoang.dev@gmail.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, luca.ceresoli@bootlin.com,
	krzk@kernel.org, s.nawrocki@samsung.com, cw00.choi@samsung.com,
	peter.griffin@linaro.org, alim.akhtar@samsung.com,
	michal.simek@amd.com, shubhrajyoti.datta@amd.com,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] drivers/clk: Convert to DEFINE_SIMPLE_DEV_PM_OPS()
Message-ID: <aocYhz_ASVhW8zfm@redhat.com>
References: <20260820065904.2032536-1-triet.hoang.dev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260820065904.2032536-1-triet.hoang.dev@gmail.com>
User-Agent: Mutt/2.4.0 (2026-06-19)

On Thu, Aug 20, 2026 at 01:59:04PM +0700, Triet Hoang wrote:
> Convert the deprecated SIMPLE_DEV_PM_OPS
> to DEFINE_SIMPLE_DEV_PM_OPS and pm_sleep_ptr().
> 
> This lets us drop the __maybe_unused annotations from its suspend and
> resume callbacks, and reduces kernel size in case CONFIG_PM or
> CONFIG_PM_SLEEP is disabled.
> 
> Signed-off-by: Triet Hoang <triet.hoang.dev@gmail.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>

