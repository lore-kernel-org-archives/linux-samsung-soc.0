Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FA2E439008
	for <linux-samsung-soc@vger.kernel.org>; Tue, 15 Sep 2026 04:45:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789447523; cv=pass; b=Y6cvFqCuEeWfE+Fl8MKbOGU1kxK9W+GMqz/kz3ZJJf03m9UBsss2dT3kk9kxevjAxxxItUhsLuxpkdgX4yNshR3FGTPm3AWgufKLe9N1bqQC6WHy91+yGdtozxErHywfJXf/1cLhQQS4ZR9y7n16DWRPB7IvsTO3PfmLmGGqPSA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789447523; c=relaxed/simple;
	bh=1fCyBztB56Mbm6pG1VzHl6tMEqvrCbAMMCDlWGNMGAw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AIKlblm7dPP26ysTuLGmpErcK7NTdp2Stk9kIESwZn9N13iyynZBCVIuX+6H5Flw++Mx2eG+Pogf/SrTgPNfe6NP+G60BEx4sbnncRMXPAmL1a4KTaA8ZLbLT9e9A0gnwuQ8V6VdPS1x9t0DQweIdSl5hhT3WnIHZiNhI71h2Vs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CmCAew7o; arc=pass smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CmCAew7o"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254f70553dso482441866b.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 14 Sep 2026 21:45:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789447520; cv=none;
        d=google.com; s=arc-20260327;
        b=bE5aUCRhfOfkawVBCjgZxFiiEZjkfGEoLAQFbVzbrP24/1b/r6GjlKUkmtxDfpUJHM
         SdGKirpvCvwtHu47hT+wcyga1aoOa2JVQWnNz+jjMt3r9fb6gRqiFhpfRI0QjCeqSlgp
         RZinPyw8WkoSid/zpdTiLSJc3gR7gu9vNWpoFRGT5A+S5seC4vG/uTlli20u6yveWcv9
         9coy6QYL+DZnswhHh/HkGYUqkRe3n3/jde0DG716e/BjBws2SJgMQSz8dKCRj6hYM+3N
         dWNWRFCoGpPd99vfu+F3KA2mb8MtxjeEx/3d7B8T+4icmq/oseHkXK6jieTaf2mQnDZ+
         hUUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=1fCyBztB56Mbm6pG1VzHl6tMEqvrCbAMMCDlWGNMGAw=;
        fh=w3QrewPpTVxSwFFGZ4VeelfynahVpWRcYjq1bXLalTA=;
        b=CKOCRt1o3BPi1wC3eIMdnwhrob8XePAF0F35k11XS8fUK+TwHmP5ve66pPau2rWpyd
         Sni8Sd4gT3+4ETSzSJOSXT21lbrRJ7Ou75aR9IbOWwlXg2341J37GU9TCDqu4pxEF2vD
         pBsVFe437mP3QvwIGBBdRFpo473l0M48jH5572BbkBQWnDUYOAXl2XaVfRKrJj2UE52L
         aird7YJmBKx2tEKb98cX94Mo1QQb1pxCAR4490GGQw4k2wRp9Q0sKyMVDuQr0IBeDvdl
         RkMnUzijTrawgEvItJ6iVbqTcLA5qhY9EifNvjz3Xv41aON5onpis6pYooocEeULsAgc
         9ikQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789447520; x=1790052320; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1fCyBztB56Mbm6pG1VzHl6tMEqvrCbAMMCDlWGNMGAw=;
        b=CmCAew7oGSIiROxNY4a4SIyUoXgYoX64btMSKyEAlSAD1OWObKj3xwLX/lEEpSrg/Q
         A0OUZ/Cu/2gvLy1i4OGAPEeuBjSTS8qYGQ80vO8P3btG0ZjmrI3OBf3bD8c85WkWTIkn
         owXGWJcUfYJ2VmHEUZd3FkEnw2yLdXi1gs26PJgrqoq1I9JYqO0Hmc1AV21zyuvNT1gQ
         bwrWTyPvE7LVw+4YZ+3MhHHC48G2vA+09ePw6XMZEmdArvrVjqDHvV+qUL/nBx4oC2XU
         Sg+0rx5P2WMVVcASS8hWRR8934LZGLlN+iq9W0qD1t6XWV/BoBPfx8gTujCCTTEdTGv4
         C8Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789447520; x=1790052320;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1fCyBztB56Mbm6pG1VzHl6tMEqvrCbAMMCDlWGNMGAw=;
        b=OO2dP9PgONQpLRMwmaQkwUlDysCf+pOg2cfkIeLiUGsW2ctX201166umXtj9lRIxEN
         aFlnCEz7P1egK7B1OBHn5/IUn8nuTE24ny8f19PLG1G8jVCgyvOuZUHybF6SajW1+b+G
         afIumXcYiIDO/sBhfFdHtI1Vsbzx5msS/h+HUkxM7rEALmBdeLijyNWQwvy1Eevf6L59
         De1iApOKVd2DlxUd4jA+tLDj9rSQKR+xW+OQQGpO9IIgKn7om6OST5JReE/5LzVoY9Bq
         zySLQ5j53lYphTM4H5DQJE6KtsHOqBp7fqJ5itoaCY4VbKkwKYiOEGzMmnKnJjXMbEgk
         MRQQ==
X-Forwarded-Encrypted: i=1; AKwUvBzILpZpj6wDUsxUaghV05hmAOtcD3URUxOgyRcqHKlSM5Ku2FdLXjSklaNqsFP6wJNSCus/GWhX7GTtnPj0L06lXg==@vger.kernel.org
X-Gm-Message-State: AFuF++lNilXgSaAoN45cVaxg+Bh7GMdOsx7BjEC1KUXcoO8/3B6me1cf
	hBJz/6StcLuRl4JoqscvXDpVuXE9cBbIDFKirq/Cqd2pSwTtqKSKPsmLhAoqL5hfAWd9MOqBIXR
	W+nFYScYZyN9oeXuIBAdY4Uk/MbQtVnA=
X-Gm-Gg: AYBFou2S1AA2yX4vhcpJIiBzKLBl41NHKG/l1DjrsC+B0FOd4hA04zFaz4gz/tN77hO
	MTCqQ5WGtkX1k+iZA9g06cVw8lyyeexrTvKsAWrGvsEtCQvI33D/VKtMyxd0867mWpHV9UjC5+p
	idqIPqbECamCRUVrwl7bY4WRX6SE+s38KDZCojF/95URZLmgFe1mEWLod/6KvOamUMsOKrhSyKG
	hsuv5n1rN+Af6vIoTVh1bShNNVlxjh+Sy9AnPJ7aEv/xRZbGJ3Y7gm5VkJhwXIggAWFHDm1Sa7H
	R/xvtaNKC8bH1zwVPPvOmk6qSU9cBSvIKh6bz+fZ1qbXOYnNWUK3tg==
X-Received: by 2002:a17:907:7b85:b0:c26:36c4:858e with SMTP id
 a640c23a62f3a-c29b8726f8fmr326120966b.25.1789447519950; Mon, 14 Sep 2026
 21:45:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260913145905.9404-1-linux.amoon@gmail.com> <20260913145905.9404-4-linux.amoon@gmail.com>
 <a835cdf1-b0b5-4719-8b5e-226fee78b856@kernel.org>
In-Reply-To: <a835cdf1-b0b5-4719-8b5e-226fee78b856@kernel.org>
From: Anand Moon <linux.amoon@gmail.com>
Date: Tue, 15 Sep 2026 10:15:03 +0530
X-Gm-Features: AcwNN1X6uQRHhT6qwboNgDZri63s8FVYRlQvpJVAgezJWpeLkP8LX7XyBkGQ7dE
Message-ID: <CANAwSgRETNrPmwGvv2z8Q8EF--W19u6iB1goNZHUzKp64s3_Fg@mail.gmail.com>
Subject: Re: [PATCH v9 3/9] thermal/drivers/exynos: Handle optional triminfo
 clock correctly
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
On Mon, 14 Sept 2026 at 12:37, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On 13/09/2026 16:58, Anand Moon wrote:
> > The triminfo clock is obtained using devm_clk_get_optional_prepared(),
>
> No, it is not. It is devm_clk_get().
>
The data->clk_sec checks were changed to handle the NULL return
 from devm_clk_get_optional_prepared() its only used by Exynos5420.
> Order your patches correctly or do not introduce bugs in patch #1 which
> you then fixup in next patch.
>
I will reorder / fix the series so that the clock API conversion and
the error NULL
handling are introduced together.
>
> Best regards,
> Krzysztof
Thanks
-Anand
