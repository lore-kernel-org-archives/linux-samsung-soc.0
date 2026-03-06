Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AB0336C0A6
	for <linux-samsung-soc@vger.kernel.org>; Fri,  6 Mar 2026 07:01:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772780513; cv=none; b=jxynHRm2CfYeSfrPwnWebB2fAOpQyQTQINI0C9BkwiDornX2Fb9HZnNvmFbZVXuTrRehSxtDVsuR7B+GO/76DX4/OeVbfu6DtIfJ+c9tgbS3ApFs3jZ1HdMW+4UM85Aby0JKUsSlYc7Uw2e3WqO91CvBBruPWQMRD5BcuwIFu/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772780513; c=relaxed/simple;
	bh=U5ovtFZGT6J0/COcDYCmDClaijQmWD3Zbr+hgB175wI=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=UPn7+TqlAPIILP9k9jgam+zj1eSMVg/WSglGrGu3JQrg2voQc36i9xj4/KbVaxhd167cw5V6Vxt7kYk5+FqDECSV15+7/vnr58W8jvl3dE072OdatZG96QGLUjEXeMieLxz7mW/Uetpk1LE5L9EwCif/nLxmxm6+4vS4W+EA3J8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=E4T4ajbW; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="E4T4ajbW"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-439c56e822eso3098040f8f.2
        for <linux-samsung-soc@vger.kernel.org>; Thu, 05 Mar 2026 23:01:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772780510; x=1773385310; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=g/Izo1I7P2lYa0tqmXpdAdhxEzYAi9jVGmrjmB9VLPo=;
        b=E4T4ajbWUTWlFMArKhQ6V7XMrb5b2K4Skb3GX6ke3CeDTdq3BOs5CkdvPyOwoUoCYi
         gFltKAZML+LKYgacr9grDe7rklDT2EkfpUgMCfs2m68QlzKJSERfTsdq9vVBnGNQNxnD
         Edxm8qvuUpq43O4yKhsLmzu6OwNIW58mIDXibMJAkBb/im6Kf38EimmUo9oCFtBYdx/r
         ELc/gJQUSG0VB5ONcK2psBkqf1zZuTvi9Si01FLfj4E8da1be8XGIKjINLzoDEdSmbtO
         GeS17bHx32jn/ZFqkIbn8zAua8xJIDoC3YtWageqBL1JbvyKxon49CnwpRq+I3ZwRLvZ
         93vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772780510; x=1773385310;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=g/Izo1I7P2lYa0tqmXpdAdhxEzYAi9jVGmrjmB9VLPo=;
        b=P9LURm42n/DcV++MlECZepmitJbfnkNvwRrNLcwxIE97uYPNxuPTStyPwk9eqbSn0T
         DffIwu427AHJbpCe7cihZ9jIkxL4mfH0rfP5eOlt9Di9wo0IYdQVwK+gn0AR3ph6bTHh
         u6mGGn7Zkkw+gK+4KFnA+op7wR9yIHDJDXdBbYl5KbkPPSOE9+nswgfigvgIMaOmYPhZ
         uaFzQzG2+nFr/3qHFdt72wfbcRrlXA1eTr9rizqGtrNy+FZY/wwI0iw7sscNtwnV4wJt
         waaECp9fjMM4x+h1mv8aquj66sYFTv0LK6OIq+6D5Ge+cc6lkpVJF4YKMJWDNHiPKHHk
         ZENw==
X-Forwarded-Encrypted: i=1; AJvYcCUGmzYqeFb0SDkh3bsdoyQBoRNJqyvoJV/NP+o+sa74rBg+bJu5J80TxmCPFqGNNcVFIMQy7oGDUdGjBLWwpt4sbA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7CgfM43zhUPOR7ivlONC5w8Vi3NZ8OpfCGhssIWxXox2VZuFB
	4DiajmUpbDgLoj3k8ACKJURwEWW0DVSQAnsmS1LlX9J/TxkdYYkdeKgd6ctD3WmwgCg=
X-Gm-Gg: ATEYQzwI1qMYk+STle3dXGOMa28/BAcxpVEGj5HNL/XB+schriMWGPVo4RFhkf1aN+n
	kZgGFSz+tE77uZ381O/2Ja/Je9k6Ake7MNYUXKaQB8/UAyP1eJ3ZJkgDrTF4CL1bURhS8gF3RuP
	PqreMSTgnKcWdnU5+KJ1VDp3YihKFgrexC+wu+a4x0fxeodMPJW4qky4Hqf1p4kYwKf6Ufn+LbO
	yuBFJ0Uup4rmqFUWoroESmZ/RQLhq/T6IvPGWbJ4lWAx9oJapRr1kNj4UfuGSMygLG4TKiIMIr5
	WvfieX779xyZ3XM3zFfvG+mBjpdMRqY7E6/ypmeMUe/vW06AhnNKrRHCBc40Di1LuLvu1rU6mU0
	vGAaoSxqy1Iy7ODcksE9So9Yy9EE8CCNi42J4Gor1/zUmzWQD1bk7/6fSVFcd3U8mIMPl6sqkTT
	/iyUGFFv7pcZJn34g0Y84CgDRQBylj
X-Received: by 2002:a05:6000:2c03:b0:439:bd70:610f with SMTP id ffacd0b85a97d-439da890077mr1657657f8f.44.1772780509950;
        Thu, 05 Mar 2026 23:01:49 -0800 (PST)
Received: from draszik.lan ([212.129.78.78])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dae2ba06sm1713784f8f.24.2026.03.05.23.01.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 23:01:49 -0800 (PST)
Message-ID: <198f569078f4a6e3b4e8ad080a94cd336c1e39bf.camel@linaro.org>
Subject: Re: [PATCH v3 07/13] mfd: sec: set DMA coherent mask
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Kaustabh Chakraborty <kauschluss@disroot.org>, Lee Jones
 <lee@kernel.org>,  Pavel Machek <pavel@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,  Conor Dooley
 <conor+dt@kernel.org>, MyungJoo Ham <myungjoo.ham@samsung.com>, Chanwoo
 Choi	 <cw00.choi@samsung.com>, Sebastian Reichel <sre@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Jonathan Corbet	 <corbet@lwn.net>, Shuah
 Khan <skhan@linuxfoundation.org>, Nam Tran	 <trannamatk@gmail.com>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, linux-rtc@vger.kernel.org, 
	linux-doc@vger.kernel.org
Date: Fri, 06 Mar 2026 07:03:10 +0000
In-Reply-To: <20260225-s2mu005-pmic-v3-7-b4afee947603@disroot.org>
References: <20260225-s2mu005-pmic-v3-0-b4afee947603@disroot.org>
	 <20260225-s2mu005-pmic-v3-7-b4afee947603@disroot.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-2+build4 
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Wed, 2026-02-25 at 00:45 +0530, Kaustabh Chakraborty wrote:
> Kernel logs are filled with "DMA mask not set" messages for every
> sub-device. The device does not use DMA for communication, so these
> messages are useless. Disable the coherent DMA mask for the PMIC device,
> which is also propagated to sub-devices.
>=20
> Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
> ---
> =C2=A0drivers/mfd/sec-i2c.c | 3 +++
> =C2=A01 file changed, 3 insertions(+)
>=20
> diff --git a/drivers/mfd/sec-i2c.c b/drivers/mfd/sec-i2c.c
> index d8609886fcc80..9fa1449a4f6eb 100644
> --- a/drivers/mfd/sec-i2c.c
> +++ b/drivers/mfd/sec-i2c.c
> @@ -177,6 +177,9 @@ static int sec_pmic_i2c_probe(struct i2c_client *clie=
nt)
> =C2=A0		return dev_err_probe(&client->dev, PTR_ERR(regmap_pmic),
> =C2=A0				=C2=A0=C2=A0=C2=A0=C2=A0 "regmap init failed\n");
> =C2=A0
> +	client->dev.coherent_dma_mask =3D 0;
> +	client->dev.dma_mask =3D &client->dev.coherent_dma_mask;
> +

This should probably move into sec-common.c as it should apply to all
transports.

Cheers,
A.

