Received: from mail-ed2-f35.google.com (mail-ed2-f35.google.com [74.125.228.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D43F488D8D
	for <linux-samsung-soc@vger.kernel.org>; Fri,  2 Oct 2026 11:25:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.99
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790940303; cv=pass; b=Um5DDCKGlPy5urLkX1gT/LxK8I8fGSo7Pc8WYBhKG3SuHCBAs4eCcB0RTjcO9HsTOQaaoi37C9SsiSUqnOhkKEUecHxwsR8BRGTNs/2iIMj4cg3gGyWVWhPEk3B0otNdl+kvuZJLbkdRG+hBn/HhufrFcY71tZZsqXEKL3Hf0oI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790940303; c=relaxed/simple;
	bh=keMbtcyNVQxdC0ctP+ZhAmBIOPGSUadXPIE/fKO00rU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uLaF81i2Uh2LnAMvXvqCRj4sQjmIoKyLa/hALKKkZqI44weuXM7Nq2xClcUd1sDLpLgUo11P2YhMbPLP7YbVxSFoEnIkA6H6afGS4RoK38RfCpeSwSKB5aGM8mclGEQlKTL4SA/6wNXPXMJfNmrEYSt4JhjgcfBe7pAYrn1lFJQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=efqCTgDg; arc=pass smtp.client-ip=74.125.228.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="efqCTgDg"
Received: by mail-ed2-f35.google.com with SMTP id 4fb4d7f45d1cf-6a605c198fdso11884355a12.2
        for <linux-samsung-soc@vger.kernel.org>; Fri, 02 Oct 2026 04:25:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790940300; cv=none;
        d=google.com; s=arc-20260327;
        b=NKZoCkk0qx7JmFzGxsL3FAmXfEnScA8fwsySavEycq5Pys/3mIRWWmJlqPeZWUwL49
         hqRlujG0ssN9xyZomSAZgD6s0V3Z/6XDyrbAOxZA3xsvJSnN8mg55Jp0HUpxrkV/LQuU
         WQEtf2E83Ck7EqZ3LLRvcsHXQU75ng4U4OHyY0ByCf2bCyFC81R4aXo7TpZFS66gGgVB
         njQywBqbNBO06N5xL1Myrd2SAnGQd0R3SCwLv7Am9Wp9QyP6bmEOxVv7UyaYPgifDEf5
         LIEJraFWLISU3ALX45Z/i78pblDhtWezXbYwdRhHd+c/47UKbtOtyvOJNVEEaga6H2Wc
         WVaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=keMbtcyNVQxdC0ctP+ZhAmBIOPGSUadXPIE/fKO00rU=;
        fh=DQdvY65ikepNWhjCSG5QPN9UzzluWnJACXfSjmrn63A=;
        b=O9V/urnpkCpUu+P2rwXEfrtgUGHsmvCwPaThojusVCyINm1sBD2d3s2CEhLM+LCk+S
         BkW0fF6W4jnnZ46mvdGG5dbrHQE1GrP1D485NCoDsLUAjPWUqRjNqCRdYZa6GGEgyG41
         rSsn/NbdKYYHLAlxgqZZ2x1QDM+sIGGloXnYbtcVJhU2Gyb7q+IqwwFGvcY89ZIicovD
         Uf4FRt9UZpnozaPGMh77Xfm9q3LJxnpjNWUQO4f7Yww0Cd3XAZROAvMV6S+QkrOyVUO7
         u/rESAY/ON/CpKkJfdg415302fdhBChTRVfmmPVXW5B5IYg2SZZJkUQ3XxrK0WcpbkrX
         2aCQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790940300; x=1791545100; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=keMbtcyNVQxdC0ctP+ZhAmBIOPGSUadXPIE/fKO00rU=;
        b=efqCTgDg+rP7HorfXfAh2CddbMB3IpZ3nM2eASkyu88plQ/Icbem6nxQxZ8g8Nmis/
         O3bQuprgqMODpxzcmS+8Q06gJB5ALqDCKv/W8YlhhtPv1FimY7f/u1b4Lrj3401BQa9J
         y4uJB4tof9Axdt9wD6bD4ORqh6EsUjBvfU5Y1AenE60iB8ri7iibPNnrozPrTVEKQqdk
         4dPbKKBkT507HvuE7BeJDisxLIiIOxm71GCWLYFu141ESNal2XIbkd3U9p5tplw3VrEa
         Ni5lghwXSK7j0aOP4lbsgVBoOxDLiYb02QfpiK/K03IlSQUYsH6m4FKD3IWN/oSvXIaN
         keyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790940300; x=1791545100;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=keMbtcyNVQxdC0ctP+ZhAmBIOPGSUadXPIE/fKO00rU=;
        b=PD+6dN3WIIs/AjJ1CLkU2HiWW6N9qsYE9K1y0TTyI6obsc6nM2Ni9LpkP1Hl4OpvHe
         s7TPzzMRdsMwzIeK6NM8Cd7R6vycx+b8hE3xIVNlq+btlvnQlPnwDhlhXMVi5GXsBsus
         hTsnbQwlIO6ILmBHk3k2Qkcdf6FC2LuyNQevchp15+SvmMvLVVQulUeVY5BDshUhdIxc
         3LnWnJiZ3hUeGGXBly/X8Xt7a9E4m1aATsPipuXgvfwZ+HA5KOQ24EFKyRhzHT8ktCj0
         CGX3zeNCkRKYxOnwYDRXeVWvkPTzfRy2Noa+9lEfSdJ/rjRaAHobyCsctgkKX19L1364
         eCcA==
X-Forwarded-Encrypted: i=1; AKwUvBzPoPq7n6Rqt3QSz6kEGE+7nX9Cfhtc0wGIgEU0EC/wRIwZkjM+Ua7Cvim826DXiw2pgjlAl7oihA9WuuR6YScmCQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYLT1llLQA/a0wj8DWIog8HV853TDWDdsRzGEHXQs3Y3hSbyrkHe
	pbrexBMmIofoC3i8Nxy3bn3NaEWF+G+c7TtdMqYmdtjbiy/CIBVsJKMVfRGIVzqLIgFSaSw9Raz
	cjfr0oXXf+L7CRN8+bJcoicSLvdHgxkHGwm8VJTLrTQ==
X-Gm-Gg: AYBFou1ej4XPbh2rNVL4h/1XQXdM2HYj9A7RI0v+fwVoixT/WstXE6ETosaZnmSh6RK
	GUx4Ox04QYnYLrN/QizeSJZoEacwHrPu/QimDOkLFkz6Y/9putB9JwmFzqFrtQmkqrrjjiX0yeI
	NCqR23y2rjTiciBNEFMjbwnEz0PFENkn6ljXR2GHlolu3sLjxSDiO5LoWpckXJYsrl8KPN140aY
	qKFIyzhTgwkh17dpN4qa8oGwZEeez5D860108lsLvyPmH/ynUK4jfb4KLDVmXOBJleUNayPujCe
	/JDIZT7GkMOMtdTrK6m73et0doRQGMkec4NfXE9wQcjwKazxuyGFNQlOFNSPr2sEHeux8odN3RE
	ZKQojOeReJcAbKwlTTBFwAZR4
X-Received: by 2002:a05:6402:13cd:b0:6ac:8dce:5a86 with SMTP id
 4fb4d7f45d1cf-6af9e322b6cmr1463693a12.23.1790940300400; Fri, 02 Oct 2026
 04:25:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CGME20260927150938epcas5p33b7d0495f8d9a8e84bf5f09c66e757fb@epcas5p3.samsung.com>
 <20260927152738.3673504-1-alim.akhtar@samsung.com>
In-Reply-To: <20260927152738.3673504-1-alim.akhtar@samsung.com>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 2 Oct 2026 12:24:46 +0100
X-Gm-Features: AclHuK9DpXDu6p9otQ-T72J8vLpAXoibGWPs5vMvpbKJgOwvaV2nsGKYn1-NIrU
Message-ID: <CADrjBPpG1nJ0Dg1jXhqLoR_dnRP+N+=QbYeyW8GJV4Xr=od1CQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: watchdog: Add Exynos8855 watchdog
 compatible string
To: Alim Akhtar <alim.akhtar@samsung.com>
Cc: krzk@kernel.org, robh@kernel.org, conor+dt@kernel.org, linusw@kernel.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-watchdog@vger.kernel.org, 
	linux@roeck-us.net, hajun.sung@samsung.com, wim@linux-watchdog.org
Content-Type: text/plain; charset="UTF-8"

On Sun, 27 Sept 2026 at 16:09, Alim Akhtar <alim.akhtar@samsung.com> wrote:
>
> Add the 'samsung,exynos8855-wdt' compatible string to the Samsung
> watchdog device tree binding documentation. The Exynos8855 watchdog
> nodes use two clocks (bus clock and source clock), require
> samsung,cluster-index and samsung,syscon-phandle properties, similar
> to Exynos850 watchdog implementation.
>
> Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
> ---

With Krzysztof's feedback addressed

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
