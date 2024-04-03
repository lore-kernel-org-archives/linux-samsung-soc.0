Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3316147C76
	for <linux-samsung-soc@vger.kernel.org>; Wed,  3 Apr 2024 13:19:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712150352; cv=none; b=YptUIPbVAAFKr86ZbwcTv+ma8cVTbTywcILwjkJr6Kjblr0HYxwFxufbAGDw/GKOSZCNZIiABna3SH1IsF/EkhyR2VFQhKWuwhlYmOYVURx7XQmSz3ITh8PuwxI+YDMTF/d7Yy+Lgl/L25nrd7PIbXrXqcMjjNWqxHtyoOpBhkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712150352; c=relaxed/simple;
	bh=cWyJ3cJLCpRglG8Yk4xFCKIFWdrd8x6dZaV75Jxrvbw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ca1u9luLkNqLowev60hsf0QyKYM2bIggJzuqjnXlW/V8j4wBvRtMmuqy81YxkdwxGdEQbHugdUTtgn1bIrrmEBAD9At0cCCy213r2qPrHtUDpZf0tHIe3bE/GH1j7kyEtyfn1dG7mkSeO5ojpUQpsiHzSfAnI2lMlkuAjGOdMJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b=OzTfZbDA; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b="OzTfZbDA"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-432c947e92eso8498661cf.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 03 Apr 2024 06:19:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen-com.20230601.gappssmtp.com; s=20230601; t=1712150350; x=1712755150; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cWyJ3cJLCpRglG8Yk4xFCKIFWdrd8x6dZaV75Jxrvbw=;
        b=OzTfZbDAK169DHvtiGLE1p56hWxrPJIvztF4HCEG28uzI7eK2DDmyoFnlpMcVff0Ju
         c7HfnRJdMT3cqqxjH5ta+XDwFfzxP7nhChJPfdXbCh/IYQgFfXapvkwDzhtcQKIMJDU6
         /AYta6lJ4gWauzOHkhmOzIjsNFqlePdHHn3xy9JT6hKwAeKaW0n7cYID5zC35uJ+E1J9
         MjmpsOIduTxUPwoUx60yV5mxx/3qr0JADBO7+Rf5akc1FV1XnIFH8emGKZpFjW7KCbm0
         cWNz6heaYM6CJ35L/MFmo5LBGu6IXNRGey0GQtZdKGb0oNwjKGxhdSPQYm+tHTmRafwM
         UqNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712150350; x=1712755150;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cWyJ3cJLCpRglG8Yk4xFCKIFWdrd8x6dZaV75Jxrvbw=;
        b=IGW3u60MIb1shq9d3p6eitnvhEAXReIJq03C2HQ920C/hV1Xb1gMXh5edrOCJ5ttrU
         sjXc0ocyTTgKHd2tEq7tliiXI5ItC6Qzbn380RXB+ySAUjJCtJ5ToX7XKRlIAnLi70IL
         RLv5f560TdTGQp+mIEgUwDy6Lb/IncLRY3RKK5Iu1XWzbaUwZ19kiLi2Q91zxuM7/dA0
         XpEl4SfNBmJ5QjcqMsM1LeeWI7UmgjigQn7F+wfcN47h4wec9ryl36V6VKdQWtChtSOh
         i2b+mXNmlaotbVrHz7wNCIBfXD7RVJoqfKu0KEljoAIKVcLTlHTi/N5IFUtXukq0YBQ6
         DyEg==
X-Forwarded-Encrypted: i=1; AJvYcCUjlIqy27ys239k46y0Au2f38H12rDD4mGdE/sHZCLniIFArNLyV4UgJSwRmP5KejC3/czVtDsIrQSRdNw+J89QhFCVrnT0hWSUKutYgqD2dvc=
X-Gm-Message-State: AOJu0YwHd0NGF/V/bq2L5fU6bzy0Ys3sLLx+DlCRkMJ7s2ABrZQg740G
	4gCAMGYJtCcZvxQZOZWuRmYI2gpc2FZsuwdU+CpixaYe78w0ipO+8X3tuOYLOv7vSLktvdpmWuN
	4Vv96JeLAQDcjsaEAp85oALsN7l9Yi/WcTr2Tjw==
X-Google-Smtp-Source: AGHT+IEGVCWVaM3OZyGBYvZk7eIME6rUXSm4/CdsRsbb+oN0keiU95giarhKtyBsTd58XnIkGQv2TzNnxS90eOdz7ws=
X-Received: by 2002:a05:622a:104c:b0:434:338c:31ac with SMTP id
 f12-20020a05622a104c00b00434338c31acmr3549454qte.14.1712150349909; Wed, 03
 Apr 2024 06:19:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240222173942.1481394-1-pasha.tatashin@soleen.com>
 <00555af4-8786-b772-7897-aef1e912b368@google.com> <ZfTDUGSshZUbs13-@8bytes.org>
In-Reply-To: <ZfTDUGSshZUbs13-@8bytes.org>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Wed, 3 Apr 2024 09:18:33 -0400
Message-ID: <CA+CK2bC7jd65=eZoN7szWJKSO2TLsxxKFH8D6WjHS3_2U7=McA@mail.gmail.com>
Subject: Re: [PATCH v5 00/11] IOMMU memory observability
To: Joerg Roedel <joro@8bytes.org>
Cc: David Rientjes <rientjes@google.com>, Andrew Morton <akpm@linux-foundation.org>, 
	alim.akhtar@samsung.com, alyssa@rosenzweig.io, asahi@lists.linux.dev, 
	baolu.lu@linux.intel.com, bhelgaas@google.com, cgroups@vger.kernel.org, 
	corbet@lwn.net, david@redhat.com, dwmw2@infradead.org, hannes@cmpxchg.org, 
	heiko@sntech.de, iommu@lists.linux.dev, jernej.skrabec@gmail.com, 
	jonathanh@nvidia.com, krzysztof.kozlowski@linaro.org, 
	linux-doc@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linux-rockchip@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org, 
	lizefan.x@bytedance.com, marcan@marcan.st, mhiramat@kernel.org, 
	m.szyprowski@samsung.com, paulmck@kernel.org, rdunlap@infradead.org, 
	robin.murphy@arm.com, samuel@sholland.org, suravee.suthikulpanit@amd.com, 
	sven@svenpeter.dev, thierry.reding@gmail.com, tj@kernel.org, 
	tomas.mudrunka@gmail.com, vdumpa@nvidia.com, wens@csie.org, will@kernel.org, 
	yu-cheng.yu@intel.com, bagasdotme@gmail.com, mkoutny@suse.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 15, 2024 at 5:53=E2=80=AFPM Joerg Roedel <joro@8bytes.org> wrot=
e:
>
> Hi David,
>
> On Fri, Mar 15, 2024 at 02:33:53PM -0700, David Rientjes wrote:
> > Joerg, is this series anticipated to be queued up in the core branch of
> > git.kernel.org/pub/scm/linux/kernel/git/joro/iommu.git so it gets into
> > linux-next?
> >
> > This observability seems particularly useful so that we can monitor and
> > alert on any unexpected increases (unbounded memory growth from this
> > subsystem has in the past caused us issues before the memory is otherwi=
se
> > not observable by host software).
> >
> > Or are we still waiting on code reviews from some folks that we should
> > ping?
>
> A few more reviews would certainly help, but I will also do a review on
> my own. If things are looking good I can merge it into the iommu tree
> when 6.9-rc3 is released (which is the usual time I start merging new
> stuff).

Hi Joerg,

Would it make sense to stage this series in an unstable branch to get
more test coverage from the 0-day robots?

Thank you,
Pasha
