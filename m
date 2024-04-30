Received: from out-189.mta0.migadu.com (out-189.mta0.migadu.com [91.218.175.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0FF717164E
	for <linux-samsung-soc@vger.kernel.org>; Tue, 30 Apr 2024 17:07:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714496878; cv=none; b=RnEz1AiM2o0Pquvpqb35+xx5Et208A7zo8zOFcmmNPNx0p+vsK0aBF9FbrWZaBLQNiobxwjJiGSIwDe356qPBbC5rVFkhUhKBxhgfTmTHBwZ9nFuXO1SiWIQfewyBzjlgKbQWopoi+TDG5HKywF1tydip61TZeRVO+96S3EPUfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714496878; c=relaxed/simple;
	bh=db+LcjT05Dw+krDqL49m+eOdETP90DEG18zcvnhrAWQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DDOhCKWCMpK0x4FIzK/Cg/IGxqcqvjpZVbqx2irdG++yWLInFPRLR5MitEOZmq4QXvcSp2hOhuDmhfLz0K8DH+pEvUFJxsQ+7VaQoSoExpZ2KT6hvSJn4qUHImjHpzn9Q6xWtxxfSkJDU1aeqN8orsCg6wNVDw6mP8tnZdZ5H+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=grimler.se; spf=pass smtp.mailfrom=grimler.se; dkim=pass (1024-bit key) header.d=grimler.se header.i=@grimler.se header.b=gjbejvtU; arc=none smtp.client-ip=91.218.175.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=grimler.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=grimler.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=grimler.se header.i=@grimler.se header.b="gjbejvtU"
Date: Tue, 30 Apr 2024 19:07:46 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=grimler.se; s=key1;
	t=1714496871;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=E0KbF8dtOujezgvevNM6KDk8A/2EPyZjrNpNGeM12BE=;
	b=gjbejvtUFP2/LDa74+RMH4kr7SRPV09/cf2cs1g1MhL33SRLMK9TFaY/L5chvTmwGYcRWh
	qPwAvx2dOb2XUbxx2wZC8TapI/F6lUbMfbhVaHGId4Bv5nMN9wkbyoT7msk8RfQAFYEMUT
	H+t1ISzEblXxPvPBBSI9/tFVNG5FF6U=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Henrik Grimler <henrik@grimler.se>
To: Peter Griffin <peter.griffin@linaro.org>
Cc: andre.draszik@linaro.org, krzysztof.kozlowski@linaro.org,
	semen.protsenko@linaro.org, linux-samsung-soc@vger.kernel.org
Subject: Re: gs101 vendor kernel sources
Message-ID: <ZjElYsa6yy0rcu2B@L14.lan>
References: <20240430143208.GA7157@samsung-a5>
 <CADrjBPp7_GxQ9dnb=opc=OtknrU+COD+hqLWrn8i5ObM5HMSjg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CADrjBPp7_GxQ9dnb=opc=OtknrU+COD+hqLWrn8i5ObM5HMSjg@mail.gmail.com>
X-Migadu-Flow: FLOW_OUT

Hi Peter,

On Tue, Apr 30, 2024 at 03:51:15PM +0100, Peter Griffin wrote:
> Hi Henrik,
> 
> On Tue, 30 Apr 2024 at 15:34, Henrik Grimler <henrik@grimler.se> wrote:
> >
> > Hi André and Peter,
> >
> > I am working on getting mainline linux to work on a phone with an
> > Exynos 8895 SoC.  Samsung has not released any user manual for this
> > SoC, so I only have the vendor kernel sources as reference.
> 
> Sounds like an interesting project :)
> >
> > Exynos 8895 seem to have some similarities with gs101 and Exynos 850,
> > so it has been very helpful to follow your work on gs101, and Sam's
> > work on e850-96.  For e850-96 it is extra helpful that the vendor
> > kernel [1] is available, which is very similar to vendor kernel for my
> > Exynos 8895 phone.
> >
> > Is there a similar vendor kernel available for gs101 that you have the
> > possibility to share?
> 
> The best documentation to follow is
> https://source.android.com/docs/setup/build/building-pixel-kernels.
> That links to the manifest, and the manifest links to the kernel
> source repo.
> 
> v5.10 kernel is what shipped in production on the phone, but there is
> also v6.7 forward ported version of the drivers which have evolved
> with the upstream kernel API changes.

Thanks! For future reference (and anyone else interested) the various
raviole branches in https://android.googlesource.com/kernel/gs, for
example
https://android.googlesource.com/kernel/gs/+/refs/heads/android-gs-raviole-5.10-android12L,
contains the code for gs101 that I was looking for.

> Thanks,
> 
> Peter.

Best regards,
Henrik Grimler
