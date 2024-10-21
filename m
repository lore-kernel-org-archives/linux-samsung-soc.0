Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6B7439FD6
	for <linux-samsung-soc@vger.kernel.org>; Mon, 21 Oct 2024 11:02:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729508526; cv=none; b=HLmGBEN0W75eid02ujYJ5AvRoSorp1WuQJbXGNS6627uEXIm9TOQ0ODM6qFuL0t0fMqRGHDjRlFu1impeQc76S+5Q+1joKQbGSq07aQFtNSjYcEgB7xjgaDb9t3c1DuRa0ejM1GSN7CTwVlWzaSed7G6iJ0nhZx1GkpNdQCF1UM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729508526; c=relaxed/simple;
	bh=7nNaav5rY0OVijNkjo4ryxicbGYxAKgnlEw2GCf+yrE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nBTlsay/PrQI/WdvWy0mcfhYYrZ1t7dkAweGpuaSkTxCNO6kl3sDFuOeOXz1XG4dGDvK6D74az97FnQHeiaXO6M15r3EK5vZ58IvpPrRe5IDqzK+mootSzHmyLT1xT7gn9HQSB/PmEXhHj2AwdpY9PrEuchKfKZKh/DSE7M1km0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eQ7iSXQO; arc=none smtp.client-ip=209.85.167.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eQ7iSXQO"
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-3e61b3922f8so103579b6e.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 21 Oct 2024 04:02:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729508524; x=1730113324; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3KEnxCRvJxHLUHwDo6LAN7RNla4DoUTlDGrHx8mrkYs=;
        b=eQ7iSXQOiSDfC5h/SoIBPNXmVEi+L+ao8bjcbj2XF6znyJItbpgJ3YwdH6Tnem6JPg
         0gF58vFebF+4ltsceyv+E2kpdSIbVAJ99E5K74+7hkJcCkpEn5PB3ltwZkhchbFUqWt2
         poVduhezCl4r1G4rQs7En8w/WMy/7yrEEudAwmdbF/HNq0E7XQ9e25uk1paJrr4C/7uQ
         sw4V9H8Ry+acArStWFmuYOD1+XUdevH0MOM8Bb9eRvgMBlDiuqC6MGtflo+AGeNVOWdW
         TPqInCf2umkgP/LOekVaRwqzWEbc7waikWkVREYEmRq1CJHACFkFxaRX3rdUPfS5lnm6
         oyHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729508524; x=1730113324;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3KEnxCRvJxHLUHwDo6LAN7RNla4DoUTlDGrHx8mrkYs=;
        b=HhVKYygM+ftEOSlQW3fsZ04p4l+pJC8IPOorVfiqwrn9x5AUrHEojCog3csu48vWqK
         ald1kCmCG6ysFA3wF0735EkSouvQfUGvL7sbA50DfgLpbnP2N1hiFd7i8L0LSiFueJG5
         St+OHP/Fe/nYNvaumrOUzVA9o7SaLRZ1jfCdYfScE202ixN5izloHU67qtaT/nPjk4M5
         RkKx8t+N+MV/r53i4YYZrqVN4elIr9oS4lAPoi8Fy0S+LC6nFin1Ne6Skd5AJi8mpbho
         cOWfZZ81AEp8wHjUFkLN+wGT2cZnFeH9SAeLjvBc90LN+/I7e3wLUKCJwvVU+F1W5eLX
         3QmA==
X-Forwarded-Encrypted: i=1; AJvYcCUYjX3BvceJRdS1VJsotXYSTBevEMTmVArG0VqZbNhaxhsSAnxUNAFIldtnfJfWIIhFr4SWwpuxOMAfersxwT6pbg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwmUcPdCZ4vqXtdF5rCLPFLI1OySoDkIcR0D4t46AhMGOKJwDcQ
	oTaOlRrldW1DF2k6VCDZOFPQCXVclCSWVAEbSaVxg92qwJ164K3mV+uppUAKkAf6JjgbmkAWu9o
	SI9ZQOP1vXI0Tql1dW40kyZHhh0cLmgSPABOrMA==
X-Google-Smtp-Source: AGHT+IHvdIXPDe2YEV1+7SFaHz0hdIX8uJm2BxidzbXIrl1aadRtmsEbTSvHB1GJZ9NGNT34ilz+0JXG84igEBttV/4=
X-Received: by 2002:a05:6808:1284:b0:3e6:147d:f13 with SMTP id
 5614622812f47-3e6147d0fdcmr1647722b6e.5.1729508523794; Mon, 21 Oct 2024
 04:02:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241002201555.3332138-1-peter.griffin@linaro.org>
 <20241002201555.3332138-2-peter.griffin@linaro.org> <ZwN/d8l7Mk6x2GHP@vaman>
 <CADrjBPrRrwEyg0p+6kfVoZGbPdvW6K3fa9paUoLyg_bHHScgHg@mail.gmail.com> <ZxED5/HdlBLWqesE@vaman>
In-Reply-To: <ZxED5/HdlBLWqesE@vaman>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Mon, 21 Oct 2024 12:01:52 +0100
Message-ID: <CADrjBPpyTz6ytYXRkTSYGxhBCTkKjMPmopXyrvbPOQg1OiBcFA@mail.gmail.com>
Subject: Re: [PATCH 1/3] phy: Add UFS phy hibernate modes
To: Vinod Koul <vkoul@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Bart Van Assche <bvanassche@acm.org>, Avri Altman <avri.altman@wdc.com>, quic_stummala@quicinc.com
Cc: kishon@kernel.org, krzysztof.kozlowski@linaro.org, 
	tudor.ambarus@linaro.org, andre.draszik@linaro.org, kernel-team@android.com, 
	willmcvicker@google.com, linux-phy@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Vinod,

Thanks for your feedback!

On Thu, 17 Oct 2024 at 13:32, Vinod Koul <vkoul@kernel.org> wrote:
>
> On 08-10-24, 11:30, Peter Griffin wrote:
>
> > > > +     PHY_MODE_DP,
> > > > +     PHY_MODE_UFS_HIBERN8_ENTER,
> > > > +     PHY_MODE_UFS_HIBERN8_EXIT,
> > >
> > > I am not sure I like this. why should this be the model? Phy drivers
> > > should listen to pm events and handle this in pm_suspend/resume calls,
> > > why do we need this special mode here...
> >
> > There are a couple of reasons I added it here:
> >
> > 1) Whilst link hibern8 mode can be used as part of runtime PM and
> > system PM, it is also used outside of those contexts by ufshcd.c. The
> > host controller can enable UFSHCD_CAP_HIBERN8_WITH_CLK_GATING (which
> > will be the case for gs101 / Pixel 6) and the UFS clocks are gated and
> > link put into hibern8 mode for periods of inactivity. When that
> > happens the rest of the system isn't entering any sort of sleep state.
> >
> > 2) From looking at the existing code upstream ufs-qcom.c and
> > phy-qcom-qmp-ufs.c look to have similar requirements in that it needs
> > to program a set of specific register values depending on the UFS
> > gear. To achieve that they added PHY_MODE_UFS_HS_B and
> > PHY_MODE_UFS_HS_A modes here and then use phy_set_mode_ext() API in
> > ufs_qcom_power_up_sequence() to signal to the phy driver the UFS gear,
> > which is then used to choose which set of values to program to the
> > phy.
> >
> > The two new UFS phy modes added here for hibern8 are for a very
> > similar purpose (to choose a bunch of register values to program), so
> > I considered it consistent with what was already being done upstream
> > to signal between UFS host drivers and UFS phy drivers. Arguably I
> > guess we could have one "mode" PHY_MODE_UFS_HIBERN8 and use the
> > submode parameter to indicate whether we are entering (1) or exiting
> > (0) from it. I wasn't really sure what the rules/guidelines for the
> > submode parameter were though.
>
> Yes but not exactly. The HIBERN8_ENTER|EXIT sound like PM events rather
> than a PHY mode. If this is resultant from inactivity, then we should
> hook this up to runtime pm ?

As I mentioned above HIBERN8 is implemented and runs independently of
runtime pm in the upstream UFS stack. To be clear that isn't a
ufs-exynos thing, but rather the core ufs stack in
drivers/ufs/core/ufshcd.c.

I've added Bart, Alim, Avri to this thread, as they are listed as
reviewers of the core ufshcd file and also Sahitya who originally
introduced this UFSHCD_CAP_HIBERN8_WITH_CLK_GATING functionality.
Hopefully they can provide more details as to why hibern8 has been
implemented like this outside of runtime pm. The original commit where
this was introduced is

commit 1ab27c9cf8b63dd8dec9e17b5c17721c7f3b6cc7
Author: Sahitya Tummala <quic_stummala@quicinc.com>
Date:   Thu Sep 25 15:32:32 2014 +0300

    ufs: Add support for clock gating

which mentions in the description that the timeout is typically less
than the runtime suspend timeout.

I think the main difference here versus other SoC UFS controllers and
UFS phys is that the others don't appear to need any additional phy
register writes when entering/leaving hibern8, which the ufs-exynos
phy does. It looks like all the hibern8 callbacks upstream in the core
UFS stack were added by Samsung for ufs-exynos. In downstream they
don't split the ufs controller and ufs phy parts into separate
drivers, it is all done from the controller glue driver so it isn't an
issue.

With regards to whether it is a "mode" or not, HIBERN8 is a M-Phy
power state, but then PHY_MODE_UFS_HS_A and  PHY_MODE_UFS_HS_B are
also m-phy power states (HS_BURST with rate A or HS_BURST with rate b)
so it seemed in keeping with what you are already doing here.

regards,

Peter.
