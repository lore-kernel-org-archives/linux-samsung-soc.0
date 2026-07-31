Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com [209.85.217.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBD8C3314A1
	for <linux-samsung-soc@vger.kernel.org>; Fri, 31 Jul 2026 15:17:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.217.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785511067; cv=pass; b=VopKvomrVqj3+z7WOSpoV2Gia9FwLef4zuyhIBs1YlnqrSs0M0OV57kcnu07Ewq1/ytkYgHXIE9uyy4Uip1scyiKU14p6k/TaYC0NGsew/KTIOUb4YX3DzyWpjByk2RJZpciBrpVp04siwH20nUScx0/mnCnsr0gxkR6IsqrsSo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785511067; c=relaxed/simple;
	bh=KGP6YYWa3E46HVm4iujdsDlLjDhR2AjMoL5m0l3+/TY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=u1LGJXQ7C46CvmEn1hFqIBqCJA1S1Fg13hlHGdtis28FknbRyq+6Mwk8CKBUC96ZunlUHOPnY7mrqcLLOFSebaNAGsLJOVwsZvrabiZTenEWDxyco5s16q1bVJF/gwLRP3VbzOS/0Kyx8oDMmkIBFw6QHRsIpHQsIKxa3v5Lvs0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JnW7KcL6; arc=pass smtp.client-ip=209.85.217.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JnW7KcL6"
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-74ad03fa605so622475137.0
        for <linux-samsung-soc@vger.kernel.org>; Fri, 31 Jul 2026 08:17:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785511065; cv=none;
        d=google.com; s=arc-20260327;
        b=Vp07Zfu/fIr3eeH4O14zNVFMdbg6BpvfSxidQUDCQbRCsSYMjOmcxvMTDFq1RCKdTu
         rBeA7GR5N7wqSjzENtv6VhZEmPetzA+sZNhAfaJnFHP6J7aGvcsUxcYp2dNXY6JoYQ/t
         y2dQgiM0XZjob6wdoQFoK2E0IDb+ad7v9MazS4b7VgqFBn9vIIT/BUayCUyhPFEhKjRX
         6C8nk1+oBU6kQ1gdCFxskOFdvwkh5El0i1XiNziiywbF5xR1ZCHFxa10DEW0NrV3K4bQ
         7sKeM4YF1WiqYtiweViQLVlvMVjpwz6Ko2YuNoevDYWJeGhjOH4HBKZ+/QD/ESg5IT2i
         7cpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KGP6YYWa3E46HVm4iujdsDlLjDhR2AjMoL5m0l3+/TY=;
        fh=QM0S+x8iSuR8p/32f5/BjMJbanZXpgdaKke9c3Eh/V0=;
        b=Pq7ipD7vL9ebzMJ/9qkogzis2yS46eQHZun95QkokzAgefhZ0FVBOGS9fdyPMWcjia
         jAGFld3qQk251CAjJj70m1wWpX+LLwLyYTIoa7n62YUDUlPPa/3MJ1r9hBPZxC/eqoxo
         w0bilrL1c8IeRVaf1UwreeYZ6G7l9Zy3+IpkRd0+USFYXUe55ccYrI5uM5sk/0sGnjAj
         YBT3IGsZ0euKaKggGgWkc6v6PC4EynlJ7W5BXiATFNlhyTf4VycZ+Zh/awOZk5WdYYed
         PcjxqmjOKKUKny6JKnQtUz1maRDXBAsuxSrB/IGqMJM+YciPvNKsTmbTJVKu0hS4fMiy
         2vBg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785511065; x=1786115865; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KGP6YYWa3E46HVm4iujdsDlLjDhR2AjMoL5m0l3+/TY=;
        b=JnW7KcL6JZ4CtRHoJML6wckPN+pyHymO5vVdxAyYFEejCuph1qDheVDiD81lT1vdlF
         qDltzH11Kv3pWdLpvUj/dMYza5QVkX0V1ANdxZJ+457JnlhS6oVR2SXCTgk/e67wqWr7
         wgZIg+11cKr6JW64CJ/h/yCuINY50QAwYx4AYo0whz80Pa/jTXv6uK+fdAkqFrLtU+wN
         kK9CdasXCf5t/3auuLmyLy1wchbpAiOqRTI8QWZ19lmoFhLEvnPKpm8Dc9J7K8Jqa7Ja
         MepeJr5SnKfcoYZ7Ktq27c4SvEeFO7c5allTwgDOt1ih9vh8K2MG8wOvw5byvJQw2R94
         IgEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785511065; x=1786115865;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KGP6YYWa3E46HVm4iujdsDlLjDhR2AjMoL5m0l3+/TY=;
        b=PbW2HF+NTaQ9vlYcxJ4lAuyO+Ug6b6jc1/YlcrMHVEFS88D1fRsZQ8n9OWlHYw0ri/
         cBaCmJkpdD31ran8TNWHnzX79z7sKlz3KueL9PtHbd+rtTxKR0TPtkCYZk04+NkwT1NK
         yUkC9cJ3uQdMKM51219RwDvE3jMcrLL+38DwToel/L6gSrqCdENoxEADFJjayA5yEaqq
         2rOkbB+5zS0MIiJQDeJWPllw1fvzmScBYut8Rn+JmVZX8syoQ8o8+AtwC1FthI9Ormsd
         wW4j5PorGGG2KRxI3c9k4cE3zTocLNCflpHCK+PNZupWxGoCceovbYY4ypyvewqIMz4W
         g5hg==
X-Forwarded-Encrypted: i=1; AHgh+RpktQx0CLhRHtFib4yXGoGMV24T3I+d58RIs1NOPS8H2e2uzzYrQ5CNS84iDcRAILdvogT/IiuGhveL+YoeV/0mQQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YynYrCC+91PhsU00RsBGNhMiY5syFMwYUCit4AOn5ChNIE3xnck
	24xPKVsqfp1CJY6QAydTA/WkR25noPWVzWAnk5ePShH7nfSGx9uz044PNw0589U6Sc4n1DHkttK
	WFDeVltJ74ncNvCk1hVHRJ9jHv71TF/A=
X-Gm-Gg: AR+sD102a7Ph5eK1aTcursC/jvG3DuHBpi5K+kK7ULCStipZdbY4t0bu/169zNvK0Ya
	Ek8FrlvJ0ktH+8sb2oEt0+T6VQwwveR8p+qHfaDny3HAKtPB9EWzFYQuF120Ar775H7N8AdF2Zu
	aYvPEntkm6YR61PLtiar7HGpD4ZFHU2SKiFV/PGQaOJGDIzIoTz4oVH70dU9gwOGCUjhH7NAVGl
	wy5IU6zDa61gNf8Xxjfqahz4Zef6AsSoNsbF8R7YK4oBp3al2bymxl8jIJWL02CGVfR+BYet2Xw
	hYs7xmRnlWKqw4UGNEY8sP5YKuL+687c09KfwkuA11aj/Ti2fhiU6Ey0OXGyGcc76awDP5xIli4
	=
X-Received: by 2002:a05:6102:441a:b0:738:1ef6:51b9 with SMTP id
 ada2fe7eead31-75b22260dffmr475318137.5.1785511064843; Fri, 31 Jul 2026
 08:17:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260705110221.153481-1-mdshahid03@gmail.com> <20260724122254.121935-1-mdshahid03@gmail.com>
In-Reply-To: <20260724122254.121935-1-mdshahid03@gmail.com>
From: Inki Dae <daeinki@gmail.com>
Date: Sat, 1 Aug 2026 00:17:04 +0900
X-Gm-Features: AUfX_mxZnAVCtLemF1RKBEDkqKNByd4RYkTmPt_s3OtHb2BMMIen4YexrgB9y3Q
Message-ID: <CAAQKjZPwb00MePpUTmKZbn67jXp=UWX7m81evttd29L+9UcVxw@mail.gmail.com>
Subject: Re: [PATCH] drm/exynos: vidi: use memdup_user() instead of kmalloc()
 and copy_from_user()
To: mdshahid03@gmail.com
Cc: Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, dri-devel@lists.freedesktop.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Thanks for your contribution. I will review it soon.

Thanks,
Inki Dae

2026=EB=85=84 7=EC=9B=94 24=EC=9D=BC (=EA=B8=88) =EC=98=A4=ED=9B=84 9:27, <=
mdshahid03@gmail.com>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> Hi,
>
> Gentle ping on this patch.
>
> Could please take a look when time permits?
>
> Thanks!
>
> Mohammad Shahid
>
>
