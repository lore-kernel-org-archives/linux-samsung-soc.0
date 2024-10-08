Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D95B517CA02
	for <linux-samsung-soc@vger.kernel.org>; Tue,  8 Oct 2024 10:30:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728383455; cv=none; b=n2DiGHwqzkPojuAf8nnfxd4pIgdfpW/8EGraxfhrw8B0kacJtxADUFMbp1nT5O32XULdd+hVg/PEtoS2JSbmtiq1hoO7iFPORUPNMcQRKtMW/2MFQ/CNqFAJC+KUZQybZKFrscgKPvMJApvZDF4cVar4h56tux45yTsq60nYcyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728383455; c=relaxed/simple;
	bh=gRzWGABLBOYGZ5156Vsju1jZYGhriRM78cFt0cWliaw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=As7Pwi/MPoDtrin/4ntGvv/6nrlGfc5D7Tp38j5pv85foeCiCQxdkTx6WLfdm3oW6FeQfcHG02UG+r9Wo4x1o8U9umm79ZAkpYi7JKzSC0J0J/IC4JB0CYHx8QKwmtylaiuIs9STGA9UpHl49IUajvKT19pxlvqMal3E3Tsyh0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KBghyJgc; arc=none smtp.client-ip=209.85.167.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KBghyJgc"
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-3e04801bb65so2917400b6e.0
        for <linux-samsung-soc@vger.kernel.org>; Tue, 08 Oct 2024 03:30:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728383452; x=1728988252; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=RaHMxhDG9Q5VfYwqCidMK07jWJtcWPqFxkIOCBw9G7M=;
        b=KBghyJgceIwJhY5YKVjX/Mu4NdqBigrke4dJGuKwykJUd1xowQS5V8dBVPo9fHuFlb
         DJSc2y4Omi9K6o0vegq9K9xhlydHkmLGTjhaLePBU5ZxM9aXRczbTGwhfFNmg9Khpwde
         Wx57JLXAMpufJYPI1RDg0czJ7bugsOwAbFzOD5zDcPdXcJa09GKb2+xnIonIO+gG7Y+E
         L0icWPiFG2s7kQN6Ix6eMrUyX5wi+eggxKZ2yoF3eT4fXyw0BmMPqKG9saJYHj675c42
         5oGSNCvJlYiqFq3Z2oB6sWShqLFl/e8uvRuy3vyuYsB8DmOLfmb3RZ2A9v4rM+UHnGtK
         DCdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728383452; x=1728988252;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RaHMxhDG9Q5VfYwqCidMK07jWJtcWPqFxkIOCBw9G7M=;
        b=i8jrAcJ9auzge30geieF2XUucKf0as+CXEiI7GE9JFAzyAg3kuY8QGPWCeH+lFXqvl
         BicmwJMOSPypa5fKAwrf35Ui0AEWMKaUH797mB/KcJ98yWkb9oXEmmmfY8UHgNhaT+Uc
         ikoglvTbgURFU6njoCs6DZ79BXjSLGX6sAtLpNAlzoU0JH0t3cnjeE/xd0V6dY+DUO1v
         J/OPRxiTMypqpisWObVCRqocwJitHKKdfdSD0h5c953OLLvdIWeSNeAqDFZm32CYD82T
         nNzo5c4iCIWpBWLa1nh6EDNisUfTGbBnG+oilrm2IeAnsPRy7oMDY4y/y1OLNiPxdnrE
         w78Q==
X-Forwarded-Encrypted: i=1; AJvYcCXI76aK3GYVz/OyODf5OMNc5MZDZ6nBDjQ6BVIQ0Vn5FvYGGYU6nkWc/0dO29Pels+EplQ2lv3sQAY644IxATqS7g==@vger.kernel.org
X-Gm-Message-State: AOJu0YxsIpYsKedxbqVh13aOEhsfWWK5t9qQaGt86g0PHn82H3s3QudG
	E47vOcw6u3NA7If0o/2YB8WJYr8sG+nye2W1/s1jf9Mp6nL/IARGpDB8cYAMLm3pAlVCuKxv6QA
	QZdk9Gqf7oWyib5FLjVTzTV/YCpWzphxKuJmm/g==
X-Google-Smtp-Source: AGHT+IECvbGsHbDZVwRBHFdZOxOBV8fzhLQbc98HH+KbY0vj5cIu1DHOWiwPL1MGN/TExuJHK09aKSFF/Y+e5zkJckg=
X-Received: by 2002:a05:6808:1927:b0:3e0:49c6:d580 with SMTP id
 5614622812f47-3e3c177c251mr9658210b6e.33.1728383451979; Tue, 08 Oct 2024
 03:30:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241002201555.3332138-1-peter.griffin@linaro.org>
 <20241002201555.3332138-2-peter.griffin@linaro.org> <ZwN/d8l7Mk6x2GHP@vaman>
In-Reply-To: <ZwN/d8l7Mk6x2GHP@vaman>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Tue, 8 Oct 2024 11:30:41 +0100
Message-ID: <CADrjBPrRrwEyg0p+6kfVoZGbPdvW6K3fa9paUoLyg_bHHScgHg@mail.gmail.com>
Subject: Re: [PATCH 1/3] phy: Add UFS phy hibernate modes
To: Vinod Koul <vkoul@kernel.org>
Cc: kishon@kernel.org, krzysztof.kozlowski@linaro.org, alim.akhtar@samsung.com, 
	tudor.ambarus@linaro.org, andre.draszik@linaro.org, kernel-team@android.com, 
	willmcvicker@google.com, linux-phy@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Vinod,

Thanks for your review.

On Mon, 7 Oct 2024 at 07:28, Vinod Koul <vkoul@kernel.org> wrote:
>
> Hi Peter,
>
> On 02-10-24, 21:15, Peter Griffin wrote:
> > Some UFS phys need to write hibernation specific values
> > when entering and exiting hibernate state.
> >
> > Add two new UFS phy modes to the phy framework so that this
> > is possible. One such platform that requires this is Pixel 6
> > which uses the gs101 SoC.
> >
> > Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> > ---
> >  include/linux/phy/phy.h | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/include/linux/phy/phy.h b/include/linux/phy/phy.h
> > index 03cd5bae92d3..1874e55e2bb9 100644
> > --- a/include/linux/phy/phy.h
> > +++ b/include/linux/phy/phy.h
> > @@ -42,7 +42,9 @@ enum phy_mode {
> >       PHY_MODE_MIPI_DPHY,
> >       PHY_MODE_SATA,
> >       PHY_MODE_LVDS,
> > -     PHY_MODE_DP
> > +     PHY_MODE_DP,
> > +     PHY_MODE_UFS_HIBERN8_ENTER,
> > +     PHY_MODE_UFS_HIBERN8_EXIT,
>
> I am not sure I like this. why should this be the model? Phy drivers
> should listen to pm events and handle this in pm_suspend/resume calls,
> why do we need this special mode here...

There are a couple of reasons I added it here:

1) Whilst link hibern8 mode can be used as part of runtime PM and
system PM, it is also used outside of those contexts by ufshcd.c. The
host controller can enable UFSHCD_CAP_HIBERN8_WITH_CLK_GATING (which
will be the case for gs101 / Pixel 6) and the UFS clocks are gated and
link put into hibern8 mode for periods of inactivity. When that
happens the rest of the system isn't entering any sort of sleep state.

2) From looking at the existing code upstream ufs-qcom.c and
phy-qcom-qmp-ufs.c look to have similar requirements in that it needs
to program a set of specific register values depending on the UFS
gear. To achieve that they added PHY_MODE_UFS_HS_B and
PHY_MODE_UFS_HS_A modes here and then use phy_set_mode_ext() API in
ufs_qcom_power_up_sequence() to signal to the phy driver the UFS gear,
which is then used to choose which set of values to program to the
phy.

The two new UFS phy modes added here for hibern8 are for a very
similar purpose (to choose a bunch of register values to program), so
I considered it consistent with what was already being done upstream
to signal between UFS host drivers and UFS phy drivers. Arguably I
guess we could have one "mode" PHY_MODE_UFS_HIBERN8 and use the
submode parameter to indicate whether we are entering (1) or exiting
(0) from it. I wasn't really sure what the rules/guidelines for the
submode parameter were though.

Thanks,

Peter
