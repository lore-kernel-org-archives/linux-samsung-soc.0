Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBAAD43744A
	for <linux-samsung-soc@vger.kernel.org>; Tue, 15 Sep 2026 04:44:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789447485; cv=pass; b=dKT3wQ9fmN2qJx2MVUBh9FUovVyAo36O1NGLzmb4KzMClAPXrQ5fMl5AH+Hj5mtEcqBEHDi9ZdjD/VYDDT3ToVup7Z/K4syo+9Zdqjvynr7i4TvQsX7v2EAG6ZXhwrP0Wpzfeh7JQLgCM8NxBojRLWHDzJ54CI3zKy2fOWgjOgY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789447485; c=relaxed/simple;
	bh=OuAEPVCCSuU2/NfeOknYQEwV5oigOdlMWrN/kmgtJS8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MnI0hMcgiqldaqf9x6sm2pGhKbPOFmCo/Hjp9SWeW3/ythNPNEqDHhobyb15Hc+VV/IyGDQXbkXBLS/oMCKdy4ZgjTvZqD+YVxmzRLHcZBX+YJmuJUIzsc0dh8O+UVdn1YPM3/znIakSoVSnmHwhz9zvMzIzPHpIpmfxoTBcFEs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WZyfek/v; arc=pass smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WZyfek/v"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254fa663bfso540183466b.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 14 Sep 2026 21:44:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789447482; cv=none;
        d=google.com; s=arc-20260327;
        b=lm9NP5Fv5JawyljiF5buiQDBwqLZIyHs7fFIgybgWhLzt84TnKeypXhlmqAPoOnj1u
         +XXZwJQzi17UgFXo67MCuIIAa2Dd34QxObqGX3JFsM3vcNSYKrGZQyA62h5vvTPnsffR
         dXl82bfk0YI1gCCMPeN4lAZCgqakgJL7czDudKIoHKyF4+ABfu1OVQz2qmSduTCHd73a
         xTVTX7r/wEITr9QT2Uc6jenWkqZBGZjeQygmWl3l++lRG0gzs3c7jlAETG3dMY8Qk6N2
         L/ZaLf4vHG5eSGXaPHbZN0qrGFk1pT7UF+wSDrgNAxxj7kNAsJ+qbikLjoauxJOYCNCF
         pBBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=OuAEPVCCSuU2/NfeOknYQEwV5oigOdlMWrN/kmgtJS8=;
        fh=a8m5mgmaDqV/M8Vc+/zflYgpnOZ/LmEghEZPeM6FbGk=;
        b=NuOo4oPwApXwHs9nDekJZdLdaXO+12jcsC8ZqddV65nXoly8S66E+Yy3tyVntoLAeN
         /JYnBjVptqaLPtRvRwb3qdi5uYj7oKjDypekUqdC+7ZmFAsyHWrdguGQjS8Ni8D4gReO
         Tp6pA2lSN73Q3yrfNhSQ7XriwchVm+V63fuWBRHawzsjFi44paS5UHq+A5RxbunwPhKu
         nYsFHipuHUzo2eGrHqN8PuE++I5LmbU6+cgAf3W25BqVWwqrnmGekdX9v/HwO/R8Yxo5
         69iFr9uBR5gopVCxJvrpxLF20wyW7g0NuuUrDcY4MAJ+g5QxaQbflwVRYLpCeU0gv+l1
         fudw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789447482; x=1790052282; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OuAEPVCCSuU2/NfeOknYQEwV5oigOdlMWrN/kmgtJS8=;
        b=WZyfek/v0y5My/4Go6IzmI693eIU9JC3pQ7MpNoRTcFL6MMm4Qd1ROaWIa8qv7tuOp
         zMqQqLd+fGiv03FI5L0jmfdNszWlJSB3Tw5mFonuCzYUjdwWJ5n7PdAXKvZucmNJtdMu
         5DsUpPF9H6YoqH8dxVC5hq+cotHi7qUCI9SGgWEOUS+QhWObJrX6Idhf/XviUjQiFCE7
         IQx4WOaIEDvleSTmlrQJsC9oCXSgvbXbUyZW0WtC3Iu9/uq18fvChD4nsO6UtC7bn1d8
         MA/m1Xoopr9AOdvaku7r7qsFMRTDegDVQBB684gXzfCBUr4bhVkMpc2G1e3vAqBUGG8A
         0vzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789447482; x=1790052282;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=OuAEPVCCSuU2/NfeOknYQEwV5oigOdlMWrN/kmgtJS8=;
        b=txBbvx0ihjzuiGyYQHkILCNxsGZ5Z2anPEOsRvFuhoq8/bJgJ8YDwGUWZ0HV3IGwka
         1jgVbw+SvtuPWnoJsPbMaKPvsnfSzOFs543gQeZN7crsRxzaYB66/J+d/wlQeMxNknM3
         K/BiTD/1cTmcajc9DIFaW3CftQz0l3r4zWFvBuyVVOrL48eP65SGB8ngfy/Y7NNC57B9
         Hgg+mp1THqv0MH3UlV04hYWkydH0U/COB45l8WmmLx84cp+ifKOi/FOGCRtVbTIz5dmS
         SQWTVioBK13ciprtVhnOY26V0A65AZCJmYyuj3hTwS1PozAjprTsi7R8Sz3LEzApFEfw
         89yQ==
X-Forwarded-Encrypted: i=1; AKwUvBxpTfylPQ1bTKYoj49HI2l9dGj1pFClQGuA/yLHdJeg63LJgQfAXtZcZ8ityv2jwABce9SXpi19G6NAWJygJJZnbg==@vger.kernel.org
X-Gm-Message-State: AFuF++l+tx4x7ZOB/MNfJZJJjMd/XYh2fEkym6WAV3n+GPsO19XXOP8J
	bokIX89CGIo2lwSw+ZWVh3bD12q3trztmK8/+ymvPi+WJS7iG/KEo68RCAF6dZNN2wwlXBU9bGA
	hw6ISaDAsxzjoss3Hon67pmjld7IqaR8=
X-Gm-Gg: AYBFou1wZHUsABTXaRnzCY4CJ12Dm+DCJxOgEt0nlT5ArUaC2JCIyzc5l/FFZ4CEKk5
	sW1Q2D2kgVRTX1zM5v3hiYWICRq7SIL4y8FUTXYrbRRYRfSiy+7Sn4Jo/CRKBn7df+csR3Y+T7t
	Fl1b5DVV8uYMNBEsc4zyEMBjELIhY2jQtALUBt4u4LieXsO04gN8BRiA+kyVe2cUWQwjNw1C8PK
	4g2Nc8iLUxBD8Nbhl+ZTIEtRC+ihBbMGkVrAqWR+IoLfFk6OYa7kGyDkfVpW9cbI6CfZHm9TnBU
	pt7iYTRiP1k3XqCDft9/XkNi/nvU/QqMNBciHU1XFa57etYkmi+PpA==
X-Received: by 2002:a17:907:3e07:b0:c25:8c05:902f with SMTP id
 a640c23a62f3a-c29b86b7559mr700042866b.13.1789447481668; Mon, 14 Sep 2026
 21:44:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260913145905.9404-1-linux.amoon@gmail.com> <20260913145905.9404-9-linux.amoon@gmail.com>
 <8d547f65-a260-4b8b-80e4-4695d4422497@kernel.org>
In-Reply-To: <8d547f65-a260-4b8b-80e4-4695d4422497@kernel.org>
From: Anand Moon <linux.amoon@gmail.com>
Date: Tue, 15 Sep 2026 10:14:25 +0530
X-Gm-Features: AcwNN1UE0alxnYRR3jtRD2u3dEd1ayGXdU2bhjTuNvTUC-ZbJLtS9W7X8MU3WLY
Message-ID: <CANAwSgTEJf0gYQZKPQm+=90S5i2dRpJzOLv0gkyt+4ZmUTWZ=g@mail.gmail.com>
Subject: Re: [PATCH v9 8/9] thermal/drivers/exynos: Add missing drvdata
 assignment in Exynos TMU probe
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
	Lukasz Luba <lukasz.luba@arm.com>, Peter Griffin <peter.griffin@linaro.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, 
	"open list:SAMSUNG THERMAL DRIVER" <linux-samsung-soc@vger.kernel.org>, 
	"open list:THERMAL" <linux-pm@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	"moderated list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"

Hi Krzysztof,

Thanks for your review comments.
On Mon, 14 Sept 2026 at 12:31, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On 13/09/2026 16:58, Anand Moon wrote:
> > Add dev_set_drvdata(&pdev->dev, data) early in the probe function,
> > ensuring that the driver data is properly registered and accessible
> > throughout the lifecycle of the device.
> >
> > Signed-off-by: Anand Moon <linux.amoon@gmail.com>
>
> This is somehow confusing or completely incorrect code.
>
> Either this was needed by the driver or not. If it was, then why no bug
> is being described? If this was not needed, then you are doing no-op
> changes.
>
I was looking into other SoCs that use this while debugging the
device-tree mapping issue,
so I initially tried adding it. If it is not required, I will drop this change.
>
>
> Best regards,
> Krzysztof

Thanks
-Anand
