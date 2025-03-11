Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A69352620DB;
	Tue, 11 Mar 2025 18:13:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741716813; cv=none; b=qdhg9kj1HvFGFmD+Qlk/4oRMvTAPF0Zf4Mqq+57c9sKSpndBbbEzZPvQtBFFOmLwfL9/f38sLTpUsBDim0W+fv6PyGOZ01K1RoPfOd/Q27/f4x85Uluolsbj/GodsKYlVxK4eUAl2iS9Y1cIQ/M6oIYXtkLBYTQ+YXH4a3ASdhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741716813; c=relaxed/simple;
	bh=rdG4W23KcTWMvPIDmswMTtwiZrFfXZ2nz7V1UtXCIG8=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=BfyKaCM3a99OAYC6YnP7wP8QFWdhqJ60XTgh7mitwc7KJm1RCBxJtcFNI7lCntDX/sp7KAZKqqIQZaqrLMnqjjI29taFmCKa8gQYsNYZqE3RuTjU6wYJYDtoimf13ZfEXl7NNcLOXPteR3wT6ANvL60RFPLoX6N0OGJKH9oc4Hg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e7ii9Ki5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e7ii9Ki5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC861C4CEE9;
	Tue, 11 Mar 2025 18:13:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741716813;
	bh=rdG4W23KcTWMvPIDmswMTtwiZrFfXZ2nz7V1UtXCIG8=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=e7ii9Ki5c/a5sFPriRR26qTfgqFvMrxCxw6ZTDScyd8KG1fbu2YTy+s3gAzZjvKHC
	 qtUgdLOjEHxAnT/G7zpya8pJT/QjByTCQqHae7uh57ZnBnU7JCnxaXP9Pt/cvf82ql
	 lrl9eR86Jlma6H5Z3VKq/ejXlXR/rSTI9Ab70M41Uc1bZgkbzG6wnk16/A1O3IFTK4
	 SNJvXXyDvTTANusWeBcEWrL06ymhW+kZl7WkDqqkVw3CxGUatSvXCzg1PY6GjjYlOr
	 SVMW2dIjlhrogSbONz3im7cs0/u8I4b2Fo73ExMR8ZUUdQuPa72H8HVVoZKvp91cfx
	 Ezqo24W9nKw0A==
Message-ID: <135678b71cd2853fe55c5c5c6a6d3fcb.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250309175147.6672-1-krzysztof.kozlowski@linaro.org>
References: <20250309175147.6672-1-krzysztof.kozlowski@linaro.org>
Subject: Re: [GIT PULL] clk: samsung: drivers for v6.15
From: Stephen Boyd <sboyd@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Chanwoo Choi <cw00.choi@samsung.com>, linux-clk@vger.kernel.org, Sylwester Nawrocki <snawrocki@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, Peter Griffin <peter.griffin@linaro.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Michael Turquette <mturquette@baylibre.com>
Date: Tue, 11 Mar 2025 11:13:30 -0700
User-Agent: alot/0.12.dev8+g17a99a841c4b

Quoting Krzysztof Kozlowski (2025-03-09 10:51:47)
> Hi,
>=20
> New clk drivers for Samsung SoC.  This pull includes drivers which you
> commented later and pointed out few issues.  Pointed issues are in all Sa=
msung
> clk drivers and the ones here just copy existing patterns:
>=20
> 1. Headers: I fixed it for new and existing drivers and this pull request
> includes the fixes.
> 2. device_get_match_data(): I still wait for contributors response. If th=
ey do
> not respond, I will fix it for next cycle.
> 3. refdata and platform_driver_probe: I tried fixing it, but incomplete a=
nd
> need to investigate more.
>=20
> Best regards,
> Krzysztof
>=20
>=20
> The following changes since commit 2014c95afecee3e76ca4a56956a936e23283f0=
5b:
>=20
>   Linux 6.14-rc1 (2025-02-02 15:39:26 -0800)
>=20
> are available in the Git repository at:
>=20
>   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/sam=
sung-clk-6.15
>=20
> for you to fetch changes up to 017bbc922a09630579ff7b5b314fb186b8c0efcf:
>=20
>   clk: samsung: Drop unused clk.h and of.h headers (2025-03-07 16:01:22 +=
0100)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next
