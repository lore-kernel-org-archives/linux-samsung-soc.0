Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42D5215098E;
	Wed, 21 Aug 2024 16:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724259442; cv=none; b=acg3YpKgY8e78OmTA9WChH6mBuf3aMd9z0UxMfeADVFQ3oB5eJFZNl1gsL3ankCZpzaVY4LncI7lsO80+5nRM+Zngwjd4bogAZSdYD4HjU8Oea9zokZB+RjFXJVrr2NJm6FE6mlSkx153X0Z1MWdUtXmHsOYKiLmFvNZ6QwdS2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724259442; c=relaxed/simple;
	bh=HiQQB5BPqoIy9hzhjqXMK/0ng7SnxS/RfC+abHKR8lk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XQiPV6c3zyqXksYlxWJ6VXn//JD2l9zYhNHODIUOHgY44gtN3C4G4BK2+80HVOWsdz3r6zV35NtBE8rcuDh3w43FIBRfPaIO8oBUAu6EGq6kGb/QPl/Yiwx/82gw+qemdXeLcW3GLrxzHMQQFYt2CmfFLOQUbOoLVRa4VffyODE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MxUyYIsb; arc=none smtp.client-ip=209.85.160.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MxUyYIsb"
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-270263932d5so3288736fac.2;
        Wed, 21 Aug 2024 09:57:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724259440; x=1724864240; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=HiQQB5BPqoIy9hzhjqXMK/0ng7SnxS/RfC+abHKR8lk=;
        b=MxUyYIsbPDW3acpbFuR3oq6+p1jz6qiBYtMohUtP0wVv18o+budpySC+hkq1fsHU6N
         xNWdZSeJNUrmNsEUfxoHivCrUPgqxoEKYRcN5O90EQsKB2to+k+iHMGABmrpi5Im4lzw
         AhhA1L0W95YeMjpE3mNf/Dl8xRxg8NFOGeZb5Uytu1dThdJ/QT2aSW9FEZr753wmkJ0n
         Te+VZwFC7pFRZf5q/kbtfWzoCz6TSwui41iU38gpwFUyXnuQDtkBCRGsmS75GMJno/mB
         W4l/c6TYlkK8dXYiBbF6TK0nWmjcAV4c091G9TmEogcPCr4cjbrk1fsuc8QdcycJsXFf
         fMCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724259440; x=1724864240;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HiQQB5BPqoIy9hzhjqXMK/0ng7SnxS/RfC+abHKR8lk=;
        b=rci3LY2LMOE9zQqgMUOgZkF6JU2NMWXx0uOw9VJAB+jJ2L1WFxs+M1eknx0+KnzDq8
         fqdKD4pdXbNxlcRhN2WDEJ33YCYWSXfQLwwNjSGP2zw93CEcnOf0k3ixMfAbzyJ16e+Q
         a49ItnzlRS8xoVg0z1FGtIvP0I709cSuy1ckG4Z+lck/V93GCcNv71/Id352BNrP4S4H
         C87BS/zopFBY+t0a4Lo3hiQhys/GK+e7sWCR2g0hAqA++dljuplpPmt0krU8fiUiplon
         yHOY2D1xP0TAN+NmXx1jkQ1PMeSpdoOIKw6JoCV/y3Kj7sv4hqH1D7q284b9T6NrueAa
         Gucg==
X-Forwarded-Encrypted: i=1; AJvYcCWClwzThylNiYVhjV2JaPJiXINDTez1owil62rfVd8FKOTxBdvpulTtO2A79z92JlSEVLZtMw2upsD0I/Q=@vger.kernel.org, AJvYcCX4nIx3mYBePa6m2L7kDqAIlmicQQEgP6vsrprIjZNo3Hkh3yIHM4jEkM9XDY7CWWuUWlDEvGaGsxe3@vger.kernel.org, AJvYcCXXkkFTVBmU0xE8+pXlRxIQzQM/eBR/L2xVsYnko2AFopWmdRmmQ4G87WSYLNofUBbtP8nFABRkGYlcU4fuLH29UGg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyqgga1MyQS1YFTLtgspKjFUJt0tUEGgZ7G32vOwKWZc3+j9VsQ
	s1fvWOkLWX1183zv2LY2K7Z3UxxUeh6U4dRBU4z5MYaUaKxgyAk97cMq6i8nBLHlfsgIjHjVwcR
	v/LEsyHiKXY+f1bufSMVTw5hYbAk=
X-Google-Smtp-Source: AGHT+IFZpKlokvxuqGz8vE2ZpUILfWKw/N2m7OGMXJILmuUO3YUFksxquBEIoOwrBY9kdySTdYjjfYu3aJGgXibKhM4=
X-Received: by 2002:a05:6870:968b:b0:261:290:a089 with SMTP id
 586e51a60fabf-2737ef6e791mr3144976fac.28.1724259440233; Wed, 21 Aug 2024
 09:57:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240821071856.2335529-1-ruanjinjie@huawei.com>
In-Reply-To: <20240821071856.2335529-1-ruanjinjie@huawei.com>
From: Anand Moon <linux.amoon@gmail.com>
Date: Wed, 21 Aug 2024 22:27:03 +0530
Message-ID: <CANAwSgSegd76nPmNj_tWNa+-hvK-7oQ=zRky5B+LUw7wmks_bQ@mail.gmail.com>
Subject: Re: [PATCH -next v2] usb: ehci-exynos: Simplify with scoped for each
 OF child loop
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: stern@rowland.harvard.edu, gregkh@linuxfoundation.org, krzk@kernel.org, 
	alim.akhtar@samsung.com, linux-usb@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Jinjie,

On Wed, 21 Aug 2024 at 12:42, Jinjie Ruan <ruanjinjie@huawei.com> wrote:
>
> Use scoped for_each_available_child_of_node_scoped() when iterating over
> device nodes to make code a bit simpler.
>
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
Reviewed-by: Anand Moon <linux.amoon@gmail.com>

Thanks
-Anand
