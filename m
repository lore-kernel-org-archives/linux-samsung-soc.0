Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795640759;
	b=irfNozIoMTicQ0DdtCREdZEwMjNC7isODOq+95UYj816jUoL1eRvehIWu8MJM6NqA6be
	 /zngnsW6UR6djTGUuu0dYJuMb/g0c8v3BvTiqdTOxckkhmNnr/PgA3PRDnus0KqIBHieD
	 2g2ml/lGlBKu2NAYO70hly1PHpY4vKFoe/2W5AyZC1Wa9U7JseUi7htPPP6JA6d44R6bo
	 vaLlrxyV5pqyGbUot1aALGnnXp1xtpmtnLOAs4TIuv+SyTgYcFyhIjLipYRfyXBZkXHe9
	 /RHOGECppZOu9JaxYbl4Y7N8pqx9fHomLOvaNyYpQNwczxDmAVsO8PeIKzWbcrPLVQw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795640759;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=dSeXJ7oyyRlT3okyd/7XIjlnYjM82bm2rpl4PLf1CEo=;
	b=kDYNxbwxvTQaBdH3MSok2iAp4eaK6wOsmkfzi/CG+ks4phcdTYm29DkdDiQtuLU2X/+W
	 MsnOXZfLQrL/pD6FhCAb08qyRFI9yQwseW2hbwTr0fxvP3ymx7jgha593qAZoAvoeULOC
	 8Pa/jS6F6EVgazKhUhc5T1gSBPD9ayaYNIxOjKiXEQ0VpOkThzzA4Bpu0Z+nApoSPa4XI
	 cHTtRiQHBowD+UoZ0vyzxIUKLgRtx7nf36upRw+qmu22w+VH9rP+ueDjaovTwR6qMECFM
	 tliuWaOctrQueCsj9lsP2YC0n5RWUcvdSTVatiEktk0Zn7zXYzG5a8pCxzXOkaqXOpg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=PA1pgPBf;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.46
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 928EC606A323
	for <linux-samsung-soc@vger.kernel.org>; Wed, 25 Nov 2026 21:05:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 928EC606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=PA1pgPBf
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6b88bc47e23so8083442a12.2
        for <linux-samsung-soc@vger.kernel.org>; Wed, 25 Nov 2026 13:05:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795640758; cv=none;
        d=google.com; s=arc-20260327;
        b=nbKE6fLKCiFDvChKlmmTyaI3E3SYJTaPIP8+1a3/hEtgh7DtiqTS3mwFLtHmecEY64
         LqbVw652xZ33eAXPEzbJdt5/3wx9dnxd6Kuk3mnjXG0+B4+i4aU1HBFO5YBryiQhd6Dz
         rHi2cW6hbEGqC3acECK+oD6p4iy9OlqWfMnjA+ZVFwneE5RyGiuk53EqvQjPCxXK1TyI
         Ghm2wf8YMek2awIUdwZIkZxcGvegknkOk6Rgl3f9wGqUEAyJ80o+Cn4qcd0MGwbz4T+U
         OxiH5VgZ5WcoeSTAtUKKCwE+6IsDzBG+9ONdl/MTBm8ZqhS/O8t+yIJdd8bsLi0IQKwg
         t1gA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=dSeXJ7oyyRlT3okyd/7XIjlnYjM82bm2rpl4PLf1CEo=;
        fh=KnZtI9009zKsW6XZ14sfEHDL2/oYFYSKsMPSOAj5Q5g=;
        b=ZnfusVGfyzZ7Vc/FdWcbVz24JwfOCQLyB0G6pi6MsJQMbK1dS99FMda681xWyBBNnD
         RUENvb93zUlHvK7JQAPrwEsGCfU8C3xHKiZFc22xxV+7LQkLkwGF2Sk5ESUFkU9STjTz
         OKE2QhCr/UcvHMQxpzin9MpeMtxp2jlrJZC0k+Xq8m2lA2Ydsrp7byRfr6AkvdNMZJ8m
         MMcdrTUs8tgVssPm4Qcou53nkt2hiLrWmf8CaTvKmDI6b7vR8lllWep3DSLfzrNLuoK2
         TKLDKSmDrCi2OhZYdfWAklY0AAT7LZwbPpjv/E9s2Ngei5NU1vHAO7GgT852Rj634mXP
         /pvw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795640758; x=1796245558; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dSeXJ7oyyRlT3okyd/7XIjlnYjM82bm2rpl4PLf1CEo=;
        b=PA1pgPBfLfbt9zwaq5zXPh6ZOA//AEDlj9969vrlEEaQeYK/5q22qz0mfDe8mGmWDW
         N2Zd4zr3xTt/KUPNYGQKXxIaHzPmbZQnxhcw+0NUB0mRDDGmHHBCbN974AQutXrQPqbq
         GpsG4UdlDi56w35yIiKPcOVUwVZKmvEJws3ox09pLPs7l6r57nyINfJp0rKECsD2psfq
         WCTylE8F5GFGWoe5O1QU0onydS1zMLs6WP1hlyn5KlLAewxzLYFBKsnQMxIcSvxQAZkT
         D401sJE5RTtECj/4Tw1RXgzkTeMNdBrw0weMQtHx0FMADxSdNmviIyb9n0DSuqv0NgFB
         7SCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795640758; x=1796245558;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=dSeXJ7oyyRlT3okyd/7XIjlnYjM82bm2rpl4PLf1CEo=;
        b=rSOtzBXKvSwkV7/dWapNOAX1i5ZDox3Ef8C2EKXJzGNZ8Qw3MEVA7zu6rqmwUzU1U7
         v2tLijdwg9n1P1qyAj8J/GyQOlqoK2WIo5VD7R84DU0FMjltE+Waz4/pMWjYOcomZd1o
         JoSsO1oX/QM0XCJ69313bPq9oDxATxwD6r7zVJkF3RAQA7IwnKZb6e21VEIkU9fe8T9Z
         gd2k+PL09PjA8MpbGaZow8UObWJWllRDjtXYmm2pDZflQDXnWAbESSRm4eIxF85xWIrF
         eM5FeYw4F771nCIYdNCrTnBju99jq0cG/COywcgfW1KyVDfZSJ2YOK0dmgGwx2HkiXZY
         6Jcw==
X-Forwarded-Encrypted: i=1; AL+hErHRk5/ADmVo1XZ9pMF/0lo4wmIi3CdpCr4U47gpWdwRkkz50L3USYHjN6ExH2PPPF8Md9BJnBDf+vBYrHgB8O6+fA==@vger.kernel.org
X-Gm-Message-State: APuU4Z8xV1bmgW/Pce9I7MINedBHCSWDRSu0ML0MM8VrHmnqK00bxdWv
	04WqbF3J9GVYtg4TWGbhluPlZAa3/GbHRIY+nH7cIIMTUSLxbPpZHkyo/DX+dR0/38iCzggpTcR
	xp2dhvZNCjjSGgvcgs57ACitfxA/rDP0ernhjlwtdtw==
X-Gm-Gg: AZFdTZcUf4a5Mo+AaZilFFZYmbUFZm+Urjthg5d0N8QPtoUkj89RXuoiIOKJzW8Zh+n
	IaGalP5ohDcOlLh4aTd6YftEqjVO/0Pa5tN91kcmEiugNYSQmVy/sBnXZ9aj60xpHrujTgzGAXi
	gHnzbmTMivCXqgQAf00HGyexQkaoKfDYDmF/J0exIzHialJByr1YwxASF1b7M7WoP7S4fLRiHYm
	bJPAKk/iKu/Peifp0kheqjAPyejmTqYVyx2LbRWJp54rn9t6GNxnKmrwbI+Bqyfa1Rne+5+gDsI
	zj6G+WR9wWB4ri+0khoFGjxUgCiv4oNxUklPUs88T7Zfnw1IyUBdcmglxes/YJ0r2Mwv6MDk+45
	OADmuQ4/lr+bLP8sx5D4fYukRP3K3N4dxa7NwKE50b3b91JWzmTvIB9Gmc53fdUi38QNXnFjinA
	+GZUzWAbjOJDM4ENR1
X-Received: by 2002:a05:6402:4001:b0:6b7:a357:3761 with SMTP id
 4fb4d7f45d1cf-6ba37ec0a9fmr13838958a12.31.1795640757962; Wed, 25 Nov 2026
 13:05:57 -0800 (PST)
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Post: <mailto:linux-samsung-soc@vger.kernel.org>
List-Help: <mailto:linux-samsung-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-samsung-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261123-exynos-acpm-put-v1-1-447097ce7998@gmail.com>
In-Reply-To: <20261123-exynos-acpm-put-v1-1-447097ce7998@gmail.com>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Wed, 25 Nov 2026 21:05:46 +0000
X-Gm-Features: Aa3M54rbIT4J1-0YxOX9tYrRiTVNsMtDy-V7qgEQnJNyRP6bSfPW5CTnV1B_MM4
Message-ID: <CADrjBPpxf+Df69LouGTOq4Qm4HA9HAyoKzW2Gz-zG8Hcty=bog@mail.gmail.com>
Subject: Re: [PATCH] firmware: samsung: acpm: Don't use pdev after putting it
 in acpm_get_by_node()
To: shyckless@gmail.com
Cc: tudor.ambarus@linaro.org, krzk@kernel.org, alim.akhtar@samsung.com, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 23 Nov 2026 at 00:46, Suyuan Wang via B4 Relay
<devnull+shyckless.gmail.com@kernel.org> wrote:
>
> From: Suyuan Wang <stevewong@hust.edu.cn>
>
> When device_link_add() fails, acpm_get_by_node() drops the reference to
> the ACPM platform device and only then reads its driver to drop the
> module reference:
>
>         platform_device_put(pdev);
>         module_put(pdev->dev.driver->owner);
>
> The reference from of_find_device_by_node() is what keeps pdev around
> here, so pdev must not be used after the put.
>
> Drop the module reference before the device reference, as
> acpm_handle_put() already does.
>
> Found with a static analysis tool and checked by hand.
>
> Fixes: a88927b534ba ("firmware: add Exynos ACPM protocol driver")
> Cc: stable@vger.kernel.org
> Co-developed-by: Kaixuan Li <kaixuan.li@ntu.edu.sg>
> Signed-off-by: Kaixuan Li <kaixuan.li@ntu.edu.sg>
> Signed-off-by: Suyuan Wang <stevewong@hust.edu.cn>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

> Compile tested on arm64 (W=1). I don't have the hardware.
> ---
>  drivers/firmware/samsung/exynos-acpm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/firmware/samsung/exynos-acpm.c b/drivers/firmware/samsung/exynos-acpm.c
> index a575caf871b9..15d2f708b0c7 100644
> --- a/drivers/firmware/samsung/exynos-acpm.c
> +++ b/drivers/firmware/samsung/exynos-acpm.c
> @@ -816,8 +816,8 @@ static struct acpm_handle *acpm_get_by_node(struct device *dev,
>                 dev_err(&pdev->dev,
>                         "Failed to create device link to consumer %s.\n",
>                         dev_name(dev));
> -               platform_device_put(pdev);
>                 module_put(pdev->dev.driver->owner);
> +               platform_device_put(pdev);
>                 return ERR_PTR(-EINVAL);
>         }
>
>
>
>
>
