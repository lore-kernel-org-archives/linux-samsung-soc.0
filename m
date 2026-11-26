Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=74.125.224.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1795684585;
	b=h3EzMzjpHTmoxZrzJxRUwt8LU+XvJEx4CVye9nmRQjBYANuhZg2UdpvgIKHcejvojObj
	 PpjLPMpIiGsQovCzN3ZBuHnafVCekBVwbm6LG+hTRly+RXkwVl5CX+HXOqsJY6E4ayxmk
	 d2TAK2HzMhJ1fh7s0P1uVd9ySDcuNwWRBbQps7XoUqebyNz6RY08ZmPoMiw3qfrK5d/9g
	 3Hgpz2FPPiznf4C661iV3wy6wKqHcuErwy7lBuCcMPrQLg3EE9xdVcKyWp1qtusthOfMe
	 fV8Mxd97dhGaHXbRolQKxhPt6KPqZkzeoH5Km0TUx9aEH2lzwKlg2Cl4YARKPpBARkA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795684585;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=cUJZDK31n7zFs+s22yN6q0y+x1kfc7+yGU2a56nUZn8=;
	b=XX00hMRuistp+5oLilt3eoHD6H6xzgREgQV1vYFcvDDJTOm7j/iNwoOwRUaGmvQfJwjt
	 W53SPJDN5gaowB+nizuwuGz6kNuzOMoBkv3oE5BHOiS/rnSovPLZNA0cPCoDGNTQwCgdC
	 kJXhiLdvb58YEgKkcPpvSCw8nygfU3HdSdLV/waI7G85PydFbb59W/rzzUEwcdQEuMMEc
	 1DFkN+J1Ti6ciyYoQbFPMw1TsLZIYHairGUqU2dHgc5YxYeSaJtSQ/xVlg+41RvlncM7H
	 fHdLy70Vsn3EhGddWdMvH9RCHKbX0gLK2u8ZiML5Dkb4dHDGr4BCTbmBpNOII5+XJHQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=hFYONj0x;
	arc=fail smtp.remote-ip=74.125.224.48
Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FDD3606A32A
	for <linux-samsung-soc@vger.kernel.org>; Thu, 26 Nov 2026 09:16:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7FDD3606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=hFYONj0x
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-67df3b1ca06so7582605d50.2
        for <linux-samsung-soc@vger.kernel.org>; Thu, 26 Nov 2026 01:16:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795684584; cv=none;
        d=google.com; s=arc-20260327;
        b=n/W2xsfz7WjKFM9nJLuUmp6FXFyheoaM52XCwWb9byFa+UaR8t2a+E9W0cQN2av8eO
         TZgdBA+MVPiBgdUTOIMmfQRB5MJEWTUWd5siqd9FkYJzUdk9epkkByVk/efxOJxlGrrX
         mM1KYj9n9fwm2aZ8kwvV3gq08I7pBRp5qUVCgPugGdD/rxLwpTh+mW0RszRc3+cbMFA7
         FgHXI0sBeZuytRxyzm/Q0TQqCDoDm3Sl6qp+se9NDDcfueOhNjnfxced48zbNebxaAgH
         zmhUIjQ31CbYqIM8Brh2nPWk9lgCLxdDq53opEF8tGUe+fipuv1xEON8XXeLMTQ5M9/0
         A79w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cUJZDK31n7zFs+s22yN6q0y+x1kfc7+yGU2a56nUZn8=;
        fh=la6njSwGEB8h4U/9fiufGTcJ2qMDgdAofT5u6DOd8K8=;
        b=hZxas66mmahHai7oDkudjWvx4OBIGYvLPltLm/UQ5AP4v9XzoBh21h19jhSeeOiN14
         AHaWb0xBD8yQlh64msIqIjJq27qXHNIiJKyhDB0Z9RpL5K5fnl2+HHExqSQ0GfQzvbOI
         yBRn2KZzcomcCQJl6CzcZRW9hOt0QG66orjHAFKRsPQ44OPXYsFQIZyDjQgEG3kLn6Tz
         1MVSC9NTiR0m0vjNV9THOWebWxcFu12ZEg/4XjhAI2YlP9ZEf4TNTmXXie51Bc/9nBoe
         dz5/K0ayFwulj3b4BhbM1kmJ4hzL+kVbcY9L28S+bocJQR54sMabsdb89mDmUQdGqJmT
         iGaw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795684584; x=1796289384; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cUJZDK31n7zFs+s22yN6q0y+x1kfc7+yGU2a56nUZn8=;
        b=hFYONj0xYexZaamq2sunUDm/UTfjTNiZjKCQorNUNgZRJwnLLZXapTsaBeO2GAFnZb
         zPPdY4XC/OMLH8rNbiIlTQtekNHzydHT4/PlZufQOP7TNWDLHwtkL0sBiFyK2iTHuGMp
         sOrxHx15DRwLzxSTTZM9JUE+gFIcgJjveupwiZOfZ4q6i5r4/OKqApNSBe8gKBME9a06
         Bg+nGVThkcrSoY2lqQS5kEllRnEac1hsdkg241exiIJgMH0tBpIx37NmFEaXgyc7PUoy
         xLnnr1wu7FCYI2+k5bSS1fbHYZg22zeLye1FfbFea0e4j3bgH6Q/x42Cr1gHy0NQp+wW
         coSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795684584; x=1796289384;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cUJZDK31n7zFs+s22yN6q0y+x1kfc7+yGU2a56nUZn8=;
        b=smSmo+S/73efnsXTHjZDnzYQZUpbyni7cVomBvuJM26r+9B6TboQLe8l8P/BqVDVn7
         KMR1IYV4f4tkhd2uqtRtDxbrw25PsSpxoVZIXirhzR2SqJ9Aa/DrfsGrgvEvXKYygLIf
         PczBgzeyiOf0bj057WPQYjeASpYBmFzKrm4xPIfF+LPR8rAm2NRVfIx9H+Opm3Pkh/Kc
         eTn+emuTCiwZskjHy/q3ibnqFBdgl2uWOKif7H33O6o9txURd+3XGizpa2lVy574OQ3m
         Ws2/yiuYKFV7gIeuq1+DLehQ8TScXzcpd1FZtu3b0bwsl0b6xNqx6R4S24T8T8bADnGi
         0Gfg==
X-Forwarded-Encrypted: i=1; AL+hErERoQhyQB8dTU7uIbA5gAN+M/uD7dLbn5m4JavbnRVXr3XRpbBx1nOhfdR4x+It1Vzt+7eCcBTO1tp8uQaftNK2WQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z/uO7PZkQia67c/ChURxD38N9WbY1wWfL+0ulVVhkWQVBrSKyJS
	4MdIiaXyETHCfH/FvXKosKBf80QFLkM9kDVSXehoNsHp5GwGY2ZvH19x7PzEHakqg7mFagw/YzF
	iZHvCLiGoluVzC/vrbI99Im34zsAl60WovM7IWQ5pIsfpxleOTXPE+Lo9bA==
X-Gm-Gg: AZFdTZdddl9HtOfXjVL/yDiZrfefiNbByO5IhpVzTbAf1eqEd1wzc3OqSZqAgMsKE+k
	3weq2YUG+2cbFxRztZmrKUKiMK6IoQxOR3tZF3mZlQJ6xQEqvEZF020dmMHhHtX9tcJfMB2hCue
	97AXwuy7bEkAIfgbKUk0/+y1sBT93pyWqUQyCA4iVcVnoz1881j0Syh8h/iOOKe8d/lj998nX/5
	en8Mbw/TZjwhfq69cGyln0fanSW87We1EOY2cOLeaqEquayRQ72F4GQyiC92pEwRmN7oeKE6ftW
	zGBjI/EXbGZA5mhok3L/9NnVhAFLAyJHO50K6WWjGNTGUKNF1b1MOUY1nBT6FDMcqmRxxO3XU2P
	TcXjB0cWuxXKPUsjjF1IgAnfcjYReAswAzQneB0BuU0475gGC4tE37tdAfMvbL7g3T3b6DP+Iru
	/IQ+qMNFKCN+vWXSNGFE7pJPiODrRMd1Q5UWvFFg5v7NhQZbgvQH2WhQ==
X-Received: by 2002:a05:690e:488f:20b0:67b:9a55:3382 with SMTP id
 956f58d0204a3-67df44234cdmr5458079d50.56.1795684584430; Thu, 26 Nov 2026
 01:16:24 -0800 (PST)
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Post: <mailto:linux-samsung-soc@vger.kernel.org>
List-Help: <mailto:linux-samsung-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-samsung-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261125173959.2198116-1-christian.loehle@arm.com>
In-Reply-To: <20261125173959.2198116-1-christian.loehle@arm.com>
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Thu, 26 Nov 2026 09:16:13 +0000
X-Gm-Features: Aa3M54off6JG0Kmgay-bdN_pEa9OIyVQc31_D2hlclQNH4bipvJaCJ6xGjh3oRQ
Message-ID: <CANgGJDp02H7-wLv6DoaPMeiy4UvDUC2nvSR=+mngEZ+Z4Hqgog@mail.gmail.com>
Subject: Re: [PATCHv3] thermal/drivers/samsung/acpm-tmu: Fix spurious CPU throttling
To: Christian Loehle <christian.loehle@arm.com>, tudor.ambarus@linaro.org
Cc: bzolnier@gmail.com, krzk@kernel.org, rafael@kernel.org, 
	daniel.lezcano@kernel.org, lukasz.luba@arm.com, linux-kernel@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Christian, Tudor,

On Wed, 25 Nov 2026 at 17:40, Christian Loehle <christian.loehle@arm.com> w=
rote:
>
> acpm_tmu_set_trips() supplies two thresholds, but the ACPM command writes
> all eight slots, zero-filling the rest. On GS101, slot 7 limits CPU clock=
s
> independently of its interrupt mask. Setting it to 0 C limits all three
> clusters to about 200 MHz while cpufreq reports the requested frequencies=
.
> This was found through trial and error while tracking EAS regressions.

Cpufreq reports the requested frequencies =E2=80=94 are these cached values
being reported?
Or is this what the kernel gets via the ACPM call?

> Program slot 7 from the lowest active hot trip so hardware throttling can
> precede the critical trip's system shutdown. Cache the low/high window an=
d
> update the hot limit from set_trip_temp(), because the thermal core skips
> set_trips() when that window is unchanged.

FWIW, Exynos850 control register for TMU has bits to enabled/disable
such behaviour (and it probably works).
Maybe gs101 also has it.
But it seems that cpufreq scaling feature itself is explicitly enabled.

[...]

Best regards,
Alexey
