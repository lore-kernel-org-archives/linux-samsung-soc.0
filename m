Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E04C224B0E
	for <linux-samsung-soc@vger.kernel.org>; Mon, 26 Jan 2026 21:00:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769461239; cv=none; b=Zxv2j/CrzKAGzjf8K4Bz+1Kxi9OwR9tpBvQ28DfoMUcLK1oW0DiA2ySzrlV4x/2w88POLAn6G/JPYdVsS17Ny//ki8eBJbt1rwACzR7tW7UTsiwu2ix9VbysSKvjkrtxoDpZisbflTANyM8vGcaPN2BrTczs3RlvLq1ttCTWV+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769461239; c=relaxed/simple;
	bh=WqSXMgwN1bj6WlKNWD0giAIg11OWSEsUWJe5KbkBJ/w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hElXxMKJARtZrfuQcIbRHtFldQMM1+DX4z9tX9IDJVP7hHc+EkpUC6rPiPeCQSsWpXyyQUNLEA0KtH9WxFZyr0851+p56GhwvKtRMbNtpxoJDYOmNuG2wUMRth/GG5q8EKKx/uiOLp+iauyXiUociodznFH3YQqptVR1o80RIuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KWI1MNAU; arc=none smtp.client-ip=209.85.221.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KWI1MNAU"
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-56641b5a471so3425983e0c.2
        for <linux-samsung-soc@vger.kernel.org>; Mon, 26 Jan 2026 13:00:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769461237; x=1770066037; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=iCW3LI0lwZJMRrEDS+3kqbUxY3kv4Hh4/Y+P85JSc/0=;
        b=KWI1MNAUHHCbhDYFWnEuN7yrbRnndzW871ayjj//lfojsvacTn68BQSoG6coOHjBXQ
         leR9ERqdxPiLBaYfcKITRSjaui39s6O28Rw6EHGjTTwNAfVN0dlYRnMVd7HlgeXKtrBj
         S3NnswhU8jQAooxEmu7h3h3vnBtAA8QlkzBzYsgwFj7EdDdiTOFRgaKP6Cemh8PE3SKJ
         rJjy6eW0dpAIHE+jIrKvUWHLJhvd0vmxW7pkY5AN/0qBMeRZimdbsMWI2iBcF8F/p0yl
         4WQzGuNyEYUY3uBXH++eQD7lZt4ojBSvhRwiNlbsdLqohw1wUDDalkeSMUOeX7OoOJnm
         sAsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769461237; x=1770066037;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iCW3LI0lwZJMRrEDS+3kqbUxY3kv4Hh4/Y+P85JSc/0=;
        b=eCwR8vOKHASTPEobecnXm+e7DlZbjIrqxDvxL6YyyQPqrSYt7z1AbTNfeiEELPWcBd
         Y/b/pA4FoEutiZ7jGJETp4DqMwqqAv1onxJz54VYHqfMI0gNpD8rQMBFcbqKKohdo6XB
         ydO5kzjy5mpVEuKJcFhale0ewwZf2M/9npz4wFIZAyfGoD6WwCNYSCd47XXlhleg9oxf
         xUU29tdhkEMb4AwthoPJRKhOpFg4SriG/iPKQNE/mqw0mVI0yJAH6cQOape8LD63Clna
         Er/7cAgeLRfl8dE3t7IrkWoqWHsgU8m7DDt3fcpm/R4Ok7JhW3E3jMAQAJ2BaFO5WfZK
         Dhsw==
X-Forwarded-Encrypted: i=1; AJvYcCWaiDL5jLPb1zWPZgr/XZssqY+Jsf2i5xgPpGQL4ptJ+TUU7LCDBCI6O1y9zWsttdcRYZd0AAT4TqQnREzHO0xqLQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz16h7W0aiAx35jMGS5Z8dJPm+WeEZFf2lWPMFE7ncpWch18O8O
	zmSdx1yLQbP2XyZqmjyRfqDz7g+k4MY52lyuEjX3RluW8LN/ULAIRnC/XLSUeQ==
X-Gm-Gg: AZuq6aJHQM2dzDglbzprrEZox+zcLuO+9D67PWiKyZEKkRbRdt8xUIP0eNcY7ZAhn3x
	Phyy1199VlbIdqjTN3bBC1Zxc9i0SFnOFgy1BANugIC+Z2zHbaozLvG+3xaYnNwMr5otK5pD28r
	xrbpsJSYWpR9Z+sZFMR26ikHZUMqyAooZOu7Ynus8QRDLZ7eVpkpihxIlFPx+gVJBTZnWdQb5Bq
	nSkDyHaQN0kY9hryXyFZRaSVXFDkbbq3x7qiGb+lKPF8K5qW6L7uAu0gXdpcbKl/skTqNIaZyXI
	yIC5GL6559Dq0qOyVOGBcQr6V7TUupGq+Wbe1B3+4F5oxf5Ix7eOWQfMxNUc+2PNjrmLuHSr1zn
	Ngz0kTLDsS2vUg+DWUHhF7tgE3xGn/z4clnSYwY2qdgICnksV8Ig+pp6sTfTyp289GjBpR4V407
	9HcihLQ3gCX2ruKiL06ZE5+B3iPuL/vGp7ZPsZf4CITa0y1TkxcivKVaJtvw6rkSs=
X-Received: by 2002:a05:7301:1003:b0:2b0:5028:bafd with SMTP id 5a478bee46e88-2b7642198c5mr2076868eec.8.1769454774472;
        Mon, 26 Jan 2026 11:12:54 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:cb35:17f5:7e82:90c4])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b749e301f0sm13452476eec.35.2026.01.26.11.12.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 11:12:53 -0800 (PST)
Date: Mon, 26 Jan 2026 11:12:49 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: "Rob Herring (Arm)" <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Karthikeyan Mitran <m.karthikeyan@mobiveil.co.in>, Hou Zhiqiang <Zhiqiang.Hou@nxp.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Christopher Ruehl <chris.ruehl@gtsys.com.hk>, "Jason A. Donenfeld" <Jason@zx2c4.com>, 
	Matthias Schiffer <matthias.schiffer@ew.tq-group.com>, Vincent Huang <vincent.huang@tw.synaptics.com>, 
	Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, 
	Frank Li <Frank.Li@nxp.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-input@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-pci@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: Fix emails with spaces or missing brackets
Message-ID: <m5ckxhpvhtjcc6fzlsz7y5sjxvzlbx6n7vel264hbw47joivi6@iwchebcbyjod>
References: <20260126164724.2832009-1-robh@kernel.org>
 <9a3d4ae8-b57e-450e-971b-d09fc923eee1@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9a3d4ae8-b57e-450e-971b-d09fc923eee1@roeck-us.net>

On Mon, Jan 26, 2026 at 09:21:15AM -0800, Guenter Roeck wrote:
> On 1/26/26 08:47, Rob Herring (Arm) wrote:
> > Fix email addresses with spaces or missing brackets. A pending
> > dtschema meta-schema change will check for these.
> > 
> > Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> 
> For hwmon:
> 
> Acked-by: Guenter Roeck <linux@roeck-us.net>

For input:

Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

> 
> > ---
> >   Documentation/devicetree/bindings/hwmon/sensirion,shtc1.yaml    | 2 +-
> >   Documentation/devicetree/bindings/input/syna,rmi4.yaml          | 2 +-
> >   .../devicetree/bindings/media/samsung,exynos5250-gsc.yaml       | 2 +-
> >   Documentation/devicetree/bindings/pci/mbvl,gpex40-pcie.yaml     | 2 +-
> >   4 files changed, 4 insertions(+), 4 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/hwmon/sensirion,shtc1.yaml b/Documentation/devicetree/bindings/hwmon/sensirion,shtc1.yaml
> > index 3d14d5fc96c5..7b38f2182ffa 100644
> > --- a/Documentation/devicetree/bindings/hwmon/sensirion,shtc1.yaml
> > +++ b/Documentation/devicetree/bindings/hwmon/sensirion,shtc1.yaml
> > @@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
> >   title: Sensirion SHTC1 Humidity and Temperature Sensor IC
> >   maintainers:
> > -  - Christopher Ruehl chris.ruehl@gtsys.com.hk
> > +  - Christopher Ruehl <chris.ruehl@gtsys.com.hk>
> >   description: |
> >     The SHTC1, SHTW1 and SHTC3 are digital humidity and temperature sensors
> > diff --git a/Documentation/devicetree/bindings/input/syna,rmi4.yaml b/Documentation/devicetree/bindings/input/syna,rmi4.yaml
> > index f369385ffaf0..8685ef4481f4 100644
> > --- a/Documentation/devicetree/bindings/input/syna,rmi4.yaml
> > +++ b/Documentation/devicetree/bindings/input/syna,rmi4.yaml
> > @@ -8,7 +8,7 @@ title: Synaptics RMI4 compliant devices
> >   maintainers:
> >     - Jason A. Donenfeld <Jason@zx2c4.com>
> > -  - Matthias Schiffer <matthias.schiffer@ew.tq-group.com
> > +  - Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
> >     - Vincent Huang <vincent.huang@tw.synaptics.com>
> >   description: |
> > diff --git a/Documentation/devicetree/bindings/media/samsung,exynos5250-gsc.yaml b/Documentation/devicetree/bindings/media/samsung,exynos5250-gsc.yaml
> > index 878397830a4d..9196cf5dac0f 100644
> > --- a/Documentation/devicetree/bindings/media/samsung,exynos5250-gsc.yaml
> > +++ b/Documentation/devicetree/bindings/media/samsung,exynos5250-gsc.yaml
> > @@ -9,7 +9,7 @@ title: Samsung Exynos SoC G-Scaler
> >   maintainers:
> >     - Inki Dae <inki.dae@samsung.com>
> >     - Krzysztof Kozlowski <krzk@kernel.org>
> > -  - Seung-Woo Kim <sw0312.kim@samsung.com
> > +  - Seung-Woo Kim <sw0312.kim@samsung.com>
> >   description:
> >     G-Scaler is used for scaling and color space conversion on Samsung Exynos
> > diff --git a/Documentation/devicetree/bindings/pci/mbvl,gpex40-pcie.yaml b/Documentation/devicetree/bindings/pci/mbvl,gpex40-pcie.yaml
> > index d286b77921e0..8f5d33050348 100644
> > --- a/Documentation/devicetree/bindings/pci/mbvl,gpex40-pcie.yaml
> > +++ b/Documentation/devicetree/bindings/pci/mbvl,gpex40-pcie.yaml
> > @@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
> >   title: Mobiveil AXI PCIe Host Bridge
> >   maintainers:
> > -  - Frank Li <Frank Li@nxp.com>
> > +  - Frank Li <Frank.Li@nxp.com>
> >   description:
> >     Mobiveil's GPEX 4.0 is a PCIe Gen4 host bridge IP. This configurable IP

Thanks.

-- 
Dmitry
