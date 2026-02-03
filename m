Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E29A03939BF;
	Tue,  3 Feb 2026 16:48:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770137311; cv=none; b=UZUULJJuWBWdV1sycMYpgXl6sGUyBVtDZ01mCxggEdBxTvFUFby0meGxJebyX5otuvky6sEgtf/UIirKYzM4KHGkDe/EdRc8R15k0Ozv7s2HkEWn6fK9uCPyk1mWJz24x4DELNOeHNXz2z6rNHerpATSH9wOhYbvwUm7mF8uOl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770137311; c=relaxed/simple;
	bh=KakHACAJOamzvlMphs5aYtcbPGFKUBAEWIwaHU3woqA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rqaCrPnpwjRLoaAyWDAnotwNr7+biVGr2iugW3kLOaP6RE+/qJ003JB3vCPMKI8g+NdLUBSFIYIEJPqeETgCrSDbIKlQ5/JnfLBUVcH9QqaxkVrO9wZXxfboKWMxKu1HbkbEPgnGLfCEN4+43oG3ZC11xNyAVjQyin3/uspYZGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NkmW12+c; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NkmW12+c"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46395C116D0;
	Tue,  3 Feb 2026 16:48:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770137310;
	bh=KakHACAJOamzvlMphs5aYtcbPGFKUBAEWIwaHU3woqA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NkmW12+cSh/g1Xt7XdI9jTa211pAIttApXEXhaGbyGoIl+VkhFcreLlZvtRlhki7g
	 MtRcZlHL+pPaFKmhbuDvdV69D0P4RKoz+aev1zq5jbTVVZevQAVjySmenJVPhcluEw
	 TnWE6WflN4GA2H8CLH5YNizfHnde0KnPBmpJOmlw0sADabKAXt8Rl5SGrZWGmqIA/K
	 O17+Pa/AQkaFs0QNCtHfMoizf1sTquM+k/QCYYFWZ6PQvQNKeaYqz3cArkhF4y0PBf
	 6PZTUeEyZPdPRd1wDLhu8X9j3tXRs8/EMyMPYTpMRJ05XsOwuhg9nnIWPbqpI7tF9s
	 msXrqhEQWKyag==
Date: Tue, 3 Feb 2026 16:48:23 +0000
From: Lee Jones <lee@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: =?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Will McVicker <willmcvicker@google.com>,
	Juan Yescas <jyescas@google.com>, kernel-team@android.com,
	linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v7 00/20] Samsung S2MPG10 regulator and S2MPG11
 PMIC drivers
Message-ID: <20260203164823.GB7629@google.com>
References: <20260122-s2mpg1x-regulators-v7-0-3b1f9831fffd@linaro.org>
 <176909970862.4046298.23888884171864307.b4-ty@kernel.org>
 <0b4c5e699ce1d8211314a2bb28d7b6566e577037.camel@linaro.org>
 <1333e1d0-c4f2-4823-834c-df8f6a196d10@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1333e1d0-c4f2-4823-834c-df8f6a196d10@sirena.org.uk>

On Fri, 23 Jan 2026, Mark Brown wrote:

> On Fri, Jan 23, 2026 at 09:39:00AM +0000, André Draszik wrote:
> 
> > Thanks for queuing these, but FYI, I think leaving out patches 1 to 3 will
> > give validation errors.
> 
> > As mentioned in cover letter, the patches must be applied in order, for
> > bindings particularly the mfd-binding patches depend on the regulator-
> > binding updates, specifically patches 4 and 5 reference files added in
> > patches 2 and 3 respectively.
> 
> So long as everything lands in the final release it'll be fine, people
> aren't bisecting DT binding validation in the way that they do runtime
> issues.

This!

-- 
Lee Jones [李琼斯]
