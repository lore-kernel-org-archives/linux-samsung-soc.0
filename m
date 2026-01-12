Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com [209.85.222.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1F6C2BEC31
	for <linux-samsung-soc@vger.kernel.org>; Mon, 12 Jan 2026 14:53:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768229619; cv=none; b=JAHZ2w4NExREfejfdy82w9DBl95xWZEIy3b1Z8MnI8XblKBrMQYzYbHintIb/5nDfXEC9W51rLWu/kGLQ7u5GL573ZCJUGUs/GTNfjUE4gSl7q74xxaX+O0ykMaSy4S9cBL606fmggYK2x80MeU8MrAtlLWyp7vJ2fpMp5zrfd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768229619; c=relaxed/simple;
	bh=pDZDm+F+vmrFcUjSN8q/XEiPjVl5A43rJxAi5NUM+pU=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=tXMxeo/VOluXSQqnC/MWMnPX8JMPVOpsIe97BGexicwOM3qtVR44iof7rf33hmUgpH6XZxcBHrUfqmltjA6ej5daAMb03OVY9px+k1mASMX1ci2mxtmxo869AakIoCLQhHKpAQ3Dt9Y/QpMKH3DwwPdFXyuK2MQMwtG+NPZSJyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Vj3GhAml; arc=none smtp.client-ip=209.85.222.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Vj3GhAml"
Received: by mail-qk1-f196.google.com with SMTP id af79cd13be357-8b2f0f9e4cbso435119785a.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 12 Jan 2026 06:53:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768229617; x=1768834417; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=pDZDm+F+vmrFcUjSN8q/XEiPjVl5A43rJxAi5NUM+pU=;
        b=Vj3GhAmlIePXTh2b5Q8nf02OFyHS3ifCtAmmpK2VSoISkLSGSB2Q05/Zr8uOHdddJd
         7chTYyjFmEeDQss2kZNBF97g8b5qVBlz9z84FYuPnUCOICkx3++ljA9hQZcycvQSnDOZ
         /ugPpjugXZvLc002l2+kOxpGyI6O1qch5ER8M4nyGraxd/xaZqYOHw24BwuMKQpt5BvW
         GD4VFNkej5UuOe6LxmgVonzaymMauoVxEZ+gOLIFOMDY0t9HawyLUxSZa/649UyXg12c
         lKtrYHFndZFvzo2hHsPS/Tzq3LMKANvArj8su3O94+qfZFG1de3oUUJocG3ivIHhp8Jz
         2+3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768229617; x=1768834417;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pDZDm+F+vmrFcUjSN8q/XEiPjVl5A43rJxAi5NUM+pU=;
        b=F7D/kEgekz/dmy6l14xJjOrEvtMhPLO4PSibFoOGddfHsNi3h7I0v/wvORlY8cLy/T
         cFAKeyt5b55iKnlBfVy2mJIrDq0Si/3pa33U8gd1F/gNNzBh5ZXdJ9nc8lVPeRj7hzZ4
         v+y7jY2I+bdvOPVQLxT69g9yIzrsOBsYglggDAOQLoCUP/CWe0KhNa30yA79CfORYQbW
         ZlNF0eRpmpnvAF3KTglZMaMLzQIxQRYV8bMNIg/+Pb/mzMKyv/dh+kQrrRjxXisIr7kp
         XXKT3H2VNjAVXF0Wq4PJjwVVOWcDdZHZag1Rgoz49qPVmLkgoozxCx9ND5pJQVe+S+2y
         ksZA==
X-Forwarded-Encrypted: i=1; AJvYcCXdwOGfNlLR42JgZv930WDhoiZRtD/UUc9cDHb3R3MR2OVbb1GL377ZIRzlLoxJ26PElf/8gQkQlOhcnbNDFLVTzA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxw1whDVH29fDAksIK3SufR7tKN53YeUPAEG2SjHQH5neanP5Xv
	iMWCdz3vStKtXDOlOZAe2ulrica2OHU9bKzppRALajl1wzK5Uzms2bAPRnM7KzBobdg=
X-Gm-Gg: AY/fxX4NOGkJ5EEOiEyoFO7TR+Bl8b+RtQExlsPtPDeoe5i9VzyNCv5PeP3a8O5a9gA
	uug/6EPGf+dl42fZO56d127M0c2qsSgjK+0Ric+p6nEdSALU1vLPLAId3HWXMC4+0H57TTDMZtY
	xzunnqhTPmDfMmwoUOFDKZlIps0BWYz7ZJRMAAQVWu7x5qX5U15cdu5cUEvSgVXhvwlWYTf6quT
	7T1epnT5s90IOv0tyKWmFNHmaCjc8mcpGOP30AtZHOhdgverDuu0iWrOKEoTtk3lQyiXUC/swB+
	h5rDp6RUDErSIkCdNi+n/idOYFos0yXtN7ThhvgalzFMbVygxXbkS5J3aUDnRmErPK/vwVNzB/8
	PmB2tbAWYhxlSoJamuHofGUhiClSdgtvHUF+fp5+D1IlzPS8LxYErhXaKw2OZ4eG/MQvvbT7T1g
	hYX8bEoQFZeln+wiqs
X-Google-Smtp-Source: AGHT+IHT8VjWMJ5Rzt6/g2IIlWMwlHfMloJNg8k85JHX1D4CqQQ3AYqCTokG+u+U2mL3ZC97mPnI+A==
X-Received: by 2002:a05:620a:4096:b0:8b8:7f8d:c33d with SMTP id af79cd13be357-8c37f54eb44mr3088215685a.45.1768229616536;
        Mon, 12 Jan 2026 06:53:36 -0800 (PST)
Received: from draszik.lan ([212.129.79.54])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c37f53c422sm1585790285a.46.2026.01.12.06.53.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 06:53:36 -0800 (PST)
Message-ID: <b30ca585bf401a3f68316afa8c217ff7130e0af3.camel@linaro.org>
Subject: Re: [PATCH v2 5/5] arm64: dts: exynos: gs101: add cmu_dpu and
 sysreg_dpu dt nodes
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Peter Griffin <peter.griffin@linaro.org>, Tudor Ambarus	
 <tudor.ambarus@linaro.org>, Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>, Alim
 Akhtar <alim.akhtar@samsung.com>, Sylwester Nawrocki	
 <s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, 
	kernel-team@android.com, Will McVicker <willmcvicker@google.com>, Juan
 Yescas	 <jyescas@google.com>, Doug Anderson <dianders@google.com>
Date: Mon, 12 Jan 2026 14:54:14 +0000
In-Reply-To: <20260112-dpu-clocks-v2-5-bd00903fdeb9@linaro.org>
References: <20260112-dpu-clocks-v2-0-bd00903fdeb9@linaro.org>
	 <20260112-dpu-clocks-v2-5-bd00903fdeb9@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-2+build3 
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Mon, 2026-01-12 at 14:16 +0000, Peter Griffin wrote:
> Enable the cmu_dpu clock management unit. It feeds some of the display
> IPs. Additionally add the sysreg_dpu node which contains the
> BUSCOMPONENT_DRCG_EN and MEMCLK registers required by cmu_dpu to enable
> dynamic root clock gating of bus components.
>=20
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> ---
> =C2=A0arch/arm64/boot/dts/exynos/google/gs101.dtsi | 17 +++++++++++++++++
> =C2=A01 file changed, 17 insertions(+)

Reviewed-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>

