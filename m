Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AD17317173
	for <linux-samsung-soc@vger.kernel.org>; Wed, 29 Apr 2026 13:55:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777470947; cv=none; b=pi25jxgEujbziYaK34wPfqtzzShA2gPr7aWMXeNp8iv+C3VKQC4LZTDVDAeA4xtTnQakvzuDWitfhyLVrmuqBCxo0S48WVqf349ri3wtxA62pmCahRxd1bhwiqNoavLC50/1d3duKU/TYn2er7n/H8dQmjaGDHuNiuao3HzsDXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777470947; c=relaxed/simple;
	bh=buDqtxL5iiA+P59BL7gOogsMTPfTAbw/6u3MZ3bRXX0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TYDrNFPW8vOK7Ifd3qzdD3NWVD5TNgb0ohtgBazE98w/0DH1GSIcr85Y86E1R1QnjUi7DDZ1TPUrUArI3LP9z/9RRXiOOsMHbFJcGRQLEXnhIfelNPDVrvgucTyVtWOhcgZAWwdrb4BFckQdLM4c+WTjsDHXjlz4GQ9Wpuk48AI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=aaye5le9; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=aIpiukdD; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="aaye5le9";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="aIpiukdD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1777470945;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=E4gmtst5bATy4vi+nqQOmDuupzzNRv5w7Vbola4ydK4=;
	b=aaye5le9VF60v6sPq4CiCo/9qzuijopOb5flH3s2LuBRfAMvPzMGoAoqOxQUO0Mah2s6I7
	xZwl9Rt/ndjWlsIfBeDqIBI5tNcIpm5MaQnpq6TY6iuFhvQPjgIjN4ZmdwPGdTCf/gn/hW
	6NQxs60dSSYqLLlGdFhQxLqCDm4jyOA=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-484-dQJF8wC3MISyM3fo95a6Dw-1; Wed, 29 Apr 2026 09:55:44 -0400
X-MC-Unique: dQJF8wC3MISyM3fo95a6Dw-1
X-Mimecast-MFC-AGG-ID: dQJF8wC3MISyM3fo95a6Dw_1777470943
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8acb26fbbb2so185130696d6.2
        for <linux-samsung-soc@vger.kernel.org>; Wed, 29 Apr 2026 06:55:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1777470943; x=1778075743; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E4gmtst5bATy4vi+nqQOmDuupzzNRv5w7Vbola4ydK4=;
        b=aIpiukdDtwMfeu5U8x7pAWQk1igCGTDDEl1VOIRCChHAvLkCYOLBCQMfizk5Wc6fa1
         GOG7IQiJq7VDTj0HSc8ckVqTRf1S3/KpuB0/d32uzyX0YHIZtw7RBZqAx+ZKrN4UVTfo
         Wk1sSJ6utW7+ydSYNVH+UhTbbxJlUjVTI7IZn1ILhR0IfiXHZB5FK1FPmbY826fn3LT0
         VwS6vJoA4sAMMTPJlEBvIFwXLFoDtJDwsQN34h9RA3ZoKjoIjywy/A2laQ+5cpldXa7L
         yxl2MXhjHWhVfwRurbF3kN1ap7u0rixf/xvcabi7NTBsFk9RW779MIc6azHgnNL/kLMM
         gDcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777470943; x=1778075743;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=E4gmtst5bATy4vi+nqQOmDuupzzNRv5w7Vbola4ydK4=;
        b=l7sz2Nt3yGi6IS3DdQwaF5LSyXUlpkiPlyDwHcWKttqxvj46C+JjQc6fsUPMD91r/1
         OQ2e4lp+SWtNyhSt8RyHyI0Lt9+JFq9kiJhk9rMvoD+NUrX7oUjiADD7QG7UPzJ5pRsx
         r4CuURbamMhQ40XhLFNMRO8tloASbmH4vkCNETwaYw87jLqNyh8DNodadxV0vxGS+12L
         bKG74h1lMjvP6iY3m6zJULO46LQcIHaz7xAocfidnayWZpAXGTPQE+xtfghB1fJI7WAL
         Hp1DN9MAUbqTyigPxv4e4W6Ms+td040ML+Qzggc6hpxytTklQ1yUI4kK8UbOgv/lraqO
         RzAA==
X-Forwarded-Encrypted: i=1; AFNElJ9VH3yZzeS6aJ5dkFomNGtZVg6VuAm+3gRFz1etswV5JRij4uvpKHR4GR9iECVDxFnflUkFgLiMK6KonR3p9ioUDA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw97JVXpu3vr89Ds0OtuJg+OLr1R8ezHBIUD6uIfJoNGu1rCCFX
	iHG+PIPfLoGRlC7P+233iIzpuS1V+fGREvEO2Bepm2dZioSsc0IXwmZp96zAIX17ibbeaK6kp+d
	d0N61SwvVDdTkBXNjVfXKBqVomHDI6DTBh1fWmKploVaVnGfQm0fw3jErA787lVBc5JghIN1N
X-Gm-Gg: AeBDieueBb54ArZl9llIDz70SzFSYCtfWpxiYlJTDHbZTvDYCNFCgFWT+Te63JZ+kpM
	8TiXxJd1iO5lGgRpcMwPDvUw20/9DzEYA0yrrFohA/Xcai932Qrf8shwqatIftGegJm0qA/vtKS
	fBgx13xjGZfP0MTCswQsAEMcFOh5Lybb2zo4lhJGZOkbQHW057RDpPUmYFSlkGU56HqG2WcF0QN
	dn001ajmHEs92hByyKmm9Jo4CU6w2MZ68YvKQuUEMCjJUFJ/UYlsfeREM/RsjUVpy2s6u3JNqqg
	Br3E4hr4VakJZnROu4tuSR4tGM061qu1znVNQF0sRdSxJusLMhgfiozQC0/Y6Y0gGMLKsrAWGjq
	+BnHspd9kc1MelLXMXcwTUcxJQa4IWUE2POwiI15ZB3vnPcNcTgJ1fYSKXJIsr/0L+g4=
X-Received: by 2002:a05:6214:600e:b0:8ac:aeb0:2eb4 with SMTP id 6a1803df08f44-8b3ede04448mr57443776d6.45.1777470943492;
        Wed, 29 Apr 2026 06:55:43 -0700 (PDT)
X-Received: by 2002:a05:6214:600e:b0:8ac:aeb0:2eb4 with SMTP id 6a1803df08f44-8b3ede04448mr57443326d6.45.1777470943011;
        Wed, 29 Apr 2026 06:55:43 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8b3ef86e2f1sm21005096d6.48.2026.04.29.06.55.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 06:55:42 -0700 (PDT)
Date: Wed, 29 Apr 2026 09:55:39 -0400
From: Brian Masney <bmasney@redhat.com>
To: Stephen Boyd <sboyd@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Andrea della Porta <andrea.porta@suse.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Chanwoo Choi <cw00.choi@samsung.com>, Frank Li <Frank.Li@nxp.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Orson Zhai <orsonzhai@gmail.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>, arm-scmi@vger.kernel.org,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org, Peng Fan <peng.fan@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: Re: [PATCH v2 01/12] clk: add new flag CLK_ROUNDING_NOOP
Message-ID: <afIN2y_PCGofGAKD@redhat.com>
References: <20260309-clk-det-rate-fw-managed-v2-0-c48ef5a3100a@redhat.com>
 <20260309-clk-det-rate-fw-managed-v2-1-c48ef5a3100a@redhat.com>
 <177742893645.5403.3938693995862346406@localhost.localdomain>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <177742893645.5403.3938693995862346406@localhost.localdomain>
User-Agent: Mutt/2.3.1 (2026-03-20)

On Tue, Apr 28, 2026 at 07:15:36PM -0700, Stephen Boyd wrote:
> Quoting Brian Masney (2026-03-09 07:38:40)
> > diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> > index fd418dc988b1c60c49e3ac9c0c44aa132dd5da28..1187e5b1dbc123d2d2c1f43690d7dcf75a7c4ac3 100644
> > --- a/drivers/clk/clk.c
> > +++ b/drivers/clk/clk.c
> > @@ -1673,7 +1690,7 @@ EXPORT_SYMBOL_GPL(clk_hw_forward_rate_request);
> >  
> >  static bool clk_core_can_round(struct clk_core * const core)
> >  {
> > -       return core->ops->determine_rate;
> > +       return core->ops->determine_rate || clk_is_rounding_noop(core);
> >  }
> >  
> >  static int clk_core_round_rate_nolock(struct clk_core *core,
> > @@ -3528,6 +3545,7 @@ static const struct {
> >         ENTRY(CLK_IS_CRITICAL),
> >         ENTRY(CLK_OPS_PARENT_ENABLE),
> >         ENTRY(CLK_DUTY_CYCLE_PARENT),
> > +       ENTRY(CLK_ROUNDING_NOOP),
> >  #undef ENTRY
> >  };
> >  
> > @@ -3906,13 +3924,19 @@ static int __clk_core_init(struct clk_core *core)
> >  
> >         /* check that clk_ops are sane.  See Documentation/driver-api/clk.rst */
> >         if (core->ops->set_rate && !core->ops->determine_rate &&
> > -             core->ops->recalc_rate) {
> > +             core->ops->recalc_rate && !clk_is_rounding_noop(core)) {
> >                 pr_err("%s: %s must implement .determine_rate in addition to .recalc_rate\n",
> >                        __func__, core->name);
> >                 ret = -EINVAL;
> >                 goto out;
> >         }
> >  
> > +       if (clk_is_rounding_noop(core) && core->ops->determine_rate) {
> > +               pr_err("%s: %s cannot implement both .determine_rate and CLK_ROUNDING_NOOP\n",
> > +                      __func__, core->name);
> > +               goto out;
> > +       }
> > +
> 
> This hunk has me irked. I'd rather we export some function like
> clk_determine_rate_noop() that just returns 0 instead of adding another
> flag. The chance that someone can get it wrong goes down and you can
> naturally grep for any clks that are using determine_rate() without
> having to also include this flag in the grep. It makes it easier to
> reason about as well because we can have code that just checks for
> determine_rate presence instead of both (i.e. clk_core_can_round() isn't
> changed). Plus a clk_ops structure is more self-contained because it
> doesn't rely on the clk flags to go with it.

I also like the clk_determine_rate_noop() approach much better as well.
I'll send a new version.

Thanks,
Brian

