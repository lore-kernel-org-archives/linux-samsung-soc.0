Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D526EC142
	for <linux-samsung-soc@vger.kernel.org>; Tue,  6 Feb 2024 17:09:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707239367; cv=none; b=Cjk9QCjevKPb6wUZ6o08f9sO3rV89i9ve3Lmk43Cp4si6JbEXjLWq7O/A9oyAiO0iEl/TvFm6fIsbzU42W9vCsadRlDdvZKbsqkpEA9RkT1WjZECc7UPbQInbZfCfjsr+RVtIMxKMVQSEp7tXytR19Qhh5UUN8K9TWsj0qTRP2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707239367; c=relaxed/simple;
	bh=0EieyPtEmeSMltYruz2A6U+bwbzON2iXw+4HfvXnItY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Oy5UbjW9ERmhS5oOwbwRQSCe7VHWrBubGrHfDhC/r+REaQSFLPPCpq03809x6J1TNectlYH+sNcYNlBUQFbU6RbdHwrktByu92MBxcZlIyqh0peLtVXE7EGjGuL2TZ6RfYF8KwZsifP0C8GB+AquHBI5ZK922pEsR+9oS/pKv7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cvtQo8T8; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cvtQo8T8"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-42a029c8e62so34832171cf.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 06 Feb 2024 09:09:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707239364; x=1707844164; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=eaRuha1gDvtrSGMJylytHACa/uRhLhdcQLoNWLwXvEg=;
        b=cvtQo8T80W5LVJ7VH3Cr/+lGcJ1yX8GJSthUkhHbZNV7SWgFI581oe4i3glyJCybJz
         S4wbSydkpFDZJeLwKRIHmEs2liD90GEsbjHpQajQ9+NeeYT1SlruzO+9uKUPzvDkQ+fh
         k36hpIZX0gaOuA1u3zK+Q7L6RArppjgz/lBe+vaF0Qb5uEMRWZtyVBSVi3TaXADhViBf
         OILptN0B80akQpAuJ6eJqr5qG7HAIi76kZ/tMgPdYCg40GD7KtPa6zJDOooxSUHsBPBI
         2w++Q0g/JrUvedfBXkr6p1tJS43OYQ1QyusvYdERI7kG8aD8jw/qm+t1j6tNFBcP/Pz1
         syfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707239364; x=1707844164;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eaRuha1gDvtrSGMJylytHACa/uRhLhdcQLoNWLwXvEg=;
        b=KcTutagE4hYlz/GumIuS4JwatNW3E2Cc87eUlu+zFDbJnssUdr0n4onTJi4vQJhhAq
         P80w6OnCHLhXmuc9QUXNMGxMljFmNOX6vUU5VngH6RXc1onkwl2VzxuczfpkVMFooPYT
         obbIRa7JgsQItVGobNyvFDB48jD9YPKXjzOepjHGTUg+rhGmj2gllRCURJSZ3VQCXTHy
         4Pw8vXG6nw34Zr8iG1GfACUhNMgBIthGwdy7VynM2HT/QAuFKe4ROXJ0z/9yCQ+U3HvH
         iTpE+04MB81RmXN5ZCgJ4pVz0Z1VTkeES3ossX/OjfVplwEePAV3gTo+gbwYmUOVc4wa
         nGpg==
X-Gm-Message-State: AOJu0Yz57qZJ3YiIpW2lN/S5dLHJJ9pr9ouZ3AneQjjzHy12QSimHi65
	fvwVbdticZGQbM5ui73oDu2iD1+Lzs9NFdGL6ebaGtset96Y1jGT7RQ3L4uFWebiFckr6NNnocA
	MfkCMiUWKQDI1rsuqpsR65bURUAr0eCFEdoZqRw==
X-Google-Smtp-Source: AGHT+IFK0tMbvl0m87OZHruT25x7q72Vq8nHs2218fyQ7IZnpxxFhuILKrb84JS2+vEza93dcueE/3S8kBQcxTn4ggc=
X-Received: by 2002:a0c:9c8e:0:b0:686:acfd:9e07 with SMTP id
 i14-20020a0c9c8e000000b00686acfd9e07mr2756577qvf.32.1707239364698; Tue, 06
 Feb 2024 09:09:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240206034502.GA175333@sol.localdomain>
In-Reply-To: <20240206034502.GA175333@sol.localdomain>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Tue, 6 Feb 2024 17:09:13 +0000
Message-ID: <CADrjBPpw4f-GW+dxQMTP4HEhVjEJ19g=eAsYLdzXzzFkTmcVbA@mail.gmail.com>
Subject: Re: UFS storage support for Tensor/GS101?
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, Will McVicker <willmcvicker@google.com>
Content-Type: text/plain; charset="UTF-8"

Hi Eric,

+ Will

On Tue, 6 Feb 2024 at 03:45, Eric Biggers <ebiggers@kernel.org> wrote:
>
> Hi Peter!  Thanks for all the hard work you've been doing on upstreaming support
> for Tensor/GS101.  I've tested that the latest upstream kernel is now able to
> boot to a serial console on Pixel 6.

Thanks for testing :)
>
> I'm wondering if you have any plans to upstream support for the UFS storage on
> that platform?  It should be able to use the already-upstream
> drivers/ufs/host/ufs-exynos.c driver, but changes may be required; I'm not sure
> how many.  I'm interested in this mainly because I'd like to upstream some
> patches related to inline encryption, and that depends on UFS storage working.
>
> I'm interested in helping with this, but I wanted to check to see if you know
> about any existing plans first.

We certainly want to add support for UFS upstream, and if you can help
out with enabling it that would be great! It would free us up to work
on enabling something else in parallel. From a first pass analysis of
the downstream UFS code it looks like ufs phy driver likely needs the
most attention.

The last UFS dependency (that I'm aware of) that is missing currently
is clock support for cmu_hsi2 (which I was planning on working on as
my next task). Also the UFS phy accesses PMU registers so that will
require my exynos-pmu [1] series but that is hopefully close to being
merged.

So I think we are quite close to having all the UFS dependencies in
place. Shall I ping you once I have some code for cmu_hsi2, and
hopefully that should be enough for you to start working on the UFS
driver and phy?

Thanks,

Peter

[1] https://lkml.org/lkml/2024/2/2/795
