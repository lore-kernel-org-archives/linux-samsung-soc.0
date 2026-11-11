Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794357749;
	b=uY/oS/Iky2xJ1gKDlQy/gInZ0Jxs0OCC4nirifCRcFTech+fGAsmK+S+eo3Wb2UTIaEw
	 vdI9VmAlevgO2Ke8MUa86/SJtXG9zLOSriq4w35IaM5lN0PGtBwUEe5aCDj7jE+1/slN0
	 XWfV3B6se3DJhovlN7XGSTB7AyLn2NoP+vnZa7tA+gZaLAAOah3IoRQl5yqLHZNPTDVRG
	 Fhd9C9JaowKcmtPkKIFVYUBKR2YcBsK8sf5IR9nJ6NYuT8yE3Ie3nWahC9BIm6S4yvc5j
	 jJxen/4Aej4c0QA3heZElLy2tu1OFtHLs1DOoe89qV4LcYdJluM/7E6J9R0kd84VS+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794357749;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Cc:Subject:From:To:X-Mailer:References:In-Reply-To;
	bh=E7hFxFP7EgFYE6TqTVpyjLDOOIO5uZPKfBtvSc0+v08=;
	b=Xc2ued/hgOcc/m2HfjQEtaH/4sn/scHyoMYmQ72gxDcWh2mKwTTpAe7WvYjcyNUj89+B
	 hgjzob4OqQh6OR9aZfJuyyRwxanuzXEXbVzKv4YW6EVsNf6lXNShgCmIHBdxVt8BbLvJg
	 Z3NYxpEHMtexq8NolnJTm8rPdHfB0f4D8t1QkumIokcTQ0gXOjl690WnT6bWRSkRU5wmk
	 9s66n3VnO/54T2A3nAgRRDxB0GWI0/hOG2tjWYEp0wANkDq+zHflgaSgCgzpPVIBPed+H
	 Y3gdxx39lRMP3/7Xwvgov8ZeVV5eEBXnjMSUd6zk3ay4FiKMI6aFMe7NT3reUZjbipA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=E7sD6QLs;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFCCE606A31C
	for <linux-samsung-soc@vger.kernel.org>; Wed, 11 Nov 2026 00:42:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EFCCE606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=E7sD6QLs
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-498f5fa4f70so990353f8f.0
        for <linux-samsung-soc@vger.kernel.org>; Tue, 10 Nov 2026 16:42:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794357747; x=1794962547; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=E7hFxFP7EgFYE6TqTVpyjLDOOIO5uZPKfBtvSc0+v08=;
        b=E7sD6QLs/JTqFWSkB7hHTWPc1IbiQa8RF1Z6jO75nCHyz/qg7g3dDboQtZPPDIa73o
         jNXkNcnZZWoCSsdnYizHXNEFKdE66CXtJJxotbhZgWRFGas+U4/MLtqyh4W5Ii4VKzAv
         LgaRZt7BaNGNYiqaNMPYBMjpaAc9J6eIJSkJlhg9IEIRUmxuBGL+bXhHhh4Mjci574yt
         tlsWqwP2cqR/MFb7Pu88/A5muqd0MwoRIX/+VUwGOwYNc1B0Ty8W2Xa/MC80kzJO+eBI
         I5XYrRXS60dYsmmBk+oY/DrJLFmiZ8vybSN9C1KJ0FJdmkWo4X10ACsfGmNDp/w2kXpC
         pchg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794357747; x=1794962547;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E7hFxFP7EgFYE6TqTVpyjLDOOIO5uZPKfBtvSc0+v08=;
        b=UsMg3Wc1JXcFYY9JK3KVUgC/9Vg3M78ZjsNRPX8T0LbRRJF7pekzwfGEy8CVvas1kw
         viyYrxvpdGCmuQW0X0dQYge9FW1Ji2h9n0s/pdQ49vA66anyd8NLRYvyinZUKm4D8hYg
         MRfWaxmI6m4zqJu7q7R5Lpo+tfUqZ0vLiL+gDbcUHFG5PD3V1dsbE8KONLM1WIklipyW
         uUmGyDtjYFcfUSEO1sPv9OW/AposaWAaW1HpTcVijWal1Xqjty0290ZyGrDcb6efFMmV
         ESCIDJPh1FsNA9pfXPDwZdzI9Q/xnqRDb4LqcRb+uhSiK+RzbeE08cGyB0TF4vtyrxVX
         zXuQ==
X-Forwarded-Encrypted: i=1; AL+hErEOn+j1N1AlWF6Jp2DVxONDjuWZ1Zvpty+FNocw5CcIhnTJoigbuo5O1BImu2GWpoNKUzys+VFHscg5WlKFl2yS4A==@vger.kernel.org
X-Gm-Message-State: APuU4Z9P9dDqvaJEaSNcBTh73sV2O/U6UZQ1zMZuBeFGrw1zkIQCFApR
	MToDQyXPV3NKxMoA77aVQsx6KQ2Ur/7x2GVpJhF2383IgFKDy1LQph5ZiQyGGBPnJ1c=
X-Gm-Gg: AYBFou2s/9uTjh7nPusot/v/h31xB4pPIWkRdCtXWTVTaNnuw0oYDt00WK/O4QcaCW8
	usUNUVQsjEONyFLQdENMy9H/+kMx8Bh65dYNq6p6sxqltIz2QHbEWkz8fF6Vd0ABighOMoFg5fY
	TZmagYxIjOCBoSr9F0dp7shPoHIRVqWYmc+NbVGhR/aLr0eyKjv2Z5bAIZtW2IFl51h8/PkQl3z
	5CuuGtft41tzY/9clMGjZpNVBZ1NLKFMqQ7xDoInxU+YjN+idpP7sqcpbFuqitdEI+KKetKy9Am
	Pcgho417H5EVt9qS6EYhz0EzBvPWWU7cSWHTPbSccp1duOx/EbG/UiFEkc0BOhUrJepAR81nM+r
	TP625KialrLLDaZctZgOBHv7OTLoOB3znrvvFC5eHJLq61DiHNoXV/JQvahBh6M0QzbhEdhzP8f
	tJpOfNPVDCH+fOi5MLUZME8l6rxgA8O6ri0S+SCUxE3cfBiKMwdmpI3VL0a+6r4Mke9+QUzjtKL
	HAh5tIES/dMERxcLMYtWh+eqPR7mNKcoJCihGjhkrc5bhvgFZZBQOWWcnChzLcMOt0B1uppX0wC
	IEQvMrdgiZaSewt7k6amzM2tuRrPGaX6bww03ByWmYt40yC54TA1qFk+AgkpZUVqf1ZA8UV/6DY
	XAOTNzZCHRx8Hvg==
X-Received: by 2002:a05:6000:248a:b0:48c:466e:9d08 with SMTP id ffacd0b85a97d-499c792df18mr850020f8f.43.1794357747215;
        Tue, 10 Nov 2026 16:42:27 -0800 (PST)
Received: from localhost ([94.4.85.166])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49836b8eb11sm8383111f8f.57.2026.11.10.16.42.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 16:42:25 -0800 (PST)
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Post: <mailto:linux-samsung-soc@vger.kernel.org>
List-Help: <mailto:linux-samsung-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-samsung-soc+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 11 Nov 2026 00:42:24 +0000
Message-Id: <DMRYQFZGG5ZI.2T97YA5MCL74Y@linaro.org>
Cc: <linux-kernel@vger.kernel.org>, <linux-samsung-soc@vger.kernel.org>
Subject: Re: [thermal: thermal/linux-next] thermal/drivers/samsung:
 acpm-tmu: Rename platform driver to "exynos-acpm-tmu"
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: <linux-pm@vger.kernel.org>, "Daniel Lezcano"
 <daniel.lezcano@kernel.org>, "Tudor Ambarus" <tudor.ambarus@linaro.org>
X-Mailer: aerc 0.21.0
References: <20261026-acpm-tmu-fixes-v1-11-0637431b7268@linaro.org>
 <179389375857.1009794.283716939057872036.tip-bot2@tip-bot2>
In-Reply-To: <179389375857.1009794.283716939057872036.tip-bot2@tip-bot2>

On Thu Nov 5, 2026 at 3:49 PM GMT, thermal-bot for Tudor Ambarus wrote:
> The following commit has been merged into the thermal/linux-next branch o=
f thermal:
>
> Commit-ID:     ba446bdd27d4a2a6c0cb267f51a6ecc47cf19cf9
> Gitweb:        https://git.kernel.org/pub/scm/linux/kernel/git/thermal/li=
nux.git//ba446bdd27d4a2a6c0cb267f51a6ecc47cf19cf9
> Author:        Tudor Ambarus <tudor.ambarus@linaro.org>
> AuthorDate:    Mon, 26 Oct 2026 16:01:28=20
> Committer:     Daniel Lezcano <daniel.lezcano@kernel.org>
> CommitterDate: Tue, 03 Nov 2026 19:51:51 +01:00
>
> thermal/drivers/samsung: acpm-tmu: Rename platform driver to "exynos-acpm=
-tmu"

Also, the fix for this problem was sent here earlier:
https://lore.kernel.org/linux-samsung-soc/20261020-acpm-thermal-drv-name-fi=
x-v1-1-71f72280583b@linaro.org/

Why taking this one and ignoring the fix that was sent earlier -- this
should be at least explained.

> Rename the platform driver from "gs-tmu" to "exynos-acpm-tmu" to reflect
> that the ACPM TMU architecture is shared across Samsung Exynos SoCs
> (such as GS101, AutoV920, and Exynos850) rather than being specific to
> GS101, matching "exynos-acpm-protocol" in drivers/firmware/samsung/.
>
> Suggested-by: Alexey Klimov <alexey.klimov@linaro.org>

I don't recall suggesting this. Reporting -- yes, but not renaming to
"exynos-acpm-tmu".

This was reported months ago and was never fixed in the updated
series for acpm-tmu.c.

> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> Signed-off-by: Daniel Lezcano <daniel.lezcano@kernel.org>
> Link: https://patch.msgid.link/20261026-acpm-tmu-fixes-v1-11-0637431b7268=
@linaro.org
> ---
>  drivers/thermal/samsung/acpm-tmu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/thermal/samsung/acpm-tmu.c b/drivers/thermal/samsung=
/acpm-tmu.c
> index 42b338d..2324efc 100644
> --- a/drivers/thermal/samsung/acpm-tmu.c
> +++ b/drivers/thermal/samsung/acpm-tmu.c
> @@ -597,7 +597,7 @@ static const struct dev_pm_ops acpm_tmu_pm_ops =3D {
> =20
>  static struct platform_driver acpm_tmu_driver =3D {
>  	.driver =3D {
> -		.name   =3D "gs-tmu",
> +		.name   =3D "exynos-acpm-tmu",

It is minor but it potentially clashes with exynos-acpm-tmu firmware
file name. All other names in file acpm-tmu.c are "acpm-tmu".

