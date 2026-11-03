Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793671668;
	b=ChXSZ610Qu3Xcamjdr8TUm5KaBzhG6IXYZnRY4SIb/THc2JKmactvx/8ZoaYYNYVXZ47
	 MCM+wYXQAjI/8Dqh0ZEmf6D0RuMgwGgIVIXebZ1huF9rqdYdihV2I6NSB0b2zG0eISjsN
	 5ygRPLgInUYKKZzQCe+pc/qHFbz3b8vzS7u18sdy5P30jogT7ofEx057IPuxSIcj77ZlN
	 x/glf4TxmecfTu/GEnJWwk/rQ+OM2q64XFDHRiJalg4f0rwZgeuetwD+vUFRDSY1QQRKU
	 u5VAeHvXZdO42HGv1x0uUdZqpAZrOJpDhGuJ97cZO09GJ7mcRHBpriEJxcUC1Lq953Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793671668;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=mnCMgi1Mjc7rqcgOPGVHBPcSRGGmUVFCpLTaHePthjU=;
	b=rPPy311iWDqRuGRm0U6GdD5Pgjkev18uT89JVEDjxYfNc8mddLiZyDEkA+6PPvOjzk4O
	 rdzQzU2Fjos4XCWiXU9xOKrPQ4nLNQP2VicppHO9ziFbyIUpuZgZH6zqaNZoBIw01WnGW
	 8h2hrFOUYUbg+FHoOqTwEuo9QZeFc8OYvKVFSbiYLPb++AWd2NtEIU7lGjDxKLKWoY1xJ
	 KVbddV/1cIss0sqivjWrhLtopu8IfIrrkvkFsAgtC6YGQF8NfA/EKWKn2zNyjbg+n+1Nt
	 Mz2CPLYdZW67IBI7zngWnQVi8bJsYkzXwNoQ05aoaw7nxI5UVdqRta6jZ3vcQkI8sbQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=aLjZ44wG;
	arc=none smtp.remote-ip=74.125.82.43
Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20F3B606A330
	for <linux-samsung-soc@vger.kernel.org>; Tue,  3 Nov 2026 02:07:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 20F3B606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=aLjZ44wG
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-1a8cc11ac42so3520626c88.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 02 Nov 2026 18:07:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793671667; x=1794276467; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mnCMgi1Mjc7rqcgOPGVHBPcSRGGmUVFCpLTaHePthjU=;
        b=aLjZ44wGmMHqn8e7JX/I8P1V8VARuQh9o/ia1bogyOm6JOCislA1YcxOmIPAwzWMj1
         IStM6BfN0n6A/Mi7nmKeP+I/YEQ4JUI7eoCX12cJ9HDCtLihrgNPebZlvOTpH2BmP9dD
         jawS7ea3vQz4o3ANdgnbSTDQswDHEQkKX/To8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793671667; x=1794276467;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mnCMgi1Mjc7rqcgOPGVHBPcSRGGmUVFCpLTaHePthjU=;
        b=d6y33zt4bplVoU1phGahi8/cuo/KYVXmwZz3obPW8H78+AMmNDpaMR5EPRJxCnVuct
         6gqu2x9T8jTqr08os/5jlDQSaY8i9PLI4tIWfu2sEdjOFFuuaMlmCGVIuRNYa0JWUbZk
         C+9ddMjQQk+PE7w345EJstU4atbUQekZkunGuc7gwFSCA1BMcWHAS2QiYmZ0Z8dV8Kef
         ORSA4w8+wnZEPbeqimD7ERkSXfHAMy1hqrVRrdON8ooi10wdZzFWdNq/0ffo3oHy+LKu
         9DJfvFlw6AGpUoNoUWAmde9n9EdJyHXDMc2yTa18nttgTQLQ6NpYcy4uCJ8ZGKrYIsJp
         CUSg==
X-Forwarded-Encrypted: i=1; AKwUvBwPfRReOraAMn0CWkxL775GPfwMch+8rZ5bWpGzNkSBliywobRZAxzKAZWqffZsF3O/iHFiVUYPcfEo8gmayxYPwg==@vger.kernel.org
X-Gm-Message-State: AFq9FYJlQIvsdxzt8yv01QtGOevqhNmJCD2nynzRM8DJOuW1Mfx+9qNX
	rInlr8fI8ZdbaR5yvEFqg1E2tO9PpHJsil9sCKWospAR6aU36fCVoNu4wm0lU41r1A==
X-Gm-Gg: AYBFou1ma9Kx60rXseAxb6fH4Lfd2upJ2fgg+jR9z89hmieedCHI1S5U5mJohL4R9yJ
	qW9muKePGWtWIPiSvdq98dbL/JLuLs0iphvW5Mvix48HJv0o/xYinpFYDy/RRanffIR4+c5mSvq
	XUf14RE+ttVzsCViswJrLvTWpf5qehmIyibhVYjXAQqSJfUvNRxjGVrS2VOGTjN5nTxTAZpoHPH
	5WPLmvRU6VXWxXke3Q8VN+EWNfS0CyIMFgzYMcqiyQ6wiUKuOMRkiSND6RKqjFRLzDS1+ZowlxD
	P6uDRKNT8YGh7dnw17BnJKfYUYUw2CIopBTQgC5R+p1Y/WHIC2kzdu9TzTEvSUVn97xhOz1wE1H
	4TdIQegnhu+7ftHCeHf9bUxI93QZB3isgNn+cD/eInQWzGP+kgMW474HKOss5Z6od0ievvaR5o4
	gdXgWKzsvZmvSN91/RDBQvbYchmLOPwQh2t8xnox4hVyBv6APpaozCYF+OvoNM9P26H/xak1wW1
	4J/+E7Mz4VbbJPhB0lR1M5g6sCXkIXG1D5dPpn2oMMJsVg++JDCb/Idb1V9xn7fG0P6T3RS43gk
	DyKGUQgSsSEUzkFjZyzP7HzZA/BK0ANSqNBhP+pU9qSTKJh+d2NO2tTyXsRDd45lXac=
X-Received: by 2002:a05:7022:f105:b0:168:e942:4e62 with SMTP id a92af1059eb24-1ac601d2f3amr14793852c88.40.1793671667220;
        Mon, 02 Nov 2026 18:07:47 -0800 (PST)
Received: from localhost ([2a00:79e0:2e7c:8:c57d:c93d:3543:aab5])
        by smtp.gmail.com with UTF8SMTPSA id a92af1059eb24-1b23b847348sm4090158c88.4.2026.11.02.18.07.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 18:07:46 -0800 (PST)
Date: Mon, 2 Nov 2026 18:07:44 -0800
From: Brian Norris <briannorris@chromium.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Thomas Gleixner <tglx@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Peter Griffin <peter.griffin@linaro.org>,
	devicetree@vger.kernel.org,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	linux-samsung-soc@vger.kernel.org, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org, Radu Rendec <radu@rendec.net>,
	linux-arm-kernel@lists.infradead.org,
	Mariano Marciello <mmarciello@google.com>,
	Douglas Anderson <dianders@chromium.org>, linux-clk@vger.kernel.org,
	Jakub =?utf-8?B?R8WCb3dhY2tp?= <jglow@google.com>
Subject: Re: [PATCH 3/9] soc: google: Add CPM over MailBox Array driver
Message-ID: <aulB8F6hc1eDvyfj@google.com>
References: <20261026214359.3122870-1-briannorris@chromium.org>
 <20261026144346.3.I7bc547c83b7bf677a62670099f481a91ac737073@changeid>
 <20261028-literate-pony-of-valor-3209fb@quoll>
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Post: <mailto:linux-samsung-soc@vger.kernel.org>
List-Help: <mailto:linux-samsung-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-samsung-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261028-literate-pony-of-valor-3209fb@quoll>

On Wed, Oct 28, 2026 at 02:27:05PM +0100, Krzysztof Kozlowski wrote:
> On Mon, Oct 26, 2026 at 02:43:41PM -0700, Brian Norris wrote:
> > --- /dev/null
> > +++ b/drivers/soc/google/Kconfig
> > @@ -0,0 +1,13 @@
> > +# SPDX-License-Identifier: GPL-2.0-only
> > +
> > +config GOOGLE_CPM_MBA
> > +	tristate "Google Tensor CPM MailBox Array Interface"
> > +	depends on ARCH_GOOGLE || COMPILE_TEST
> > +	depends on MAILBOX
> 
> Can it be compile tested without mailbox?

I don't think so. mbox_request_channel() and friends do not have stub
implementations for the non-CONFIG_MAILBOX case.

Brian
