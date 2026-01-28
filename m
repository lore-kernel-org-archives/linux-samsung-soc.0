Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B85E52FF178
	for <linux-samsung-soc@vger.kernel.org>; Wed, 28 Jan 2026 19:57:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769630236; cv=none; b=Oeb3hEbge4xudn5OyWG9y3r3bADgbTkBEJz56/I9svvwcY+HjEOXdfzeHmdSCd6YtAFGAKjGJ9rEAqFip3AczViSb0hvxnYYP/6TDXpoe6sx/pof/TPXrbMo9klGQD6yrc6ItgHKr2QPzsi+hcvCGMvmcagaMr+ahar4YoWvRVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769630236; c=relaxed/simple;
	bh=QWXVTrWWSL0uRDUDAgPurGbnp5Ffp2t05SD0ZhbJZ+8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=bug+CGyvzqFh0HhFIUtz8auYT28odr2Sk5mLIxtTEasM+6qB9zRS2bYkAlAgOsVEhgRcuRU4iTNSk420NeZvduUIrEb+hNb5ksYRKG8qO/K5SsMLmomi+axUrdtCCal3BPwLFvQM4PU6YpD8XQYED+oZc+W1xTM8SgizZN4uPhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=q+VYJcXV; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="q+VYJcXV"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-42fb5810d39so153586f8f.2
        for <linux-samsung-soc@vger.kernel.org>; Wed, 28 Jan 2026 11:57:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769630233; x=1770235033; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=QWXVTrWWSL0uRDUDAgPurGbnp5Ffp2t05SD0ZhbJZ+8=;
        b=q+VYJcXVME3MguFklPvKh++C+3vxtNrKLyLmby8ZgvXvPP4hopbxzeC3IPA2qRQXAs
         aqZZyp+3Qvm4MB22270lZtsF4aLkZBYUbCEVvNTk6T3hocgH1rjxtyBfpCOCssCKIZ5S
         J4iocL+WD9aSmPnT9XbXf6RvVQ2LUv/iDxp+JdPZJdeqTayN97oa0Fpg+hjDRy3MX6+5
         YU3aOo5HfMPlGjSpr3heFI5dQvDY9Q710oEYD4AfFjfmLxm/SFgGkd+laxOZIXMfYWCZ
         oHd1v2fbdlvQ398iUobuKr/CmTeZq2nelABk1XHDbZNsgeC1oOaTBMoL0TQeyurFsu3P
         7j1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769630233; x=1770235033;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QWXVTrWWSL0uRDUDAgPurGbnp5Ffp2t05SD0ZhbJZ+8=;
        b=FsV0LSWjLWhUgLb7RB9ktNfHnAmd6BIgn6ZLKSPvIuHySiqkn266ps+JRhhLjis5lO
         IvYWL7oWleNo/E/skp/UbBiLysuruo0s22ccTV4hSc7rYsidDdPV99q/61jMxVKbfXy/
         0n9GT6P0dKUThz8GJ2712M7d0yBHdv2ctn0y5I2h277q7kWNnmqv9YioIibGJWskcgsf
         /n/y/P2Mx6GoYitn5BqbNaFVw0j3ss5REHLYKLZyPt6e8Sxhw2rYH0Plq2w7ErkDzd3K
         HMOcDdWVwMiQeblmQa17HKUuQgOhYgCIiPujcuCufiSnbL02nWRv6lK0ntucq43y+/Fg
         wLYA==
X-Forwarded-Encrypted: i=1; AJvYcCWpT4NJrN9hBo/o8tlF0/tEsFznVwWKurG92DksHfb2mGzEAHI/nvKSVBbRAWUAY+OZqvyUYbyd3TqLwM2nmKp1Iw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxJxfaBNVo/CGc+nSOjKjTU88co+k29nPk3KcFbOOldnWReVzef
	IGt2hSZ3jfDmAh1TZwrlkZdKjRsGmWrYPfFwDlN8plfZ+NmMPV7kTElxsAR7Y7iH5nQ=
X-Gm-Gg: AZuq6aKyrpB9INxPfLzFUeJwJauR54AyEixBdRPihPyHzGSL3euEoELwYXU11G4Kfwv
	2pgtIVnHp1ta3wk1DpCmqM1UCmFW3L1jQ6RjRHgyqCzbFgiEa4Fg2syPGbtWiKd4/p/abVZt2A8
	F6rZthYytFp16saq9D3uYlIHg5btxtktu6z87K9EcSPjpNbXSYl1f5dXGufmgyhtPkcZ7XcRQr6
	H8xRO8U0akM2WqItW7ZAJk227P3cCb7H7WDSUKdG4vqX6xut2+0cIyLD/ETJ65xy4nZhTO7eTVy
	oCxW34bRM6uzFtKcwRAgdlKvTjtC6xrXovRN2904SLXAubiYV88ZDI9156JhhRxKukoNaE8zIe5
	psH/BPTef7fOrEUrugzt9zNJWv1QdP+V3GcWfS1HOPfqQFD8Gz8ppME9aHasfpqciYUq1Vvcunt
	ehwqflpv2PjEJ8MgKC8N2dvbI=
X-Received: by 2002:a05:600c:6995:b0:477:7af8:c8ad with SMTP id 5b1f17b1804b1-48069c92c03mr92248975e9.31.1769630233039;
        Wed, 28 Jan 2026 11:57:13 -0800 (PST)
Received: from [192.168.235.30] ([80.233.74.245])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48066c40e04sm149805675e9.13.2026.01.28.11.57.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 11:57:12 -0800 (PST)
Message-ID: <f13cf27da2d1d7d8a54448391c16a8eae349e8a5.camel@linaro.org>
Subject: Re: [PATCH next] phy: google: fix build dependency for Google
 Tensor USB PHY
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Roy Luo <royluo@google.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>,  Peter Griffin <peter.griffin@linaro.org>,
 Tudor Ambarus <tudor.ambarus@linaro.org>, Joy Chakraborty	
 <joychakr@google.com>, Naveen Kumar <mnkumar@google.com>, 
	linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 kernel test robot	 <lkp@intel.com>
Date: Wed, 28 Jan 2026 19:57:09 +0000
In-Reply-To: <CA+zupgztBHTJwNPEOfXjdw9TpcpiVGO=hdFBYk3PUo-0Vf95mg@mail.gmail.com>
References: <20260121-next-v1-1-c18068b091b9@google.com>
	 <7c78f9da40022e7bbf850ae8989c617bdc30cc95.camel@linaro.org>
	 <CA+zupgw5H5rumo+DxaTfA_=bcvjbBOivm6R+Pw31jgE-sMyEtw@mail.gmail.com>
	 <f956ccd3f5f694de7a634819da3f790a8dce132b.camel@linaro.org>
	 <CA+zupgwEWM4c9yK1f-Y_Cv5gk=0zYNuUb3kZyZ6O3FDRbPPvKw@mail.gmail.com>
	 <eebefae5273bccce2d0fcd97afe3ea28bedf27cd.camel@linaro.org>
	 <CA+zupgztBHTJwNPEOfXjdw9TpcpiVGO=hdFBYk3PUo-0Vf95mg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-8 
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Roy,

On Mon, 2026-01-26 at 18:34 -0800, Roy Luo wrote:
> the wrong example. Let's look at this build error scenario with
> "depends on TYPEC || COMPILE_TEST":
> Given COMPILE_TEST=3Dy and CONFIG_TYPEC=3Dm, the
> "depends on" would be evaluated as max(y,m) =3D y.
> Hence, CONFIG_PHY_GOOGLE_USB is allowed to be
> set to y, m or n. When it's set to y, the exact build error
> would be introduced. I also tested this locally and saw
> the build error.

Thanks for trying Roy. In that case, it should be written as

depends on TYPEC || (TYPEC=3Dn && COMPILE_TEST)


Cheers,
Andre'
