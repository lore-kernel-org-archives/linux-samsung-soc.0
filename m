Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECF8A35207F
	for <linux-samsung-soc@vger.kernel.org>; Wed, 27 Aug 2025 13:13:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756300420; cv=none; b=cQrLHanCeR/RBL7FhR+GkMtnXrPVV3sNUufS44J5ZxqBkuDmXjFUSvK/CoKGz+mMxsm1x91KKk9ME9HH5XPwoq3wpq2jeVW6ooiJek6nBF2MIvHAWLhX1epTb9+Id+H+80wE5GBrW46qchNWWRGcek5P9b/zksTZpc3++AcpnBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756300420; c=relaxed/simple;
	bh=eRhLjVe67iKErrxJ74pmlvZqDh8RQqKX7+TmAocxpuc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qt+4N1ZVAOdiGbwVjCWWdukVQ03Zj3+MuFqmwmcFMg9jMbIUjWPjPKmvy/OxINhDGVGw/ky4U/tFXYMZD2GqPDPA1420DfMjsGGioigMQW+7Ir2TrOx75yk7vGTVB8ZFmh7qYG0vCENwWGuYvKBnvLLCnUTSW3CawJimdf+zQIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=b6sfeUg1; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="b6sfeUg1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1756300416;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=13LJOrVZbt5/bZNb1010AyPGLHEYUJgw1i+wJLdf1Rs=;
	b=b6sfeUg1k3h/K+rZmCBUqdC1FVC3pux6Pf71g5GAHVPKij43CoMeWsKftGJGlQ2rVh/VIU
	GNhyysNGbqz463uou7EP4x7eermxMXYMWOpw1FeWeae0EoMlEWddLDqD5f62BMOvA8VYnW
	1qLigQxwP30H/zuiYKHCE2PNHwA7ggc=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-455-DFo3Whj6MkyNm5kAxl2uLA-1; Wed, 27 Aug 2025 09:13:35 -0400
X-MC-Unique: DFo3Whj6MkyNm5kAxl2uLA-1
X-Mimecast-MFC-AGG-ID: DFo3Whj6MkyNm5kAxl2uLA_1756300415
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7f2942a1aa1so237814885a.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 27 Aug 2025 06:13:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756300405; x=1756905205;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=13LJOrVZbt5/bZNb1010AyPGLHEYUJgw1i+wJLdf1Rs=;
        b=UqxLiy85uzbnEL4xXWMwetj/LnBMBF3P4PPVAWiz6BM9VPY8FT0kR3aJZcfF5UkECb
         5AwImf76Lc4EOQ0M82pPjDTlpChPZH/1r01M9BO0Cpl7IJS6hHzcSZqQDjwsLhTut3xr
         uFuEcwDI2hDJ07t+aGnG9ipPatObFgmSMSpncCZZEYMnMyvrTi4RezPs2e8OMy1l2SpU
         ysrUgzLB12kpxKgQEAGECmEsAvQSzr6Wfnd+hQSdyK8wqudeIkPqzAMt6r4Og4tJUhg5
         V4pNFay2aG5ssMxqMp6Ut7ZI8tAvSUpNl1nAK61HTYS2Vq4oVVsM6q3ks5md/DngPTNd
         gw8A==
X-Forwarded-Encrypted: i=1; AJvYcCWBiBq03sWtAGg0r/qguYglEKdhOY2PMaycH3X4/c4AbRB0wJCz8I4MPsX39AwhhU7HglC80+WXg0E+GwcgpZT1XA==@vger.kernel.org
X-Gm-Message-State: AOJu0YySzI6NusmGYDiV/JTSxUlEDLYexgR6CuND0Siy3kpmAd/mtdLG
	4JD7hBtAapMjAr5ovb+GmJuTK4vGOhwJAF2y+Ia4YeWJbxVMuo0y+5yqJOaT4whzCYamUuAik7H
	qzGQ3tqHATKV55ev+lWIHWb2r552fl2LU2FYgTXxgX2UybK379GPobUMtid1+YMN++hM1gJXk
X-Gm-Gg: ASbGncv1dgG8HW6jGKdTnKqTFqDbLVgFV6HaWX6mK3wFyG3Zfs5Ga7DTN+y+DHOI0A1
	RlmygRJ3rT4mTDp4oHOwGnyr5lDb0+aSVRB8fYUd9qH3hBSEdegO1rZv84rDLEY7KzSHIHbSRQU
	W+QvhVLlcad1YRwGgwB8LFoIWsoLPU+iCWHV2xLkB1AWB403pvAxsJyDl2T02TuAYsXVUTU6fUa
	inzHndo8sCUSOCE0xlPnqkyhQJfuARZfOocu4pDJ5/hYt8h9pyeLXcG9HpKnLuAPGsuD0qDEcdw
	iz61RcgPkd1u2yrlBkn/OFklqozGpjq3ASBthmPNTZIYgj3++LVPf8iPpxiJOKjpq+dG02FXn6j
	rboaETfSv19/M1u7ejG0=
X-Received: by 2002:a05:620a:7101:b0:7ed:92c8:7d16 with SMTP id af79cd13be357-7f58d941f59mr592255085a.31.1756300405038;
        Wed, 27 Aug 2025 06:13:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG//kDH7SoWg5eCSBiMLHP3nCnmfnmaReGS2V45T15TfIErjBPeekutHDc1uHZhw0fUtcQytQ==
X-Received: by 2002:a05:620a:7101:b0:7ed:92c8:7d16 with SMTP id af79cd13be357-7f58d941f59mr592238785a.31.1756300403878;
        Wed, 27 Aug 2025 06:13:23 -0700 (PDT)
Received: from x1 (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7ebeca23e10sm885475785a.6.2025.08.27.06.13.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Aug 2025 06:13:22 -0700 (PDT)
Date: Wed, 27 Aug 2025 09:13:17 -0400
From: Brian Masney <bmasney@redhat.com>
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Paul Cercueil <paul@crapouillou.net>,
	Keguang Zhang <keguang.zhang@gmail.com>,
	Taichi Sugaya <sugaya.taichi@socionext.com>,
	Takao Orito <orito.takao@socionext.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Jacky Huang <ychuang3@nuvoton.com>,
	Shan-Chun Hung <schung@nuvoton.com>,
	Vladimir Zapolskiy <vz@mleia.com>,
	Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Yixun Lan <dlan@gentoo.org>,
	Steen Hegelund <Steen.Hegelund@microchip.com>,
	Daniel Machon <daniel.machon@microchip.com>,
	UNGLinuxDriver@microchip.com, Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Michal Simek <michal.simek@amd.com>,
	Maxime Ripard <mripard@kernel.org>,
	Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Neal Gompa <neal@gompa.dev>,
	Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Max Filippov <jcmvbkbc@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Daniel Palmer <daniel@thingy.jp>,
	Romain Perier <romain.perier@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Heiko Stuebner <heiko@sntech.de>,
	Andrea della Porta <andrea.porta@suse.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Qin Jian <qinjian@cqplus1.com>, Viresh Kumar <vireshk@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Alex Helms <alexander.helms.jy@renesas.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	sophgo@lists.linux.dev, linux-mips@vger.kernel.org,
	imx@lists.linux.dev, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com,
	patches@opensource.cirrus.com, linux-actions@lists.infradead.org,
	asahi@lists.linux.dev, linux-mediatek@lists.infradead.org,
	linux-arm-msm@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, soc@lists.linux.dev
Subject: Re: [PATCH 112/114] clk: scmi: remove round_rate() in favor of
 determine_rate()
Message-ID: <aK8EbcEHz3Yzpa1W@x1>
References: <20250811-clk-for-stephen-round-rate-v1-0-b3bf97b038dc@redhat.com>
 <20250811-clk-for-stephen-round-rate-v1-112-b3bf97b038dc@redhat.com>
 <20250827070933.GB18994@nxa18884-linux.ap.freescale.net>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250827070933.GB18994@nxa18884-linux.ap.freescale.net>
User-Agent: Mutt/2.2.14 (2025-02-20)

On Wed, Aug 27, 2025 at 03:09:33PM +0800, Peng Fan wrote:
> Hi Brian, Sudeep, Cristian
> 
> On Mon, Aug 11, 2025 at 11:19:44AM -0400, Brian Masney via B4 Relay wrote:
> >From: Brian Masney <bmasney@redhat.com>
> >
> >This driver implements both the determine_rate() and round_rate() clk
> >ops, and the round_rate() clk ops is deprecated. When both are defined,
> >clk_core_determine_round_nolock() from the clk core will only use the
> >determine_rate() clk ops, so let's remove the round_rate() clk ops since
> >it's unused.
> >
> >Signed-off-by: Brian Masney <bmasney@redhat.com>
> >---
> > drivers/clk/clk-scmi.c | 30 ------------------------------
> > 1 file changed, 30 deletions(-)
> >
> >diff --git a/drivers/clk/clk-scmi.c b/drivers/clk/clk-scmi.c
> >index d2408403283fc72f0cf902e65f4c08bcbc7b4b0b..6c6ddb92e7cf6a0cfac2c7e19c0f15f777bb8c51 100644
> >--- a/drivers/clk/clk-scmi.c
> >+++ b/drivers/clk/clk-scmi.c
> >@@ -54,35 +54,6 @@ static unsigned long scmi_clk_recalc_rate(struct clk_hw *hw,
> > 	return rate;
> > }
> > 
> >-static long scmi_clk_round_rate(struct clk_hw *hw, unsigned long rate,
> >-				unsigned long *parent_rate)
> >-{
> 
> I see the point of round_rate is not used if determine_rate is there.
> But reading the code of round_rate, It might be better to rename
> scmi_clk_round_rate to scmi_clk_determine_rate.
> 
> Anyway, need Sudeep and Cristian to comment.

In this case, yes the round_rate implementation is filled out, whereas
the determine_rate lets the firmware handle it, and
scmi_clk_recalc_rate() will later populate the rate the clock is running
at.

I can convert round_rate over to determine_rate in this case, however it
would be a change to what's there now, and risks a regression. Here's
the relevant code from drivers/clk/clk.c where the determine_rate and
round_rate ops are called:

    static int clk_core_determine_round_nolock(struct clk_core *core,
                                               struct clk_rate_request *req)
    {
    	...
            if (clk_core_rate_is_protected(core)) {
                    req->rate = core->rate;
            } else if (core->ops->determine_rate) {
                    return core->ops->determine_rate(core->hw, req);
            } else if (core->ops->round_rate) {
                    rate = core->ops->round_rate(core->hw, req->rate,
                                                 &req->best_parent_rate);
    	...

If Sudeep / Cristian want the round rate converted to determine rate in
this driver, then I can do that in a v2.

Brian

