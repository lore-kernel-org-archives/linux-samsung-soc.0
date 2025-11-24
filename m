Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7DDD2F49EC
	for <linux-samsung-soc@vger.kernel.org>; Mon, 24 Nov 2025 09:09:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763975369; cv=none; b=NW7enfJCYRurK8GZT77N61WDVOvJQRz0mWOhdGPb0EVcLXNCMBbRggw8OPBueudKq+PeO1pvDGYFBmAyffFryP04jNWwLeikfe7WQutM5d6KJpZ9kNcGxRT3D6hskomDwcKbGeTonafITVfIVHX3IZe0adWOvKjY09XOdx+AfF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763975369; c=relaxed/simple;
	bh=7cucVKRF1i3U03wQQZLLaXMd6VYekFa/vhwxJjBb0wM=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=UAAOpqdztp3VmRVNd1OsN80SWUZWClZPsyZCUqb4o5U0KwwkbUW028pDlbPvSyJ5RY0URuY98ydn4ySpT2+BFGDOebAdIYdKbBt6oZB2B8x9soQCdAyYRR5caZbhWDVUgvJ7Nv6wntgWcgYxsMvFvFgWwA4bHyDIFLgpz7juj6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=X9EVSicO; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="X9EVSicO"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-42b379cd896so2158778f8f.3
        for <linux-samsung-soc@vger.kernel.org>; Mon, 24 Nov 2025 01:09:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763975365; x=1764580165; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=OvXHuoRgH+XIUx292dJAYC+bXU3Y0ChyF2IbAzcMS/Q=;
        b=X9EVSicOG5kFedBvxTqDIIeuZHrgVhbmsI9Le4AlBj6Ihivl6ynbpfuufKRyy1ex3s
         jx1nXKjlbLynhnWJUpG31IwszI9yHnUsGs3Kafbm7Gdx+oTA71dMmslVU/2YxUCf9z8L
         8zbtDaUkx6Um0kcRoEOVmKxv/F+4/1OmtjIH6ESm0NxDivD3Q6SklCKmb/cQl9S33MKg
         6HrSjIAXyAKgEjNPuBjYqirBPJ5pprxr4fX6mkJL5cHn1hgvRbK0pOlZZk5PVythSGy7
         Tf4plCwzPYl8NmAzDJ90x6dzXZkBviqbXTHrqHh7nj9AYr3OmLlwKyUIBfd0n3WN/Tj4
         m9Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763975365; x=1764580165;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OvXHuoRgH+XIUx292dJAYC+bXU3Y0ChyF2IbAzcMS/Q=;
        b=Bqb6a9Bahul+POIOpFA370wfFymk3zxJLkB8J+5VXHDarVaCmmwX3kbb89AMFHJzqY
         J1gd4EzPX46i7H3AtQibfAtOO2NBTVfuMuLVtADeHyfVQ1aevP84HqF32lW/nj9Q51+z
         ygdx2TcnugklXIM4EhBm7HdIu+oCG2oleTNMUxi7BY8/LbJdwKdU9Z49PJGxMEKbL+/+
         HFR9QISbuBaO0/r3gYKtFjDyK30CzN8x5r86qQjuQ7rPEvZvxwQ3mF+1N0B59DpIrDl/
         gVRn5K7fL/ESS3PbkbOOEmzu9Hq/n09UU9nxbhzPpe4mfZNGe9ck0GMhysHedGiJ61oR
         ysxQ==
X-Forwarded-Encrypted: i=1; AJvYcCXAfux9qSCq2bQtLSBQlPBJi3T6NijS9iTr2NhA6D2jc1d9m5D2vu4lJqbuut+TGfrJE1ME5rIso+PiJktWHbRwDA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwTSRXm/cW1r4BDZCJD6RwtabOL5PEH+pqj53y4oLaNkFC+EhyE
	GX078OeZp2OY5RQPZBH961p+p1PTm7LOCER6+Wz44ngDrv2A/eT3ypkKUoO4Vhf+II4=
X-Gm-Gg: ASbGncutzWd1J4A2CyvtGw2uOxQDEhs2l/vwV0/Kp/AEuj+L08DGLMxIV+Bj1dG/jy0
	CV9Iqma2XvVrf9fKJvgn/NRCsPW39R46E90Iu99vpTfUhm+Jmh5l2baywTaBIrx1hjG6qevT5HC
	cPky5/9DDbf/2EFF7pwVx0APyXoiE0x4y2xbpDzeRWXX0nIZiFqBXoqGhmImfmPR5xmHm1wj2v/
	LWivxQs7lCEeql8m1iTdi6yxq/R7rI8Yh0QPWB6iGEl458U0RJWQf0jLQ7LcUMa7ahoFPEPD6Bd
	GtWNXCpgxQFO5P7xXZ/NlIf/iAwWPBY+alU7XJ3W3wpYOSkGyZOH7LZXeYsczLxQgEBuvNBcDFo
	QNvN683xJ1DKpW17QjF8E4Hg6a0moNHo5z0qlYlZwIm1TUh4XgHxOGdZtlIrqf7mdniztMCQCo5
	qOdgcuRZZMlb2KCMhT4A==
X-Google-Smtp-Source: AGHT+IGb2anSnU9yUNqdmZbv+SeaRHh1StnydsjMu/nMg2MY1ixTXj9wwNITrqgGCjoJ7tz/T/jZVA==
X-Received: by 2002:a5d:5f44:0:b0:42b:41dc:1b58 with SMTP id ffacd0b85a97d-42cc1d19957mr11009024f8f.45.1763975365182;
        Mon, 24 Nov 2025 01:09:25 -0800 (PST)
Received: from draszik.lan ([212.129.72.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7fb9190sm27162766f8f.33.2025.11.24.01.09.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Nov 2025 01:09:24 -0800 (PST)
Message-ID: <9cad7b42dbfea351fb3b708736bf6f6715bcf694.camel@linaro.org>
Subject: Re: [PATCH 6/6] usb: typec: tcpm/tcpci_maxim: deprecate WAR for
 setting charger mode
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: amitsd@google.com, Sebastian Reichel <sre@kernel.org>, Rob Herring	
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley	
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, Greg Kroah-Hartman	
 <gregkh@linuxfoundation.org>, Badhri Jagan Sridharan <badhri@google.com>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, Peter Griffin
 <peter.griffin@linaro.org>, Tudor Ambarus	 <tudor.ambarus@linaro.org>, Alim
 Akhtar <alim.akhtar@samsung.com>
Cc: linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, RD
 Babiera <rdbabiera@google.com>, Kyle Tso <kyletso@google.com>
Date: Mon, 24 Nov 2025 09:09:37 +0000
In-Reply-To: <20251123-max77759-charger-v1-6-6b2e4b8f7f54@google.com>
References: <20251123-max77759-charger-v1-0-6b2e4b8f7f54@google.com>
	 <20251123-max77759-charger-v1-6-6b2e4b8f7f54@google.com>
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

On Sun, 2025-11-23 at 08:35 +0000, Amit Sunil Dhamne via B4 Relay wrote:
> From: Amit Sunil Dhamne <amitsd@google.com>
>=20
> TCPCI maxim driver directly writes to the charger's register space to
> set charger mode depending on the power role. As MAX77759 chg driver
> exists, this WAR is not required.
>=20
> Instead, use a regulator interface to set OTG Boost mode.
>=20
> Signed-off-by: Amit Sunil Dhamne <amitsd@google.com>
> ---
> =C2=A0drivers/usb/typec/tcpm/tcpci_maxim.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
|=C2=A0 1 +
> =C2=A0drivers/usb/typec/tcpm/tcpci_maxim_core.c | 48 ++++++++++++++++++++=
+----------
> =C2=A02 files changed, 34 insertions(+), 15 deletions(-)
>=20
> diff --git a/drivers/usb/typec/tcpm/tcpci_maxim.h b/drivers/usb/typec/tcp=
m/tcpci_maxim.h
> index b33540a42a95..6c82a61efe46 100644
> --- a/drivers/usb/typec/tcpm/tcpci_maxim.h
> +++ b/drivers/usb/typec/tcpm/tcpci_maxim.h
> @@ -60,6 +60,7 @@ struct max_tcpci_chip {
> =C2=A0	struct tcpm_port *port;
> =C2=A0	enum contamiant_state contaminant_state;
> =C2=A0	bool veto_vconn_swap;
> +	struct regulator *otg_reg;
> =C2=A0};
> =C2=A0
> =C2=A0static inline int max_tcpci_read16(struct max_tcpci_chip *chip, uns=
igned int reg, u16 *val)
> diff --git a/drivers/usb/typec/tcpm/tcpci_maxim_core.c b/drivers/usb/type=
c/tcpm/tcpci_maxim_core.c
> index 19f638650796..6d819a762fa1 100644
> --- a/drivers/usb/typec/tcpm/tcpci_maxim_core.c
> +++ b/drivers/usb/typec/tcpm/tcpci_maxim_core.c
> @@ -10,6 +10,7 @@
> =C2=A0#include <linux/kernel.h>
> =C2=A0#include <linux/module.h>
> =C2=A0#include <linux/regmap.h>
> +#include <linux/regulator/consumer.h>
> =C2=A0#include <linux/usb/pd.h>
> =C2=A0#include <linux/usb/tcpci.h>
> =C2=A0#include <linux/usb/tcpm.h>
> @@ -202,32 +203,49 @@ static void process_rx(struct max_tcpci_chip *chip,=
 u16 status)
> =C2=A0	tcpm_pd_receive(chip->port, &msg, rx_type);
> =C2=A0}
> =C2=A0
> +static int get_otg_regulator_handle(struct max_tcpci_chip *chip)
> +{
> +	if (IS_ERR_OR_NULL(chip->otg_reg)) {
> +		chip->otg_reg =3D devm_regulator_get_exclusive(chip->dev,
> +							=C2=A0=C2=A0=C2=A0=C2=A0 "otg-vbus");
> +		if (IS_ERR_OR_NULL(chip->otg_reg)) {
> +			dev_err(chip->dev,
> +				"Failed to get otg regulator handle");
> +			return -ENODEV;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> =C2=A0static int max_tcpci_set_vbus(struct tcpci *tcpci, struct tcpci_dat=
a *tdata, bool source, bool sink)
> =C2=A0{
> =C2=A0	struct max_tcpci_chip *chip =3D tdata_to_max_tcpci(tdata);
> -	u8 buffer_source[2] =3D {MAX_BUCK_BOOST_OP, MAX_BUCK_BOOST_SOURCE};
> -	u8 buffer_sink[2] =3D {MAX_BUCK_BOOST_OP, MAX_BUCK_BOOST_SINK};
> -	u8 buffer_none[2] =3D {MAX_BUCK_BOOST_OP, MAX_BUCK_BOOST_OFF};

You should also remove the corresponding #defines at the top of this file.

> -	struct i2c_client *i2c =3D chip->client;
> =C2=A0	int ret;
> =C2=A0
> -	struct i2c_msg msgs[] =3D {
> -		{
> -			.addr =3D MAX_BUCK_BOOST_SID,
> -			.flags =3D i2c->flags & I2C_M_TEN,
> -			.len =3D 2,
> -			.buf =3D source ? buffer_source : sink ? buffer_sink : buffer_none,
> -		},
> -	};
> -
> =C2=A0	if (source && sink) {
> =C2=A0		dev_err(chip->dev, "Both source and sink set\n");
> =C2=A0		return -EINVAL;
> =C2=A0	}
> =C2=A0
> -	ret =3D i2c_transfer(i2c->adapter, msgs, 1);
> +	ret =3D get_otg_regulator_handle(chip);
> +	if (ret) {
> +		/*
> +		 * Regulator is not necessary for sink only applications. Return
> +		 * success in cases where sink mode is being modified.
> +		 */
> +		return source ? ret : 1;
> +	}
> +
> +	if (source) {
> +		if (!regulator_is_enabled(chip->otg_reg))
> +			ret =3D regulator_enable(chip->otg_reg);
> +	} else {
> +		if (regulator_is_enabled(chip->otg_reg))
> +			ret =3D regulator_disable(chip->otg_reg);
> +	}

Given otg_reg is the fake regulator created by a previous patch in this
series, this means that the regulator API is really used to configure two
out of 16 possible charger modes here. That doesn't look right.

Cheers,
Andre'
