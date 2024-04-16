Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com [209.85.161.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C113E126F38
	for <linux-samsung-soc@vger.kernel.org>; Tue, 16 Apr 2024 10:29:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713263368; cv=none; b=HL6ivZtHV5lQy9D+D81ewqoEg1yC5PHLjmpx3b+GQL+z8GkB15Zos92ZqOydjz5t58kbhRdQkvhf/9dYGAqxlbCRAcTbdWV5TqkmjwzWE+a/xJAUT2/BNe1lM+8N5I6W61s13SqOsTYRIFwIly2h3IItKV/UQRgaFoJbPxYRQL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713263368; c=relaxed/simple;
	bh=CTjrCNZbBSPJIq0cHJaUgYHpJavxftBIjzydI7AEWe8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UfUtT8XmD/sgUk+cfDydaa660MEPjeE6aKK4W9Jc4pBdrTCVFjIdsu8H9NCjng6jZ+4WKTy9QTPnaVkjZp0qfL7Q23zLTEIIz62S3J7ydgjL8Bt23CvEvOCYCAVzVUGneqstTaG1XAM84NNj3nsAFA8orOJrXDexu1NJeiKLGVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GTyLr1Yn; arc=none smtp.client-ip=209.85.161.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GTyLr1Yn"
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-5aa27dba8a1so2600684eaf.0
        for <linux-samsung-soc@vger.kernel.org>; Tue, 16 Apr 2024 03:29:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713263366; x=1713868166; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=CTjrCNZbBSPJIq0cHJaUgYHpJavxftBIjzydI7AEWe8=;
        b=GTyLr1YnIn1Gj4hf0+sXQng3qRUeoJMvoHZuVwzJ5jduu/1O2AmTbphLHLWcWZeWFq
         GhcFiL4zxZ/EQpHDcQskAiye3kQ7wlint+B3aExxIDldjWzh1VDNUE5aa9vvQGxalitR
         jA6alvyNb7mcDPwqql+ZyoSCJ8cS/Fpxj8BoE1hymp4iARnByqOVfLsuJxT+dy2mvbG4
         4romHI7a4BBz4Qbz8R4WQgTGaprtTg7BWSpQoDn+nosqEQsixw3NRpeLBAZBt6gE2voo
         n+EO6rJz4H1YSTDrBLG9OZuNf8zC2BHS3j7Oz6mICZqHLA70vrShcgVKCu6+CVGp4c31
         80+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713263366; x=1713868166;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CTjrCNZbBSPJIq0cHJaUgYHpJavxftBIjzydI7AEWe8=;
        b=rgj+lKRM2iWGTLf0eVtIbuTU/3yy46FRRaiLJgszfWFDtevaylJvfd5ss5El9VhnJ2
         e7sjPSafTT1dXQ5xBrIO4M/4Gfc/7Cni7m8WmoCh3p5f05MS2DmaAwLYOCUpWIa0x/As
         oKrDJCWgV/z5xDFbUgzc8GaWg3XSfhz8ozhdiMEEZSTIuIDW5HgxOiZbqD5GuCUQHCWa
         3oZApj9qjOJnDDUt6tbdJkdCdoRutCyffiQzLgcySR2vth/1DIql4GohMX6k4J2db9zB
         qjDjGCiJh8McngFzBvMglzBbGAxvolmXJAKuJmElB1jNnWeAXPA6+YkcmpOWRlh5SopY
         OROw==
X-Forwarded-Encrypted: i=1; AJvYcCW13hlrB7XVXxLvI0cy+zXUKuhbKFYov2C7eIZy6CdzqejlRomANgQFRRTw2cNn/jVF3X7FIUnZ6ShA34zBgm2YiDP9uiLybN2gMidlMj5T6Cc=
X-Gm-Message-State: AOJu0YxyQAFMga8oLqJDOr75m4OTvT5XL1bfW55EBczULtxNiEQLrd44
	83lgOUlXHjgzt75VABGGH7qokrwMcLbmszAegj3hDZy2QVPxxU04crXkk50cZu/pEa7zpZ1CpDG
	wn+S3y7ddpR9+34Tfx6kUuYy4gXt1jb1/XlxRXQ==
X-Google-Smtp-Source: AGHT+IF0mprWmsJ0VbCYrBsXHEko3BiOSfnamAyFvbNWuNvMQCxuk0etOf3eft9TH8byKplO1hBCDcIJEdlM+FZqB18=
X-Received: by 2002:a4a:98d1:0:b0:5ac:9f37:3ef4 with SMTP id
 b17-20020a4a98d1000000b005ac9f373ef4mr5487329ooj.4.1713263365969; Tue, 16 Apr
 2024 03:29:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CGME20240404122615epcas5p3812bd7c825bf604fc474bbcdf40d11f6@epcas5p3.samsung.com>
 <20240404122559.898930-1-peter.griffin@linaro.org> <04d401da898e$fd57ec10$f807c430$@samsung.com>
In-Reply-To: <04d401da898e$fd57ec10$f807c430$@samsung.com>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Tue, 16 Apr 2024 11:29:15 +0100
Message-ID: <CADrjBPoVSvUoq4Yw6DWRXN6=xi31p6=UKCL=57VHDoaKiQCTEQ@mail.gmail.com>
Subject: Re: [PATCH 00/17] HSI2, UFS & UFS phy support for Tensor GS101
To: Alim Akhtar <alim.akhtar@samsung.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, vkoul@kernel.org, kishon@kernel.org, 
	avri.altman@wdc.com, bvanassche@acm.org, s.nawrocki@samsung.com, 
	cw00.choi@samsung.com, jejb@linux.ibm.com, martin.petersen@oracle.com, 
	chanho61.park@samsung.com, ebiggers@kernel.org, linux-scsi@vger.kernel.org, 
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	tudor.ambarus@linaro.org, andre.draszik@linaro.org, saravanak@google.com, 
	willmcvicker@google.com
Content-Type: text/plain; charset="UTF-8"

Hi Alim,

Thanks for your review feedback.

On Mon, 8 Apr 2024 at 09:30, Alim Akhtar <alim.akhtar@samsung.com> wrote:
>
> Hi Peter
>
> > -----Original Message-----
> > From: Peter Griffin <peter.griffin@linaro.org>
> > Sent: Thursday, April 4, 2024 5:56 PM
> > To: mturquette@baylibre.com; sboyd@kernel.org; robh@kernel.org;
> > krzk+dt@kernel.org; conor+dt@kernel.org; vkoul@kernel.org;
> > kishon@kernel.org; alim.akhtar@samsung.com; avri.altman@wdc.com;
> > bvanassche@acm.org; s.nawrocki@samsung.com; cw00.choi@samsung.com;
> > jejb@linux.ibm.com; martin.petersen@oracle.com;
> > chanho61.park@samsung.com; ebiggers@kernel.org
> > Cc: linux-scsi@vger.kernel.org; linux-phy@lists.infradead.org;
> > devicetree@vger.kernel.org; linux-clk@vger.kernel.org; linux-samsung-
> > soc@vger.kernel.org; linux-kernel@vger.kernel.org; linux-arm-
> > kernel@lists.infradead.org; tudor.ambarus@linaro.org;
> > andre.draszik@linaro.org; saravanak@google.com;
> > willmcvicker@google.com; Peter Griffin <peter.griffin@linaro.org>
> > Subject: [PATCH 00/17] HSI2, UFS & UFS phy support for Tensor GS101
> >
> > Hi folks,
> >
> >
> > Question
> > ========
> >
> > Currently the link comes up in Gear 3 due to ufshcd_init_host_params()
> > host_params initialisation. If I update that to use UFS_HS_G4 for
> negotiation
> > then the link come up in Gear 4. I propose (in a future patch) to use VER
> > register offset 0x8 to determine whether to set G4 capability or not (if
> major
> > version is >= 3).
> >
> > The bitfield of VER register in gs101 docs is
> >
> > RSVD [31:16] Reserved
> > MJR [15:8] Major version number
> > MNR [7:4] Minor version number
> > VS [3:0] Version Suffix
> >
> > Can anyone confirm if other Exynos platforms supported by this driver have
> > the same register, and if it conforms to the bitfield described above?
> >
>
> VER (offset 0x8) is standard UFS HCI spec, so all vendor need to have this
> (unless something really wrong with the HW)
> Yes, Exynos and FSD SoC has these bitfield implemented.

Thanks for confirming! I will look to propose something once this
series is merged.

Peter.
