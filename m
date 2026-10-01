Received: from mail-lf2-f13.google.com (mail-lf2-f13.google.com [74.125.229.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 517472DB794
	for <linux-samsung-soc@vger.kernel.org>; Thu,  1 Oct 2026 07:03:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.205
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790838239; cv=pass; b=V/xvkkoFW0C9jfwCWyNj0KhI4UqC/vOPvr0xxzBkwKlRgpNM1O7X0y0W36QrzRkM5y/BS/4qmWr0whQN9CfjLwml//1J7uE4wIzh8NsM2vLo3IADlPJMrIRv8nDG5qrIs5ESvmz1guy3GzyREmdhV2uN2LsJDZYzCiyijo/afEw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790838239; c=relaxed/simple;
	bh=Ag6+/GkxMCWZ0gyOTMJWIz6nOKWNtLtlkOUsQnDCd70=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=Huha8VfX6iqRp63KwbEp13Eqe464/sakxqqXi//GBegLMH7TE13grRbSKN3SQsBsm5IuXNAsTZGwa4VxG10ruNsNR7O/x6lXAV2mpCav3vvFdtJdKXU7NVjTwEhpZ3JVIvoQbnyZtVzMeDAwtfAhYg+mHMa7ALMGrpkIAhKadoY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hj05YYQH; arc=pass smtp.client-ip=74.125.229.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hj05YYQH"
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5ba3fc22439so1237944e87.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 01 Oct 2026 00:03:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790838235; cv=none;
        d=google.com; s=arc-20260327;
        b=WJOpeRtNbKvuLPD7dbpwWRq3HTzdFYCDIMTkB8KYV0PW4NP/EjLLLpLAFtDYM7MUl5
         fEe5gl8G9hShUQWv39f4y1fbPxSYkWBowkVjbxLcKmg4l9XbnJPUzLfgtLI0nEqFfwyk
         p3JUvK87NaFKl6qDJ2y4S0zAA0mMtOC60a+yK0wU8rfrkpfD8K23DZUsWEPE3GLbjyrq
         jFRr3EvpMTO6wIoYOABzGQ+JrH+DXpshGBOq9mlMfCciIHadZldYiXJw3lZMTjjqRIYh
         14yE6aRWn6WpOyULoGRwQTTWJqZBD80j4G5dSiOCAZWWUQDmtj2hQ4wjV/ugqWSYJHuV
         HiXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=Ag6+/GkxMCWZ0gyOTMJWIz6nOKWNtLtlkOUsQnDCd70=;
        fh=lDGRW2TzXCWHfVSMMM4/aMf1SPiHWbOidoFA7N811J0=;
        b=pddm21MDITMwYsQtSSBuxRbwb4pbgcVjnHKz9S3gBd3fFMV+VjTiExiCfjfjwTGYFa
         mTtDJK4om3CC7RugLRPkH7vjcWZCZ6anNnmRuASV42QUhOcXB1BA57G2u1OkHcZ7WaLH
         M16sdXr5H2JzEVbhvFxUtMwXsyI3QQTXi+1J0KzRh8BjnaIps0QdPDZK+LG/ZOZvYZZr
         iPJutJB34pJ9S1wtJTW6ntx3yrog7jGgTZNesa6oIwTFFTaILAUjAnXwY3DB664OPiyk
         iUEf5qC29LmN8uwWBqa16uJQH9FVCmOh2OGUqwY1BZe5Ogm6AY+aaZOWPH/A9xIt1Tiv
         kw1A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790838235; x=1791443035; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ag6+/GkxMCWZ0gyOTMJWIz6nOKWNtLtlkOUsQnDCd70=;
        b=Hj05YYQHUU/FCZTNOlqlvFWQttxizGr6qjUaiymgohPT94st36V32zaz/l+t946zJe
         Dj0cRSBHagZ/ntTMoo99hsNufEQkpCEJ0pHh5MQMcMxAUmftvkwXP1UrGgLFryGnbKZh
         r3j6Ze4hJjdDf/0f4dJI+gA/2IB+rdF9zZA7X97R2slSY04LqTqhwVelxS+hvC1NFrBZ
         1HpYYmB7JWwSfQl/Zq8NSt+Mxg2IaYe5LyC8/Im+vmDJmQH05QI4+uXCTQi4ZrrGcgjP
         mKu030HXldwtYo6hCZf2BcPSLeLG0hQaxv6WSulBR2HqtIXTZ6/VbCupl2f7D6Zp0BPw
         QCrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790838235; x=1791443035;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Ag6+/GkxMCWZ0gyOTMJWIz6nOKWNtLtlkOUsQnDCd70=;
        b=QhytQwBjbD/guBHT4EHU3CAO/BxxzJn1i3Yo9cbSGzzy1dBW0ZuUtyjCOTl1QulhAI
         +JhFaIKm0372xjX0ZL4E334QXjeCAiO3/j4hBuioQ+sYzpckZAfNQuuTo0YPxA3mY+sQ
         nN6sNQB2aUkLiMQP0qmu1UEzK+mJ5ox6CFmIAqDRjTBICoPlf4JTlta9t9wZ9hrn4L/Y
         4Oww/NlN4b1+c6EiOXZkQU53MMxI6n+v0Zo4Qu5f3EDgOF0K63Gv/C75kKdh9eGbyf/G
         z88clBo6b2fiVoL34oLcht2iqpuDw9t9ODhrJcqF4TjCyxhpBkMEpq34eESbPxzULcyv
         tW3w==
X-Gm-Message-State: AFq9FYJnbHtKM++M1N25N+PF8d4Uh/u+Tyop/hwLC0KVVunXAm1e8jhC
	Fj9MjFGlH7pKK7SHkHLE/yDNlgho7S5YHJbecFGH2q9F9fl9Da6yIubmTzln8VVorJryhFNYhzT
	TYmvY4e4A6tpVJXj5i1jBa7JyoD89kt2YhD5TSceC+A==
X-Gm-Gg: AYBFou2rsooCo8VKn0BJkRyoUiK6NCMZywJe9Nofzsi3BeBgK/fCJWmR98/8lGLrJ7j
	R5j+ZvPGTgrmdG+L0B/dBzmxJvd5gm2UNkQ2H/mtsd0OkDqe64fGyxx7+Azj9Af17cDooqZCFyL
	piBakChdWwRlZ1dyA01spiXbhgPJAm9Pp0gQxt363u1f8lJR42f2GSR0g6h9OXmznrZrwhafotG
	uKOjxNZDMB/QmReAnnNlmrpUaEC0/rGkm6ovkXTlDDavk5ATQG+bMXtr7loXDkB8u7vS+anf0qT
	Jz4Dq6+2/CjlAul18u3WDYPQ39H1ACtYpCuRcrwf1v/FyFgBYlIhsjIh2g==
X-Received: by 2002:a05:6512:33d3:b0:5b5:e8d5:7fe2 with SMTP id
 2adb3069b0e04-5ba402b1598mr1495490e87.5.1790838234915; Thu, 01 Oct 2026
 00:03:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Kian <kianprogramer@gmail.com>
Date: Thu, 1 Oct 2026 10:33:42 +0330
X-Gm-Features: AclHuK9v9IWAa-Zm8vVN5oXY6hVZIfnTT2Oe0yzhsz7sRc8LNSBCZc4BGg3ti-Y
Message-ID: <CAC-nSOxO_9tSE8jNGGQZKPtiKPq0qn2sgGWppzD_8yu1q=Wamg@mail.gmail.com>
Subject: =?UTF-8?Q?Samsung_Galaxy_J7_Pro_=28j7y17lte=29_=E2=80=94_Upstream_Linux_?=
	=?UTF-8?Q?support?=
To: linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

Hello,

I am reaching out regarding mainline Linux support for the Samsung
Galaxy J7 Pro (SM-J730F, j7y17lte), which is based on the Samsung
Exynos 7870 SoC.

The Exynos 7870 already has upstream Linux support and ongoing
community development, including Device Tree support for the SoC and
several devices based on it.

There have also been several community projects and attempts
specifically targeting the J7 Pro. For example, there are existing
Device Tree sources such as exynos7870-j7y17lte.dts, previous attempts
to boot newer Linux kernels on the device, and Linux/postmarketOS work
targeting the actual J7 Pro hardware.

These projects are useful starting points, but each of them has its
own limitations, missing functionality, or unresolved issues, and none
of them provides complete upstream support for the J7 Pro. I can
provide links to these projects and repositories so that the existing
work can be reviewed and compared.

Rather than creating yet another unofficial downstream kernel or
another separate community project with its own limitations, I would
like to try to bring the existing work together and work toward proper
upstream Linux support for the device.

Would someone familiar with the Exynos 7870 platform and Samsung
Device Trees be interested in reviewing the existing J7 Pro work and
assessing what is still required for mainline support?

I own a physical SM-J730F and have access to the actual device for
development and testing. I can provide the links to the existing
community projects, Device Tree sources, repositories, and other
relevant work.

I am willing to do anything that is reasonably within my ability to
help with the upstreaming effort. I can perform hardware testing,
collect boot logs and dmesg output, investigate hardware and Device
Tree information, reproduce issues, test kernel and Device Tree
changes, test patches on the actual device, and provide reproducible
test results. If additional information or specific tests are needed,
I am also willing to carry them out and learn whatever is necessary to
help with the development process.

I do not want to simply create another unofficial project for the J7
Pro. My goal is to make use of the work that already exists, identify
what is missing or needs to be fixed, and help move the device toward
a clean and maintainable upstream implementation.

If there is interest in working on this, I can provide the relevant
project and repository links, Device Tree sources, logs, and any other
hardware information I have available.

I would be very interested in helping bring the J7 Pro into the
upstream Linux ecosystem, and I am willing to contribute wherever I
can.

Thank you for your time and for your work on Samsung Exynos support in
the Linux kernel.

Best regards,

A J7 Pro owner and contributor
