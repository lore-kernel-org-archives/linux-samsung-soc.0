Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A15127F4F5
	for <linux-samsung-soc@vger.kernel.org>; Fri,  6 Mar 2026 21:17:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772831846; cv=pass; b=die96MB2STEJdMKFILBelqaMvA8X6PFTVau4y3npeSEPKA8OTlNxxtusBFWzJbOIhSzHr+2wwP0EtURV8VsBc/1VqDiymzSfqKDZVQiPFbgOZyauHRZjffoQF0LjeYoLCGTmWTrIogsIK+edU/cQ0LJ9Et/fIevDMhZTJ3WcCOw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772831846; c=relaxed/simple;
	bh=xV+j6NHdrp5oM/A9ZIFLXQt2swBLQm+aDHDolhtd6Kg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bS/sU8NhN08AK4+apOqsyho7VItls0Qh11xgDB4JebsxX39ugusmjA+LLpYODTzZPdw/zKN4sQqCWnUlpEwtGmom/gpfUO+VANA2/DWiEHwGgLSOEszoCVpKQyq18X6LZS17e4WFlaRo1PP48kYQH0c48PZuxJLihAdOxCUyhpQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Miy2l5Yw; arc=pass smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Miy2l5Yw"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6610bd5f322so5542119a12.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 06 Mar 2026 13:17:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772831844; cv=none;
        d=google.com; s=arc-20240605;
        b=JYNByDiD9WJ1zKGfcacX3yQfYrQQxB6EbFAFX/3o7Rv1vm/eSMk1A6OISMBIqOcsTW
         oCzSZFmaMrwigzrPMKKh9daZq3r1HUJd75GjNavlWMOKMO9ix9f6U72TjDqYQ75GichK
         sAcU87E307t9/N1QBB5fwTijhM4rb9+yd2GV2tpAao1SpJJtdJYP4NozmQIej/+Rjvgm
         bEnJx8cJODv5xWklK3zSFSP1qF1kSt4SiBYp1tEtzooqWAZietjUiuXRXRsOnyJhHT1N
         nfu3pt8wC2W9/RaJB4ceEsuojpAUUZeEjW1+DpPXjm/PJOe90QgM/2az9eE8kMy7Hkmq
         TdmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Y14EKX3r2NZEaQlK0jcqQywAmjLktS244ugWnhJ7Cns=;
        fh=V2A9y3/oxHGuyhHA1+CQyc87R1e6Mq4F/9LWUIbM4k4=;
        b=izhIZ4a5fUPJIIQf4kYHK43WKZxt/n3reyvUQI5qn7b8/bb0kUUh9MpOoSgFIa6tdU
         S1jGcssN2G/vTXw75tyzvClvMBpFeWOexGXXHV8gI/BbOlbKEG6hQ82DZNzDI4XCD5PW
         QdZlUNaS1hCQbzM9V9ATI3o/ah4PJzU8cLOV5F/GWPb/yTerawor7abNQqwcr0Wam57q
         1G8sED3jHFqWbZGAFJmwj5LMmj2rHi3zVt4sbcmQ68C2006rm6ZXY3e87jr2/pMvMp3y
         aTza0ZN9vYj6xQf79fTjs2KbNNQyhgjmkQBmZO5STLJ76zCNpDAj8MpJf9LUCGa0cccl
         i19g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772831844; x=1773436644; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Y14EKX3r2NZEaQlK0jcqQywAmjLktS244ugWnhJ7Cns=;
        b=Miy2l5Ywr0bstXjaUsgVwz68NheYRYqa2VBo91wKPoOEB/eWfI6sM1ZXAUVIBAGyNU
         nWrILuk/mCJGZyWyq/DE8Qct5cbuGUtuFKg4vx+NTlP+eTsDt/Z9O92EJlJFgR2+UU90
         OLMGUAprXwe3h4Dp6IGlXsgPvuPaM5PNp93jOHe5+i/7DmKeQ1TGeZcYCH83HT6B+D19
         e2kI0tsM5Md9zZPFQShd2pG0qaxG7nWofsVbbo5ZIQ8cupKL3KcvJkb5H/6Wv79942Af
         J/3A+I0kkJPl9mwrQGjoYr+kMDu3AyRCTx/BhXdyA97KOpecD6uHbKpaWjtKqk/GEgWR
         ckfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772831844; x=1773436644;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y14EKX3r2NZEaQlK0jcqQywAmjLktS244ugWnhJ7Cns=;
        b=eg1fgNxZB1xYyp+BYHWymSUF/aGL6khM66d7R3LN2iOC6j9sFmNnwl0cblXnMRN+TV
         RVUZPRPq3K5ZfY9gccR7ECayGXbwJuEwdZHn+yvMaXhbOfqlaclWcpb0YBPzBfYUmN/6
         r+TGcvHRhzzq1t8gqpOq+Io/lavcLEgshYiQ54lNt/AxZj+R3FHlFRx2e6SyURIN9Mnh
         KaK6Vb+VlsGpHjr/PIwp4Oz6SOu1El1uX9kZHT3yDp8GwYWCKomgN3Ye9rj2sdjs3CIQ
         ufGZ6ddy07h/oJ5G0hx3uoJOa+0g6mRdbASfQDv23XNAS5CrfSFHO3IYk0E7u9c+oNbk
         zLzw==
X-Forwarded-Encrypted: i=1; AJvYcCUL++/fkAYnHjTfkuTmQIP5Ggl368gLRNP7mjZkuFXdbsbj3evWgTpuyS3iJEJrn9r/UcmqjTs9Wr/2I+4Ahb4P+g==@vger.kernel.org
X-Gm-Message-State: AOJu0YxQTDyC959BvkOpa44Z6Al4kfi0AulvFB7BTQB2+XnECwNwuTAM
	9ux9cPve/pt7KtlfaSRuL7Axn6mGaPMWENB3W06vCb4QjWGihnynfeptRduhKxrEyCIZ/CmfvF7
	6ZF4HnjExoBoWJiMq9MQqR+rViqJlVndYiSJyOW3ScA==
X-Gm-Gg: ATEYQzz3k0ZxL4zlyQ6FdjzI4fRwiWjKE3VAf/lDdW/lw/iwHu1JbYVvhT2ZKsRMNPG
	LRJRWXNheObPc5dE2ZWjOtEnw/QTFgsPPkBAbRL+ICmhL5PrJBaIqpJtq7+cXm4DXaPtwRA1RiO
	1rMyze8QD5dfPk8ayJZC9J19PKJjlfGKW7Nw1SfXDYsfzoBLM2MlemrV8zWcgcfXzhl4Y33CJwq
	aFdf/MmSbuyt+W7q/YowPmBBngOfCU4XgOMiMkQ8YGHgym316+R7rnZr72QDZoFVmGJ0JTXa/Ha
	eyMYol+wvXTCD1mGQTUkmsxRNOx7g2ysQ7t5G6F23Q==
X-Received: by 2002:a05:6402:5212:b0:658:3972:3a3d with SMTP id
 4fb4d7f45d1cf-6619d4e398bmr1927227a12.15.1772831843780; Fri, 06 Mar 2026
 13:17:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CGME20251202093027epcas2p24adbd3226dd50b2780baceee6588f3ba@epcas2p2.samsung.com>
 <20251202093613.852109-1-youngmin.nam@samsung.com> <20251202093613.852109-3-youngmin.nam@samsung.com>
In-Reply-To: <20251202093613.852109-3-youngmin.nam@samsung.com>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 6 Mar 2026 21:17:11 +0000
X-Gm-Features: AaiRm53SUdPof_w4nrcD9oxrYObtPjzHD4ttJpdhJJCx0aq8VDLK-ZgvyeHdAs8
Message-ID: <CADrjBPqYT9h_UJKSxBJ_KMQ4yQv4yyTuHaPYjC+K1-6TZj+PXg@mail.gmail.com>
Subject: Re: [PATCH v3 2/5] pinctrl: samsung: fix incorrect pin-bank entries
 on Exynos2200/7885/8890/8895
To: Youngmin Nam <youngmin.nam@samsung.com>
Cc: krzk@kernel.org, s.nawrocki@samsung.com, alim.akhtar@samsung.com, 
	linus.walleij@linaro.org, semen.protsenko@linaro.org, 
	ivo.ivanov.ivanov1@gmail.com, ryu.real@samsung.com, d7271.choe@samsung.com, 
	shin.son@samsung.com, jaewon02.kim@samsung.com, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Youngmin,

On Tue, 2 Dec 2025 at 09:30, Youngmin Nam <youngmin.nam@samsung.com> wrote:
>
> This patch corrects wrong pin bank table definitions for 4 SoCs based on
> their TRMs.
>
> Exynos2200
> - gpq0/1/2 were using EXYNOS_PIN_BANK_EINTN(), which implies a
>   'bank_type_off' layout (.fld_width = {4,1,2,2,2,2}).
> - Per the SoC TRM these banks must use the 'alive' layout
>   (.fld_width = {4,1,4,4}).
> - Switch them to EXYNOS9_PIN_BANK_EINTN(exynos9_bank_type_alive, ...).
>
> Exynos7885
> - etc0, etc1: update bank type to match the SoC TRM.
> - gpq0 is a non-wakeup interrupt bank; change EINTW -> EINTN accordingly.
>
> Exynos8890
> - Per the SoC TRM, rename bank ect0 to gpb3 and mark it as
>   a non-external interrupt bank.
> - gpi1, gpi2: update bank type to match the SoC TRM.
>   exynos8895_bank_type_off (.fld_width = {4,1,2,3,2,2}) ->
>   exynos5433_bank_type_off (.fld_width = {4,1,2,4,2,2})
> - Per the SoC TRM, mark etc1 as a non-external interrupt bank.
> - apply lower case style for hex numbers.
>
> Exynos8895
> - gpa4 is a non-wakeup interrupt bank per the SoC TRM.
>   change EINTW -> EINTN. (The bank_type itself was correct and is kept
>   unchanged.)
> - apply lower case style for hex numbers.
>
> This aligns the pin-bank tables with the documented bitfield layouts and
> wakeup domains. No DT/ABI change.
>
> Signed-off-by: Youngmin Nam <youngmin.nam@samsung.com>
> Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>
> Reviewed-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
> Tested-by: Sam Protsenko <semen.protsenko@linaro.org>
> ---

This patch contains some worthwhile fixes for multiple Exynos SoCs. Do
you plan to re-send it? I think it would be good to get this merged
(even if there isn't broad agreement around renaming the pinctrl
macros to EXYNOS9_)

Thanks,

Peter
