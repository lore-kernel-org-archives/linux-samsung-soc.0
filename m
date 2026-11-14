Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=109.224.244.121
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794638662;
	b=ODG8nXToOQdjlHfqgTLxrY7l5YJqY9Vffm5CmZ39RnkKo5sDRmyhXdYfonzjKSHmLB2K
	 3qC1yHkIjHDzivb+as2xrxgemBUQO+p2t82beXkWadYh03Bju9AT+z0NPlPniSsESDknQ
	 OSs4kdI0+0VkLhSRD1yK3M+53FemdrT/HebJp5U6Y+x8JiyF26Vy58Jt98dox2Yvsj91e
	 1j/KfbXcbUCr08cAlsqRAlmun1rqleT2Ddytd3JX8vGXitJ234+XohOUqJzth/fJ3xeTb
	 nSOwLUnrx/QMDwhYK7wzMI/xthdP9lnBcPAEj9P6JbFNy0Vfs63pIZLuNJWKC9qzfGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794638662;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 Feedback-ID:X-Pm-Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=9lockZfiZPq35Rqgx+UZNXxzny62IZytp1+NEi8Zxc8=;
	b=FpLtr1lFzziJJO/U0hOwlVzwPGbwraBzbzSU6bx28JnXcLLJRQk9KfeQtTM04i20B4oj
	 9XPVx81176xlJyk8cQA1vR8J/e6Wg0dOUyLk9/fmPnyxeacuFnc9SdgLzY+giKmUDXWiI
	 GnbBYTwSquGR6zycZKFzU9iciwSlaPdBneKckVlb3j9r3ScoLSSAoLCsumttMErDytHnF
	 bOCwtpo+m38UcsF28mIqVObafOjRlupVr+9x/aSBDwcJsSvg7wY/FVf1flRro+2Xk68C7
	 gXP4XJzq4SrmpfZ5y27YiNJJadoGFU3pFXLH+JOZZYb13ZU0VWnvyDQtcQVt4UvFJzg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=proton.me;
	spf=pass smtp.mailfrom=proton.me;
	dkim=pass header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=w4s3brv45bb4vpv2oglioynaxe.protonmail2 header.b=LOMHU3ID;
	arc=none smtp.remote-ip=109.224.244.121
Received: from mail-244121.protonmail.ch (mail-244121.protonmail.ch [109.224.244.121])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54B91606A32D;
	Sat, 14 Nov 2026 06:44:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 54B91606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=w4s3brv45bb4vpv2oglioynaxe.protonmail2 header.b=LOMHU3ID
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=w4s3brv45bb4vpv2oglioynaxe.protonmail2; t=1794638659;
	x=1794897859; bh=9lockZfiZPq35Rqgx+UZNXxzny62IZytp1+NEi8Zxc8=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=LOMHU3ID8CgrIuaL3663yRwaNLjXWrQYpeoryiXWfQh2ZVAsL1nWT7pSoIa9CTWBM
	 fKqPlKPztZFTCJENrmViYsAYp9J/8iI26r5LWDP6akb8OlukY+wHIpuMwA6q8d8yUc
	 D/ueb540JUpgEjAZEiH85/IueldzC+h95SyfOECG9XuDaKM230L3e5aK6NiHOSryjM
	 /UGTwaLpjUz6WuDhsP2sDxWsbnLRpE2m/WQyHCgo64n+yAN+tkZkXkvbeZWOjlDmzw
	 wpTyD4gc5BBItlWLyXjRDXCEyPrBlyaB84K3xcSChQ1OxecdXGSuLDSwzWxn9ypzac
	 UdBUzESzDdtLg==
Date: Sat, 14 Nov 2026 06:44:15 +0000
To: Vinod Koul <vkoul@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>
From: Soheyb Boulaa <soheyb_boulaa@proton.me>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>, linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Soheyb Boulaa <soheyb_boulaa@proton.me>
Subject: [PATCH v3 0/3] phy: exynos5-usbdrd: fix HS phy init count on Exynos2200
Message-ID: <20261114064400.45572-1-soheyb_boulaa@proton.me>
Feedback-ID: 140697376:user:proton
X-Pm-Message-ID: 1c2bb9a36e534ba52fb78d90e0df16364b079c84
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Post: <mailto:linux-samsung-soc@vger.kernel.org>
List-Help: <mailto:linux-samsung-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-samsung-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

The UTMI phy of Exynos2200 initializes the high-speed (eUSB2) phy but
never exits it, so the high-speed phy is not set up again after it lost
power in system sleep (patch 3, v1 [1]).

Sashiko's review of v1 [2] found two error paths that v1 leaves wrong: a
failed init of the high-speed phy is ignored, so the exit that follows
takes its init count below zero; and the high-speed phy exits before
the steps of the UTMI exit that can fail, so a failed exit leaves the
UTMI phy initialized and the high-speed phy not. Patch 2 returns the
init error, and patch 3 exits the high-speed phy last. Patch 1 undoes
the UTMI init when it fails, which its clocks path already lacks and
which patch 2 makes reachable from the high-speed phy.

Changes in v3:
- full name in From and Signed-off-by, as Vinod asked [3]; no code
  change
- Link to v2: https://lore.kernel.org/all/20261111032309.3365794-1-soheyb_b=
oulaa@proton.me/

Changes in v2:
- patch 1, new: undo the init on failure
- patch 2, new: return the init error of the high-speed phy
- patch 3: exit the high-speed phy last, once the rest of the exit has
  succeeded; drop the comment (Ivaylo); his Acked-by of v1 is left
  out, since the exit has moved

Tested on a Google Pixel 9 (Tensor G4), an out-of-tree port on 7.3-rc7
that uses the Exynos2200 phy ops and powers USB off in system sleep:
USB comes back after each sleep, and with each error path forced by a
test-only switch, both init counts stay balanced. Not tested on
Exynos2200 hardware, nor built in linux-phy next as a whole.

[1] https://lore.kernel.org/all/20261109221522.2796426-1-soheyb_boulaa@prot=
on.me/
[2] https://lore.kernel.org/linux-phy/sashiko-outbox-205724@kernel.org/
[3] https://lore.kernel.org/linux-phy/avcPwEEAfCstmORh@parshuram/

Soheyb Boulaa (3):
  phy: exynos5-usbdrd: power the Exynos2200 phy down when its init fails
  phy: exynos5-usbdrd: return the Exynos2200 high-speed phy init error
  phy: exynos5-usbdrd: fix HS phy init count imbalance on Exynos2200

 drivers/phy/samsung/phy-exynos5-usbdrd.c | 28 +++++++++++++++++++-----
 1 file changed, 22 insertions(+), 6 deletions(-)

base-commit: 6bdfbe223ed4735073c299a6645ebd3faac3f51f

--=20
2.56.0

