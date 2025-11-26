Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1FD330BB81
	for <linux-samsung-soc@vger.kernel.org>; Wed, 26 Nov 2025 06:44:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764139459; cv=none; b=W71DNx6PdB2CthdWvhE1zBgnC8idTAWyCqLHUCsm1smqvDiKRAN+wyeUQouHU8zi6l4so0dcVuiV7+zXUL+KJ6p0ZQdYYA26fnGuBEXAjmSBWcwPUgn/T1HaauIUFbOvWsNoXfIm1+iU78MvQvUIzvee1RYWdRKknASPut3UcbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764139459; c=relaxed/simple;
	bh=Etr+Ix0Iw21+0ZkT9TJ1m440KHu3t5b0AqRdb6wd3oE=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Bw/kzKgOnjSCTtmvvYB9KR0gi86guvmshegW3laRwi+uGAVQxVCQfbUsXgZ059mtZEr0OBN2KJS11NOfRUDJ7cC3SxU8kZl8mbyxqUr1EafHpCBdGnFwr1RfhqtHsTe+LzhzpB7nFUgENp5uCjj07pIm4nGHz7vUIQXZ/Ptx7F0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sEkxo4FN; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sEkxo4FN"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-477770019e4so52694665e9.3
        for <linux-samsung-soc@vger.kernel.org>; Tue, 25 Nov 2025 22:44:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764139456; x=1764744256; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=iagMIGIeHxyM0iFPX2ThJoiCFK8Ow6UALIrOqYnhTgg=;
        b=sEkxo4FNAaggmEKWzQPa5gxZBF43mgLKyvRcMpAC7TsCaKcScDt7nN6skKpDJ3H7m8
         Ene9A1fxI/8NvnuNGkbpTxWZ0rMZr7d9BpmxNTxz1BQgGT23xbTAvlT4LmX4aJV78sea
         ZPsvECfQloLv4KJb6ojxpaLJym5P6NYMx62E2k6kKg7MzSlc9/+eIhlTD76PMfuMQw5J
         1F/fLBVE1Sb/60y4KBNlaOg/sIrrwQ6pV2I+XrM9p+rlAqz+CELueA+TPNo9Mbdpzciz
         MvStquhWftveiivwtI9aaw2ZQ7W28t2z97z2iiAKyRUacVfDQN6YuYTogNNpecR1SVXz
         2/ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764139456; x=1764744256;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iagMIGIeHxyM0iFPX2ThJoiCFK8Ow6UALIrOqYnhTgg=;
        b=avlxYoUKfXv72+o5szRyzLibgcdktttPAqe0vp9t/mbGCzwDBxa5H6kypkW6Hdakx7
         I0mvRuVdBmOozcOoyyFGckTPA4d+hIbh5JTgjzfTf+lnCwD89y9170KPORBKPh/ru+3e
         9U640fsrEC/jW7TI1wun0L4i+LCB0fBdvGgHpGGlawDfbzAiOpD/vx+H0cn6mgaZlx6E
         0fU6B3L0zTjBtNPLaksYX9AYNYaCwPpGHOgTYkwZbWkN4V/cKcmgGjhy8rXEEC+ZoRLK
         ddLqSgkqoc/9zDC9SNXBTFM4+XQP1/JkT/OzDbvbt2o/FtgWnvAuJTcakIVvyxVxj7ae
         HUvA==
X-Forwarded-Encrypted: i=1; AJvYcCXpEdmbjrUybifGiGxkZ/imAmikKKkl8f+At8WbA0NnuXKQoPtqicn4HJCBPVRd4MRyaQMuhBPI0u+bLo9yTqJ8zw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzs3i2Fojyq22vt6boXpuyu07gYIWFAodyqbSwZb9MHvf9Bw6UU
	P4ByCCN7hB0WpWEpXGMdFM6/vLsvuondpI3XhTcgLbU4MSMsl3+HumiNUYrExNXaCbQ=
X-Gm-Gg: ASbGnctnBiAItfiQPXHQkOatTVMXaPkAEmkL5lQHV9Fa4SnC6C8OsQe6f9pylci1Cpi
	MBEBDUwjx86N7Q2QoXeYOzkZmpibfN4xNenA2wgT2Tdv3fU4o6bW7TLLNiZG2lOdEZEkzks9C4d
	Hdpz7iDOV38r4wy8CbqG9N2iGBG7amD2RQRMIeqDg5PIjdQ1eN1UdXj6uQmd+FpiYGnc69uvRl5
	g0U56Gi/am+FdcgSbjLo8kKIY8A/Bubki+Hz+EU+0efK/IEASdIi4WPURYTtWBqsYB7q/Uk2xHz
	bHwK2aC79vv6VHZS2h7Uqn7XqVQXsHhe6cqdeUCLODw1kqALV5gOPiY+Loo2MdzDVpSNpR4MvL8
	S7DUgXGWiSBizxsEnwGtHay0kzHwtu/dRW+qILEB4+wb0uHrukb268WfMQQjtVfVJzyVjbVwvNa
	KBZMpk0OYRAow0hye8
X-Google-Smtp-Source: AGHT+IGY6wpQR5oGHT//GHTCibu+r9RkZemJQTbELxXxGfU09J5aQ0TWFaLsehta2pjsoi8ZOGTqhA==
X-Received: by 2002:a05:6000:2891:b0:429:9323:2bec with SMTP id ffacd0b85a97d-42e0f356945mr5897156f8f.40.1764139456149;
        Tue, 25 Nov 2025 22:44:16 -0800 (PST)
Received: from draszik.lan ([212.129.87.89])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7f2e454sm38406428f8f.2.2025.11.25.22.44.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 22:44:15 -0800 (PST)
Message-ID: <e25ff0e5ff103433942fc7744eea4a3c61ce1daf.camel@linaro.org>
Subject: Re: [PATCH 4/6] mfd: max77759: modify irq configs
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Amit Sunil Dhamne <amitsd@google.com>, Sebastian Reichel
 <sre@kernel.org>,  Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,  Lee Jones
 <lee@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Badhri
 Jagan Sridharan	 <badhri@google.com>, Heikki Krogerus
 <heikki.krogerus@linux.intel.com>,  Peter Griffin
 <peter.griffin@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, Alim
 Akhtar	 <alim.akhtar@samsung.com>
Cc: linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, RD
 Babiera <rdbabiera@google.com>, Kyle Tso <kyletso@google.com>
Date: Wed, 26 Nov 2025 06:44:30 +0000
In-Reply-To: <aa7bdeb1-c8a9-4353-af56-869f16a083c2@google.com>
References: <20251123-max77759-charger-v1-0-6b2e4b8f7f54@google.com>
	 <20251123-max77759-charger-v1-4-6b2e4b8f7f54@google.com>
	 <5c901a6c831775a04924880cc9f783814f75b6aa.camel@linaro.org>
	 <aa7bdeb1-c8a9-4353-af56-869f16a083c2@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-2+build3 
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Amit,

On Tue, 2025-11-25 at 17:10 -0800, Amit Sunil Dhamne wrote:
> Hi Andr=C3=A9,
>=20
> On 11/23/25 10:21 PM, Andr=C3=A9 Draszik wrote:
> > Hi Amit,
> >=20
> > Thanks for your patches to enable the charger!
>=20
> Ack!
>=20
>=20
> > > From: Amit Sunil Dhamne <amitsd@google.com>
> > >=20
> > > Define specific bit-level masks for charger's registers and modify th=
e
> > > irq mask for charger irq_chip. Also, configure the max77759 interrupt
> > > lines as active low to all interrupt registrations to ensure the
> > > interrupt controllers are configured with the correct trigger type.
> > >=20
> > > Signed-off-by: Amit Sunil Dhamne <amitsd@google.com>
> > > ---
> > > =C2=A0=C2=A0drivers/mfd/max77759.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 | 24 +++++++++++++++++-------
> > > =C2=A0=C2=A0include/linux/mfd/max77759.h |=C2=A0 9 +++++++++
> > > =C2=A0=C2=A02 files changed, 26 insertions(+), 7 deletions(-)
> > >=20
> > > diff --git a/drivers/mfd/max77759.c b/drivers/mfd/max77759.c
> > > index 6cf6306c4a3b..5fe22884f362 100644
> > > --- a/drivers/mfd/max77759.c
> > > +++ b/drivers/mfd/max77759.c
> > > @@ -256,8 +256,17 @@ static const struct regmap_irq max77759_topsys_i=
rqs[] =3D {
> > > =C2=A0=C2=A0};
> > > =C2=A0=20
> > > =C2=A0=C2=A0static const struct regmap_irq max77759_chgr_irqs[] =3D {
> > > -	REGMAP_IRQ_REG(MAX77759_CHARGER_INT_1, 0, GENMASK(7, 0)),
> > > -	REGMAP_IRQ_REG(MAX77759_CHARGER_INT_2, 1, GENMASK(7, 0)),
> > > +	REGMAP_IRQ_REG(MAX77759_CHARGER_INT_1, 0,
> > > +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 MAX77759_CHGR_REG_CHG_INT_AIC=
L |
> > > +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 MAX77759_CHGR_REG_CHG_INT_CHG=
IN |
> > > +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 MAX77759_CHGR_REG_CHG_INT_CHG=
 |
> > > +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 MAX77759_CHGR_REG_CHG_INT_INL=
IM),
> > > +	REGMAP_IRQ_REG(MAX77759_CHARGER_INT_2, 1,
> > > +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 MAX77759_CHGR_REG_CHG_INT2_BA=
T_OILO |
> > > +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 MAX77759_CHGR_REG_CHG_INT2_CH=
G_STA_CC |
> > > +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 MAX77759_CHGR_REG_CHG_INT2_CH=
G_STA_CV |
> > > +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 MAX77759_CHGR_REG_CHG_INT2_CH=
G_STA_TO |
> > > +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 MAX77759_CHGR_REG_CHG_INT2_CH=
G_STA_DONE),
> > > =C2=A0=C2=A0};

You should also add the remaining bits in each register here, so that the
regulator-irq can mask them when no user exists. It will only touch the
bits it knows about, so the state of the mask register is non-
deterministic with this change as-is (depends on how the bootloader
configured it).

[...]

> >=20
> >=20
> > > diff --git a/include/linux/mfd/max77759.h b/include/linux/mfd/max7775=
9.h
> > > index c6face34e385..0ef29a48deec 100644
> > > --- a/include/linux/mfd/max77759.h
> > > +++ b/include/linux/mfd/max77759.h
> > > @@ -62,7 +62,16 @@
> > > =C2=A0=C2=A0#define MAX77759_CHGR_REG_CHG_INT=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0xb0
> > > =C2=A0=C2=A0#define MAX77759_CHGR_REG_CHG_INT2=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0xb1
> > > =C2=A0=C2=A0#define MAX77759_CHGR_REG_CHG_INT_MASK=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0xb2
> > > +#define MAX77759_CHGR_REG_CHG_INT_AICL=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 BIT(7)
> > > +#define MAX77759_CHGR_REG_CHG_INT_CHGIN=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 BIT(6)
> > > +#define MAX77759_CHGR_REG_CHG_INT_CHG=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 BIT(4)
> > > +#define MAX77759_CHGR_REG_CHG_INT_INLIM=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 BIT(2)
> > > =C2=A0=C2=A0#define MAX77759_CHGR_REG_CHG_INT2_MASK=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0xb3
> > > +#define MAX77759_CHGR_REG_CHG_INT2_BAT_OILO=C2=A0=C2=A0=C2=A0=C2=A0 =
BIT(4)
> > > +#define MAX77759_CHGR_REG_CHG_INT2_CHG_STA_CC=C2=A0=C2=A0 BIT(3)
> > > +#define MAX77759_CHGR_REG_CHG_INT2_CHG_STA_CV=C2=A0=C2=A0 BIT(2)
> > > +#define MAX77759_CHGR_REG_CHG_INT2_CHG_STA_TO=C2=A0=C2=A0 BIT(1)
> > > +#define MAX77759_CHGR_REG_CHG_INT2_CHG_STA_DONE BIT(0)
> > Even if wireless out of scope, it'd still be nice to add macros for
> > the remaining bits to make this complete and avoid having to update
> > these again in case wireless support gets added in the future.
>=20
> I would prefer to only define the macros I am currently using to keep=20
> the review focused, unless you consider this a strict requirement.

It makes sense to add them now, as per above.



> > Also, would be nice to keep existing style and indent the bits from
> > the registers (see existing bit definitions in this file a few lines
> > further up).
> > Finally, can you add the bits below the respective register (0xb0 / 0xb=
1)
> > please, to keep suffix meaningful, and to follow existing style for cas=
es
> > like this (see MAX77759_MAXQ_REG_UIC_INT1).
>=20
> I will fix the indentation and ordering in the next revision.
>=20
> Regarding bit definitions: In [PATCH 5/6], the max77759_charger.c driver=
=20
> defines bits for the register addresses defined in this file. Currently,=
=20
> those macros are only used locally by the max77759 charger driver. Would=
=20
> you prefer I move those definitions to this header file as well?

Yes, would be nice to have them all in one place (in this file). That said,
CHG_INT, CHG_INT_MASK, and CHG_INT_OK all have the same layout and share
the same bits, so I personally would probably reuse the ones you added for
INT for all three of them - MASK (as you did already), and also for the OK
register. But up to you.

Cheers,
Andre'
