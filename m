Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A38F52253F2
	for <linux-samsung-soc@vger.kernel.org>; Thu,  6 Nov 2025 02:39:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762396776; cv=none; b=RJzpvn/mC3KGXWHDV/Edl+/Qo9H0gkKjlYn+AcK28I2ZcsJd4YEv8bXRPXT2o4LGuoxpcYQMplqolOk8z/n4SNQMIrPvFeZTNzfvd7Dl10d3/SD3NIG1yKNPcgwftxgY2tWKqMI3RItLWaIaEn+RPd0au4CT13wiRFB+N5UULmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762396776; c=relaxed/simple;
	bh=8nMHKixdk8Eg3L25o5gBG9d2JmKTyF3seoQc5DhhPLA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sdgia5Rp0WljrJYksOrxvU4dAWWaSPuMaKOXzujUAJYn5LuIRx/8a1TDpWvu9A8U2o3Vud9eK6m0AJ6tpPL50pRQ+drJRa3FNU7EjnuOUk4zqpcyS3qgxfuTvBc4Y7bFBBN2qx76NyzqrTHGmZnpaYK5bdKOHisWStrWOOwplR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=dSmWP9lw; arc=none smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="dSmWP9lw"
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-8804a4235edso6138056d6.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 05 Nov 2025 18:39:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762396773; x=1763001573; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2eNR0gXNmIUmw89GQXgujHZG/9SWMVHpsfLzK4O6o7I=;
        b=dSmWP9lw2cEUYNS6YfT3N/Hvdf6/hiplOMEZLQuyu+/jb+okczgC2LBp9wHT8kygTK
         kq92pgyTK9OUY5gJ2G0Aq3ioKjzFG3MzgcNpZVARsfIkm/qn18k2gP0usclMDeo1VpCq
         E8KnYZ20zPgMqyDeBXqqx5A5jJ7N0Pc4lNE+eHY07OputKisRieuT1ZcxlnstF9pt4S3
         wv1UlFn84748cUQHiH+/MlQghJczwoE2MnKHQjZcQFXmvGeykZG7XZyCLbDmjDI0G5Hm
         Pjcqy8nlhiWgiqTQWqwg1SlZBIcT+UfuHwhLBwIMA3A/TasmUJMhaq9uweMB6osQykvd
         JrKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762396773; x=1763001573;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2eNR0gXNmIUmw89GQXgujHZG/9SWMVHpsfLzK4O6o7I=;
        b=J3YRhuDdp7OCgKjukQzE7wp+Ia3lzkO//zLt63sHqzKTTBKuRMp2Nb7E+vSUXPzFlS
         cAAALLH3ENryglhQCKf/XBKWSTb2FEOUpNnKwku3gg769TtdWJrqCJzIJWBtLf8hURSX
         8iQ1dl0e2m7XOGPruw8bn8m8PAsEFFsBANAml/jWF8in6fFxSIBHT5TR5aM57nPa1t+D
         c1Bx6/UGxxJG6sHx/eScRJaM/QCdX3uGSb3DSmWiuvYdHVSVrb2mMQXiS5Gup1mBBcU+
         OAky9RFIQxmg71kIVBtwWgpAN2JOdLiwuUJ3JJ9bpfSzSPFMlztTn9aZ8XvpmYqCY9/e
         8geQ==
X-Forwarded-Encrypted: i=1; AJvYcCWsz5weOR8JB5hCGwz9C6gqTARx7MIXyOU19UoDiU8uQyxl08OE1sxyRuyAns/5P0WjPCooJPrZXJVybb67vaefjA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzFWrYgYnnQVPmFbklWWVw67EeqWLSat8a++UavBWJ3GRJ7FbLF
	bCJG0/zQD8HMvfWYESr7oAaqUojPpxQSKioyKmHZ9OMr1W7cn6hlMo6SN0d08jTXUhfhEj8sZJG
	3kmMaMMgpnuUDYQWNcCk4AesZBISOtTPY5H+QcsQL
X-Gm-Gg: ASbGnct8Wl9UJ0II89kf/KuubHF0ALxunRkpGOSzgn544HBZi2T+N786PZP4YJ5D/3v
	8Y7RH40gmLVPn8NAt/7Bo9JOWU+br8P869HqM6nF7PAPUCzmIDYpbOZVIxQT5Tl0c9NRoKrLq/t
	/SLlbZWLKjH/oiqNyByWtLdW2eLwx615wTlchqLRhTfaI9crkoSNRVOyXyZVzW9+bVV5xUQN6Y9
	qmyMPFpMTCMUgr9PLEHpqripKt4m/QoPD00GWstB4e1EZuUAyQ51nsh+XvQ
X-Google-Smtp-Source: AGHT+IGJuTr7VhSikUdL+mJyzKmkBgWLGxAfoFqQyzKGSsZmlf2Gkc/1quZmoJrqJlupKDcyB0Th/ppvrz0DqNyO9kE=
X-Received: by 2002:a05:6214:1312:b0:880:2f75:c525 with SMTP id
 6a1803df08f44-88071197e64mr79530726d6.25.1762396773064; Wed, 05 Nov 2025
 18:39:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251017233459.2409975-1-royluo@google.com> <20251017233459.2409975-3-royluo@google.com>
 <20251030011659.bmgdry3wwf4kgjwv@synopsys.com> <CA+zupgxPYXCqew1548uwGx7=9u0b5oCwaXfP7F=FmqMR7a5bDw@mail.gmail.com>
 <20251104020713.orax7rk6qhko5p4m@synopsys.com> <CA+zupgy4qO9X=R7KqEru5kr7tYhgdw=9Z70sLNKj5DTS_J7KZw@mail.gmail.com>
 <20251106003830.v22dnomurtqmqc2y@synopsys.com>
In-Reply-To: <20251106003830.v22dnomurtqmqc2y@synopsys.com>
From: Roy Luo <royluo@google.com>
Date: Thu, 6 Nov 2025 10:38:56 +0800
X-Gm-Features: AWmQ_bkphrNIx4CfxBiTp-P4PkFughKyJrDHinuM5icObzFEnLxeXlpmyW-7ie4
Message-ID: <CA+zupgzNRG3vAukQe89bTJ_EaC2A=o+_pY6QoVOdRfXu8BJOAg@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] usb: dwc3: Add Google Tensor SoC DWC3 glue driver
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Peter Griffin <peter.griffin@linaro.org>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Joy Chakraborty <joychakr@google.com>, 
	Naveen Kumar <mnkumar@google.com>, Badhri Jagan Sridharan <badhri@google.com>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 6, 2025 at 8:38=E2=80=AFAM Thinh Nguyen <Thinh.Nguyen@synopsys.=
com> wrote:
>
> On Tue, Nov 04, 2025, Roy Luo wrote:
> > On Tue, Nov 4, 2025 at 10:07=E2=80=AFAM Thinh Nguyen <Thinh.Nguyen@syno=
psys.com> wrote:
> > >
> > > On Fri, Oct 31, 2025, Roy Luo wrote:
> > > > On Wed, Oct 29, 2025 at 6:35=E2=80=AFPM Thinh Nguyen <Thinh.Nguyen@=
synopsys.com> wrote:
> > >
> > > In dwc3_google_suspend(), looks like is_hibernation is set after you
> > > enable pme irq, probably very unlikely, but can the interrupt be
> > > asserted then? If so, will there be another interrupt asserted?
> > > Otherwise the current logic may think it was spurious interrupt a mis=
s
> > > an event.
> >
> > The pme interrupt can only be asserted after controller is in
> > hibernation, that is, after the usb psw dom is turned off and
> > the dwc3_google_usb_psw_pd_notifier() callback is
> > completed. So no, the interrupt won't fire before is_hibernation
> > is set.
>
> Thanks for the confirmation.
>
>
> <snip>
>
>
> > > > >
> > > > > I'm still trying to wrap my head around how usb_top_pd, usb_psw_p=
d, and
> > > > > the google->dev are working together in the glue here, particular=
ly why
> > > > > usb_top_pd is needed. It seems usb_top_pd shouldn't be handled by=
 this
> > > > > glued? Do you do anything except setting wakeup-capable?
> > > > >
> > > > > BR,
> > > > > Thinh
> > > >
> > > > To provide more context, the underlying usb power domain has 3 powe=
r
> > > > states: Full Power, Power Gated, Off. The usb_top_pd and usb_psw_pd
> > > > are the logical power domains to represent the 3 power states.
> > > > - Full Power:     usb_psw_pd ON,   usb_top_p ON.
> > > > - Power Gated: usb_psw_pd OFF, usb_top_p ON.
> > > > - Off:                 usb_psw_pd OFF, usb_top_p OFF.
> > > >
> > > > To enter hibernation, the usb power domain must enter Power Gated
> > > > state. To achieve this, this glue driver holds a handle to usb_top_=
pd
> > > > and would cast a vote to keep it ON when attempting to enter
> > > > hibernation. In addition, the usb_psw_pd runtime PM is directly tie=
d
> > > > to google->dev so that usb_psw_pd would be OFF when google->dev
> > > > suspends. Together, the usb power domain would reach Power Gated
> > > > state when device suspends.
> > > >
> > > > I hope this information helps.
> > > >
> > >
> > > Yes. This is very helpful.
> > >
> > > So, while the glue driver is bound, usb_top_pd is always ON? Even whe=
n
> > > xhci driver is not bound or when in device mode?
> >
> > Since usb_top_pd is the parent power domain of usb_psw_pd, and
> > usb_psw_pd RPM is directly tied to glue device, usb_top_pd would
> > be ON when glue device is active (because usb_psw_pd is ON)
> > and would be OFF when glue device suspends in non-hibernation
> > scenarios (because usb_psw_pd is OFF). In hibernation scenario,
> > a vote is casted for usb_top_pd to keep it on even when the
> > glue device is suspended and usb_psw_pd is OFF.
> >
> > To your question, usb_top_pd is not always ON because it would be
> > turned off when the glue device suspends in non-hibernation scenario.
> > When in device mode and provided dwc3 dev is active, usb_top_pd
> > would be ON because its child usb_psw_pd is ON.
> >
>
> Thanks for the clarification and bearing with my questions.
>
> If there's no device connected, do you role-switch back to default mode?
> Often I see that the role-switch is defaulted to peripheral and switch
> to default mode if there's no connection.

Yes, the default mode would be peripheral and it would switch
to peripheral mode if there's no connection.

>
> I want to check the case where the device may wakeup by connection but
> cannot because it is not in host mode. Do you have a separate
> TCPC/connector that can wakeup the system on attachment?

Yes, there's a separate TCPC/connector to trigger a role
switch when there's an incoming connection.

Regards,
Roy Luo

>
> BR,
> Thinh
