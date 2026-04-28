Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B08693BADA3
	for <linux-samsung-soc@vger.kernel.org>; Tue, 28 Apr 2026 21:43:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777412617; cv=pass; b=kNgLsUEl0IsKAS8eDUg2bllnpbCvmuqavoJGydz66wH6W5UOXKYl3+4sMI7VzvwVNY1nnq90LSgDJBhn+mLolb+Qs2Mbzmdk5WoW5Fz9diMGBG54dYccvsroIStLguWU5/LqksnvUqEWCz3oW1QN9ucuwShB3pVd/lRpjZskytc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777412617; c=relaxed/simple;
	bh=cUgK2Kfj5omPDpTxVPnIw7yYPrhwYT39UaRAh23oDLI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iz3e+OObemmXR4jvzEk/r+SxQX0Mm2XZ5xG7RS55F7Rt7GrATtNp2FR5l3c6UqIaLHLvKF55rpCkLz4elNs4dVQYlmC+KKmtFNsRAMNtlMvz5hYqx2PDXV/WQ+m3BTUgWNzjNtqmEseo7kS2Seu1r3h28a25mYpjLQnQ7f0thM0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=google.com; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=RtM7H2al; arc=pass smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="RtM7H2al"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4891ad5c074so26965e9.0
        for <linux-samsung-soc@vger.kernel.org>; Tue, 28 Apr 2026 14:43:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777412614; cv=none;
        d=google.com; s=arc-20240605;
        b=GxxrCwPrppXDptiK4nX0iUeOxfnCNvBQUM1ils8jA2eEVtxj7AOhvzdiOQc82C7ym9
         yUsIxJqXN67eReOWLGPyQTGv29J0F4poEYUO1X+IIVMpiO6Sfsll/gPMJJaHccJCulDC
         LiKMRC6OuzuqvclI78UQZVIaDHrVsuu6IMvyW2y1I1VWuPEaGJIh623SIvK/js7lneNn
         lBu/sC1STodhjNuKAMwjJt3mUeeZc5ExN+XjssU8ILUjLg0KwcEKOeFefomRbIo7/QAO
         N38c7qC+T7UZkVDZBoAomNAFCp2wMG7EE7Q4l4atNcGLjZxDRwxTB1oAOnE9WV69yRSU
         RRMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=cUgK2Kfj5omPDpTxVPnIw7yYPrhwYT39UaRAh23oDLI=;
        fh=pqx2FCWkjzILodWJXBb/JOS/TDcvnoNOkWsecmAsqRo=;
        b=Yz5fE+a9daK1f+av2vaOI3YTvgv16DNe3wSyPIJphfggpzA2fByCc3L8/l/KnS9WFA
         vYdKSfc8yadvhWhloeQUVP9A1GAQKAarTpibRmfQFTb5Hr90xiej/o3aEO9yoJAmtOkB
         G15Sqjd462qTgLr0oIYnJZsG1Kz+iNK3E0hPhi61lMKjiIckyUs0P1OJyTXlHCI7wynN
         Del+FRvjy+6EJ2fhiZec1AT9nDYJSS+lhfHdby3afJ2j2f2go6nbGQfKRiv/+U3Ge6aW
         NDPj5d6rAxH2Y1looqox1+Q01JSBG1mtrpQ+zN4ktQvd4aeJxjDIr+gmEntsRtj94AWh
         d9hw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1777412614; x=1778017414; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=cUgK2Kfj5omPDpTxVPnIw7yYPrhwYT39UaRAh23oDLI=;
        b=RtM7H2alnCMVAaGDmjy59M8Gwp7eHD+fQMMsYihCog4+AGXfK+HEf1d9LmCx8gykeo
         +/gs4xjnFFUbOndufNdp/L7rxB22zO6/iacal+Nr09pUF0lPUltc1YOd/d5VJ6Wqr34L
         D3cjV4KEF/F3SUm7t5OOUIBIDgK9rMqH6Dys0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777412614; x=1778017414;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cUgK2Kfj5omPDpTxVPnIw7yYPrhwYT39UaRAh23oDLI=;
        b=e3Yvv+c2nzRhFUP8VsnOeJ4h7HURslfQ3KebBRQmJm493Vx8hvxQV6xuabkj8cR8E4
         b5I691RCv2CtxK84ZRiqkk94JSXhTyweARamE24Qs+4HvAziSlVDXX0o57KUMAYD8ZWo
         ZsMWVOMTUsjRe2AApWz1bEx6X8dZrwk0juR443CLVgTFZiwaBKgTvHdPip/+ISA5615n
         dGQ+seAlhLzMSWnT64nbGNP9edgq2U4oRKB/IK66azo6BE6qgYOVL0qiaihKBAtFsQ+H
         qDVTwoW+iacSKm9ce5PnDsKkLquMgM8Zkjkxc/HzAiivnI/e/+fN2MbcX69G1O5av2q3
         awPg==
X-Forwarded-Encrypted: i=1; AFNElJ/XAWnDUJ2vkrzcNT9JCCBIKwnOTHJXFNM7gZ1bXjQhroeDvHOlh2nscAYwwMWa3KcynozIExQ49xV/vu++J7VKhg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwuoAj5ZEN5Xum5qWJXxprTAywdJm34CpSUqTwRTgw6YLDbYq1E
	P71Z0woRELXXJYR3cfJu9tWejZZSSjPUaiMHm0W7+KKLKBrNHDZ+dTwd6AbEJLJSgC6lHF2zsJH
	sqLXAAb14AKenHLCU6yL40grOlH/Gd3bImK5Pa0xU
X-Gm-Gg: AeBDiesJceQ57LW466NM+N++VPYNw6ECmFnCzVrZJgL3LDu+TdOE0gqEB7iBWGXbH1n
	cx3FMgrOXXaQcHWB6cFda59pIToOarJe80mIEWPzjOP2k/w7pQ1VP0laAE2lQ9zKEnr7/UNkOuk
	jMI0B6GVcWF6dY6kxuSZUmDN4KPmkst+f/M8HRcK4tt8LRhmJ7a/F1zqe9Z3YIgI7iJIuhgxHQy
	+YUXhlHx7cIa6aLPVzSRpg/1UO6u6hzkDUM3Ilh2H4Dt17U1ZgElnKkDH+hb2hlqkt8eakqKCZ+
	4c/u/oIcIxG13knyBqB2/YxzPRhGADwLVkbK2iwzyQEs+4dwGC/G2Owrjg==
X-Received: by 2002:a05:600c:530c:b0:48a:5f32:62d0 with SMTP id
 5b1f17b1804b1-48a7ba07d5dmr322355e9.12.1777412613805; Tue, 28 Apr 2026
 14:43:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260428200712.2660635-1-briannorris@chromium.org>
In-Reply-To: <20260428200712.2660635-1-briannorris@chromium.org>
From: Julius Werner <jwerner@chromium.org>
Date: Tue, 28 Apr 2026 14:43:21 -0700
X-Gm-Features: AVHnY4LgrR9BMoyPVl-dbhODH2S76f3l5WcQRNgpXekO-MzmQp39W8EwHdrUnso
Message-ID: <CAODwPW-YuhQxyGSeahp8+i-bz_hAvPQQCNWxaZCjrbvkHOQa7A@mail.gmail.com>
Subject: Re: [PATCH 0/7] dts: Add /firmware/#{address,size}-cells to
 Chromium-based DTs
To: Brian Norris <briannorris@chromium.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Thierry Reding <thierry.reding@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Heiko Stuebner <heiko@sntech.de>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	devicetree@vger.kernel.org, Doug Anderson <dianders@chromium.org>, 
	linux-arm-kernel@lists.infradead.org, Tzung-Bi Shih <tzungbi@kernel.org>, 
	chrome-platform@lists.linux.dev, linux-rockchip@lists.infradead.org, 
	Julius Werner <jwerner@chromium.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> I reviewed Depthcharge code history and found that this problematic
> bootloader behavior dates back to at least 2014, with the Tegra/Nyan
> device. Older devices may have similar DTB structures, but I'm not sure
> if they have the same address-cells problems. In any case, these changes
> shouldn't hurt even if a device was not affected.

I can confirm that Nyan was the first Arm device shipping with
depthcharge. Note that the Exynos devices are all older and shipped
with an old fork of U-Boot that probably handled this very differently
(I believe they had `/firmware/chromeos` but not `/firmware/coreboot`,
so they wouldn't have had a `reg` node and should need no `ranges`).
