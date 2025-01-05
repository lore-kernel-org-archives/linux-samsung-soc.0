Received: from sendmail.purelymail.com (sendmail.purelymail.com [34.202.193.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEC45849C
	for <linux-samsung-soc@vger.kernel.org>; Sun,  5 Jan 2025 12:04:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=34.202.193.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736078651; cv=none; b=B2xvnuy1UPsBkzPN8XXxRmre0DlRvV3+Jt9DOcDR0Be/79U+URStspn1XnMX+e+3nv7vnjAzSFGikHO03ENJRBA9Zzv10vTaEIheYECabI1luLvPx6ruCbDpwxykbM87T25xFf/iW/QxYh9AY+VJqh+vZJ6p9Uof7gZtrzJYiaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736078651; c=relaxed/simple;
	bh=BHPKCoOPHRsA6ZQ7YM8GXKSTQ1YP29MzcAkMMGtupDc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lC8KqeTdk9wIHCeopiFMsr3kcz4SLPtu25KU1hUcwIGlEK5mS9CpJagTCehFVmJVBMArM9PnjDoIZlzfYsFE6nZGJCvAU9SSZGbMyS/8quQ1qI2jQQR2SAyvlcjIffyZJ3HY1/w3vtPU9jVK0VNl/fyWlfUdRdoKhTb02AVbY5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org; spf=pass smtp.mailfrom=mentallysanemainliners.org; dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b=1h2crP9Z; arc=none smtp.client-ip=34.202.193.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mentallysanemainliners.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b="1h2crP9Z"
DKIM-Signature: a=rsa-sha256; b=1h2crP9ZlNVaLJDOO+5Ofz/5fzVC4WaV/eoWtMkCMt2vz9uCYR2IBatU6ny4wozW8r+XHcza7bE7WXWkQWZs7IXLWia2puqYZoS5M6dxih15xpyRP2M3NUFn2myXICesdlVePRNN5tzjBAuXifx+YE6ayD1muio9q/aLTEe5aND8odSxlgJigxlj1kEPkZpPTZi5LXdeaPg+kSE0/b/jJWdRG792haugntrp93CrlyQuraBQOk1GHUSilys0Aeay5XQ0ENe2gYFWkI43ml3k6y7e9A7QLkTADLNQ7oN/2CPIVBM56TJmvC0vTbThn3kgekSTfn6YEswy9H+z+MOYYg==; s=purelymail3; d=purelymail.com; v=1; bh=BHPKCoOPHRsA6ZQ7YM8GXKSTQ1YP29MzcAkMMGtupDc=; h=Feedback-ID:Received:Date:From:To:Subject;
Feedback-ID: 68247:10037:null:purelymail
X-Pm-Original-To: linux-samsung-soc@vger.kernel.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1894976164;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Sun, 05 Jan 2025 12:03:48 +0000 (UTC)
Date: Sun, 5 Jan 2025 13:03:45 +0100
From: Igor Belwon <igor.belwon@mentallysanemainliners.org>
To: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: exynos990: Rename and sort PMU nodes
Message-ID: <Z3p1IV0rVH9dPQ_C@debian>
References: <20250105-pmu-sorting-v1-1-b55519eaff2e@mentallysanemainliners.org>
 <bb1e89a5-a83e-4e68-9568-073f9c4a8af9@gmail.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bb1e89a5-a83e-4e68-9568-073f9c4a8af9@gmail.com>

On Sun, Jan 05, 2025 at 01:39:04PM +0200, Ivaylo Ivanov wrote:
> On 1/5/25 13:16, Igor Belwon wrote:
> > These nodes were sorted by name, but it's nice to have the same class of
> > devices together. As such, drop the pmu suffix and add "pmu" as a prefix.
> > This keeps consistency between other Exynos SoCs too.
>
> Well, most SoC device trees still have it as a suffix. Perhaps it'd be better to
> apply this change for all exynos device trees instead of waiting for other
> people to apply it separately?
>
> Best regards,
> Ivaylo

Hi Ivaylo,

The newly-merged 9810 SoC had it hand-fixed by Krzysztof while being
merged [1], and there is a current patch to fix it on 8895 [2].
That's all the SoCs with Mongoose cores (and the Mongoose PMU breaks
sorting). Only 990 is missing this change.

[1] https://lore.kernel.org/linux-samsung-soc/d1c6d2f2-f733-4cbe-8108-c9c9aaa417cc@kernel.org/
[2] https://lore.kernel.org/linux-samsung-soc/20241222145257.31451-1-krzysztof.kozlowski@linaro.org/

Thanks and best regards,
Igor
