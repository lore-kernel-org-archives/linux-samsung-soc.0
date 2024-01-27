Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85DFD8F59
	for <linux-samsung-soc@vger.kernel.org>; Sat, 27 Jan 2024 01:38:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706319486; cv=none; b=GXtWhbA0AmwSJVOiI2uGFKZgCnruiullIzF52R8LGXL4U3PQOwgAmgAl0AQaxUQxRk9KpeKc8ilC7y73fGdTiBMYISTe8DbDjtEXk2lKPuGrRqe5SYNcMY1NpXFqS7/qZCSQjaZiJHIiw3SUnyZGd3nyGNEEt3C6bn4bWplh23g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706319486; c=relaxed/simple;
	bh=eRJi6eaKhotdFeyDU4wt6lYqIfWEYqa9/NQ3q4nJKtA=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Ivt/RvW0/hpufj3kGerKOaCJa5AAQ9gDCNGwZIEwgJqo4JHg2+NWJYVhKWJGl6q0i7D7a/jkL+8j3TH0YnYQEu7Rr4M+szczd9pL+051DlWMhGHXW9zERrxQNdUydXzOX8BrgvNPs0xFaQY//StxCENdJZ2nFofElKve11YSZn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NVbUYeom; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NVbUYeom"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-40e9ef9853bso14088715e9.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 26 Jan 2024 17:38:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706319483; x=1706924283; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=NGjOHvA3bmpeR3PPxd2MGAuCofR2CKZYXxkr7q0R5hY=;
        b=NVbUYeomaTOLZxkRqFu9kYZZIvoFUXJDSz0J6wIc2mulRKhpDbKXTSmsQuAp+V3aPp
         btrS7iqeZwG5toTnnvV136MRP/87egdtuG0zxGdlETudGjKFHhulIUxpDi5qKodJ5Awh
         ubmwG5W7Fu3ivUt0hHk9haayMElrDa+ytNrpYXJxUs0SdSensgOOP2C9WHNoAxv5ZSof
         jHpW5YL93p3LwyxbIOlkJ/gBuog/cP17xUeHtlxUHP5aBnYf3vSIwVEvRHxMsylJba5q
         mlvrtPI4xcZl3f4kotzxnciLqNbpki/YpB5WkrQxkcJogCc63+BO6kq3VRTQKCTAr2jI
         jHwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706319483; x=1706924283;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NGjOHvA3bmpeR3PPxd2MGAuCofR2CKZYXxkr7q0R5hY=;
        b=XJk4aQumEDYrQBIq7nonT3KpohzoX5MZ+so0X62/kr1iU9JB5hfV+DcGnFOdohYUY7
         /aMDr1+0OP/tOK0QBDw943sjKLWVS7ZMhqfPIcuwmR2sWWLJNqEdfsbXrune6cbgFtq9
         Sa5XJDo8eZ3BPcFdB2keFXica36LNNFlYJ/kr8HB6BgP2g3WRa3j5dtyu7U/jy2amUvz
         rUhAOQMvAJmXNQydZdLgfo7wiv1aGYU+eHWJNecXG4YKOLiPxvBCIHb8jXRFegK3U6lI
         hl15Gv5nKl4VjXQ5GqRQFh6vWz49NCdEJSpnP2EyL5SIUh+fb0YlsuupAtDT1UL4zgr9
         FzFQ==
X-Gm-Message-State: AOJu0YxxYYQnHbw5DAwNS7ikTZiw0geA9c7mRa3gKVKIRdJpFUUV3gLD
	bkwtzDBMMvyhT5fBTUCpnERTRbN6IX2667kf2JcZnuUdm+XUMKok+xt5p57gX3w=
X-Google-Smtp-Source: AGHT+IHuk1WdhFM4MdG5wZNPvkPFcjQbQfgwzamMmmvZplCwS8KGzf+nkYuFlGVbtjwulcQRoiYQLw==
X-Received: by 2002:a05:600c:5697:b0:40e:d342:88f2 with SMTP id jt23-20020a05600c569700b0040ed34288f2mr393972wmb.51.1706319482794;
        Fri, 26 Jan 2024 17:38:02 -0800 (PST)
Received: from [10.1.1.109] ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id n10-20020a056000170a00b0033940bc04fesm2384558wrc.16.2024.01.26.17.38.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jan 2024 17:38:02 -0800 (PST)
Message-ID: <2089a7cff2eee7213353b0b933815390dc708464.camel@linaro.org>
Subject: Re: [PATCH 5/5] clk: samsung: gs101: don't mark non-essential
 clocks as critical
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: peter.griffin@linaro.org, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org
Cc: linux-kernel@vger.kernel.org, kernel-team@android.com, 
 tudor.ambarus@linaro.org, willmcvicker@google.com,
 semen.protsenko@linaro.org,  alim.akhtar@samsung.com,
 s.nawrocki@samsung.com, tomasz.figa@gmail.com,  cw00.choi@samsung.com,
 mturquette@baylibre.com, sboyd@kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org
Date: Sat, 27 Jan 2024 01:38:01 +0000
In-Reply-To: <20240127003607.501086-6-andre.draszik@linaro.org>
References: <20240127003607.501086-1-andre.draszik@linaro.org>
	 <20240127003607.501086-6-andre.draszik@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.1-1 
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Sat, 2024-01-27 at 00:35 +0000, Andr=C3=A9 Draszik wrote:
> The peric0_top1_ipclk_0 and peric0_top1_pclk_0 are the clocks going to
> peric0/uart_usi, with pclk being the bus clock. Without pclk running,
> any bus access will hang.
> Unfortunately, in commit d97b6c902a40 ("arm64: dts: exynos: gs101:
> update USI UART to use peric0 clocks") the gs101 DT ended up specifying
> an incorrect pclkk in the respective node and instead the two clocks
               ^^^^^

'pclk', I'll send a v2 after collecting any other potential feedback.

Cheers,
Andre'

