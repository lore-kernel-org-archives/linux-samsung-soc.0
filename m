Received: from sendmail.purelymail.com (sendmail.purelymail.com [34.202.193.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F6B9224FD
	for <linux-samsung-soc@vger.kernel.org>; Sun,  5 Jan 2025 12:18:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=34.202.193.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736079530; cv=none; b=Df3Oom0LtrDq0nomFoGpJ3DuZDY7r+ZoP9xoNOwApS6jFPvBSM/OtgvkAFt5dF6Y9YdrloEfBJFJsm7AU9VoaYitEml9vl39sKolVqjXa+IJ8fTJButbzbJewgPw5HSrE1rtlL0gwnhT/BshN+GK1haebgffxV/34UKgZIPjcEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736079530; c=relaxed/simple;
	bh=75ZZPQPJDwbcguFEzst3gHnA+GRgtEJMBotKkjqpuj4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IKjAGySzc7UNXP0KgvdVDC/ei6nJPlDHEfWyYjfDCrmlZnbBXZo1DJAls4qChGo6GdcIYg4dZcHpLB7x50CPZ++YtFOg8DLOT5SZZV+cvzZtwtFobf3r/mTdsOz4FG1WCSVfVlFnHtPgDPZDiKLQPd/fGuSxatbi5esJuweYrKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org; spf=pass smtp.mailfrom=mentallysanemainliners.org; dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b=egP4n2ym; arc=none smtp.client-ip=34.202.193.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mentallysanemainliners.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b="egP4n2ym"
DKIM-Signature: a=rsa-sha256; b=egP4n2ym2pyY0NZ6nIdTZabBoHDfJXlnIdxrsC6oxZAJpmWWgvDeHLaM+N3cBN1HAWWumtJ9yRYUCv4kr8EpYVXX/+wppYAbbPnPemDqBeHfqi0eYjETMd+dbRbCLg/TeloC7SJHQtYBSiJ1ddW35CxYjyKzHClO95nu7u5UXL6nXK9jyvYt2GNbKxTTmWQ7CrGlUx3zEY+tGp79N1K6fBq86K/6WyRpDRUmIHGOBwH2X7IKjrkbmibBO55d+1SOttauVHgHQ4VuGCYbAPKSBYFAd+kut4XB825rAaQjJh2F+jKYlIz1nUL9p8o0jy0/OsE5FK8SBo1br52xsjoGXA==; s=purelymail3; d=purelymail.com; v=1; bh=75ZZPQPJDwbcguFEzst3gHnA+GRgtEJMBotKkjqpuj4=; h=Feedback-ID:Received:Date:From:To:Subject;
Feedback-ID: 68247:10037:null:purelymail
X-Pm-Original-To: linux-samsung-soc@vger.kernel.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 2020578906;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Sun, 05 Jan 2025 12:18:27 +0000 (UTC)
Date: Sun, 5 Jan 2025 13:18:24 +0100
From: Igor Belwon <igor.belwon@mentallysanemainliners.org>
To: Markuss Broks <markuss.broks@gmail.com>
Cc: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: Re: [PATCH] arm64: dts: exynos990: Rename and sort PMU nodes
Message-ID: <Z3p4kPoya12wR5Wh@debian>
References: <20250105-pmu-sorting-v1-1-b55519eaff2e@mentallysanemainliners.org>
 <bb1e89a5-a83e-4e68-9568-073f9c4a8af9@gmail.com>
 <Z3p1IV0rVH9dPQ_C@debian>
 <6b66b484-badb-4a99-b19f-5cab019cc5ea@gmail.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6b66b484-badb-4a99-b19f-5cab019cc5ea@gmail.com>

On Sun, Jan 05, 2025 at 02:10:37PM +0200, Markuss Broks wrote:
Hi Markuss,
> Hi Igor,
> 
> On 1/5/25 2:03 PM, Igor Belwon wrote:
> > On Sun, Jan 05, 2025 at 01:39:04PM +0200, Ivaylo Ivanov wrote:
> > > On 1/5/25 13:16, Igor Belwon wrote:
> > > > These nodes were sorted by name, but it's nice to have the same class of
> > > > devices together. As such, drop the pmu suffix and add "pmu" as a prefix.
> > > > This keeps consistency between other Exynos SoCs too.
> > > Well, most SoC device trees still have it as a suffix. Perhaps it'd be better to
> > > apply this change for all exynos device trees instead of waiting for other
> > > people to apply it separately?
> > > 
> > > Best regards,
> > > Ivaylo
> > Hi Ivaylo,
> > 
> > The newly-merged 9810 SoC had it hand-fixed by Krzysztof while being
> > merged [1], and there is a current patch to fix it on 8895 [2].
> > That's all the SoCs with Mongoose cores (and the Mongoose PMU breaks
> > sorting). Only 990 is missing this change.
> I believe for Cortex PMUs it's also preferred to use the e.g. pmu-a53 name
> instead of arm-a53-pmu. This name is at least also used on exynosautov9,
> exynosautov920, exynos7885, exynos5433 and exynos7 (list not conclusive). So
> maybe could fix it on all SoCs at once, instead of making individual patches
> for every one. This is just a suggestion though, your patch seems ok.
Thank you for the suggestion! I held off on doing this because in the
8895 patch, Krzysztof said that the pure-ARM design PMU naming was too
trivial and unimportant to change. Mongoose PMU however breaks sorting
in the tree, so unlike the arm-pmus, it's more important.

It's up to Krzysztof if he wishes a global change for all affected
Exynos trees.

> > 
> > [1] https://lore.kernel.org/linux-samsung-soc/d1c6d2f2-f733-4cbe-8108-c9c9aaa417cc@kernel.org/
> > [2] https://lore.kernel.org/linux-samsung-soc/20241222145257.31451-1-krzysztof.kozlowski@linaro.org/
> > 
> > Thanks and best regards,
> > Igor
> > 
> 
> - Markuss
> 
Best regards,
Igor
