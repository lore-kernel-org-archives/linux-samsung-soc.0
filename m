Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BA6238947D
	for <linux-samsung-soc@vger.kernel.org>; Thu, 26 Feb 2026 06:50:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772088648; cv=none; b=SWy0M9ST6SCELHbcjxTw8PovjTog5XoIXtHT/zNC0BBd7U1isRFCCx7jB9aKUgza6dxxKqVx60BJ12gpDewhL7m+cq6+Jr/53fFj8WwdLDC0OqzfqpFvVOeEYR9lJCeVlxSv7ci0ghhWvERKpHkpvyWHF7ufxnOEhc9IG8iq9I0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772088648; c=relaxed/simple;
	bh=tzgM7zmQUR0Nygxy2CGjYQcMUHvYZw/GgfIvFJp40ww=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=uhr/SHh86GysV9vDQ0O8YHaP7ekCAJzwGR3et0svmiAtk9D4fyXGxvhe1Q0aTCxo63n2+XwPFA8IbakcBHOWNMi9YUEyO7rUwQh9umPwGEk4orPLeIEcmadQmuUFcpPfUOMesj43i793Kw0ZcpRpuJjFbC2qfuLg6WpozN2nNvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cx1qxDPH; arc=none smtp.client-ip=209.85.128.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cx1qxDPH"
Received: by mail-wm1-f66.google.com with SMTP id 5b1f17b1804b1-4806cc07ce7so5960825e9.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 25 Feb 2026 22:50:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772088646; x=1772693446; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=tzgM7zmQUR0Nygxy2CGjYQcMUHvYZw/GgfIvFJp40ww=;
        b=cx1qxDPHxIYQwea0jTUE/AQk/hbYKDBDV74+wz6Zv2Ux+oyNbp7nYgeGDnDu2/hELr
         SqzasT38ogd7nDKaoEp2WygRMX82Lv8vARwVhcvQn7/e1QvTw0YvPwkZpAQAb/5w8tEh
         qozt61WiVLUL0+BBMqEfXwagxT+1Ddy1rnG15MFO2GI/tY7y2Zz1zgnJAThj+x05IIF7
         wo3ivkJlXy/iMhgQvV7hAbBJchJ34EdNJ/Fst3uaC7Zmuu4Dj+koxNFpECFhQTSxWQu+
         DWyyBtz3ir0aQYcP7735s+oO1CLBv99R9XRSNu4rnpA8jsul1v2cyAF1LTvW1V02rbd2
         dbLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772088646; x=1772693446;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tzgM7zmQUR0Nygxy2CGjYQcMUHvYZw/GgfIvFJp40ww=;
        b=mHsuJ+amEBrqIZ/cAUUeN+zxmgqExwYVmcfjB35Q30s3CMW4RStHaim+ImZ+wKG6fb
         tjx7IR7Yv0EF/65eOgx8cJciOh7MMuN0IddjI51LYcg7Vmw0dLCxihSPUVnn7bcOco69
         hcqm7HSsM4OuKJEmB6WOAs7fChqJIhLews9wJv71G0+4HtgpuTgQnQ1FgKBRTNP1GjUo
         MMmKv/KkKIGEMyCvfF9X0OZwqy1a38iiiMU9wK3F5Uq9nYU8Cg4Tqsn5zhz2oshDcemL
         49NKPzXOn2Pea3V9m+43UhnbGPMpNuOLnmZmbLg4340kThqUA4yOIJttf/Rk7VwXiD+4
         rEeQ==
X-Forwarded-Encrypted: i=1; AJvYcCU5evz78aJzHAHYP2wnaqgshSOD6leug6oMw+P40JPCkdoiSeGfrKPtEAx4TIf2Cq3nB443snI5QwN7ttTYiczf5A==@vger.kernel.org
X-Gm-Message-State: AOJu0YwyfRs7EKPHyWD1nCdSLzjxLB2AxAB1Kbji71QI3IHny/d6xfSj
	FpdIz1c7z0EBmhsEuWBtaPXjnr0ka+Ef53YppIpDH8YdNlMqQ80eM7ao+WVRRSPn+fw=
X-Gm-Gg: ATEYQzws4taseDn3k8rspXF6vzUyIDuwWLTKHZVW1y+c8mXNd/S1SZS1yTMAr8DLTzv
	RgiWliYc2pdz/RvIgM3tf3TV9y+hT5IdcQBFaO7NSByd9YYsVhGv4iIgo+V6h+9EjeOnVKFBtXI
	+ZCFV7nlG4E8e/X7Y/DmxSjjLrtoVjh95WuSPU+JaUb/1RR1e2VCHcbUUMuo2Yhwg4sOFsXCASE
	u6W5tczOUUa6EIUQkXIpVv1ALINerxYt/TLHneVKcMqBNScgMxx2nMpjtlhYrAJp3wxzcDhCtuC
	ad+0MikQwPbb/uAOItSTNMMWHCM5eEAcNE8MGaDd1OkeRYtl7B/3T0HDXtswXu1md2xbCLKYLYh
	dZxgEv29ucJWY+9JoP22vpYP1TNRKdFx7m4EHjk6THlvLLZcWd0cV/mj/F30y9Ntg8JbjaIkcut
	mNeLjnrkq69g6pAifO2tdBNoDBRo81fA==
X-Received: by 2002:a05:600c:4f11:b0:482:eec4:74c with SMTP id 5b1f17b1804b1-483c3de3a31mr15029275e9.22.1772088645594;
        Wed, 25 Feb 2026 22:50:45 -0800 (PST)
Received: from draszik.lan ([212.129.82.143])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483c3b89c99sm22518055e9.15.2026.02.25.22.50.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 22:50:45 -0800 (PST)
Message-ID: <d8fe362e12af7a4e076babbca8a8be9b51f58ec3.camel@linaro.org>
Subject: Re: [PATCH v2] arm64: dts: exynos: gs101-pixel-common: add supply
 and regulator properties
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: amitsd@google.com, Peter Griffin <peter.griffin@linaro.org>, Tudor
 Ambarus	 <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Alim Akhtar	 <alim.akhtar@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Badhri Jagan
 Sridharan	 <badhri@google.com>
Date: Thu, 26 Feb 2026 06:51:32 +0000
In-Reply-To: <20260224-max77759-charger-dts-v2-1-983265ac8e63@google.com>
References: <20260224-max77759-charger-dts-v2-1-983265ac8e63@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-2+build4 
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Tue, 2026-02-24 at 23:30 +0000, Amit Sunil Dhamne via B4 Relay wrote:
> From: Amit Sunil Dhamne <amitsd@google.com>
>=20
> Add power supply and regulator properties to the MAX77759 pmic. The
> usb-typec device will reference the regulator provided by the pmic as
> it supplies vbus to the typec device when operating in power source mode.
>=20
> Signed-off-by: Amit Sunil Dhamne <amitsd@google.com>
> ---
> This patch depends on the patchset [1].
> [1] https://lore.kernel.org/all/20260224-max77759-charger-v8-0-eb86bd570e=
9c@google.com/
> ---
> Changes in v2:
> - Added a line between property and child node as per DTS coding std.
> =C2=A0 (Krzysztof Kozlowski)
> - Added the "power-supplies" property immediately after the prev
> =C2=A0 property without leaving a line space.
> - Link to v1: https://lore.kernel.org/r/20260224-max77759-charger-dts-v1-=
1-b443545c04aa@google.com
> ---
> =C2=A0arch/arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi | 8 +++++=
++-
> =C2=A01 file changed, 7 insertions(+), 1 deletion(-)

Reviewed-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
