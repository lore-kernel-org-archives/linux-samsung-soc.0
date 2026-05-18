Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D63F28751B
	for <linux-samsung-soc@vger.kernel.org>; Mon, 18 May 2026 19:01:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779130863; cv=pass; b=O75imIat7QpY80EkitCrr/lKUB+ocaJAdCcNbxvY4BIKJlYrqjYMoRX1yIiZyHJmZCTWbZRyRb/xo0wPpqj6PNbPqHhGgueqkuWM3ZL/RQzkrg2H7iUsz2Yi29UynlL53VNBRwpBSVbh+oj3+kKlDXOJv+zRWDTdMXC/V/2Dy/E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779130863; c=relaxed/simple;
	bh=qfwOI4TFO+K5sBBy8/rZTrwNCYLtKfbzFvD3W6XCAkQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=G5uwg8vKpA8qFzAJZHTgbDxtIFmBSmn1Dzxnbv/xotndv3epPl+rtXjprv8tV9ieziqEGb9Txiw3KsmbrNe3ZMpJ7T7ja9kVkL0nMd/+Pf/YpeOzx8B1mwJtCCiu/zNIqlgosrBaZIg4VGlU4FBIEFAMGywnmCSjiKM4qyZZPNU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AbwO+84Z; arc=pass smtp.client-ip=209.85.167.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AbwO+84Z"
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-47c35be02fdso918974b6e.3
        for <linux-samsung-soc@vger.kernel.org>; Mon, 18 May 2026 12:01:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779130861; cv=none;
        d=google.com; s=arc-20240605;
        b=QxAWsIBKky5eGQ8dTToSphSPu0IOfzkNKcItkgzGa7Mf8Rb3ojt7AY04qdhCiNmjeb
         DWai2tBmL7kJe+xFu/aX2vTXFFt6LWZc6SVjoq162TD1HW9r6Q9gPydNYgfba6YM5RXn
         O92aLcfA2m+MlY6OW2jOdtUwp6lRkHHrsgkQ8oZWZAq55qKCEFyOIBxoWFIzk9yDa/AK
         55CP7xEjXaYnT6qOaiqu27w6pGRMkxxc5DldI1LFScx2BTHryhMJ6CVSyvYNnRfTlvdb
         +Z+VIRgWSKgVim18cEKMRwfipI2MaUrVxhPQQZyAo+jRmDjNB7UyEZic8HHigDQQ0EJl
         Zkww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=i5Oh1fD1na/utz3Cs/1Qt7UzGSujhfOk0rSSTDdiTsM=;
        fh=GRmtrI79z3a0aIOibqfu0F2Lr/oA6Imksw1bLEHMUQ8=;
        b=AzEU9onfsCk396JQlvsywWMnIckpUEdZncdr1+HVWN2jDJwahKvWy+pus2T9j5cuei
         VDoejbFyvkhFBGBwq5ulKhYQ6LiyqLYxmbGNyEtdM/9dhrvrI3UpQ86bYWRgXk8EqwAH
         XqtioopiVl2T8sv995thb+FEjVahIv1QpyLGjuVdRDFm/hoXhkynbIwUbrQ3H+UqUmkO
         kY648de0PsKovDrD1FcwgCR+jSzM8wuH0CSKmpiVp/8Y7GSkMVFJcDQJVrimPssvjKZk
         OVRIAsA9b/HMNs1aQINqeFVO0hFZV/uGYKeOsZBF9Dwf4LEp7CyqSYAlx90gTcfTic5I
         lmwQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779130861; x=1779735661; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i5Oh1fD1na/utz3Cs/1Qt7UzGSujhfOk0rSSTDdiTsM=;
        b=AbwO+84Z4/tsH0McDPVvo0UGbpoLSBfP/R023r1ZtX6lSNbmmODNn0/5/ieMiEwUQ8
         UAk0SQ1OFay3mQkePucDA47e6NyxzC5aowI7UKKJyqfkWRVdsGphLjnKuKtfSTAnpEB0
         0qDTUh75t/rvPIGpinkrJZVfj690mt9t7IHEaXClS2SgDSVar6c23EVXpvrvJNIgKGw1
         Jic8a770OpaQmFhVb5SzQTuKCXiYhpNesLsDukdmur/Y3GEyKLBdTX1H29wQmnwRLVXU
         9VXgjofL95kEdcL8W5ucEeWuJTSivUFPPVhuCoCh7AMHxQ6jTvXGARFmc9toKIlusinb
         yV1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779130861; x=1779735661;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=i5Oh1fD1na/utz3Cs/1Qt7UzGSujhfOk0rSSTDdiTsM=;
        b=S0PJHTkf9PFAtISf9HhmcX+QYOi0yI+fZq76eVCkz7cByjKpAIFiiTPAxEk8RZmWMS
         2HQNIdosuvEcoS1JRSn3PeSnfBUKPCkTirlvIzJuOzek7wJnHr07hbzFrUfHuGJ8bM65
         d4TPnN70OlmcucEg6SXCJcgNOlHY5uVGwReXmC5fvMKFcaOZ0Gaor8PYmk7VCVrOoFrz
         UYe8YtrR6AjTsHJImxAkzs0y2NlPNx5uFaF9QeTMvUamUeMSPsQumms7uhogKatwneqd
         vU99JPdfPtcJNgfFwiUvZOGS7FHUVQdsL7uul4JDh24BHbAsvx/zFZvRu4vU0jvbXCq1
         gDwQ==
X-Forwarded-Encrypted: i=1; AFNElJ9N+RkietkjFGhK46LHimMAmMV6DWEWOJojcunhLgzfc/rMHqLZw+u8ELNgBbXx5mn7GD4P/P4dGULg4udfgF72cw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8RvxEl2sToPwyhlarx6AFbs+tjpt3jcHrKdbArCYaJqzZ33bp
	Ple0cVdZ6k5mNhGrQKmZxHi56U5UxEybth7UG0puWjFYc/U7qhDtWdGbILwM9jF4rSzPDv35SHS
	gi7h8x2oWfcA1aK9ZNXU8sv2rTTl6aeo=
X-Gm-Gg: Acq92OEfcJlxStJAsktExxh9jqxm2BtH0zbBoZ2vpGjyKnlFQJFDqjhFNqEj+WmCuMO
	ZMMvWYZXz5eRiTW09aN4Yxofr+SWBIrChVizPtW30dNfeutduoRnJPeMDqUlmoMhUjde03uLcsV
	3pP5D8U6g4AotdUpKqIDIEjzCpku7wqU4zgF60lS9b0e3SVEZ74DMzt2/QMgEW51NEkYC0JrNjZ
	mJtdVXv6WgaoPOjNwz0LqxY8bIPfZGus73BcXkpZMrkiO1i2WmffBKCeqr6pKl8Odyp8WsMTo3b
	ETpqAZUZ
X-Received: by 2002:a05:6808:e416:b0:482:6817:405a with SMTP id
 5614622812f47-482e57c671bmr6794827b6e.32.1779130860858; Mon, 18 May 2026
 12:01:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260430-exynos-mbox-dead-def-v1-1-a69176b7d0f0@linaro.org>
In-Reply-To: <20260430-exynos-mbox-dead-def-v1-1-a69176b7d0f0@linaro.org>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Mon, 18 May 2026 14:00:49 -0500
X-Gm-Features: AVHnY4KQIWjDuAullpsAk41jbvnL-5-zhnGtG7a0cMY6I8twms7NTNeEd50I88A
Message-ID: <CABb+yY2mSzd61m+sceQVCpPFMG+DB1LMiXjo4_36VwXSzMMFTQ@mail.gmail.com>
Subject: Re: [PATCH] mailbox: exynos: Drop unused register definitions
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, alexey.klimov@linaro.org, 
	linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 30, 2026 at 6:13=E2=80=AFAM Tudor Ambarus <tudor.ambarus@linaro=
.org> wrote:
>
> Leaving these dead definitions in place hides which registers are
> actually being used by the hardware, making the driver harder to read
> and maintain. Remove them to clean up the file.
>
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> ---
>  drivers/mailbox/exynos-mailbox.c | 7 -------
>  1 file changed, 7 deletions(-)
>
> diff --git a/drivers/mailbox/exynos-mailbox.c b/drivers/mailbox/exynos-ma=
ilbox.c
> index 5f2d3b81c1db..953e715a89b1 100644
> --- a/drivers/mailbox/exynos-mailbox.c
> +++ b/drivers/mailbox/exynos-mailbox.c
> @@ -16,15 +16,8 @@
>  #include <linux/platform_device.h>
>  #include <linux/slab.h>
>
> -#define EXYNOS_MBOX_MCUCTRL            0x0     /* Mailbox Control Regist=
er */
> -#define EXYNOS_MBOX_INTCR0             0x24    /* Interrupt Clear Regist=
er 0 */
>  #define EXYNOS_MBOX_INTMR0             0x28    /* Interrupt Mask Registe=
r 0 */
> -#define EXYNOS_MBOX_INTSR0             0x2c    /* Interrupt Status Regis=
ter 0 */
> -#define EXYNOS_MBOX_INTMSR0            0x30    /* Interrupt Mask Status =
Register 0 */
>  #define EXYNOS_MBOX_INTGR1             0x40    /* Interrupt Generation R=
egister 1 */
> -#define EXYNOS_MBOX_INTMR1             0x48    /* Interrupt Mask Registe=
r 1 */
> -#define EXYNOS_MBOX_INTSR1             0x4c    /* Interrupt Status Regis=
ter 1 */
> -#define EXYNOS_MBOX_INTMSR1            0x50    /* Interrupt Mask Status =
Register 1 */
>
>  #define EXYNOS_MBOX_INTMR0_MASK                GENMASK(15, 0)
>  #define EXYNOS_MBOX_INTGR1_MASK                GENMASK(15, 0)
>
> ---
Applied to mailbox/for-next
Thanks
Jassi
