Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795564899;
	b=PjEkmYvlnx3zqnVOSui2+W3sPEeRfkEAb063ydNE+/ThtlkndTuhQfHMHpwrrFbIXJ6x
	 OlOScZ0h1xVgya3kNz9urpRGTUGVdIt1q2t11DktbXAG80pqvtHIcWvnxZdTALoB1SE1V
	 HAtH8mpQ14nLAE4xLG8VlXyYlwk5Rv4kKc5fbBX/CC9YnKq1YFjadgGwAZS7ZYc1d2w/a
	 jR+kpmhrp/EAyGqo++IRCT1PD1AleG9U3ds7FuAYDHVOslOTjAAIUw3JpHANm4+NoI8ks
	 TbK1wxdh40h6N0SxxEF75oSUxEuKy2jGqT2dWho9XCE7lOPG9dHs5Jkh8AWp6j5v7eg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795564899;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=8DK3yldnIUojdVzCr2+XwiNL7LP7CGhb9/YkbV+PBQY=;
	b=06s/vY/jc8TrowR0+0RgoKknVJNxS/MAtYRORisEue741YNa0ZFRXjXg/nBUD22ILQYa
	 hJQcofygOeiENYBi7CU41ojIE8mYJfvhn844jMl/1jS78CE0VwQUyQy1gv7XJyu0wsUyx
	 svF5YZnydJLIRvHAWSVuvIdnJJo9SH0jLRWlas2F+lSMsvH0v9Q/OFzS6sLKK4G4fenlf
	 jRQm/ZP3JAwVi8ecTogNI9sUQ94urwMeGBUWFhsjwKkze6Z33KfF8TD9J8gdpIxau0vdl
	 TrPZU4y8cbU4OAsJJ/fc3YfmKlrlAljVh1Rnl6eSaROVtjN/e1JOQ9e5EbPlPqFQrcg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=jZqCF521;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA0CA606A332
	for <linux-samsung-soc@vger.kernel.org>; Wed, 25 Nov 2026 00:01:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BA0CA606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=jZqCF521
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-386c4d2e2ccso2021153eec.0
        for <linux-samsung-soc@vger.kernel.org>; Tue, 24 Nov 2026 16:01:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795564898; x=1796169698; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8DK3yldnIUojdVzCr2+XwiNL7LP7CGhb9/YkbV+PBQY=;
        b=jZqCF521yDr09fUmzi6RgygaLzmw94KaaOKAsaY89oBxs5KQC7DkwM/NuNnQC9xAQP
         EBFLieZm4OZnZCHp6SACkT2ki+diJp/jYfgr4rMm5srpcb6TGFVh44XYpWVz894XA+zV
         NslcaQ6iro3zpioeo7TmXCxnby9VDCBgIBWO4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795564898; x=1796169698;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8DK3yldnIUojdVzCr2+XwiNL7LP7CGhb9/YkbV+PBQY=;
        b=Xe0uGMvWfHYUk2JLkDKhAyg/qWR37PDwBK7q+7W+h3lPMu8Fcq7HeHlVODxHiOy6Iv
         F0FUnXy3DZCPi9Acs7KMH9euaVyCNsto6iGnEJ+NTycZ2avur9YTSmqWO8QJs4/IPwXC
         zOuzfNobRRf18gRKL/InUL/iPEg/3IA1n4prcSL1h2sEsCqfMw6QN/o7ClFPhVUCm+kd
         C+hB0kOSDLK/GULRF8+FGAemzrdk/B6RxIl4Va1rFSzGv3+/Ec4y+RPLVQYdZ5Kp+kiA
         FHs3AhhuzMFqBtuB1SZgS9PZA+Vct/iPQJas7HFxv95aQt1qZDEBfWm/dJMm915zSP34
         n6+g==
X-Forwarded-Encrypted: i=1; AL+hErFsiMSNFv7agquBb9ElR2WpYdlVeLFOhz92EGYM40wGcNEgjZ0/b4myqKw9FhlyFb27+2enJNaF2VI4vHAJQUYvcw==@vger.kernel.org
X-Gm-Message-State: APuU4Z8IGu+/ku8UoSJnT7XAHmTFaYb0saBULrhN5lKOkvbTvoHhWdZF
	C0lQHSbo4MVLASWB78+5bqLyePE0XxoeUzBexYfUAJpVNr34dt7qHXdHQzfk7D+J8g==
X-Gm-Gg: AZFdTZc2d9oyXmzC60LMhOv6zCeKQyi33eghQUjjqzTste3uzGId4Fn16PEuVcxpVR3
	mb8/rL0VjP/PoPTN+wE//HNabxGAklUQYdnhMwJOr6H0mERr92VTR2c5vtufW3nt4l1Pym/zgX6
	JKR+/9/t0oFbhc5GP1hdTNPh3NDUg0fFLuabCWnw8EX7+1l2KPN2gQP2KneGoJ5tNE7lGJ4j6ec
	qwMjz5W0cuRlDLhr6fU1wvUJPi2u+58mJ9sCYphe4fgNzI/qvVCJz9iXm9DBvwy+J/Okwz5Vzht
	pM1CSRnyPWjp8qFXQqw5yA/xbaBCu+gueTPWs36W8LDeIQIFe3Z2VxJY0pVp1N3x6FjIuyzBinq
	TstPbnugZo+dGx4DUTpQ8pIatU0+mav4QGLAAoVAsSFy1TF2r8k2mQAQgTDc+lazd6ddvNPZFm+
	/JnlFsGhux6zD79sBDhFBLVs7GSMJDEHzxDle0vbr+RAeNy0+nEgBHPaYJxPOkh9JZMH09GXNgU
	cbJP5PEfEUHgigIZ+AKPCYM5YMza8j+7MbmeIaCLCGgNs47h6VEcBFdLMq9Mosub4HcVwDx2tJY
	mE4fXn2RqiL5zqp/nffVYg0EXtMyxGDz662bpOYZQbg8b5BZRMgywCEUFiZjf1a0iogN
X-Received: by 2002:a05:7300:601e:b0:386:1e2e:ce0a with SMTP id 5a478bee46e88-3861e2ed1bcmr15600970eec.27.1795564896357;
        Tue, 24 Nov 2026 16:01:36 -0800 (PST)
Received: from localhost ([2a00:79e0:2e7c:8:ea9b:d8a3:ba44:2d0a])
        by smtp.gmail.com with UTF8SMTPSA id 5a478bee46e88-385665f21aesm59652400eec.4.2026.11.24.16.01.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 16:01:35 -0800 (PST)
Date: Tue, 24 Nov 2026 16:01:33 -0800
From: Brian Norris <briannorris@chromium.org>
To: Peter Griffin <peter.griffin@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Thomas Gleixner <tglx@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>, devicetree@vger.kernel.org,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	linux-samsung-soc@vger.kernel.org, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org, Radu Rendec <radu@rendec.net>,
	linux-arm-kernel@lists.infradead.org,
	Mariano Marciello <mmarciello@google.com>,
	Douglas Anderson <dianders@chromium.org>, linux-clk@vger.kernel.org,
	Jakub =?utf-8?B?R8WCb3dhY2tp?= <jglow@google.com>
Subject: Re: [PATCH 3/9] soc: google: Add CPM over MailBox Array driver
Message-ID: <awYlXdfJcciCy1Cn@google.com>
References: <20261026214359.3122870-1-briannorris@chromium.org>
 <20261026144346.3.I7bc547c83b7bf677a62670099f481a91ac737073@changeid>
 <CADrjBPqnRrFeYT9J6NGxy+Xzy1PTZEz+BMs1_u2md7Ra6xPPDQ@mail.gmail.com>
 <awXf86suGgKeazZx@google.com>
 <CADrjBPqG_TLwgOTzQ-o5pM7k1DzkeVxNkV2xDHsU4OBAyYOofQ@mail.gmail.com>
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Post: <mailto:linux-samsung-soc@vger.kernel.org>
List-Help: <mailto:linux-samsung-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-samsung-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CADrjBPqG_TLwgOTzQ-o5pM7k1DzkeVxNkV2xDHsU4OBAyYOofQ@mail.gmail.com>

On Tue, Nov 24, 2026 at 10:31:11PM +0000, Peter Griffin wrote:
> On Tue, 24 Nov 2026 at 19:05, Brian Norris <briannorris@chromium.org> wrote:
> > On Tue, Nov 24, 2026 at 12:28:24PM +0000, Peter Griffin wrote:
> > > Should we also have "depends on OF"?
> >
> > Why, precisely? It's not actually a compilation dependency (I tested),
> > although it's needed at runtime. It doesn't seem like this is
> > consistently done simply for runtime dependencies, and instead work has
> > generally been done to ensure everything builds fine and fails closed
> > without CONFIG_OF.
> >
> > Anyway, it's a bit academic, since ARCH_GOOGLE (ARM64) selects OF.
> 
> I was thinking more if COMPILE_TEST=y && CONFIG_OF=n &&
> CONFIG_WERROR=y is set. I'm not sure if 0-day performs such a build. I
> guess since no 0-day failure has been reported in this thread, perhaps
> it isn't required.

Yeah, I can't tease out any warnings/errors. I had to resort to arm(32)
to get such a config, and I can't even fail with W=1 (I end up hitting
arch/arm/kernel/signal.c -Werror=unused-but-set-variable
warnings->errors first, but...):

  $ grep -e '\<CONFIG_COMPILE_TEST\>' -e '\<CONFIG_OF\>' -e '\<CONFIG_WERROR\>' .config
  CONFIG_COMPILE_TEST=y
  CONFIG_WERROR=y
  # CONFIG_OF is not set

  $ make ARCH=arm CROSS_COMPILE=arm-linux-gnueabi- W=1 ./drivers/soc/google/google-cpm-mba.o
  [success]

Brian
