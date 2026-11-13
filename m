Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=74.125.224.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1794538509;
	b=cqmvaSHntadWedBuxHRGY0IB0zxOxMyeXO3X8esUYv5GOHYV2hgXWIZSIEhnRJCcXTls
	 bDuniRYqfUY5Ynp/7mELqOS98c9KX2LKVKOarkWKlzrbRwaBaEVWvprxca+DBWJgChJVy
	 szPKkn3su3PI3zTNYrgHP99pzpGXRwZXTWIy7INNevmWSRR7F/QaClX52dhyUnOwfZhVd
	 EQY2/5beOS62lN3xcC1bCLnuoqqnZfkRVMmPgxeTfTEIK1Sd0bLvka2jnj9hYYD8uT/NA
	 EKtaQfgObqp3Li0pMgpbwp27dUzZ0Y4R1wi888kSAvY8yMCDlWqekak9YNNfrWSx/KQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794538509;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ww5MKM6poDK+IczcuuMJkcSdFtjq/phga8CrflKC7U4=;
	b=lHrVvGBpJ/+urQ1xE7PriZzLPtp+q7ccs5Ib598K9lItNNaXVyMy7F21vn1pjZqiFAZ6
	 QyQjgFDhGdzR58h03l5s+7f3UqnO0a0c+44nBDtkJydT8gSZpKp1neuFtcCaR32T8jTY9
	 s8Y3ESCqEBIHahpWh46k98N4dIi8YMhChTLRxRScKuvYXqceWNkiZlWZoQILSluDyvW0u
	 Ox4RuXZ+qn7ktcwToQ4woTTnVU26rkhjYnQTA3BDNwmkvwWKtlV2xp3iAg6JpwmiO02lQ
	 uFCPvR/TaxmOab8/ZvoLZBgR/K+Y86MaJTWEkMTlEsy6qfXwuYvAElWa+OJmxcErU/A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=cfMDacLG;
	arc=fail smtp.remote-ip=74.125.224.44
Received: from mail-yx1-f44.google.com (mail-yx1-f44.google.com [74.125.224.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24CDB606A32E
	for <linux-samsung-soc@vger.kernel.org>; Fri, 13 Nov 2026 02:55:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 24CDB606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=cfMDacLG
Received: by mail-yx1-f44.google.com with SMTP id 956f58d0204a3-6767d92cde6so437792d50.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 12 Nov 2026 18:55:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794538508; cv=none;
        d=google.com; s=arc-20260327;
        b=ETbO9grM9bOAfoyi16KwaflnT3BatFQrbIXw6cUOydq3sbQCqLMP9qheYoH1cmnmuY
         amqD6FV0obolxyxs1Ph+E/lF+1gPaFMAvxvxdAmpbkzqqHb7HOmQPKJ3ifNkyi4MHJKw
         Tc7pNSrLsY40r2mbAjVGUz/W4optruR/5oDnzhAinUPxGW3YHNBdRxlwnSJwJkf3Ddm3
         yElavvZo03+JOpbQf5qDmCeRRcKAHvn2nJgh2ydZyOceHbt4Xm3/VcJWo4b3/yUbeFz0
         yD9JJV/4kMaArF1qQLrdPtCA+xwpaxBxTj/Qo/P3LFSne3Jr354MJC1k6WaPsalUxwuo
         uAWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ww5MKM6poDK+IczcuuMJkcSdFtjq/phga8CrflKC7U4=;
        fh=NCugWX8Bo8seLdNtg/ZKyObeZDWeOhklxRQ5xlJiobE=;
        b=hfNfW0n+SgDVyCn09ZfKU/MAQERQmf80XdsFjr2iKnOnOm+RZGAwiaggo+g801AOna
         7UB5O4BzGTIPnCrz2wd7rpDgovPp3/gwKDia9I1So2P0QoRH7m/lFojTS+vAC8pYgxg/
         J/PHMeGFm1IBeE/ZnGSEiJEM/uGiW4YC4fYGN1L3F8TAULLO6MtWW3vBwT0XlpVegdA5
         tKcQK5S54GECD5dC867tCbGK+atcUBsXXo1nmEkQl/er25yOCMP65JtzphLG34O8SYok
         lQj8rHmjk7JW21B9HYQlcycRN7wyUgrTDNy8Ce7omDX31Op96zUj5YlrLCB2okcQ7CLR
         cotQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794538508; x=1795143308; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ww5MKM6poDK+IczcuuMJkcSdFtjq/phga8CrflKC7U4=;
        b=cfMDacLG8z5L1KijJ6WpfqoVtMnSg7D8XZ5tsiDdz2CqKktuXLlbD7h94kpjdl1/7b
         C9aE2Mt+Vmjn0zOJ228wsa6m/1EYkj4AUAvK4/n1l2fZDAxmemJ4JmrlN72c7nlHGDua
         tkc/zZ81gRVblWv/lVLluemgBz6hCHNVaSc1c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794538508; x=1795143308;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ww5MKM6poDK+IczcuuMJkcSdFtjq/phga8CrflKC7U4=;
        b=pohnc7CLYM8tkDOl9aNGWtvHEgNOztIBP7vs1lV3IgAynK1A8OUPCPnsnZVj4Dcy/n
         aH06KCMaDfz9I8ZxOmNwTG4ZCnSR5rlsnMqpURelGiP8TyY8ccy2ZM8/fe+iGtCqS3/L
         xSdiT+NbEspGKqreomwZjM0+PrgiMeLAr2BllZXHIVecfncSoEy261HRYqj0YrVeVJrZ
         QAxv7zd+pCRjCMea1XkUtzdV6dlbXUFkcdN/ZnTcd5K8hwkpOf/80Eni9bV2fE6K+BWN
         vE5clrPcg498LKW9E6o9DWmAO9UA8LvylljuC7wke7dmpd/aw51zIPw62PduYxixGIXn
         I0yw==
X-Forwarded-Encrypted: i=1; AL+hErEeBZTeZnOvmjhxmB687gJdx08j1Ow7O/QEMh4KvIDL7YJCeJc5dJxXsTFpnrCVeoHsIOpZjV8tZ4bAq6juunIO4Q==@vger.kernel.org
X-Gm-Message-State: APuU4Z9NhfBngmOOKtHDxepNoVXtOhOBcKSvrHCqaaxpeRj2QZdJi7wW
	4+94hzC5DTD9EjlAQexn2QDrjEkgnuZk1Z8lAYEGm/1yPZ5iJOW2ghc5tJeJRsrefWTG7hMpiZ+
	iqWEEcelUXvy/qN+x81S5AlVzSD9X7OcM9fv1zlQGiZGmDPW1QWLjKX0P
X-Gm-Gg: AYBFou2ITSU1qAe240bvauTr/lMaz5P1vRzv6V7fUu3y9whZPutMLdstdASGkc0bTd9
	sYs58S3tQy7tS0qac40OQnEYiQ5vnnLCrHeNtlTTgWVj7loNiaKos/Dh8bg137GXdE5AHwIhfcv
	4WlOsPbupwNlQWPGQBrR/P8sBnF6oh+USAoE4OuD8voZH8wvUURy2GHx8uvknhthNgDp+Iiup4+
	SnE+E9+WPixyhOR0ITP8NYLmn5VURGqA2ShwXgmYezKHslod8sz5Jl1M7icaADxyaEDWvyodWpq
	duv8WpJ/3yufWUxR2/8qIdiU+irpOgOFgafgWqPFwyJXoymXdsWD9yQcW+KeahjrIa+B5eZGu6H
	9ZaNGxPK2tvIM5fEO5uMpzkbTkwIXr+nFGIy73Q==
X-Received: by 2002:a53:d5c2:0:b0:67c:7317:de93 with SMTP id
 956f58d0204a3-67d8976bb2cmr676238d50.91.1794538508154; Thu, 12 Nov 2026
 18:55:08 -0800 (PST)
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Post: <mailto:linux-samsung-soc@vger.kernel.org>
List-Help: <mailto:linux-samsung-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-samsung-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261026214359.3122870-1-briannorris@chromium.org>
 <20261026144346.2.Ib692ddd35c1dbea1757d9b1db6c1c7e938fc4ea6@changeid>
 <20261028-rapid-daffodil-rat-0adc6a@quoll> <aulIoq2oVjJ3DVzL@google.com>
 <d4a430de-715a-4936-8adb-35ff57a52b5f@kernel.org> <avZkfg6WMlMzOxpn@google.com>
In-Reply-To: <avZkfg6WMlMzOxpn@google.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 13 Nov 2026 11:54:56 +0900
X-Gm-Features: AclHuK-84j9IBFkhrVUuvk8buFltZEjB8ro1aPwuBHaC_xvB0gZrSc9m2OIxmfE
Message-ID: <CAGXv+5G5z75HGP8nv_i_nwEeSd3qkvyL_h_MYzV_XPT9BpR4jg@mail.gmail.com>
Subject: Re: [PATCH 2/9] dt-bindings: soc: google: Add Google Tensor CPM binding
To: Brian Norris <briannorris@chromium.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Thomas Gleixner <tglx@kernel.org>, 
	Ulf Hansson <ulfh@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Peter Griffin <peter.griffin@linaro.org>, devicetree@vger.kernel.org, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	linux-samsung-soc@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Radu Rendec <radu@rendec.net>, 
	linux-arm-kernel@lists.infradead.org, 
	Mariano Marciello <mmarciello@google.com>, Douglas Anderson <dianders@chromium.org>, linux-clk@vger.kernel.org, 
	=?UTF-8?Q?Jakub_G=C5=82owacki?= <jglow@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 13, 2026 at 11:48=E2=80=AFAM Brian Norris <briannorris@chromium=
.org> wrote:

[...]

> If I do keep these as literal firmware IDs: does that mean you'd prefer
> these not be in dt-bindings/? Many of them (especially the IRQ IDs
> you're pointing at) are not needed at all in the kernel side; they serve
> more as naming documentation than anything else. I can just inline them
> into the DTS. But I'd prefer having macro names for LPCM IDs and
> similar, as it vastly helps DTS readability.

I think Krzysztof said as much when we added macros for MediaTek pinctrl
numbers. They are just symbolic names for easier reference. OTOH a binding
is a contract between the device tree and the software implementation.
And if it's not a binding, then it doesn't belong in the bindings directory=
.

What MediaTek did was put the header files together with the .dts files.

Hope that helps.


ChenYu
