Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91269200BA9
	for <linux-samsung-soc@vger.kernel.org>; Tue,  4 Mar 2025 11:49:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741088983; cv=none; b=XfXfBDQ36mfniiNt+UjeZ0Ds4SDqxl1G2yaAPE6BAPLVF9qnhCj0sUw9J0Xm1cOqlaq34TyhVBufLxakovQU1mo6ddW3LkmOwl3OaOWq4ortH/8C7t094oWE6xosPPc7EUMMXIsZAIj8MQQqn2xWHcCy58+RgLhOPpmj6LongrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741088983; c=relaxed/simple;
	bh=+UYXnOxCIwrlULirHKNsM/rmv3hmUJmhfF5OSFk6amA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BEx8SByY2u4bM7DFYFvIZ9SFLtuOP45QXXSP0ecXJZofQpMxxoM5fYnC0EwNzHZOWwPJHjnEI/wk/NPeVqXK+5+QVGHMzxvglkCy2mKywVumt8vqEN5VZs+rWwGU71SYHBblxW9GZVH03NmLPkMIiMxcIVpu9i75r767sYJaeyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WPczSK/p; arc=none smtp.client-ip=209.85.210.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WPczSK/p"
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-7271239d89fso1832051a34.0
        for <linux-samsung-soc@vger.kernel.org>; Tue, 04 Mar 2025 03:49:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741088980; x=1741693780; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=MpdZS1uISB9PX6+/mFmvoGcmNoH+HAc5IkpoWEU15/c=;
        b=WPczSK/pAqOTMboCAqNO59icU4gOm+zyTgyu7nRo/USH/Sw2HSaU9oQDS38tHtAxeS
         J/nQVLjJuz9+k3ZmzR8iqh7rIWhHKR7UmhhzX4GNLDn2UmbR4KGMXMmWdbLO6zDoL0IS
         hC6NcDa2mszfptq7mMvF3wQlt9BBHoESxQZqrSKo8QUMy2CGIVSADzOH4/Nl/rDTzWkV
         Tcu6tmMGfkqHawOhUUFPOlxb90GhGFmq3aBxn7B60+JiN2f/hS+prnWLplp7RL1esuSj
         Tt71/YbIwoSXdfQvjqLE5B+g9f726l+R9tAvUcTnPf5U0BfxKGBRLYu2suxOEj3/GBoi
         bzzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741088980; x=1741693780;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MpdZS1uISB9PX6+/mFmvoGcmNoH+HAc5IkpoWEU15/c=;
        b=eN+U64abaepfuAkG6vFTX+8a2V8TqqdK/bMr+ItEVK+0drLJzxW5ydn+kEyfIOhXfg
         ecJtLCtDcEnB7fnyE3PhkGGtxcDlyjmbVHBmmBcvKrDLVLagYczy7YpIwNStkYGmFCUL
         k7XEuWd70k8JhB328ZJlsalAnEhlFuwyns1fZ9+F+7barkUr0bpoBVItLhTutzs8Brzn
         d8aoKziWlY6t5wWERGBEdDNT9NS/0s40BJuoWNuIhQLqZBtNeS5S6o6GEQey5XInjykE
         6KuxLiCEpF8fbZQ17bdSUK830Y/ecn27NqWLZ1+ls5vtI6XZV7VIIVnar4wPkhA8HvDZ
         Lqqw==
X-Forwarded-Encrypted: i=1; AJvYcCWcumRQfVgRs7aRCZEZTCkDwEU868LbL9rhOD7y7SYoMBRHzduRwXPijJAa+m6+Mak74cexIMM62hRCxHRaI9TnBA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwhJYAtAdgT+RQVEqr8ofK+66xXGhkIRFeH75WUG3N9OcfolFYs
	+fZETl0BXeq8cm7luuhLeBbOvVqqH7u4fiLVpQdGrMq15or4oE8vTLRmXO9Lm6xtWMt31e1mmDs
	RJlK9Ag88ZeKlt5j+ybga3M44vPFhsNaC87U0mw==
X-Gm-Gg: ASbGncvbkk+L8MmgtYGBXwg9Km8Olt6ePutqw6WLqIKk+3DRmlIeR8aesHj7IYCXmhb
	VsWS6v6csFeITtkQ5UlPa3Rd4DRBY+ugkqqzYVG12SIuJeu+Qdh7PkcQOpltcqhGPx/uSLQh/08
	1FXMz+5OZelGaJf4hp6CxBn21vPfo=
X-Google-Smtp-Source: AGHT+IEGafDyYI67R/1eqCjcojvEh6ldPVuHGNWY3NXJkAyzvOXEUtHCKhyAhFW7/MlCSqajkBLOaAJFFsTna+x/OIg=
X-Received: by 2002:a05:6830:6995:b0:72a:ceb:d511 with SMTP id
 46e09a7af769-72a0cebdcc7mr3644538a34.11.1741088980595; Tue, 04 Mar 2025
 03:49:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250226220414.343659-1-peter.griffin@linaro.org>
 <20250226220414.343659-5-peter.griffin@linaro.org> <bb595629-f975-4417-af28-8f4924a5ca5c@acm.org>
In-Reply-To: <bb595629-f975-4417-af28-8f4924a5ca5c@acm.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Tue, 4 Mar 2025 11:49:29 +0000
X-Gm-Features: AQ5f1JrFaXvZ7X3TIFZCXeV9ZW9xw5dAWQ1CR6t-L_n-p6-nOP1fD87q5_gFbhs
Message-ID: <CADrjBPrpXH1E2Wt34KXgfdOTNE1v7JCwU3AN7dqoAPYS7j=8YQ@mail.gmail.com>
Subject: Re: [PATCH 4/6] scsi: ufs: exynos: Enable PRDT pre-fetching with UFSHCD_CAP_CRYPTO
To: Bart Van Assche <bvanassche@acm.org>
Cc: alim.akhtar@samsung.com, James.Bottomley@hansenpartnership.com, 
	martin.petersen@oracle.com, krzk@kernel.org, linux-scsi@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, willmcvicker@google.com, 
	tudor.ambarus@linaro.org, andre.draszik@linaro.org, ebiggers@kernel.org, 
	kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"

Hi Bart,

Thanks for the review feedback.

On Fri, 28 Feb 2025 at 19:18, Bart Van Assche <bvanassche@acm.org> wrote:
>
> On 2/26/25 2:04 PM, Peter Griffin wrote:
> > -     hci_writel(ufs, ilog2(DATA_UNIT_SIZE), HCI_TXPRDT_ENTRY_SIZE);
> > +
> > +     if (hba->caps & UFSHCD_CAP_CRYPTO)
> > +             val |= PRDT_PREFECT_EN;
>
> In a future patch series, please consider renaming PRDT_PREFECT_EN into
> PRDT_PREFECTH_EN.

I was just checking the datasheet naming (it is listed as
PRDT_PREFETCH_ENABLE). As well as the typo in my patch I think your
reply also has a typo :) I'm assuming you would like it renamed to
PRDT_PREFETCH_EN?

Thanks,

Peter
