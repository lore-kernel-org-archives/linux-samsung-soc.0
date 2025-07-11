Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 744932AE6D
	for <linux-samsung-soc@vger.kernel.org>; Fri, 11 Jul 2025 15:49:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752248993; cv=none; b=acUJ/m1ZZvcp5/BqgPsi8FGaX8bVjyFFmXG3jbKCiAfPHRZNfpBpdcXUbkx5Z4Ka0TPMbutDfJd5P7C9stHCLLrvUmItvvDVfbzo8/fbHRhoJvIOCQfkKYo5ilHpl2/J2olwx2UOJk3Xd+O6SRcNNZLAnH9iz7D8cI6p2u07r2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752248993; c=relaxed/simple;
	bh=MsFHUVPklolt2MNco1FGwnCw+YjUi5Piu0whohjo1RU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tX9cjbwMnA/ElG0kgPJJFmeEEfSPf001pWYaPr7GGmUdoNaqAnN2E6cVlSpNXGCBhNIf0fJAd5QWR6/MDHmnRmtMOAVCT7a5+Qd/x6vuGSFsej+7Nql6PBsE+TKBJlZI/TT1OpB947Gzsv9YCblIQAZRKvnL4S8+v6ovazELSb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dSXC5dMJ; arc=none smtp.client-ip=209.85.167.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dSXC5dMJ"
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-4067b7d7e52so728336b6e.2
        for <linux-samsung-soc@vger.kernel.org>; Fri, 11 Jul 2025 08:49:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752248990; x=1752853790; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=kpWDwlYEFZONP4nYRAFW848J3k8ajKrSnxZeLFk6ATw=;
        b=dSXC5dMJKTkDCKDR3hxL6KnHhdvSuCc8ZtK63/byHWSqVlmLyZ2B276QXZQxXyy8Sp
         N9DKuDipaiAMvkafrTo8vo5x/4TTkXE3KY1EaUY+Fcscp4ftFQQZLBwYgnGjqTZpIN3L
         Xdl1Duzw2Wjazr13EXaxZlk+/yuusZX5bgxgCzsTq9SNCCzEtFEba7wYajKj47jaFMom
         WaAZYr6ihIc05qfq8RwuVmn+HRW/HRhOSUmD3zy1xFVyGHHXmPf/TtUR9TvIbunry0IS
         d1RJPZZHgYtZ5mFEhJ0qGroisgk1rtprsRTHuUv5tqS6s1VTHTTtGI86bWvSpHJkMTD0
         MKVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752248990; x=1752853790;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kpWDwlYEFZONP4nYRAFW848J3k8ajKrSnxZeLFk6ATw=;
        b=PnyFmfVR2jpiC5SqyVa2fdIu9y3n3jsryoCMQheN/46j++r2RfepS4II4QuxbMJjhy
         sQ05dbF6g7oKFqyZxlmat7tO3RdWTzDvWJ3jRhAR7TUm6g0QUfXW0A5pCpSbLiVU0PdZ
         gU+GtVYO0VMKrRYmiCZB9sZAmhMUal9I0RCXDPAGla6D9lo84HruOuNM7kmTpwrdYvQb
         ODOjPSmI5nJD2ilUHg08DVcxnU8axzt/MxHF15LUE+7xcFCltqMq+2GQdnIoVd1TeKR+
         prlIDpbiNncH+esssjZQhIHYCU2CKgpsxkYnGsDfeceHEO2R9YpwjzjPcii73YcYWNtp
         3DvQ==
X-Forwarded-Encrypted: i=1; AJvYcCVV4S/Yp3OeRYsQAupUOG/EaSbk3Hu3DdJxyK1amjF2+pvoCHrPMvGwt5APcwjA7t2X02EbHKL1LKanSEIxIJLQqw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwLZomIPeqY8qmGJQN7X4O7fjDpc8H8bhAc5vNJF5q1u4NNssYu
	4rnV7pYqucHyam/oH2FYoQgfW22mCz9MqvR5Ii/GVqZ/EAkT4oGcO7wJeq+jbolXs1CmMxU/exX
	IwxhPrM/PVuRjndSfDKh8X7LLW/DNhFag+AFkjodu1A==
X-Gm-Gg: ASbGncvs0YDx2EK3eJHlO5TYhS+livBrC7E+ZS9uf1/F8U5FA3XV0riZsSUEE/x2efj
	roiah9KS9zT6dsvR/8B8u1giYBqvM8T6PZWk9MyWaKz6LNb0sXKnL633+R4XnQyosJpprwxejyA
	SJ2XhvZex63J8ECjUdePknyUqKgkks99gSRv+fWIUMOEHgcLiYZu2+ulvTS0VuEkIAfAMY0oqrM
	Vam4uM=
X-Google-Smtp-Source: AGHT+IHv1hWw2pZQOckg98iZ5DP8H18RgsI97u/wmdJaWiqskQQPUlSUM7hA7IGFfKLNfKIFCIMEQTMIDL5dj9i09a8=
X-Received: by 2002:a05:6808:1a14:b0:406:5a47:a081 with SMTP id
 5614622812f47-4150dc288e1mr3095704b6e.13.1752248990474; Fri, 11 Jul 2025
 08:49:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250711-gs101-cpuidle-v6-1-503ec55fc2f9@linaro.org>
 <aHElXbj4-T--QqKk@bogus> <aHEmB-K7Pf7WOswk@bogus>
In-Reply-To: <aHEmB-K7Pf7WOswk@bogus>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 11 Jul 2025 16:49:39 +0100
X-Gm-Features: Ac12FXyPP2ayGhZhRKT9piHwpXNM8Cjgh20ByzhOS5Y4tdqk1oaHtAN9grK3Fzg
Message-ID: <CADrjBPrRbSYXVg5KyNB8Z9qLkZ2sGzEUcP+nf2UP2rVm2T7bSQ@mail.gmail.com>
Subject: Re: [PATCH v6] soc: samsung: exynos-pmu: Enable CPU Idle for gs101
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, William Mcvicker <willmcvicker@google.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"

Hi Sudeep,

On Fri, 11 Jul 2025 at 15:56, Sudeep Holla <sudeep.holla@arm.com> wrote:
>
> On Fri, Jul 11, 2025 at 03:53:17PM +0100, Sudeep Holla wrote:
> > On Fri, Jul 11, 2025 at 02:50:26PM +0100, Peter Griffin wrote:
> > > Register cpu pm notifiers for gs101 which call the
> > > gs101_cpu_pmu_online/offline callbacks which in turn program the ACPM
> > > C2 hint. This hint is required to actually enter the C2 idle state in
> > > addition to the PSCI calls due to limitations in the firmare.
> > >
> > > A couple of corner cases are handled, namely when the system is rebooting
> > > or suspending we ignore the request. Additionally the request is ignored if
> > > the CPU is in CPU hot plug. Some common code is refactored so that it can
> > > be called from both the CPU hot plug callbacks and CPU PM notifier taking
> > > into account that CPU PM notifiers are called with IRQs disabled whereas
> > > CPU hotplug callbacks are not.
> > >
> > > Additionally due to CPU PM notifiers using raw_spinlock the locking is
> > > updated to use raw_spinlock variants, this includes updating the pmu_regs
> > > regmap to use .use_raw_spinlock = true and additionally creating and
> > > registering a custom  pmu-intr-gen regmap instead of using the regmap
> > > provided by syscon.
> > >
> > > Note: this patch has a runtime dependency on adding 'local-timer-stop' dt
> > > property to the CPU nodes. This informs the time framework to switch to a
> > > broadcast timer as the local timer will be shutdown. Without that DT
> > > property specified the system hangs in early boot with this patch applied.
> > >
> > > Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> > > ---
> > > Hi folks,
> > >
> > > This patch adds support for CPU Idle on gs101. In particular it achieves
> > > this by registerring a cpu pm notifier and programming a ACPM hint. This is
> > > required in addition to the PSCI calls to enter the c2 idle state due to
> > > limitations in the el3mon/ACPM firmware.
> > >
> >
> > I would rather keep the above note as part of the commit message or the
> > code comment as this will get lost when the patch is applied which is not
> > something we want. I clearly want to loudly shout or shame the broken
> > firmware for not getting this right.
> >
>
> I did see the comment but still thought it is worth adding the note in the
> commit log too. Sorry for referring code comment above which is wrong as it
> is already taken care.

I mentioned it in the commit log, a comment in the code and also the
cover letter so I think we should be all good? In the commit log it is
part of the first paragraph.

Thanks,

Peter
