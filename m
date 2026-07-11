Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DDC225B0B8
	for <linux-samsung-soc@vger.kernel.org>; Sat, 11 Jul 2026 04:49:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783745379; cv=none; b=FpnA1uhBSh72U0EvbAiuuEXEGbwjfiMgIPTcYv2meHG/W0BvLdr3/2471JFSS3RDb0oGyFPfBVPW9ilce30L6BSaJGZdCJroCNXDD34k3BsppnIyf8Bq5HA5HoKxSplS8a7fLPnD6pTNHgHmjX/h/tOE1B6fhN2LJnd5g/3/CIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783745379; c=relaxed/simple;
	bh=S7g5HdrobVHgSI3y7yFITx6ZdgODEA0xXX0TnH33v6w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SKo/vA+6WTstE+vnzUghLcHTXcTXYPCwwhPESQfaHLcPen3oPqXkgxENGG2qu+1Vmncv1lT3rOYUltgW7PEJBuH627upHnWElzaiC1hkE6xPhMPEeemXh3hytACfwoIFsIoLiCH2BPuBLV2KZb53nvnOG3DtHtv7KcIsompaZ6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WrUunfIs; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WrUunfIs"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2cc61541f8cso33046945ad.0
        for <linux-samsung-soc@vger.kernel.org>; Fri, 10 Jul 2026 21:49:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783745377; x=1784350177; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qesMdHKmyxw3NJ4a67qnIHpz73OEBeBHn6uWkzO1uyM=;
        b=WrUunfIsErXFnQOhWCnUXZ7TKyOqI8TaNmxv25pZRtai9YvHHJ6dlC29g3qtOv+vRE
         xYGb5fhsMMmG+7vkZUZWHTJrvL8kinbikFiRoVPLvRke4dZUuCv6kQy49n5hwBvqeAqk
         xhvFXMk5+PlucjVTUu/1Pu+FLP1RNmVxnd7flmwuS/1jWdtuSE6HgVyff+UYnMkYZU+i
         WKs/DPjTZ9fvAifwp0iUhJX/P1HqglKBU2GvRdGjc3RYGJV1ljbf3KUJ6sjsWI8eM1aC
         hyGezqIdlIEcKo4FcZkkfuig2XwLgIQsIOl/Jt/fuqNsfwuLe67ocz3RFcljSVK89Ybx
         DyZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783745377; x=1784350177;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qesMdHKmyxw3NJ4a67qnIHpz73OEBeBHn6uWkzO1uyM=;
        b=L7Oo8RAVjViYRXD/K/6GRP07LRHbkRCkd8PF3Khg2hzWyY5F8c1ImTD8KhOHOKJ3iU
         SJ8uvIgMjh1w5hbi2EypKnLiZF9LsgSZn0IrUrTSsrps0Ap6yw41M0KUJAGmMtXnphBe
         HMc3xCHzTujTIUtTiF39byaQXMR1Gew/weIzDHTYU8H3YdHegzJg+f/KH1erNmUuct69
         XmR/mLgwywnw0ZNh43sGaImBSSRGCEsmpZYmuR4D0BMnRk3dv2qSlBrOiZwydNTF0uiG
         U3bDmaStrrGnhiS5dQEnPh0S5GciFbGewfelk1pk3WaTg0XMNBcmaCfZVASHfr1zhFWH
         qG0g==
X-Forwarded-Encrypted: i=1; AHgh+RpR2+3guDOSM/h+oZ8Y2i5dM6bEutaVgDvg/Pc5Y/ssTTt95bCBULQK2e3DtfWbaS97s/h8/UN9yTVDe1XiVhnTww==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxh8XnaBt2U/mCpPHKkE+8Qw48er67yVHcy7NTXozn/nZzGPdD/
	yEWasu+DD1EeErnYfNqnPXG2wR31ZVCH6bqIWaQRxcZEJo2MLhfTuUU1
X-Gm-Gg: AfdE7ck5K1d6+NeAfo0Ve5EpptKrJ80JODru/HJV0LjOoFF+fhQUwnSz92f0LFn/qWd
	6LxmUE2apnpRtMg5B1jPNFulGUtq8Y7TM321YfqlC3XKa/FOuEMaE9OVkQA2Zk7NYkmw9JAguSp
	mpsGC9O+mqY6UQhgkW8PBYx9wNF+m568AbNGiFuvy2L4Z1fS/46lmPPHliPglgaQ56kwl0BY+N/
	Jxrcxe/SAOK87NVO0zAN4cv9702ZoI7vTjIoqQMQD1FHiWU0ld1kKT8TntPfbE5wxjEtZ30L3b1
	vYLWRyTnNq8zzs+ic0xGXpJbaj9G3YapESdPIk5a9w7PMw26QfroB/re5bb5ZyUu8MKgxIHFb+3
	BoU0xwilhFqMgklmGPIXtc3YASHt36twEsfelVhm9+Uj4CGzO8Fyz+PmAIe1T1Fll5kdPD4D1P8
	Ss0idEgQ6dvrVYPiz8gyBjykjgT/CELKY6oJM474ytzDAM1usxbXv9ew==
X-Received: by 2002:a05:6a20:734f:b0:3bf:6763:f0d0 with SMTP id adf61e73a8af0-3c0f085657fmr7458822637.4.1783745377459;
        Fri, 10 Jul 2026 21:49:37 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:d42f:71b6:335c:aceb])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-311a6115e61sm25970082eec.22.2026.07.10.21.49.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 21:49:36 -0700 (PDT)
Date: Fri, 10 Jul 2026 21:49:31 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Arnd Bergmann <arnd@kernel.org>
Cc: linux-gpio@vger.kernel.org, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Andrew Lunn <andrew@lunn.ch>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Gregory Clement <gregory.clement@bootlin.com>, 
	Frank Li <Frank.Li@nxp.com>, Robert Jarzmik <robert.jarzmik@free.fr>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Greg Ungerer <gerg@linux-m68k.org>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Hauke Mehrtens <hauke@hauke-m.de>, 
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>, Yoshinori Sato <ysato@users.sourceforge.jp>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Dominik Brodowski <linux@dominikbrodowski.net>, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, patches@opensource.cirrus.com, linux-m68k@lists.linux-m68k.org, 
	linux-mips@vger.kernel.org, linux-sh@vger.kernel.org, linux-input@vger.kernel.org, 
	linux-sunxi@lists.linux.dev, linux-phy@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-sound@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH v2 09/10] Input: matrix_keyboard - replace linux/gpio.h
 inclusion
Message-ID: <alHLK4O77khiKwtW@google.com>
References: <20260710211954.1373336-1-arnd@kernel.org>
 <20260710211954.1373336-10-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260710211954.1373336-10-arnd@kernel.org>

On Fri, Jul 10, 2026 at 11:19:54PM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> linux/gpio.h is going away, so remove that since the driver already
> includes linux/gpio/consumer.h.
> 
> Acked-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Adjusted the subject (s/replace/remove) and applied, thank you.

Thanks.

-- 
Dmitry
