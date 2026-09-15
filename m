Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 945F2434407
	for <linux-samsung-soc@vger.kernel.org>; Tue, 15 Sep 2026 04:43:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789447400; cv=pass; b=utw3/smHo1aokZ1i2uEcRTVmTg6vkX8wTFXFvV/I2G8zF6LuGOarkjkpvp9p+Cmcpn9aPuvcwYciO+YXIcmOYdnjRzX5aSSzYW1UwQ8/gg0W7Scc7IH28MFDikyasZlzZ9dREEhLLEoIoVCTrHiu141MqkC8QGE58fM8oeV45wg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789447400; c=relaxed/simple;
	bh=UoOAQKGYJOU9cLqt1H/9UiJiW7vYwYjslaP7yC1APho=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Z6D2pPYCJO0qjg02iQ40F0Q2LJ4JSHKf4t/6KxiKeUINY103foiSaY5KX3y0rPNh5TszRvVC9p0tluT/IunolDLE+4h2Xq3pu+2ta1bPhkifNTdkZFRN3LRq1umZZncJHl63RuxlbuWeI/H8ZIlkZ6jBq3/XkSzk8v8uvx9Zxww=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TQ8R94iD; arc=pass smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TQ8R94iD"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254f55eff0so345774366b.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 14 Sep 2026 21:43:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789447397; cv=none;
        d=google.com; s=arc-20260327;
        b=ehQfTuqskszuV3k7VzPcXcJgA7y9wqGoC6yJj4XrpordFyx47tsNfIWf8Kdws/xvDW
         l0owXI+z/cLOzYEUnpYrtMxX/SpXFG4Mg5mHpVGFLhJ9FhEC8+gi4vvw4cPmgPOp9c9e
         xWK9b3X+CDC8heUTuVpsBvDCJ2mN06VuavjbVlJl4zD0qYiPm5z7bRDdn3bE8MtKUD+m
         mX9XBaya0S6a/+Zc5u6skuN/DnxhhSsAfXhkm3YEE3Vf4c+1qoLGpBKTvI320Z9k2UUR
         24YDVVPK8Fz78m0BYiEjwd9cF9lhQjAuRaydymek0tPCL3qn9lPm1wMZcNJfRsNOmGei
         AYjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=UoOAQKGYJOU9cLqt1H/9UiJiW7vYwYjslaP7yC1APho=;
        fh=evDemQrsv3JFRAkgeaqNBV5+s97XrSxadqp/PUrEeno=;
        b=BT0Bafdxk5KZKSfRgCv0cv8VxWWCISPhpq4LwC9kOERVElXYp8TSguSMhd+dXdNtQX
         jGocP2TPYuQaRwYIZT4KzH5Pry23Y2fhxv3gRwEXlSIayRBHn3d+S1ydBAt+S80E4QyU
         6hA/LiJcWLAlw2DgRlcRG796L2ZSn/L+7QH2wSRRhovthP4NZoBUroZ3LTTa29ISODvr
         3DkTLhozfFqwBbvd52+Ao0MRfcUwjSL15JpJL3Q5h5PB3/Pk9jG6ps/0YkSj6l3e2f9G
         9ALUZ8ckhhedl0VbQi0xsj532jRFAVk+E4EZhYEFP4Uza3X7LMUmva/Mc+P/2fZmiU1I
         y1IQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789447397; x=1790052197; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UoOAQKGYJOU9cLqt1H/9UiJiW7vYwYjslaP7yC1APho=;
        b=TQ8R94iDFwXuJX7e14L8JdC4fweRv2qVAmZU/jAi6qsHVzhqAaj7nr+GXUKXCzvRoI
         thn85S3kjCkA1cyuDHqjGcbqmKDE2+PAJk4Re+5yJPczSLI8X5G3v32HgYqLFD8nZVCd
         QfXWZ0W3FMzavuYh+n6X+REVhPcer3q95CI/qoqRbRwfzFbZGTuEjFhYBEdVnjbsWl0U
         4MHRNUZFeUXh5uFkHYoVKXxi60mCuSpdBV2DZTxWFXNtzLojwOfcUlXzp62RzO9YB03O
         401yW1UPVYTxjXKZeKs7zsF2heAkCsciqeeQEfl5b45Sg/eVImKV6zds/cp1tAzbjMak
         MiWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789447397; x=1790052197;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=UoOAQKGYJOU9cLqt1H/9UiJiW7vYwYjslaP7yC1APho=;
        b=KqPkx/c5hJDiAMdA4EnbN5gQL5WiXgUE4SWdHwYUudeKfh7feSKoLLGHQlo9QqMIhE
         f8nheflwVEla1yFBmKxB5VmAFO90knt9j18B6iaBmqIoRGX9vuBH2iHP2GJ7hwPZaw7j
         zc03iY9/RRVIiT5RJIeWAaTLpHPZPLvg6B7ksVg3TmjvcL7DzuA5BkGVRSoGvRqZfGGQ
         r23pbl3/azozo4JoV/IEbCLgWpyXFUeuUfPf3sp3cGTsE1mIdKqb2HXVEyVg/IxRhQUA
         J0czGxCDcZAJ6856ZG6s18HhLzUNsN1U2n8v+CVzRY5y3BJG8j2vcm9Eqjrohh8wxTfX
         L22w==
X-Forwarded-Encrypted: i=1; AKwUvBzIsv6Jb2pkIM8Y5nBfBzsVjJ353tKTsAWq04Ax5kKZQQBgL/hHpe/b3p+YneQlO3j2w/oA7GZ1qJg7DT0TL43IKw==@vger.kernel.org
X-Gm-Message-State: AFuF++lXTlGB0P8oRVw7zOkxeYlIFWRLSukYkK06dBC3RVL0dqYI7tH1
	8oPc0kDZVII3nQT4A5Scf576YeEV2gTzNtmFl8rWQdAmoW8QaBuJfF6JsyrCRyv1At84l3VRZLd
	9YY34WOWDQh0XLHqdFQ4jDSpB1N5WK6s=
X-Gm-Gg: AYBFou3PXGBQrohMKNh62ad5tg1r5FJfMb/iYv5KIhQ0kZY+PVGkhCsRZ/uZPxx6vhH
	37jTlgYAFQljmZevN3hg3y1qz7XfnTUU6sDFF/+DDH2HuIedmQpFOwOUx09cWc8aJX1xtvw2njv
	zl+Yx5x4VUGiIyyOoyhuEW1Eey8nsQf62HcNeyU3NTtbJcQaeD1e1Xxo0GQFDtlJbl10OrBMRcH
	66MPkS5dQnKN/MFTYDkE9GYfGT63rVsqWhuSMzn7+jiJH7TcuUgxtborSbxJZ1eSwBJ+tvqnvS/
	uexA7F/pjA30i5JCQlAU8H+sjwEV19ry1X67LLnG7lZoGPGcbc4iJA==
X-Received: by 2002:a17:907:1ca7:b0:c24:87e3:b8b8 with SMTP id
 a640c23a62f3a-c29b85faa3bmr342332266b.17.1789447396541; Mon, 14 Sep 2026
 21:43:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260913145905.9404-1-linux.amoon@gmail.com> <20260913145905.9404-6-linux.amoon@gmail.com>
 <5c24248e-bee2-4256-af8f-a80be6744431@kernel.org>
In-Reply-To: <5c24248e-bee2-4256-af8f-a80be6744431@kernel.org>
From: Anand Moon <linux.amoon@gmail.com>
Date: Tue, 15 Sep 2026 10:13:00 +0530
X-Gm-Features: AcwNN1URmaKTajm5R0ygh2EGOJeV70g6e6uI0S2uQ6QQ5XvRrWbqrXu2Cftp_OY
Message-ID: <CANAwSgR6sEz8am8Vd_32EhnNjfybZAr=JR1MUjLHidZ+5mdTww@mail.gmail.com>
Subject: Re: [PATCH v9 5/9] thermal/drivers/exynos: Remove redundant
 base_second register resource
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
On Mon, 14 Sept 2026 at 12:36, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On 13/09/2026 16:58, Anand Moon wrote:
> > The Exynos5420 TRIMINFO register can be accessed through the main TMU
> > register space, so a separate register mapping is not required.
>
> No, the address is misplaced. You completely ignored entire point for
> second base, without any arguments, any data, anything, and just drop it
> completely.
>
> NAK
I removed base_second based on the observation that it is only used to access
EXYNOS_TMU_REG_TRIMINFO for the CPU and GPU instances.
It is not used for any other TMU register accesses in the driver.

>
> Best regards,
> Krzysztof

Thanks
-Anand
