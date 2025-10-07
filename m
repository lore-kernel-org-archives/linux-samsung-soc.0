Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 714DA2E9EA7
	for <linux-samsung-soc@vger.kernel.org>; Tue,  7 Oct 2025 18:58:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759863515; cv=none; b=d3ltCRt8EvGSlpsp4TDU7LLox7lkIlpyHZ6aYNLskhPrx4KBHFm43OuCYSCo/7y2E3pIYpkdtQtZ9Xagl4pniKuH/HEexxJGYoc6ualAqb/S5w+rV3U96DCX23UvZWB1vRdlZY9LjnAwLkjpvawUZerxwUHBs6gO4/zlgQMx3W8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759863515; c=relaxed/simple;
	bh=ahcETK3NScioEM1VPhg+9e8EKulpHqG+JDuHQMq1GKk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gPDI23IjpNVH27AfX1SOb0O650O3jlilZYLyUdeOjVluA9LpoI+2B55Iub1WD+LTplEhjw4ZPaCnOzculvrsT9i4lUsnV1TLEWsKh6NbHCstv3iGrKwFCQc8XGs6p4j61kcoLaE/ez/hqP/QWkh+eQwMKxqC19bYNXSiRnZTGm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Xou55lvU; arc=none smtp.client-ip=209.85.219.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Xou55lvU"
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-7957e2f6ba8so64870426d6.3
        for <linux-samsung-soc@vger.kernel.org>; Tue, 07 Oct 2025 11:58:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1759863512; x=1760468312; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JE/QqWs7NstXUoklYPWJg7vwj5OuQDSlnmUz+8GLmcA=;
        b=Xou55lvU7yKg6wYp1HLs0ETTJHGKfErOS4umkH05nUe+M5vSARPFzx2SLSmXaoRJWf
         f3MFDmKi8wTSSP85kwf4/i+HCcp5o6c97lNRrbrgHqGkj7IOi/Ce5gXgN4II6goyuWTY
         mbKkW1z7RxG9EmMv/glL89PBYuqOvo8WlIGGupMOqVMpwEaGX4m80XSXIXOA+i5IUpue
         CVi0LhCeSBVU3gFD4/hBmqId6rv1tod8U7loXa72p6qIMgwvyjOptj3B0K5DrpOlk3Uw
         QKQt4ErH256tdzBWpNCdQ7QlDLyRs9G0RijO6hH+XmRoDnVJYxSdMM6oQbIYFiABauj+
         mnXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759863512; x=1760468312;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JE/QqWs7NstXUoklYPWJg7vwj5OuQDSlnmUz+8GLmcA=;
        b=am2bN2UDi/YAXAINQOM7NghdouuJ//eX02mpi7+C3F75Yxxe8bkI/0i5haIz1uOTbZ
         mxDXYmC42MV4nL+7q2zIBLThsnzDwhBGcL6yrxRM1HdnHzlisyYpcBfwSePggISVq3C+
         S0gtdl5+yxmdNMljPH/JFGA6ucWYO669GxENm0LTxv2MtHjoHbncSVljRPga25VU0bcQ
         dye7YyLUm1Isu0qxX8EqpSq5b6wLtcnyylj2CkkmuN/3HYFU4ei53pQ8gmj6qm5naroC
         oXDa+x3k3dXHF7PG4B0QyLT6fcnaZ8VlDESCPQgqtAxpnKmvWkzT5A2JjSGfOtuIXXT2
         rqSw==
X-Forwarded-Encrypted: i=1; AJvYcCV5jnMC0cW2wAtu3oTuSAKK6vTah8aP9v4l13293du3VyZmHP4xr0Z2+6To/Gp8nsO7mHcp3lhwtRD43qwm4Ft+HQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzvoDPiv40ZXO5erG5C9JhHJr0xBH35bG9gNz+ZfmNLtzY/Vk4a
	rvaM/3pmzf2Y/06lwt7VhR47Zg6xJPRq8+Hd1MFT//5hv2bjz1k7qdc2Rq2lnSb9DDONKZ41Cx6
	PbPJJBIqpXFWpDTBv5fnMQ+wjHpbvzCam1kxDP7xe
X-Gm-Gg: ASbGncujx1ZHLGmYZIC5cpO876fXoQRwnGm3tVkU+zceVWFh1Vh86Qg1wbFcP/th/DF
	0DMfJxl5YI04zW8o/iP+j+eh79lifJTK1R9iZVGZ5D+wg+ZrCyz4fJduFJf7HOyIYv6skfUklgN
	zHLPGXFc3FOKFxODZUGW+XHTy7AGsCWTAYW0RXV0O0hD9b4OI8wxyQaxpxZd+48eH5P2AZjlKh5
	pbyLaEB956njT7AXDrOntTUb60irGnvGypC/el6Jgo/ODLr3ZOgGMt930JTtQqwHOMs2f6NljTb
	XgY=
X-Google-Smtp-Source: AGHT+IFJCSvibVVpHo9SVA1MQuL2njqF7Hz3TZEHv6SusAWE3ZVPz/ickNfrrHhzv+YbaQGGtkgTfVD3qAa0FKJd9d4=
X-Received: by 2002:a05:6214:21a1:b0:786:5ae7:7846 with SMTP id
 6a1803df08f44-87b2efb9e09mr7131866d6.32.1759863511911; Tue, 07 Oct 2025
 11:58:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251006232125.1833979-1-royluo@google.com> <20251006232125.1833979-4-royluo@google.com>
 <2025100735-gulf-error-2ce2@gregkh>
In-Reply-To: <2025100735-gulf-error-2ce2@gregkh>
From: Roy Luo <royluo@google.com>
Date: Tue, 7 Oct 2025 11:57:55 -0700
X-Gm-Features: AS18NWCmw4sozhJ6PiheC0IEychcx5yjcq3OEgXWnrhYT0U6wZ0e0y1txxXckvE
Message-ID: <CA+zupgz-RQ=vNCBTy5yaaP9xJFpeFw+xLJYuvtjct6iuh6zD2g@mail.gmail.com>
Subject: Re: [PATCH v1 3/4] usb: dwc3: Add Google SoC USB PHY driver
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Peter Griffin <peter.griffin@linaro.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Joy Chakraborty <joychakr@google.com>, 
	Naveen Kumar <mnkumar@google.com>, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 6, 2025 at 10:51=E2=80=AFPM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Mon, Oct 06, 2025 at 11:21:24PM +0000, Roy Luo wrote:
> > Support the USB PHY found on Google Tensor SoCs.
>
> That's great, but that's not what your subject line says (it says "usb:
> dwc3")

Will change the title prefix to phy in the next patchset.

>
> > This particular USB PHY supports both high-speed and super-speed
> > operations, and is paired with the SNPS DWC3 controller that's also
> > integrated on the SoCs.
> > This initial patch specifically adds functionality for high-speed.
> >
> > Co-developed-by: Joy Chakraborty <joychakr@google.com>
> > Signed-off-by: Joy Chakraborty <joychakr@google.com>
> > Co-developed-by: Naveen Kumar <mnkumar@google.com>
> > Signed-off-by: Naveen Kumar <mnkumar@google.com>
> > Signed-off-by: Roy Luo <royluo@google.com>
> > ---
> >  drivers/phy/Kconfig                 |   1 +
> >  drivers/phy/Makefile                |   1 +
> >  drivers/phy/google/Kconfig          |  15 ++
> >  drivers/phy/google/Makefile         |   2 +
> >  drivers/phy/google/phy-google-usb.c | 286 ++++++++++++++++++++++++++++
>
> And as others said, you don't need a whole new directory for one single
> .c file.
>
> thanks,
>
> greg k-h

The USB phy on Google Tensor G5 is no longer based on Samsung/Exynos
IP, hence we need a new driver for it.
Acknowledge that we don't need a new directory just for one file, will move
it to the drivers/phy directory in the next patchset.

Thanks,
Roy Luo
