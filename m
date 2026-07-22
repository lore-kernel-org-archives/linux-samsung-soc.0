Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com [209.85.222.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3BDF353A6E
	for <linux-samsung-soc@vger.kernel.org>; Wed, 22 Jul 2026 16:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784739443; cv=none; b=QMq4EoN8EsshSCU/GZ+25pZNU5jodSInIUC2dhcT/5F6hX64mNtbJE3Xunk/CDgPsxFQR5ZKxuWsY4g+Ccna9xeYMvvlVNDht2Vv898PjXdOmWWxqkE80jVFbW9IicCvENxJe6wzzuGmFicu27kXooFdBnxmiw14esOTFif4M4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784739443; c=relaxed/simple;
	bh=wEYFAq4AuY+FzksAFP6rIn759EzN+icZzsnHDMDm53o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tVzXx+lGMKnlMKCgSdn0Ca2W9k5bIiWVhiR/DaZA59C7fS/+/rmlPioPqspT7D8Bcbd2LOjS4Jr7bgAbZi4Mce6EpQAkSkcFPUmWCmZ4lBWXQd/i2xBKW+o8xRQXKprtybf8eFJl4OLA1ZgLCtMx5EgumrNPFh5srqT2Ry9aR1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=SNB4P4sb; arc=none smtp.client-ip=209.85.222.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="SNB4P4sb"
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-966d70b9e1cso4306984241.2
        for <linux-samsung-soc@vger.kernel.org>; Wed, 22 Jul 2026 09:57:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784739440; x=1785344240; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wEYFAq4AuY+FzksAFP6rIn759EzN+icZzsnHDMDm53o=;
        b=SNB4P4sbncU9/09vv0KT3Flxk30vqfITC6Ujf7ERdE+0im1Sc6gFJYfw8QCCZS3Hmo
         +7fnHFV/l7uFgJoqk6qaJGi/hLmNP2aatcBhYjm9HKyUum3n4nx3/lc6XmOjY6gIdP5H
         AuPVmJ2o3/FsLY9oLGBPO3J4NEhTcgny7mEDU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784739440; x=1785344240;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wEYFAq4AuY+FzksAFP6rIn759EzN+icZzsnHDMDm53o=;
        b=qZ6rfdgCfb2A/35JZHPmcjmDbyhxnCkdKaCymfwiymh7Om02QGiqcU3NrAy1KzFxoH
         nrOQVgywS8bEZR5twX4o3fTo1LCbQEhDvcWg2Bmi2OO1Bgr39csB1KB64ljFCBRMo7g5
         oJYwBx8GRmwzspfxsawnRLSVfYVrj3Owamcw3Qh0+1+x11LfKNJMZCb9FG1OEadXpvar
         Ac1Go2GP1iVm+TpqxX1l/s1ZkNI5NhZ9yYw9xoViTZAr/76U8NJ4/K1HWE4qtyq1GNJ4
         Q/SxKRIgjQtzTFvDfRqRXQNijeBLyKvKAOXHxPTqhvAZAjh+oNG34ZfBDDf2L3zkGVIi
         ETUw==
X-Forwarded-Encrypted: i=1; AHgh+RonlZr8oylSNypXFWNrI1nvBaW513AIdigAYirHGTkG7bpNTUiXiOFzlit3kGOjhlalL6jtVtDlvYOUMXuUOZ2r/A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8Oz/kBvWVXUo/x8ZKl+M/UltLl+a7XE+OBMsraqv1WIS+97/M
	BO/13OBP6CG2fREtL5y0H1j+5b+3nnt0i8XZBEYQUHlEWM0awd56ZStr25D5SBPPQuuWkc/MM02
	Kl3k=
X-Gm-Gg: AR+sD10Pa/eCDY0ASiI99ms6s4bmDTFmLdFRzijJgsit7U/pm9gugz2suzdt+SG7dbZ
	oO474u9cWQG8dHDoWaw745HLZioyGETVpIyBMenn7Tq07jo2dJgzfrz1gj7SN5i+seLQAtVnT8e
	k2KKqqb4eX0GI3bC5uoEXLvtTyRmRg+r8lRPfq/QNO2IulETyM6FsoKDwaAuxIAI7dQOszwINPx
	en/9HSFu3X1HeRJPyHX457sWKtv4v8bm2yDnntvyqls6b3k+8APojCeD15fRI1xUnqAgIKKWuTP
	Tfi2NvJA0p2Ad7FOJFb7DMo4QYBdWrxNRGgvptITHqJ+AR1ggOQBU7D9rNsoy+c8QuMMrs+A/3j
	JTVLfW/HngxIlk76iarWH2b2PvkQJKqar28JJJyuormx+GMSR3k09qi51Nq1hRnxHvI6VUAl94b
	/7OTepwNBvkWFPgqkD0kE2S7V1kWVKNqS/VudAi6MCJMV65PFsUh4aCiU=
X-Received: by 2002:a05:6102:3e13:b0:739:15ef:cdfb with SMTP id ada2fe7eead31-7475343f072mr8881225137.5.1784739440326;
        Wed, 22 Jul 2026 09:57:20 -0700 (PDT)
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com. [209.85.221.179])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9774424ce26sm2671151241.13.2026.07.22.09.57.19
        for <linux-samsung-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jul 2026 09:57:19 -0700 (PDT)
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-5c2c46a428eso789244e0c.2
        for <linux-samsung-soc@vger.kernel.org>; Wed, 22 Jul 2026 09:57:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RoUyAyGmGEuo2fOtbfnbwQUmI36rrLaTrasEJ6N9SJ25Hb2Zt1SQpOJ6idj1PwYUrbzTTwcteyxrNUwFk8mrCd0Uw==@vger.kernel.org
X-Received: by 2002:a05:6102:1612:b0:6e7:5c89:3fc0 with SMTP id
 ada2fe7eead31-7475374957emr9783635137.25.1784739438261; Wed, 22 Jul 2026
 09:57:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260714222338.2965707-1-dianders@chromium.org>
 <20260714152138.6.Ia186a29119b4b5c409815b755e0c2c3965b0495f@changeid>
 <8e3025c5-16a0-40d7-affa-098ca37699c7@kernel.org> <CAD=FV=Vrd9AxO-NY_CP2h+f21qt4uGY2pOoFgacV+G5bnfd32Q@mail.gmail.com>
 <20260722141004.GB548057-robh@kernel.org>
In-Reply-To: <20260722141004.GB548057-robh@kernel.org>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 22 Jul 2026 09:57:07 -0700
X-Gmail-Original-Message-ID: <CAD=FV=V=ZdgC4fY4PadBFxomeqVD0E0CdeD3=PrcCFB1brXgWw@mail.gmail.com>
X-Gm-Features: AUfX_mwQnLQAqN0MjW9caLrzNlzhz2FE4RbdPofEVajHvqOI-LXTbiHSC_fioOY
Message-ID: <CAD=FV=V=ZdgC4fY4PadBFxomeqVD0E0CdeD3=PrcCFB1brXgWw@mail.gmail.com>
Subject: Re: [PATCH 6/7] dt-bindings: mailbox: goog-mba: Add goog-mba mailbox bindings
To: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Jassi Brar <jassisinghbrar@gmail.com>, 
	Joonwon Kang <joonwonkang@google.com>, Subhash Jadavani <sjadavani@google.com>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Lucas Wei <lucaswei@google.com>, 
	Brian Norris <briannorris@chromium.org>, Peter Griffin <peter.griffin@linaro.org>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Jul 22, 2026 at 7:10=E2=80=AFAM Rob Herring <robh@kernel.org> wrote=
:
>
> > Sure, it means that if someone unexpectedly makes a new Google
> > mailbox-array that's totally incompatible then the
> > "google,mailbox-array" sounds too generic, but that doesn't feel like
> > the end of the world. You could call the new mailbox array designed in
> > the year 2037 the "google,2037-mailbox-array" and things would overall
> > be less confusing than using the "google,lga-mailbox-array" as the
> > generic.
>
> What exactly do we need to do to stop having this conversation? We've
> done this scheme and version numbers and it never ends well.
>
> The reality is the h/w folks can't help themselves from changing things,
> so nothing remains unchanged for very many generations.

Stop having the conversation with me, or with everyone?

With me, I'll stop pushing since I think I understand pretty well
where you and Krzysztof stand on the matter now. Even here, I wasn't
pushing hard on the matter but I was trying to understand exactly
where the boundary was. As I understood it, things with enough
"identification" to disambiguate themselves could use something more
generic, especially if no preexisting binding existed. I clearly
misunderstood. Mea culpa for the noise on this one.

I'm not sure how to avoid repeating the conversation with the rest of
the world. I think this will always be a confusing topic.

-Doug
