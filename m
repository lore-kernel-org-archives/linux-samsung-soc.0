Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B8521EA8F;
	Thu, 18 Jul 2024 20:55:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721336119; cv=none; b=iUDLpfH6TX5f27WF+oGF4uk99PZyM0HWSrGxgrlLj3mUPjmXydja1i64nfsKuejBp9ftrx2w5f1jL5RTct9kLk8i04WzCDmdWOMuGWNTLr0oYWTMACOCrpDSClvWzYLMxkgwAG7T3PMUUq1yFflUddd1K6lOnd0GWZgBZdm3DSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721336119; c=relaxed/simple;
	bh=CsJA16iM/P2sj2H9XllwFQ+rN3XitbGqsX0IJx7VZ2I=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=nDTVImFewH+VOPjGzW4tbMXKmsMiKAF2hglsEpClczi+zxoyvz6MbdYuxECfpNAs7DJvZnzfbJgkRpwdNZpEhIdctyImhoxATeWiyS7OnLoaV6FHJXqHvLpc/EtLWbOuyr6VN8JOv9k/KeeY7eD6yXRsklv5G08os6b3LGO+MNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UZmLfjLL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UZmLfjLL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D43D0C116B1;
	Thu, 18 Jul 2024 20:55:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721336119;
	bh=CsJA16iM/P2sj2H9XllwFQ+rN3XitbGqsX0IJx7VZ2I=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=UZmLfjLL8nL1eINz5srFwr2rQ0CBPg/sw/YfhO4e9aVg7/BO0uNjI6CrJf6wslm8f
	 J2dk3XGn/M7tlkRLF9+MuYIZ0D9PzcwQz2JoJe95uWc02glnvc8tfsjSxalOJu33QM
	 NmxDj2Q42+fj4ClJhp+soGNa/99p6Cehn20SdcmHl90TWWUOO+g8SjZPc6aH/VA1hC
	 WP/NXw7CnB/hTNd9nHCH+oYd9Y5umyHp6lvPekA9qSP7/1PlyJ2MqL+z9FpCkXz+XM
	 vGpRK0isK16wXk0OPEIbUtotfwkLpnXi7pGZxRtm3w60yNqrrkDH6eewf+G+X9iGbh
	 Tw5QSS9fD75XA==
Message-ID: <d17567eb0ad9a6082d55ca016771abbc.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240712-gs101-non-essential-clocks-2-v4-0-310aee0de46e@linaro.org>
References: <20240712-gs101-non-essential-clocks-2-v4-0-310aee0de46e@linaro.org>
Subject: Re: [PATCH v4 0/2] gs101 oriole: UART clock fixes
From: Stephen Boyd <sboyd@kernel.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, Will McVicker <willmcvicker@google.com>, kernel-team@android.com, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, =?utf-8?q?Andr=C3=A9?= Draszik <andre.draszik@linaro.org>
To: Alim Akhtar <alim.akhtar@samsung.com>, =?utf-8?q?Andr=C3=A9?= Draszik <andre.draszik@linaro.org>, Chanwoo Choi <cw00.choi@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Peter Griffin <peter.griffin@linaro.org>, Sam Protsenko <semen.protsenko@linaro.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Thu, 18 Jul 2024 13:55:16 -0700
User-Agent: alot/0.10

Quoting Andr=C3=A9 Draszik (2024-07-12 10:09:42)
> Hi,
>=20
> This series fixes a long-standing issue in the gs101 clocking / uart
> handling.
>=20
> We can now disable clocks that had previously been marked critical, and
> still get a working earlycon.
>=20
> There is a preparatory patch, and then a patch to drop an incorrect clock
> counting work-around. That 2nd patch is essentially the last remaining pa=
tch
> [1] with all review comments addressed, from the series [2] that was sent
> earlier this year, see lore links below.

Is there a binding update for the chosen node to have a clocks property?
