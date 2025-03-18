Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01A5C1BCA0E
	for <linux-samsung-soc@vger.kernel.org>; Tue, 18 Mar 2025 20:48:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742330896; cv=none; b=NlDjDEFbPbgU5snEOYulv/hDsk1eDeha02sCwo/LKaBUKhV1NDBE29rV5AWKQr0SIKecyRLynJh6iWEZ1SdUJ7wmknw4PuQHj6RUqBDDEGZi+f8J+LNeWUfDxBYPWD2L88SaeKaD/H2/ir4HE/zSVpEicsFZJkD/Z0BvtE8Ktes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742330896; c=relaxed/simple;
	bh=SXreAV2ANUNLXOCGHNmgwnuxR6Y0ADaUa6Mv3KQ5Clk=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=SYyFtjfGI0Am4CVsdgcad8FI/AgTWw4iDxaCC5bU14BsiPfFOEvh9IXZPthQRrGp4fJpXngIpODiSo8hhI0ht8E0x1/RCjpGzbnBw2TBSLvS9TT+5CSVddL3d/140akgE+FROOdGSDjVwsv4RUfoAr7Ss8MXSXPkd1636tZamE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bdnpyz1O; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bdnpyz1O"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3912e96c8e8so3972829f8f.2
        for <linux-samsung-soc@vger.kernel.org>; Tue, 18 Mar 2025 13:48:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742330893; x=1742935693; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=SXreAV2ANUNLXOCGHNmgwnuxR6Y0ADaUa6Mv3KQ5Clk=;
        b=bdnpyz1OsdfqlnPx0wd7CiWcp42YqNS06leuc+oXWbiLzbpcjynZqr3aJ2BUNXMTo/
         XiOwFtp1jdhoFyRJ2YYCtSaXFTEoouo08D2QOskBHnLszjP16NHmkDuYEMKpYnpn6Lkx
         mHvqJz0iD5U0L2pY0UgQhg9pTuh6b7srmQ6Lp5/DPflSLoJO/Ubj6EQB5hX7ezZEuKry
         Pkgd4orEiuc5mJEhzPxVNH6Eo/EHs/nI+8nOcnvHtI264FQ40afTPRC4MyAgoJt6Obbm
         hgwmcFstr3BLlWoeMy4+0maLydIeQRJ/5qwEcgBchBDZqSCRrAUfM1pzmtUvWaY4iEXx
         vqtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742330893; x=1742935693;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SXreAV2ANUNLXOCGHNmgwnuxR6Y0ADaUa6Mv3KQ5Clk=;
        b=X6eufkFry3ya5bCPyvgUhCRYd6NDeFy+ZNh1fR0rC+H3yq/3UYT2MyQW70u2gdRlZA
         CXft5zd3Zl4C6r88BkIIM29mWED5CHZTLiuiJYFBEA7G8Q84/m9SlA2omwNDB+R+KVu6
         /cKWB9amum36KhmbMTvrTvM+VPb00mlSVCHslUOu8urRWWlleI0SQ915j52BAIIoP0gW
         oyJMtoOQSfmrS1XRNm45rb21gLidhsEWKGTAmF38WXR+jx3dGxqF+2qaRzZ7qjQs5vmk
         FzXuiXOcvGLDcVVJzKOFFMKGCwYpJSmB0/u+i4XT+5D+dxoSMNICf5lpzdQ9gVuK+g8B
         uf7Q==
X-Forwarded-Encrypted: i=1; AJvYcCXyH2U+bUF+0BBy8tuimYGtoVLr4S9CFBpFzHOafC/Wfpse7kSbNbRR8+1tZ+SsG4DAHp7Bk/c68x1zt2YNRRG0MA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyv7gTNqFepA8eo5JariaqNVIZbswe7tLymnjP7WQdw1kHoPUfk
	2AToG3gpdLHiB4YYqgl8DYYqymTYpCU8mkTgG1BTV4MkvGRJHMhPdKsyVOxOVzg=
X-Gm-Gg: ASbGncusc9v3dCaJsUSf6IPnlWUlgmBBH1lMkdhhfTIAvrPfUxsS0JUrnbpQgu9JGdy
	xZa1aBinjgmy+Gi6E/6AiUZR77oiECB9QZu7VOyKnIeTy3eBPjonMeuzD9RCQ2HsxFqRo+ZRYXW
	fdzVBn8hw3VuAxaVsmtMVF49z8FO68MBSRosMwYyBWyvLMLVdxqwjXVQgOPLvwynugmhi46vyRA
	8ilFlcm4PXgX3fX5PrZjzjMkphMiqFVV0aj9HQAtSUnh4dCRGmc1Jh0eUpQ/Cthlm0640rHIFhS
	bCtwMrQu2ApAT2yyVnxWOCUbVUjyigNIANNQ1P7ktK0JDhk4
X-Google-Smtp-Source: AGHT+IGFPGJRCtLFFy23VSE/m+QckBBrVhU9c3ZgD9sj7uRUJ9l394Djfqcd3htbbBE+Wcpd5jsTmg==
X-Received: by 2002:a05:6000:1448:b0:38f:3c01:fb1f with SMTP id ffacd0b85a97d-399739cb086mr153384f8f.30.1742330893184;
        Tue, 18 Mar 2025 13:48:13 -0700 (PDT)
Received: from draszik.lan ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d1fe294b5sm144621675e9.21.2025.03.18.13.48.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Mar 2025 13:48:12 -0700 (PDT)
Message-ID: <632522cbc66e456f3b12e884c6c140b38e101aa6.camel@linaro.org>
Subject: Re: [PATCH 2/3] firmware: exynos-acpm: silence EPROBE_DEFER error
 on boot
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, Krzysztof Kozlowski
	 <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, Will McVicker
	 <willmcvicker@google.com>, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Krzysztof Kozlowski
	 <krzysztof.kozlowski@linaro.org>
Date: Tue, 18 Mar 2025 20:48:11 +0000
In-Reply-To: <d2e162cd-b12b-47e2-9190-2ecce3489b9c@linaro.org>
References: <20250314-acpm-fixes-v1-0-ab03ca8e723f@linaro.org>
	 <20250314-acpm-fixes-v1-2-ab03ca8e723f@linaro.org>
	 <638cf070-9fd1-416e-8172-75f189ab0dfe@linaro.org>
	 <d2e162cd-b12b-47e2-9190-2ecce3489b9c@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.53.2-1 
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Mon, 2025-03-17 at 10:48 +0000, Tudor Ambarus wrote:
>=20
>=20
> On 3/17/25 10:26 AM, Tudor Ambarus wrote:
> >=20
> >=20
> > On 3/14/25 4:40 PM, Andr=C3=A9 Draszik wrote:
> > > This driver emits error messages when client drivers are trying to ge=
t
> > > an interface handle to this driver here before this driver has
> > > completed _probe().
> > >=20
> > > Given this driver returns -EPROBE_DEFER in that case, this is not an
> > > error and shouldn't be emitted to the log, so just remove them.
> > >=20
> > > Fixes: a88927b534ba ("firmware: add Exynos ACPM protocol driver")
> > > Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> >=20
> > Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>
>=20
> I see you kept the error message though for of_find_device_by_node()
> failure. You either get rid of that too, or maybe transform all to dev_db=
g?

Thanks Tudor. Seems I missed that, I'll remove it, too.


Cheers,
A.
