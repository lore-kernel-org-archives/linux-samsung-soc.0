Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01F6A3161A0
	for <linux-samsung-soc@vger.kernel.org>; Fri,  5 Dec 2025 08:30:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764923454; cv=none; b=nHmIKY52++nbGvHecYndO6jtgEmLNf3JdEqJoveVa7oRas6Bww6rwL9tKNyqfzzPC1uIa76RYd47seb12PRc72+Sed9ausH7jqNuVKnjCy6wY67acWFkRWvQjrGlyXcK+FTTRIDq7P5+2AecG7RH1A4PiMp4xdUpy+QYvcJeyZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764923454; c=relaxed/simple;
	bh=/HKbrueeav0hfVFCXbRIEc+ezn+SuJvusACsWP8Bipg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fAGEToKwdsPeh25I3hDptDK6nl7nmQzS6rzIar+FmxuST/Uvo8iSBduf6LsqzzOl4ie2soKCnB39v4xlCBEYMlaict4BHiD0dC2DUX02bhNmg+NY5cCRaUotKNdVG2nX0/pC9xJJqRwXugJWbUwgpkYLAM3zH+bbB6Y7iOM6/m4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FHj5Chww; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FHj5Chww"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-64149f78c0dso2679863a12.3
        for <linux-samsung-soc@vger.kernel.org>; Fri, 05 Dec 2025 00:30:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764923445; x=1765528245; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=V+dVo2JNAn7MsrQQRK8VE52kJO6dog4ObFIZQRBPJw8=;
        b=FHj5Chww/xTk1hudNMq+l3Yg2nCR1m4Zfb/RxXjJuAwi+kUxlPdj1Jeu90bX7j9zHq
         OsQYyHSiBwBFGUAOmYBCoTPm1yuP7NcslWC975lwEJ1bqiAZdWt2TphMnzmJvrU+tFTF
         cGc6QBjhF6MnjOM3xSw2sfKiigr/4sk0yvecOGAtDfWNIWmVEM6P+hCddnwQwI0ezzEd
         O32JxbthsLnvFIkKPBVFQjSONP54FTdpJE8Wwb5YmU1BIlwK8Eq5nIHJ5z2LxNCG8NRN
         Pgt2yLktB/HIAipqB+raTFVZJ4FT//W60o+udsRdy7/pOSMsqYn/2AdEO0Miy1ngyobP
         Z5xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764923445; x=1765528245;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V+dVo2JNAn7MsrQQRK8VE52kJO6dog4ObFIZQRBPJw8=;
        b=YRDgqTg08U/GOYOScWPuOm7pJ/gddP/cwe4F6jlwM+GSeOmMEnTY1AhCpNy713L+RB
         OnQGJWW69g+85XjVlLrBU+EFviZotcwRXy8G5XGEJxlLUkDwbNL1TlAaSs60G7sjXxRv
         dBfuD/MjrBeLt3155iCxmt2h8NOJf0aNa4cy1+CUnmMP2WxIYuh2qsGlFvmuPEs5PMG5
         ygJmET7llCzCnalLCk2kIJmNF9LOux9kM7v+yxeoaK0fppgSPAbJjW0jpMdFLAz+3PqY
         CT9Bb7SznOZD53qj2q0XRt6Tn7/P9ONE2bD0YK5vD6hRGKKThA/Rl80I9FTuTiudC+Ay
         9U0A==
X-Forwarded-Encrypted: i=1; AJvYcCV5PcrhpEXlpDGQ2xl69IDRNIYFMkq7MGrQO/FXgGOQ39Mm6rC+CaF+nbNN+V3CJwfINPJE1tGY/+k0gQnuAoP99g==@vger.kernel.org
X-Gm-Message-State: AOJu0YwjTG/uIU9eg33iNPJij5fYCzilU3rUUQUAgr1SjVJcpnApafwP
	rNfody0i9nY5CztgZYnfWT8Jh2py4ecJg+ecL2z+s18gOUnPKjk7t1aBdSDK6j3Obegs6fsdZYQ
	riCxhd7GJuV6r7Q4wmjamERaLw9XY6XU=
X-Gm-Gg: ASbGncv5zc95p0N5ghhocFjh7JtSZJDqZHQKRlz/2j/Pl12ECo/WNw/A9w/wQ1+YSOm
	ypzryR5ETD2kdY+wS930NGTN82139grJSVMk3eWCdkW5glnB8N9R1VyQ2ZvCj4Winizer5tLEaw
	fDFmBrzT3tiXK7hB5KSJpfKEfwC3Nee05qPhiRUWE26RAAoQOGxSUdFBt4cMqIclRS9APB/9jWW
	pYeCimVxQrgzwZuOk7raHTX1gP5ZalAXxoUDWNdpYS4A7WmMdL9zkDKPLRVE4p/Nuc8cg==
X-Google-Smtp-Source: AGHT+IHyhPhO5ji1Udtkp6jlBiDNdS1nJUTysDiG/BFsQGzVGkOYuq8S0+wdBeVac/yGVlo5iFM2k5xQ7B6Gl1w0/Sw=
X-Received: by 2002:a17:907:3fa1:b0:b76:5b73:75fb with SMTP id
 a640c23a62f3a-b79dbe72a9emr795463366b.9.1764923445456; Fri, 05 Dec 2025
 00:30:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250813131007.343402-1-linux.amoon@gmail.com>
In-Reply-To: <20250813131007.343402-1-linux.amoon@gmail.com>
From: Anand Moon <linux.amoon@gmail.com>
Date: Fri, 5 Dec 2025 14:00:29 +0530
X-Gm-Features: AQt7F2qxbYSQuCXsYlo3s2RghAVsnJFzDr1A7ezZUPavGedOu8ugG3TEr0d0Qp4
Message-ID: <CANAwSgRqFsRvCzrK7NXfqa91xhQLLVU_u2irLBBrRcpiK9gGkA@mail.gmail.com>
Subject: Re: [PATCH v7 0/7] Exynos Thermal code improvement
To: Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, 
	"open list:SAMSUNG THERMAL DRIVER" <linux-pm@vger.kernel.org>, 
	"open list:SAMSUNG THERMAL DRIVER" <linux-samsung-soc@vger.kernel.org>, 
	"moderated list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES" <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>, 
	"open list:CLANG/LLVM BUILD SUPPORT:Keyword:b(?i:clang|llvm)b" <llvm@lists.linux.dev>
Cc: Mateusz Majewski <m.majewski2@samsung.com>
Content-Type: text/plain; charset="UTF-8"

Hi All,

On Wed, 13 Aug 2025 at 18:40, Anand Moon <linux.amoon@gmail.com> wrote:
>
> Hi All,
>
> This patch series is a rework of my previous patch series [1],
> where the code changes were not adequately justified.
>
> In this new series, I have improved the commit subject
> and commit message to better explain the changes.
>
> v7: Integrated my RFC patch which improves the IRQ framework
>     for all the SoC link below.
>     [6] https://lore.kernel.org/all/20250616163831.8138-1-linux.amoon@gmail.com/
>
> v6: Add new patch to use devm_clk_get_enabled
>     and Fix few typo in subject as suggested by Daniel.
> v5: Drop the guard mutex patch
> v4: Tried to address Lukasz review comments.
>
> I dont have any Arm64 device the test and verify
> Tested on 32 bit Arch Odroid U3 amd XU4 SoC boards.
> Build with clang with W=1 enable.
>
> Please sare the feedback on this.

Can you review the first 5 patches of this series?
Do you want me to resend

Thanks
-Anand
