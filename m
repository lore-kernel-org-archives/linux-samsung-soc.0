Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99FC1348463
	for <linux-samsung-soc@vger.kernel.org>; Tue, 28 Apr 2026 08:08:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777363687; cv=none; b=RGL58+QNWMEaLCStvE5k80oWOAxJgCXI5pE5cmIfoItRbG9etjCNfcgSEh5QVgOy968zWC4vsYEOHFfRoY+/BcOC5XfWlhdSkCSmJSahfiXEiRy/t8auc++ecsNcJlnCuqxsij/vf6vKRLSoirsv9XeIaghYyimP0czGKcDwqHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777363687; c=relaxed/simple;
	bh=jR/QPrnACdsdO0/KY/ZNEVbUuXYYjJD9CqgzSXSt5fA=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ChDW8OLKFh+7R7TLAQktQFWUpdJRTnMeil+5pcoTFmvNAFn39Wyf25hM2jbr8cYSOIAjKJOh0clvJdoWQgBJ4SRxdRZBmoyhCM6D6Pn+oUZg7gobJR6KblFEaBZtypTzsU2yoZCYYCpleTGbWZDbf5d73ZsMLw+u+IkpS56GG/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AU0kWrW+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AU0kWrW+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2093DC2BCAF
	for <linux-samsung-soc@vger.kernel.org>; Tue, 28 Apr 2026 08:08:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777363687;
	bh=jR/QPrnACdsdO0/KY/ZNEVbUuXYYjJD9CqgzSXSt5fA=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=AU0kWrW+liEaSsXff5W2v0MsU1Q3s+Hiy/43Ofc30rIEHTQ9fIdl9EeBuYEPJDGdX
	 RoFruUCAVqbuHsEoPMBpPsUidf+TjKlVzjcXlBf6cwCo5dfFrcG/fV2+eTEpMDAC42
	 ZNynsd26hhnGeo+sHc21lfrf57sAjf6rfouDoprMvXDscnKrbsyEXaVTbJa0hT564n
	 uf3RCi6Cga9LcFaZ/FHRyvWjtOmnL5KvW/XJhAh9KEJhWl5nPddflQlLK/NHHZA4Bu
	 KSfqDJ3qVnZ2Ad7KjNgcGU4wFNbhzncv/CdnZvREms9Hf8DSLkTUOkdFlxZgTOa7tY
	 j1UWZ8aA+9Hyw==
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-38eab6cf7d8so105745341fa.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 28 Apr 2026 01:08:07 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/ZJ7kLYdl0i6kJ7r5GEm3EqsAB9KoZd7G3Ck+ReLNPwkJk71pTfKiUCKgR0h/yRXEGjZbVMv+bpvNiVouLDIFpmA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzo+ztuyfd/0fi8coj4qyA8c4fueez6mk/7JQoZgG/vUxXdvn+1
	xD0YswDkxLi07lQxshrDk3lD48vPoyqcv+qiD2kqfCy4Cz7fxRoQXnD+70g1uxt0oLAPjNaAmE7
	CZJ80qL3HnVFI4ieDrbFG45fyDhCqJ1zJvZHlE62/1Q==
X-Received: by 2002:a2e:be08:0:b0:38c:6b42:3d77 with SMTP id
 38308e7fff4ca-39240cc20ccmr6706361fa.2.1777363685836; Tue, 28 Apr 2026
 01:08:05 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 28 Apr 2026 01:08:04 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 28 Apr 2026 01:08:04 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260427143546.3098519-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260427143546.3098519-1-arnd@kernel.org>
Date: Tue, 28 Apr 2026 01:08:04 -0700
X-Gmail-Original-Message-ID: <CAMRc=McpfT-Ph3S4yDfhb3ydc-vP9fBVn9Nq0P7+BmFNr_69qQ@mail.gmail.com>
X-Gm-Features: AVHnY4Jzxwbh3hg_OkvmtqMYURBrWE3b_ixHf74HXsaHbAsWE-SCzGz3iCDPxv4
Message-ID: <CAMRc=McpfT-Ph3S4yDfhb3ydc-vP9fBVn9Nq0P7+BmFNr_69qQ@mail.gmail.com>
Subject: Re: [PATCH] ARM: s3c: use gpio lookup table for LEDs
To: Arnd Bergmann <arnd@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Linus Walleij <linusw@kernel.org>, Charles Keepax <ckeepax@opensource.cirrus.com>, 
	Bartosz Golaszewski <brgl@kernel.org>, patches@opensource.cirrus.com, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, 27 Apr 2026 16:35:27 +0200, Arnd Bergmann <arnd@kernel.org> said:
> From: Arnd Bergmann <arnd@arndb.de>
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---

I think you need a commit message here?

Bart
