Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE80E10E0;
	Sun,  2 Feb 2025 04:03:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738469008; cv=none; b=VfwjlRCqVdbxJkMYRhlOqIpiNQO4Jk6l/M+xT1iQ4aoJ0aVsOjKikDYt1+j2Wd+gk8mQ5sczUDf4oTsYPt7qYtEVhB/JLmCaJkw0AcbR6lLxlYjMqW6TnwDJWAzgNpBuop8SuAef6yl6UNxHgb51QRs/yZKnazr3uUXSYNDDryI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738469008; c=relaxed/simple;
	bh=SH4RP09HGRTNLw517IavrZ28V8OvBaUh3MeJvwyQOHI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VTrQv6t5iDYDUuIeFyydC3N6SKVrrQbr49QPPaQExDKRhC+LK0Wij96pBfalTV6J1vcY9BWJSD5JvXIWhWGOJYBxY/yYAv/6In9eNWmABYOYst51rwK5tlZ7nN3NW/kNVfh/lfQBESPdsHIEfDkV/HyiyoJVVjpk8jBo4PLQPvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mTr+MCz8; arc=none smtp.client-ip=209.85.217.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mTr+MCz8"
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-4aff5b3845eso1330675137.2;
        Sat, 01 Feb 2025 20:03:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738469006; x=1739073806; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ce0FET0IfkIOlTle7eps0vS3nFf1UCmQKqVcb2oIVfE=;
        b=mTr+MCz8vVP31kBew4WlZQqHfXNZybe9inHKfO8ffMqdmAGx2fpJ7pE6zYEBy7qt2l
         DSsQ2nrvNHr5nOyL/A7jke74Vjd5rkwz0HgRjA87QZ3v+95JRpGqy3GHunjBUGEfW+vD
         sKxWiocjqo+qYlrVaf10R7nxOBWhOhUUwudzZ4HHfMQZbA4/9r+vr9zqKJkULUW6eGFd
         GAsHf9clg83ErF6t8/jvRPbSTDTAMRFfy4T4O5IdD2AevFzayZ/HnPCehadNgX+JH6x7
         gm1vf5rDBrV82+FkUi0Fq8dZF8c7rx1mFQoaTX65pxoSc3WDflHrm9LAS7ogfe9xTt/1
         C/yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738469006; x=1739073806;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ce0FET0IfkIOlTle7eps0vS3nFf1UCmQKqVcb2oIVfE=;
        b=I9H7dblRBJZhbYbHFz4StA8Bx2oWzeQEYa4chIKxXQhcpxa6MvDrV5H3JKkVMYujnm
         ha1zS1bydYPamHpj+RRqxpLu+9LF98toYmxNVq2Cz7zwy05Y8QMWz439n9cPMz8JwTbA
         QL33KcY+uyDJmvH6UOtadF+6urMlPTIexmWbIMzJ7bUmLRQVS52oORY471hvzGM2G1Ez
         y7fJ6B5I2l0oU/mP9XsKcM1zJBqPn+5YjMSQguOWnPEwAB4cK1PLl0u221GYFOzzDtCU
         JPz8aWBfS2To3HonaBQ+z7DtHf63j4LEns85iRIxrEEmyYnRSPYJZl5T4Jb20rZVNKQm
         E2TQ==
X-Forwarded-Encrypted: i=1; AJvYcCUStSMlSaREbCH66fEVHCHuSjUmLHt8rTfbujsPWEz/fup4LPobSJLQ7UPmjz9r0Nb54lNuTNcE+nRpBls=@vger.kernel.org, AJvYcCW1XPXJGDcq3yCMo3GeOBpqWxsgU+6JC53whLW51q0XeEksPiU19CSgctE6FAQNa4IYuTVrFnyl7C1pBMqgK0856AM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzEn02rmeeZqT34ZBusVElRR2qPLJxYXq1rqDO0xJl1zo2/9nDj
	xS2KnkHzs+lw1N7CcB548cxX0FxTM1O7QI2uI8dB5MAFLt9INeavP7OBO8zvkTUdZmzX6ehPPgv
	943tkG7Z385IX+z50kZvgsdV3ZvE=
X-Gm-Gg: ASbGncvGTqMNKMPhKJhacDONV7X9smNMqjSLCnz09bSHZTBb+OA+bBKRgLjNlXq/716
	AiQPRAKfHmUVdF23EKBrpu1DMKQPIxkSO+PqriTWdXrRN1P4qJpxQluwvWIP9ZN6F3sKRzyc=
X-Google-Smtp-Source: AGHT+IEl2hwFbFW7YBYOu+GLWt5eM+n+AOb40sBzZ1Uqgh3CYrzMGQfoNdzZenlrAl/ISiDC0/BrrxYhxOBYcrRDv1o=
X-Received: by 2002:a05:6102:3ed0:b0:4b4:6988:b12b with SMTP id
 ada2fe7eead31-4b9a523c972mr13337687137.23.1738469005670; Sat, 01 Feb 2025
 20:03:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250131165549.GA684322@bhelgaas>
In-Reply-To: <20250131165549.GA684322@bhelgaas>
From: Inki Dae <daeinki@gmail.com>
Date: Sun, 2 Feb 2025 13:02:47 +0900
X-Gm-Features: AWEUYZmqMRW6IjLJ2-1W_gEn2kSwXk8I9ORt1L9SvKNpwZDk2Y6UeiwO2M7pvFE
Message-ID: <CAAQKjZNqFt=SYxCzpQ5JwOADRUwsWsq5KzLRoPG++27SXGubnQ@mail.gmail.com>
Subject: Re: wait_event_timeout() usage in decon_wait_for_vblank()
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

2025=EB=85=84 2=EC=9B=94 1=EC=9D=BC (=ED=86=A0) =EC=98=A4=EC=A0=84 1:56, Bj=
orn Helgaas <helgaas@kernel.org>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> I don't know this code at all, so this is likely just noise, but the
> wait_event_timeout() usage in decon_wait_for_vblank() looks funny to
> me.
>
> decon_wait_for_vblank() waits on wait_vsync_queue for wait_vsync_event
> to be cleared.
>
> But decon_irq_handler() only clears wait_vsync_event and wakes up
> wait_vsync_queue when !ctx->i80_if.
>
> I don't see any i80_if connection in decon_wait_for_vblank().  Does
> the wait always time out if i80_if is set?  Is there some reason we
> don't use decon_wait_for_vblank() at all if i80_if is set?
>

For the decon series, the implementation for the i80 interface has not
yet been completed. If you would like to see how the i80 interface is
handled in Exynos, please refer to the code for the legacy display
controller module, exynos_drm_fimd.c, available at the following link:
https://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos.git/tree=
/drivers/gpu/drm/exynos/exynos_drm_fimd.c?h=3Dexynos-drm-fixes#n1053

Furthermore, please note that within the decon driver, prior to
creating the CRTC, it is necessary to implement the TE handler for the
i80 interface in the te_handler of exynos_drm_crtc_ops and register it
as a callback.

Thanks,
Inki Dae

> Bjorn
>
