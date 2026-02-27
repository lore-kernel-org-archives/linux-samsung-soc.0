Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29B3841C2FD
	for <linux-samsung-soc@vger.kernel.org>; Fri, 27 Feb 2026 14:45:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772203504; cv=none; b=PXtKIBsiYwzTySqJb709LkU8Ic374B5uwXIZo2u+6mAgZjrhYrMK9LLDGp1WVduTK27R2+BUUuW6RDtz5+OgN1H4hhoKh9lC7q5nzz8egcWRdsxDSfjTR4Y5vD/PV5wzpDfU3kjaftNntT8lFv1YinE5YCu9dQV4nuI2wUFlkvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772203504; c=relaxed/simple;
	bh=eQ7qXAOyj81yfe/+OeMnHJ4AQMCfEecRpWABhPohsPc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jc7M7P0goeNPKdFSS7chEVPaOS4mfdnnUxqOnr8rEKw4s0m0c0BRdKygWD5Dl8crttqIYM382SNHudbqx+o6jpq44dDYLzJXg100ZfW6v7JHvRnDRMP6pgP/6ILbbQuh0BJhNDzHw3//ncF4klCMyhmS5CKXdxea/i0GSp+1RvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Uua0fC8f; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=PD4paHCN; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Uua0fC8f";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="PD4paHCN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1772203502;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pjpP6CrvDx4JRD336SFvsZfBjEjd+fqZc06LPodyXOg=;
	b=Uua0fC8fsiwn9RWG5DaRKfjOcJvXQwSOYIHFOiqLtwaFGksJ1pqx2f6uR9Ddt8n4lCzO41
	JLRy5n/t154LbGmfUlabxckKm2xSgvGvuXxu2a5QsHIuOCmkvSo3dtedKKR9tKD/eY58c5
	l54cVlJjVhVzwtII4SSM55yOsqzuqVE=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-371-NMyLAYeBNCmxJAR3lONwOg-1; Fri, 27 Feb 2026 09:44:59 -0500
X-MC-Unique: NMyLAYeBNCmxJAR3lONwOg-1
X-Mimecast-MFC-AGG-ID: NMyLAYeBNCmxJAR3lONwOg_1772203498
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-899b4ce513cso203042176d6.3
        for <linux-samsung-soc@vger.kernel.org>; Fri, 27 Feb 2026 06:44:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1772203498; x=1772808298; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pjpP6CrvDx4JRD336SFvsZfBjEjd+fqZc06LPodyXOg=;
        b=PD4paHCNvd1hV6pS3NF7m3px/10FhxVbT7XbblzkJjCbr/Y9Yw+yaz8/QjiakrOAAe
         Z+X2uXLz0thxfqfNqGdHAECffK1d8poOKqf5lQ7nDx1t60DwoikUJRramfqE8oIPtq96
         RQIftN+VdTHcXTcISCMHd2gDfyqE/mYx/KqaHSeTsf4PXbWzKiHPyaQ2bgpbBfeb+InB
         FfdsTFUgE7BrXouk8pGqX9mmrw0hF10Fwkbzt/til2MWJVy08+zptahFDvNUxSfEVQhn
         dAlbCXAi52HCa4djzPGtyd1wX10XEtL43YgGFqt5blfcOxe0TOR2ygqfsWP6E6ZzyMR5
         NoLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772203498; x=1772808298;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pjpP6CrvDx4JRD336SFvsZfBjEjd+fqZc06LPodyXOg=;
        b=WnhvnjFQOGpYeV5v0UJa4wtBWEOoxZjeG57VUs9j8lh9ulcVqV09ZpAYrx8oOmeWGc
         HFMfvqeYMlRzV37b+OE3+3+DZqYXuclORmFRVpCduTftqwKffNv3HsH1k/hBF0xsS5v7
         tdxRMW083Bvm27aodc7iUBZviTrkRiEdobZGcamHrSBWyDJZJiseKrpmvItc7LFDYyjr
         vSjf1hbD54pPWWJ5R0WMUaQLcv8rUw9Z01ryI6H1Zcv0NOAanB9WaLdtsBqOynX/b4J4
         aqUALPtFbSQkWVNuOURQSThstpt8cZbfghmvjMYFH3ya+b8LGK55DD2MmTPGRWC/fUAG
         P9aQ==
X-Forwarded-Encrypted: i=1; AJvYcCVC1oya8W1souFvuHIbm7fesz0dige2st+9k6aVTl2RFYKwG+zD9PZcIt8OPyfhA9wXkaCVnFMjDCMIi0U8D7ZUUA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9Nmb1/HitzLBHJdcl9xoEBgm5wHEdazp9JhNzPzqCwHfP+CyV
	B54D8QUF8bAbYyIlKNmivPe8idyKwh5D4a5rBN7bwuSVkMuEC6EPxx7MeZ3hGz6e1Dq1n8BpZmr
	Y8HkQMU2Xu3QMsecfSycrf0xessTu4tByTLNYwovqqv4y6q4kD5sPdYSztAKio+WiZ7sQ/2+O
X-Gm-Gg: ATEYQzz624gdFeC3RDjuHDExpmq5gjAU8g8B/twxt+qDNbY5IRaQ+CbBuX0WKYJthQB
	jjZE0tMVkd+KPc/awNJuGOIcRHJZ8GVFovlc6/Z5EfwnbVSV3iNxrnror/HvgeA6vhGEp0x2GwZ
	Eo3SGwknBHMVHRfBG3DlonapPksQi35jAUCGelmZWEaGJeoojbjLApylFYOQml4XH6MzXVaUYD3
	tkGbNcWyxNFjyO35XBVqEODG+IeOM1JpIXmjDNPk5n3CIaCPHEHqzW8hjPV0HNhpxtBsC0qZECG
	340WwTkxGNoW4LlG83x5MlXeXVR+jG4cGak63PQlTiXNAyp0V/gQA7cNcMEu+NC7sDuGWEobqF5
	rZhzvS5LL+N5aAWYsJN8N7Z0GdZhey0f6cC+RBxH+60XgeXhGdYQqo44c
X-Received: by 2002:a05:6214:2481:b0:88a:2360:7f15 with SMTP id 6a1803df08f44-899d1d86467mr45187626d6.12.1772203498542;
        Fri, 27 Feb 2026 06:44:58 -0800 (PST)
X-Received: by 2002:a05:6214:2481:b0:88a:2360:7f15 with SMTP id 6a1803df08f44-899d1d86467mr45187146d6.12.1772203498037;
        Fri, 27 Feb 2026 06:44:58 -0800 (PST)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-899c73a3130sm45123526d6.49.2026.02.27.06.44.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 06:44:57 -0800 (PST)
Date: Fri, 27 Feb 2026 09:44:55 -0500
From: Brian Masney <bmasney@redhat.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Andrea della Porta <andrea.porta@suse.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Chanwoo Choi <cw00.choi@samsung.com>, Frank Li <Frank.Li@nxp.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Orson Zhai <orsonzhai@gmail.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	"arm-scmi@vger.kernel.org" <arm-scmi@vger.kernel.org>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Fabio Estevam <festevam@gmail.com>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: Re: [PATCH 01/13] clk: add new flag CLK_ROUNDING_FW_MANAGED
Message-ID: <aaGt5-ZWoXQ9Hz74@redhat.com>
References: <20260226-clk-det-rate-fw-managed-v1-0-4421dd2f6dc6@redhat.com>
 <20260226-clk-det-rate-fw-managed-v1-1-4421dd2f6dc6@redhat.com>
 <TY3PR01MB113465A96D1EEBB43C82C12A98673A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <TY3PR01MB113465A96D1EEBB43C82C12A98673A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
User-Agent: Mutt/2.2.14 (2025-02-20)

On Fri, Feb 27, 2026 at 12:00:55PM +0000, Biju Das wrote:
> > -----Original Message-----
> > From: linux-arm-kernel <linux-arm-kernel-bounces@lists.infradead.org> On Behalf Of Brian Masney
> > Sent: 26 February 2026 18:17
> > Subject: [PATCH 01/13] clk: add new flag CLK_ROUNDING_FW_MANAGED
> > 
> > There are some clocks where the rounding is managed by the hardware, and the determine_rate() clk ops
> > is just a noop that simply returns 0. Add a new flag for these type of clocks, and update the clk core
> > so that the
> > determine_rate() clk op is not required when this flag is set.
> > 
> > Signed-off-by: Brian Masney <bmasney@redhat.com>
> > 
[snip]
> >  drivers/clk/clk.c            | 24 +++++++++++++++++++++---
> >  include/linux/clk-provider.h |  2 ++
> >  2 files changed, 23 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c index
> > fd418dc988b1c60c49e3ac9c0c44aa132dd5da28..0a522a0817411c7f7c6e9cffd6f024e672a331a8 100644
> > --- a/drivers/clk/clk.c
> > +++ b/drivers/clk/clk.c
> > @@ -1557,6 +1557,20 @@ static int __init clk_disable_unused(void)  }
> > late_initcall_sync(clk_disable_unused);
> > 
> > +/**
> > + * clk_is_rounding_fw_managed - Check to see if clk rounding is handled
> > +by the
> > + * firmware.
> > + * @core: the clk to check
> > + *
> > + * Clks that have this flag enabled do not need to have a
> > +determine_rate() op
> > + * set, and will always return success for any rounding operation since
> > +the
> > + * firmware will deal with the rounding.
> > + */
> > +static inline bool clk_is_rounding_fw_managed(struct clk_core *core) {
> > +	return core->flags & CLK_ROUNDING_FW_MANAGED; }
> > +
> >  static int clk_core_determine_round_nolock(struct clk_core *core,
> >  					   struct clk_rate_request *req)
> >  {
> > @@ -1589,6 +1603,8 @@ static int clk_core_determine_round_nolock(struct clk_core *core,
> >  		req->rate = core->rate;
> >  	} else if (core->ops->determine_rate) {
> >  		return core->ops->determine_rate(core->hw, req);
> > +	} else if (clk_is_rounding_fw_managed(core)) {
> > +		return 0;
> >  	} else {
> >  		return -EINVAL;
> >  	}
> > @@ -1673,7 +1689,7 @@ EXPORT_SYMBOL_GPL(clk_hw_forward_rate_request);
> > 
> >  static bool clk_core_can_round(struct clk_core * const core)  {
> > -	return core->ops->determine_rate;
> > +	return core->ops->determine_rate || clk_is_rounding_fw_managed(core);
> >  }
> > 
> >  static int clk_core_round_rate_nolock(struct clk_core *core, @@ -3528,6 +3544,7 @@ static const
> > struct {
> >  	ENTRY(CLK_IS_CRITICAL),
> >  	ENTRY(CLK_OPS_PARENT_ENABLE),
> >  	ENTRY(CLK_DUTY_CYCLE_PARENT),
> > +	ENTRY(CLK_ROUNDING_FW_MANAGED),
> >  #undef ENTRY
> >  };
> > 
> > @@ -3906,7 +3923,7 @@ static int __clk_core_init(struct clk_core *core)
> > 
> >  	/* check that clk_ops are sane.  See Documentation/driver-api/clk.rst */
> >  	if (core->ops->set_rate && !core->ops->determine_rate &&
> > -	      core->ops->recalc_rate) {
> > +	      core->ops->recalc_rate && !clk_is_rounding_fw_managed(core)) {
> >  		pr_err("%s: %s must implement .determine_rate in addition to .recalc_rate\n",
> >  		       __func__, core->name);
> >  		ret = -EINVAL;
> > @@ -3920,7 +3937,8 @@ static int __clk_core_init(struct clk_core *core)
> >  		goto out;
> >  	}
> > 
> > -	if (core->ops->set_parent && !core->ops->determine_rate) {
> > +	if (core->ops->set_parent && !core->ops->determine_rate &&
> > +	    !clk_is_rounding_fw_managed(core)) {
> 
> >  		pr_err("%s: %s must implement .set_parent & .determine_rate\n",
> >  			__func__, core->name);
> >  		ret = -EINVAL;
> 
> 
> After applying patch#11, I get a message as you removed .determine_rate, Also it breaks display.
> 
> [    0.096414] __clk_core_init: .pll5_foutpostdiv must implement .round_rate or .determine_rate in addition to .recalc_rate

Thanks for testing. This happens because rzg2l_cpg_pll_clk_register()
doesn't have the new flag set. I'll fix this, and go through all of the
others again just to make sure I don't miss any others.

Brian

