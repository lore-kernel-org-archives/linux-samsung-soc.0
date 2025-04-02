Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD40E5BAF0
	for <linux-samsung-soc@vger.kernel.org>; Wed,  2 Apr 2025 22:39:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743633592; cv=none; b=N3CPScrbjAxnCPXrssjhrNtuqol/UQ6ZP5SBqGdrYbBAf4/bBx0uIBAyGmPSrNBjOh4bD/8xLlbDZyRAL9y9+X1T1rv724lTRxk77Y4/50kFYsHgmfgEngY5dDlTg+8QWa1GmRU2suGwnuG/Gyop5oHlUGV60TatkVtakOzPYVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743633592; c=relaxed/simple;
	bh=xc8WF1r2PaAcb8sbNqj7gu3aFa+IW8ItfCQ2FmH/4X8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QKeIDle8zzTUwFr3fl8yCvoiME+hATnPWwB+XhXt6vlRT7uHRV0ct+GX6erHcGjZSBtmraY+Acl8F+nik173kqRRadpzl9efHYJe+knkWXVPm+j05+I82vt+Y2SGJ/X2tb3nRvvyC+tVskKRNNdiyjqguTnjD6CCVlftr0QAqj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=A3M8PtdR; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="A3M8PtdR"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2295d78b45cso4275295ad.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 02 Apr 2025 15:39:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743633590; x=1744238390; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RCUdSZJKo+DfCb7L1u9uIyzdzgr+hzjdGkAPqeN8dwI=;
        b=A3M8PtdRIA/fEFqlfooGWTdDn/Q85hJVVjT8g94tWbRC1B3GVqZlIa7GJCFXX67M3e
         GLgv/a3JfeurBbNvfatECeMj8WLq6UQjWPE6ctYETQ6HWRrN4XRc/MggWuW33mJIniOf
         hE98pwY5Eh1Rqmis3AlVVsowG9jJoHZ53kpUrwQN/q8e8kNxQtmv/9XFTbC1hlal+yuq
         yErad4hsGOLajAjV9UGsIftDc0Vz/7OXnIpukQKxtcWzxtEpniXVADeOzGlwaOBy2st+
         IuHl0VWI3OO6l7atSGpB7SCznNZv32XByBeUHCIPlX0H1ogfNtWt3fe6cN1D8Vnp5i67
         ZHiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743633590; x=1744238390;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RCUdSZJKo+DfCb7L1u9uIyzdzgr+hzjdGkAPqeN8dwI=;
        b=YWpNyckY0x8yViJG09PZjwwQoDzlPxV8ShaTwBnUlK5SnZ0kplIMDc6Kcviegm6Jwc
         5copgVvP4h6eAjTjDoIu3MwUSaLhibKd7zZZpjGds9x3sKmdOzMOb2ybxrteDpdJzNSF
         VzGwE4dDUwjoNiWEJcGRScjBDfLslGicB+nfbvZvgsRF6W9u/BzP2GKJ5HSP/h/48+tO
         x3CK6KTydkS/m0L4/XCoMkv/jLTXZm0ReXmt1CDsbQwHH+4ZlJN1VlidDPiFpcdP9K9E
         +XwebtTciA0Fw8B1CzgpjcDnWSIbQK5ii31pg0VGwYcJFJg3SdUEDkUO49ANJ0TYqUx0
         VTAA==
X-Forwarded-Encrypted: i=1; AJvYcCUgKg71qKpLyuTSN1tpAOLj6AT4mF0X2/the3PtIMhVUxwdyFrC1t6bTg8mu93WqYpDRoMYxF6wgDRIA+mL2Kq++Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6rFd+KGpHWwJSK0GAwD0DwYxCJCx0ZZ9HeYEJoFsUza84LZ76
	giDxuTARYBhrloxAM9sAr0NzT3vVKIvC4HP3vdc/J1vtnRQOBMNJstjTJG4fzw==
X-Gm-Gg: ASbGncsV0evGp03jQZxczqKe0RMh/8S4SYzMHJCu7MzFTpYAA/YRlHiCbzUNW5qBxMC
	H6QzoTqftYAYjdr+JhVvGTpIkw8kiBDXLMqzpDS3QoffnFyh6jHu+u5Z44/mIVEDd+Y9smqnPTx
	n1+GhfCQML5BujUzysSvTU/EkpRuNUHB8N05TteUxtpXbm19DJtcWU+Wl8q2Uc95vfwOcf/otf/
	siIvOq3vhOMDyqtfT01kFzJjwPZNJwGtHI7xcHOC0QKG5PwR5GAysfwEZrzBZ+1e4+0EoTltNFD
	S4+pwE18fAUaeW2WvK8J2BxN+9XlW+WLUCy0UNSPWs5+1DeTK504Jk4IewW22JiAjpIxy2oG6ty
	eVRnIyZ40vDSK+KQ=
X-Google-Smtp-Source: AGHT+IF4gwMOCkgD1NLc9h9zDKSDNadcDgyOK8y59bXpjfWPpkP3E5OcoZpIKL40ijcRHOF0nPIbcQ==
X-Received: by 2002:a17:902:b683:b0:224:1609:a74a with SMTP id d9443c01a7336-22977deaf3cmr4975415ad.34.1743633589886;
        Wed, 02 Apr 2025 15:39:49 -0700 (PDT)
Received: from google.com (198.103.247.35.bc.googleusercontent.com. [35.247.103.198])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2297866efb5sm921995ad.201.2025.04.02.15.39.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 15:39:49 -0700 (PDT)
Date: Wed, 2 Apr 2025 15:39:45 -0700
From: William McVicker <willmcvicker@google.com>
To: Youngmin Nam <youngmin.nam@samsung.com>
Cc: John Stultz <jstultz@google.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Saravana Kannan <saravanak@google.com>,
	Krzysztof Kozlowski <krzk@kernel.org>, kernel-team@android.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
	tigersoundkim@gmail.com
Subject: Re: [PATCH v1 3/6] clocksource/drivers/exynos_mct: Set local timer
 interrupts as percpu
Message-ID: <Z-28sR02GhsNMnlg@google.com>
References: <20250331230034.806124-1-willmcvicker@google.com>
 <20250331230034.806124-4-willmcvicker@google.com>
 <CANDhNCqNqXfGgvo8vNof1qi3E3jejk5KBD=oedZp2_p8RKZdjw@mail.gmail.com>
 <CGME20250401163914epcas2p1a16e2b7a6ecac9f010ef6eb4c8efc6fb@epcas2p1.samsung.com>
 <Z-wWA-46L08V89qK@google.com>
 <Z+yh2UUwxUz/vRbK@perf>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z+yh2UUwxUz/vRbK@perf>

On 04/02/2025, Youngmin Nam wrote:
> On Tue, Apr 01, 2025 at 09:36:19AM -0700, William McVicker wrote:
> > On 03/31/2025, John Stultz wrote:
> > > On Mon, Mar 31, 2025 at 4:00 PM 'Will McVicker' via kernel-team
> > > <kernel-team@android.com> wrote:
> > > >
> > > > From: Hosung Kim <hosung0.kim@samsung.com>
> > > >
> > > > The MCT local timers can be used as a per-cpu event timer. To prevent
> > > 
> > > Can be used, or are used?  If it's an option, is this change important
> > > in both cases?
> > > 
> > > > the timer interrupts from migrating to other CPUs, set the flag
> > > > IRQF_PERCPU.
> > > 
> > > Might be work expanding this a bit to clarify why the interrupts
> > > migrating to other cpus is undesired.
> > 
> > Let me dig into this further to figure out if the IP has a limitation where the
> > interrupts need to be handled by the CPU the timer was triggered on or if this
> > is just an optimization.
> > 
> > Any chance you know this @Youngmin?
> > 
> > Thanks,
> > Will
> > 
> 
> Hi Will.
> 
> Yes. In downstream, we’ve been using MCT as the clock event timer instead of the ARM timer.
> Setting this flag allows each CPU to handle its own clock events, such as scheduling interrupts.

Thanks for the explanation! I'll integrate this into the commit text.

Regards,
Will

> 
> > > 
> > > > Signed-off-by: Hosung Kim <hosung0.kim@samsung.com>
> > > > [Original commit from https://android.googlesource.com/kernel/gs/+/03267fad19f093bac979ca78309483e9eb3a8d16]
> > > > Signed-off-by: Will McVicker <willmcvicker@google.com>
> > > 
> > > thanks!
> > > -john
> > 
> > 


