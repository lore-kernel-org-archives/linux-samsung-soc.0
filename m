Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E94D73101B2
	for <linux-samsung-soc@vger.kernel.org>; Fri, 12 Sep 2025 14:47:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757688438; cv=none; b=Rd+R0QFnma+HEkZRMC0MdGC0NS2tWeXV7NhrJNZe6krVcj7KDi7fIhPModrTsXhbQt10uYiB6rCqZHp7A6/rd71zyTj2EV0zBSNxB7lRWO/y4+8zJ5g9dADZenGBG71m7CpiilZNdoAgjZEI5QaYDVkSZXEoJSfRMhvLuboEiko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757688438; c=relaxed/simple;
	bh=oD0rg6h2s8DRnh9ZlLpSygfF8WNHefSf37xINe7C+08=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JW4pI7CnpVtv/6gPovNsCc51rSpiR1wGu1XbV9qn4+u+7qO1QmWR5uX+TIDuOZPIn388Ns/mGGxqNzl2O5s08xNQuduIC6hAucq7o74wJ4/FxVb/HyXqcq4Dg74GLJuMp9lHZs/zJk7B8nWlp1S9bYfHqEJYAaLEdglo5Vh65Xo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=snSNmp5b; arc=none smtp.client-ip=209.85.210.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="snSNmp5b"
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-74a61973bedso1839247a34.0
        for <linux-samsung-soc@vger.kernel.org>; Fri, 12 Sep 2025 07:47:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757688436; x=1758293236; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=n5DP9lHEHxCZeRxso6ploohANo8ljFzvMmesuroyCAA=;
        b=snSNmp5bTpFGV5C9ol6/nG8CtWdeXnTO+52pJjkJgqDPt6lvlMut7byEHdds97Kl2Z
         DFVYfeGA07X2ADyhnkchcl8FLnZVtQ+QN9WkNuwFeUFCAaqcBbbg6W2feK/HzQmt/6dP
         odDZmSn1hbl625f3pfJLU3LlEHjxtmjOKMfZ43ts+2uLH1es5NFkxqIt449fU+cnizlV
         tahGe3CAfZoAK5db2Q7risuJCzqxF/ZQgY0/bz95LszWGYhVHXUzF4OPzkKDVxysAhH3
         1ntiFNAG39VV9F14WpF3U5FqVYJKLFzA/wLUCOxUrkoyo9rQOuQ39liYoXrM1+DVsAcC
         OmwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757688436; x=1758293236;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n5DP9lHEHxCZeRxso6ploohANo8ljFzvMmesuroyCAA=;
        b=v6KUpgXC+/H9LCUGoef6c3FIF98i5LOcLGgYjlV/Yw3yPSCAac2bE/kfAqqChqeShL
         VsVPYxhe2xSjRXZL5uNAiH9pMZGJmeBZORx2jN8v44TTIGjTMuFrlPROxQU8uG9WqWfg
         zJ5FRaph76PIJKsQ8rXeGh8hzHZIuBnZjttz5lIu3211wqSXbCNWoTZ1CIMd56GR/vB/
         8HmhCUyO5oDBuo5YiytyRBQ3QOl1PFcmhoMxL0zRsa4QJ05qU+MwTvzAeA9RWQs4Evka
         MWvFnRqb05Bqqfj4Qmr3bRoEzR8s1tBkJ1eotvhn5Dmka0egKc2LiJaad+8k43P7NkdX
         DFRg==
X-Forwarded-Encrypted: i=1; AJvYcCWBo0Ea67isol+JQTb4UnJPI9KVKRYaYTQFsLx5Y57kgJczNh4HTF4UcXPbh+43UJyrsUG/F3JuVDCFAtBhSHYQVg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyOqUrs4/jyQhWPuRr7ZccAlskH3RuTMOz8rJMjmROAInvfDuak
	PbFxeAcQ9BrZmVj5aU+onax2tyEXTHASbww2Lt9WeiFB1ZE/WliFV9IVMUPc1zNu/coVNerrfHG
	wlPuvjdBEsRj9HDobYeF+j8pDdXf1sZgm3zRZuDKNK9yy7sCffbcCo5IiXQ==
X-Gm-Gg: ASbGncvVvcSSL9dbqYYigPgnmVT1woqPKvR+MPq2LSzb3ZphfBXWIJvwH94QyfEL/xe
	Ph7ALwXtS6WlGQRxxSx9dM2yfMhGCNe5GBvk31/US6F/BJ4UxLQyUPNCD7FKWzmvxuGbLY3I5ez
	qcWBr+F8zYtwfrAgUr347B1IQhaFNURNhVnJhARJM3LlR59kJ+k8d4OyJTdyXU3F8S1oDQrAhZ8
	uxyXh4=
X-Google-Smtp-Source: AGHT+IGeyQqSFM5GQBH6iCx5tixN2uUYqtRIakzVl52m5pJ6MiMjEL31OlCuxkleyE+f7rCgdWR9L9hwu0O+n0AMn+8=
X-Received: by 2002:a05:6830:2115:b0:746:d4d3:c8b3 with SMTP id
 46e09a7af769-75353b6e84bmr1706635a34.15.1757688436065; Fri, 12 Sep 2025
 07:47:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250903-acpm-dvfs-dt-v3-0-f24059e5cd95@linaro.org>
In-Reply-To: <20250903-acpm-dvfs-dt-v3-0-f24059e5cd95@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 12 Sep 2025 15:47:04 +0100
X-Gm-Features: Ac12FXyJH7pruBCqQvGbq77_X-ntri0UZ8m2NLg3fLfUFTSIie9VvPVCWn3Vxng
Message-ID: <CADrjBPqb+yw0DS9ZrGhW8XSWosWrczV=nMBG4pBPvCVFDpJQ0Q@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] arm64: dts: exynos: gs101: add cpufreq support
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, willmcvicker@google.com, 
	kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"

On Wed, 3 Sept 2025 at 15:24, Tudor Ambarus <tudor.ambarus@linaro.org> wrote:
>
> Define the CPU clocks and OPPs.
>
> Patch #2 has a dependency on the ACPM clock bindings sent at:
> https://lore.kernel.org/linux-samsung-soc/20250903-acpm-clk-v3-1-65ecd42d88c7@linaro.org/
>
> The following error will be seen without the bindings patch:
> arch/arm64/boot/dts/exynos/google/gs101.dtsi:10:10: fatal error: dt-bindings/clock/google,gs101-acpm.h: No such file or directory
>    10 | #include <dt-bindings/clock/google,gs101-acpm.h>
>       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>
> Thanks,
> ta
>
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
Tested-by: Peter Griffin <peter.griffin@linaro.org> # on gs101-oriole
