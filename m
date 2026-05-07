Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CBC63E7150
	for <linux-samsung-soc@vger.kernel.org>; Thu,  7 May 2026 10:54:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778151258; cv=pass; b=Af+ILCO2nvLq7Qd/TnuHy9dGwr4HOAZlfJfdcCaCMm1KoqYQGa31lhj4Vlxyd09uldkw3aWBzewoMhhgulXBf5Pg+5ZzG+qPr5+5PLrJ+JhfxfQ36qC7Y8pTivI+PsDxk4MHJ7vxJFLsoZ5wiLyYfYMbm2/NHFSorP/anuLF1jM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778151258; c=relaxed/simple;
	bh=IF7uiHUYLYrhqG+FspNFwJJCVwTRPmqazl4TaUyXmq0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qMwhR0+DYoxjVhu1Ni/dx+RmtZKdSR4qGzqGaUZw6WCe+rU/kh2dOlGGjZLAm2NitkSS673Z1s79tGHZtevXtr4RMbDrKwyXpMrVE6Gbt09563gN5IO6X1ZVbtUzKeYDiM4WRbmIeWwjHotICOLLf6yxtz1A4NnnkzLUxcS04Ow=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=If+aXJer; arc=pass smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="If+aXJer"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-67b7c77865dso1036911a12.2
        for <linux-samsung-soc@vger.kernel.org>; Thu, 07 May 2026 03:54:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778151248; cv=none;
        d=google.com; s=arc-20240605;
        b=iYyVBrxvz16uWzjtBRm3oRf+PP1MBmpCyaKe8LWb45ZBqTDVZBzBU3BKKfaGK1DDgI
         yxnStHhvaxlGQdl4nLhh4dV/tFrHHiaNv0A4+QgCbFFr/k3Wh4RbuqpDr1Ul23B2OKCV
         zhbP37w9vx8MzOwIquRbwgGn6fen3zEbFgB7EkOEDDwmM4jnCeb6HMd9fUxOnMyN+NMb
         gYlQ2nTVYj+f737AmKCFQf0aKC+TXji6yhGtYf7dAYkAebELgfqX1DgclD8UKPsw4G1x
         /8va6BHyqhpsHbZlWFORkspi3jkM44Ycdw6jmNIBcsGlEc7uKDih7g/ks+ezwQMj395L
         wiFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=IF7uiHUYLYrhqG+FspNFwJJCVwTRPmqazl4TaUyXmq0=;
        fh=g09/SFCVusMG9oNru+JsPWY5cz+pvWwk0vIf57aZZCA=;
        b=RqY9kwzS8MwWvP8pzNJ9kxd6yATr6qtX7Bkna8v6vdPt6+Smjmhdn66jPNHTDdgR4v
         EBZvzQwTSIsOnGCE65E0QrqDrnPGG1o5tI+X0Hepm1BmuVIyfko4xSfJiOIRlQBYS3P2
         A//fNui8gmRdGcEIrE2SHp3vFg/MkEJdOM5e+FiRKDoDU7j6IL7KnY7HV2P2F8hfInNE
         eyX5koGPH1aDpo4rgy3Mewc88WkjQWbN/FLPZPRwxAAfSxOmHeNRZzhCkjJ+8CzXuQul
         +AvzQ1yScUsOtWcbpHNnFkhP5S1xGJsDbzCN7rQU+7rNIEirPGgR0fjX9mVKjYK7JUxI
         aFdQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778151248; x=1778756048; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=IF7uiHUYLYrhqG+FspNFwJJCVwTRPmqazl4TaUyXmq0=;
        b=If+aXJer1wEhFbQu/wVtADCwb9PZjxhYmN59JyeQnmZXVwkyjcNt6Qmw7xB50cPUOm
         /OlY0+i7T5e5/aQx7oYaRttZ3RKH/BZ9tfkWxjXZHNInYieI1nkx3Zlqxi2rcYx5T6sk
         IEUY0zyENZ0xHx6oM7U4cDmsW7AKfR5BHS+iFFAPK98xLJ5duldRN3hZ+MopFbWIC8cJ
         U7IscOVA/HPfWntbeeDdWUJUpwPt0ZXiFCDCDgnpQXwMl9PmJLRmUFvaYe/KcYyY6Qpt
         3e5BSTaOtWwxzFdakQiEKSM3+UNJZ8fR9kH+dnJ6OmF0aB7AHYRxWvBDdit6kR89/E9p
         iIJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778151248; x=1778756048;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IF7uiHUYLYrhqG+FspNFwJJCVwTRPmqazl4TaUyXmq0=;
        b=h4vihW186fFAJtmgOMT+Xqu6qlqZZEnaFAUFo+U6ADb1z3ygigLQ/8A36SYjjmS6j8
         QBQ3JN8Iw27Azgm+xG/C9GC5mTXBYzVBopTwmvmjZ+b5RRyuTVTKbhUTkXbZnnHy7Tpe
         3/G2zCCVpYN4eQvefdcGicmtGsJNoY1d5Y9LLsEziM2br12RRyQ2K144japRBw+Qbldl
         vAHgtIBq7c3hHbH8x4iJwpS5au4vpr1WyrVxdes1JDHSw718ftBNpf2qL85kXmp5YmT5
         MHDHvsOA4BBYWCWGPBGRLK2jMRrtTsAAYDmP+m0DneAK3Dz+txtJpB0CxKSC/6+VxSrP
         WemQ==
X-Forwarded-Encrypted: i=1; AFNElJ8LfkU9+JN8Lq+VSCb49teFIXmS+1kLH9MWFCtCIRYVHlb3PLlG4KdZSrSX/0aHpYyxfIbxxNGs8oBuFUBW6CVcOg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwshWdwGJrj4zaTs6aWHArlXHhK6v9OkVw+pE9simOATvDL13P9
	e6C09Is3ip39QA+Svo2hkSmR5PGJiDwuxsK7rI4p32pGUovBxPDeGswK43cLiSyoQD3CqBpZYnl
	Hm3eWf0zSmDKymZKsIOYspLjw5ncno/DS1DVm+5S1sg==
X-Gm-Gg: AeBDiesh15i+TZ8PSP1VvdNQ2KiqaglJSP6sSxRNCBLy37ITVGiGENKI+JQ+mlNtftq
	qU+q4nBv4y0SRMfnC8fXvBGNNTrqIYyrlQN+TBrQVim56JTV0tUftedYc/WzTeip9q36905m+2l
	PYWqnyDUt1sDrcQi1CDJRj9yCYPPXOmTUixnOWnVbez/EKLsQJSl3Ja/XIXNXVSvjPP8PeANuOQ
	vJ1SnJHEanObH9JXSuKac3A5aSpn9B4nJ+U9y8I2zY7064LkUfWmCVqor3vnS0Nwmp2oKMHnx8l
	ONJ7th7Et9Im4uYhPCb8vnP/d8t3DrFlZH6nlaqjduwO8HgrjNA=
X-Received: by 2002:a05:6402:3137:b0:67c:4e1b:9134 with SMTP id
 4fb4d7f45d1cf-67d642c320fmr2566539a12.14.1778151248006; Thu, 07 May 2026
 03:54:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260505171457.1960837-1-visitorckw@gmail.com>
In-Reply-To: <20260505171457.1960837-1-visitorckw@gmail.com>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Thu, 7 May 2026 11:53:56 +0100
X-Gm-Features: AVHnY4LKSqPHnQncQquj9gD7adTrcRRUygj_CaGGPmUeQcE-vkzmMD9ri7yM0M8
Message-ID: <CADrjBPp321nAD1nKs3VApd-6t6guK7b6k-cjsXHhS19_fJiOVQ@mail.gmail.com>
Subject: Re: [PATCH] clk: samsung: gs101: Fix missing USI7_USI DIV clock in peric0_clk_regs
To: Kuan-Wei Chiu <visitorckw@gmail.com>
Cc: krzk@kernel.org, s.nawrocki@samsung.com, cw00.choi@samsung.com, 
	mturquette@baylibre.com, sboyd@kernel.org, andre.draszik@linaro.org, 
	tudor.ambarus@linaro.org, alim.akhtar@samsung.com, semen.protsenko@linaro.org, 
	wllee@google.com, hsuanting@google.com, marscheng@google.com, 
	jserv@ccns.ncku.edu.tw, eleanor15x@gmail.com, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	visitorckw@google.com
Content-Type: text/plain; charset="UTF-8"

On Tue, 5 May 2026 at 18:15, Kuan-Wei Chiu <visitorckw@gmail.com> wrote:
>
> In the peric0_clk_regs array, the divider register offset for USI6 was
> accidentally listed twice, while the divider for USI7 was omitted.
>
> Missing this DIV register causes the USI7 clock divider setting to be
> lost and reset to its hardware default value during a suspend/resume
> cycle.
>
> Replace the duplicated USI6 DIV entry with the correct USI7 DIV
> register.
>
> Fixes: 893f133a040b ("clk: samsung: gs101: add support for cmu_peric0")
> Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
