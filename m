Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EF1A1E0DFC
	for <linux-samsung-soc@vger.kernel.org>; Wed, 27 Nov 2024 11:09:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732705752; cv=none; b=SG5SFNnI8EUd3JfbUfuZ0h4dP+TSNewJmUclkzJJAlRRa1x8B81FD6aiDCombVbzJl8prPM8thgTa2j3ojIztQCuSRZMc5w4d3UrKRyRF7cQqw+PE/ELII96eFpcmowmQOMtiKUleJQwkN6dHBWSVxxvWLVJwOz2EVEfX0ksjrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732705752; c=relaxed/simple;
	bh=KIHyVa4m2W+IgrN2rte6ZTxtItq9mIpsQ6FBYB1Vvus=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=cFGWPmxSpcVZ/AMg4TtWby/57Amwq1CvdBFTSl0YvZg396+aWXXZuuN/tQT1mQvHMKin/T9+fbAWXDG26rJw381WB+HTi7U2SUPk0BuZLPqTC7yE3fgVJLlkH3C/UuzjLJbhqB6iD19A2iocZ4uAYHvoJmpYebSmoyOky4PPHRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UJFq4QYO; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UJFq4QYO"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-382411ea5eeso390382f8f.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 27 Nov 2024 03:09:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732705749; x=1733310549; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=KIHyVa4m2W+IgrN2rte6ZTxtItq9mIpsQ6FBYB1Vvus=;
        b=UJFq4QYO1KvssG7XYaNNKQjRiDycPZwl1qhEgeMDLXgn5oF/rnU8t6glrPlEz0Pdm0
         BrHc5zNzRgbDhagG5jnRuEGaMaetsW16OI4cVSAHyYCkwoD/gtswQ+yucFVTnXkmX26f
         0Ewgk9L6p6ZUxjbdj+tVEuNWjOz4YQDEWP5kOVy1l6eaJ79NQvZy4kum5X0t1GuA9s3G
         5UiBn8STmxWKqVGkMBkppMSYf22e0r06D9riX8hnxQzJc3Z7jvZBK/NXdA2F/ec6kr7w
         D1X/uix1iQKAl0I4F/bUOFcZNRL0pISaFKMUTypAiS2e873B5ayFzLv/2FUpXA9hNxAA
         wOCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732705749; x=1733310549;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KIHyVa4m2W+IgrN2rte6ZTxtItq9mIpsQ6FBYB1Vvus=;
        b=KoNrolo1tv47+zGaRo/39NlbblmZU06KspYALEnLwo4NrDsiD6yZNYn8lCFWzpwmM2
         4Zd3ewYVpWdNIK+bbha9Er0Ibz7mUeQLdqC2MEoEp0YhjGoOJ1+TuvPducyfxenBnWO0
         ZzfmTL4Yfpkz65put6H8zQTvIwtxrzn0dz4ZTOgnJ4zDN3Wlp2VuKsJAdR9dxX9+ODcv
         FmV/34Tn7hoSR9OuXkkik43eIKI+6B0twp/hg+lXOa3UyTImdERVcMi8FM2Ylt3YHh6A
         EVP9Xu5MHHWThr19qkZmij7Xxw4duL8P0J2VlrnOjm+eHw+JQc3y+njZu0DwIdWUupUN
         MntQ==
X-Forwarded-Encrypted: i=1; AJvYcCWdGpIE0HynST7c7A8SZ9/9gloopmDxZnjxyUzdSnwSa6A+aFnZD8tK9RYR2rb9KBJr7G06BLUoEQ2yQO/4DolqjA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwEyjOOi7LTaN5CzbGpD7A6ShjNuP/Gw/lNzJOrAkH84UW7ku2R
	GL6uILkESxgLKNbf8RBlS8VC1xxTAzlnpee7JjTgIJmp2ztlD8fybC0/utxl/TE=
X-Gm-Gg: ASbGncvtsZqbEVI1lw1LFT+dBrgHiWPFSkk9OCwqt1techz6XR0bzA9ADbJL/fYGybK
	hsTt4CX4zJso1F70RnQrAz3entY4d9usjclfKli+Zda31KxSfE5wiHSR9Age52C3hOt1KN01jKi
	pd4DfBDyTBraxX67kVZNntaaoFxAIuF05NExPrJsOsS3TVgjtqVBJ8sTZqgill2vtIJEbynTsGz
	zoeGg/8cIXzV0pj1ethtJwncrglPNivhHpiK7tSV9OujFsj9pjGvWg=
X-Google-Smtp-Source: AGHT+IG1kjd60OoIDsm2k9fnmTAzFppDmAUl6jdHsRKDvKHyjWcAMie1uR5e6BNHQ7g7zmDFBCuRIA==
X-Received: by 2002:a5d:6d0e:0:b0:37d:46ad:127f with SMTP id ffacd0b85a97d-385bfb1e4bamr5480665f8f.26.1732705748772;
        Wed, 27 Nov 2024 03:09:08 -0800 (PST)
Received: from [10.1.1.109] ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3825fbedf40sm15826667f8f.98.2024.11.27.03.09.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Nov 2024 03:09:08 -0800 (PST)
Message-ID: <6e53c7c71d6fecc232d6d94720c9dfa04f1fecf0.camel@linaro.org>
Subject: Re: DWC3 runtime suspend on cable disconnect while UDC is active
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, Tudor Ambarus
 <tudor.ambarus@linaro.org>, Will McVicker <willmcvicker@google.com>, Peter
 Griffin <peter.griffin@linaro.org>, "kernel-team@android.com"
 <kernel-team@android.com>,  "linux-samsung-soc@vger.kernel.org"
 <linux-samsung-soc@vger.kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Date: Wed, 27 Nov 2024 11:09:07 +0000
In-Reply-To: <20241125201135.kmif7pglkhitenfh@synopsys.com>
References: <269e3ad7cbdb3b97fb8dc75cae4d487ce7f908c3.camel@linaro.org>
	 <20240809231012.lmgqemcwjdfiaxak@synopsys.com>
	 <cd87836fbd0a030d0b52902e04167fe044ce447d.camel@linaro.org>
	 <20240813230625.jgkatqstyhcmpezv@synopsys.com>
	 <a40ac04beb4501ad95b50f79be3495315e38a880.camel@linaro.org>
	 <e40f27c2323077d9b35fac7572f30114b6e33372.camel@linaro.org>
	 <20241125201135.kmif7pglkhitenfh@synopsys.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.1-4 
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Mon, 2024-11-25 at 20:11 +0000, Thinh Nguyen wrote:
> On Thu, Nov 21, 2024, Andr=C3=A9 Draszik wrote:
> > On Thu, 2024-11-21 at 12:34 +0000, Andr=C3=A9 Draszik wrote:
> > > Unfortunately, this only works once: After restoring those bits and
> > > reconnecting the cable, USB comes up as expected, but a subsequent
> > > disconnect with the same sequence as during the first disconnect
> > > doesn't
> > > trigger the DWC3_DEVICE_EVENT_DISCONNECT event anymore (others still
> > > happen,
> > > like DWC3_DEVICE_EVENT_SUSPEND).
> > >=20
> > > Kinda looks to me like either I'm still missing something, or e.g. th=
e
> > > event
> > > is somehow masked.
> > >=20
> > > I anybody aware of anything related by any chance?
> >=20
> > Hm, the missing DWC3_DEVICE_EVENT_DISCONNECT event comes when I insert
> > the
> > cable another time, i.e. after the DWC3 driver has reconfigured
> > everything
> > after cable attach. This throws everything off of course.
> >=20
> > Looks like still something wrong in phy/dwc3 interaction in the Exynos
> > case.
> > I'll debug a bit more.
> >=20
>=20
> Ok.

I have a working solution now - with snps,dis_rxdet_inp3_quirk in the DT,
this works reliably now:

https://lore.kernel.org/r/20241127-gs101-phy-lanes-orientation-phy-v1-0-1b7=
fce24960b@linaro.org
https://lore.kernel.org/r/20241127-gs101-phy-lanes-orientation-phy-v1-0-1b7=
fce24960b@linaro.org

Thanks again,
Andre'

