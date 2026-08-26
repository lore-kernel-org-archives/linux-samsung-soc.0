Received: from mail-yx1-f47.google.com (mail-yx1-f47.google.com [74.125.224.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ADE12E7372
	for <linux-samsung-soc@vger.kernel.org>; Wed, 26 Aug 2026 08:03:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787731438; cv=pass; b=WR72DOETTVzt0uABOub3JMAuwO/3Ft/q7yPTiATCdnA8j3V2FTUPZGSC2HJ1uSuhV0L63xvA0OUErhyZbmhnGucPH5MaS65GME/yj6wqDe3eBS11ECj8jfnsvcnD9itta6jUe+9WBfSjWl2XdovD47VOwzq0eB6agJUC7u7hq5c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787731438; c=relaxed/simple;
	bh=E527r35PH3U3M7/ba4/IfQXpLEJINpkZTHz2CHClcLI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QqG4QrvcRbGkkbH0lPNLNctM5p+NP9vD1xaFIjr1TumNH3r4uFQUeRq1NpuzwHN7Rou7upMzX+ysh25TPzYr2tuIwNmex3ffzR6fXcUSnt1hN40YYtFK9wcrMmG6OTt+A353vFoV+7O+p+En//5qaf3cm3ioppARwqcBSsFexVQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bDn7FSM1; arc=pass smtp.client-ip=74.125.224.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bDn7FSM1"
Received: by mail-yx1-f47.google.com with SMTP id 956f58d0204a3-66d146f04cfso547118d50.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 26 Aug 2026 01:03:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787731435; cv=none;
        d=google.com; s=arc-20260327;
        b=LjQ6uO4++UdGAXVHwLiwh0pxNh2VaXktGpj+r/TrEATvblCUmW2m09VgvnPHYO3D/n
         DxFSxv8LhWRhl5opAkDnPsSYPlZF7kqEBQ8VrGzOsWjL/dxC6a15mSrRdMh5KZswLPof
         Eih6GsWVB+bO6vm95czuTUiwpQXtYdsS+QN841P+GB29YU99rcmxF9XtUnTj5BZzSQWC
         zsAx4hOEVkXyrWG5ZH57M9Sg8QYtoKripxX4avCkPM6gaKmOdJahcKqPNR0iLrN40Myz
         1Fom73j633xQDzIJOsj3I8DmQjV/u02qt/6+ZNsP44BlxF+bfH1ZCkGuAb05aubIU7Bd
         1StQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=E527r35PH3U3M7/ba4/IfQXpLEJINpkZTHz2CHClcLI=;
        fh=gcb+shcjjASe3/oiARih++QGIhkFbALge9x5ddtLmpA=;
        b=FPyZa7eYi2ATlXtrGzFYVk4+Xny1TlIL9gu5V0Yc1mAPUNDEPzSclt1LTNg0FC8G7p
         fXr6qK1/ndh9Lltjnc+MQx85E5S6FVQLSbMT3xGMT/WGANDaqYnFbk3vHDAcCQ4R8chR
         AWwdBNsKKjHFTch28XXxGBRnS13eRjus2njBLvw8C36JpM5xS4+2O4eCrp+YPdfLVG2f
         rYcpd7YZDD63oItFezGpI1TPM0ZQ6RfpShiA47YIWDX8gBCYQwsKe3+AHbyJg+xJGaPc
         +dZO9ZnDxOJ4PxRSWyFdeb2dlnOJ/nE4CFCp6NnzfrAzA8fcGEJZOC6YooosuvrXL0N4
         SuMw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787731435; x=1788336235; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E527r35PH3U3M7/ba4/IfQXpLEJINpkZTHz2CHClcLI=;
        b=bDn7FSM1WZFQFoEKW1nXEJYOJrWzpzcOj/j4Mhgujo+5d2CG5JD3/VaXtDF8tAVIxq
         h290EDcKlb1MabGtlk+chlDFF/eaWBgFTUvtrUGg4gq9ejH8iwWYJB6rPSR6+t65z/V8
         cGJwJBtSjUfW8rEsIEt6rGcRzkyyCHTBkWqa2ww4m8mGvOu3pvWL4koHoRH/MpI1ysiy
         mFCJRSEbbG2K7X/CLlWhDWJN5ZBqntvgwDkpKVPwM8xjSR51JJyJqSID4gfH27n8lZ0A
         2kUqHzmjpWeOFmTn0jfqFG+uy4i9CN8BvkK5puJrPdvYmCHlRUknxQkxVlvrZ8/8GuXF
         HQ3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787731435; x=1788336235;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=E527r35PH3U3M7/ba4/IfQXpLEJINpkZTHz2CHClcLI=;
        b=Z9S/QOuXc8siMM08rNynExtV6FSHF+oVbsNjoc2fEMnLPWVq3VqHsFu5s4KExAHf7r
         XpDGWzgakKRZyBq8E8dUsLSMiNiKUl2llMoc1jf6DfsZEBbMPpN5Q2CqldxFAsIfQZ3K
         5+zLgKgth6ThUJ3AEXrjccZqeLCATTKjtTjgGz07qO1J+Ab/W5IQahC99tzLDqrWmFuh
         GxdiSpXiNJebSjMGrCgs15Px3jmhRJHhEh3gMr80w/hyU+K/QQRFwwjyPRLqanLYwfW7
         K14jX/59dw1fbDYLMLn2+r8WJ49j8CYB4YemHHuqpFoOIFZu3hpEy+oyHeQ54v9YZGJc
         ndKQ==
X-Forwarded-Encrypted: i=1; AHgh+RrlGwlpP5dM75dDx9zii4ZqUoBJwxUO6Q0TvclQ+i4zWcucLYnh2uaHl3KjhWqkPnnG6aDNXXH1DnSVdEJNMCJjjQ==@vger.kernel.org
X-Gm-Message-State: AFuF++neK/6v17Lk4RjAHsRgdpi6gWVpLlLicB414+MSgWwCOgHQ3vzw
	xD55Y5XxqJyuiXm3LXdjX7rQTRzINucQgDVz9+tD5kkpZJjEvFduufDaFt31VfGMizjLhexb/wP
	crC5dj+7FTya2gr15L7QDEonoF38CS/g=
X-Gm-Gg: AR+sD106gY09k98llWjYaAMYtm6FExdKpNsIYkMZ1fpuFqdVfUECjBvm32FKI6lfIqR
	+aVyEiCaynMU29PRkh+cpumMdffxtT6W6mdZFTK/elTG1kqH8XgEUO1jwjNxpCoQ0umvWyaylGp
	2aM/TMSuLdAmaJ8OtYB2HLmgtJxuAij1GaPzTlATzAupRq0U1wtr0CAkybfG+8svUEmfUUl7iCL
	V35ipF/wFI8rfQZeK8oYYSBeC2T1lBUEWdmYq5ctqa3DH4bdVEdfEvq/iUb1NCjKA4bdVkNvO7e
	OwCFARWByedN1sIXorQmNQ9kMIiNo2M+jcxIDKE2Kvcdero=
X-Received: by 2002:a05:690e:2455:b0:667:f3d7:eb35 with SMTP id
 956f58d0204a3-66d257691abmr1344105d50.6.1787731435407; Wed, 26 Aug 2026
 01:03:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260808121752.2819486-1-lgs201920130244@gmail.com> <626c4fa0-8e7f-4ef5-a027-b6ae2aa36099@kernel.org>
In-Reply-To: <626c4fa0-8e7f-4ef5-a027-b6ae2aa36099@kernel.org>
From: Guangshuo Li <lgs201920130244@gmail.com>
Date: Wed, 26 Aug 2026 16:03:42 +0800
X-Gm-Features: AcwNN1Vol6DpYyKDV-cri24sXXF_Z7PWR_q7g87D7ApkpF8hGkZUW9sBryzNqjI
Message-ID: <CANUHTR8KWSjBgV0QSAeitKKoLL==fMkpmcrZV6Zv-LBYNz-vew@mail.gmail.com>
Subject: Re: [PATCH] drm/exynos: g2d: fix autosuspend cleanup on probe failure
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, 
	Kyungmin Park <kyungmin.park@samsung.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Peter Griffin <peter.griffin@linaro.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, 
	dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Krzysztof,

On Thu, 20 Aug 2026 at 22:49, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On 08/08/2026 14:17, Guangshuo Li wrote:
> > g2d_probe() calls pm_runtime_use_autosuspend(), but its failure path
> > does not call the matching pm_runtime_dont_use_autosuspend() before
> > disabling runtime PM.
> >
> > If the autosuspend delay is set to a negative value while autosuspend
> > is enabled, the runtime PM core increments usage_count to prevent
> > runtime suspend. Without calling pm_runtime_dont_use_autosuspend()
> > during cleanup, this reference is not dropped and usage_count remains
> > unbalanced.
> >
> > The documentation for pm_runtime_use_autosuspend() also notes that it
> > is important to undo it with pm_runtime_dont_use_autosuspend() at
> > driver exit time, unless runtime PM was initially enabled with
> > devm_pm_runtime_enable().
> >
> > Add the missing pm_runtime_dont_use_autosuspend() call to the probe
> > failure path before disabling runtime PM.
> >
> > This issue was found by manual code inspection.
> >
> > Fixes: d7f1642c90ab ("drm/exynos: add G2D driver")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
> > ---
>
> You sent vast amount of patches, all separate, making it very difficult
> to track and respond in efficient way. Do not do that.
>
> Group your work per subsystem.
>
> You were asked to clarify and respond to incorrect fixes statement. I do
> not see how you clarified and responded at all.
>
> Best regards,
> Krzysztof

Sorry about that. I should have replied to the earlier review comments
explicitly, and I also should not have sent so many separate patches.

I will group future patches by subsystem and make sure to respond
clearly to review feedback before resending.

Thanks for pointing this out.

Best regards,
Guangshuo
