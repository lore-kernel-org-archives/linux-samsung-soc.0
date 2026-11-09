Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794203056;
	b=wzuW7gu3vtEgQyaFApLeRAmriBzJdEwY3NSaHUIyihpY1P2Re9ZxF53SioDXJuhbOhVe
	 cUGLrEEQ53mlUlzzM8wDw/D8ELrIbwDMY96TaM9e7v6HkcayYeJXROHwdMsKJnfiFfwz7
	 3sXXG2vCB76Qdb2LUyjNnDIR8p5ayJmTmaD55/4iotI5CsMUYucIosptjSNSadLuiIHNk
	 fvztLZ0EoyGG8N8p/caU/eDXU/vOqc2pQ9AlmiDic7FV2vEd1bmkskFx8hJaG5QXXsaUJ
	 hQzZCDPonqoFYdXCPyeguNPgwVakfC+8iSUaQWmOQfC2XgkWAMoVjg2Wm6z0EwNN2pQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794203056;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=GaHnyYDJUGL+w/bA52PUwEBtFj3m3UWp7S/56d6GX2s=;
	b=CklkxnqlXA09OnicuA9zrtawcqYAsTM/zYHPrzRp879vmSJe0dxjlPg4un/bgrfqt7b8
	 1QNM3CZzZZgDecbmOeNDu5k1khFfI2rHjuC0xxT/J6DbQE9f49NX3k+FoB8SpUBdA1rPq
	 oAISXBNwUZjpfrq+fe6d8aec1LhDxMq91wj9o1HEIV3Q4HGhOQyTxTxHQS8MR4ZxFVsOm
	 9grBqs/RZgflGj5Q4+UrR/b5K4YK5ZMVQ2v7aVoqTwp9b8f7JQVBzoLHfzTPBUFHMvwx5
	 ruzy6KN4IwkssLqjBlFvthXvLBC/ZyK2+tmWb6VD4sX6qbaJ1vrIxIntWkbVFa1Z8yg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zjYECXCa;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.42
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A02D606A321
	for <linux-samsung-soc@vger.kernel.org>; Mon,  9 Nov 2026 05:44:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9A02D606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zjYECXCa
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6b429f71dbeso486247a12.1
        for <linux-samsung-soc@vger.kernel.org>; Sun, 08 Nov 2026 21:44:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794203054; cv=none;
        d=google.com; s=arc-20260327;
        b=ey18YqxGCNtChdtDxk0o6sz7wKKM5yF1jS1eKtoKpMb8N9FugO/quwSR+f/jzAhU1Z
         wnoumv0kudSVRGHQ/U3bnZrdjaL9lq9GbnmVxgGWoSumJ18DjxWURHw1wQKnNa+5AEWX
         NBF8eiTeMeLhLS7la6SLY6VPdD0k2owqBxWeVEi+fc7NYrmlq/d8IpjU42o5RwnNNAS+
         HbwiGmbVOH2epM7qny56akNxFS97k+3wI8rdGA3Aq5QzkTjto0tTylOX/5H0oZ27VDV/
         i2ePi/NZSZ1fz9KNfKiuMgcoWsHWayxoND9cPRL+YC9YFJc2L49vwi1U84URZd84FARK
         oDqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GaHnyYDJUGL+w/bA52PUwEBtFj3m3UWp7S/56d6GX2s=;
        fh=cLqjPUas3ClQbScoThnItToceIHmSgZRohiSS6+F20Y=;
        b=Gd+iCKeVl+LYSo15Wn4fP21tEP5ehMkA/6XvUVW7sPr7r5H6iMPZTkowOymT3QCyAX
         6iSC/mJiXNoowhTcwQTkGfvJe0dAfamr5vsB3fYtwRtipRPyRQnRm4zGMxk9rxX2Vpys
         qH+KXuTsUoNDqvotm9+dJW8aAlZrfvt+Hhj6ntf0uebYvunpaZTuWCGjwzRMii32fprq
         wvtfpdDjlxp81AwZiO0myuY2+EitYIq2I2xiOXMNs+tQq/kLRAzH00SF1wFW3PP1ERUP
         u/de5LxuIcLuV4LKCjF9jK/lIKdgGcFZH0ZecpVe2gAyQ10OAa1My83o5OcwKgZh6Eql
         houA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794203054; x=1794807854; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GaHnyYDJUGL+w/bA52PUwEBtFj3m3UWp7S/56d6GX2s=;
        b=zjYECXCacixsKh4w1x/IPCowGrIdbqDiKWl2+tgp3A1ou3pVOqCMYSuCYg8OYhAx5S
         fN57ox4JIHVBxhOKf2z1yn1W6QUrXIgsqAq7wkFYFWhtB5rj3Wq9RRs89R/Fup+I+s9z
         PAqnbFngiu+8AxW4buU4r9AEU/qlp+6oNj4mY3I1DVE/Z6Gd0IknaQ7K0bO2nRx18ZJH
         T8J1mk9V9KnlusHFFd796YDpkDWXfLut8MXRT6L6U+OyvzmK1zCHvhilgW7KTs7lnPh0
         jHKZL9ZQgO6r8QI/D/oP1gJfbsjMbtE/AaFxJlIjzLcc03aq21W0/+TF8plrn+zoOKOU
         REdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794203054; x=1794807854;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GaHnyYDJUGL+w/bA52PUwEBtFj3m3UWp7S/56d6GX2s=;
        b=YBdPiXdxLN1fc7cdja9u+APYU1vGT/qqCRirdIi04HIFYOMbLzpqKOeknQ2RX6crte
         jyBKsyJifbu1ubCEjOUMLlBrvPDrqiLG03KsjnLcMTqBuDW4iJPXB9U9gHJv75UJkEan
         JltC9dn/FB2IMU1Go6Jcl3wnVd2aknUZAvXC0kZCSvnzSO1ZWh7WhMNNW/WmuPR+vjgv
         s3PdYbVt1+ENYQnYc61lFDHhp4fm8bLwbO5ERmJbDoM9SJ9m/51ub2AaCSQmWGlTVxOA
         QIdAQI/9BF9RJrft8R6RxdqWaVPX+g7fYy3j50PWZ6pVmSCwZYujO4EEGF54m6plbtKQ
         MBoQ==
X-Forwarded-Encrypted: i=1; AL+hErEc2GkkA8NAC7W3OZWiQuxvD7McrNbrfzP29vxL7IyCChJfkkoP3ENIwzLhyrRJyblsLxEHQff3cwqrt4EqTDgw4Q==@vger.kernel.org
X-Gm-Message-State: APuU4Z9Y8XLdrB8rbHtjUSYlglThDdwZMsKZms/Yhl/6qKW89823pWVl
	2dP+0KvFkX6J0plquZoeQYmYH15iNpVWrAcgkgVYKQvcPn2j5VohCZ6sAj8liQmH/tvEqyFL+3V
	x6qxtC1Ysk+9Y2HDC7ReewiiTEjz1pr0=
X-Gm-Gg: AYBFou1BScljgKb7/BgPP2E2FsKGy14M1CLf7Y6bpPQQS23rw3w792ts39deatUe7kL
	WXiv0romxIp3rSQm7ZQ7flF9WK6asOE0JEYABDr0fxeR4uIVcSrcUH68VY2J6ZPm/QxiMgHtz21
	WZ3Ul7gL4F8RUsczP36J99ErgQ/Dfs47fuJso+fVOCBuYSB8WFEfV+cSgFu7g1y5VjzyxMV9Nzy
	uLDuuN1mHk5OAGG9G5SgQ6q+4YwOhAc66rC+MoFjgfbdUlkZwQVRXtpmZVgCQoZZCi2zzaaqB4X
	Avk6c/7vK4lk7X9iAvx64HKrU6TKRqtRAftJ8KnT5mMkuKkG7RVXLJFRyeQf40dKAIzKhTuNUUK
	USUf3yqJtdvJCwvw1AK/RsCdCFqWI7LaZWniApbfRr6NNf53cvA8omGbfbDPCvwB8+yOWXkYGM2
	i1IMfXjWRlMiCN
X-Received: by 2002:a05:6402:1950:b0:6b6:ef7f:600d with SMTP id
 4fb4d7f45d1cf-6b722450928mr1861820a12.21.1794203053889; Sun, 08 Nov 2026
 21:44:13 -0800 (PST)
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Post: <mailto:linux-samsung-soc@vger.kernel.org>
List-Help: <mailto:linux-samsung-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-samsung-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260916072012.1967169-1-vulab@iscas.ac.cn> <rc-review-20261105-14-00955ac4adbd@gmail.com>
In-Reply-To: <rc-review-20261105-14-00955ac4adbd@gmail.com>
From: Inki Dae <daeinki@gmail.com>
Date: Mon, 9 Nov 2026 14:43:36 +0900
X-Gm-Features: AclHuK-P9ELAlBzpu3kDklHAW6kBOMQIDNRsiWYypfDAoEI-hiru14eAfArO-Rw
Message-ID: <CAAQKjZP_djWPUxr+B8jH_m_=MAPFcWmxst7fR727uNbP59xagw@mail.gmail.com>
Subject: Re: [PATCH] drm/exynos: dpi: release the node after looking up the panel
To: Yige Jiang <yigejiang86@gmail.com>
Cc: dri-devel@lists.freedesktop.org, Seung-Woo Kim <sw0312.kim@samsung.com>, 
	Kyungmin Park <kyungmin.park@samsung.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Wentao Liang <vulab@iscas.ac.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

2026=EB=85=84 11=EC=9B=94 5=EC=9D=BC (=EB=AA=A9) =EC=98=A4=ED=9B=84 5:07, Y=
ige Jiang <yigejiang86@gmail.com>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> exynos_dpi_parse_dt() acquires the remote panel node. The posted
> display-timings fix releases it on that branch, but the panel lookup
> path still retains it on success and failure, including deferred
> probe. of_drm_find_panel() does not consume the node reference.
>
> Put the node immediately after the lookup and clear the unused
> pointer. This covers both lookup outcomes while leaving the
> separate panel reference and its existing remove-time put unchanged.
>
> Fixes: 14b6873a0198 ("drm/exynos: restore parallel output interface suppo=
rt")
> Link: https://patchwork.kernel.org/series/1166158/
> Signed-off-by: Yige Jiang <yigejiang86@gmail.com>
> ---
> Based on linux-next next-20261102 (2637bdec0535).
> Compile-tested: arm64, GCC 14.2.0, W=3D1, CONFIG_OF_DYNAMIC=3Dy.
> COMPILE_TEST=3Dy.
> Baseline and patched target objects built from this exact base.
> No full kernel/module-link, hardware or runtime test was performed.
> AI assistance was used for analysis and patch preparation.
>
> This is an incremental patch based on the following posted fixes:
>   [PATCH 10/20] drm/exynos: dpi: Fix OF node leak in exynos_dpi_parse_dt(=
)
>   <20260916072012.1967169-1-vulab@iscas.ac.cn>
>
>  drivers/gpu/drm/exynos/exynos_drm_dpi.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_dpi.c b/drivers/gpu/drm/ex=
ynos/exynos_drm_dpi.c
> index 92e8bbe9d35b..e98a9be0a705 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_dpi.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_dpi.c
> @@ -243,6 +243,8 @@ struct drm_encoder *exynos_dpi_probe(struct device *d=
ev)
>
>         if (ctx->panel_node) {
>                 ctx->panel =3D of_drm_find_panel(ctx->panel_node);
> +               of_node_put(ctx->panel_node);
> +               ctx->panel_node =3D NULL;


A patch covering this same of_node_put() change in exynos_dpi_probe()
was posted earlier by Wentao Liang[1].

[1] https://lore-kernel.gnuweeb.org/linux-arm-kernel/a46a7710-0c2f-4fd3-911=
6-7678adca9390@kernel.org/T/

Thanks,
Inki Dae

>                 if (IS_ERR(ctx->panel))
>                         return ERR_CAST(ctx->panel);
>         }
>
> base-commit: 2637bdec0535a2044cd830eba9a79363651d9043
> prerequisite-patch-id: 8f90819fd9f71f55560dc3af57c5a0bad07bc568
>
