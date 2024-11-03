Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA9232F2E
	for <linux-samsung-soc@vger.kernel.org>; Sun,  3 Nov 2024 06:57:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730617078; cv=none; b=qn3rH2/JCn7ZwRqWBkqnRnhZLG66b9qYD8CU2BTqRfJaQBHiUUrDo+oVMxgy+yXl0IZ621A8eBe//oTVaJpOcMcG2ZVjANi87K7CCj+7GfiBQjPMkLS2iRcRKUa5sEl6+oki8V0J41wi+OD6tPdK4wSQxHqrsm8ILUFP7+G/r6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730617078; c=relaxed/simple;
	bh=7np/I76LHj5RuluQ3/YJmSLHvUBqTcAuqIlQuP1knkY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Tru/umcUrSqhffo6FSfKhiQ+MlFo8Gr2hg7kpkD/Uz29f/7HfehQtOzzcuJexavaxg7Wm2nAx0SzFWEMECDqlj4qQ404uRvpVBHbKDqzvyxrEOkUAha8eF1V48aEZWdR2D6eZTzey+i9Fo6KwZUgoWkWe1JSmH887jHrgN/qNJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XhlX8Cb9; arc=none smtp.client-ip=209.85.160.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XhlX8Cb9"
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-288fa5ce8f0so1560185fac.3
        for <linux-samsung-soc@vger.kernel.org>; Sat, 02 Nov 2024 23:57:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730617076; x=1731221876; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=fS1npImPfHb20Sl7e7er9IvRC0E477hQsJ+7VA0CBuE=;
        b=XhlX8Cb9hPa+D2zxSnv7jpB3Tl2BKh1SKouaL2nLzFZTxeKhPmqhId+PkOctHfayQ8
         ESxGOk6Jg6Td5ZdA2qjJYEk11i1wOeOuw+7px3B4MQ/BkMYYgA5McHeHSbyIPFwDd+Fl
         mvvrmgPTSYuebUCSC/daNHojBdNUDFpKbNkaFUQU8yRF9IWcCpQ7Y8aGJ55KYcySH487
         dK1Scwzhx5yYDmLPU6m9KQPW567lxShgFRuET3krYxbYWCOZnYQI6UX7n/l2PAk5XCZH
         g1ccHc+tfnnHBhgpIcNBft0bgB/IcdKf6IvNjOzGENu1HypNWxMYfKobXxF0HBAiqTav
         x1WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730617076; x=1731221876;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fS1npImPfHb20Sl7e7er9IvRC0E477hQsJ+7VA0CBuE=;
        b=Z8pBm+mHilnPxACRK0GDcwuxRoIPnfhsfVzOPdvjsZOxcNLZqsTwltt/nTpvVkPr3w
         SJKpip25I/CWdahMknbvZqSypcWdR1tonRE6+WrYUlYbYVKi26Tw9+qWJAHk+uslzCbj
         dFFgwvKjJV3s3UznEy3g1TP6crpdFfxlnJWspy7Qk5Qe7u2KZjGMrutta7zje4ZT3Shs
         h+9UZ4u+uZ/m6+mK3ShLc3Klm8eDaIaUZ9KVyUGbCPpMlMsn6h1yNFiw56a822lrCLKT
         upYsgxFQgbYlOy9rpzClpC8hBU0qSi9yx3pIIKGJ7eK8CPzKSF6+tLkqi+NS4j4QKtqU
         02xQ==
X-Forwarded-Encrypted: i=1; AJvYcCVpXyn9Fpw+RSJyQ4UEV6euvdnmSGH3xT8oPyC1JiFFp9l6Q0bA94blSJZZ2NJXHrg7uEsvApjEyjQzYGXHVDR8uQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwfLCDBFGlKYAsO3x+JbnfFC7bjnvELn1+yWezx+vXpqunPMWnP
	anOAVkvXq43YZjocAt76fw7RxR5bEbUIEUnKUgeUC4j+jv6jJ8dKNT81xKFHdRz9AiAWhS/h80z
	+YLeVeAC+AspK0Nbj7rW3czuzpzeMd2lRuJcoRw==
X-Google-Smtp-Source: AGHT+IE+q1rK+3oCKtp9SkJcnFzCrL9vfkFECGy5BIRlaiafb9OMt6z17EkSsb1RPUubkyZ3F6wWlfWwl558mwfUioY=
X-Received: by 2002:a05:6871:c707:b0:28f:329e:9f23 with SMTP id
 586e51a60fabf-2949f07cb9emr7517716fac.42.1730617075872; Sat, 02 Nov 2024
 23:57:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241031150033.3440894-1-peter.griffin@linaro.org> <yq1wmhl6rp8.fsf@ca-mkp.ca.oracle.com>
In-Reply-To: <yq1wmhl6rp8.fsf@ca-mkp.ca.oracle.com>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Sun, 3 Nov 2024 06:57:45 +0000
Message-ID: <CADrjBPp9-ucYgztdRNP81FfY0h+1s7N=LEPS2Ny=D2Vh2HsWYw@mail.gmail.com>
Subject: Re: [PATCH v3 00/14] UFS cleanups and enhancements to ufs-exynos for gs101
To: "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: alim.akhtar@samsung.com, James.Bottomley@hansenpartnership.com, 
	avri.altman@wdc.com, bvanassche@acm.org, krzk@kernel.org, 
	tudor.ambarus@linaro.org, ebiggers@kernel.org, andre.draszik@linaro.org, 
	kernel-team@android.com, willmcvicker@google.com, linux-scsi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Martin,

On Sun, 3 Nov 2024 at 01:36, Martin K. Petersen
<martin.petersen@oracle.com> wrote:
>
>
> Peter,
>
> > This series provides a few cleanups, bug fixes and feature
> > enhancements for the ufs-exynos driver, particularly for gs101 SoC.
>
> Patches 1 and 2 were missing your SoB tags. I took the liberty of adding
> these instead of having you resubmit. Please acknowledge that these two
> patches should have your SoB.

Yes those 2 patches should have my SoB, that was an oversight on my
part.  Thanks for fixing it :)

Peter
