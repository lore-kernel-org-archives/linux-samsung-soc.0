Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D69D1F931
	for <linux-samsung-soc@vger.kernel.org>; Wed, 18 Dec 2024 11:23:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734521032; cv=none; b=BlY3IK7Uck5ZBNyPRwk3xHWQCGK7kNr5PZR3L9jl+tpHinJiPR0i86BhEgjW4sfFW+P26WwS7zlzqy04/rldhnmPoghMMD9YDl/yAmI0YNQtrSEp0thZsWXAl2IF/Z84VhNSsP2LnPhC8i0aCDfPSTs9EvdVpcUgV7Xe9aGiQCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734521032; c=relaxed/simple;
	bh=tym2AV8qbCJIfj+aXCTqvrXH+7m8n9qXgoHbX1jTriA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=um6y4j6ObVNntpWCyFZgUU4d8p8XkQ7LlK8SDMrAlrc4CT0oBv3xzJsAl7SMcATcB55YvmLK0zYciTXoE2NsXst6720/OQ9FfDp1wa0iXzkrpon9spjtBIXOEbPFib0YiFESa8NLXkDQPmVaLTHhlPrZLZJ/KHrsjS6kQupnudg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GWnEBthz; arc=none smtp.client-ip=209.85.161.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GWnEBthz"
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-5f2b21a0784so1387214eaf.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 18 Dec 2024 03:23:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734521029; x=1735125829; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=wGDd3GsS7X/LEUACNFlLUz77SGjMRwi8NjI74LtUWbY=;
        b=GWnEBthzO6ahjiBjpMQ3w1OiPV9K8GdZp4c3D2dBENnPcQADM/BjW+fxQIXugQc84z
         lBlaPmklnr5N73kOHQuuhj2qcDQHYC5D8GGWA3hy7ZRKmTHKRzf8vZKIPZn+7c5LybXZ
         2CKOCuTncfy89jG+PVbGF6RIM0POYPWxarb6vlP7VmFw6JfLjDNoiILn6GSqTCOd8UXD
         3tPNhhrjorlWu9WkIJgOFKTTIWztPfhjeDUZ08QjSC33XRCUl+b2N+SxXcwvNj3l4k/B
         RitDK4THfvzERUvvmd2CAXSksd57UkdTlckufCg/frWeDfvTm8+lXNK88FEe1aGKGrP/
         /J5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734521029; x=1735125829;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wGDd3GsS7X/LEUACNFlLUz77SGjMRwi8NjI74LtUWbY=;
        b=YBGUVZyJC0qBDap0mxF20Qsks0FVAIaiwcSudFbvgRG+clejo2RmoIobTLDa8GTZ6w
         VYYTdocXdfRbZuA5hlw/URPEolcXjb94jfUmlXYax37eCANtKOKjTJ2bsJYFL37p4127
         DynpJWeMwo6DPqeNX2qx+q+uhnu0BB6+0meLp+70eASb9JP3fYIBgiT2NprzzGsQc6Bm
         htV5c7QbSekuURMuJmyhSt0pEoUd99e1Mh+6u++D7cWL5UmLPyLMMzwDOFMozuExJTE6
         xVT4INkKskm9Mh9bUAzUABYorDn5Nx0XOKWOqKDakAh2LqYZUVRdTWop4hPKErqXCDth
         vLBw==
X-Forwarded-Encrypted: i=1; AJvYcCWykGJ2EU2SokqMlnyi5VrDGOzhE5bhLViOtC8tRM5hskmmrHLvZmWXfFjAj9gXh34mfyzZZGKwFfNPSYCrF2vf3Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YybKzs2cVQTkrlHKcoaMWkhG6FNNewX7txvgX4FplYJ/BpGNlUM
	ahWFGlgRUYm6Ts1/Qz+/KNVG2pQzVzJo475jz6ofPNhuHUKS+tFF1miDASg1C271n5Y4gWNHjb/
	mG0CzDfKh+xgAYT89S1G++gWsfsCT9o0OJGs5bw==
X-Gm-Gg: ASbGnctMGxlvgd9dLDWvZYs9ouvLVTgBDup/rjkolNPyNObn/qiSV+01rlKpMxSK+Wn
	5BwRkzHK8JMsIHZGyVRUd2yrkWFayPDbmf5a/U1c=
X-Google-Smtp-Source: AGHT+IE0SxJTQLNEo9P1nttPQbjieAU87Qbz/OG3Tx1qyRFpKK7F0I23DhhsjQFVOLFLQOC0Fg1O4vAzd0y7cFEiLlo=
X-Received: by 2002:a05:6870:fe95:b0:29e:51ca:68b4 with SMTP id
 586e51a60fabf-2a7b3145c1bmr1357208fac.19.1734521029643; Wed, 18 Dec 2024
 03:23:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241217-acpm-v4-upstream-mbox-v5-0-cd1d3951fe84@linaro.org>
 <20241217-acpm-v4-upstream-mbox-v5-1-cd1d3951fe84@linaro.org> <wlvvuq2ldv4funye2ylnccq7soyrqkqggg36oimnvmhxbbjvnl@yyy4y5nyruzn>
In-Reply-To: <wlvvuq2ldv4funye2ylnccq7soyrqkqggg36oimnvmhxbbjvnl@yyy4y5nyruzn>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Wed, 18 Dec 2024 11:23:38 +0000
Message-ID: <CADrjBPq4mTsvCivBJPmADP3pfUORBV8hGeP5GrTg9YxASJLHXg@mail.gmail.com>
Subject: Re: [PATCH v5 1/3] dt-bindings: mailbox: add google,gs101-mbox
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, Jassi Brar <jassisinghbrar@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, linux-kernel@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, andre.draszik@linaro.org, 
	kernel-team@android.com, willmcvicker@google.com, daniel.lezcano@linaro.org, 
	vincent.guittot@linaro.org, ulf.hansson@linaro.org, arnd@arndb.de
Content-Type: text/plain; charset="UTF-8"

Hi,

On Wed, 18 Dec 2024 at 09:29, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On Tue, Dec 17, 2024 at 09:40:20AM +0000, Tudor Ambarus wrote:
> > +description: |
> > +  The samsung exynos mailbox controller has 16 flag bits for hardware interrupt
>
> If there is going to be any new posting:
>
> The Samsung Exynos mailbox controller, used on Google GS101 SoC, ....
>
> > +  generation and a shared register for passing mailbox messages. When the
> > +  controller is used by the ACPM protocol the shared register is ignored and
> > +  the mailbox controller acts as a doorbell. The controller just raises the
> > +  interrupt to the firmware after the ACPM protocol has written the message to
> > +  SRAM.
> > +
> > +properties:
> > +  compatible:
> > +    const: google,gs101-mbox
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    maxItems: 1
> > +
> > +  clock-names:
> > +    items:
> > +      - const: pclk
> > +
> > +  interrupts:
> > +    description: IRQ line for the RX mailbox.
> > +    maxItems: 1
> > +
> > +  '#mbox-cells':
> > +    description: |
> > +      <&phandle type channel>
> > +      phandle : label name of controller.
> > +      type    : channel type, doorbell or data-transfer.
> > +      channel : channel number.
> > +
> > +      Here is how a client can reference them:
> > +      mboxes = <&ap2apm_mailbox DOORBELL 2>;
> > +      mboxes = <&ap2apm_mailbox DATA 3>;
>
> This ordering assumes there is channel "2" in doorbel and in data, so
> two times "2" and of course the same for all others. If this is
> configuration of one channel, so "2" is either doorbell or data, then
> type should be the last.

My understanding was each channel is either configured for doorbell or
data, but Tudor can confirm. With Krzysztof's feedback addressed:

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

regards,

Peter.
