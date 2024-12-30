Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A4501A238C
	for <linux-samsung-soc@vger.kernel.org>; Mon, 30 Dec 2024 09:10:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735549832; cv=none; b=XESZNf+O2t9hNuVNIf/O5Sp4Zxii4Oz9Rqo9/masWnASyFcsdA2yZ+xvcnPAgEuHIgphXEd0Pa4q+vWv3M9z3SbU4VYq2N3C/+a8m35SZ6H+YU+1rzNWbj4RRdPbetVjNP7rzw/fWAQTP7zcsuTLh47o8iJIO7SwH8W2207uGdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735549832; c=relaxed/simple;
	bh=4oDYwfmWwrntu/5R7qEyL0UfVIX5O+dFzo5oPSRGiUQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VDaI4+Bc3BP4j1wfu7ceds7mDK5YuW1BluBAsng1FZkMrRRJkCb02Dgq4YvC59p68FO4QtWFY6IwHOkVvXgOo+ZQsyQq/kROB8hpGUQ2f4NMMX/QnMOAnuEewcFuro3WBkPYNI/+L4VmwT53UFhvbiQuK5AAMobBhHbL+zOtpM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=o9I0MhAu; arc=none smtp.client-ip=209.85.161.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="o9I0MhAu"
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-5f2ed0b70d6so3513678eaf.3
        for <linux-samsung-soc@vger.kernel.org>; Mon, 30 Dec 2024 01:10:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735549829; x=1736154629; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4oDYwfmWwrntu/5R7qEyL0UfVIX5O+dFzo5oPSRGiUQ=;
        b=o9I0MhAu1U7HwgSAVdEGXKu1DVgFCXfidBySxXlhb+0b+lqLE2lrQ+eZ7RQXYZ0xuk
         NJEF48ZquRtqY6pmjOVwq1ikPpBTZH50kOWzTwJDy0Bxb3CCwX4HyR9hRa0bMLiNA1vu
         U7iVhw0vBP4AkyO+4mIaDf5mh6wV/X6D4Q+lnDm3j1ZUi+t+PKlnC7TedmwR1qb3EpVG
         Kd0x39M5fxTTZpmmWYk07DW/hgn5PCmJcusEEP0mfLz+O5PX0+vSDqpbcPdMXOmCgHyB
         Ah9AofQ9F9Op3+Ozy4i62icgaZ+BgAxPhoz4GwW/07w5TWLtTE5W+KgcYyM3QQ5biLTZ
         9W5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735549829; x=1736154629;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4oDYwfmWwrntu/5R7qEyL0UfVIX5O+dFzo5oPSRGiUQ=;
        b=dixUuC6udjLc9e3pvtrlspQ+BVKrbdljU8drkkwiRQ4yxec9n+yDzAksnuP3VZtipw
         hoWtvwyey8AdZnWe1W7Xh7OfZ70mlNHbblJuOWvMOvO1+WqTQ/9j1tSC3S2Vz5NFqGIm
         cSrgiO7rDAd4T3J9mairoae8D8dG9rQahO399UooCvUz6Wv/8SMopSSjbEyZ7GilYyMv
         ctIxEjk8ggXn6dUyqc2U1FVt9cI14Aam4PSLvaUbC/ZPjpR7VdL/aOBcXQpqVjl22U2G
         IRJIJGZDBzJ4HUoaCj+R1giNjk/nkvTVs1h1/KzNNRH8sim+iNXlvfy087MakHRiKZNd
         5qOA==
X-Forwarded-Encrypted: i=1; AJvYcCUELc7tdZH1qwaXMYLkwsDGNmf4hkZeg9N7LylBHKfobqh22GGaq2v7NwvSIrN4kay+BXn0JB+j66ChbrgNVgeHLQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzRiSMnGX8xWTwOi7ElzKlbbRNAtwqhk9Zb6VHRo493QFV12ViJ
	7VGNu1mQxUsWTjK0OkTNGlCVQcIZ4LlCj6dcDJ7E6mfSXKQJ8vI4PHVpXQGxSF3EP1RzA3D4Ky2
	9hfGNL2F1klL0NE6TgE457xMo2D7aC85OSEVUYw==
X-Gm-Gg: ASbGnct9zItGN8VYu/5xyurZgL8ROWHNy4cdk/XrZm4GcS50rDy7FUtJt9ENbdiwFz1
	53vPaUIAO2zVPkJBDPgooma4Y1ZPEVFN12jqQZQ==
X-Google-Smtp-Source: AGHT+IG00P+bZtTAkQqWziOeW79L1OrLv1yTEyciewwrT3FRO22FXOr3Xvn5NA3178HyMuWVeJiRoWS8XUOV0qbPyE8=
X-Received: by 2002:a05:6820:1905:b0:5f6:aa5c:8cb9 with SMTP id
 006d021491bc7-5f6aa5c8d96mr3825959eaf.1.1735549829414; Mon, 30 Dec 2024
 01:10:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241213-contrib-pg-cpu-hotplug-suspend2ram-fixes-v1-v1-0-c72978f63713@linaro.org>
 <20241213-contrib-pg-cpu-hotplug-suspend2ram-fixes-v1-v1-2-c72978f63713@linaro.org>
 <1408dcd1-9a46-4cb9-8443-5aa51d61ed56@kernel.org>
In-Reply-To: <1408dcd1-9a46-4cb9-8443-5aa51d61ed56@kernel.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Mon, 30 Dec 2024 09:10:18 +0000
Message-ID: <CADrjBPre_zjh+i=_YKYiptiMWT74eWC6LDCveA=dJaQQVwkS0g@mail.gmail.com>
Subject: Re: [PATCH 2/4] dt-bindings: mfd: syscon: allow two reg regions for gs101-pmu
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	tudor.ambarus@linaro.org, andre.draszik@linaro.org, willmcvicker@google.com, 
	kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"

Hi Krzysztof,

Thanks for your review feedback, it is much appreciated!

On Sun, 22 Dec 2024 at 14:24, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On 13/12/2024 17:44, Peter Griffin wrote:
> > To avoid dtschema warnings allow google,gs101-pmu to have
> > two reg regions.
> >
> > Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> > ---
> > I don't really like this patch, but also didn't want to submit the series
> > with a dtschema warning ;-)
> >
> > Possibly a better solution is when Robs patch
> > `mfd: syscon: Allow syscon nodes without a "syscon" compatible` [1]
>
> PMU which spans over two blocks is not a simple syscon. These would be
> two syscon devices.
>
> If you request regmap from such syscon, which regmap you get?

That is a good point, if other drivers in the future need access to
the pmu-intr-gen registers then it would be good if this was modelled
as its own syscon device.

Another point to note is that only the PMU registers need the custom
regmap registered in exynos-pmu, the PMU_INTR_GEN register region
works with normal syscon / mmio accesses, so it would be a different
regmap.

>
> I am not sure whether the PMU is really split here. Usually the main PMU
> was only one and additional blocks called PMU were somehow specialized
> per each IP block.

PMU_INTR_GEN has its own entry in the memory map, so in that respect
it's a "device" (it has its own 65k SFR region).

PMU: Base Address 0x1746_0000
PMU_INTR_GEN: Base Address 0x1747_0000

The documentation isn't particularly detailed on PMU_INTR_GEN. In one
place it says "One PMU interrupt generator for handshaking between PMU
through interrupts". In another, "PMU and PMU_INTR_GEN are for Power
management." and then we have the register names where the description
it really an expanded version of the register name

e.g.
Register: GRP#_INTR_BID_ENABLE
Description: Interrupt Bid Enable
Reset Value: 0x0

Things might be a bit clearer if I had access to the firmware code on
the other side of this PMU handshaking which I believe is the APM, but
sadly I don't.

>
> Maybe you have here two devices, maybe only one. If it is only one, then
> it is not a syscon anymore, IMO.

I was going to suggest modelling PMU_INTR_GEN as its own sycon node,
and then either: -

1) Updating exynos-pmu driver to additionally take a phandle to
pmu-intr-gen syscon, and register the hotplug callbacks.

or

2) Create a new driver named something like exynos-pm or exynos-cpupm
which obtains the PMU regmap and also a phandle to PMU_INTR_GEN
syscon, and register the call backs.

Is there any preference from your side over approach 1 or 2, or maybe
something else entirely?

Thanks,

Peter
