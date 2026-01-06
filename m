Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CED134F257
	for <linux-samsung-soc@vger.kernel.org>; Tue,  6 Jan 2026 20:03:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767729817; cv=none; b=nyhJ32RyBUMOiMUKH84Bb7iaPeC2veBcqgJj0bTHIsEh6KlTvIphSGv+SXPocdCKiRIdVz/IQKi9yc2SSa+aIOQsM0YlVDgsKUJD/e+yw5Z9osnSczK39jbx3PCNitaEDpJPCFjigeLOVwMN/ErWDIYnn4wMU7+fLhAa/1hXgLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767729817; c=relaxed/simple;
	bh=hDKC/3noErk1Q8ZsV7ssZTkXWKMDpO84KVg5itJCTxs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PtAty9MYwVwgQ4h80WbrCkcouiAiMmyOMoEh4I671GMVDDOQtR1s/TYAiiDPa2HRhvvHO5CWgQ11j+vum1VPsxVmUsWnd/jB+cAQqzEgo8GbiWhxL8Hscgczxua7qFFzAEUlzsmptpc4BwOanwzU0p9tuYOCPNGptzbPBmtinXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aooa5/e+; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aooa5/e+"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b79af62d36bso247095266b.3
        for <linux-samsung-soc@vger.kernel.org>; Tue, 06 Jan 2026 12:03:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767729812; x=1768334612; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=hDKC/3noErk1Q8ZsV7ssZTkXWKMDpO84KVg5itJCTxs=;
        b=aooa5/e+oWtRhdnfriJHRmLDfHXFrjiStkLph4hzhtEIcCzaBC6Xfu23rVY5BU61Ml
         lbBJHjQsFhdRLXhzbm+MeS42mVr9XnE7jQppW97EVjngfGSNg05grlaQYdnt8k+j0ErW
         PSoo+pI6OI3hGTwDI7AAgvhXkIh/w5HlhpJ4LA7k4mj1b6/8lp6jBa8q6i4ydH5uw1Si
         fT0H35xJ8bixUVvfxne+LI31dCpR3tDx2wjNegh3X0S+N153PMCL0Rb+sxiEdgrmlMny
         AG9PHTHY4K2J2Z+eI7cSp8oeud/DN4mmdXFccnHGMOPX/z5LE0pZOWRk6TiXDIoLA0zN
         M+2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767729812; x=1768334612;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hDKC/3noErk1Q8ZsV7ssZTkXWKMDpO84KVg5itJCTxs=;
        b=WInVVGzEzLnj6x09hAeSmikArrjyL7beryvPpDnLojLdOR5zyeZ5ew5PrVV8bWkyey
         QhhV11XSgrXVMwKZJhR2DF0MqjnwoylL6fcV6JH9wEkM61WVxkMwhvxq7Po9RhFBWA0c
         NNxALPr3/9O/5/QB6gdM+SJ7lpKCCAbDoBa8OkygslDKDKfCaRDDe8xPvy6Ad22L+TWK
         ZDuKfPXLoNDoAGDA9zr5TGYAVW/YG+7a90at8f2/sNroDdzuLDtasExZNP8QwGHIb9q6
         KWdpAY0Mb4N63AwngZOYP1YgTEhmINSsVU3SUYUdsQIrnYzOn7+mbmNfL1xt8LtG5KRe
         TnvA==
X-Forwarded-Encrypted: i=1; AJvYcCWk4UqxgZAnpJzNPtjAbJo6YCX/6ca9rbJ/hoSIA678dJio6zNP/Oyg2mENGBonEagDUsyVuY2QNODwSQ3UpY2h/Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YyAiVX5psX6KuVwIypOg+wd4Tggm7lARziWTQ01ttYPHPceeU5l
	HsUdUTACWexnnYJiIHSXI33n7RKv45Th9YndWcgcs82pt2eDTZM/N0slOCNOtyY6ZRDtpBauFCP
	l11f/WQM9qAcV3Om6xSlPkx66jXv9JOXWfL3QGsBgeg==
X-Gm-Gg: AY/fxX5HcMSxd2pdoP/qGyVb+SORpbWkrYnBWSbFHhDJnfx9JOwNZd/2ywY9klP5p4r
	g2IAj8LWNPCKeOFBRE4E9fQqDGdJ9ygI2ajs9pbgKXcqx2CTQnk8ys04YK/4V71EHUZr/qdrV+U
	Hi7REkSF3lISd5s/iB9V4N+KLl0NnhVdGaRC/YBgx+RK2sO9WYT9zCtzikcESiIR0z9KGmqn1aC
	6jqNB5lCnDVVd8MMKwxEk1DAqZ10EEK2aqUDnnzXsvVlnGypHuDGUUeUatJMirhIWp0vN4n
X-Google-Smtp-Source: AGHT+IEmmXc6X3lklLmC0mCRNpoBur3TPS2BGNaDYr/bqjA6QRWH7eFRQJKdL8KVJ+yPvHwZtBcG2RvEv+KputuzJWc=
X-Received: by 2002:a17:907:96a1:b0:b6d:9576:3890 with SMTP id
 a640c23a62f3a-b8444f9664fmr26102366b.45.1767729811848; Tue, 06 Jan 2026
 12:03:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251222-automatic-clocks-v7-0-fec86fa89874@linaro.org> <c0eeae31-6951-47ca-8651-868db18d349e@kernel.org>
In-Reply-To: <c0eeae31-6951-47ca-8651-868db18d349e@kernel.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Tue, 6 Jan 2026 20:03:20 +0000
X-Gm-Features: AQt7F2oLfa1exLAxy6kjOxPF0LQxcKRjhYroQ-B3HvTQJnB9vgg9Cr5KITN-rwA
Message-ID: <CADrjBPocyZFz--xCaZahyUA9wwuS7P0E9Gt4Z=53rbT-nEQ7ng@mail.gmail.com>
Subject: Re: [PATCH v7 0/4] Implement hardware automatic clock gating (HWACG)
 for gs101
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Sam Protsenko <semen.protsenko@linaro.org>, 
	Sylwester Nawrocki <s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, 
	Will McVicker <willmcvicker@google.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"

Hi Krzysztof,

On Mon, 22 Dec 2025 at 11:50, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On 22/12/2025 11:22, Peter Griffin wrote:
> > Hi folks,
> >
> > This series addresses an issue with Samsung Exynos based upstream clock driver
> > whereby the upstream clock driver sets all the clock gates into "manual mode"
> > (which uses a bit that is documented as reserved in the gate registers).
> >
>
> Applied.

Thanks.

 There were several checkpatch notices/less important warnings
> of which most were result of existing code but few were introduced.
> Please be sure you do not introduce new warnings NEXT TIME.

Will do.

>
> Also, DTS cannot be in the middle of the patchset. It's almost always
> wrong, like in this case as well. This was raised, also by me, multiple
> times on the lists and it is explicitly documented in submitting
> patches. Putting it in the middle suggests you try to fix up broken
> unbisectable things by reordering patches, but you cannot.

Noted. Thanks for pointing this out. I suppose the last time I read
submitting-patches.rst must have been before Feb 25th 2025 when you
documented this rule in b31cc6af1bb1 ("docs: dt: submitting-patches:
Document sending DTS patches")

regards,

Peter
