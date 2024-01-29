Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E88B03F9C2
	for <linux-samsung-soc@vger.kernel.org>; Mon, 29 Jan 2024 17:36:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706549762; cv=none; b=RwbXex6WDGtdYh1jiHHEWkM1r7UGdO/Lj1Z/HvXivgtRePpfMyFTkoI/1mMQlVY0MMgy3YzeGoKD+tTLkh2I1chBNCJCUklynt6PlO5z3i//RHVxEhzJnll+lacJOrXLhNhFhmR/Xyhqb0cDK3J0BXaJFgMD2W9o7HTWqGboTmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706549762; c=relaxed/simple;
	bh=KBb4Wu4uv3yY2RDWyPQM+7eyNmckxT+I1RVfohNM36s=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=T4I8JGD1oMhEs4AlbBLSRvTWPrptwYAFsaow3BLHKkROMiO4gI88Y7cwAMtpWLPm4y1r00VTty4wdsvjsoritLCeTTaewzQrPy7GcCh7FYZYaBsS1rBOAttcZDRjfz6fGj0bDKiOLp0b8sonntaccxG6pw/L7pkIqL3d3pj7zEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zN23AKxh; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zN23AKxh"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-40e76626170so36439555e9.2
        for <linux-samsung-soc@vger.kernel.org>; Mon, 29 Jan 2024 09:36:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706549759; x=1707154559; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=KBb4Wu4uv3yY2RDWyPQM+7eyNmckxT+I1RVfohNM36s=;
        b=zN23AKxhXAWXgCJ+XXDztOmDtUmGfFULwJ7B1ch03d9LbnoZg4+DQHdeMNB1rsHHel
         G27fJMRva+oZTYZcnb/9G0R3DwUrDOKAg9IZz1y32qlDBN/3k+QgBH0Ee1+eKNI85/62
         vq+66aF7eeWqdjrIyrH2f01eWr6KcwjNbU2bPHoaaN20AOSEyM/CRYTosyG4deDTZcmX
         k91NGEw9uPLvto/8Zli6gcowQygR8QaACcx68fSkRpeIPmJ3I/HzrptA8SFUIMutyO9w
         65GgHJip3/7YPdXwpZptdTDFMEj/UsPvwiJJfrEeJ3uw1WXr38CksqHL0kQMezkT06JE
         ujfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706549759; x=1707154559;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KBb4Wu4uv3yY2RDWyPQM+7eyNmckxT+I1RVfohNM36s=;
        b=gklPbxKnhmneCaM6A+1Ddy+XOXsLjuCJh8mU6EPlWktz0Lh0g+AWcSf1l3Fabfxh0p
         lrufNLyFsvNQRBTI2/oP1zKKNMi7HcORIk6f+JMah4bGAR2WQntUEluYbwIqcSYzc9ss
         4t5RIdG+jEJoZn43d38FdrM2FawcA4WyOqwJgjeIHKf0AzXCa1tgjI3Ush6WFNNfDNMW
         rBs6dY3OXKrRbOb8gO05tgEACBRbCs3U2V4tFePQgWsLg4B8Dzr32hX71LNZfe33IGop
         NFU7xvP4aY9ciGrgmRJapjMaPaSP0w/60mdU4luJuXWZzjQ31I/FxQT7TtXJ+n4AbvzN
         3Ikg==
X-Gm-Message-State: AOJu0YzSj6uwa5mkQVsAw6ro6kcr0ZXZa+7Tk1oA+BtWlhwEkSj/qicU
	0dzOxyICnMf5OxqwdjCeqinuuQVnSaHCQt0Skp/WR8fTxs8zi/DxmZnDhCtdraQ=
X-Google-Smtp-Source: AGHT+IFq6asyWX/6k0tC+GIYTq3NMXrvDHsnmT8tdMEfK6muws8qzqgiJ6cVnSr5gam9RYDpylQvTA==
X-Received: by 2002:a05:600c:45c9:b0:40e:b6c6:89ee with SMTP id s9-20020a05600c45c900b0040eb6c689eemr5846240wmo.38.1706549759269;
        Mon, 29 Jan 2024 09:35:59 -0800 (PST)
Received: from draszik.lan ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id g8-20020a05600c310800b0040e703ad630sm14605062wmo.22.2024.01.29.09.35.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jan 2024 09:35:58 -0800 (PST)
Message-ID: <c9801d85c941bf1fd5256c174ee07e12799fb25c.camel@linaro.org>
Subject: Re: [PATCH 6/9] arm64: dts: exynos: gs101: enable i2c bus 12 on
 gs101-oriole
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Sam Protsenko <semen.protsenko@linaro.org>
Cc: peter.griffin@linaro.org, mturquette@baylibre.com, sboyd@kernel.org, 
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
  linux-kernel@vger.kernel.org, kernel-team@android.com,
 tudor.ambarus@linaro.org,  willmcvicker@google.com,
 alim.akhtar@samsung.com, s.nawrocki@samsung.com,  tomasz.figa@gmail.com,
 cw00.choi@samsung.com,  linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org,  linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org
Date: Mon, 29 Jan 2024 17:35:57 +0000
In-Reply-To: <CAPLW+4nk7hStr=g4vt+iztOr6bqbtJFVDLZ37BfFh4POazgjJA@mail.gmail.com>
References: <20240127001926.495769-1-andre.draszik@linaro.org>
	 <20240127001926.495769-7-andre.draszik@linaro.org>
	 <CAPLW+4m4G+-zFLGr6Bp-73-mERCofxDiD7F=2fd_Wq+18iTs9g@mail.gmail.com>
	 <0d3236e90604e82a609d205c6fbb56fd882ecfbb.camel@linaro.org>
	 <CAPLW+4nk7hStr=g4vt+iztOr6bqbtJFVDLZ37BfFh4POazgjJA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.1-1 
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Mon, 2024-01-29 at 10:34 -0600, Sam Protsenko wrote:
> Then can you please add the corresponding TODO comment on top of the
> code you added in this patch? And perhaps also describe which devices
> you have on the bus in commit message.

Done.

Cheers,
Andre'

