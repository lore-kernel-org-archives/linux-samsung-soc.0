Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6EB24A2065
	for <linux-samsung-soc@vger.kernel.org>; Fri,  4 Sep 2026 13:46:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788529608; cv=none; b=S2O8G57xkYhZHYQpCJb5u1N1qKz+X5PATewzFMNSjtWfnQShvAJ3VNFXGTsAiJf+I5bVse+SjPX4BqdO0K9o/Gf07tZTbd9gR8d22PikOS2Tr8cV4XX6WQZgX4VbgQ7Qtoj48vNdVbUrE49ZOrC94DxT6AupME1XHwlqqFxN5UY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788529608; c=relaxed/simple;
	bh=VcKuCeSMQ4I5yw0ljiiq4L1snVizmWQm18XxRE0uO/E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TOLixvlirD9R68ZLNoMGKe5EkJ7and3Cun/7qtk3Gn79pgvq1sITv21ttzp3rWuceQA8vJmWH4/6bMdSI3u14C2wX7BsgYe/fjsNgtj9eMF7FfGLcFWEGqZk6BHGtuLACf1kxxuSQmZ1joKeQAL1q4R1TZwEPO75Hfa3ZqAoLQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e2IKQTFc; arc=none smtp.client-ip=209.85.160.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e2IKQTFc"
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-43b7e186a0cso549982fac.0
        for <linux-samsung-soc@vger.kernel.org>; Fri, 04 Sep 2026 06:46:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788529605; x=1789134405; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MZTXMZGnnVv6fSvtGBrE1wHaAf9xygy4G9N0vOtIQdo=;
        b=e2IKQTFc3YbZN3ypwX5yUCc+DsU03AvtA4towAyv1iY7augKUcyGpi7zcej+n0gH/W
         YlKp0xM7ph4DcCy4t6ngtLpCXzKtxdoTMHVfgF6voqG43XDO6wRJM3LsWYyZpsTiGqT4
         RAN5Ydx02OQJ4YqPRZgYahO2LuNoSaSFRysLwn8STC8lEap+t64mKmgiyeC0uqL5kokT
         4JUvv05WFRn5DptkYllwqBn5utqH3zuhuhp40osprNWxNympUw1AjEsHCvIDO4o/dbQg
         8phcTYJLtsheIpLOizcR44HtHc4w/X6s2Uu/yh9lHSmrkRBYyYaeT6hAVNfUnrqf+T92
         cYAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788529605; x=1789134405;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MZTXMZGnnVv6fSvtGBrE1wHaAf9xygy4G9N0vOtIQdo=;
        b=T/cNqZB4Gl0Roo1dSvZPYDe8g56SYkmENuoAYQyApQBcXmENGvo8V3eGnr0Qy/vtsM
         PXA1ZF3jsqU77Tz/vSza3DqJ+SMREgGiECbsLWWDdf1lEh3a9TvBf1XUDNT3bT/kHfIz
         B8q/K0mJDK8OLGswypZEL/zyjrHrnEIEfBX6CEwcZ7/soBv3RPRDGOGyCTtB7DmnJLRk
         xQMZfItTLN8mIFF28ppVOBaQU1fnn25J+SSF5wBfUjM/SwqHg8sP76OgLYJ7JPD+YqQ1
         EwOCQIqAPfSccrbGAwfT7DWi6OCofsQF0R0zCDbVwdjPt/As8LzMKe/oU59nBYy9jhh+
         hlMw==
X-Forwarded-Encrypted: i=1; AKwUvByBZpy+QNUhXkm3elZjWNxnfFgenUJS9HG37/IyQgeoAl75cGxOtXeNkESWuwOn6YsmDHGQoMPcXHLfmsi4C61V7A==@vger.kernel.org
X-Gm-Message-State: AFuF++lb74M2ISx1UFZHzZJyEk+Y/WkKDmmimBQ7/2tVqPM6LG93SROS
	4Su/wplqhCvw6YI889QPVIDD4Ur54fRwYcqFKMyEfYkIxjnKX6WSRC0S
X-Gm-Gg: AYBFou3YSAiPdsfvXkUms5jYAPPitBGR2/nGeEjO2RA7dHSu9nuS4UGUNPspLdP4AXG
	/R6ZxqzjYJ5EShr6eKD6fIsj0lCA+U5vdyoz7h5VVEFvR+1Py/mTWJzVfmdlFCmD/BvYnAZrqAH
	lnLSdGNGsQXnXIagPPefNyrfyZEo5fkN83oKTDS+XK3Bw5dRJf+K8HM2Txp9nZkQaGWkpPLd2//
	9zlJa99MEFRWH8B8qG8RMa9G95x4ZrU76dhIRWjehMD7bo8dFCQ9YSQB/GuwhLclObp6/amngFx
	xSszTy2OL3hJdqECPVqIVoFFd0xfForHFdGhJRiU5MOAatjXnpFyz+2ZMKxB/kZWeGS9wGmsuQP
	9ZKEqyvTz4h/B/0NNF7g1InplTHzoBDlDeON9iZPBbjttm6aBpDi4d4mmaEWSpbqAdzRxXVQEdl
	Y6EsYrFB/B2tuqQTA7zCgys5f4TSq2PjXyK3nODKHLGCePu38dkfaXEPgXmMktv50GjHho7V98f
	u+ssaV0N/DEV1QgU2qc5vT+0ITb
X-Received: by 2002:a05:6820:c86:b0:6b7:46e9:96f7 with SMTP id 006d021491bc7-6b746e9a200mr2294144eaf.39.1788529605201;
        Fri, 04 Sep 2026 06:46:45 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:3ed6:cbf9:9a8:24d0])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339a534d25sm7174899eec.5.2026.09.04.06.46.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 06:46:44 -0700 (PDT)
Date: Fri, 4 Sep 2026 06:46:40 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Lee Jones <lee@kernel.org>, Mark Brown <broonie@kernel.org>, 
	Charles Keepax <ckeepax@opensource.cirrus.com>, Arnd Bergmann <arnd@arndb.de>, 
	Sam Protsenko <semen.protsenko@linaro.org>, Peter Griffin <peter.griffin@linaro.org>, 
	linux-input@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Linus Walleij <linusw@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, patches@opensource.cirrus.com, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Russell King <linux@armlinux.org.uk>, 
	Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Subject: Re: [PATCH v3 07/10] mfd: wm831x: support software nodes for DCDC
 regulators
Message-ID: <aprLYn4VzSTnZWuw@google.com>
References: <20260711-samsung-kp-v3-0-b2fcaba77aff@gmail.com>
 <20260711-samsung-kp-v3-7-b2fcaba77aff@gmail.com>
 <0306eaba-b59c-4f8b-9151-9f39685398ba@kernel.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0306eaba-b59c-4f8b-9151-9f39685398ba@kernel.org>

On Fri, Sep 04, 2026 at 03:41:21PM +0200, Krzysztof Kozlowski wrote:
> On 12/07/2026 04:12, Dmitry Torokhov wrote:
> > Allow passing software nodes to wm831x DCDC regulators via PMIC platform
> > data. This is useful for non-DT/non-ACPI platforms that want to
> > associate device properties (like DVS GPIOs) with the regulator devices
> > using software nodes.
> > 
> > We add 'dcdc_swnodes' to the PMIC platform data 'struct wm831x_pdata' and
> > have the MFD core assign these software nodes to the buckv cells.
> > 
> > Assisted-by: Antigravity:gemini-3.5-flash
> > Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> > ---
> >  drivers/mfd/wm831x-core.c        | 47 ++++++++++++++++++++++++++++++----------
> >  include/linux/mfd/wm831x/pdata.h |  2 ++
> >  2 files changed, 37 insertions(+), 12 deletions(-)
> 
> I still need Ack for this from Lee... and the problem is that you did
> not Cc him.

Hmm, indeed. not sure wheat happened...

> 
> Please resend everything or spin v4 with MFD maintainers included for
> acking.

Maybe you could take patches 1-6 now and then I'll continue with the
rest of cleanups?

Thanks.

-- 
Dmitry
