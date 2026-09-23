Received: from mout-y-209.mailbox.org (mout-y-209.mailbox.org [91.198.250.237])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A24A33D1AB9;
	Thu, 24 Sep 2026 08:31:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.198.250.237
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790238704; cv=none; b=OY/PA2zElso+OjVT5+r6NzCdcyR8mR7w1UiMH1bZicQx0LglbQyADYyhCyOY+pMWE4vztS0IlUqidcAvlu5vM2FimsTeI6OKilRdzCsADBCJrV4ELfXkHHfgBs3l21AtdzUzLNlAqMzsAvdBm6nRRApiKBrO6P7h4hnfCvJjzos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790238704; c=relaxed/simple;
	bh=2q/WlDjU9Q7ZIjVz14cix63PZ+BOmqngGSQfJ+4PJBk=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=AHl7WsrrdPiZ8dbJKPw4zFlHHgDU+p/7FqjlSjpZN2Mq1nGqWqlyfTuAlbjZamUDjUq1/+Dr0eR633UFLXT5fHC7VnZ9BfCd4QNyHzqF0acegQBofOgjUs75QypTlGxxsH5UIDuI4ODDPTgWb3jaOhJWrqwvVvF7acSxiMWV3ck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chimac.ro; spf=pass smtp.mailfrom=chimac.ro; dkim=pass (2048-bit key) header.d=chimac.ro header.i=@chimac.ro header.b=PVZlWJk+; arc=none smtp.client-ip=91.198.250.237
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chimac.ro
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chimac.ro
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=chimac.ro header.i=@chimac.ro header.b="PVZlWJk+"
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-y-209.mailbox.org (Postfix) with ESMTPS id 4hqhrM1vZrz7vBk;
	Wed, 23 Sep 2026 18:14:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chimac.ro; s=MBO0001;
	t=1790180099;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ja10dpay0PFbmloo3P4uBr52vlFLWwA7lf07LoI1zL0=;
	b=PVZlWJk+fZggLM32PaMTY84s7k2CUe8rduhWyYm4jR5cZouzL/3StaNPCV0OKs54bcurVM
	C2SFhh+SLxxLgOwl7DwBdv0YIm2KR++LJ74wyTiECVXUa2OTX6UK2Xr1FdJvQkt5N4MqAs
	fyD3p00myaKOn5IJn+7ulSDlut8sjB4nXLaPWpfh84HYi3cD94oI3NosjEdLCXY6GYK8ek
	Oyns30ekLT0b77TxTZ7dltJqAeoqR2meW84PZSOhtPwaVPw1V5GnuSwg4dcBiBoVP1bSb2
	Eyg9zYSq4InC94I4g42LXyuUR3Fs77iR0X78dL211bL0GMHez9d1VEescm58tQ==
Authentication-Results: outgoing_mbo_mout;
	dkim=none;
	spf=pass (outgoing_mbo_mout: domain of alex@chimac.ro designates 2001:67c:2050:b231:465::102 as permitted sender) smtp.mailfrom=alex@chimac.ro
Date: Wed, 23 Sep 2026 19:14:55 +0300 (EEST)
From: Alexandru Chimac <alex@chimac.ro>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Tomasz Figa <tomasz.figa@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Message-ID: <1343593353.60484.1790180095661@app.mailbox.org>
In-Reply-To: <d679c0e9-febe-4069-9c2f-a2173a5218aa@kernel.org>
References: <20260922-exynos9610-pinctrl-patch-v1-1-f6d816696591@chimac.ro>
 <d679c0e9-febe-4069-9c2f-a2173a5218aa@kernel.org>
Subject: Re: [PATCH] dt-bindings: pinctrl: samsung: Require clocks for
 Exynos9610 pinctrl nodes
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Priority: 3
Importance: Normal
X-Rspamd-Queue-Id: 4hqhrM1vZrz7vBk

Hello!
> On 09/23/2026 5:58 PM EEST Krzysztof Kozlowski <krzk@kernel.org> wrote:
> 
>  
> On 22/09/2026 14:15, Alexandru Chimac wrote:
> > All Exynos9610 pin controllers (except PINCTRL_TOP) have clocks assigned
> > to them, so force the nodes to have clocks assigned to them.
> > 
> > Signed-off-by: Alexandru Chimac <alex@chimac.ro>
> > ---
> > Most Samsung Exynos9610 pin controllers (except TOP) have clocks
> > designated for them, so allow the device tree node to include clock
> 
> I don't understand above. It's contradictory to commit msg which says
> ALL. Here you say most.
> 

On Exynos9610, only TOP pinctrl doesn't have a clock (as far as I'm
aware; haven't found a clock for it), while the rest of the pin controller
blocks do.

> 
> Why two commit msgs?

The first message is the commit message, and the second one is the b4
cover message. I wasn't actually sure how b4 handles that.

> 
> > information for the driver.
> 
> that's ABI break without reason.
> 

AFAIK there are no (publicly available) users of this device, so this
change shouldn't break any currently available device trees.

The best (most correct imo) implementation would be having the clock
properties be optional, pin controllers for Exynos9610 don't need
to be controlled by Linux for suspend/restore (change is more for
information(?) correctness anyway), since the CMUs should have HWACG
enabled anyway.

Regards,
Alexandru Chimac <alex@chimac.ro
