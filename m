Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D2F8200AE
	for <linux-samsung-soc@vger.kernel.org>; Thu,  8 Feb 2024 18:42:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707417772; cv=none; b=UivO3mRcju+1ydYXX2Jebew8uEF7n0BsgX9VHkxTMpqCQSGTgqC+liSq5fkmpWKAtV29XZ/o1gdkPpj5wigntReeUJoEPm3XaycIzafHx4J5OvTjTL9bsUf91ODB8ajvtGCdmftkcUERB3vWG/fKyQOPKETE4SW/gaRqiiwljoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707417772; c=relaxed/simple;
	bh=LjWKC4FgKErYbA5m+BAGEdZhUfZWEtslt5I3yi/qufY=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=FPUSDPiut3fQ1288nqWVxx5AK/0WHYWL6/OolNO8+Ge+B3PFpTX1yQGZt9WXbhnQX2k0U8+wGNIqzE7MZ8fjZHH1f4nML8wKhSrJW4b/KUz/cw+a/uzX2s9LDplqheoqZIc/XpbyFiaouVU9KxFqJ9/cnkjjvYkcQMzVElVtvtg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=E30Ut004; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="E30Ut004"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-56002e7118dso297037a12.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 08 Feb 2024 10:42:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1707417769; x=1708022569; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=t6PQ5AqWVezsrngLP+KCv3nSnPdNr4bX5OhiIjOdlUI=;
        b=E30Ut004frvAV9ihywkcIzeDOdiZ64uIWgIVEqWu6Wd5GXtU688uxnDRZ0PC7X47WL
         Xhnhk79bQpWZeli/8/zGxHsj4acsuG4A6XDXm70BeClLdctxeHVqGOqfrsNq+wxhTIFH
         uXfYc+mZacqwPK8pDy/jg/jYMkNFUhJzHsS2pXQUZN7tKuef2BlCui/OTQhuziOEqdx2
         xeA3hqYv0qE+IyEPGTXZPsG7bpGa93z+iZXYq57sjSr22ud5wxyN9NQkl0EYTpbLPvsJ
         2r4vUpIHwtgyVa30rtzWgbGiJFWg1nIb8cVv0sxulKROd+tmdGd0s9ZuiEbq19/y3BDZ
         6wQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707417769; x=1708022569;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=t6PQ5AqWVezsrngLP+KCv3nSnPdNr4bX5OhiIjOdlUI=;
        b=TOcTJs11zNGLzJjV6kX2PAnpkjnVEJzR7mgbNMwKwntUxzKcOj1gHw6n1nL46P0SOO
         /q3NyH1+YxhMacd1ivDE8hffK+e0sbQm5zAZaSty5cZjTOTAO2WBytGW/t6bJZXh8eip
         3up2eB2AC8L46rKR8Tn5uVL1i97LgFkG00Z1v5rqCvKyj3FmySMNwA5GRqVWSQRfOgv8
         xyGKvXzU+FCRdIOisG6fE2HWgw0J/pVVnSw2jQBqR837BiWIu552vv2+w2RIqGgETOGO
         UhGW8ANTCgsszzcDK1cIMxykN09Fn61yJia2MqsY6NQ+jnC9JbFJdHVMm0nVRMznJ0Nu
         qqpg==
X-Gm-Message-State: AOJu0YyfD/FwFWiWwJYvwGY82Ao1Mpf0LU5UcaizMMauMCvy0XcE9V1m
	M6ycuI5eqAh6Tfsi70b3OlbziCgMl7hGmLqOdAySCGv3mqWgNPWb1EPS2s2bjlTWgUW4Lc36e5Z
	obdLjARYJTSFnYFJfKzwbTGjPS3xGCD70oE38jaWUGTAzqY1aUHl6IcU=
X-Google-Smtp-Source: AGHT+IHAAsWefPdiaZwJjAsjSBPamm0mOa143vCMxq+h5D8nb2cj5pO9HuqAdFTzY9Vty8PvPr5584JckCwCrvZPF/g=
X-Received: by 2002:a50:fc0e:0:b0:561:206:4995 with SMTP id
 i14-20020a50fc0e000000b0056102064995mr54920edr.38.1707417769045; Thu, 08 Feb
 2024 10:42:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Seth Jenkins <sethjenkins@google.com>
Date: Thu, 8 Feb 2024 13:42:38 -0500
Message-ID: <CALxfFW7nSev3UmgdOpc_Sai52yGo3NSO2iNQ=p5Xi4O=cPRAQg@mail.gmail.com>
Subject: Users of exynos drm driver
To: inki.dae@samsung.com, sw0312.kim@samsung.com, airlied@gmail.com, 
	kyungmin.park@samsung.com, linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi, my name is Seth and I'm a member of the Google Project Zero
security research team,

I'm presently looking at the upstream code present in
drivers/gpu/drm/exynos, enabled by kernel config CONFIG_DRM_EXYNOS. It
appears to be well-maintained and regularly patched, but despite my
best efforts I have had difficulty tracking down the end-users of this
driver. I have not been able to find any recent examples of this
driver being compiled into kernels Android devices or Samsung Smart
TV's (based on Samsung's open source repositories). I've also not been
able to find any modern open-source codebases that utilize the ioctls
exposed by this driver.

I was hoping you may be able to point me towards modern usage of this
driver - I assume it's present in kernels compiled for some subset of
Exynos socs and in lieu of  the CONFIG_DRM_SAMSUNG_DPU code? What
kernels/end-devices would that be?

Thank you!
