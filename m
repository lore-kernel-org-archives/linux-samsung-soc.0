Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5EFF31A576
	for <linux-samsung-soc@vger.kernel.org>; Tue, 10 Feb 2026 11:34:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770723279; cv=none; b=rbvwVLTCqWngiR/w10GkQJWvtg8MwyYkbhosvrpaQaVwZyHOfk92k68WNox8iwVWw0PUUnzKY5ygKcCyw9xJAAkiFW/2hbLJiNc5Nb0J3KV+KgLWMhUkT2mPpVLw2RwjSPiaMriAEYAQeCoRQ/A5nLHAET3+xSKIByk/M7Lpnuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770723279; c=relaxed/simple;
	bh=0XlU4UF/dEnFM5DVWlqZdEpM8W27PO+fZX0aFMTUInQ=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=YAd0ppW9cmUg1OtLqufSUHjqRll4Rw460mPs+Xb+EAbW/ZBY6kkZr8je5kD5sE+x6KSawGLf7YDDL8nq9p+9SxeNT5GcPtTjKtRDD9+rRkx7BvuQa/acKprAQh17G7/QDsfpqD5hlS/JDDzSZIrQ219PKh7iM6cCIQFNU/Qf85w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=O1yrQihm; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="O1yrQihm"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-48068127f00so7039085e9.3
        for <linux-samsung-soc@vger.kernel.org>; Tue, 10 Feb 2026 03:34:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770723275; x=1771328075; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Z07aATYx5EWzbVAHnzDe0erl/Knn/2f3Dl8/hpKRvCU=;
        b=O1yrQihmpXN62Az98JsyW1mqAdTR1IxjmohOqJ/9qlE7owGC5y1ORA2ma3avBARpZe
         Ng8lrPkffsgNRt8CGlhp5qbEue+aNKC5RiIIbNjb0vw/FOK6FDFOG245+y/GfNMjGzvW
         H1KhoUNXJ2Ta8qIdU97RyTPEhBGt18XiJVpoly3DSeZ8hZkvnLEQylKbdTwkNjCvYFOt
         bUUKaN9rD910GrjX3w8Es5CHf0EO9PYWULmoKSnND+LuVlLki717/JPj8IG+wX9/jBnk
         FumInm41OzxGMPYyY/z9d9bcQnH/w68QYe/i7mHwnpnpKQVteBLVRdNKOzFOOokZJjsY
         YSdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770723275; x=1771328075;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Z07aATYx5EWzbVAHnzDe0erl/Knn/2f3Dl8/hpKRvCU=;
        b=fFtaXbUhrjMIgSDdA5Zv7Sd9K2ohqOaG79NzmsWXPtUEHw+ZBM159zyXkgtqwesczl
         9hScrk45j8T1xL0Z5sOfskyUVWcfPOlrr2Q8vRs/R7FlzwaIr7Qjno1/bw5Lye7gY/86
         yHjr2wxL4eI1bnJMd9qPQ8fKl841xXUT+HDinRnE+sBkdJ6+rAY7Ci0ZEjLrISG+5Emr
         f8qF8dSsk7qC7gLmnGRIjkWOSuppAPXHuSL+xpWE325Ft0xzHFlMrZhgHQCFj/f4c1ag
         NdVEDH2eCwDs/H1V7tDEmc7b2AKcuSBHpqBHtz7WLCoo6wLc7Pt2+DW1jKEIs9REvRSV
         zyfw==
X-Forwarded-Encrypted: i=1; AJvYcCWw4o5M1OjvleT34LO9Z9hHtbtBK4WAMbkYmJMa1SOjjpCSzI7hsfCQWLtNWxDPjaoGbWZXd3aZkKG9zKRcNoEcMQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwAjsbIQmPgXeP5HzdqpZCO9Cd+xsWQzYFhIVztSMm+UFpgkIKB
	yNPJil80V5Vws5+Q6yBnGM7QLlRJfM5CxpDcMRwo6kVTR0kwc4p+6hm35JgMBUK1a54=
X-Gm-Gg: AZuq6aKVRPJ/VQRNdsoG0BXQ6KFDgSvH85a2ACLRvt7a/JloJ7cx2lA6MYVcsPnFPIv
	UfO+TWklPqxU7tgn3KfRF6XTA0E2bVA+EO0l8wVktqFyvXvt0v9jT5fSbeJmNP4qV9g5efknv+d
	p8cwjxrbgMOcx48rXBCEtdGUF20XLG8+1QcAWcnLMCX/F+eUGukF7CGBZloierkSGfOl/4bY/Ef
	sMP1SPEPOG8ZGqZNQZh3YGjzoHwmOjYIbZb1PWYKMzVE75Mbnfi8XGrvFPxLflI64rLnt5QHltq
	TIaD8NjZH2YeRUGu3ZSW/o41AUq1mQvbfA2I3KE01iGHyGgHKxfoSq/3o9rLzu2lHigy/qfV0CP
	/3zszr+aB9JWXF76cEyyZVGDFv32trusVpquHqyluaxXxu4n7N4hZquGgcDzJjjNHeCkh1Dc1wJ
	NoVIthDTe94Kyq2sA33m0yDerAc1y7Tg==
X-Received: by 2002:a05:600c:3b83:b0:483:4a95:66da with SMTP id 5b1f17b1804b1-4834a956702mr52464855e9.13.1770723274782;
        Tue, 10 Feb 2026 03:34:34 -0800 (PST)
Received: from draszik.lan ([212.129.79.225])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4832911312esm113766395e9.5.2026.02.10.03.34.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Feb 2026 03:34:33 -0800 (PST)
Message-ID: <91c191bf483512ae10850648a23037e0ca23e3d4.camel@linaro.org>
Subject: Re: [PATCH 1/2] regulator: s2mps11: drop redundant sanity checks in
 s2mpg10_of_parse_cb()
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, Liam Girdwood
 <lgirdwood@gmail.com>,  Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Dan
 Carpenter <dan.carpenter@linaro.org>
Date: Tue, 10 Feb 2026 11:35:01 +0000
In-Reply-To: <1300929e-7b47-45d2-a863-778fd3012a76@kernel.org>
References: <20260209-s2mpg1x-regulators-fixes-v1-0-ead348e64e14@linaro.org>
	 <20260209-s2mpg1x-regulators-fixes-v1-1-ead348e64e14@linaro.org>
	 <170a820d-b987-4fd7-acca-ac88bab9e243@kernel.org>
	 <4f1b1d857c0ee17436cd61e97219f508bd89f917.camel@linaro.org>
	 <1e8ee0ae-a74d-418a-80b1-4d2379614548@kernel.org>
	 <0ee40d36397bfd4c04aea6ead07e42848203e9d6.camel@linaro.org>
	 <1300929e-7b47-45d2-a863-778fd3012a76@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-2+build4 
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Tue, 2026-02-10 at 11:51 +0100, Krzysztof Kozlowski wrote:
> On 10/02/2026 10:37, Andr=C3=A9 Draszik wrote:
> > Hi Krzysztof,
> >=20
> > On Tue, 2026-02-10 at 08:28 +0100, Krzysztof Kozlowski wrote:
> >=20
> >=20
> > > I also wonder why you left the second - ext_control_s2mpg11 - untouch=
ed.
> >=20
> > Could you point me to it please? I'm not sure I see what you mean.
>=20
> There is exact same line, which you touch here, ~20 lines below. At
> least in linux-next from 5th Feb.

So you mean
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/dr=
ivers/regulator/s2mps11.c#n506
? It is part of the patch:

diff --git a/drivers/regulator/s2mps11.c b/drivers/regulator/s2mps11.c
index 2d5510acd0780ab6f9296c48ddcde5efe15ff488..2d67c5c16f487506a2e9e4b119f=
33faa846269f7 100644
--- a/drivers/regulator/s2mps11.c
+++ b/drivers/regulator/s2mps11.c
@@ -478,8 +478,6 @@ static int s2mpg10_of_parse_cb(struct device_node *np,
 			return -EINVAL;
 		}
=20
-		if (ext_control > ARRAY_SIZE(ext_control_s2mpg10))
-			return -EINVAL;
 		ext_control =3D ext_control_s2mpg10[ext_control];
 		break;
=20
@@ -503,8 +501,6 @@ static int s2mpg10_of_parse_cb(struct device_node *np,
 			return -EINVAL;
 		}
=20
-		if (ext_control > ARRAY_SIZE(ext_control_s2mpg11))
-			return -EINVAL;
 		ext_control =3D ext_control_s2mpg11[ext_control];
 		break;
=20

Otherwise I still don't see it :-)


Cheers,
Andre'
